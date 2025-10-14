import 'package:dp_maker/view/template_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config_io.dart';
import '../widgets/widget_io.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await ExitConfirmationDialog.show(context);
        return shouldExit;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.background,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                gapBox(10),
                const HeroBanner(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      heading14('DP Templates'),
                      IconButton(
                        icon: Icon(
                          isGrid
                              ? Icons.view_stream_rounded
                              : Icons.grid_view_rounded,
                          size: 24,
                          color: MyColors.primary,
                        ),
                        onPressed: () {
                          setState(() {
                            isGrid = !isGrid;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                /// 🔹 Templates Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                      isGrid
                          ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: MyImages.templates.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                ),
                            itemBuilder: (context, index) {
                              final img = MyImages.templates[index];
                              return TemplateCard(
                                image: img,
                                isGrid: true,
                                onTap:
                                    () => Get.to(
                                      () => TemplateScreen(image: img),
                                    ),
                              );
                            },
                          )
                          : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: MyImages.templates.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 390,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                ),
                            itemBuilder: (context, index) {
                              final img = MyImages.templates[index];
                              return TemplateCard(
                                image: img,
                                isGrid: false,
                                onTap:
                                    () => Get.to(
                                      () => TemplateScreen(image: img),
                                    ),
                              );
                            },
                          ),
                ),
                gapBox(20),
                SelectableText("Developed by AmmarDev99 | +92342 4264494"),
                gapBox(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
