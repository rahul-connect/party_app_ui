import 'package:flutter/material.dart';
import 'package:partyappui/models/event.dart';
import 'package:partyappui/views/event_details.dart';

import 'event_card.dart';


class UpcomingTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: upcommingList.length,
       scrollDirection: Axis.horizontal,
       shrinkWrap: true,
       physics: BouncingScrollPhysics(),
       itemBuilder: (context,index){
         var upcoming = upcommingList[index];
         return InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetail(event: upcoming,)));
           },
           child: EventCard(event:upcoming ,));
       },
    
      
    );
  }
}