import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/apptext.dart';
import 'package:portfolio/presentation/widgets/live_card.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCard extends StatefulWidget {
  final bool isBottomBar;

  const ProfileCard({Key? key, this.isBottomBar = false}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final bool shouldExpand = isDesktop || _isExpanded;

    return SelectableRegion(
      selectionControls: MaterialTextSelectionControls(),
      child: Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          onTap: () {
            if (!isDesktop) {
              setState(() => _isExpanded = !_isExpanded);
            }
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 200),
            scale: _isPressed ? 0.98 : 1.0,
            curve: Curves.easeOut,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xff1e1e1f),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xff383838)),
                boxShadow: _isPressed
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
              ),
              width: widget.isBottomBar ? double.infinity : 300,
              margin: widget.isBottomBar
                  ? null
                  : const EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: widget.isBottomBar ? 16 : (shouldExpand ? 96 : 20),
                bottom: widget.isBottomBar ? 16 : (shouldExpand ? 96 : 20),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                switchInCurve: Curves.easeInOutCubicEmphasized,
                switchOutCurve: Curves.easeInOutCubic,
                child: Column(
                  key: ValueKey(shouldExpand),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!widget.isBottomBar)
                      _buildColumnLayout(shouldExpand)
                    else
                      _buildRowLayout(),
                    AnimatedOpacity(
                      opacity: shouldExpand ? 1 : 0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: shouldExpand
                          ? Column(
                              children: [
                                const SizedBox(height: 20),
                                _buildExpandableContent(),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    if (!isDesktop && !widget.isBottomBar)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: AnimatedRotation(
                          duration: const Duration(milliseconds: 300),
                          turns: _isExpanded ? 0.5 : 0.0,
                          curve: Curves.easeInOut,
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnLayout(bool isExpanded) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/svg/profile.jpg',
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: frame == null ? 0 : 1,
                child: LiveIndicatorCard(child: child),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HugeText("Saurav Kumar", color: Colors.white),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff2b2b2c),
              ),
              child: SmallText("Flutter Developer", color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRowLayout() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://thumbs.dreamstime.com/b/gamer-portrait-video-games-background-glitch-style-player-vector-illustration-online-user-163082367.jpg?w=992',
            fit: BoxFit.cover,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              return AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: frame == null ? 0 : 1,
                child: LiveIndicatorCard(child: child, isBottom: true),
              );
            },
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HugeText("Saurav Kumar", color: Colors.white),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff2b2b2c),
              ),
              child: SmallText("Flutter Developer", color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpandableContent() {
    return Column(
      children: [
        const Divider(height: 1, color: Color(0xff2b2b2c)),
        const SizedBox(height: 20),
        _contactRow(Icons.email_outlined, "EMAIL", "commerce.saurav@gmail.com"),
        const SizedBox(height: 16),
        _contactRow(
          Icons.location_on_sharp,
          "LOCATION",
          "Gurgaon, Haryana, India",
        ),
        const SizedBox(height: 16),
        const Divider(height: 1, color: Color(0xff2b2b2c)),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialIcon('github', 'https://github.com/saurav-inde'),
            const SizedBox(width: 16),
            _socialIcon('linkedin',
                'https://www.linkedin.com/in/saurav-kumar-84082120b/'),
            const SizedBox(width: 16),
            _socialIcon('leetcode', 'https://leetcode.com/u/sauravmiit/'),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(String name, String url) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      borderRadius: BorderRadius.circular(8),
      child: AnimatedScale(
        scale: 1.0,
        duration: const Duration(milliseconds: 200),
        child: SvgPicture.asset(
          'assets/svg/social/$name.svg',
          color: Colors.white,
          height: 18,
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: subtitle));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xff2b2b2c),
            content: SmallText("${title.toLowerCase()} copied",
                color: Colors.amberAccent),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 24),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallText(title, color: Colors.white54),
              const SizedBox(height: 2),
              SmallText(subtitle, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
