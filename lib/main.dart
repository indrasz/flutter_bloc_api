import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/bloc/github_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => GithubBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<GithubBloc, GithubState>(builder: (context, state) {
              // if (state == null) return const Text('No Image');

              if (state is GithubInitial) {
                return const Text('No Image');
              }

              if (state is GithubLoading) {
                return const CircularProgressIndicator();
              }

              if (state is GithubLoadSuccess) {
                return Image.network(state.imageUrl);
              }

              if (state is GithubError) {
                return const Text('Error');
              }

              return const SizedBox();
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<GithubBloc>(context).add(PushGetButton());
        },
        tooltip: 'Get Github',
        child: const Icon(Icons.add),
      ),
    );
  }
}