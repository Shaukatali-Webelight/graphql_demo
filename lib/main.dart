import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_demo/Models/query/get_continents_res_model.dart';
import 'package:graphql_demo/Mutations_example/mutations_client.dart';
import 'package:graphql_demo/Mutations_example/user_data.dart';
import 'package:graphql_demo/Query_example/graphql_client.dart';
import 'package:graphql_demo/Query_example/graphql_query.dart';
import 'package:graphql_demo/utils.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: MutationsClient.clientNotifier,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const MutationsDemo(),
      ),
    );
  }
}

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  FilmsDetailModel? getFilmsDetailModel;
  bool isLoading = true;

  @override
  void initState() {
    getContinentsData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: getFilmsDetailModel?.allFilms?.films?.length,
              itemBuilder: (_, filmIndex) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.amber,
                    // Text(getFilmsDetailModel
                    //         ?.allFilms?.films?[index].speciesConnection?.species?[index].eyeColors?[index] ?? ''),

                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Title : ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                getFilmsDetailModel?.allFilms?.films?[filmIndex].title ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Director : ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                getFilmsDetailModel?.allFilms?.films?[filmIndex].director ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Release Date : ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                getFilmsDetailModel?.allFilms?.films?[filmIndex].releaseDate ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                getFilmsDetailModel?.allFilms?.films?[filmIndex].speciesConnection?.species?.length,
                            itemBuilder: (BuildContext context, int speciesIndex) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Eye colors for : ',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        getFilmsDetailModel?.allFilms?.films?[filmIndex].speciesConnection
                                                ?.species?[speciesIndex].name ??
                                            '',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Colors :',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        getEyeColor(
                                            eyeColors: getFilmsDetailModel?.allFilms?.films?[filmIndex]
                                                .speciesConnection?.species?[speciesIndex].eyeColors),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void getContinentsData() async {
    final result = await GQLClient.client.query(
      QueryOptions(
        document: gql(
          GQLQuery.getFilms(),
        ),
      ),
    );
    //print(Utils.getPrettyJSONString(result.data));
    getFilmsDetailModel = FilmsDetailModel.fromJson(json.decode(Utils.getPrettyJSONString(result.data)));
    Future.delayed(const Duration(seconds: 2)).then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  String getEyeColor({required List<String>? eyeColors}) {
    //eyecolors [a,b,c,d]
    String eyeColor = '';

    for (var i = 0; i < (eyeColors?.length ?? 0); i++) {
      eyeColor = eyeColor + (eyeColors?[i] ?? ''); //abcd
      eyeColor = ((eyeColors?.length ?? 0) - 1) == i ? "$eyeColor." : "$eyeColor, "; //a,b,c,d.
    }

    return eyeColor;
  }
}
