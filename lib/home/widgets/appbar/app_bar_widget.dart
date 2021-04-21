import 'package:flutter/material.dart';

import 'package:devquiz/core/app_gradients.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/home/widgets/score_card/score_card_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250), //fica fixo em cima
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Olá, ",
                    style: AppTextStyles.title,
                    children: [
                      TextSpan(
                        text: "Sheela",
                        style: AppTextStyles.titleBold,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage("https://www.bonsfluidos.com.br/images/large/2020/07/06/o-fotografo-shaaz-jung-fez-fotos-incriveis-do-leopardo-negro-1102024.jpg"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.0, 1.0),
            child: ScoreCardWidget(),
          )
        ],
      ),
    ),
  );
}
