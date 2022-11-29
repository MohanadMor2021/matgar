import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class country_Filter extends StatelessWidget {
  const country_Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 2, crossAxisSpacing: 2, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200)),
              child: Row(children: [
                Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/images/ps.png',
                    )),
                const Expanded(
                    flex: 1,
                    child: Text(
                      'فلسطين',
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                      ),
                    )),
              ]),
            );
          },
        ),
      ),
    );
  }
}
