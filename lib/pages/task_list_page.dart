import 'package:flutter/material.dart';

class Task {
  String title;
  bool isDone;
  Task({required this.title, this.isDone = false});
}

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [
    Task(title: "Estudar Flutter"),
    Task(title: "Fazer ACQA Uniube", isDone: true),
    Task(title: "Comprar Café"),
    Task(title: "Revisar NoSQL", isDone: true),
    Task(title: "Academia"),
  ];

  @override
  Widget build(BuildContext context) {
    // LÓGICA DE ORDENAÇÃO EXIGIDA PELO PROFESSOR
    List<Task> pending = tasks.where((t) => !t.isDone).toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    List<Task> completed = tasks.where((t) => t.isDone).toList()
      ..sort((a, b) => a.title.compareTo(b.title));
    List<Task> sortedTasks = [...pending, ...completed];

    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Tarefas'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: sortedTasks.length, // Se der erro use sortedTasks.length
        itemBuilder: (context, index) {
          final task = sortedTasks[index];
          return ListTile(
            leading: Icon(
              task.isDone ? Icons.check_circle : Icons.radio_button_unchecked,
              color: task.isDone ? Colors.green : Colors.grey,
            ),
            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Aqui seria o ShowDialog para adicionar
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
