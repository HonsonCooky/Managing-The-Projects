import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';
import 'package:managing_the_projects/common/presentation/mtp_bottom_sheet_selection.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';

class MtpProfile extends StatefulWidget {
  final File? currentImage;
  final Future<void> Function(File update) onImageUpdate;
  final Future<void> Function() onImageDelete;
  final bool? loading;
  final bool canAlter;

  const MtpProfile({
    super.key,
    required this.onImageUpdate,
    this.currentImage,
    required this.onImageDelete,
    this.loading,
    this.canAlter = false,
  });

  @override
  State<StatefulWidget> createState() => _MtpProfileState();
}

class _MtpProfileState extends State<MtpProfile> with MtpAliases, TickerProviderStateMixin {
  final ImagePicker _picker = ImagePicker();
  bool _forwardQueued = false;
  bool _takeAction = false;
  late bool _loading = widget.loading ?? false;
  late final _popUp = AnimationController(
    vsync: this,
    duration: Duration(
      milliseconds: Neumorphic.DEFAULT_DURATION.inMilliseconds * 2,
    ),
  );
  late final _animation =
      AnimationController(vsync: this, lowerBound: 0, upperBound: 3, value: 3, duration: Neumorphic.DEFAULT_DURATION);

  @override
  void initState() {
    super.initState();
    _animation.addListener(() {
      if (_forwardQueued && _animation.value == _animation.lowerBound) {
        _animation.forward().then((value) {
          if (_takeAction) _showOptions();
          setState(() {
            _forwardQueued = false;
            _takeAction = false;
          });
        });
      } else {
        setState(() {});
      }
    });
  }

  void _iconDownAnimation(bool takeAction) {
    if (_animation.value > _animation.lowerBound) {
      _forwardQueued = true;
      _takeAction = takeAction;
    } else {
      _animation.forward().then((value) {
        if (takeAction) _showOptions();
      });
    }
  }

  Future<void> _view() async {
    _popUp.reset();
    Navigator.of(context).pop();
    _popUp.forward();
    await showDialog(
      context: context,
      builder: (context) {
        return ScaleTransition(
          scale: _popUp,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Neumorphic(
                style: const NeumorphicStyle(depth: 0),
                margin: const EdgeInsets.all(24.0),
                padding: const EdgeInsets.all(12.0),
                child: Neumorphic(
                  style: const NeumorphicStyle(depth: 3, intensity: 0.6),
                  child: Image.file(widget.currentImage!),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _upload() async {
    var nav = Navigator.of(context);
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      nav.pop();
      setState(() => _loading = true);
      widget.onImageUpdate(File(image.path)).then((value) => setState(() => _loading = false));
    }
  }

  Future<void> _delete() async {
    Navigator.of(context).pop();
    setState(() => _loading = true);
    widget.onImageDelete().then((value) => setState(() => _loading = false));
  }

  Widget _viewButton() => widget.currentImage == null
      ? const SizedBox()
      : MtpBottomSheetSelection(
          text: 'View',
          leadingIcon: Icons.image,
          onTap: _view,
        );

  Widget _updateButton() => !widget.canAlter
      ? const SizedBox()
      : MtpBottomSheetSelection(
          text: 'Upload',
          leadingIcon: Icons.upload,
          onTap: _upload,
        );

  Widget _deleteButton() => !widget.canAlter || widget.currentImage == null
      ? const SizedBox()
      : MtpBottomSheetSelection(
          text: 'Delete',
          leadingIcon: Icons.delete,
          textColor: mtpTheme(context).accentColor,
          onTap: _delete,
        );

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
            children: [_viewButton(), _updateButton(), _deleteButton()],
          ),
        );
      },
    );
  }

  Widget _imageIcon() {
    return Center(
      child: NeumorphicIcon(
        Icons.image,
        style: NeumorphicStyle(depth: _animation.value, intensity: 0.6),
        size: textTheme(context).bodyLarge!.fontSize! * 4,
      ),
    );
  }

  Widget _loadingImage() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width(context) / 4,
          child: const NeumorphicProgressIndeterminate(
            height: 14,
            curve: Curves.linear,
            reverse: true,
          ),
        ),
      ],
    );
  }

  Widget _background() {
    return _loading
        ? _loadingImage()
        : widget.currentImage == null
            ? _imageIcon()
            : Image.file(widget.currentImage!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width(context) / 3,
      height: width(context) / 3,
      child: Neumorphic(
        style: NeumorphicStyle(
          boxShape: const NeumorphicBoxShape.circle(),
          depth: -3,
          intensity: 1,
          color: lighten(mtpTheme(context).baseColor).withAlpha(20),
        ),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: (_) {
            if (!_loading) _animation.reverse();
          },
          onTapCancel: () {
            if (!_loading) _iconDownAnimation(false);
          },
          onTapUp: (_) {
            if (!_loading) _iconDownAnimation(true);
          },
          child: _background(),
        ),
      ),
    );
  }
}
