import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managing_the_projects/common/model/theme_model.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpProfile extends StatefulWidget {
  final void Function(File update) onImageUpdate;

  const MtpProfile({super.key, required this.onImageUpdate});

  @override
  State<StatefulWidget> createState() => _MtpProfileState();
}

class _MtpProfileState extends State<MtpProfile> with MtpAliases, SingleTickerProviderStateMixin {
  File? _currentImage;
  final ImagePicker _picker = ImagePicker();
  late final _animation = AnimationController(
    vsync: this,
    lowerBound: 0,
    upperBound: 3,
    value: 3,
    duration: Neumorphic.DEFAULT_DURATION,
  );

  @override
  void initState() {
    super.initState();
    _animation.addListener(() => setState(() {}));
  }

  void _selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = lighten(mtpTheme(context).baseColor).withAlpha(20);

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) => _animation.reverse(),
        onTapCancel: () => _animation.forward(),
        onTapUp: (_) {
          _selectImage();
          _animation.forward();
        },
        child: Neumorphic(
          padding: EdgeInsets.all(textTheme(context).bodyLarge!.fontSize! * 2),
          style: NeumorphicStyle(
            boxShape: const NeumorphicBoxShape.circle(),
            depth: -3,
            color: backgroundColor,
          ),
          child: NeumorphicIcon(
            Icons.image,
            style: NeumorphicStyle(
              depth: _animation.value,
              color: Color.lerp(
                mtpTheme(context).baseColor,
                mtpTheme(context).baseColor.withAlpha(0),
                (_animation.value - 3).abs() / 3,
              ),
            ),
            size: textTheme(context).bodyLarge!.fontSize! * 4,
          ),
        ),
      ),
    );
  }
}
