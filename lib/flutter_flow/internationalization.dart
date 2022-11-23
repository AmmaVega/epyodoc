import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en', 'it'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
    String? itText = '',
  }) =>
      [esText, enText, itText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'g4b4fcen': {
      'es': 'Inicia sesión',
      'en': '',
      'it': '',
    },
    '3g5lfjmx': {
      'es': 'Correo',
      'en': '',
      'it': '',
    },
    '1mjifz4d': {
      'es': 'email',
      'en': '',
      'it': '',
    },
    '0fgpleci': {
      'es': 'Password',
      'en': '',
      'it': '',
    },
    'qklw8te3': {
      'es': 'teclear contraseña',
      'en': '',
      'it': '',
    },
    'uvn1d5la': {
      'es': 'Acceso ',
      'en': '',
      'it': '',
    },
    'f7d1thar': {
      'es': 'Recuperar contraseña',
      'en': '',
      'it': '',
    },
    'gie20ps4': {
      'es': 'Continue as Guest',
      'en': '',
      'it': '',
    },
    'muit0l4p': {
      'es': 'Regístrate',
      'en': '',
      'it': '',
    },
    'caho6ck7': {
      'es': 'Correo ',
      'en': '',
      'it': '',
    },
    '2flqwna8': {
      'es': 'Correo electrónico',
      'en': '',
      'it': '',
    },
    '2b2j600i': {
      'es': 'Password',
      'en': '',
      'it': '',
    },
    'q4j093hj': {
      'es': 'teclee su contraseña',
      'en': '',
      'it': '',
    },
    'shoc2fxf': {
      'es': 'Confirmar',
      'en': '',
      'it': '',
    },
    '62f60esv': {
      'es': 'confirme su contraseña',
      'en': '',
      'it': '',
    },
    '6ol1bsnz': {
      'es': 'Acepto Términos ',
      'en': '',
      'it': '',
    },
    'a4pmje2d': {
      'es': 'Regístrate ',
      'en': '',
      'it': '',
    },
    '81wjgnlt': {
      'es': 'Continue as Guest',
      'en': '',
      'it': '',
    },
    '4rk0uuon': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // completeProfile
  {
    'owsmlf6n': {
      'es': 'Completa tu registro',
      'en': '',
      'it': '',
    },
    'f3knomtf': {
      'es': 'Foto de identificación',
      'en': '',
      'it': '',
    },
    'qkrgpu1z': {
      'es': 'Nombre ',
      'en': '',
      'it': '',
    },
    'nhyabcmd': {
      'es': 'Nombre completo por favor',
      'en': '',
      'it': '',
    },
    '43rxw8hy': {
      'es': 'Edad',
      'en': '',
      'it': '',
    },
    'y46euo7s': {
      'es': 'ejem- 34',
      'en': '',
      'it': '',
    },
    '191aqi79': {
      'es': 'Enfermedades/Especialidad',
      'en': '',
      'it': '',
    },
    'qmjek2mu': {
      'es': 'Describa por favor',
      'en': '',
      'it': '',
    },
    'vh7xni1a': {
      'es': 'Paciente ',
      'en': '',
      'it': '',
    },
    '07tfr4vl': {
      'es': 'Médico',
      'en': '',
      'it': '',
    },
    'ycdi2uw3': {
      'es': 'Sexo',
      'en': '',
      'it': '',
    },
    '976p1irh': {
      'es': 'Hombre',
      'en': '',
      'it': '',
    },
    'ia8qskhi': {
      'es': 'Mujer',
      'en': '',
      'it': '',
    },
    'qdrnxt5t': {
      'es': 'Indeterminado',
      'en': '',
      'it': '',
    },
    '6fkqxmal': {
      'es': 'Add Another Profile',
      'en': '',
      'it': '',
    },
    'kyyp25ur': {
      'es': 'Complete Profile',
      'en': '',
      'it': '',
    },
    '4ba5up05': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // forgotPassword
  {
    'lhwrptz6': {
      'es': 'Cambiar la contraseña',
      'en': '',
      'it': '',
    },
    'knbzwdnc': {
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
      'en': '',
      'it': '',
    },
    '1hmx3w3p': {
      'es': 'Correo',
      'en': '',
      'it': '',
    },
    'ie0ydui0': {
      'es': 'Su correo electrónico',
      'en': '',
      'it': '',
    },
    'weyk3lon': {
      'es': 'Enviar Código',
      'en': '',
      'it': '',
    },
    'os4uplfk': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // addAnotherProfile
  {
    'euohgzaf': {
      'es': 'Add Another Profile',
      'en': '',
      'it': '',
    },
    'vxkpfzou': {
      'es': 'Upload a photo for us to easily identify this person.',
      'en': '',
      'it': '',
    },
    'gfmnrbwp': {
      'es': 'Persons Name',
      'en': '',
      'it': '',
    },
    'vgtwc3ul': {
      'es': 'Official name here...',
      'en': '',
      'it': '',
    },
    'dy6hl72r': {
      'es': 'Persons Age',
      'en': '',
      'it': '',
    },
    'rhxn6d7e': {
      'es': 'i.e. 34',
      'en': '',
      'it': '',
    },
    'tx6gxwtx': {
      'es': 'Persons Ailments',
      'en': '',
      'it': '',
    },
    'bpbfrxyd': {
      'es': 'What types of allergies do they have..',
      'en': '',
      'it': '',
    },
    '6ddf3fep': {
      'es': 'Location',
      'en': '',
      'it': '',
    },
    'b5lz3kgv': {
      'es': 'Please enter a valid email...',
      'en': '',
      'it': '',
    },
    'd4283gmo': {
      'es': 'Persons Birth Sex',
      'en': '',
      'it': '',
    },
    'd5egf1i6': {
      'es': 'Male',
      'en': '',
      'it': '',
    },
    'ov4ld5fg': {
      'es': 'Female',
      'en': '',
      'it': '',
    },
    'zyrsj8r0': {
      'es': 'Undisclosed',
      'en': '',
      'it': '',
    },
    'i76lsnd4': {
      'es': 'Complete Profile',
      'en': '',
      'it': '',
    },
    'v4yotfvz': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // onboarding
  {
    'fmgdytab': {
      'es': 'Mantente en contacto',
      'en': '',
      'it': '',
    },
    'wiaz5cgq': {
      'es': 'Ten siempre a tu alcance tu consultorio médico.',
      'en': '',
      'it': '',
    },
    '0nu75vtz': {
      'es': 'Schedule Appointments',
      'en': '',
      'it': '',
    },
    '4i56vm2v': {
      'es':
          'Easily schedule appointments for checkups,  routine procedures, etc.',
      'en': '',
      'it': '',
    },
    '9iv1b4e0': {
      'es': 'Doctor in your pocket',
      'en': '',
      'it': '',
    },
    'wwn2ectx': {
      'es': 'Easily find symptoms and common factors that affect you daily.',
      'en': '',
      'it': '',
    },
    'yr8b9gc4': {
      'es': 'Continuar',
      'en': '',
      'it': '',
    },
    'gnfqoaoy': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // myAppointments
  {
    'xu6fmnfp': {
      'es': 'Registros',
      'en': '',
      'it': '',
    },
    'qac309sb': {
      'es': 'Mis Citas',
      'en': '',
      'it': '',
    },
    'f4l92r8g': {
      'es': '•',
      'en': '',
      'it': '',
    },
  },
  // appointmentDetails
  {
    '7x9alepk': {
      'es': 'Detalles',
      'en': '',
      'it': '',
    },
    'zxn397ab': {
      'es': 'Cita Programada para: ',
      'en': '',
      'it': '',
    },
    '6jxoknvg': {
      'es': 'Problema presentado:',
      'en': '',
      'it': '',
    },
    'n67j2jic': {
      'es': 'Paciente',
      'en': '',
      'it': '',
    },
    'jndpcp4m': {
      'es': '¿Cuándo?',
      'en': '',
      'it': '',
    },
    '6idahert': {
      'es': 'Re-Agendar',
      'en': '',
      'it': '',
    },
    '6lld5ia9': {
      'es': 'Cancelar Cita',
      'en': '',
      'it': '',
    },
    '5plby6km': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // homePage
  {
    'ojzvr92c': {
      'es': 'Bienvenido',
      'en': '',
      'it': '',
    },
    '9vkmgp0z': {
      'es': 'Your next appointment',
      'en': '',
      'it': '',
    },
    'a9jbwy9s': {
      'es': 'For',
      'en': '',
      'it': '',
    },
    'uwlndoos': {
      'es': 'Agendar Cita',
      'en': '',
      'it': '',
    },
    'fql1w7e3': {
      'es': 'Agenda una cita / estudio ',
      'en': '',
      'it': '',
    },
    'vm32c1ad': {
      'es': 'Expediente clínico',
      'en': '',
      'it': '',
    },
    'te4p10wc': {
      'es': 'Recetas Medicas, Estudios, Diagnósticos, Notas Medicas',
      'en': '',
      'it': '',
    },
    '5g11a5z5': {
      'es': 'Lectura signos vitales',
      'en': '',
      'it': '',
    },
    'jn02zvaf': {
      'es': 'Sensores activos, históricos, crisis, alertas ',
      'en': '',
      'it': '',
    },
    'l0zfa5dz': {
      'es': '•',
      'en': '',
      'it': '',
    },
  },
  // profilePage
  {
    '39dfg4fa': {
      'es': 'Enfermedades y Afecciones',
      'en': '',
      'it': '',
    },
    'n4xico6j': {
      'es': 'Próxima cita',
      'en': '',
      'it': '',
    },
    'stt5g15g': {
      'es': 'Aug 20, 2021',
      'en': '',
      'it': '',
    },
    'nkosm5fl': {
      'es': 'Switch to Dark Mode',
      'en': '',
      'it': '',
    },
    'avxcsud5': {
      'es': 'Switch to Light Mode',
      'en': '',
      'it': '',
    },
    'php9bc6h': {
      'es': 'Registro de Citas',
      'en': '',
      'it': '',
    },
    '18vgukrw': {
      'es': 'For',
      'en': '',
      'it': '',
    },
    'xhenp1u5': {
      'es': '•',
      'en': '',
      'it': '',
    },
  },
  // findSymptoms
  {
    'oboeerck': {
      'es': 'Expediente Clínico',
      'en': '',
      'it': '',
    },
    '5mmmuv4w': {
      'es': 'Busqueda de Expediente',
      'en': '',
      'it': '',
    },
    'euke4vfd': {
      'es': 'Teclee fecha o medico que realizo \nla nota medica y/o estudio',
      'en': '',
      'it': '',
    },
    '6j2jjdr7': {
      'es': '[Symptom Name]',
      'en': '',
      'it': '',
    },
    '9u9ccr63': {
      'es':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'en': '',
      'it': '',
    },
    'egd0hgyw': {
      'es': '[Symptom Name]',
      'en': '',
      'it': '',
    },
    '93i8f4kn': {
      'es':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'en': '',
      'it': '',
    },
    '0wpf95b0': {
      'es': '[Symptom Name]',
      'en': '',
      'it': '',
    },
    '302t8zkr': {
      'es':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'en': '',
      'it': '',
    },
    'o9qf2wrv': {
      'es': '[Symptom Name]',
      'en': '',
      'it': '',
    },
    'gqe226mx': {
      'es':
          'Convulsive disorder that does something and extra content goes here because that is where it goes okay, don’t question.',
      'en': '',
      'it': '',
    },
    '7dcyxdqx': {
      'es': '•',
      'en': '',
      'it': '',
    },
  },
  // editProfile
  {
    'i8t9206j': {
      'es': 'Editar Cuenta',
      'en': '',
      'it': '',
    },
    'e8ng1499': {
      'es': 'Cambiar Foto',
      'en': '',
      'it': '',
    },
    'v6ha56pi': {
      'es': 'Nombre',
      'en': '',
      'it': '',
    },
    'l0ip14jo': {
      'es': 'Please enter a valid number...',
      'en': '',
      'it': '',
    },
    '0l8axfbp': {
      'es': 'Correo',
      'en': '',
      'it': '',
    },
    'vl1i85hv': {
      'es': 'Your email',
      'en': '',
      'it': '',
    },
    'rmlfyr7e': {
      'es': 'Edad',
      'en': '',
      'it': '',
    },
    'ggoy5mgn': {
      'es': 'i.e. 34',
      'en': '',
      'it': '',
    },
    'ld4dl06x': {
      'es': 'Enfermedades y Afecciones',
      'en': '',
      'it': '',
    },
    '7vdfywwt': {
      'es': 'What types of allergies do you have..',
      'en': '',
      'it': '',
    },
    'hraheatu': {
      'es': 'Sexo',
      'en': '',
      'it': '',
    },
    '2wdc69w9': {
      'es': 'Hombre',
      'en': '',
      'it': '',
    },
    'ev6gmtst': {
      'es': 'Mujer',
      'en': '',
      'it': '',
    },
    '8h4j3q5h': {
      'es': 'Indeterminado',
      'en': '',
      'it': '',
    },
    '9f5xd75q': {
      'es': 'Salvar Cambios',
      'en': '',
      'it': '',
    },
    'xk4mzmg4': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // appointmentDetailsProfile
  {
    'vhyh09u8': {
      'es': 'Detalle',
      'en': '',
      'it': '',
    },
    '7v53jjd9': {
      'es': 'Cita programada',
      'en': '',
      'it': '',
    },
    'khh7ujtv': {
      'es': 'Descripción de padecimientos',
      'en': '',
      'it': '',
    },
    '3qkmbm71': {
      'es': 'Para',
      'en': '',
      'it': '',
    },
    'hj0v3m04': {
      'es': 'Cuando',
      'en': '',
      'it': '',
    },
    'dbiwfteg': {
      'es': 'Cancelar Cita',
      'en': '',
      'it': '',
    },
    '9h0opibh': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // selecMedico
  {
    '3ff7fj62': {
      'es': 'Seleccione su(s) Médicos:',
      'en': '',
      'it': '',
    },
    'dq68518x': {
      'es': 'Medicos',
      'en': '',
      'it': '',
    },
    'encj18q4': {
      'es': 'Medicos Regstrados',
      'en': '',
      'it': '',
    },
    'xg5cvdoy': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // mainChat
  {
    'sfz57lnl': {
      'es': 'Comunicación con su Medico',
      'en': '',
      'it': '',
    },
  },
  // addChat
  {
    'xkwzs2vc': {
      'es': 'Médicos disponibles',
      'en': '',
      'it': '',
    },
  },
  // chatMessange
  {
    'wyc9wl57': {
      'es': 'Hello World',
      'en': '',
      'it': '',
    },
  },
  // expdienteRecetas
  {
    'ryx0qp23': {
      'es': 'fecha, nombre medico...',
      'en': '',
      'it': '',
    },
    'gst23zm7': {
      'es': 'Mas filtros',
      'en': '',
      'it': '',
    },
    'xvw8yh2k': {
      'es': 'Expediente',
      'en': '',
      'it': '',
    },
    '32bclrfy': {
      'es': 'Cardiologist - Steven Pauliner',
      'en': '',
      'it': '',
    },
    'xzkmquxw': {
      'es': '15/11/2019',
      'en': '',
      'it': '',
    },
    'exhc5w2n': {
      'es': 'Dermatologist - Noemi Shinte',
      'en': '',
      'it': '',
    },
    'bfxj9bne': {
      'es': '15/11/2022',
      'en': '',
      'it': '',
    },
    'm4g6dtyh': {
      'es': 'Orthopedic - Stefano Lanza',
      'en': '',
      'it': '',
    },
    '1hzvwodt': {
      'es': '15/11/2022',
      'en': '',
      'it': '',
    },
    '29ua2m6r': {
      'es': 'Receta',
      'en': '',
      'it': '',
    },
    'nabjubhw': {
      'es': 'Orthopedic - Stefano Lanza',
      'en': '',
      'it': '',
    },
    'x3u044tn': {
      'es': '15/11/2022',
      'en': '',
      'it': '',
    },
    'qs66f69l': {
      'es': 'Medico Familiar',
      'en': '',
      'it': '',
    },
    'p02j00z8': {
      'es': '15/11/2021',
      'en': '',
      'it': '',
    },
    'ppg3g09v': {
      'es': 'Estudios',
      'en': '',
      'it': '',
    },
    'sj1zoaz4': {
      'es': 'Radiografia - Steven Pauliner',
      'en': '',
      'it': '',
    },
    'srky7sfm': {
      'es': '15/11/2019',
      'en': '',
      'it': '',
    },
    '3pam7842': {
      'es': 'Tomografia - Steven Pauliner',
      'en': '',
      'it': '',
    },
    '6pbv1f94': {
      'es': '15/11/2019',
      'en': '',
      'it': '',
    },
    'ubiaf8f6': {
      'es': 'Analisis Sangre - Steven Pauliner',
      'en': '',
      'it': '',
    },
    '44yb5b9n': {
      'es': '15/11/2019',
      'en': '',
      'it': '',
    },
    '7glazcwl': {
      'es': 'Historia Clínica',
      'en': '',
      'it': '',
    },
    'fagowszk': {
      'es': '•',
      'en': '',
      'it': '',
    },
  },
  // avisoLegal
  {
    '595s3yo3': {
      'es': 'Aviso Legal',
      'en': '',
      'it': '',
    },
    'lo50ww7g': {
      'es':
          'Privacy Policy of \nEPYDOC\n\nThis Application collects some Personal Data from its Users.\n\nThis document can be printed for reference by using the print command in the settings of any browser.\nOwner and Data Controller\nAmmadeus Vega Torres\nEstudiante ITESM Monteerrye\nNueva Viscaya 481\nSaltillo Coahuila, Mexico\nOwner contact email: info@iubenda.com\nTypes of Data collected\nAmong the types of Personal Data that this Application collects, by itself or through third parties, there are: Contacts permission; Camera permission; Microphone permission; Social media accounts permission; Approximate location permission (continuous); Cookies; Usage Data; email address; password; unique device identifiers for advertising (Google Advertiser ID or IDFA, for example).\nComplete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or by specific explanation texts displayed prior to the Data collection.\nPersonal Data may be freely provided by the User, or, in case of Usage Data, collected automatically when using this Application.\nUnless specified otherwise, all Data requested by this Application is mandatory and failure to provide this Data may make it impossible for this Application to provide its services. In cases where this Application specifically states that some Data is not mandatory, Users are free not to communicate this Data without consequences to the availability or the functioning of the Service.\nUsers who are uncertain about which Personal Data is mandatory are welcome to contact the Owner.\nAny use of Cookies – or of other tracking tools – by this Application or by the owners of third-party services used by this Application serves the purpose of providing the Service required by the User, in addition to any other purposes described in the present document and in the Cookie Policy, if available.\nUsers are responsible for any third-party Personal Data obtained, published or shared through this Application and confirm that they have the third party\'s consent to provide the Data to the Owner.\nMode and place of processing the Data\nMethods of processing\nThe Owner takes appropriate security measures to prevent unauthorized access, disclosure, modification, or unauthorized destruction of the Data.\nThe Data processing is carried out using computers and/or IT enabled tools, following organizational procedures and modes strictly related to the purposes indicated. In addition to the Owner, in some cases, the Data may be accessible to certain types of persons in charge, involved with the operation of this Application (administration, sales, marketing, legal, system administration) or external parties (such as third-party technical service providers, mail carriers, hosting providers, IT companies, communications agencies) appointed, if necessary, as Data Processors by the Owner. The updated list of these parties may be requested from the Owner at any time.\nLegal basis of processing\nThe Owner may process Personal Data relating to Users if one of the following applies:\n•\tUsers have given their consent for one or more specific purposes. Note: Under some legislations the Owner may be allowed to process Personal Data until the User objects to such processing (“opt-out”), without having to rely on consent or any other of the following legal bases. This, however, does not apply, whenever the processing of Personal Data is subject to European data protection law;\n•\tprovision of Data is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof;\n•\tprocessing is necessary for compliance with a legal obligation to which the Owner is subject;\n•\tprocessing is related to a task that is carried out in the public interest or in the exercise of official authority vested in the Owner;\n•\tprocessing is necessary for the purposes of the legitimate interests pursued by the Owner or by a third party.\nIn any case, the Owner will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\nPlace\nThe Data is processed at the Owner\'s operating offices and in any other places where the parties involved in the processing are located.\n\nDepending on the User\'s location, data transfers may involve transferring the User\'s Data to a country other than their own. To find out more about the place of processing of such transferred Data, Users can check the section containing details about the processing of Personal Data.\nUsers are also entitled to learn about the legal basis of Data transfers to a country outside the European Union or to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data.\n\nIf any such transfer takes place, Users can find out more by checking the relevant sections of this document or inquire with the Owner using the information provided in the contact section.\nRetention time\nPersonal Data shall be processed and stored for as long as required by the purpose they have been collected for.\nTherefore:\n•\tPersonal Data collected for purposes related to the performance of a contract between the Owner and the User shall be retained until such contract has been fully performed.\n•\tPersonal Data collected for the purposes of the Owner’s legitimate interests shall be retained as long as needed to fulfill such purposes. Users may find specific information regarding the legitimate interests pursued by the Owner within the relevant sections of this document or by contacting the Owner.\nThe Owner may be allowed to retain Personal Data for a longer period whenever the User has given consent to such processing, as long as such consent is not withdrawn. Furthermore, the Owner may be obliged to retain Personal Data for a longer period whenever required to do so for the performance of a legal obligation or upon order of an authority.\n\nOnce the retention period expires, Personal Data shall be deleted. Therefore, the right of access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after expiration of the retention period.\nThe purposes of processing\nThe Data concerning the User is collected to allow the Owner to provide its Service, comply with its legal obligations, respond to enforcement requests, protect its rights and interests (or those of its Users or third parties), detect any malicious or fraudulent activity, as well as the following: Device permissions for Personal Data access, Analytics, Registration and authentication, Access to third-party accounts, Registration and authentication provided directly by this Application and Advertising.\nFor specific information about the Personal Data used for each purpose, the User may refer to the section “Detailed information on the processing of Personal Data”.\nFacebook permissions asked by this Application\nThis Application may ask for some Facebook permissions allowing it to perform actions with the User\'s Facebook account and to retrieve information, including Personal Data, from it. This service allows this Application to connect with the User\'s account on the Facebook social network, provided by Facebook Inc.\nFor more information about the following permissions, refer to the Facebook permissions documentation and to the Facebook privacy policy.\nThe permissions asked are the following:\nBasic information\nBy default, this includes certain User’s Data such as id, name, picture, gender, and their locale. Certain connections of the User, such as the Friends, are also available. If the User has made more of their Data public, more information will be available.\nEmail\nProvides access to the User\'s primary email address.\nDevice permissions for Personal Data access\nDepending on the User\'s specific device, this Application may request certain permissions that allow it to access the User\'s device Data as described below.\nBy default, these permissions must be granted by the User before the respective information can be accessed. Once the permission has been given, it can be revoked by the User at any time. In order to revoke these permissions, Users may refer to the device settings or contact the Owner for support at the contact details provided in the present document.\nThe exact procedure for controlling app permissions may be dependent on the User\'s device and software.\nPlease note that the revoking of such permissions might impact the proper functioning of this Application.\nIf User grants any of the permissions listed below, the respective Personal Data may be processed (i.e accessed to, modified or removed) by this Application.\nApproximate location permission (continuous)\nUsed for accessing the User\'s approximate device location. This Application may collect, use, and share User location Data in order to provide location-based services.\nCamera permission\nUsed for accessing the camera or capturing images and video from the device.\nContacts permission\nUsed for accessing contacts and profiles on the User\'s device, including the changing of entries.\nMicrophone permission\nAllows accessing and recording microphone audio from the User\'s device.\nSocial media accounts permission\nUsed for accessing the User\'s social media account profiles, such as Facebook and Twitter.\n',
      'en': '',
      'it': '',
    },
    'bzegcuqz': {
      'es': 'Acepto',
      'en': '',
      'it': '',
    },
    '9a5nkbiu': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // mainSensores
  {
    'qv7hqnqw': {
      'es': 'Estado actual',
      'en': '',
      'it': '',
    },
    'exi6kk42': {
      'es': 'Pulso Cardiaco',
      'en': '',
      'it': '',
    },
    'j9fa078e': {
      'es': '74 RPM',
      'en': '',
      'it': '',
    },
    'tw8wglhx': {
      'es': 'Temperatura',
      'en': '',
      'it': '',
    },
    'trlwk9cp': {
      'es': '36 oC',
      'en': '',
      'it': '',
    },
    '0gul527j': {
      'es': 'Historico',
      'en': '',
      'it': '',
    },
    '6wc3irjx': {
      'es': 'Valores: 15/11/200 - Hoy',
      'en': '',
      'it': '',
    },
    'yoapked2': {
      'es': 'seleccionar perido',
      'en': '',
      'it': '',
    },
    '56qygsm5': {
      'es': 'Alertas Detectadas',
      'en': '',
      'it': '',
    },
    'gxgnpe3k': {
      'es': 'Historico ultimo año',
      'en': '',
      'it': '',
    },
    'zv833l8h': {
      'es': 'Programar Monitoreo',
      'en': '',
      'it': '',
    },
    '31vb3g09': {
      'es': 'Definir periodo de monitoreo',
      'en': '',
      'it': '',
    },
    'r493amv4': {
      'es': 'Sensores',
      'en': '',
      'it': '',
    },
    '93s04zpw': {
      'es': '__',
      'en': '',
      'it': '',
    },
  },
  // searchDoctor
  {
    '3popwkbe': {
      'es': 'Médicos en el EPY',
      'en': '',
      'it': '',
    },
    'r6o4lljd': {
      'es': 'Búsqueda por especialidad, \nnombre, ciudad',
      'en': '',
      'it': '',
    },
    '89f6kt9k': {
      'es': 'Médicos Asociados a su cuenta',
      'en': '',
      'it': '',
    },
    '2sw92364': {
      'es': 'Luis Mensoda',
      'en': '',
      'it': '',
    },
    'niljcgb2': {
      'es': 'Pediatra',
      'en': '',
      'it': '',
    },
    'bvfobn8f': {
      'es': 'Angelica Mendoza',
      'en': '',
      'it': '',
    },
    '5jd59fj6': {
      'es': 'Enfermera',
      'en': '',
      'it': '',
    },
    'hof2veqs': {
      'es': 'Luis Perez',
      'en': '',
      'it': '',
    },
    'xle2s5qt': {
      'es': 'Dermatologo',
      'en': '',
      'it': '',
    },
    'b4uf6t7b': {
      'es': 'Médicos Cerca (geográficamente) de usted',
      'en': '',
      'it': '',
    },
    'gmgfaowh': {
      'es': 'user@domainname.com',
      'en': '',
      'it': '',
    },
    'u502mb2p': {
      'es': 'View',
      'en': '',
      'it': '',
    },
    'aj3kkhdi': {
      'es': 'user@domainname.com',
      'en': '',
      'it': '',
    },
    'j4uaz0i8': {
      'es': 'View',
      'en': '',
      'it': '',
    },
    '4c7x44nx': {
      'es': 'Linda Perez',
      'en': '',
      'it': '',
    },
    '99d43g6t': {
      'es': 'user@domainname.com',
      'en': '',
      'it': '',
    },
    'whmvqe5e': {
      'es': 'View',
      'en': '',
      'it': '',
    },
    'snvcfwty': {
      'es': 'Asucena Mendoza',
      'en': '',
      'it': '',
    },
    'm0lbm6yn': {
      'es': 'user@domainname.com',
      'en': '',
      'it': '',
    },
    'yzbvh7pe': {
      'es': 'View',
      'en': '',
      'it': '',
    },
    'i122k95w': {
      'es': 'user@domainname.com',
      'en': '',
      'it': '',
    },
    'os02rdi3': {
      'es': 'View',
      'en': '',
      'it': '',
    },
    'b3ngbkw3': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // dettMedico
  {
    'gj9s9age': {
      'es': 'Lorenzo Mendoza',
      'en': '',
      'it': '',
    },
    'eosjblj7': {
      'es': 'Pediatra',
      'en': '',
      'it': '',
    },
    'of59intk': {
      'es': 'Descripción',
      'en': '',
      'it': '',
    },
    '0mh0qz0j': {
      'es':
          'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. ',
      'en': '',
      'it': '',
    },
    '5lnsjkck': {
      'es': 'Días de consulta disponibles',
      'en': '',
      'it': '',
    },
    'urbsvwge': {
      'es': '4',
      'en': '',
      'it': '',
    },
    'v0nrcj6t': {
      'es': '5',
      'en': '',
      'it': '',
    },
    '6wojin8i': {
      'es': '6',
      'en': '',
      'it': '',
    },
    '1ohsp05b': {
      'es': '7',
      'en': '',
      'it': '',
    },
    'tytihoxx': {
      'es': '8',
      'en': '',
      'it': '',
    },
    'auei3oki': {
      'es': '9',
      'en': '',
      'it': '',
    },
    'enq4ca3u': {
      'es': '10',
      'en': '',
      'it': '',
    },
    'es7c2ppy': {
      'es': '11',
      'en': '',
      'it': '',
    },
    'lzqaq4kb': {
      'es': '12',
      'en': '',
      'it': '',
    },
    'src5zshu': {
      'es': '13',
      'en': '',
      'it': '',
    },
    '7lcivc6i': {
      'es': '14',
      'en': '',
      'it': '',
    },
    '4fcq5ibj': {
      'es': 'Agendar Cita',
      'en': '',
      'it': '',
    },
    'fffdc3j9': {
      'es': 'Contactarlo',
      'en': '',
      'it': '',
    },
    '7sdftdmk': {
      'es': 'Home',
      'en': '',
      'it': '',
    },
  },
  // homePageCopy
  {
    'r3nwfhsz': {
      'es': 'Bienvenido',
      'en': '',
      'it': '',
    },
    '6mh97ztq': {
      'es': 'Citas Programadas',
      'en': '',
      'it': '',
    },
    'c1l41hjn': {
      'es': 'For',
      'en': '',
      'it': '',
    },
    '5vbf4v6v': {
      'es': 'Estatus de sus Pacientes',
      'en': '',
      'it': '',
    },
    '7mna1nxs': {
      'es': 'Monitoreo, Seguimiento, Alertas',
      'en': '',
      'it': '',
    },
    '2yo4g6qo': {
      'es': 'Expediente clínico',
      'en': '',
      'it': '',
    },
    'gys1m10k': {
      'es': 'Recetas Medicas, Estudios, Diagnósticos, Notas Medicas',
      'en': '',
      'it': '',
    },
    'akrh9d4l': {
      'es': 'Biblioteca',
      'en': '',
      'it': '',
    },
    'ywe5hvny': {
      'es': 'Calibrar Sensores, Medicamento Vs Sensores, etc',
      'en': '',
      'it': '',
    },
    'i2pni37t': {
      'es': '•',
      'en': '',
      'it': '',
    },
  },
  // monitorPacientes
  {
    'ajc0mr3x': {
      'es': 'Nombre, Fecha, Enfermedad',
      'en': '',
      'it': '',
    },
    'wkvt1kum': {
      'es': 'Crisis',
      'en': '',
      'it': '',
    },
    'evpx3oku': {
      'es': 'Categories',
      'en': '',
      'it': '',
    },
    'c6keha8i': {
      'es': 'Manuel Perez',
      'en': '',
      'it': '',
    },
    '9xjcvo3g': {
      'es': 'Estables',
      'en': '',
      'it': '',
    },
    '66zinpoy': {
      'es': 'Pacientes ',
      'en': '',
      'it': '',
    },
    'y0cqpnom': {
      'es': 'Manuel Perez',
      'en': '',
      'it': '',
    },
    'u4kdzbt7': {
      'es': 'Sin Reporte',
      'en': '',
      'it': '',
    },
    'ehlqyvuu': {
      'es': 'Categories',
      'en': '',
      'it': '',
    },
    '60ufeudp': {
      'es': 'Manuel Perez',
      'en': '',
      'it': '',
    },
    '0omfz6ug': {
      'es': 'Linda Mendoza',
      'en': '',
      'it': '',
    },
    'yzlfwf0r': {
      'es': 'Monitoreo Paciente',
      'en': '',
      'it': '',
    },
    '697f35w5': {
      'es': 'Shop',
      'en': '',
      'it': '',
    },
  },
  // bookAppointment
  {
    '3hs8sovq': {
      'es': 'Registro de Citas Programadas',
      'en': '',
      'it': '',
    },
    'ydg2j7he': {
      'es': 'Complete la información a continuación para reservar su cita',
      'en': '',
      'it': '',
    },
    'lrq3ljxh': {
      'es': 'Emails will be sent to:',
      'en': '',
      'it': '',
    },
    'sh43r5oa': {
      'es': 'Booking For',
      'en': '',
      'it': '',
    },
    '6j4f4t3y': {
      'es': 'Consulta',
      'en': '',
      'it': '',
    },
    'vf2d6cy9': {
      'es': 'Estudio',
      'en': '',
      'it': '',
    },
    '8aptt4a7': {
      'es': 'Otro',
      'en': '',
      'it': '',
    },
    'atrii9d0': {
      'es': 'Programar',
      'en': '',
      'it': '',
    },
    'rdlcjvv2': {
      'es': 'Describa brevemente su estado\n de salud por favor....',
      'en': '',
      'it': '',
    },
    'uc3wqe2a': {
      'es': 'Elija fecha y hora',
      'en': '',
      'it': '',
    },
    'w1c197p7': {
      'es': 'Cancelar',
      'en': '',
      'it': '',
    },
    'v5ltwl5a': {
      'es': 'Fijar cita',
      'en': '',
      'it': '',
    },
  },
  // bookingOld
  {
    'av1gnqtw': {
      'es': 'Book Appointment',
      'en': '',
      'it': '',
    },
    'hmmu44rz': {
      'es':
          'Fill out the information below in order to book your appointment with our office.',
      'en': '',
      'it': '',
    },
    'dcxuguaj': {
      'es': 'Email Address',
      'en': '',
      'it': '',
    },
    'iyphtljg': {
      'es': 'Booking For',
      'en': '',
      'it': '',
    },
    'y06hdr6e': {
      'es': 'Doctors Visit',
      'en': '',
      'it': '',
    },
    'qc9wcm9y': {
      'es': 'Routine Checkup',
      'en': '',
      'it': '',
    },
    '0agzgs60': {
      'es': 'Scan/Update',
      'en': '',
      'it': '',
    },
    'ndyu32hj': {
      'es': 'Type of Appointment',
      'en': '',
      'it': '',
    },
    '0jbmfhim': {
      'es': 'What\'s the problem?',
      'en': '',
      'it': '',
    },
    '2gpdhmg5': {
      'es': 'Choose Date',
      'en': '',
      'it': '',
    },
    'c40abkn8': {
      'es': 'Cancel',
      'en': '',
      'it': '',
    },
    '65kcudwx': {
      'es': 'Book Now',
      'en': '',
      'it': '',
    },
  },
  // editBooking
  {
    'kvvruo1g': {
      'es': 'Cambiar una cita',
      'en': '',
      'it': '',
    },
    '4paqfjyu': {
      'es': 'Edite los campos a continuación para cambiar su cita.',
      'en': '',
      'it': '',
    },
    '2tupmp5z': {
      'es': 'Confirmación será enviada a:',
      'en': '',
      'it': '',
    },
    'mmyyhcaa': {
      'es': 'Paciente',
      'en': '',
      'it': '',
    },
    'l3t72lwh': {
      'es': 'Programar',
      'en': '',
      'it': '',
    },
    'gvuo8zln': {
      'es': 'Consulta',
      'en': '',
      'it': '',
    },
    'jcs1q259': {
      'es': 'Estudio',
      'en': '',
      'it': '',
    },
    'ucgtqao2': {
      'es': 'Otro',
      'en': '',
      'it': '',
    },
    'grco9e22': {
      'es': '¿Cuál es el problema?',
      'en': '',
      'it': '',
    },
    'ma48k5m2': {
      'es': 'Seleccione fecha y hora',
      'en': '',
      'it': '',
    },
    'czrbhhyg': {
      'es': 'Cancelar',
      'en': '',
      'it': '',
    },
    'jazkpwrd': {
      'es': 'Salvar cambios',
      'en': '',
      'it': '',
    },
  },
  // EmptyList
  {
    '9at5fr91': {
      'es': '¡Sin citas!',
      'en': '',
      'it': '',
    },
    'dw3xd9cl': {
      'es': '¿necesita una cita? Programe uno ahora.',
      'en': '',
      'it': '',
    },
    'h87vvpms': {
      'es': 'Calendario',
      'en': '',
      'it': '',
    },
  },
  // sinMensajes
  {
    'mkoqmqy7': {
      'es': 'Sin Mensajes',
      'en': '',
      'it': '',
    },
    'c4hzn05s': {
      'es': 'No tiene mensajes con su medico aun…',
      'en': '',
      'it': '',
    },
    'qjruhsyz': {
      'es': 'Buscar Medico',
      'en': '',
      'it': '',
    },
  },
  // Miscellaneous
  {
    'nnae0hjm': {
      'es': '',
      'en': '',
      'it': '',
    },
    'thmisswg': {
      'es': '',
      'en': '',
      'it': '',
    },
    '3msn3nh5': {
      'es': '',
      'en': '',
      'it': '',
    },
    '6wuhydqi': {
      'es': '',
      'en': '',
      'it': '',
    },
    'pa7sy6rb': {
      'es': '',
      'en': '',
      'it': '',
    },
    'pex80iiw': {
      'es': '',
      'en': '',
      'it': '',
    },
    'lila3rd1': {
      'es': '',
      'en': '',
      'it': '',
    },
    '39jci8es': {
      'es': '',
      'en': '',
      'it': '',
    },
    'uld8l3gl': {
      'es': '',
      'en': '',
      'it': '',
    },
    'a6hiq3db': {
      'es': '',
      'en': '',
      'it': '',
    },
    'ak2e9gut': {
      'es': '',
      'en': '',
      'it': '',
    },
    'mmr1nvmr': {
      'es': '',
      'en': '',
      'it': '',
    },
    'bq8loq9d': {
      'es': '',
      'en': '',
      'it': '',
    },
    'ajtrhz7f': {
      'es': '',
      'en': '',
      'it': '',
    },
    '3m4ogzd0': {
      'es': '',
      'en': '',
      'it': '',
    },
    '8zmvrd9r': {
      'es': '',
      'en': '',
      'it': '',
    },
    '6wrcoic0': {
      'es': '',
      'en': '',
      'it': '',
    },
    '2e9b004u': {
      'es': '',
      'en': '',
      'it': '',
    },
    'av3nvz8e': {
      'es': '',
      'en': '',
      'it': '',
    },
    'hhh24vrm': {
      'es': '',
      'en': '',
      'it': '',
    },
  },
].reduce((a, b) => a..addAll(b));
