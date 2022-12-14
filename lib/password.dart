import 'dart:async';
import 'package:astro_coin/samplepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  State<PasswordPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PasswordPage> {
  var _imageUrl = "assets/passcode/shapepass.png";
  var _imageUrl1 = "assets/passcode/shapepass.png";
  var _imageUrl2 = "assets/passcode/shapepass.png";
  var _imageUrl3 = "assets/passcode/shapepass.png";
  final _imageUrls = "assets/passcode/shapepass.png";
  final _imageUrlb = "assets/passcode/shapenumbersouc.png";
  final _imgerror = "assets/passcode/shapepasserr.png";

  var index = 0;
  var index1 = 0;
  var included = '';
  var includedpass = '';
  var textpass = '';
  var textism = 'Guest';

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getString('password') != null) {
        setState(() {
          includedpass = prefs.getString('password')!;
        });
      } else {
        includedpass = "0";
      }
      if (includedpass == '0') {
        setState(() {
          index1 = 1;
          textpass = 'Create new password';
        });
      } else {
        setState(() {
          textpass = 'Enter password';
        });
        index1 = 0;
      }
    });
  }

  void _onback() {
    included = included.substring(0, index);
    if (index == -1) {
      index++;
    }
    if (index == 0) {
      setState(() {
        _imageUrl = _imageUrls;
      });
    }
    if (index == 1) {
      setState(() {
        _imageUrl1 = _imageUrls;
      });
    }
    if (index == 2) {
      setState(() {
        _imageUrl2 = _imageUrls;
      });
    }
    if (index == 3) {
      setState(() {
        _imageUrl3 = _imageUrls;
      });
    } else {
      index == 4;
    }
  }

  void _onclick() {
    if (index == -1) {
      index = 0;
      _imageUrl = _imageUrlb;
    }
    if (index == 5) {
      index = 4;
    }
    if (index == 1) {
      setState(() {
        _imageUrl = _imageUrlb;
      });
    }
    if (index == 2) {
      setState(() {
        _imageUrl1 = _imageUrlb;
      });
    }
    if (index == 3) {
      setState(() {
        _imageUrl2 = _imageUrlb;
      });
    }
    if (index == 4) {
      setState(() {
        included = included.substring(0, index);
        _imageUrl3 = _imageUrlb;
        if (index1 == 1) {
          SharedPreferences.getInstance().then((prefs) {
            prefs.setString('password', included);
          });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const PasswordPage();
          }));
        } else {
          if (included == includedpass) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                  return const SamplePage();
                }));
          } else {
            Timer(
              const Duration(seconds: 1),
              () {
                setState(() {
                  _imageUrl = _imgerror;
                  _imageUrl1 = _imgerror;
                  _imageUrl2 = _imgerror;
                  _imageUrl3 = _imgerror;
                });
              },
            );
            Timer(
              const Duration(seconds: 2),
              () {
                setState(() {
                  included = '';
                  index = 0;
                  _imageUrl = _imageUrls;
                  _imageUrl1 = _imageUrls;
                  _imageUrl2 = _imageUrls;
                  _imageUrl3 = _imageUrls;
                });
              },
            );

            Fluttertoast.showToast(
                msg: "Password is incorrect",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }
      });
    } else {
      index == 4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/svgs/valletimg.svg',
              height: 40,
              width: 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text('Hello, $textism',
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Text(textpass,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              children: [
                const Expanded(child: Text(" ")),
                SizedBox(
                  //image
                  child: Image.asset(_imageUrl),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  //image
                  child: Image.asset(_imageUrl1),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  //image
                  child: Image.asset(_imageUrl2),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  //image
                  child: Image.asset(_imageUrl3),
                ),
                const Expanded(child: Text(" ")),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Row(
              children: [
                const Expanded(child: Text(" ")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}1';
                          index++;
                          _onclick();
                        },
                        child: const Text('1',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}2';
                          index++;
                          _onclick();
                        },
                        child: const Text('2',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            included = '${included}3';
                            index++;
                            _onclick();
                          });
                        },
                        child: const Text('3',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                const Expanded(child: Text(" ")),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            Row(
              children: [
                const Expanded(child: Text(" ")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}4';
                          index++;
                          _onclick();
                        },
                        child: const Text('4',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}5';
                          index++;
                          _onclick();
                        },
                        child: const Text('5',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}6';
                          index++;
                          _onclick();
                        },
                        child: const Text('6',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                const Expanded(child: Text(" ")),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            Row(
              children: [
                const Expanded(child: Text(" ")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}7';
                          index++;
                          _onclick();
                        },
                        child: const Text('7',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}8';
                          index++;
                          _onclick();
                        },
                        child: const Text('8',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}9';
                          index++;
                          _onclick();
                        },
                        child: const Text('9',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                const Expanded(child: Text(" ")),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.026,
            ),
            Row(
              children: [
                const Expanded(child: Text(" ")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.fingerprint),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: TextButton(
                        onPressed: () {
                          included = '${included}0';
                          index++;
                          _onclick();
                        },
                        child: const Text('0',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.045,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.height * 0.06,
                  child: Ink(
                    decoration: const ShapeDecoration(
                      //radius: 10,
                      color: Color.fromRGBO(232, 236, 242, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        if (index == 0) {
                          index++;
                        }
                        index--;
                        _onback();
                      },
                    ),
                  ),
                ),
                const Expanded(child: Text(" ")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
