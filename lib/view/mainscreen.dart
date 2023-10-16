import 'package:flutter/material.dart';
import 'package:memes_app/controller/fetchmeme.dart';
import 'package:memes_app/controller/savemydata.dart';
import 'package:memes_app/view/splashscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imageUrl = " ";
  bool isLoading = true;
  int? memeNo;
  int targetMeme = 100;
  @override
  void initState() {
    // splashScreen();
    GetInitMemeNo();
    updateImg();
  }

  GetInitMemeNo() async {
    memeNo = await SaveMyData.fetchData() ?? 0;
    if (memeNo! > 100) {
      targetMeme = 500;
    } else if (memeNo! > 500) {
      targetMeme = 1000;
    }
    setState(() {});
  }

  void updateImg() async {
    String getImageUrl = await FetchMeme.fetchNewMeme();
    setState(() {
      imageUrl = getImageUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 120,
            ),
            Text('MEME #${memeNo.toString()}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Text('Target ${targetMeme} Memes'),
            SizedBox(
              height: 50,
            ),
            isLoading
                ? Container(
                    height: 350,
                    width: 350,
                    child: Center(
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Container(
                    height: 350, width: 350, child: Image.network(imageUrl)),
            SizedBox(height: 60),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await SaveMyData.saveData(memeNo! + 1);
                  GetInitMemeNo();
                  updateImg();
                },
                child: Container(
                    height: 30,
                    width: 100,
                    child: Center(child: Text('More Fun?')))),
            Spacer(),
            Text('App Created By', style: TextStyle(fontSize: 20)),
            SizedBox(height: 3),
            Text('Shazan Shaikh',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
