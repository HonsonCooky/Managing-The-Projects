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

  SliverAppBar appBar() {
    return SliverAppBar(
      expandedHeight: height(context) / 3,
      backgroundColor: _currentPage.getColor(mtpColors(context)),
      pinned: true,
      flexibleSpace: Stack(
        alignment: Alignment.centerRight,
        children: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.account_circle, size: 50,),
          ),
          FlexibleSpaceBar(
            title: Text(
              _currentPage.name.title(),
              style: textTheme(context).displayMedium?.copyWith(
                    color: _currentPage.getOtherColor(mtpColors(context)),
                    fontWeight: FontWeight.w100,
                  ),
            ),
            titlePadding: EdgeInsets.symmetric(horizontal: width(context) / 10),
          ),
        ],
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
            slivers: [
              appBar(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: index.isOdd ? Colors.white : Colors.black12,
                      height: 100.0,
                    );
                  },
                  childCount: 20,
                ),
              ),
              SliverToBoxAdapter(child: _currentPage.getPresentation())
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
