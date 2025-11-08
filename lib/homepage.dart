import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/core/apptext.dart';
import 'package:portfolio/presentation/widgets/aboutme.dart';
import 'package:portfolio/presentation/widgets/expertise.dart';
import 'package:portfolio/presentation/widgets/profilecard.dart';
import 'package:portfolio/presentation/widgets/resume.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Widget? currentSelectedWidget;
  late String? selectedTab;
  @override
  void initState() {
    currentSelectedWidget = Aboutme();
    selectedTab = "About";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> fabVisible = ValueNotifier(true);

    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.reverse) {
              // User scrolled down → hide FAB
              if (fabVisible.value) fabVisible.value = false;
            } else if (notification.direction == ScrollDirection.forward) {
              // User scrolled up → show FAB
              if (!fabVisible.value) fabVisible.value = true;
            }
            return true;
          },
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.loose(Size(1300, double.infinity)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ResponsiveBreakpoints.of(context).isDesktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileCard(),
                          Expanded(child: _mainSection()),
                        ],
                      )
                    : Column(children: [Expanded(child: _mainSection())]),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ResponsiveBreakpoints.of(context).isDesktop
            ? null
            : ValueListenableBuilder<bool>(
                valueListenable: fabVisible,
                builder: (context, visible, _) {
                  return AnimatedSlide(
                    duration: const Duration(milliseconds: 250),
                    offset: visible ? Offset.zero : const Offset(0, 2),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: visible ? 1 : 0,
                      child: _navbar(true),
                    ),
                  );
                },
              ),
      ),
    );
  }

  Widget _mainSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      // child: Center(child: LargeText("aksdjfhakdjsfhadksjfh"),),
      child: Column(
        children: [
          if (!ResponsiveBreakpoints.of(context).isDesktop)
            SizedBox(height: 20 + MediaQuery.viewPaddingOf(context).top),
          if (!ResponsiveBreakpoints.of(context).isDesktop)
            ProfileCard(isBottomBar: true),
          SizedBox(height: 16),
          SelectableRegion(
            selectionControls: MaterialTextSelectionControls(),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Color(0xff1e1e1f),
                borderRadius: BorderRadius.circular(20),
                border: BoxBorder.all(color: Color(0xff383838)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            XLText(selectedTab!, color: Colors.white),
                            // SizedBox(height: 12,),
                            SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children:
                                  [
                                        ...[1, 2, 3, 4].map(
                                          (e) => Container(
                                            height: 6,
                                            width: (40 / e).toDouble(),
                                            decoration: BoxDecoration(
                                              color: Colors.amber,
                                            ),
                                          ),
                                        ),
                                      ].reversed
                                      .expand(
                                        (element) => [
                                          element,
                                          SizedBox(width: 8),
                                        ],
                                      )
                                      .toList(),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                      if (ResponsiveBreakpoints.of(context).isDesktop)
                        _navbar(false),
                    ],
                  ),

                  currentSelectedWidget!,
                ],
              ),
            ),
          ),
          SizedBox(height: 32 + MediaQuery.viewPaddingOf(context).bottom),
        ],
      ),
    );
  }

  Widget _navbar([bool isBottomBar = false]) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xff282829),
        borderRadius: isBottomBar
            ? BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              )
            : BorderRadius.only(bottomLeft: Radius.circular(20)),
        border: BoxBorder.fromSTEB(
          bottom: BorderSide(color: Color(0xff383838)),
          start: BorderSide(color: Color(0xff383838)),
          end: BorderSide(color: Color(0xff383838), width: 0.5),
          top: BorderSide(color: Color(0xff383838), width: 0.5),
        ),
      ),
      child: Wrap(
        // mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          TextButton(
            style: selectedTab == "About"
                ? ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  )
                : null,
            onPressed: () {
              setState(() {
                currentSelectedWidget = Aboutme();
                selectedTab = "About";
              });
            },
            child: MediumText(
              "About",
              color: selectedTab == "About" ? Colors.black : Colors.white,
            ),
          ),
          TextButton(
            style: selectedTab == "Expertise"
                ? ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  )
                : null,
            onPressed: () {
              setState(() {
                currentSelectedWidget = ExpertiseScreen();
                selectedTab = "Expertise";
              });
            },
            child: MediumText(
              "Expertise",
              color: selectedTab == "Expertise" ? Colors.black : Colors.white,
            ),
          ),
          TextButton(
            style: selectedTab == "Projects"
                ? ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  )
                : null,
            onPressed: () {
              setState(() {
                currentSelectedWidget = Center(child: LargeText("Data center"));
                selectedTab = "Projects";
              });
            },
            child: MediumText(
              "Projects",
              color: selectedTab == "Projects" ? Colors.black : Colors.white,
            ),
          ),
          TextButton(
            style: selectedTab == "Resume"
                ? ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  )
                : null,
            onPressed: () {
              setState(() {
                currentSelectedWidget = ResumeScreen();
                selectedTab = "Resume";
              });
            },
            child: MediumText(
              "Resume",
              color: selectedTab == "Resume" ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
