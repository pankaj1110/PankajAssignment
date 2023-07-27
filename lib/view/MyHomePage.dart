import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar _getTabBar() {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black26,
      indicatorColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: <Widget>[
        Tab(child: Text('This week',)),
        Tab(child: Text('This month')),
      ],
      controller: tabController,
    );
  }

  TabBarView _getTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment'),
        leading: Icon(Icons.arrow_back_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('You!Ruchika is present today'),
                    Image.asset(
                      'assets/turtle.png',
                      height: 90,
                      width: 90,
                    )
                  ],
                )),
            Text("Ruchika's Presence"),
            _getTabBar(),
            Container(
              height: 400,
              child: _getTabBarView(
                <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Container(
                            height: 100,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Present'),
                                    Text('04'),
                                  ],
                                ),
                                VerticalDivider(
                                  width: 30.0,
                                  thickness: 2.0,
                                  color: Colors.black,
                                  indent: 30.0,
                                  endIndent: 30.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Abscent'),
                                    Text('01'),
                                  ],
                                ),
                                VerticalDivider(
                                  width: 30.0,
                                  thickness: 2.0,
                                  color: Colors.black,
                                  indent: 30.0,
                                  endIndent: 30.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Percentage'),
                                    Text('90%'),
                                  ],
                                ),
                              ],
                            )),
                        Icon(Icons.home),
                      ],
                    ),
                  ),
                  Icon(Icons.settings),
                ],
              ),
            ),
            Text("Attendance Details"),
          ],
        ),
      ),
    );
  }
}
