import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/assets_manager.dart';
import 'package:movie_app/core/colors_manager.dart';
import 'package:movie_app/data_model/firebase/firebase.dart';

import '../../../../../config/app_styles/app_styles.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: REdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              'Watchlist',
              style: AppStyles.screenTitle,
            ),
            SizedBox(
              height: 5.h,
            ),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey,
                height: 40.h,
              ),
              itemCount: 10,
              itemBuilder: (context, index) => buildWatchList(),
            ))
          ],
        ));
  }

  buildWatchList() {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            width: 140.w,
            height: 90.h,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image(
                    image: AssetImage(AssetsManager.romanceFilm),
                    fit: BoxFit.cover,
                  ),
                ),

                Stack(
                  children: [
                    Image(image: AssetImage(AssetsManager.iconBookmark),width: 27.w,height: 36,),
                    InkWell(
                        onTap: () {
                          addMovieToFireStore ();
                        },
                        child: Icon(Icons.check,color: Colors.white,size: 30,))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Film Title',
                style: AppStyles.filmWatchListTitle,
              ),
              Text('2024', style: AppStyles.filmWatchListDescription),
              Text(
                'actor name , actor name',
                style: AppStyles.filmWatchListDescription,
              ),
            ],
          ),
        ],
      ),
    );
  }



  addMovieToFireStore () async{
 CollectionReference collectionReference = FirebaseFirestore.instance.collection('movie');
 DocumentReference documentReference= collectionReference.doc();
MovieDM movie = MovieDM(id: documentReference.id, title: "",  isDone: false);
  await documentReference.set(movie.toFireStore()).then((_) {},).onError((error, stackTrace) {} ,)
      .timeout(Duration(milliseconds: 500),onTimeout: (){},);
  }





}
