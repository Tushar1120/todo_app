// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:todo_app/db_services/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool personal = true, college = false, health = false;
  bool suggest = false;

  TextEditingController todoController = TextEditingController();
  Stream? todoStream;

  getOnLoad() async {
    todoStream = await DatabaseService().getTask(personal
        ? "Personal"
        : college
            ? "College"
            : "Health");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  Widget getWork() {
    return StreamBuilder(
        stream: todoStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot docSnap = snapshot.data.docs[index];
                        return CheckboxListTile(
                          activeColor: Colors.black,
                          title: Text(docSnap["work"]),
                          value: docSnap["Yes"],
                          onChanged: (newValue) async {
                            //suggest = newValue!;
                            await DatabaseService().tickMethod(
                                docSnap["Id"],
                                personal
                                    ? "Personal"
                                    : college
                                        ? "College"
                                        : "Health");
                            setState(() {
                              Future.delayed(const Duration(seconds: 5),(){
                              DatabaseService().removeMethod(
                                  docSnap["Id"],
                                  personal
                                      ? "Personal"
                                      : college
                                          ? "College"
                                          : "Health");
                            });
                          });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        );
                      }),
                )
              : const Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 8, 234, 200),
        onPressed: () {
          openBox();
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 90, left: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white54,
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Text(
                "Yoo Buddy!",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: const Text(
                "Let's the work begin. ✍🏻",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                personal
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 22, 246, 205),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Personal",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          personal = true;
                          college = false;
                          health = false;
                          await getOnLoad();
                          setState(() {});
                        },
                        child: const Text(
                          "Personal",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                college
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 22, 246, 205),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "College",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          personal = false;
                          college = true;
                          health = false;

                          await getOnLoad();
                          setState(() {});
                        },
                        child: const Text(
                          "College",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                health
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 22, 246, 205),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Health",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () async {
                          personal = false;
                          college = false;
                          health = true;

                          await getOnLoad();
                          setState(() {});
                        },
                        child: const Text(
                          "Health",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            getWork(),
          ],
        ),
      ),
    );
  }

  Future openBox() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.cancel,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 60.0),
                          const Text(
                            "Add your ToDo Task",
                            style: TextStyle(
                              color: Colors.black38,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text("Add Text"),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        )),
                        child: TextField(
                          controller: todoController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter the task.",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          String id = randomAlphaNumeric(10);
                          Map<String, dynamic> userTodo = {
                            "work": todoController.text,
                            "Id": id,
                            "Yes": false,
                          };
                          personal
                              ? DatabaseService().addPersonalTask(userTodo, id)
                              : college
                                  ? DatabaseService()
                                      .addCollegeTask(userTodo, id)
                                  : DatabaseService()
                                      .addHealthTask(userTodo, id);
                          Navigator.pop(context);
                        },
                        child: Center(
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 22, 246, 205),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
