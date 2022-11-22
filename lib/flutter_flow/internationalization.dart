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
      'es': 'Fotos de identificación',
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
    'ndy7alid': {
      'es': 'Recetas',
      'en': '',
      'it': '',
    },
    'xaldytxd': {
      'es': 'Inspector Name',
      'en': '',
      'it': '',
    },
    'b7boq9qn': {
      'es': 'Title',
      'en': '',
      'it': '',
    },
    'ps1pk00p': {
      'es': 'Inspector Name',
      'en': '',
      'it': '',
    },
    'z6fwwg2h': {
      'es': 'Title',
      'en': '',
      'it': '',
    },
    'nzrfeawj': {
      'es': 'Inspector Name',
      'en': '',
      'it': '',
    },
    'mwkljaf5': {
      'es': 'Title',
      'en': '',
      'it': '',
    },
    '4zndnj45': {
      'es': 'Expediente',
      'en': '',
      'it': '',
    },
    'ehhdnzyq': {
      'es': 'Inspector Name',
      'en': '',
      'it': '',
    },
    '3k7epq6e': {
      'es': 'Title',
      'en': '',
      'it': '',
    },
    '5zyzx7z4': {
      'es': 'Estudios',
      'en': '',
      'it': '',
    },
    '266fb7tq': {
      'es': 'Inspector Name',
      'en': '',
      'it': '',
    },
    '9uumrtvw': {
      'es': 'Title',
      'en': '',
      'it': '',
    },
    'vds6c07q': {
      'es': 'Historia Clínica',
      'en': '',
      'it': '',
    },
    'pvw6fjz2': {
      'es': '•',
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
    '2esghubp': {
      'es': '',
      'en': '',
      'it': '',
    },
    'c5xh6eb3': {
      'es': '',
      'en': '',
      'it': '',
    },
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
