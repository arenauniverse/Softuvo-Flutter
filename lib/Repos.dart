import 'dart:ffi';
import 'dart:io';

import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

class GraphQLConfiguration {
  static HttpLink httpLink = HttpLink(
    headers: {"appKey": "ASdfwefASFFSAfSADWEGFVSADFvWQerfasdASDF"},
    uri: "http://api-dev.arenauniverse.ar/graphql",
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}

class QueryMutation {
  String fbLogin({String token}) {
    return """mutation {
                signUp(
                  mechanism: FACEBOOK
                  mechanismToken: "$token"
                 ){
                  authorization
                 }
                }""";
  }

  String googleLogin({String token}) {
    return """mutation {
                signUp(
                  mechanism: GOOGLE   
                  mechanismToken: "$token"           
                 ){
                  authorization
                 }
                }""";
  }

  String register(
      {String name,
      String country,
      String birthday,
      String email,
      String emailConfirm,
      String keyword,
      String keywordConfirm}) {
    return """mutation {
  signUp(
  mechanism: BASIC
  firstName: "$name"
  country: "$country"
  birthday: "$birthday"
  email: "$email"
  emailConfirm: "$emailConfirm"
  keyword: "$keyword"
  keywordConfirm: "$keywordConfirm"
  ) {
  authorization
  person {
  _id
  email
  }
  }
}""";
  }

//   String createUser(
//       {String id,
//       userName,
//       fName,
//       lName,
//       email,
//       dob,
//       country,
//       imageUrl,
//       status,
//         Float lat, Float lang
//       }) {
//     return """mutation {
//   editPeople(
//   idPerson: "$id"
//   username: "$userName"
//   firstName: "$fName"
//   lastName: "$lName"
//   email: "$email"
//   dateOfBirth: "$dob"
//   country: "$country"
//   avatarURL: "$imageUrl"
//   latitude: "$lat"
//   longitude: "$lang"
//   status: "$status"
//   ) {
//   authorization
//   person {
//   _id
//   email
//   }
//   }
// }""";
//   }

  String createUser(
      {int id,
      String userName,
      fName,
      lName,
      email,
      dob,
      country,
      imageUrl,
      status,
      Float lat,
      Float lang}) {
    return """ mutation {
  editPeople(
  idPerson: "$id"
  username: "$userName"
  firstName: "$fName"
  lastName: "$lName"
  email: "$email"
  ) {
  _id
  firstName
  lastName
  username
  email
  }
}""";
  }

  String login({
    String email,
    String keyword,
  }) {
    return """mutation {
login(
mechanism: BASIC,
email: "$email",
keyword: "$keyword"
) {
authorization
person {
_id
email
}
}
}""";
  }

  String forgotPassword({
    String email,
    String emailConfirm,
  }) {
    return """mutation {
     forgetPassword(
     email: "$email",
     emailConfirm: "$emailConfirm"
      )
}""";
  }
}

/*class AlertDialogWindow extends StatefulWidget {
  final Person person;
  final bool isAdd;

  AlertDialogWindow({Key key, this.person, this.isAdd}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _AlertDialogWindow(this.person, this.isAdd);
}

class _AlertDialogWindow extends State<AlertDialogWindow> {
  TextEditingController txtId = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueryMutation addMutation = QueryMutation();

  final Person person;
  final bool isAdd;

  _AlertDialogWindow(this.person, this.isAdd);

  @override
  void initState() {
    super.initState();
    if (!this.isAdd) {
      txtId.text = person.getId();
      txtName.text = person.getName();
      txtLastName.text = person.getLastName();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text(this.isAdd ? "Add" : "Edit or Delete"),
      content: Container(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  child: TextField(
                    maxLength: 5,
                    controller: txtId,
                    enabled: this.isAdd,
                    decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      labelText: "ID",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 80.0),
                  child: TextField(
                    maxLength: 40,
                    controller: txtName,
                    decoration: InputDecoration(
                      icon: Icon(Icons.text_format),
                      labelText: "Name",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 160.0),
                  child: TextField(
                    maxLength: 40,
                    controller: txtLastName,
                    decoration: InputDecoration(
                      icon: Icon(Icons.text_rotate_vertical),
                      labelText: "Last name",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 240.0),
                  child: TextField(
                    maxLength: 2,
                    controller: txtAge,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Age", icon: Icon(Icons.calendar_today)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Close"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        !this.isAdd
            ? FlatButton(
                child: Text("Delete"),
                onPressed: () async {
                  GraphQLClient _client = graphQLConfiguration.clientToQuery();
                  QueryResult result = await _client.mutate(
                    MutationOptions(
                      document: addMutation.deletePerson(txtId.text),
                    ),
                  );
                  if (!result.hasException) Navigator.of(context).pop();
                },
              )
            : null,
        FlatButton(
          child: Text(this.isAdd ? "Add" : "Edit"),
          onPressed: () async {
            if (txtId.text.isNotEmpty &&
                txtName.text.isNotEmpty &&
                txtLastName.text.isNotEmpty &&
                txtAge.text.isNotEmpty) {
              if (this.isAdd) {
                GraphQLClient _client = graphQLConfiguration.clientToQuery();
                QueryResult result = await _client.mutate(
                  MutationOptions(
                    document: addMutation.addPerson(
                      txtId.text,
                      txtName.text,
                      txtLastName.text,
                      int.parse(txtAge.text),
                    ),
                  ),
                );
                if (!result.hasException) {
                  txtId.clear();
                  txtName.clear();
                  txtLastName.clear();
                  txtAge.clear();
                  Navigator.of(context).pop();
                }
              } else {
                GraphQLClient _client = graphQLConfiguration.clientToQuery();
                QueryResult result = await _client.mutate(
                  MutationOptions(
                    document: addMutation.editPerson(
                      txtId.text,
                      txtName.text,
                      txtLastName.text,
                      int.parse(txtAge.text),
                    ),
                  ),
                );
                if (!result.hasException) {
                  txtId.clear();
                  txtName.clear();
                  txtLastName.clear();
                  txtAge.clear();
                  Navigator.of(context).pop();
                }
              }
            }
          },
        )
      ],
    );
  }
}

class Principal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Principal();
}

class _Principal extends State<Principal> {
  List<Person> listPerson = List<Person>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  void fillList() async {
    QueryMutation queryMutation = QueryMutation();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: queryMutation.getAll(),
      ),
    );
    if (!result.hasException) {
      for (var i = 0; i < result.data["persons"].length; i++) {
        setState(() {
          listPerson.add(
            Person(
              result.data["persons"][i]["id"],
              result.data["persons"][i]["name"],
              result.data["persons"][i]["lastName"],
            ),
          );
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  void _addPerson(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        AlertDialogWindow alertDialogWindow =
            new AlertDialogWindow(isAdd: true);
        return alertDialogWindow;
      },
    ).whenComplete(() {
      listPerson.clear();
      fillList();
    });
  }

  void _editDeletePerson(context, Person person) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        AlertDialogWindow alertDialogWindow =
            new AlertDialogWindow(isAdd: false, person: person);
        return alertDialogWindow;
      },
    ).whenComplete(() {
      listPerson.clear();
      fillList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Example"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline),
            onPressed: () => _addPerson(context),
            tooltip: "Insert new person",
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Person",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: ListView.builder(
              itemCount: listPerson.length,
              itemBuilder: (context, index) {
                return ListTile(
                  selected: listPerson == null ? false : true,
                  title: Text(
                    "${listPerson[index].getName()}",
                  ),
                  onTap: () {
                    _editDeletePerson(context, listPerson[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}*/
