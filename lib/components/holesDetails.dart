import 'package:flutter/material.dart';

class GolfHolesGrid extends StatelessWidget {
  final List<Map<String, dynamic>> holes;

  const GolfHolesGrid({Key? key, required this.holes}) : super(key: key);

  void showHoleDetails(BuildContext context, Map<String, dynamic> hole) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(20, 25, 20, 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hole ${hole['number']} Details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Par: ${hole['par']}"),
              Text("Stroke: ${hole['stroke']}"),
              Text("Distance: ${hole['distance']} yards"),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Splitting holes into Outward (1-9) and Inward (10-18)
    final outwardHoles = holes.where((hole) => hole['number'] <= 9).toList();
    final inwardHoles = holes.where((hole) => hole['number'] > 9).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Outward Holes Section
        Text(
          "Outward Holes",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.5,
          ),
          itemCount: outwardHoles.length,
          itemBuilder: (context, index) {
            return buildHoleButton(context, outwardHoles[index]);
          },
        ),

        SizedBox(height: 20),

        // Inward Holes Section
        Text(
          "Inward Holes",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.5,
          ),
          itemCount: inwardHoles.length,
          itemBuilder: (context, index) {
            return buildHoleButton(context, inwardHoles[index]);
          },
        ),
      ],
    );
  }

  Widget buildHoleButton(BuildContext context, Map<String, dynamic> hole) {
    return SizedBox(
      width: 120,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => showHoleDetails(context, hole),
        child: Text(
          "Hole ${hole['number']}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
