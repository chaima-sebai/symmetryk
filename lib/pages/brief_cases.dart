import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:indexed/indexed.dart';
import 'package:symmetryk/customwidgets/briefcase.dart';
import 'package:symmetryk/statics.dart';

class Briefcases extends StatelessWidget {
  const Briefcases({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Briefcase(),
          Briefcase()
        ],
      ),
    );
  }
}
