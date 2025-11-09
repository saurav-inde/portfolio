import 'package:flutter/material.dart';
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

class _ProfileCardState extends State<ProfileCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    // Auto-expand on desktop, allow toggle on mobile
    final bool shouldExpand = isDesktop || _isExpanded;

    return SelectableRegion(
      selectionControls: MaterialTextSelectionControls(),
      child: Align(
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () {
            if (!isDesktop) {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: const Color(0xff1e1e1f),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xff383838)),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile Image and Basic Info (always visible)
                if (!widget.isBottomBar)
                  _buildColumnLayout(shouldExpand)
                else
                  _buildRowLayout(),

                // Expandable Content
                if (shouldExpand) _buildExpandableContent(),

                // Expand/Collapse Arrow (only show on mobile)
                if (!isDesktop && !widget.isBottomBar)
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white54,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColumnLayout(bool isExpanded) {
    return Column(
      children: [
        Image.network(
          'https://thumbs.dreamstime.com/b/gamer-portrait-video-games-background-glitch-style-player-vector-illustration-online-user-163082367.jpg?w=992',
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return LiveIndicatorCard(child: child);
          },
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
        Image.network(
          'https://thumbs.dreamstime.com/b/gamer-portrait-video-games-background-glitch-style-player-vector-illustration-online-user-163082367.jpg?w=992',
          fit: BoxFit.cover,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return LiveIndicatorCard(child: child, isBottom: true);
          },
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
        const SizedBox(height: 20),
        const Divider(height: 1, color: Color(0xff2b2b2c)),
        const SizedBox(height: 20),
        _contactRow(Icons.email_outlined, "EMAIL", "commerce.saurav@gmail.com"),
        const SizedBox(height: 16),
        _contactRow(Icons.phone_outlined, "PHONE", "+91 9625874470"),
        SizedBox(height: 16),
        const Divider(height: 1, color: Color(0xff2b2b2c)),
        SizedBox(height: 16),

        Row(
          spacing: 16,
          children: [
            InkWell(
              onTap: () {
                launchUrl(Uri.parse('https://github.com/saurav-inde'));
              },
              child: SvgPicture.asset(
                'assets/svg/social/github.svg',
                color: Colors.white,
                height: 16,
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/svg/social/linkedin.svg',
                height: 16,

                color: Colors.white,
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/svg/social/leetcode.svg',
                height: 16,

                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _contactRow(IconData icon, String title, String subtitle) {
    return Row(
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
    );
  }
}

// Usage:
// For regular card: ProfileCard()
// For bottom bar version: ProfileCard(isBottomBar: true)
