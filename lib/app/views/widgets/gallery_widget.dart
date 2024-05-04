//
//  repopix
//  gallery_widget
//
//  Created by Ngonidzashe Mangudya on 04/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../../shared/extensions/context.dart';
import '../../../shared/widgets/loader.dart';
import '../../state/gallery/gallery_bloc.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return SafeArea(
          child: Container(
            height: context.height,
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(10),
            ),
            child: BlocConsumer<GalleryBloc, GalleryState>(
              listener: (context, state) {
                if (state is GalleryError) {
                  context.notify(
                    state.error.message,
                    isError: true,
                  );
                }
              },
              builder: (context, state) {
                if (state is GalleryStarting) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const LoaderWidget(),
                      SizedBox(
                        height: sy(2),
                      ),
                      Text(
                        'Starting up...',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(10),
                        ),
                      ),
                    ],
                  );
                }
                return Column();
              },
            ),
          ),
        );
      },
    );
  }
}
