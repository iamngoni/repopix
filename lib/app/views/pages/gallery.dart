//
//  repopix
//  gallery
//
//  Created by Ngonidzashe Mangudya on 04/05/2024.
//  Copyright (c) 2024 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../shared/configs/colors.dart';
import '../../state/navigation/navigation_bloc.dart';
import '../widgets/about_widget.dart';
import '../widgets/gallery_widget.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return BlocConsumer<NavigationBloc, int>(
          listener: (context, state) {
            pageController.animateToPage(
              state,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          builder: (context, state) {
            return Scaffold(
              body: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  GalleryWidget(),
                  AboutWidget(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: AppColors.blue,
                selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: sy(7),
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: sy(7),
                ),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.photo),
                    label: 'Gallery',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'About',
                  ),
                ],
                selectedItemColor: AppColors.white,
                unselectedItemColor: AppColors.white.withOpacity(0.5),
                currentIndex: state,
                onTap: (int index) {
                  context.read<NavigationBloc>().add(NavigationAction(index));
                },
              ),
            );
          },
        );
      },
    );
  }
}
