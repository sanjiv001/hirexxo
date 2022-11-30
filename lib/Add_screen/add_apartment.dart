import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddApartment extends StatefulWidget {
  @override
  _AddApartmentState createState() => _AddApartmentState();
}

class _AddApartmentState extends State<AddApartment> {
  final key = GlobalKey<FormState>();
  late String name, address, price, descrition;
  List<File> images = [];

  // Vehicle moto = Vehicle();
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   moto.type = CarType.moto;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Apartment"),
          backgroundColor: Colors.lightBlue,
          actions: [Icon(FontAwesomeIcons.motorcycle)],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "Remplir se champ" : null,
                    onChanged: (e) => address = e,
                    decoration: InputDecoration(
                        hintText: "Enter Owner Full Name",
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "Remplir se champ" : null,
                    onChanged: (e) => address = e,
                    decoration: InputDecoration(
                        hintText: "Enter Owner Contact No.",
                        labelText: "Contact No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "Remplir se champ" : null,
                    onChanged: (e) => address = e,
                    decoration: InputDecoration(
                        hintText: "Enter Full Address",
                        labelText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (e) => e!.isEmpty ? "Prix se champ" : null,
                    onChanged: (e) => price = e,
                    decoration: InputDecoration(
                        hintText: "Price",
                        labelText: "Price",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (e) => e!.isEmpty ? "Remplir se champ" : null,
                    onChanged: (e) => descrition = e,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Détailed Information",
                        labelText: "Détails",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      for (int i = 0; i < images.length; i++)
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.4)),
                          margin: EdgeInsets.only(right: 5, bottom: 5),
                          height: 70,
                          width: 70,
                          child: Stack(
                            children: [
                              Image.file(
                                images[i],
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.minusCircle,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      images.removeAt(i);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      InkWell(
                        onTap: () async {
                          // final data = await showModalBottomSheet(
                          //     context: context,
                          //     builder: (ctx) {
                          //       return GetImage();
                          //     });
                          // if (data != null) {
                          //   setState(() {
                          //     images.add(data);
                          //   });
                          // }
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.lightBlue,
                          child: const Icon(
                            FontAwesomeIcons.plusCircle,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.lightBlue,
                      onPressed: () async {
                        // if (key.currentState!.validate() && images.length > 0) {
                        //   print(images);
                        //   loading(context);
                        //   moto.marque = name;
                        //   moto.modele = address;
                        //   moto.prix = price;
                        //   moto.detailSup = descrition;
                        //   moto.images = [];
                        //   moto.uid = FirebaseAuth.instance.currentUser.uid;
                        //   for (var i = 0; i < images.length; i++) {
                        //     String urlImage = await DBServices()
                        //         .uploadImage(images[i], path: "motos");
                        //     if (urlImage != null) moto.images.add(urlImage);
                        //   }
                        //   if (images.length == moto.images.length) {
                        //     bool save = await DBServices().savevehicule(moto);
                        //     if (save) {
                        //       Navigator.of(context).pop();
                        //       Navigator.of(context).pop();
                        //     }
                        //     ;
                        //   }
                        // } else {
                        //   print("veillez remplir tous les champs");
                        // }
                      },
                      child: Text("Add",
                          style: style.copyWith(
                              color: Colors.white, fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
