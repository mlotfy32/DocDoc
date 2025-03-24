import 'package:docdoc/Features/search/presentation/view/widgets/searchViewBody.dart';
import 'package:docdoc/Features/search/presentation/viewModel/searchdoctor/searchdoctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchview extends StatelessWidget {
  const Searchview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchdoctorCubit>(
      create: (context) => SearchdoctorCubit(),
      child: Searchviewbody(),
    );
  }
}
