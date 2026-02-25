import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_burger/core/utils/enums.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_cubit.dart';
import 'package:mr_burger/features/home/presentation/controller/cubit/home_state.dart';
import 'package:mr_burger/features/home/presentation/widget/view_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.products != current.products,
      builder: (context, state) {
        return Skeletonizer(
          enabled:
              state.status == HomeStatus.loading ||
              state.status == HomeStatus.filterLoading,
          child: ViewItem(
            products: state.products,
            productLength: state.products.length,
          ),
        );
      },
    );
  }
}
