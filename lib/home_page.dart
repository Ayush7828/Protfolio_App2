import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/routes.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
  my_achieve(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins"),
        ),
        Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              type,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: "Poppins"),
            ))
      ],
    );
  }

  mycards(icon, text) {
    return SizedBox(
      height: 115,
      width: 105,
      child: Card(
          margin: const EdgeInsets.all(0.0),
          color: const Color(0xff252525),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white, fontFamily: "Poppins", fontSize: 16.0),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.38, 0.8, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          child: Stack(children: [
            Container(
              margin: const EdgeInsets.only(top: 35),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black, Colors.transparent])
                      .createShader(
                          Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.about);
                  },
                  child: Image.asset(
                    "assets/images/img.jpg",
                    height: 400,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.5,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Text(
                      "Ayush Singh",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40.0),
                    ),
                  ),
                  const Text(
                    "Software Developer",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: Colors.white,
                        fontSize: 16.0),
                  )
                ],
              ),
            )
          ]),
        ),
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(left: 30, right: 40, top: 20),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    my_achieve('10', 'Projects'),
                    my_achieve('6', ' Languages'),
                    my_achieve('32', ' Message')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Specialized In",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mycards(Icons.android, 'Android'),
                        mycards(Icons.javascript, 'Javascript'),
                        mycards(FontAwesomeIcons.python, 'Python'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mycards(FontAwesomeIcons.github, 'Github'),
                        mycards(FontAwesomeIcons.c, 'C-Language'),
                        mycards(FontAwesomeIcons.java, 'JAVA'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.project);
                    },
                    style: TextButton.styleFrom(
                        shadowColor: Colors.red,
                        elevation: 8.0,
                        backgroundColor: Colors.black,
                        primary: Colors.white),
                    child: const Text(
                      "Project List",
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
