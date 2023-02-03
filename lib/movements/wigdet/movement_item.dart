import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:warren_task_one/movements/wigdet/dolar_value.dart';
import 'package:warren_task_one/movements/wigdet/entry_value.dart';
import 'package:warren_task_one/shared/utils/util.dart';

import '../model/movement_model.dart';
import 'description_bottom_sheet.dart';

class MovementItem extends StatelessWidget {
  const MovementItem({
    super.key,
    required this.movement,
  });

  final MovementModel movement;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.black,
          context: context,
          builder: (context) {
            return DescriptionBottomSheet(movement: movement);
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 227, 228, 235),
              width: 2,
            ),
          ),
        ),
        height: size.height * .1,
        child: Padding(
          padding: EdgeInsets.only(right: size.width * .04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: AutoSizeText(
                        maxLines: 1,
                        Util.getFormatedOutValue(movement),
                        style: TextStyle(
                          fontFamily: "Mansny-light",
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 117, 118, 128),
                          fontSize: size.height * .022,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      movement.movementDate,
                      style: TextStyle(
                        fontFamily: "Mansny-light",
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 117, 118, 128),
                        fontSize: size.height * .019,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EntryValue(value: Util.getFormatedEntryValue(movement)),
                  DolarValue(value: movement.dolarValue)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
