import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaps/features/landing_page/Info/presentation/bloc/info_blocs_bloc.dart';

class history extends StatefulWidget {
  final String phone;
  const history({super.key, required this.phone});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  final List<dynamic> history = [];
  @override
  void initState() {
    BlocProvider.of<InfoBlocsBloc>(context).add(FetchHistory(widget.phone));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InfoBlocsBloc, InfoBlocsState>(
      listener: (context, state) {
        if (state is History) {
          state.history.forEach((element) {
            print(element.toString());
            history.add(element);
          });
          setState(() {});
        }
      },
      child: Container(
        child: ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.01,
                    right: MediaQuery.of(context).size.width * 0.05,
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: (Card(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width * 0.025,
                              0,
                              0,
                              MediaQuery.of(context).size.height * 0.1,
                            ),
                            child: Container(
                              child: Image.network(
                                "https://kaps-api.purposeblacketh.com/" +
                                    history[index]['file'].toString(),
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0,
                                MediaQuery.of(context).size.height * 0.05,
                                0,
                                0),
                            child: Column(
                              children: [
                                Text("product Name: " +
                                    history[index]['productname'].toString()),
                                Text("product Description: " +
                                    history[index]['productdescription']
                                        .toString()),
                                Text("product price: " +
                                    history[index]['productprice'].toString()),
                                Text("product Quantity: " +
                                    history[index]['quantity'].toString()),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ),
              );
            }),
      ),
    );
  }
}
