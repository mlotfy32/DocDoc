import 'package:docdoc/Core/Utiles/widgets/3.3%20custom_text_field.dart';
import 'package:docdoc/Features/search/data/local/hiveSearch.dart';
import 'package:docdoc/Features/search/presentation/viewModel/searchdoctor/searchdoctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Doctorsearchform extends StatefulWidget {
  const Doctorsearchform({super.key});

  @override
  State<Doctorsearchform> createState() => _DoctorsearchformState();
}

class _DoctorsearchformState extends State<Doctorsearchform> {
  TextEditingController search = TextEditingController();
  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Form(
          key: formKey,
          child: CustomTextField(
            validator: (p0) {
              if (p0!.isEmpty) {
                return 'enter doctor name';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<SearchdoctorCubit>(context)
                    .searchDoctor(search: SearchModel(search: search.text));
              }
            },
            controller: search,
            hintText: 'Search',
            fillColour: const Color(0xffF2F4F7),
            filled: true,
            prefixIcon: const Icon(
              Icons.search,
              color: Color(0xff9E9E9E),
              size: 34,
            ),
          ),
        ));
  }
}
