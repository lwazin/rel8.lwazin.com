import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rel8/services/ProviderService.dart';

class ProductCard extends StatefulWidget {
  String imageUrl = "";
  ProductCard({this.imageUrl});
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return Center(
      child: Container(
        width: 650,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 650,
                height: 210,
                child: Row(
                  children: [
                    AnimatedOpacity(
                      duration: Duration(
                        milliseconds: 200,
                      ),
                      opacity:
                          (settings.posterUrl != widget.imageUrl) ? 1 : 0.6,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            if (settings.posterUrl.isEmpty ||
                                settings.posterUrl != widget.imageUrl) {
                              settings.switchPoster(widget.imageUrl);
                              if (settings.merch) {
                                settings.switchMerch();
                              }
                            } else {
                              settings.switchPoster("");
                            }
                          },
                          child: Image.network(
                            widget.imageUrl,
                            fit: BoxFit.cover,
                            width: 200,
                            height: 210,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 10.0,
                            ),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              color: Colors.black54,
                              width: 414,
                              height: 210,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () {
                                              settings.switchMerch();
                                            },
                                            child: Icon(
                                              Icons.brush,
                                              color: Colors.white70,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
