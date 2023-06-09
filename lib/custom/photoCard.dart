import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key,
    required this.name,
    required this.image,
    this.onTap
  });

  final String  image;
  final String  name;
  final VoidCallback?  onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
        margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
              Container(
                width:MediaQuery.of(context).size.width ,
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  height: 300,
                  placeholder: (context, url) => const CupertinoActivityIndicator(),
                  errorWidget: (context, url, error) => Image.asset("assets/default.png"),
                ),
              ),


              // CachedNetworkImage(
              //     imageUrl: image,
              //     imageBuilder: (context, imageProvider) =>
              //         Container(
              //
              //     padding:const EdgeInsets.all(20),
              //     height: 300,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       image:  DecorationImage(
              //           image: NetworkImage(image),
              //           fit: BoxFit.cover),
              //     ),
              //
              //   ),
              //     placeholder: (context, url) => const Center(child: CupertinoActivityIndicator()),
              //     errorWidget: (context, url, error) => Image.asset("assets/default.png"),
              // ),
            ),

            Positioned(
                bottom:10 ,
                left: 0,
                child:
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    width: 150,
                    height:60 ,
                    decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.7),
                        borderRadius:const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                    ),
                    child: Text(toBeginningOfSentenceCase(name).toString(), style: const TextStyle(color: Colors.white,fontSize: 12, fontWeight: FontWeight.w500),))
            )
          ],
        ),
      ),
    );
  }
}
