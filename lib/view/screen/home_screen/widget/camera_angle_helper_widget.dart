import 'package:flutter/material.dart';
import 'package:flutter_base/core/app/extension/extension.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/pokemon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraAngleHelperWidget extends StatelessWidget {
  const CameraAngleHelperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        return Positioned(
            left: state.flagHelper.dx - 10,
            top: state.flagHelper.dy - 10,
            child: AnimatedSwitcher(
              reverseDuration: const Duration(milliseconds: 300),
              duration: const Duration(milliseconds: 300),
              child: (state.flagHelper.isZero)
                  ? const SizedBox()
                  : Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
            ));
      },
    );
  }
}
