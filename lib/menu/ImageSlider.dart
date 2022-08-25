import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Image Slider"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Container(
              height: size.height * 0.35,
              width: size.width,
              child: Carousel(
                indicatorBarColor: Colors.black.withOpacity(0.2),
                autoScrollDuration: Duration(seconds: 2),
                animationPageDuration: Duration(milliseconds: 400),
                activateIndicatorColor: Colors.black,
                animationPageCurve: Curves.bounceInOut,
                indicatorBarHeight: 50,
                indicatorHeight: 20,
                indicatorWidth: 20,
                unActivatedIndicatorColor: Colors.grey,
                stopAtEnd: false,
                autoScroll: true,
                items: [
                  Container(
                    child: Image.network(
                        "https://images.theconversation.com/files/443350/original/file-20220131-15-1ndq1m6.jpg?ixlib=rb-1.1.0&rect=0%2C0%2C3354%2C2464&q=45&auto=format&w=926&fit=clip",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    child: Image.network(
                        "https://th.bing.com/th/id/R.4708b6b4f49e66f2b567ec12b3b8961c?rik=5pV75wHmp9Ce2A&pid=ImgRaw&r=0",
                        fit: BoxFit.cover),
                  ),
                  Container(
                    child: Image.network(
                        "https://th.bing.com/th/id/R.7f3a5fe5501ffa049512a1742844e253?rik=SB6JNLcpRvUS7A&pid=ImgRaw&r=0",
                        fit: BoxFit.cover),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
