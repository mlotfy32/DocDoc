import 'package:docdoc/Features/profile/presentation/view/widgets/profileViewBody.dart';
import 'package:docdoc/Features/profile/presentation/viewModel/getuserdata/getuserdata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetuserdataCubit>(
      create: (context) => GetuserdataCubit(),
      child: const Profileviewbody(),
    );
  }
}
