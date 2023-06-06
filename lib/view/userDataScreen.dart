import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpledata_json/provider/postProvider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  PostProvider? providerF;
  PostProvider? providerT;
  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context,listen: false).userDataParsing();
  }
  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<PostProvider>(context, listen: true);
    providerF = Provider.of<PostProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("User Data",
            style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                providerF!.userDataParsing();
              },
              icon: Icon(
                Icons.arrow_circle_down_sharp,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: Container(
                            height: 450,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Center(
                                child: Text(
                              "${providerF!.userData[index].id}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, bottom: 10),
                          child: Container(
                            height: 450,
                            width: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                        child: Text(
                                            "Name  --->   ${providerF!.userData[index].name}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ))),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "User Name  --->   ${providerF!.userData[index].username}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Email  --->   ${providerF!.userData[index].email}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Address Street  --->   ${providerF!.userData[index].addressModal!.street}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Suite  --->   ${providerF!.userData[index].addressModal!.suite}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "City  --->   ${providerF!.userData[index].addressModal!.city}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Zipcode  --->   ${providerF!.userData[index].addressModal!.zipcode}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Geo Lat  --->   ${providerF!.userData[index].addressModal!.geo!.lat}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Geo Lan  --->   ${providerF!.userData[index].addressModal!.geo!.lng}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Phone  --->   ${providerF!.userData[index].phone}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Website  --->   ${providerF!.userData[index].website}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Company Name  --->   ${providerF!.userData[index].companyModal!.name}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "CatchPhrase  --->   ${providerF!.userData[index].companyModal!.catchPhrase}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                  Divider(
                                      height: 5,
                                      thickness: 0.5,
                                      endIndent: 2,
                                      color: Colors.black),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Text(
                                        "Bs  --->   ${providerF!.userData[index].companyModal!.bs}",
                                        style: TextStyle(
                                          fontSize: 13,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
              itemCount: providerF!.userData.length,
            ),
          )
        ],
      ),
    ));
  }
}
