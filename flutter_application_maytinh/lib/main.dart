import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Máy Tính',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
  int SoThuNhat=0;
  int SoThuHai=0;
  String HienThi = '';
  String XuatKetQua="0";
  String PhepToan="";

  void btnclicked(String btnClick) {
    if (btnClick == 'C') {
      HienThi = '';
      SoThuNhat = 0;
      SoThuHai = 0;
      XuatKetQua = '';
    } 
    else if (
        btnClick  == '+' ||
        btnClick  == '-' ||
        btnClick  == 'x' ||
        btnClick  == '/') {
      SoThuNhat = int.parse(HienThi);
      XuatKetQua = '';
      PhepToan = btnClick ;
    } 
    else if (btnClick  == '=') {
      SoThuHai = int.parse(HienThi);
      if (PhepToan == '+') { 
        XuatKetQua = (SoThuNhat + SoThuHai).toString();
      }
      if (PhepToan == '-') {
        XuatKetQua = (SoThuNhat - SoThuHai).toString();
      }
      if (PhepToan == 'x') {
        XuatKetQua = (SoThuNhat * SoThuHai).toString();
      }
      if (PhepToan == '/') {
        XuatKetQua = (SoThuNhat / SoThuHai).toString();
      }
    } 
    else {
      XuatKetQua = int.parse(HienThi + btnClick).toString();
    }

    setState(() {
      HienThi = XuatKetQua;
    });
  }

  
  Widget custombutton(String btnClick) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(20),
        onPressed: () => btnclicked(btnClick),
        child: Text(
          '$btnClick',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Máy Tính Tay'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$HienThi',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton('9'),
                custombutton('8'),
                custombutton('7'),
                custombutton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('6'),
                custombutton('5'),
                custombutton('4'),
                custombutton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('3'),
                custombutton('2'),
                custombutton('1'),
                custombutton('x'),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton('C'),
                custombutton('0'),
                custombutton('='),
                custombutton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
