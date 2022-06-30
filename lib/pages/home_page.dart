import 'package:counter_with_bloc_builder/widgets/material_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CustomButton(text: 'Counter Page', onPressed: () => Navigator.pushNamed(context, '/counter')),

              const SizedBox(height: 30,),

              CustomButton(text: 'Users Page', onPressed: () => Navigator.pushNamed(context, '/users')),

            ],
          ),
        ),
      ),
    );
  }
}
