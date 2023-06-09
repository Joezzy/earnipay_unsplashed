

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:unsplashed/data/imageData.dart';
import 'package:unsplashed/util/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final PhotoData photoData;
  const  DetailScreen({Key? key,required this.photoData}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}


class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        xs: 12,
                        md: 6,
                        lg: 6,
                        child: Column(
                          children: [

                            Container(
                              margin:getScreen() !=Screen.phone? const EdgeInsets.symmetric(horizontal: 20):EdgeInsets.zero,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:
                                    CachedNetworkImage(
                                      imageUrl: widget.photoData.urls!.small!,
                                      fit: BoxFit.cover,
                                      width: screenWidth,
                                      height: 400,
                                      placeholder: (context, url) => const CupertinoActivityIndicator(),
                                      errorWidget: (context, url, error) => Image.asset("assets/default.png"),
                                    ),

                                  ),
                                  Positioned(
                                      top: 10,
                                      left: 10,
                                      child: InkWell(
                                        onTap: ()=>Navigator.pop(context),
                                        child: Container(
                                          padding:const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.blue.withOpacity(0.5),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child:const Icon(Icons.chevron_left,color: Colors.white,),),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),

                      ),
                      ResponsiveGridCol(
                        xs: 12,
                        md: 6,
                        lg: 6,
                        child: Column(
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const  SizedBox(height: 10),
                                Text(toBeginningOfSentenceCase(widget.photoData!.altDescription!).toString(),
                                  style:const TextStyle(fontWeight: FontWeight.w500,fontSize: 20,color: Colors.white),),
                                const  SizedBox(height: 20),
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    width: screenWidth,
                                    height:150,

                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text(widget.photoData!.description!)),
                              ],
                            ),
                            Container(
                              padding:const EdgeInsets.all(10),
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade200,
                                borderRadius: BorderRadius.circular(10),

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:const [
                                  Text("Photo credit",
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child:
                                    CachedNetworkImage(
                                      imageUrl: widget.photoData!.user!.profileImage!.large!,
                                      fit: BoxFit.cover,
                                      height: 100,
                                      placeholder: (context, url) => const CupertinoActivityIndicator(),
                                      errorWidget: (context, url, error) => Image.asset("assets/default.png"),
                                    ),


                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("${widget.photoData.user!.firstName} ${widget.photoData.user!.lastName??""}",
                                      style: const TextStyle(fontWeight: FontWeight.w500,color: Colors.white)),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children:  [
                                    Social(
                                      uri:"https://twitter.com/blvck_nalz${widget.photoData.user!.twitterUsername}" ,
                                      icon: MdiIcons.twitter,
                                    ),

                                    Social(
                                      uri: "https://www.instagram.com/${widget.photoData.user!.instagramUsername}/",
                                      icon: MdiIcons.instagram,

                                    ),
                                    Social(
                                      uri: widget.photoData.user!.portfolioUrl??"https://www.google.com",
                                      icon: MdiIcons.web

                                    ),

                                ],
                                ),
                                const SizedBox(height: 10),
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    width: screenWidth,
                                    height:150,
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text(widget.photoData!.user!.bio!)),

                              ],
                            )
                          ],
                        ),

                      ),

                        // ResponsiveGridCol(
                        //   xs: 12,
                        //   md: 6,
                        //   lg: 8,
                        //   child: ResponsiveGridRow(
                        //     children: [
                        //
                        //
                        //
                        //
                        //
                        //
                        //     ],
                        //   ),
                        //
                        // ),

                    ]
                ),







              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Social extends StatelessWidget {
  final String? uri;
  final IconData  icon;

  const Social({
    super.key,
    this.uri,
   required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{

        final Uri url = Uri.parse(uri.toString());
        if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
        }
      },
        child: Icon(icon,size: 50,color: Colors.blue.shade300,));
  }
}
