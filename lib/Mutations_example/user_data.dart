import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_demo/Models/mutations/user_data_model.dart';
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

                  setState(
                    () {
                      name = model.createUser?.name ?? '';
                      username = model.createUser?.username ?? '';
                      email = model.createUser?.email ?? '';
                    },
                  );
                },
              ),
              builder: (runMutation, result) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        runMutation({
                          'input': {
                            'name': nameController.text,
                            'username': usernameController.text,
                            'email': emailController.text
                          }
                        });
                      },
                      child: const Text('Add'),
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
                      child: const Text('Clear'),
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
