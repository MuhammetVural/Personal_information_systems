import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

class CounterScreen extends StatefulWidget {
  final String text1;
  const CounterScreen({Key? key, required this.text1}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {


  static const maxSeconds = 20;
  int seconds = maxSeconds;

  Timer? timer;
  void stopTimer(){
    timer?.cancel();
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if(seconds > 0){
        setState(() => seconds--);
      }
      else{
        stopTimer();
      }

    });

  }




  TextEditingController textEditingController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  bool isCodeCorrect = false;

  @override
  void dispose() {
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 75,
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 2, vertical: 2)),
              Text('PERSONNEL INFORMATION SYSTEM',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ],
          )),
      body: SingleChildScrollView(
        reverse: true,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Column(

            children: [
              Container(
                padding: EdgeInsets.all(50),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Please enter the verification code sent to your mobile phone number with ${widget.text1}'),
                    const SizedBox(
                      height: 50,
                    ),
                    Text('Kronometre'),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      child: TextFormField(
                        validator: (value) {
                          if (value != null && value.length > 5) {
                            return null;
                          } else {
                            return 'requared';
                          }
                        },
                        showCursor: true,

                        controller: textEditingController,
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "SMS Code",
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            floatingLabelStyle: TextStyle(
                                color: Colors.red),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2),
                            ),
                            contentPadding: EdgeInsets.all(20),
                            hoverColor: Colors.red,
                            fillColor: Colors.pink),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed:  () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) =>  HomePage()),
                        );
                      },
                      child: const Text(
                        'Continue',
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    ElevatedButton(
                      onPressed:  () {
                        startTimer();
                      },
                      child: const Text(
                        'Kronometreyi çalıştır',
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                ),
              ),

            ],
          ),

        ),
      ),
    );
  }
}
