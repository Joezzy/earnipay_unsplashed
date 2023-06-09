

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:unsplashed/controller/imageController.dart';
import 'package:unsplashed/custom/photoCard.dart';
import 'package:unsplashed/data/imageData.dart';
import 'package:unsplashed/screens/detailScreen.dart';
import 'package:unsplashed/util/screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final imageController=Get.put(PhotoController());
  @override
  void initState() {
    imageController.getImageFunc(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<PhotoController>(
      builder: (photoController) {
        return Scaffold(
          backgroundColor: Colors.blue.shade900,
          appBar: AppBar(
            title:  Text("Unsplashed",style: TextStyle( fontSize:30,color: Colors.white.withOpacity(.5)),),
            backgroundColor: Colors.blue.withOpacity(.02),
            elevation: 0,
          ),
          body:photoController.isLoading.value?
             const Center(child:  CupertinoActivityIndicator(),)
          :photoController.imageList.isEmpty?
             const Center(child:  Text("No image found"),)
          :
          LazyLoadScrollView(
            onEndOfPage: () => imageController.getImageFunc(context),
            child: GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: getScreen() == Screen.win
                 ? 4 : getScreen() == Screen.tab
                 ? 3 : getScreen() == Screen.phone
                 ? 2 : 2,
             childAspectRatio: 1.3/ 1.4,
                  // crossAxisSpacing: 1,
                  // mainAxisSpacing: 5
              ),

              itemCount: imageController.imageList.length,
              itemBuilder: (context, position) {
                PhotoData photo=imageController.imageList[position];
                return PhotoCard(name: photo!.altDescription??"No title",
                    image: photo.urls!.small.toString(),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(photoData: photo),

                    ),
                  );
                },);
              },
            ),
          ),
        );
      }
    );
  }
}



