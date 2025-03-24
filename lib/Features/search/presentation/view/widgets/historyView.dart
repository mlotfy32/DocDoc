import 'package:docdoc/Core/Utiles/constans.dart';
import 'package:docdoc/Core/Utiles/style/font_Styles/app_fonts.dart';
import 'package:docdoc/Features/search/data/local/hiveSearch.dart';
import 'package:docdoc/Features/search/presentation/viewModel/gethistory/gethistory_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class historyView extends StatefulWidget {
  const historyView({super.key});

  @override
  State<historyView> createState() => _historyViewState();
}

class _historyViewState extends State<historyView> {
  @override
  void initState() {
    BlocProvider.of<GethistoryCubit>(context).getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<SearchModel> history;

    return BlocBuilder<GethistoryCubit, GethistoryState>(
        builder: (context, state) {
      if (state is GethistorySuccess) {
        history = state.history;
        return Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Recent Search', style: AppFonts.f20w700),
            TextButton(
                onPressed: () async {
                  var box = await Hive.box<SearchModel>(Constans.hiveSearch);
                  box.clear();
                  BlocProvider.of<GethistoryCubit>(context).getHistory();
                },
                child: Text('Clear All History', style: AppFonts.f19w500))
          ]),
          SizedBox(
            height: Get.size.height - 440.h,
            child: ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) => Row(
                children: [
                  const Icon(Icons.access_time_rounded,
                      color: Color(0xff9E9E9E)),
                  SizedBox(width: 10.w),
                  Text(history[index].search,
                      style: AppFonts.f19w500
                          .copyWith(color: const Color(0xff9E9E9E))),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        history[index].delete();
                        BlocProvider.of<GethistoryCubit>(context).getHistory();
                      },
                      icon: const Icon(Icons.close,
                          color: const Color(0xff9E9E9E)))
                ],
              ),
            ),
          ),
        ]);
      }
      return const SizedBox.shrink();
      // else if (state is GethistorySuccess) {
      // } else if (state is GethistorySuccess) {
      // }
      //  else if (state is GethistorySuccess) {}
    });
  }
}
