import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showimage(String url,double radius)
{
  return  CircleAvatar(
    radius: radius,
    child:  CachedNetworkImage(
      imageUrl: url!=null?url:"",  fit: BoxFit.cover,
      placeholder: (context, url) =>  Container(
        // padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*25,left: SizeConfig.blockSizeHorizontal*4,right: SizeConfig.blockSizeVertical*4),
        child: Icon(Icons.error),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}