import 'package:flutter/material.dart';
import 'package:partyappui/models/event.dart';

import '../constants.dart';

class CommentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: friendList.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index){
        var friend = friendList[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 27.0,
            backgroundImage: AssetImage(friend.image),
          ),
          title: Text(friend.name,style:kTitleStyle),
          subtitle: Text("I am damm excited !",style: kSubtitleStyle,),
        );

      },
      
    );
  }
}