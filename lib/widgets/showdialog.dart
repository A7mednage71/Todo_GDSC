import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.text,
    this.cancelonPress,
    this.oKonPress,
  });

  final String text;
  final void Function()? cancelonPress;
  final void Function()? oKonPress;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, top: 10, left: 30, right: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaF6f5sjlYJh2CZI0Lt8NaoVxGcIZfsr7Qhw90goJWIQ&s",
              height: 70,
              width: 70,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: cancelonPress,
                  child: const Text(
                    "CANCEL",
                    style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                  ),
                ),
                TextButton(
                  onPressed: oKonPress,
                  child: const Text(
                    "OK",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
