import 'package:flutter/material.dart';
import 'package:todo_model_provider/animal.dart';
import 'package:uuid/uuid.dart';
import 'package:d_info/d_info.dart';

class TodoProvider extends ChangeNotifier {
  List<Animal> _animals = [];
  List<Animal> get animals => _animals;

  getAnimal() {
    _animals = [
      Animal(id: 'id', name: 'Cat', species: 'Mammal'),
    ];
  }

  add(String name, String species, BuildContext context) {
    int indexFound =
        _animals.indexWhere((e) => e.name.toLowerCase() == name.toLowerCase());
    if (indexFound >= 0) {
      DInfo.snackBarError(context, 'Name already added');
      return;
    }
    Animal newAnimal = Animal(
      id: const Uuid().v4(),
      name: name,
      species: species,
    );
    _animals.add(newAnimal);
    notifyListeners();
  }

  remove(Animal animal) {
    _animals.removeWhere((element) => element.id == animal.id);
    notifyListeners();
  }

  update(String oldId, String name, String species) {
    int index = _animals.indexWhere((e) => e.id == oldId);
    _animals[index] = Animal(
      id: oldId,
      name: name,
      species: species,
    );
    notifyListeners();
  }
}
