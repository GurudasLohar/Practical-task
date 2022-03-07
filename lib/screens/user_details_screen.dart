import 'package:flutter/material.dart';
import 'package:tibicle_practical/constants/box_decoration.dart';
import 'package:tibicle_practical/models/education_info.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  late String fullName;
  late String countryName = "India";
  late String message = "Message";
  late EducationModel educationModel = EducationModel( List<String>.empty(growable: true),);

  String defaultValue = 'India'; // Default Value
  var countries = ['India', 'United State',];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    educationModel.education.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: globalFormKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/app_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child:  Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                    child: TextFormField(
                      onChanged: (value) {
                        fullName = value;
                      },
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Full Name',
                      ),
                      validator:  (value){
                        if (value!.isEmpty) {
                          return "Please enter full name";
                        } else
                          return null;
                      },
                    ),
                  ),

                  Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: countryDropdown(),
                  ),
                  const SizedBox(height: 30,),

                  Container(
                    height: 55,
                    width: 370,
                    padding: const EdgeInsets.only(left: 20, right: 20,top:15),
                    decoration: const BoxDecoration(
                      color: Colors.white30, // Set border width
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Text(message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                  ),

                  Container(
                    child: educationContainer(),
                  ),
                  const SizedBox(height: 30,),

                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      final formSave = globalFormKey.currentState;

                      if(formSave!.validate()){

                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
                              contentPadding: const EdgeInsets.only(top: 50.0),
                              title: const Text('User Details Saved \n Successfully!',textAlign: TextAlign.center,),
                              content: SizedBox(
                                width: 400,
                                height: double.infinity,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.verified_user_outlined, size: 40,color: Colors.green,),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text("Full name: "+fullName,
                                        style: const TextStyle(fontSize: 20),),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text("Country name: "+countryName,
                                        style: const TextStyle(fontSize: 20),),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text("Message: "+message,
                                        style: const TextStyle(fontSize: 20),),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          for(var item in educationModel.education ) Text("Education: " +item,style: const TextStyle(fontSize: 20),)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                                  child: const Text('Save',style: TextStyle(color: Colors.white),),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            )
                        );

                      } else {
                        return null;
                      }

                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(40)),
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 65, vertical: 15),
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget countryDropdown(){
    return Container(
        height: 55,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const ShapeDecoration(
          color: Colors.white30,
          shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.deepPurple[200],),
          child: DropdownButtonFormField(
            itemHeight: 50,
            decoration: const InputDecoration(border: InputBorder.none),
            onChanged: (dynamic value) {
              setState(() {
                countryName = value;
                if(value == "India"){
                  message = "Namaste";
                }else{
                  message = "Welcome";
                }
              });
            },
            onSaved: (dynamic value) {
              setState(() {
                countryName = value;
                if(value == "India"){
                  message = "Namaste";
                }else{
                  message = "Welcome";
                }
              });
            },
            value: defaultValue,
            items: countries.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items, style:const TextStyle(
                    fontSize: 20, color: Colors.white),),
              );
            }).toList(),
          ),
        ));
  }

  Widget educationContainer() {
    return Form(
      child: SingleChildScrollView(
        child: ListView.separated(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: this.educationModel.education.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Flexible(
                      fit: FlexFit.loose,
                      child: multipleEducationField(index),
                    ),
                  ]),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      ),
    );
  }


  Widget multipleEducationField(index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  return("Email Address ${index + 1} can\'t be empty.");
                } else{
                  return null;
                }
            },
              onChanged: (value) {
                educationModel.education[index] = value;
              },
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: kTextFieldDecoration.copyWith(
              hintText: 'Education Details',
              ),
            ),
          ),
        ),
        Visibility(child: SizedBox(
          width: 60,
          child: IconButton(
            padding: const EdgeInsets.only(top: 17),
            icon: const Icon(
              Icons.add_circle_rounded,
              color: Colors.greenAccent,
              size: 35.0,
            ),
            onPressed: () {
                addEducationControl();
            },
          ),
        ),
          visible: index == this.educationModel.education.length - 1,
        ),

        Visibility(child: SizedBox(
          width: 60,
          child: IconButton(
            padding: const EdgeInsets.only(top: 17),
            icon: const Icon(
              Icons.remove_circle_rounded,
              color: Colors.orangeAccent,
              size: 35.0,
            ),
            onPressed: () {
                removeEducationControl(index);
            },
          ),
        ),
          visible: index > 0,
        ),
      ],
    );
  }

  void addEducationControl() {
    setState(() {
      this.educationModel.education.add("");
    });
  }

  void removeEducationControl(index) {
    setState(() {
      if (this.educationModel.education.length > 1) {
        this.educationModel.education.removeAt(index);
      }
    });
  }
}
