import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rel8/services/ProviderService.dart';
import 'package:rel8/widgets/BackBoardWidget.dart';
import 'package:rel8/widgets/PaintWidget.dart';
import 'package:rel8/widgets/ProductCard.dart';
import 'package:url_launcher/url_launcher.dart';

class WrapperPage extends StatefulWidget {
  @override
  _WrapperPageState createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  bool mainAreaOpen = true;
  bool initFinal = false;
  bool fadeOut = false;
  bool initLogo = false;
  bool floatLogo = false;
  int currentIndex = 0;
  String selectedItem = "";
  String selectedItem2 = "store";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  initFadeDelay() {
    // if (initFinal) {
    //   setState(() {
    //     initFinal = false;
    //   });
    // }
    Timer(
      Duration(milliseconds: 300),
      () {
        setState(() {
          fadeOut = true;
        });
        Timer(Duration(milliseconds: 300), () {
          setState(() {
            fadeOut = false;
          });
        });
      },
    );
  }

  initLogoDelay() {
    // if (initFinal) {
    //   setState(() {
    //     initFinal = false;
    //   });
    // }
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        initLogo = true;
      });
    });
  }

  initFinalDelay() {
    // if (initFinal) {
    //   setState(() {
    //     initFinal = false;
    //   });
    // }
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        initFinal = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 1400), () {
      setState(() {
        initLogoDelay();
      });
    });
    // Timer.periodic(Duration(milliseconds: 300), (timer) {
    //   setState(() {
    //     floatLogo = !floatLogo;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              BackBoardWidget(
                imageUrl:
                    "https://scontent.fjnb11-1.fna.fbcdn.net/v/t1.0-9/118232050_3174078942647044_4357220624167900834_n.jpg?_nc_cat=100&ccb=3&_nc_sid=7aed08&_nc_ohc=-kv1EoliB8cAX_OczUR&_nc_ht=scontent.fjnb11-1.fna&oh=d73595cd42bca5ce048bc944e9a4ba2d&oe=60588AE7",
              ),
              BackBoardWidget(
                imageUrl:
                    "https://scontent.fjnb11-1.fna.fbcdn.net/v/t1.0-9/118211124_3174074869314118_1072380797488246898_o.jpg?_nc_cat=106&ccb=3&_nc_sid=dd9801&_nc_ohc=lH4lDZaAlHgAX-SZ1ET&_nc_ht=scontent.fjnb11-1.fna&oh=309fbda7adf0a64f32c4dfc74c3fdce2&oe=6058DDF7",
              ),
              BackBoardWidget(
                imageUrl:
                    "https://scontent.fjnb11-1.fna.fbcdn.net/v/t1.0-9/147220250_3638208749567392_7336709165466713780_n.jpg?_nc_cat=100&ccb=3&_nc_sid=85a577&_nc_ohc=6eW97inCGh4AX_2C6Ih&_nc_ht=scontent.fjnb11-1.fna&oh=eacee24270d31f9a3ecddd7e83a5a5d8&oe=60583C73",
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      color: Colors.black54,
                      height: (settings.lock) ? 70 : 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 100),
                                    padding: EdgeInsets.only(
                                      bottom: (floatLogo) ? 5 : 0,
                                    ),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () {
                                          settings.switchLock();
                                          settings.switchPoster("");

                                          if (settings.dialog &&
                                              settings.lock) {
                                            settings.switchDialog();
                                          }

                                          nameController.clear();
                                          commentController.clear();
                                          emailController.clear();
                                        },
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 200),
                                          opacity: (initLogo) ? 1 : 0,
                                          child: Image.asset(
                                            "assets/images/logo.png",
                                            fit: BoxFit.cover,
                                            width: 100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                  duration: Duration(milliseconds: 100),
                                  opacity: (settings.lock) ? 0 : 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 50),
                                      height: (settings.lock) ? 0 : 12,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          selectedItem2
                                              .split(" ")[0]
                                              .toUpperCase(),
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                              letterSpacing: 1,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: Duration(
                                milliseconds: (settings.lock) ? 10 : 400),
                            opacity: (settings.lock) ? 0 : 1,
                            child: Padding(
                              padding:
                                  EdgeInsets.all((settings.lock) ? 0 : 0.0),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: (settings.lock) ? 0 : 300,
                                width: (settings.lock) ? 0 : 200,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        height: (mainAreaOpen) ? 50 : 100,
                                      ),
                                      Center(
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              settings.switchPoster("");
                                              if (currentIndex == 0) {
                                                initFadeDelay();
                                                setState(() {
                                                  mainAreaOpen = false;
                                                  currentIndex = -1;
                                                  selectedItem = "";
                                                });
                                              } else {
                                                setState(() {
                                                  fadeOut = false;
                                                  mainAreaOpen = true;
                                                  currentIndex = 0;
                                                  selectedItem =
                                                      "Hoodie Custom";
                                                });
                                              }

                                              initFinalDelay();
                                            },
                                            child: AnimatedContainer(
                                              height: (mainAreaOpen &&
                                                      currentIndex == 0)
                                                  ? 200
                                                  : 90,
                                              // width:
                                              //     (mainAreaOpen && currentIndex == 0) ? 150 : 50,

                                              duration:
                                                  Duration(milliseconds: 200),
                                              // padding: EdgeInsets.all((mainAreaOpen) ? 80.0 : 120.0),
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    (currentIndex != 0)
                                                        ? Colors.white
                                                        : Colors.lime,
                                                    BlendMode.modulate),
                                                child: Image.asset(
                                                  "assets/images/hoodie.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  (mainAreaOpen) ? 1.0 : 1.0),
                                              child: AnimatedContainer(
                                                height: (currentIndex == 0 ||
                                                        currentIndex == 1)
                                                    ? 100
                                                    : 20,
                                                width: 2.5,
                                                duration: Duration(
                                                    milliseconds: (mainAreaOpen)
                                                        ? 300
                                                        : 600),
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  (mainAreaOpen) ? 1.0 : 1.0),
                                              child: AnimatedContainer(
                                                height: (currentIndex == 0 ||
                                                        currentIndex == 1)
                                                    ? 100
                                                    : 20,
                                                width: 2.5,
                                                duration:
                                                    Duration(milliseconds: 600),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              settings.switchPoster("");

                                              if (currentIndex == 1) {
                                                initFadeDelay();
                                                setState(() {
                                                  mainAreaOpen = false;
                                                  currentIndex = -1;
                                                  selectedItem = "";
                                                });
                                              } else {
                                                setState(() {
                                                  fadeOut = false;
                                                  mainAreaOpen = true;
                                                  currentIndex = 1;
                                                  selectedItem = "Shoe Custom";
                                                });
                                              }
                                              initFinalDelay();
                                            },
                                            child: AnimatedContainer(
                                              width: (mainAreaOpen &&
                                                      currentIndex == 1)
                                                  ? 200
                                                  : 70,
                                              duration:
                                                  Duration(milliseconds: 200),
                                              // padding: EdgeInsets.all((mainAreaOpen) ? 80.0 : 120.0),
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    (currentIndex != 1)
                                                        ? Colors.white
                                                        : Colors.grey,
                                                    BlendMode.modulate),
                                                child: Image.asset(
                                                  "assets/images/shoe.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  (mainAreaOpen) ? 1.0 : 1.0),
                                              child: AnimatedContainer(
                                                height: (currentIndex == 1 ||
                                                        currentIndex == 2)
                                                    ? 100
                                                    : 20,
                                                width: 2.5,
                                                duration:
                                                    Duration(milliseconds: 600),
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  (mainAreaOpen) ? 1.0 : 1.0),
                                              child: AnimatedContainer(
                                                height: (currentIndex == 1 ||
                                                        currentIndex == 2)
                                                    ? 100
                                                    : 20,
                                                width: 2.5,
                                                duration: Duration(
                                                    milliseconds: (mainAreaOpen)
                                                        ? 300
                                                        : 600),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (currentIndex == 2) {
                                                settings.switchPoster("");

                                                initFadeDelay();
                                                setState(() {
                                                  mainAreaOpen = false;
                                                  currentIndex = -1;
                                                  selectedItem = "";
                                                });
                                              } else {
                                                setState(() {
                                                  fadeOut = false;
                                                  mainAreaOpen = true;
                                                  currentIndex = 2;
                                                  selectedItem = "Cap Custom";
                                                });
                                              }
                                              initFinalDelay();
                                            },
                                            child: AnimatedContainer(
                                              height: (mainAreaOpen &&
                                                      currentIndex == 2)
                                                  ? 110
                                                  : 50,
                                              duration:
                                                  Duration(milliseconds: 200),
                                              // padding: EdgeInsets.all((mainAreaOpen) ? 80.0 : 120.0),
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                    (currentIndex != 2)
                                                        ? Colors.white
                                                        : Colors.pink,
                                                    BlendMode.modulate),
                                                child: Image.asset(
                                                  "assets/images/cap.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        height: (mainAreaOpen) ? 80 : 100,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: AnimatedOpacity(
              //     duration: Duration(milliseconds: 400),
              //     opacity: (mainAreaOpen) ? 1 : 0,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             selectedItem,
              //             style:
              //                 GoogleFonts.montserrat(fontWeight: FontWeight.w500),
              //           ),
              //         ),
              //         ClipRRect(
              //           borderRadius: BorderRadius.circular(5),
              //           child: AnimatedContainer(
              //             height: (mainAreaOpen) ? 200 : 200,
              //             width: (mainAreaOpen) ? 425 : 0,
              //             duration: Duration(milliseconds: 200),
              //             padding: EdgeInsets.all((mainAreaOpen) ? 80.0 : 40.0),
              //             color: Colors.grey[300],
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: MouseRegion(
              //                     cursor: SystemMouseCursors.click,
              //                     child: GestureDetector(
              //                       onTap: () {},
              //                       child: ClipRRect(
              //                         borderRadius: BorderRadius.circular(50),
              //                         child: AnimatedContainer(
              //                           duration: Duration(milliseconds: 100),
              //                           color: Colors.red,
              //                           width: (mainAreaOpen) ? 50 : 0,
              //                           height: (mainAreaOpen) ? 50 : 0,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: MouseRegion(
              //                     cursor: SystemMouseCursors.click,
              //                     child: GestureDetector(
              //                       onTap: () {},
              //                       child: ClipRRect(
              //                         borderRadius: BorderRadius.circular(50),
              //                         child: AnimatedContainer(
              //                           duration: Duration(milliseconds: 100),
              //                           color: Colors.lightBlue,
              //                           width: (mainAreaOpen) ? 50 : 0,
              //                           height: (mainAreaOpen) ? 50 : 0,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: MouseRegion(
              //                     cursor: SystemMouseCursors.click,
              //                     child: GestureDetector(
              //                       onTap: () {},
              //                       child: ClipRRect(
              //                         borderRadius: BorderRadius.circular(50),
              //                         child: AnimatedContainer(
              //                           duration: Duration(milliseconds: 100),
              //                           color: Colors.pink,
              //                           width: (mainAreaOpen) ? 50 : 0,
              //                           height: (mainAreaOpen) ? 50 : 0,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: MouseRegion(
              //                     cursor: SystemMouseCursors.click,
              //                     child: GestureDetector(
              //                       onTap: () {},
              //                       child: ClipRRect(
              //                         borderRadius: BorderRadius.circular(50),
              //                         child: AnimatedContainer(
              //                           duration: Duration(milliseconds: 100),
              //                           color: Colors.black,
              //                           width: (mainAreaOpen) ? 50 : 0,
              //                           height: (mainAreaOpen) ? 50 : 0,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),

          (settings.posterUrl.isEmpty)
              ? IgnorePointer(ignoring: true, child: Container())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 15.0,
                              ),
                              width: 650,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 200),
                                      color: Colors.black12,
                                      // width: Image.network(
                                      //   settings.posterUrl,
                                      //   fit: BoxFit.cover,
                                      // ).width,
                                      // height: Image.network(
                                      //   settings.posterUrl,
                                      //   fit: BoxFit.cover,
                                      // ).height,
                                      child: Image.network(
                                        settings.posterUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
          Row(
            children: [
              IgnorePointer(
                ignoring: true,
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    // width: (MediaQuery.of(context).size.width / 1.68),
                    // height: MediaQuery.of(context).size.height - 200,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 0.0,
                              sigmaY: 0.0,
                            ),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Colors.transparent,
                              width: 1000,
                              height: 500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              (settings.lock || currentIndex == -1)
                  ? IgnorePointer(ignoring: true, child: Container())
                  : AnimatedOpacity(
                      duration:
                          Duration(milliseconds: (settings.lock) ? 10 : 100),
                      opacity: (settings.lock || currentIndex == -1) ? 0 : 1,
                      child: Center(
                        child: AnimatedContainer(
                          duration:
                              Duration(milliseconds: (settings.lock) ? 0 : 200),
                          padding: EdgeInsets.only(
                              bottom: (settings.lock) ? 0 : 80.0),
                          width: 650,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 0.0,
                                    sigmaY: 0.0,
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 200),
                                    color: Colors.transparent,
                                    width: (MediaQuery.of(context).size.width /
                                        2.6),
                                    height: MediaQuery.of(context).size.height,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ProductCard(
                                          imageUrl: (selectedItem ==
                                                  "Cap Custom")
                                              ? "https://scontent.fjnb11-1.fna.fbcdn.net/v/t1.0-9/145850251_3633348520053415_4077174375357448516_n.jpg?_nc_cat=106&ccb=3&_nc_sid=110474&_nc_ohc=-innLa1JtRcAX9cwQ_U&_nc_ht=scontent.fjnb11-1.fna&oh=af377539f7109c111b2da637b87291da&oe=605841A9"
                                              : (selectedItem == "Shoe Custom")
                                                  ? "https://cdnb.artstation.com/p/assets/images/images/007/318/209/large/kenneth-chan-15252658-10211213548359581-7533981308333005585-o.jpg?1505300293"
                                                  : "https://scontent.fjnb11-1.fna.fbcdn.net/v/t1.0-9/100089057_2926971794024428_2951250983188955136_n.jpg?_nc_cat=107&ccb=3&_nc_sid=110474&_nc_ohc=57sgkKaZIDIAX_rjKFQ&_nc_ht=scontent.fjnb11-1.fna&oh=cfbeaf76a5adb5046575a4f6a487b122&oe=60579547",
                                        ),
                                        ProductCard(
                                          imageUrl: (selectedItem ==
                                                  "Cap Custom")
                                              ? "https://scontent.fjnb11-1.fna.fbcdn.net/v/t1.0-9/121730687_3341550482566555_1659229358526294190_o.jpg?_nc_cat=105&ccb=3&_nc_sid=110474&_nc_ohc=c-7eIy8REm4AX9qwmIk&_nc_ht=scontent.fjnb11-1.fna&oh=50272fba58b8655488bb1e8d9c14d421&oe=60588EEC"
                                              : (selectedItem == "Shoe Custom")
                                                  ? "https://cdnb.artstation.com/p/assets/images/images/007/318/209/large/kenneth-chan-15252658-10211213548359581-7533981308333005585-o.jpg?1505300293"
                                                  : "https://scontent.fjnb11-1.fna.fbcdn.net/v/t1.0-9/118646908_3203943446327260_1703203855143175467_n.jpg?_nc_cat=111&ccb=3&_nc_sid=110474&_nc_ohc=KOkVBEnTl1oAX_-a1bM&_nc_ht=scontent.fjnb11-1.fna&oh=2fda2e681050effbf2733fc316f10103&oe=605903E7",
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
          (!settings.merch)
              ? IgnorePointer(ignoring: true, child: Container())
              : Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        settings.switchMerch();
                      },
                      child: ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            color: Colors.white12,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 30.0,
                            sigmaY: 30.0,
                          ),
                          child: Container(
                            width: 600,
                            height: 610,
                            color: Colors.black54,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  child: Stack(
                                    children: [
                                      ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          settings.base,
                                          BlendMode.modulate,
                                        ),
                                        child: Image.asset(
                                          "assets/images/hoodie.png",
                                          fit: BoxFit.cover,
                                          width: 200,
                                        ),
                                      ),
                                      Container(
                                        height: 115,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: ColorFiltered(
                                                colorFilter: ColorFilter.mode(
                                                  settings.accent,
                                                  BlendMode.modulate,
                                                ),
                                                child: Image.asset(
                                                  "assets/images/logo.png",
                                                  fit: BoxFit.cover,
                                                  width: 80,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  height: 270,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "BASE",
                                            style: GoogleFonts.oswald(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 13,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Opacity(
                                            opacity: 0.6,
                                            child: Container(
                                              width: 150,
                                              height: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PaintWidget(
                                              chosenColor: Colors.grey[800],
                                              type: "base",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.green,
                                              type: "base",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.pink,
                                              type: "base",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.yellow,
                                              type: "base",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.deepOrange,
                                              type: "base",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.lightBlue,
                                              type: "base",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Opacity(
                                            opacity: 0.6,
                                            child: Container(
                                              width: 150,
                                              height: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Text(
                                            "ACCENTS",
                                            style: GoogleFonts.oswald(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 13,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Opacity(
                                            opacity: 0.6,
                                            child: Container(
                                              width: 150,
                                              height: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            PaintWidget(
                                              chosenColor: Colors.black,
                                              type: "accent",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.white,
                                              type: "accent",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.red[700],
                                              type: "accent",
                                            ),
                                            PaintWidget(
                                              chosenColor:
                                                  Colors.deepPurple[900],
                                              type: "accent",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.blue[900],
                                              type: "accent",
                                            ),
                                            PaintWidget(
                                              chosenColor: Colors.brown[900],
                                              type: "accent",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Opacity(
                                            opacity: 0.6,
                                            child: Container(
                                              width: 150,
                                              height: 1,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        settings.switchSize(
                                                            "small");
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                          color: (settings
                                                                      .size ==
                                                                  "small")
                                                              ? Colors.white60
                                                              : Colors.white30,
                                                          width: 80,
                                                          height: 20,
                                                          child: Center(
                                                            child: Text(
                                                              "Small",
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                color: (settings
                                                                            .size ==
                                                                        "small")
                                                                    ? Colors.grey[
                                                                        800]
                                                                    : Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                letterSpacing:
                                                                    1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        settings.switchSize(
                                                            "medium");
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                          color: (settings
                                                                      .size ==
                                                                  "medium")
                                                              ? Colors.white60
                                                              : Colors.white30,
                                                          width: 80,
                                                          height: 20,
                                                          child: Center(
                                                            child: Text(
                                                              "Medium",
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                color: (settings
                                                                            .size ==
                                                                        "medium")
                                                                    ? Colors.grey[
                                                                        800]
                                                                    : Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                letterSpacing:
                                                                    1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: MouseRegion(
                                                    cursor: SystemMouseCursors
                                                        .click,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        settings.switchSize(
                                                            "large");
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child:
                                                            AnimatedContainer(
                                                          duration: Duration(
                                                              milliseconds:
                                                                  150),
                                                          color: (settings
                                                                      .size ==
                                                                  "large")
                                                              ? Colors.white60
                                                              : Colors.white30,
                                                          width: 80,
                                                          height: 20,
                                                          child: Center(
                                                            child: Text(
                                                              "Large",
                                                              style: GoogleFonts
                                                                  .oswald(
                                                                color: (settings
                                                                            .size ==
                                                                        "large")
                                                                    ? Colors.grey[
                                                                        800]
                                                                    : Colors
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 13,
                                                                letterSpacing:
                                                                    1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 110,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              2.0),
                                                      child: MouseRegion(
                                                        cursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        child: GestureDetector(
                                                          onTap: () {},
                                                          child: Icon(
                                                            Icons.shopping_cart,
                                                            color: Colors
                                                                .lime[200],
                                                            size: 18,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          // ColorFiltered(
          //   colorFilter: ColorFilter.mode(Colors.pink, BlendMode.modulate),
          //   child: Center(
          //     child: Image.asset(
          //       "images/hoodie.png",
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 200),
              opacity: (settings.dialog) ? 1.0 : 0.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                        child: AnimatedContainer(
                          duration: Duration(
                              milliseconds: (settings.dialog) ? 50 : 200),
                          width: (settings.dialog) ? 400 : 0,
                          height: 184,
                          color: Colors.black54,
                          child: Container(
                            width: 215,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 156,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(00),
                                          ),
                                          child: TextFormField(
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                            controller: nameController,
                                            onChanged: (value) {},
                                            autocorrect: true,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Colors.black45,
                                              filled: true,
                                              hintText: 'First name..',
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Container(
                                        width: 200,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                          ),
                                          child: TextFormField(
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                            controller: emailController,
                                            onChanged: (value) {},
                                            autocorrect: true,
                                            maxLines: 1,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Colors.black45,
                                              filled: true,
                                              hintText: 'Email..',
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    child: TextFormField(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                      controller: commentController,
                                      onChanged: (value) {},
                                      autocorrect: true,
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.black45,
                                        filled: true,
                                        hintText:
                                            'Any new ideas? What\'s on your mind?',
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                color: Colors.black54,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.cover,
                                width: 50,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: GestureDetector(
                                onTap: () {
                                  settings.switchDialog();

                                  nameController.clear();
                                  commentController.clear();
                                  emailController.clear();
                                },
                                child: Icon(
                                  (settings.dialog)
                                      ? Icons.clear
                                      : Icons.chat_bubble,
                                  color: (settings.dialog)
                                      ? Colors.red[100]
                                      : Colors.lightBlue[100],
                                  size: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            IgnorePointer(
                              ignoring: (settings.dialog) ? false : true,
                              child: AnimatedOpacity(
                                duration: Duration(
                                  milliseconds: 200,
                                ),
                                opacity: (settings.dialog) ? 0.50 : 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      settings.switchDialog();

                                      nameController.clear();
                                      commentController.clear();
                                      emailController.clear();
                                      // send firestore data
                                    },
                                    child: Icon(
                                      Icons.send,
                                      color: Colors.lime,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 100),
                            width: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4.0),
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () async {
                                        const url =
                                            'https://www.facebook.com/Relate8';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Image.asset(
                                        "assets/images/facebook.png",
                                        width: 18,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4.0),
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () async {
                                        const url =
                                            'https://www.instagram.com/relate8';
                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        } else {
                                          throw 'Could not launch $url';
                                        }
                                      },
                                      child: Image.asset(
                                        "assets/images/instagram.png",
                                        width: 18,
                                        fit: BoxFit.cover,
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
                    Center(
                      child: Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            (selectedItem2 == "home")
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 50),
                                      height: 12,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          "HOME",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              letterSpacing: 1,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  )
                                : MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedItem2 = "home";
                                        });
                                      },
                                      child: Text(
                                        "HOME",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                            Text(
                              "|",
                              // textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.red,
                                  letterSpacing: 1,
                                  fontSize: 20),
                            ),
                            (selectedItem2 == "events")
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 50),
                                      height: 12,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          "EVENTS",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              letterSpacing: 1,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  )
                                : MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedItem2 = "events";
                                        });
                                      },
                                      child: Text(
                                        "EVENTS",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontSize: 10),
                                      ),
                                    ),
                                  ),
                            Text(
                              "|",
                              // textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w200,
                                  color: Colors.red,
                                  letterSpacing: 1,
                                  fontSize: 20),
                            ),
                            (selectedItem2 == "store")
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(2),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 50),
                                      height: 12,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          "STORE",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                              letterSpacing: 1,
                                              fontSize: 10),
                                        ),
                                      ),
                                    ),
                                  )
                                : MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(
                                          () {
                                            selectedItem2 = "store";
                                          },
                                        );
                                      },
                                      child: Text(
                                        "STORE",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            letterSpacing: 1,
                                            fontSize: 10),
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
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
