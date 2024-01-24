import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Future<SharedPreferences> sharedPref = SharedPreferences.getInstance();
  TextEditingController introduceController = TextEditingController();
  bool isEditMode = false;

  @override
  void initState() {
    getIntroduceData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.accessibility_new,
          color: Colors.black,
          size: 32,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'This is my NameCard',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/honken_reddit_noimage.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('Honken Park'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Age',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('40'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Hobby',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('Judo'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'Job',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('Programmar'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'School',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('Hanyang & Ajou'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      'MBTI',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('INFJ & INFP'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                  ),
                  child: const Text(
                    'Introduce',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(
                      right: 16,
                      top: 16,
                    ),
                    child: Icon(
                      Icons.mode_edit,
                      color: isEditMode ? Colors.blueAccent : Colors.black,
                      size: 24,
                    ),
                  ),
                  onTap: () async {
                    final SharedPreferences prefs = await sharedPref;
                    if (isEditMode) {
                      if (introduceController.text.isNotEmpty) {
                        prefs.setString('introduce', introduceController.text);
                      } else {
                        var snackBar = const SnackBar(
                          content: Text('TextField is Empty !!'),
                          duration: Duration(seconds: 2),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }

                    setState(() {
                      isEditMode = !isEditMode;
                    });
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                enabled: isEditMode,
                controller: introduceController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getIntroduceData() async {
    var sharedPref = await SharedPreferences.getInstance();
    if (sharedPref.getString('introduce') != null) {
      String introducing = sharedPref.getString('introduce').toString();
      introduceController.text = introducing;
    }
  }
}
