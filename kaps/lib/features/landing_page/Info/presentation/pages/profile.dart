import 'package:flutter/material.dart';
import 'package:kaps/features/landing_page/Info/presentation/widgets/TextFields.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  bool edit = false;
  String? bank;
  String? Account;
  @override
  Widget build(BuildContext context) {
    double wid = MediaQuery.of(context).size.width;
    double hei = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Card(
              shadowColor: Color.fromRGBO(215, 160, 34, 1),
              child: Container(
                width: wid * 0.8,
                padding: EdgeInsets.all(wid * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bank Account Number",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    edit
                        ? MyTextField(
                            onItemSelected: (value) {
                              setState(() {
                                Account = value;
                              });
                            },
                            hintText: "",
                            icons: Icons.attach_money,
                            checkValidity: (value) {},
                            obscurity: false)
                        : Text(Account ?? "10003900287182"),
                    SizedBox(height: 20),
                    Text(
                      "Bank",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(bank ?? "Comercial Bank Of Ethiopia"),
                        SizedBox(
                          width: wid * 0.1,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (edit == false) {
                              setState(() {
                                edit = true;
                                print(edit);
                              });
                            } else {
                              setState(() {
                                edit = false;
                                print(edit);
                              });
                            }
                          },
                          child: edit ? Icon(Icons.check) : Icon(Icons.edit),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: hei * 0.1,
          ),
          edit
              ? Padding(
                  padding: EdgeInsets.only(left: wid * 0.1, right: wid * 0.1),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bank = "Comerciall Bank of Ethiopia";
                          });
                        },
                        child: CircleAvatar(
                          radius: wid * 0.1,
                          backgroundImage: NetworkImage(
                              "https://th.bing.com/th/id/OIP.XTTGvO0s8Cwq84iy6779bwAAAA?rs=1&pid=ImgDetMain"),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bank = "Wegagen Bank";
                          });
                        },
                        child: CircleAvatar(
                          radius: wid * 0.1,
                          backgroundImage: NetworkImage(
                              "https://altacomputec.com/logos/banks/wegagen.jpg"),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bank = "Birhan Bank";
                          });
                        },
                        child: CircleAvatar(
                          radius: wid * 0.1,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/originals/d1/bd/cb/d1bdcbad45d8e2b6bb23067a2c6d8980.jpg"),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
          SizedBox(
            height: hei * 0.1,
          ),
          edit
              ? Padding(
                  padding: EdgeInsets.only(left: wid * 0.1, right: wid * 0.1),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bank = "Ahadu Bank";
                          });
                        },
                        child: CircleAvatar(
                          radius: wid * 0.1,
                          backgroundImage: NetworkImage(
                              "https://addisbiz.com/wp-content/uploads/Ahadu-bank-ethiopia-new-bank-under-formation.jpg"),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bank = "Abysinia Bank";
                          });
                        },
                        child: CircleAvatar(
                          radius: wid * 0.1,
                          backgroundImage: NetworkImage(
                              "https://th.bing.com/th/id/OIP._6IIqUOdJqWE8VdDVEWkaQAAAA?w=200&h=200&rs=1&pid=ImgDetMain"),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            bank = "Abay Bank";
                          });
                        },
                        child: CircleAvatar(
                          radius: wid * 0.1,
                          backgroundImage: NetworkImage(
                              "https://typicalethiopian.com/wp-content/uploads/2023/10/abay-1.jpg"),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
        ],
      )),
    );
  }
}
