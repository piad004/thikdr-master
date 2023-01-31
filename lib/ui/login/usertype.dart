import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thikdr/ui/login/contractor_register.dart';
import 'package:thikdr/ui/login/labour_register.dart';
import 'package:thikdr/ui/login/skill_model.dart';
import 'package:thikdr/ui/login/uses_type_model.dart';
import 'package:thikdr/utils/color_constant.dart';
import 'package:thikdr/utils/image_constant.dart';

import '../../network/webservice.dart';

class UserTypePage extends StatefulWidget {
  String mobile="";
  UserTypePage(this.mobile);

  @override
  State<UserTypePage> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserTypePage> {
  /* List<UserTypeModel> _userTypeList = [
    UserTypeModel(ImageConstant.imgContractor, 'I am a Contractor'),
    UserTypeModel(ImageConstant.imgDeveloper, 'I am a Developer'),
    UserTypeModel(ImageConstant.imgLabour, 'I am a Labour'),
    UserTypeModel(ImageConstant.imgSuppler, 'I am a Suppler'),
  ];*/

List<SkillList> _userTypeList = [
  ];

  @override
  void initState() {
    super.initState();
    getRoles();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'User Type',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: const Alignment(0.0073, 0.02821),
                    end: const Alignment(0.9940, 1.0),
                    colors: [
                  ColorConstant.whiteA700,
                  ColorConstant.whiteA700
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Select User Type',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  shrinkWrap: true,
                  children: List.generate(
                    _userTypeList.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          if(index==0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ContractorRegisterPage(id: _userTypeList[index].id.toString(), mobile: widget.mobile)));
                          }else if(index==2){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LabourRegisterPage(id: _userTypeList[index].id.toString(), mobile: widget.mobile,)));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Center(
                              child: Column(
                                children: [
                                  /*Image.network(
                                      "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg",
                                      height: 100,
                                      width: MediaQuery.of(context).size.width/3,
                                      fit:BoxFit.fill
                                  ),
*/
                                  /* Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://www.gstatic.com/webp/gallery3/1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                ),*/
                                  /* Text(
                                  'Select User Type',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),*/

                                  Container(
                                    height: 85,
                                    width: 85,
                                    margin: EdgeInsets.only(
                                      left: 13,
                                      top: 25,
                                      right: 13,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorConstant.orangeA100,
                                      borderRadius: BorderRadius.circular(
                                        42,
                                      ),
                                    ),
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: EdgeInsets.all(0),
                                      color: ColorConstant.orangeA100,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          42,
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                left: 13,
                                                top: 12,
                                                right: 13,
                                                bottom: 12,
                                              ),
                                              child: Image.network(
                                                _userTypeList[index].img!,
                                                height: 58,
                                                width: 58,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 5,
                                      top: 5,
                                      right: 5,
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      _userTypeList[index].name!,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 14,
                                        height: 1.22,
                                        color: ColorConstant.bluegray900,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )));
  }

  Future<void> getRoles() async {
    try{
    SkillModel skillModel = await Webservice().requestRoleList();

    if (!skillModel.error!) {
      setState(() {
        _userTypeList = skillModel.data!.list!;
      });
    }

    print('response : ${jsonEncode(skillModel)}');
  }catch(e){

    }
  }
}
