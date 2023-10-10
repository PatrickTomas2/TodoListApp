import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  
  var item = TextEditingController();
  List<String> todoItems = [];
  void addItems(){
      todoItems.add(item.text);
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                Row(
                  children: [
                      Expanded(
                        child: TextField(
                          controller: item,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            label: const Text('Todo Item'),
                          ),
                        ),
                      ),
                    const SizedBox(
                      width: 6,
                    ),
                    ElevatedButton.icon(
                      onPressed: (){
                        print(item.text);
                        addItems();

                      }, 
                      icon: Icon(Icons.add), 
                      label: Text('Add'),
                      ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (_, index) => TodoItem(todoItems[index], index+1, todoItems),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class TodoItem extends StatefulWidget {
  TodoItem(this.item, this.index, this.list,{super.key});
  String item;
  int index;
  List<String> list =[];

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void deleteItem(){
    
    setState(() {
      widget.list.remove(widget.item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(widget.item),
        leading: CircleAvatar(
          child: Text('${widget.index}'),
        ),
        trailing: IconButton(onPressed: (){
          deleteItem();
        },
        icon: Icon(Icons.delete_forever,
        color: Colors.red,
          ),
        ),
        subtitle: const Text("this is subtitle"),
      ),
    );
  }
}