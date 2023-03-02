import 'package:flutter/material.dart';


// ignore: camel_case_types
class SignInPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SignInPage({Key? key});
  

  @override
  State<SignInPage> createState() => _SignInPageState();
}
class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
}
// ignore: camel_case_types
class _SignInPageState extends State<SignInPage> {
  final List<Person> _people = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _addPerson() {
    setState(() {
      String name = _nameController.text;
      int age = int.tryParse(_ageController.text) ?? 0;

      _people.add(Person(name: name, age: age));

      _nameController.clear();
      _ageController.clear();
    });
  }

  void _editPerson(int index) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nameController = TextEditingController(
          text: _people[index].name,
        );
        final TextEditingController ageController = TextEditingController(
          text: _people[index].age.toString(),
        );

        return AlertDialog(
          title: const Text('Edit Person'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  _people[index].name = nameController.text;
                  _people[index].age = int.tryParse(ageController.text) ?? 0;
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _deletePerson(int index) {
    setState(() {
      _people.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 114, 218, 241),
        title: const Text('People List'),
      ),
      body: Column(
        
        children: [
          Container(
        //     decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.topRight,
        //       end: Alignment.bottomLeft,
        //       colors: [
        //         Colors.white,
        //         Color.fromARGB(255, 166, 238, 238),
        //       ],
        //     ),
        // ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  
                ),
                TextField(
                  controller: _ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                ElevatedButton(
                  onPressed: _addPerson,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(255, 59, 201, 245)),
                    
                  ),
                  child: const Text('Add Person'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _people.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_people[index].name),
                    subtitle: Text('Age: ${_people[index].age}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _editPerson(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _deletePerson(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
