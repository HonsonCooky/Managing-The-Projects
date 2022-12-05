import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpPageIndicator extends StatefulWidget {
  final void Function(int index) changePage;
  final PageController controller;
  final int numberOfPages;

  const MtpPageIndicator({super.key, required this.numberOfPages, required this.controller, required this.changePage});

  @override
  State<StatefulWidget> createState() => _MtpPageIndicatorState();
}

class _MtpPageIndicatorState extends State<MtpPageIndicator> with MtpAliases {
  bool _wasClicked = false;
  late int _selectedPage = widget.controller.initialPage;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (!mounted || widget.controller.page == null) return;
      if (!_wasClicked && _selectedPage != widget.controller.page!.round()) {
        setState(() => _selectedPage = widget.controller.page!.round());
      } else if (_selectedPage - widget.controller.page! == 0) {
        setState(() => _wasClicked = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = 16;
    return Offstage(
      offstage: keyboardOpen(),
      child: Container(
        margin: const EdgeInsets.all(10),
        height: maxHeight,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.numberOfPages,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                widget.changePage(index);
                setState(() {
                  _wasClicked = true;
                  _selectedPage = index;
                });
              },
              child: Neumorphic(
                style: NeumorphicStyle(
                  boxShape: const NeumorphicBoxShape.circle(),
                  depth: index == _selectedPage ? -1 : 1,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  height: maxHeight,
                  width: maxHeight,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
