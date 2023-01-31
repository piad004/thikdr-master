import 'package:flutter/material.dart';

class ProgressDialogUtils {
   bool isCancellable = false;

  void progressDialogue(BuildContext context) {
    //set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    showDialog(
      //prevent outside touch
      barrierDismissible: isCancellable,
      context: context,
      builder: (BuildContext context) {
        //prevent Back button press
        return WillPopScope(onWillPop: () async => isCancellable, child: alert);
      },
    );
  }

  ///common method for hiding progress dialog
   void hideProgressDialog(BuildContext context, bool mounted) {
    try {
      isCancellable = true;
      if (mounted)
        Navigator.of(context).pop();
    }catch(e){
      isCancellable = true;
    }
    // Navigator.of(context,rootNavigator: true).pop();
  }
}
