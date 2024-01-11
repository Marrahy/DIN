import 'package:flutter/material.dart';

class MsgFieldBox extends StatelessWidget {
  //final ValueChanged<String> onValue;
  const MsgFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final esquemaColor = Theme.of(context).colorScheme;
    final bordeCajaInput = UnderlineInputBorder(
        borderSide: BorderSide(color: esquemaColor.surface),
        borderRadius: BorderRadius.circular(15));
    final textController = TextEditingController(

    );
    final focusNode = FocusNode();

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        final cadena = textController.value.text;
        //onValue(cadena);
        textController.clear();
        focusNode.requestFocus();
      },
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Terminar con "?" para respuesta',
        filled: true,
        enabledBorder: bordeCajaInput,
        focusedBorder: bordeCajaInput,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            final cadena = textController.value.text;
            //onValue(cadena);
            textController.clear();
          },
        )
      ),
    );
  }
}
