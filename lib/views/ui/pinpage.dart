import 'package:flutter/material.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                autofocus: true,
                obscureText: true,
                maxLength: 1,
                onSaved: (newValue) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                autofocus: true,
                maxLength: 1,
                onSaved: (newValue) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                decoration: const InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                autofocus: true,
                maxLength: 1,
                onSaved: (newValue) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                decoration: const InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 64,
              width: 68,
              child: TextFormField(
                autofocus: true,
                maxLength: 1,
                onSaved: (newValue) {},
                onChanged: (value) {
                  if (value.length == 1) {
                    //FocusScope.of(context).nextFocus();
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  counterText: '',
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
