import 'package:docdoc/Features/home/presentation/view/widgets/homeViewBody.dart';
import 'package:docdoc/Features/home/presentation/viewModel/change_tab/change_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChangeTabCubit>(
      create: (context) => ChangeTabCubit(),
      child: const Homeviewbody(),
    );
  }
}
