import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_version/get_version.dart';
import 'dart:io' show Platform;
class HomePage extends StatefulWidget {
  static final String id='home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _platformVer='';
  String _projectVer='';
  String _projectCode='';
  String _appID='';
  String _appName='';
void initState(){
super.initState();
_checkVer();
}
void _checkVer()async{
  String platformVer;
  String projectVer;
  String codeVer;
  String appID;
  String appName;
  //#platform version
  try{
    platformVer=await GetVersion.platformVersion;
  }on PlatformException{
    platformVer='error';
  }
 //#projectVer
  try{
    projectVer=await GetVersion.projectVersion;
  }on PlatformException{
    projectVer='error';
  }
  //#codeVer
  try{
    codeVer=await GetVersion.projectCode;
  }on PlatformException{
    projectVer='error';
  }
  //#app id
  try{
    appID=await GetVersion.appID;
  }on PlatformException{
    projectVer='error';
  }
  //#app name
  try{
    appName=await GetVersion.appName;
  }on PlatformException{
    projectVer='error';
  }
  if(!mounted)return;
  setState((){
    _platformVer=platformVer;
    _projectVer=projectVer;
    _projectCode=codeVer;
    _appID=appID;
    _appName=appName;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(
        title:Text('get version package',style:GoogleFonts.gruppo(
          fontSize: 30,
          fontWeight:FontWeight.w700,
          color:Colors.black54,
        )),
        centerTitle:true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        bottomOpacity: 0.0,
      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:ListView(
         children: [
           _version(v:'OS:',st:'${Platform.operatingSystem}'),
           _version(v:'Platform version:',st:_platformVer),
           _version(v:'Project version:',st:_projectVer),
           _version(v:'Project code:',st:_projectCode),
           _version(v:'App ID:',st:_appID),
           _version(v:'App Name:',st:_appName),
         ],
        ),
      ),
    );
  }
  Widget _version({String v,String st}){
    return Container(
      margin:EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      height: 100,
      width: MediaQuery.of(context).size.width,
      padding:EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26,blurRadius: 10,offset: Offset(0,10)),
        ],
        color:Colors.grey[400],
        borderRadius:BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(50),topRight: Radius.circular(50),bottomRight: Radius.circular(15)),
      ),
      child:Center(
        child:RichText(
          textAlign: TextAlign.center,
          text:TextSpan(
            text:v,
            style: GoogleFonts.spartan(
              fontSize:20,
              color:Colors.black,
              fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(text:st,style:TextStyle(color:Colors.blue,),),
            ],
          ),
        ),
      ),
    );
  }
}
