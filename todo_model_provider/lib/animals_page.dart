import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_model_provider/animal.dart';

import 'todo_provider.dart';

class AnimalsPage extends StatefulWidget {
  const AnimalsPage({super.key});

  @override
  State<AnimalsPage> createState() => _AnimalsPageState();
}

class _AnimalsPageState extends State<AnimalsPage> {
  @override
  void initState() {
    context.read<TodoProvider>().getAnimal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal'),
      ),
      body: Consumer<TodoProvider>(builder: (context, todoProvider, child) {
        List<Animal> animals = todoProvider.animals;
        if (animals.isEmpty) {
          return const Center(child: Text('Empty'));
        }
        return ListView.builder(
          itemCount: animals.length,
          itemBuilder: (context, index) {
            Animal animal = animals[index];
            return ListTile(
              leading: IconButton.filledTonal(
                onPressed: () {
                  buildUpdateAnimal(context, animal);
                },
                icon: const Icon(Icons.edit),
              ),
              title: Text(animal.name),
              subtitle: Text(animal.species),
              trailing: IconButton(
                onPressed: () {
                  context.read<TodoProvider>().remove(animal);
                },
                icon: const Icon(Icons.delete),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildAddAnimal(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  buildAddAnimal(BuildContext context) {
    final edtName = TextEditingController();
    final edtSpecies = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Animal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: edtName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: edtSpecies,
                decoration: const InputDecoration(
                  labelText: 'Species',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().add(
                      edtName.text,
                      edtSpecies.text,
                      context,
                    );
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  buildUpdateAnimal(BuildContext context, Animal oldAnimal) {
    final edtName = TextEditingController();
    final edtSpecies = TextEditingController();
    edtName.text = oldAnimal.name;
    edtSpecies.text = oldAnimal.species;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Animal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: edtName,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: edtSpecies,
                decoration: const InputDecoration(
                  labelText: 'Species',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().update(
                      oldAnimal.id,
                      edtName.text,
                      edtSpecies.text,
                    );
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
