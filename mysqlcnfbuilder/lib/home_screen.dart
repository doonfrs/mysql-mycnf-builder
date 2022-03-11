import 'package:flutter/material.dart';
import 'package:input_slider/input_slider.dart';
import 'package:input_slider/input_slider_form.dart';
import 'package:mysqlcnfbuilder/my_cnf_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double maxConnections = 150;
  double ram = 1024;
  final MyCnfHelper _cnfHelper = MyCnfHelper();

  final TextEditingController _cnfController = TextEditingController();

  _updateCnf() {
    _cnfHelper.mbRam = ram;
    _cnfHelper.maxConnections = maxConnections;
    _cnfController.text = _cnfHelper.getCnfText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my.cnf builder'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            InputSliderForm(
                leadingWeight: 1,
                sliderWeight: 3,
                activeSliderColor: Colors.black87,
                inactiveSliderColor: Colors.green[100],
                filled: true,
                children: [
                  InputSlider(
                    onChange: (value) {
                      ram = value;
                      _updateCnf();
                    },
                    min: 512,
                    max: 1024 * 128,
                    defaultValue: 2048,
                    decimalPlaces: 0,
                    leading: const Text("Available Memory (MB)"),
                  ),
                  InputSlider(
                    onChange: (value) {
                      maxConnections = value;
                      _updateCnf();
                    },
                    min: 1,
                    max: 10000,
                    decimalPlaces: 0,
                    defaultValue: 150,
                    leading: const Text("Maximum Connections"),
                  )
                ]),
            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.grey))),
                  controller: _cnfController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
