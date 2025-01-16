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
  // we should create a seperate TextEditingController for different textfield
  var hoursController = TextEditingController();// controller for work hours
  var rateController = TextEditingController(); // controller for hourly rate
  var readHourInput = 0.0;
  var readRateInput = 0.0;
  var regular = 0.0;
  var overTime = 0.0;
  var totalPayBeforeT = 0.0;
  var tax = 0.0;
  // declare the showMessage function, later this can show the result and also calculate
  void showResult(){
    setState(() {
      // assign the value to the variables from the input
      readHourInput = double.parse(hoursController.text);
      readRateInput = double.parse(rateController.text);
      /* do calculation:
      > 40 hrs, (inout - 40) * 1.5 * rate = overtime pay
      <= 40hrs, input * rate
      tax: pay * 0.8  
      */
      if (readHourInput > 40) {
        overTime = (readHourInput - 40) * readRateInput * 1.5; // overtime pay
        regular = 40 * readRateInput; // regular pay
      }
      else {
        overTime = 0.0;
        regular = readHourInput * readRateInput;
      }
      totalPayBeforeT = regular + overTime;
      tax = totalPayBeforeT * 0.18;
      
    });
  }

  // we need to clean it up otherwise the memory will leak
  @override
  void dispose() {
    hoursController.dispose();
    rateController.dispose();
    super.dispose();
  }
  // since it inherites from State, we need to override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // the following two are stateless widget
        backgroundColor: const Color.fromARGB(255, 228, 234, 239),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Number of hours: ', 
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                  SizedBox(
                    width: 170,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true
                      ),
                      // link controller
                      controller: hoursController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '123...' ),),
                  )],
              ),
              SizedBox(height: 30,),
              // another row for the rate input
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Hourly Rate:     ",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: true
                      ),
                      controller: rateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '123...'
                      ),
                    ),
                  )
                ],
              ),
              // adding other elements here as a child of cloumn
              // Text(readRateInput), // for debugging only
              ElevatedButton(onPressed: showResult, 
              child: const Text("Calculate", style: TextStyle(fontSize: 23),)),
              Text(regular.toStringAsFixed(2)), // for debugging only
              Text(overTime.toStringAsFixed(2)), // for debugging only
              Text(totalPayBeforeT.toStringAsFixed(2)), // for debugging only
              Text(tax.toStringAsFixed(2)), // for debugging only
              // adding other elements here as a child of cloumn
              Row(
                
                children: [
                  Text("Qianhui Yu"),
                  Text("301462989")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}



