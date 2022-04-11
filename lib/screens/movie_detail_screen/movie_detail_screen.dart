import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_list_movie/controller/movie_detail_controller.dart';
import 'package:flutter_list_movie/widgets/movie_detail_widgets/movie_casts_widget.dart';
import 'package:flutter_list_movie/widgets/movie_detail_widgets/movie_detail_widgets.dart';
import 'package:flutter_list_movie/widgets/movie_detail_widgets/similar_movies_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:badges/badges.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);
  final int movieId;

  @override
  State<MovieDetailScreen> createState() => _DetailViewState();
}

class _DetailViewState extends State<MovieDetailScreen> {
  String? outputDate = "";

  final currencyFormatter = NumberFormat();
  var inputFormat = DateFormat('yyyy-MM-dd');
  var outputFormat = DateFormat('dd/MM/yyyy');
  GlobalKey<CartIconKey> gkCart = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCardAnimation;
  late int _counter = 0;

  void initState() {
    super.initState();
  }

  void listClick(GlobalKey gkImage) {
    Future.delayed(const Duration(milliseconds: 1500), () {
      // checkBoxCallBack(isOnline);

      setState(() {
        _counter++;
      });
      print("kkkk $_counter");
    });

    runAddToCardAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat();
    final MovieDetailController movieController =
        Get.put(MovieDetailController(widget.movieId));
    return AddToCartAnimation(
      gkCart: gkCart,
      rotation: true,
      receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
        runAddToCardAnimation = addToCardAnimationMethod;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              if (movieController.isLoading.value) {
                print('MovieController.isLoading.value :' +
                    movieController.isLoading.value.toString());
                return const Center(child: CircularProgressIndicator());
              } else {
                return
                  MovieDetailWidget(movie: movieController.m);
              }
            }),
            Align(
              alignment: Alignment.topRight,
              child: Stack(
                children: [
                  SizedBox(
                    height: 1,
                    child: AddToCartIcon(
                      key: gkCart,
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Badge(
                      badgeColor: Colors.redAccent,
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        _counter.toString(),
                        style: const TextStyle(color: Colors.white,fontSize: 10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0,5, 5, 0),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                      )
                    // IconButton(icon: Icon(Icons.shopping_cart,color: Colors.green,), onPressed: () {}),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: AppListItem(onClick: listClick)),
                    const SizedBox(width:10,),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                              color: Colors.red),
                          child: Row(
                            children: [
                              const Expanded(
                                  flex: 2,
                                  child: SizedBox(width:10,)),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Lottie.asset(
                                      // 'https://assets2.lottiefiles.com/packages/lf20_96cnyxkh.json',
                                        "assets/img/play.json",
                                        width: 60,
                                        height: 60),
                                  ),),
                              const Expanded(
                                flex: 5,
                                child: Text(
                                  "Xem phim",
                                  // maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.4,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              const Expanded(
                                flex: 2,
                                  child: SizedBox(width:10,)),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getDuration(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    print("giờ " + parts.toString());
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}phút';
  }
}

class AppListItem extends StatelessWidget {
  final GlobalKey imageGlobalKey = GlobalKey();
  final int? index;
  final void Function(GlobalKey) onClick;

  AppListItem({Key? key, required this.onClick, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container iconContainer = Container(
      key: imageGlobalKey,
      width: 60,
      height: 60,
      child: Lottie.asset(
        // 'https://assets2.lottiefiles.com/packages/lf20_96cnyxkh.json',
          "assets/img/movie_icons.json",
          width: 60,
          height: 60),
    );
    return InkWell(
        onTap: () => onClick(imageGlobalKey),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(30.0)),
              color: Colors.green),
          child:
          Row(
            children: [
              const Expanded(
                  flex: 1,
                  child: SizedBox(width:10,)),
              Expanded(
                  flex: 3,
                  child: iconContainer),
              const Expanded(
                flex: 4,
                child: Text(
                  "Thêm vào giỏ phim",
                  // maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox(width:10,)),
            ],
          ),
        ),
    );
  }
}
