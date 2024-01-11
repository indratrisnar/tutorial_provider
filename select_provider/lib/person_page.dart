import 'package:d_input/d_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:select_provider/person_provider.dart';
import 'package:d_method/d_method.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final edtName = TextEditingController();
  final edtAge = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Expanded(
                child: DInput(
                  controller: edtName,
                  fillColor: Colors.blue[100],
                  hint: 'Name',
                ),
              ),
              IconButton(
                onPressed: () {
                  DMethod.log('-' * 30);
                  context.read<PersonProvider>().updateName(edtName.text);
                },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: DInput(
                  controller: edtAge,
                  fillColor: Colors.blue[100],
                  hint: 'Age',
                ),
              ),
              IconButton(
                onPressed: () {
                  DMethod.log('-' * 30);
                  context.read<PersonProvider>().updateAge(
                        int.parse(edtAge.text),
                      );
                },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Builder(builder: (context) {
            DMethod.log('Build Name');
            String name =
                context.select((PersonProvider value) => value.data.name);
            return Text('Name: $name');
          }),
          Builder(builder: (context) {
            DMethod.log('Build Age');
            int age =
                context.select<PersonProvider, int>((value) => value.data.age);
            return Text('Age: $age');
          }),
        ],
      ),
    );
  }
}
