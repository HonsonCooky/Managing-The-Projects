import 'package:flutter/material.dart';
import 'package:managing_the_projects/common/service/routes.dart';
import 'package:managing_the_projects/main.dart';

class MtpScaffold extends Scaffold {
  const MtpScaffold({
    super.key,
    super.appBar,
    super.body,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.endDrawerEnableOpenDragGesture,
    super.restorationId,
  });

  @override
  Widget? get bottomNavigationBar => BottomNavigationBar(
        items: MtpRoute.values
            .map(
              (e) => BottomNavigationBarItem(
                backgroundColor: Colors.lightBlueAccent,
                icon: Icon(e.getIcon()),
                label: e.name.title(),
              ),
            )
            .toList(),
      );
}
