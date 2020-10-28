import 'package:arena_sports_app/Repos.dart';

QueryMutation addMutation = QueryMutation();

class Strings {
  static String arena = 'ARENA';
  static String listingText = 'Bienvenidos a Arena Sports';
  static String fbText = 'Ingresar por Facebook';
  static String googleText = 'Ingresar por Google';
  static String appleText = 'Ingresar por Apple';
  static String emailText = 'Ingresar por Email';
  static String registerButtonText = 'Registrarse';
  static String loginText = 'Inicio de sesion';
  static String notRegisted = 'No tiene cuenta? ';
  static String createUser = 'Crear usuario';
  static String Email = 'Email';
  static String password = 'Contraseña';
  static String loginButtonText = 'Ingresar';
  static String registerUser = 'Recuperar contraseña';
  static String name = "Nombre y Apellido";
  static String dob = "Fecha de Nacimiento";
  static String phone = "Telefono";
  static String save = "Guardar";
  static String alreadyAccount = "Ya tienes cuenta? ";
  static String login = "Iniciar Sesión";
  static String parents = "Pais";
  static String repeatPassword = "Repetir contraseña";
  static String register = 'Registrar';
  static String termsConditions =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pellentesque leo gravida lorem elementum, idunt nunc porta vel. Nulla gravida convallis ante, ut pulvinar odio venenatis et. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas efficitur massa sed nisl interdum, non molestie lacus rhoncus. Integer lectus sapien, convallis et condimentum non, convallis vel ligula. Morbi mi odio, congue a efficitur ac, lacinia ac quam. Morbi a lacinia libero, et scelerisque mauris. Sed in eleifend mi. Praesent sit amet placerat sapien. Fusce iaculis mi eros, sed sollicitudin lacus suscipit cursus. Suspendisse maximus et justo sed tempor. Vivamus blandit leo ligula, quis facilisis nulla aliquet nec. Mauris imperdiet rhoncus eros, id cursus neque imperdiet nec. Cras egestas sollicitudin tellus, a iaculis arcu. Mauris scelerisque erat vel aliquam placerat. Maecenas at ornare tortor, nec pulvinar diam.Duis lacinia ipsum vitae ligula aliquet, nec volutpat elit iaculis. Fusce efficitur in nunc id egestas. Vestibulum consectetur dignissim justo convallis pretium. Praesent nisi nisi, rutrum a dapibus nec, commodo ac urna. Pellentesque sodales consectetur odio. Suspendisse porttitor arcu nec est commodo, sit amet feugiat neque finibus. Aliquam erat volutpat. Nunc porta vitae nisi vitae vulputate. Aliquam et velit nec est semper tristique et at lorem. Proin quis aliquet velit. Nullam cursus et risus ac euismod. Cras varius ante est, quis rhoncus leo viverra vel. Maecenas dictum consectetur nunc nec varius. Suspendisse vel nunc bibendum, bibendum tortor ut, malesuada sem. In pellentesque congue nibh.Cras convallis efficitur enim et eleifend. Etiam laoreet quam nec tincidunt lobortis. Nullam tristique egestas enim at semper. Nulla purus ex, cursus vitae lorem ut, convallis consectetur sem. Sed vel nisl sed diam feugiat scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras aliquet est fermentum tincidunt laoreet. Donec vitae ante at diam sodales semper in fermentum mi. Nulla convallis porttitor risus non convallis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Quisque commodo vestibulum lorem, vel congue tellus malesuada varius. Pellentesque ut efficitur diam. Nulla vel feugiat turpis. Sed mattis viverra semper.Nullam quis arcu sapien. Maecenas eget nisi semper, fermentum felis nec, pretium enim. Nunc congue lectus nulla, vel lobortis odio ultricies quis. Mauris a posuere est. Nunc accumsan leo sed augue vestibulum tincidunt. Morbi commodo enim nec ligula pretium blandit. Quisque id vulputate arcu. Nulla vel nisl id ex ";
  static String termsText = "Terminos y Condiciones";
  static String termsTitle = "Primer termino";
  static String termsReject = "Rechazar";
  static String termsAccept = "Aceptar";
  static String date_of_birth = "DATE OF BIRTH";
  static String matches = "Matches";
  static String see_all = "Ver todos";
  static String UEFA_Champions_League = "UEFA Champions League";
  static String barcelona = "Barcelona";
  static String scores = "2";
  static String numbers = "62’";
  static String Borussia_Dortmund = "Borussia Dortmund";
  static String time = "21:00";
  static String Atalanta = "Atalanta";
  static String Finished = "Terminado";
  static String Recover_password = "Recuperar contraseña";
  static String Recover = "Recover";
  static String myProfile = "Mi Perfil";
  static String Getout = "Salir";
  static String dummyName = "Fernando Martinez";
  static String dummyEmail = "@fernando";
  static String Profile = "PERFIL";
  static String myInformation = "Mi informacion";
  static String general = "GENERAL";
  static String notification = "Notificaciones";
  static String darkMode = "Dark Mode";
  static String myApp = "My App";
  static String Legal = "LEGAL";
  static String privacySettings = "Ajustes de privacidad";
  static String PrivacyPolicy = "Política de privacidad";
  static String termsCond = "Terminos y condiciones";
  static String Licenses = "Licencias";
  static String Notice = "Aviso";
  static String Support = "Soporte";
  static String espn = "espn.com";
  static String newsTitle =
      "Messi entrena con el grupo del Barcelona por primera vez bajo el mando de Koeman";
  static String newsDesc = "Jordi Blanco\nCorresponsal en Barcelona";
  static String newstime = "8:44 AM";
  static String newsDetails =
      "BARCELONA -- Lionel Messi se incorporó este miércoles junto a Philippe Coutinho a los entrenamientos grupales del Barcelona, ejercitándose por primera vez a las órdenes de Ronald Koeman junto al resto de la plantilla (los disponibles) después de superar un segundo test PCR marcado por los protocolos sanitarios de LaLiga La sesión matutina contó también con la presencia de Ansu Fati, Sergio Busquets y Frenkie de Jong, \n\nregresados de los partidos de sus selecciones, y de Luis Suárez y Arturo Vidal, cuyas salidas se entiende están en la recta final de las negociaciones pero aún no se han concretado y permanecen en la dinámica normal de trabajo con el primer \n\nequipo azulgrana.Messi entrena con el grupo de Barcelona por primera vez bajo el mando de Koeman FC BarcelonEl de este miércoles fue el primer entrenamiento de Messi en compañía de la plantilla desde el 13 de agosto, jornada previa al desastre de Lisboa, antes de que sorprendiera al club con su solicitud de abandonar el club por medio de un burofax que desembocó en una crisis que se cerró con su \n\nmarcha atrás para anunciar su continuidad durante esta temporada.Estas son las cinco curiosidades de Ronald Koeman.El crack argentino comenzó su particular pretemporada el lunes por la tarde, tras pasar durante el fin de semana la primera prueba PCR, ejercitándose en solitario, tal como hizo el martes por la mañana antes de someterse a una segunda prueba (motivo por el que no se ejercitó por la tarde) \n\ny que tras volver a dar negativo le permitió entrar en la dinámica normal de trabajo, de la misma forma que ocurrió con Coutinho.De esta manera no sería nada descartable que Messi estuviera en condiciones de tomar parte en el estreno del Barça de Koeman este próximo sábado, en el amistoso previsto en el Estadi Johan Cruyff frente al Nàstic de Tarragona en el que será el primer amistoso de la pretemporada, justo en el fin de semana que comienza el campeonato de Liga en que el \n\nequipo azulgrana no entrará en competición hasta la tercera jornada, el 26 de septiembre.";
  static String selectCountry = "Select Pais";
  static String Setup = "Configurar";
  static String playerDetails = "Fernando Martinez \n\n12/01/1954";
  static String live = "Live";
  static String Live = "LIVE";
  static String US_OPEN = "US OPEN";
  static String playerName = "D. Thiem";
  static String news = "NOTICIAS";
  static String aboutPlayer =
      "Messi entrena con el grupo del \ Barcelona por primera vez bajo el mando de Koeman";
  static String text = "Koeman le comunica a Sergio  Busquets su";
  static String textTime = "11.08";
  static String text1 =
      "Pirlo confirmó que no tendrá en cuenta a Higuaín en Juventus";
  static String videos = "VIDEOS";
  static String text2 = "Jugadas principales de PSG y Bayern";
  static String matches1 = "PARTIDOS";
  static String Chelsea = "Chelsea";
  static String Direct_TV = "Direct TV";
  static String transfers = "TRASPASOS";
  static String name1 = "Luis Suáre";
  static String teamName = "Barcelona FC";
  static String name2 = "A. Madrid";
  static String name3 = "Prestamo";
  static String Espn = "ESPN";
  static String time2 = "58 min";
}
