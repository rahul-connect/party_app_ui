import 'package:flutter/material.dart';
import 'package:partyappui/models/event.dart';
import 'package:partyappui/widgets/event_card.dart';


class PastTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pastList.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index){
        var eventPast = pastList[index];
        return EventCard(event: eventPast);
      },
      
    );
  }
}