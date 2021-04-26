import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite, //faz ficar no meio na horizontal
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            SizedBox(height: 40,),
            Text(
              "Parabéns!",
              style: AppTextStyles.heading40,
            ),
            SizedBox(height: 16,),
            Text(
              "Você concluiu",
              style: AppTextStyles.body,
            ),
            Text(
              "$title",
              style: AppTextStyles.bodyBold,
            ),
            Text(
              "com $result de $length acertos.",
            style: AppTextStyles.body,
            ),
            /*Text.rich(
              TextSpan(
                text: "Você concluiu",
                style: AppTextStyles.body,
                children: [
                  TextSpan(
                    text: "\nGerenciamento de Estado",
                    style: AppTextStyles.bodyBold,
                  ),
                  TextSpan(
                    text: "\ncom 6 de 10 acertos.",
                    style: AppTextStyles.body,
                  )
              ]),
              textAlign: TextAlign.center,
            ),*/
            SizedBox(height: 80,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: NextButtonWidget.purple(
                      label: "Compartilhar",
                      onTap: () {
                        Share.share(
                          'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive ${result / length * 100}% aproveitamento!'
                        );
                      }),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            NextButtonWidget.transparent(
              label: "Voltar ao início",
              onTap: () {
                Navigator.pop(context);
              }),
          ],
        ),
      )
    );
  }

}
