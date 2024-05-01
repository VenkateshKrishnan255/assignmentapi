import 'package:flutter/material.dart';
import '../Model/items.dart';
import '../Service/apiservice.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {

  late List<Items> _assignment = [];
  @override
  void initState() {
    print('--------------->Initstate Excuted');
    super.initState();
    _loadAssignment();
  }

  Future<void> _loadAssignment() async{
    try{
      List<Items> response = await ApiService.fetchLessons();
      setState(() {
        print('---------------->Assignment Method Running');
        _assignment = response;
      });
    }catch (e){
      print("Error Loading Lesson: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment Api'),
        centerTitle: true,
      ),
      body: _assignment ==null || _assignment.isEmpty
      ? const Center(
        child: CircularProgressIndicator(),
      ) : ListView.builder(
        itemCount: _assignment!.length,
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                Text('PostId : ${_assignment[index].postId}'),
                Text('Id : ${_assignment[index].id}'),
                Text('Name : ${_assignment[index].name}'),
                Text('Email : ${_assignment[index].email}'),
                Text('Body : ${_assignment[index].body}'),
              ],
            ),
          );
        },
      )
    );
  }

}
