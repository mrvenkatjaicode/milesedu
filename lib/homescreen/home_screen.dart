import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:milesedu/const/constant.dart';
import 'package:milesedu/homescreen/home_bloc.dart';
import 'package:milesedu/homescreen/home_event.dart';
import 'package:milesedu/homescreen/home_model.dart';
import 'package:milesedu/homescreen/home_state.dart';
import 'package:milesedu/homescreen/testimonal_model.dart';
import 'package:milesedu/youtube/youtube_screen.dart';
import 'package:milesedu/widgets/banners.dart';
import 'package:milesedu/widgets/cta.dart';
import 'package:milesedu/widgets/events.dart';
import 'package:milesedu/widgets/inshorts.dart';
import 'package:milesedu/widgets/masterclass.dart';
import 'package:milesedu/widgets/reels.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static HomeScreenJsonModel homeScreenJsonModel = HomeScreenJsonModel();
  static TestimonalsonModel testimonalsonModel = TestimonalsonModel();
  static List<Post>? bannerPosts = [];
  static List<Post>? reelPosts = [];
  static List<Post>? ctaPosts = [];
  static List<Post>? eventPosts = [];
  static List<Post>? inshortPosts = [];
  static List<Post>? masterclassPosts = [];

  static List<String>? imageList = [];

  static String bannerHeading = "";
  static String reelHeading = "";
  static String ctaHeading = "";
  static String eventHeading = "";
  static String inshortHeading = "";
  static String masterclassHeading = "";

  showbottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: blackColor,
            image: DecorationImage(
              image: AssetImage(bgsbimage),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.all(16),
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Thank you for showing interest in us !!",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Our SPOC will be connecting with you\nshortly on your provided contact details.",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(),
      child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is HomeScreenJsonSuccessState) {
            bannerPosts = [];
            reelPosts = [];
            ctaPosts = [];
            eventPosts = [];
            inshortPosts = [];
            masterclassPosts = [];
            imageList = [];
            homeScreenJsonModel = state.successJson;
            testimonalsonModel = state.testimonalsonModel;
            for (int i = 0; i < testimonalsonModel.data!.length; i++) {
              if (testimonalsonModel.data![i].imageUrl != null) {
                imageList!.add(
                    "${testimonalsonModel.data![i].imageUrl!.split("?").first} - ${testimonalsonModel.data![i].firstName} ${testimonalsonModel.data![i].lastName}");
              }
            }
            for (int i = 0; i < homeScreenJsonModel.data!.length; i++) {
              if (homeScreenJsonModel.data![i].blockType == "banners") {
                bannerHeading = homeScreenJsonModel.data![i].heading ?? "";
                debugPrint(homeScreenJsonModel.data![i].heading);
                for (int j = 0;
                    j < homeScreenJsonModel.data![i].posts!.length;
                    j++) {
                  bannerPosts!.add(homeScreenJsonModel.data![i].posts![j]);
                }
              } else if (homeScreenJsonModel.data![i].blockType == "reels") {
                reelHeading = homeScreenJsonModel.data![i].heading ?? "";
                debugPrint(homeScreenJsonModel.data![i].heading);
                for (int j = 0;
                    j < homeScreenJsonModel.data![i].posts!.length;
                    j++) {
                  reelPosts!.add(homeScreenJsonModel.data![i].posts![j]);
                }
              } else if (homeScreenJsonModel.data![i].blockType == "cta") {
                ctaHeading = homeScreenJsonModel.data![i].heading ?? "";
                debugPrint(homeScreenJsonModel.data![i].heading ?? "");
                for (int j = 0;
                    j < homeScreenJsonModel.data![i].posts!.length;
                    j++) {
                  ctaPosts!.add(homeScreenJsonModel.data![i].posts![j]);
                }
              } else if (homeScreenJsonModel.data![i].blockType == "events") {
                eventHeading = homeScreenJsonModel.data![i].heading ?? "";
                debugPrint(homeScreenJsonModel.data![i].heading);
                for (int j = 0;
                    j < homeScreenJsonModel.data![i].posts!.length;
                    j++) {
                  eventPosts!.add(homeScreenJsonModel.data![i].posts![j]);
                }
              } else if (homeScreenJsonModel.data![i].blockType == "inshorts") {
                inshortHeading = homeScreenJsonModel.data![i].heading ?? "";
                debugPrint(homeScreenJsonModel.data![i].heading);
                for (int j = 0;
                    j < homeScreenJsonModel.data![i].posts!.length;
                    j++) {
                  inshortPosts!.add(homeScreenJsonModel.data![i].posts![j]);
                }
              } else if (homeScreenJsonModel.data![i].blockType ==
                  "masterclass") {
                masterclassHeading = homeScreenJsonModel.data![i].heading ?? "";
                debugPrint(homeScreenJsonModel.data![i].heading);
                for (int j = 0;
                    j < homeScreenJsonModel.data![i].posts!.length;
                    j++) {
                  masterclassPosts!.add(homeScreenJsonModel.data![i].posts![j]);
                }
              }
            }
          }
        },
        builder: (context, state) {
          if (state is HomeScreenInitialState) {
            context.read<HomeScreenBloc>().add(GetJsonEvent());
          }
          if (state is HomeScreenLoadingState) {
            return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  leading: const Icon(
                    Icons.menu,
                  ),
                  title: SvgPicture.asset(
                    height: 30,
                    logo,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                ),
                body: Container(
                  decoration: BoxDecoration(
                    color: blackColor,
                    image: DecorationImage(
                      image: AssetImage(bgimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const Icon(
                Icons.menu,
              ),
              title: SvgPicture.asset(
                height: 30,
                logo,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<HomeScreenBloc>().add(GetJsonEvent());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: blackColor,
                  image: DecorationImage(
                    image: AssetImage(bgimage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Afternoon",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Atishay",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              showbottomSheet(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF140E4B),
                                  borderRadius: BorderRadius.circular(60)),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    left: 30, right: 30, top: 15, bottom: 15),
                                child: Text(
                                  "Talk to us!",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              for (int i = 0; i < imageList!.length; i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.pink,
                                              Colors.blue,
                                              Colors.purple,
                                              Colors.brown
                                            ],
                                          ),
                                        ),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      imageList![i]
                                                          .split(" - ")
                                                          .first),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        imageList![i].split(" - ").last,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: bannerPosts!.length,
                        itemBuilder: (context, i) {
                          return Banners(
                            bannerImageUrl: bannerPosts![i]
                                .files![0]
                                .imagePath!
                                .split("?")
                                .first,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            reelHeading,
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: reelPosts!.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return YouTubePlayerScreen(
                                      videoTitle: reelPosts![i].title ?? "",
                                      videoUrl:
                                          reelPosts![i].files![0].videoUrl ??
                                              "");
                                },
                              ));
                            },
                            child: Reels(
                              reelsImageUrl: reelPosts![i]
                                  .files![0]
                                  .thumbnail!
                                  .split("?")
                                  .first,
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.7,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ctaPosts!.length,
                        itemBuilder: (context, i) {
                          return Cta(
                            ctaImageUrl: ctaPosts![i]
                                .files![0]
                                .imagePath!
                                .split("?")
                                .first,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            eventHeading,
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < eventPosts!.length; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4.2,
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
                                  child: Events(
                                    eventsImageUrl: eventPosts![i]
                                        .files![0]
                                        .imagePath!
                                        .split("?")
                                        .first,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //EXPLORE THE MILES US PATHWAY
                      Row(
                        children: [
                          Text(
                            inshortHeading,
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // EXPLORE THE MILES US PATHWAY
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: inshortPosts!.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return YouTubePlayerScreen(
                                      videoTitle: inshortPosts![i].title ?? "",
                                      videoUrl:
                                          inshortPosts![i].files![0].videoUrl ??
                                              "");
                                },
                              ));
                            },
                            child: Inshorts(
                              inshortsImageUrl: inshortPosts![i]
                                  .files![0]
                                  .thumbnail!
                                  .split("?")
                                  .first,
                              inshortsTitle: inshortPosts![i].title,
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Text(
                            masterclassHeading,
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                            items: [
                              for (int i = 0; i < masterclassPosts!.length; i++)
                                MasterClass(
                                  masterClassImageUrl: masterclassPosts![i]
                                      .files![0]
                                      .imagePath!
                                      .split("?")
                                      .first,
                                ),
                            ],
                            options: CarouselOptions(
                              height: 400,
                              aspectRatio: 10 / 10,
                              viewportFraction: 0.7,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.4,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              //onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            )),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
