import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smedia/pages/visit.dart';
import 'package:smedia/theme/colors.dart';
import 'package:smedia/theme/fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Icon> icons = [
    Icon(
      CupertinoIcons.person,
    ),
    Icon(CupertinoIcons.settings),
    Icon(CupertinoIcons.suit_heart),
    Icon(CupertinoIcons.play),
  ];
  List<String> date = [
    '2/10/2002',
    '2/4/2022',
    '6/7/2023',
    '2/10/2009',
    '5/7/2008',
    '5/7/2009',
    '2/9/2010',
    '2/6/2011'
  ];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'NOUR OTHMAN',
                            style: sub_W_font_sh,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Traviling is My Passion in Life!!',
                            style: small_W_font,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: color3,
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/wn.jpg'),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Main Board',
                  style: sub_W_font_sh,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: selectedindex == index ? color2 : color3,
                        ),
                        margin: EdgeInsets.only(right: 10),
                        width: 50,
                        height: 50,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            icon: icons[index],
                            color:
                                selectedindex != index ? color2 : Colors.white),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Your Posts',
                  style: sub_W_font_sh,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height / 2,
                  child: GridView.builder(
                    itemCount: 8,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.6,
                        crossAxisSpacing: 10,
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return Visit(image: AssetImage(
                                    'assets/images/${index + 1}.jpg'),date:date[index] ,);
                            },
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${index + 1}.jpg'),
                                fit: BoxFit.cover),
                            color: color3,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                date[index],
                                style: small_G_font,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
