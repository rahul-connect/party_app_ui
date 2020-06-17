import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:partyappui/constants.dart';


class EventDetailTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0,),
          ListTile(
            leading: CircleAvatar(
              radius: 26.0,
              backgroundImage: AssetImage('assets/5.jpg'),
            ),
            title: Text("Jessica Veranda",style: kTitleStyle,),
            subtitle: Text("Host",style: kSubtitleStyle,),
          ),
          Divider(color: kOrangeColor,),
          ListTile(
            leading: SvgPicture.asset('assets/location.svg',width: 25.0,color: kOrangeColor,),
            title: Text("48 Cambridge Street, 278 New South Wales",style:kSubtitleStyle.copyWith(color: Colors.black)),
          ),
          Divider(color: kOrangeColor,),
          ListTile(
            leading: SvgPicture.asset('assets/menu.svg',width: 25.0,color: kOrangeColor,),
            title: Text("Snacks a buffet and drinks will be provided",style:kSubtitleStyle.copyWith(color: Colors.black)),
          ),
          Divider(color: kOrangeColor,),
          ListTile(
            leading: SvgPicture.asset('assets/gift.svg',width: 25.0,color: kOrangeColor,),
            title: Text("No presents plzz, just your presence",style:kSubtitleStyle.copyWith(color: Colors.black)),
          ),

        ],
      ),
      
    );
  }
}