import 'package:flutter/material.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        useMaterial3: true,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<IconData> iconList = [Icons.cloud, Icons.water_drop];

  TextEditingController weightCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  bool isDarkOn = false;
  String gender = "";
  double height = 160;
  double weight = 100;
  int age = 20;

  bool weightError = false;
  bool ageError = false;

  @override
  void initState() {
    super.initState();
    weightCtrl.text = "50.0";
    weight = 50;
    ageCtrl.text = "20";
    age = 20;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: isDarkOn ? Colors.black12 : null,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: isDarkOn ? Colors.black : null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isDarkOn = !isDarkOn;
                });
              },
              icon: isDarkOn
                  ? const Icon(
                      Icons.light_mode,
                      color: Colors.white,
                      size: 30,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                      size: 30,
                    ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // MALE + FEMALE
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // MALE
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "male";
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              color: isDarkOn ? darkBgColor : null,
                              border: gender == "male"
                                  ? Border.all(
                                      color: Colors.amberAccent, width: 3)
                                  : Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    gender = "male";
                                  });
                                },
                                icon: Icon(
                                  Icons.male,
                                  color: isDarkOn ? darkWhite70 : null,
                                  size: 100,
                                ),
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    color: isDarkOn ? darkSubText : null,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // FEMALE
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = "female";
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              color: isDarkOn ? darkBgColor : null,
                              border: gender == "female"
                                  ? Border.all(
                                      color: Colors.amberAccent, width: 3)
                                  : Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    gender = "female";
                                  });
                                },
                                icon: Icon(
                                  Icons.female,
                                  color: isDarkOn ? darkWhite70 : null,
                                  size: 100,
                                ),
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    color: isDarkOn ? darkSubText : null,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // HEIGHT BOX
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2, // 0.15
                    decoration: BoxDecoration(
                      color: darkBgColor,
                      border: isDarkOn
                          ? null
                          : Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT (cm)",
                          style: TextStyle(
                              color: isDarkOn ? darkWhite70 : null,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "$height",
                            style: TextStyle(
                                color: isDarkOn ? darkPrimartText : null,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Slider(
                          value: height,
                          min: 90,
                          max: 190,
                          onChanged: (newVal) {
                            setState(() {
                              height = double.parse(newVal.toStringAsFixed(1));
                            });
                          },
                          activeColor:
                              isDarkOn ? Colors.amber[50] : lightSliderActive,
                          thumbColor:
                              isDarkOn ? darkPrimaryColor : lightPrimaryColor,
                        )
                      ],
                    ),
                  ),
                ),
                // WEIGHT + AGE
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: darkBgColor,
                          border: weightError
                              ? Border.all(color: Colors.red, width: 2)
                              : Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT (kg)",
                              style: TextStyle(
                                  color: isDarkOn ? darkWhite70 : null,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextField(
                              controller: weightCtrl,
                              onChanged: (newVal) {
                                if (double.parse(newVal) < 1) {
                                  weightError = true;
                                } else {
                                  weightError = false;
                                }
                                setState(() {});
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                              ),
                              style: TextStyle(
                                height: 1.1,
                                color: isDarkOn ? darkPrimartText : null,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDarkOn ? darkBtnBg : lightBtnBg,
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      double weight =
                                          double.parse(weightCtrl.text);
                                      if (weight > 1) {
                                        setState(() {
                                          weight--;
                                          weightCtrl.text = "$weight";
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDarkOn ? darkBtnBg : lightBtnBg,
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      double weight =
                                          double.parse(weightCtrl.text);
                                      setState(() {
                                        weight++;
                                        weightCtrl.text = "$weight";
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.43,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: darkBgColor,
                          border: ageError
                              ? Border.all(color: Colors.red, width: 2)
                              : Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: TextStyle(
                                  color: isDarkOn ? darkWhite70 : null,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextField(
                              controller: ageCtrl,
                              onChanged: (newVal) {
                                if (int.parse(newVal) < 1) {
                                  ageError = true;
                                } else {
                                  ageError = false;
                                }
                                setState(() {});
                              },
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0),
                              ),
                              style: TextStyle(
                                height: 1.1,
                                color: isDarkOn ? darkPrimartText : null,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDarkOn ? darkBtnBg : lightBtnBg,
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      int age = int.parse(ageCtrl.text);
                                      if (age > 1) {
                                        setState(() {
                                          age--;
                                          ageCtrl.text = "$age";
                                        });
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDarkOn ? darkBtnBg : lightBtnBg,
                                    border: Border.all(color: Colors.black26),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      int age = int.parse(ageCtrl.text);
                                      setState(() {
                                        age++;
                                        ageCtrl.text = "$age";
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // BUTTON
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 1,
                    onPressed: weightError || ageError || gender == ""
                        ? null
                        : () {
                            double weight = double.parse(weightCtrl.text);
                            int age = int.parse(ageCtrl.text);
                            String result = "";
                            String range = "";
                            debugPrint(
                                "gender >> $gender | height >> $height | weight >> $weight | age >> $age");

                            double bmi = (weight / height / height) * 10000;
                            debugPrint(">>>>>>>>>> $bmi");
                            if (bmi <= 18.4) {
                              result = "underweight";
                              range = "less than 18.4";
                              debugPrint("You are Underweight.");
                            } else if (bmi > 18.5 && bmi < 24.9) {
                              result = "normal";
                              range = "between 18.5 and 24.9";
                              debugPrint("Your weight is Normal.");
                            } else if (bmi > 25 && bmi < 39.9) {
                              result = "overweight";
                              range = "between 25.0 and 39.9";
                              debugPrint("You are Overweight.");
                            } else if (bmi >= 40) {
                              result = "obese";
                              range = "over 40.0";
                              debugPrint("Your weight is Obese.");
                            }

                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(60)),
                                ),
                                builder: (context) => Result(
                                      bmi: bmi,
                                      result: result,
                                      range: range,
                                    ));
                          },
                    color: isDarkOn ? darkPrimaryColor : lightPrimaryColor,
                    disabledColor: btnDisabled,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontSize: 16.5),
                    ),
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

class Result extends StatelessWidget {
  const Result(
      {super.key,
      required this.bmi,
      required this.result,
      required this.range});

  final double bmi;
  final String result;
  final String range;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
      ),
      backgroundColor: Colors.amberAccent[200],
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width * 1),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your BMI is",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 18, 0, 15),
              child: Column(
                children: [
                  Text(
                    bmi.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    result.capitalize(),
                    style: const TextStyle(
                        fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Text(
              "Your BMI is $range, which is considered $result for an adult at this height.",
              style: const TextStyle(fontSize: 19),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Text(
                "- A healthy BMI for adults is between 18.5 and  24.9.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ],
        ),
      ),
    );
  }
}
