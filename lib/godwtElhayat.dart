import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جودة الحياة',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: QualityOfLifeScreen(),
    );
  }
}

class QualityOfLifeScreen extends StatefulWidget {
  @override
  _QualityOfLifeScreenState createState() => _QualityOfLifeScreenState();
}

class _QualityOfLifeScreenState extends State<QualityOfLifeScreen> {
  double _progress = 0.0;
  List<bool> _checkedOptions = [false, false, false, false];

  void _updateProgress() {
    if (_checkedOptions.contains(true)) {
      setState(() {
        _progress += 0.2;
        if (_progress > 1.0) _progress = 1.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('جودة الحياة'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(value: _progress),
              SizedBox(height: 20),
              Text('اختر إجابة واحدة على الأقل:'),
              SizedBox(height: 10),
              ..._buildCheckboxes(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    _checkedOptions.contains(true) ? _updateProgress : null,
                child: Text('استمرار'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCheckboxes() {
    return List.generate(4, (index) {
      return CheckboxListTile(
        title: Text('خيار ${index + 1}'),
        value: _checkedOptions[index],
        onChanged: (bool? value) {
          setState(() {
            _checkedOptions[index] = value!;
          });
        },
      );
    });
  }
}
