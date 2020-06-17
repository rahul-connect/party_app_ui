import 'package:flutter/material.dart';
import 'package:partyappui/constants.dart';
import 'package:partyappui/models/event.dart';
import 'package:partyappui/widgets/comments_tab.dart';
import 'package:partyappui/widgets/event_detail_tab.dart';
import 'package:partyappui/widgets/guest_list.dart';


class EventDetail extends StatefulWidget {
  final Event event;
  EventDetail({this.event});

  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3,vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrangeAccent,
      body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 35,right: 18),
               
              alignment: Alignment.topRight,
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.event.image),fit: BoxFit.cover),
                
              ),
               child: IconButton(
                 icon: Icon(Icons.close,color: Colors.white,size: 30.0,),
                 onPressed: (){
                   Navigator.pop(context);
                 },
               )
              
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    Text(widget.event.date,style: kOrangeTextStyle,),
                    SizedBox(width: 15.0,),
                    Expanded(
                      child: Divider(color: kOrangeColor,thickness: 2.0,),
                    ),
                    SizedBox(width: 15.0,),
                    Text(widget.event.time,style: kOrangeTextStyle,)
                  ],
                ),
              ),

              Container(
                width: 100.0,
                margin: EdgeInsets.only(left: 18.0),
                child: Text(widget.event.title,style:kTitleStyle),
              ),

              SizedBox(
                height: 15.0,
              ),
              TabBar(
                labelStyle: kSelectedStyle,
                unselectedLabelStyle: kUnselectedStyle,
                isScrollable: true,
                indicatorColor: kOrangeColor,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _controller,
                labelColor: Colors.black,
                tabs: [
                Tab(text: "Event details",),
                Tab(text: "Guest list",),
                Tab(text: "Comments")
              ]),

              SizedBox(height: 400,
                 child: TabBarView(
                   controller: _controller,
                   children: [
                      EventDetailTab(),
                      GuestList(),
                      CommentsTab()
                 ]),
              ),
            ],
          ),
        ),
      
    );
  }
}