import 'package:flutter/material.dart';

void main() {
  runApp(PayCalculatorApp());
}
class PayCalculatorApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // return a state?
    return _PayState();
  }
}
// create a state here
class _PayState extends State<PayCalculatorApp> {
  // here to declare the variables and functions, before the override
  
  // since it inherites from State, we need to override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // the following two are stateless widget
        backgroundColor: const Color.fromARGB(255, 225, 234, 221),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(253, 252, 252, 0),
          title: Text('Pay Calculator', 
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
        ),
        body: Center(
          child:
          // column for inputs
          Column(
            // two input field combination
            children: [
              SizedBox(height: 50,),
              // one input field combination
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Number of hours:', 
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                  const SizedBox(
                    width: 150,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '123...'
                        
                      ),
                    ),
                  )
                  
                ],

              )

            ],

          ),
        ),
      ),
    );
  }

}



