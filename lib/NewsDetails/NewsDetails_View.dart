import 'package:arena_sports_app/CommonWidgets/dividerWidget.dart';
import 'package:flutter/material.dart';
import 'package:arena_sports_app/LoginSignUpListing/LoginSgnupListingView.dart';
import 'package:arena_sports_app/SizeConfig.dart';
import 'package:arena_sports_app/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NewsDetailsView extends StatefulWidget {
  @override
  _NewsDetailsViewState createState() => _NewsDetailsViewState();
}

class _NewsDetailsViewState extends State<NewsDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 4,
                    right: SizeConfig.blockSizeHorizontal * 4),
                color: Colors.white,
                height: SizeConfig.blockSizeVertical * 13.9,
                child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical * 8,
                        bottom: SizeConfig.blockSizeVertical * 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              'assets/backArrow.svg',
                              width: 12,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "espn.com",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                            'assets/signOut.svg'), /*Icon(
                                Icons.search_rounded,
                                color: AppTheme.blackColor,
                              ),*/
                      ],
                    )),
              ),
              Container(child: GetDivider()),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: SizeConfig.blockSizeVertical * 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/newsDetailsIcon.png'),
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Text(
                      "Messi entrena con el grupo del Barcelona por primera vez bajo el mando de Koeman",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.supervised_user_circle,
                            color: AppTheme.greyColor,
                            size: 60,
                          ),
                        ),
                        Container(
                          child: Text(
                            "Jordi Blanco\nCorresponsal en Barcelona",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          margin: EdgeInsets.only(
                            left: SizeConfig.blockSizeHorizontal * 3,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "8:44 AM",
                          style: TextStyle(color: AppTheme.greyColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset(
                      'assets/Image.png',
                      fit: BoxFit.fitWidth,
                      width: SizeConfig.blockSizeHorizontal * 120,
                    ),
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockSizeVertical * 2,
                      bottom: SizeConfig.blockSizeVertical * 2,
                      left: SizeConfig.blockSizeHorizontal * 3,
                      right: SizeConfig.blockSizeHorizontal * 3,
                    ),
                    child: Text(
                      "BARCELONA -- Lionel Messi se incorporó este miércoles junto a Philippe Coutinho a los entrenamientos grupales del Barcelona, ejercitándose por primera vez a las órdenes de Ronald Koeman junto al resto de la plantilla (los disponibles) después de superar un segundo test PCR marcado por los protocolos sanitarios de LaLiga La sesión matutina contó también con la presencia de Ansu Fati, Sergio Busquets y Frenkie de Jong, \n\nregresados de los partidos de sus selecciones, y de Luis Suárez y Arturo Vidal, cuyas salidas se entiende están en la recta final de las negociaciones pero aún no se han concretado y permanecen en la dinámica normal de trabajo con el primer \n\nequipo azulgrana.Messi entrena con el grupo de Barcelona por primera vez bajo el mando de Koeman FC BarcelonEl de este miércoles fue el primer entrenamiento de Messi en compañía de la plantilla desde el 13 de agosto, jornada previa al desastre de Lisboa, antes de que sorprendiera al club con su solicitud de abandonar el club por medio de un burofax que desembocó en una crisis que se cerró con su \n\nmarcha atrás para anunciar su continuidad durante esta temporada.Estas son las cinco curiosidades de Ronald Koeman.El crack argentino comenzó su particular pretemporada el lunes por la tarde, tras pasar durante el fin de semana la primera prueba PCR, ejercitándose en solitario, tal como hizo el martes por la mañana antes de someterse a una segunda prueba (motivo por el que no se ejercitó por la tarde) \n\ny que tras volver a dar negativo le permitió entrar en la dinámica normal de trabajo, de la misma forma que ocurrió con Coutinho.De esta manera no sería nada descartable que Messi estuviera en condiciones de tomar parte en el estreno del Barça de Koeman este próximo sábado, en el amistoso previsto en el Estadi Johan Cruyff frente al Nàstic de Tarragona en el que será el primer amistoso de la pretemporada, justo en el fin de semana que comienza el campeonato de Liga en que el \n\nequipo azulgrana no entrará en competición hasta la tercera jornada, el 26 de septiembre.",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
