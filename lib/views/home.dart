import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partyappui/constants.dart';
import 'package:partyappui/models/event.dart';
import 'package:partyappui/widgets/past_tab.dart';
import 'package:partyappui/widgets/upcoming.tab.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrangeAccent,
      appBar: PreferredSize(
      
        preferredSize: Size.fromHeight(70.0),
        child: SafeArea(child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 18),
          child: Row(
            children: <Widget>[
              Image.asset('assets/logo.png',width: 120.0,height: 60,),
              Spacer(),
              SvgPicture.asset('assets/gift.svg',width: 25.0,color: kOrangeColor,),
            ],
          ),
        ))
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.0,),
              Container(
                width: double.infinity,
                height: 55.0,
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0,),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: kOrangeColor.withOpacity(.2),
                      blurRadius: 7.0,
                      spreadRadius: 1.0,
                      offset: Offset(2.0, 4.0),
                    ),
                  ]
                ),
                child: TextField(
                  cursorColor: kOrangeColor,
                  decoration: InputDecoration(
                    icon: SvgPicture.asset("assets/search.svg",width: 25.0, color: kOrangeColor,),
                    border: InputBorder.none,
                    hintText: "Search events",
                    hintStyle: kHintStyle,

                  ),
                ),
              ),
              SizedBox(height: 25,),
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  controller: _controller,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelStyle: kSelectedStyle,
                  unselectedLabelStyle: kUnselectedStyle,
                  isScrollable: true,
                  indicatorColor: kOrangeColor,
                  labelColor: Colors.black,
                  tabs: [
                  Tab(text: "Upcoming",),
                  Tab(text: "Past",),
                ]),
              ),

              SizedBox(height: 15.0,),
              Container(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.only(left: 18),
                child: TabBarView(
                  controller: _controller,
                  children: [
                    UpcomingTabView(),
                    PastTabView(),
                  ]
                   ),
              ),
              SizedBox(height: 10.0,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0)),
                  color: Colors.white,

                ),
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text("Friends Birthday",style:kTitleStyle,),
                        Spacer(),
                        Text("+ Add new",style: kSubtitleStyle.copyWith(color:kOrangeColor,fontSize: 15.0),),
                      ],
                    ),
                    ),


                    ListView.builder(
                      itemCount: friendList.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemBuilder: (context,index){
                        var friend = friendList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 27.0,
                            backgroundImage: AssetImage(friend.image),
                          ),
                          title: Text(friend.name,style: kTitleStyle,),
                          subtitle: Text("${friend.date} - ${friend.age} Birthday",style: kSubtitleStyle,),
                        );
                      },
                      
                      ),

                  ],
                ),
              )

            ],
          ),
        ),
    
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrangeColor,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: (){

        } 
        
        ),
    );
  }
}