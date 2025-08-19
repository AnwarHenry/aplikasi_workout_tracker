import 'package:flutter/material.dart';
import 'package:workout_tracker/widgets/categories_page.dart';
import 'package:workout_tracker/widgets/progress_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const id = "/dashboard";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Image.asset(
          "assets/images/workout.png",
          // fit: BoxFit.cover,
          height: 70,
          width: 70,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active),
            color: Colors.white,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              const Column(
                children: [
                  Text(
                    "Progress Training",
                    style: TextStyle(
                      // fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Progresscard(
                      title: "Chest Workout",
                      subtitle: "15 min remaining",
                    ),
                    Progresscard(
                      title: "Legs Workout",
                      subtitle: "23 min remaining",
                    ),
                    Progresscard(
                      title: "Abs Workout",
                      subtitle: "30 min remaining",
                    ),
                    Progresscard(
                      title: "Both Side Plank",
                      subtitle: "30 min remaining",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                height: 176,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 231, 99, 11), Colors.grey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Start Strong and\nSet Your Fitness\nGoals",
                            style: TextStyle(
                              color: Colors.white,
                              // fontFamily: "Poppins",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                child: Text(
                                  "Start Exercise",
                                  style: TextStyle(
                                    // fontFamily: "Montserrat",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          "assets/images/workout_men.png",
                          height: 160,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      // fontFamily: "Poppins",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      // color: AppColor.text,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      CategoriesPage(
                        leading: Image.asset("assets/images/fullbody.png"),
                        title: "Full Body Warm Up",
                        subtitle: "20 Exercise - 22 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/plank.png"),
                        title: "Strength Exercise",
                        subtitle: "12 Exercise - 14 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/bothside.png"),
                        title: "Both Side Plank",
                        subtitle: "15 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/abs.png"),
                        title: "Abs Workout",
                        subtitle: "16 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/torso.png"),
                        title: "Torso and Trap",
                        subtitle: "8 Exercise - 10 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      CategoriesPage(
                        leading: Image.asset("assets/images/lowerback.png"),
                        title: "Lower Back Exercise",
                        subtitle: "14 Exercise - 18 Min",
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
