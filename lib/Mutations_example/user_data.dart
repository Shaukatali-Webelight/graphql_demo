import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_demo/Mutations_example/mutations_query.dart';
import 'package:graphql_demo/utils.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MutationsDemo extends StatefulWidget {
  const MutationsDemo({super.key});

  @override
  State<MutationsDemo> createState() => _MutationsDemoState();
}

class _MutationsDemoState extends State<MutationsDemo> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String name = '';
  String username = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            SizedBox(
              width: 260,
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.orange),
                  ),
                  hintText: 'Name',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 260,
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.orange),
                  ),
                  hintText: 'Username',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 260,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.orange),
                  ),
                  hintText: 'Email',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Mutation(
              options: MutationOptions(
                document: gql(MutationQueryClass().addUser),
                onCompleted: (dynamic resultData) {
                  CreateUserResModel model =
                      CreateUserResModel.fromJson(json.decode(Utils.getPrettyJSONString(resultData)));

                  setState(() {
                    name = model.createUser?.name ?? '';
                    username = model.createUser?.username ?? '';
                    email = model.createUser?.email ?? '';
                  });

                  print(resultData);
                },
              ),
              builder: (runMutation, result) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        print("on press");
                        runMutation({
                          'input': {
                            'name': nameController.text,
                            'username': usernameController.text,
                            'email': emailController.text
                          }
                        });
                      },
                      child: Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nameController.clear();
                          usernameController.clear();
                          emailController.clear();

                          name = '';
                          username = '';
                          email = '';
                        });
                      },
                      child: Text('Clear'),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text('Your Name : $name'),
                  Text('Your Username : $username'),
                  Text('Your Email : $email'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class CreateUserResModel {
  String? sTypename;
  CreateUser? createUser;

  CreateUserResModel({this.sTypename, this.createUser});

  CreateUserResModel.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    createUser = json['createUser'] != null
        ? new CreateUser.fromJson(json['createUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    if (this.createUser != null) {
      data['createUser'] = this.createUser!.toJson();
    }
    return data;
  }
}

class CreateUser {
  String? sTypename;
  String? email;
  String? id;
  String? name;
  String? username;

  CreateUser({this.sTypename, this.email, this.id, this.name, this.username});

  CreateUser.fromJson(Map<String, dynamic> json) {
    sTypename = json['__typename'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__typename'] = this.sTypename;
    data['email'] = this.email;
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }
}
