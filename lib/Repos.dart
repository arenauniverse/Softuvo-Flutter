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

  String getLeaguesStats() {
    return """{
getLeaguesStats {
name
value
}
}
    """;
  }


  String createUser({
    int id,
    String userName,
    fName,
    lName,
    email,
    dob,
    country,
    imageUrl,
    status,
    /*Float lat,
      Float lang*/
  }) {
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


