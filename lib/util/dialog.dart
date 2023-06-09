import 'package:flutter/material.dart';

enum DialogAction { yes, abort }
enum DialogType { success, error }

class Dialogs {

  static Future<DialogAction> alertBox(
      BuildContext context,
      String title,
      String body,
      DialogType type,
      ) async {
    final action = await showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return  Dialog(
            child: Container(
                height: 250,
                width: 200,

                padding: const EdgeInsets.all( 20),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const Icon(
                      Icons.warning,
                      size:  40,
                     color: Colors.amber,
                    ),
                    const SizedBox(height:  10,),
                    Text(title,style: const TextStyle(fontSize:  16,fontWeight: FontWeight.bold),),
                    const SizedBox(height:  10,),
                    Text(body, textAlign: TextAlign.center,),
                    const  SizedBox(height:  20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        InkWell(
                          onTap: () => Navigator.of(context).pop(DialogAction.yes),
                          child:  Container(
                            width:  100,
                            padding:const EdgeInsets.all( 10),
                            color: Colors.black,

                            child:const Text(
                              'Ok',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
    return (action != null) ? action : DialogAction.abort;
  }






}
