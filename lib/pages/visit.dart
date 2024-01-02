import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:smedia/theme/colors.dart';
import 'package:smedia/theme/fonts.dart';

class Visit extends StatefulWidget {
  ImageProvider image;
  String date;
  Visit({required this.image, required this.date});

  @override
  State<Visit> createState() => _VisitState();
}

class _VisitState extends State<Visit> {
  List feeling = ['😂', '😍', '😖', '🥺', '😎', '😁'];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissiblePage(
        backgroundColor: color1,
        onDismissed: () {
          Navigator.of(context).pop();
        },
        direction: DismissiblePageDismissDirection.vertical,
        isFullScreen: true,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: widget.image, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Feeling',
                    style: sub_W_font_sh,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 50,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedindex = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedindex == index ? color2 : color3,
                            ),
                            margin: EdgeInsets.only(right: 10),
                            width: 50,
                            height: 50,
                            child: Text(feeling[index], textScaleFactor: 1.2),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: color4,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'published by you:',
                                style: small_W_font,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${widget.date}',
                                style: small_G_font,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'hey this is nour from gigo village!',
                                style: small_G_font,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/wn.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
