import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rel8/services/ProviderService.dart';

class BackBoardWidget extends StatefulWidget {
  String imageUrl;
  BackBoardWidget({this.imageUrl});
  @override
  _BackBoardWidgetState createState() => _BackBoardWidgetState();
}

class _BackBoardWidgetState extends State<BackBoardWidget> {
  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<Settings>(context, listen: true);
    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: (settings.lock) ? 0.6 : 0.1,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   padding: EdgeInsets.only(top: 200),
          //   width: MediaQuery.of(context).size.width / 3,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(right: 10.0),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(5),
          //           child: BackdropFilter(
          //             filter: ImageFilter.blur(
          //               sigmaX: 2.0,
          //               sigmaY: 2.0,
          //             ),
          //             child: Opacity(
          //               opacity: 0.8,
          //               child: Container(
          //                 width: 100,
          //                 height: 40,
          //                 color: Colors.transparent,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: [
          //                     Icon(Icons.arrow_back_ios),
          //                     SizedBox(
          //                       width: 3,
          //                     ),
          //                     Icon(Icons.arrow_forward_ios),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
