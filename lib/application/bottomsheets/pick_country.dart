import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_textstyles.dart';
import '../user/home/bloc/home_bloc.dart';

List _countries = [
  'Nigeria',
  'Kenya',
  'Uganda',
  'Malawi',
  'Ghana',
  'Global users',
];

Future<void> pickCountry(BuildContext context) async {
  await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 12.h),
                Text(
                  'Update Country',
                  style: bodyMedium.copyWith(fontWeight: FontWeight.bold),
                ),

                // Listen to HomeBloc to know which country is selected
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(ctx).size.height * 0.6,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        itemCount: _countries.length,
                        itemBuilder: (_, i) {
                          final country = _countries[i];
                          final isSelected = country == state.selectedCountry;
                          return ListTile(
                            title: Text(country, style: bodyMedium),
                            trailing:
                                isSelected
                                    ? Icon(
                                      Icons.check,
                                      color: AppColors.primary,
                                    )
                                    : null,
                            onTap: () {
                              context.read<HomeBloc>().add(
                                SelectCountryEvent(country),
                              );
                              Navigator.pop(ctx);
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
