import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managing_the_projects/common/model/theme_model.dart';
import 'package:managing_the_projects/common/presentation/mtp_bottom_sheet_selection.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpProfile extends StatefulWidget {
  final File? currentImage;
  final void Function(File update) onImageUpdate;
  final void Function() deleteImage;

  const MtpProfile({super.key, required this.onImageUpdate, this.currentImage, required this.deleteImage});

  @override
  State<StatefulWidget> createState() => _MtpProfileState();
}

class _MtpProfileState extends State<MtpProfile> with MtpAliases, SingleTickerProviderStateMixin {
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

  void _upload() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) widget.onImageUpdate(File(image.path));
  }

  void _showOptions() async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: mtpTheme(context).baseColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      clipBehavior: Clip.hardEdge,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              widget.currentImage == null
                  ? const SizedBox()
                  : const MtpBottomSheetSelection(
                      text: 'View',
                      leadingIcon: Icons.image,
                    ),
              MtpBottomSheetSelection(
                text: 'Upload',
                leadingIcon: Icons.upload,
                onTap: _upload,
              ),
              MtpBottomSheetSelection(
                text: 'Delete',
                leadingIcon: Icons.delete,
                textColor: mtpTheme(context).accentColor,
                splashColor: mtpTheme(context).defaultTextColor,
                onTap: () {},
              )
            ],
          ),
        );
      },
    );
  }
  
  Widget _imageIcon(){
    return Center(
      child: NeumorphicIcon(
        Icons.image,
        style: NeumorphicStyle(
          depth: _animation.value,
          intensity: 0.6,
          color: Color.lerp(
            mtpTheme(context).baseColor,
            mtpTheme(context).baseColor.withAlpha(0),
            (_animation.value - 3).abs() / 3,
          ),
        ),
        size: textTheme(context).bodyLarge!.fontSize! * 4,
      ),
    );
  }
  
  Widget _image(){
    return Image.file(widget.currentImage!);
  }
  
  Widget _background(){
    return widget.currentImage == null ? _imageIcon() : _image();
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor = lighten(mtpTheme(context).baseColor).withAlpha(20);

    return SizedBox(
      width: width(context) / 3,
      height: width(context) / 3,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: (_) => _animation.reverse(),
        onTapCancel: () => _animation.forward(),
        onTapUp: (_) {
          _showOptions();
          _animation.forward();
        },
        child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: const NeumorphicBoxShape.circle(),
            depth: -3,
            intensity: 1,
            color: backgroundColor,
          ),
          child: _background(),
        ),
      ),
    );
  }
}
