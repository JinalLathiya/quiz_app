
import 'package:flutter/material.dart';

import 'list.dart';
import 'model class.dart';


class quiz_app extends StatefulWidget {
  const quiz_app({Key? key}) : super(key: key);

  @override
  _quiz_appState createState() => _quiz_appState();
}

class _quiz_appState extends State<quiz_app> {
  int Index = 0;
  List a = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 20,
                child: IndexedStack(
                  alignment: Alignment.center,
                  index: Index,
                  children: questionBank
                      .map(
                        (e) => d_button(e),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Row(
                        children: [
                          // Text(
                          //   "✅",
                          //   style: TextStyle(
                          //     color: Colors.green,
                          //   ),
                          // ),

                          SizedBox(width: 10),
                          Text(
                            "$a",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget d_button(Q_Bank q) {
    return (q.id <= 10)
        ? Column(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  "Question :",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  q.title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                child: Text(
                  "True",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.4,
                      vertical: 20,
                    )),
                onPressed: () {
                  setState(() {
                    if (Index <= 9 && q.id <= 10) {
                      ++Index;
                      if (q.ans == true) {
                        a.add(
                          "✅",
                        );
                      } else {
                        a.add("❌");
                      }
                    }
                  });
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                child: Text(
                  "False",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.387,
                    vertical: 20,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (Index <= 9 && q.id <= 10) {
                      ++Index;
                      if (q.ans == true) {
                        a.add("❌");
                      } else {
                        a.add("✅");
                      }
                    }
                  });
                },
              ),
            ],
          )
        : Container(
      alignment: Alignment.center,
            child: Text(
              "Quiz End",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}
