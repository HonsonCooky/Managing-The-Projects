import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:managing_the_projects/common/service/mtp_alias.dart';
import 'package:managing_the_projects/common/service/routes.dart';
import 'package:managing_the_projects/main.dart';

class MtpPage extends StatefulWidget {
  const MtpPage({super.key});

  @override
  State<StatefulWidget> createState() => _MtpPageState();
}

class _MtpPageState extends State<MtpPage> with MtpAliases {
  MtpRoute _currentPage = MtpRoute.home;

  BottomNavigationBarItem _fromRoute(MtpRoute route) {
    return BottomNavigationBarItem(
      icon: Icon(route.getIcon()),
      label: route.name.title(),
      backgroundColor: route.getColor(mtpColors(context)),
      tooltip: null,
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      expandedHeight: height(context) / 5,
      backgroundColor: _currentPage.getColor(mtpColors(context)),
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(horizontal: width(context) / 8),
        title: Text(
          _currentPage.name.title(),
          style: textTheme(context).displaySmall?.copyWith(
                color: _currentPage.getOtherColor(mtpColors(context)),
                fontWeight: FontWeight.w200,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: _currentPage.getOtherColor(mtpColors(context))),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: mtpColors(context).background,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _appBar(),
              SliverFillRemaining(child: _currentPage.getPresentation()),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: appPages.map(_fromRoute).toList(),
            currentIndex: appPages.indexWhere((element) => element == _currentPage),
            onTap: (index) => setState(() => _currentPage = appPages[index]),
            selectedItemColor: _currentPage.getOtherColor(mtpColors(context)),
            unselectedItemColor: mtpColors(context).onBackground,
          ),
        ),
      ),
    );
  }
}
