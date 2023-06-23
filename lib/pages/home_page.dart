import 'package:api_get_single_user/api/get_single_user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = '';
  String email = '';
  String circleAvatar = '';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   fetchData();
  //   super.initState();
  // }

  void fetchData() async {
    try {
      var hasilGetApi = await GetSingleUser.getUserData();
      setState(() {
        nama = '${hasilGetApi['first_name']} ${hasilGetApi['last_name']}';
        email = '${hasilGetApi['email']}';
        circleAvatar = hasilGetApi['avatar'];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('belajar get api single user'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('$nama'),
            subtitle: Text('$email'),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(circleAvatar),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: Text('GET'))
        ],
      ),
    );
  }
}
