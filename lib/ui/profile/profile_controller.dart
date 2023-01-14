import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../constants/constants.dart';
import '../../models/user_model.dart';
import '../../services/user_services.dart';
import '../../utils/date_time.dart';
import '../../widgets/notify/notify_bar.dart';
import '../base/base_controller.dart';
import '../controllers/app_controller.dart';

class ProfileController extends BaseController {
  final _appController = Get.find<AppController>();
  final _userService = Get.find<UserService>();
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      nameField,
      emailField,
      countryField,
      phoneField,
      birthdayField,
      levelField,
      //wantToLearnField
      studyScheduleField,
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );
  List<String> wantToLearnField = [];
  Rx<UserModel> user = UserModel(birthday: DateTime(1990)).obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    setUpDataProfile();
  }

  @override
  void onReloadData() {}

  void setUpDataProfile() async {
    await _userService.getUserInfo();
    user.value = _appController.userModel.value!;

    controllers[nameField]?.text = user.value.name;
    controllers[emailField]?.text = user.value.email;
    controllers[countryField]?.text = user.value.country;
    controllers[phoneField]?.text = user.value.phone;
    controllers[birthdayField]?.text =
        DateFormat(time1).format(user.value.birthday);
    controllers[levelField]?.text = user.value.level;
    controllers[studyScheduleField]?.text = user.value.studySchedule;
    isLoading.value = false;
  }

  void uploadImage(String path) async {
    await _userService.uploadImage(File(path));
    isLoading.value = true;
    setUpDataProfile();
  }

  void updateProfile() async {
    {
      UserModel userModel = UserModel(
        name: controllers[nameField]!.value.text,
        // email: controllers[emailField]!.value.text,
        country: controllers[countryField]!.value.text,
        phone: controllers[phoneField]!.value.text,
        birthday: controllers[birthdayField]?.text != null
            ? DateTime.parse(controllers[birthdayField]!.value.text)
            : DateTime(1990),
        level: controllers[levelField]!.value.text,
        studySchedule: controllers[studyScheduleField]!.value.text,
      );
      await _userService.updateUserInfo(user: userModel);
      // setUpDataProfile();
      notifyBar(message: 'Cập nhật thành công', isSuccess: true);
    }
  }

  Map<String, String> learnTopics = {
    '3': 'English for kids',
    '4': 'Business English',
    '5': 'Conversational English'
  };

  Map<String, String> testPreparations = {
    '1': 'STARTERS',
    '2': 'MOVIERS',
    '3': 'FLYERS'
  };

  Map<String, String> languages = {
    'AF': 'Afghanistan',
    'AL': 'Albania',
    'DZ': 'Algeria',
    'AS': 'American Samoa',
    'AD': 'Andorra',
    'AO': 'Angola',
    'AI': 'Anguilla',
    'AQ': 'Antarctica',
    'AG': 'Antigua and Barbuda',
    'AR': 'Argentina',
    'AM': 'Armenia',
    'AW': 'Aruba',
    'AU': 'Australia',
    'AT': 'Austria',
    'AZ': 'Azerbaijan',
    'BS': 'Bahamas (the)',
    'BH': 'Bahrain',
    'BD': 'Bangladesh',
    'BB': 'Barbados',
    'BY': 'Belarus',
    'BE': 'Belgium',
    'BZ': 'Belize',
    'BJ': 'Benin',
    'BM': 'Bermuda',
    'BT': 'Bhutan',
    'BO': 'Bolivia (Plurinational State of)',
    'BQ': 'Bonaire, Sint Eustatius and Saba',
    'BA': 'Bosnia and Herzegovina',
    'BW': 'Botswana',
    'BV': 'Bouvet Island',
    'BR': 'Brazil',
    'IO': 'British Indian Ocean Territory (the)',
    'BN': 'Brunei Darussalam',
    'BG': 'Bulgaria',
    'BF': 'Burkina Faso',
    'BI': 'Burundi',
    'CV': 'Cabo Verde',
    'KH': 'Cambodia',
    'CM': 'Cameroon',
    'CA': 'Canada',
    'KY': 'Cayman Islands (the)',
    'CF': 'Central African Republic (the)',
    'TD': 'Chad',
    'CL': 'Chile',
    'CN': 'China',
    'CX': 'Christmas Island',
    'CC': 'Cocos (Keeling) Islands (the)',
    'CO': 'Colombia',
    'KM': 'Comoros (the)',
    'CD': 'Congo (the Democratic Republic of the)',
    'CG': 'Congo (the)',
    'CK': 'Cook Islands (the)',
    'CR': 'Costa Rica',
    'HR': 'Croatia',
    'CU': 'Cuba',
    'CW': 'Curaçao',
    'CY': 'Cyprus',
    'CZ': 'Czechia',
    'CI': "Côte d'Ivoire",
    'DK': 'Denmark',
    'DJ': 'Djibouti',
    'DM': 'Dominica',
    'DO': 'Dominican Republic (the)',
    'EC': 'Ecuador',
    'EG': 'Egypt',
    'SV': 'El Salvador',
    'GQ': 'Equatorial Guinea',
    'ER': 'Eritrea',
    'EE': 'Estonia',
    'SZ': 'Eswatini',
    'ET': 'Ethiopia',
    'FK': 'Falkland Islands (the) [Malvinas]',
    'FO': 'Faroe Islands (the)',
    'FJ': 'Fiji',
    'FI': 'Finland',
    'FR': 'France',
    'GF': 'French Guiana',
    'PF': 'French Polynesia',
    'TF': 'French Southern Territories (the)',
    'GA': 'Gabon',
    'GM': 'Gambia (the)',
    'GE': 'Georgia',
    'DE': 'Germany',
    'GH': 'Ghana',
    'GI': 'Gibraltar',
    'GR': 'Greece',
    'GL': 'Greenland',
    'GD': 'Grenada',
    'GP': 'Guadeloupe',
    'GU': 'Guam',
    'GT': 'Guatemala',
    'GG': 'Guernsey',
    'GN': 'Guinea',
    'GW': 'Guinea-Bissau',
    'GY': 'Guyana',
    'HT': 'Haiti',
    'HM': 'Heard Island and McDonald Islands',
    'VA': 'Holy See (the)',
    'HN': 'Honduras',
    'HK': 'Hong Kong',
    'HU': 'Hungary',
    'IS': 'Iceland',
    'IN': 'India',
    'ID': 'Indonesia',
    'IR': 'Iran (Islamic Republic of)',
    'IQ': 'Iraq',
    'IE': 'Ireland',
    'IM': 'Isle of Man',
    'IL': 'Israel',
    'IT': 'Italy',
    'JM': 'Jamaica',
    'JP': 'Japan',
    'JE': 'Jersey',
    'JO': 'Jordan',
    'KZ': 'Kazakhstan',
    'KE': 'Kenya',
    'KI': 'Kiribati',
    'KP': "Korea (the Democratic People's Republic of)",
    'KR': 'Korea (the Republic of)',
    'KW': 'Kuwait',
    'KG': 'Kyrgyzstan',
    'LA': "Lao People's Democratic Republic (the)",
    'LV': 'Latvia',
    'LB': 'Lebanon',
    'LS': 'Lesotho',
    'LR': 'Liberia',
    'LY': 'Libya',
    'LI': 'Liechtenstein',
    'LT': 'Lithuania',
    'LU': 'Luxembourg',
    'MO': 'Macao',
    'MG': 'Madagascar',
    'MW': 'Malawi',
    'MY': 'Malaysia',
    'MV': 'Maldives',
    'ML': 'Mali',
    'MT': 'Malta',
    'MH': 'Marshall Islands (the)',
    'MQ': 'Martinique',
    'MR': 'Mauritania',
    'MU': 'Mauritius',
    'YT': 'Mayotte',
    'MX': 'Mexico',
    'FM': 'Micronesia (Federated States of)',
    'MD': 'Moldova (the Republic of)',
    'MC': 'Monaco',
    'MN': 'Mongolia',
    'ME': 'Montenegro',
    'MS': 'Montserrat',
    'MA': 'Morocco',
    'MZ': 'Mozambique',
    'MM': 'Myanmar',
    'NA': 'Namibia',
    'NR': 'Nauru',
    'NP': 'Nepal',
    'NL': 'Netherlands (the)',
    'NC': 'New Caledonia',
    'NZ': 'New Zealand',
    'NI': 'Nicaragua',
    'NE': 'Niger (the)',
    'NG': 'Nigeria',
    'NU': 'Niue',
    'NF': 'Norfolk Island',
    'MP': 'Northern Mariana Islands (the)',
    'NO': 'Norway',
    'OM': 'Oman',
    'PK': 'Pakistan',
    'PW': 'Palau',
    'PS': 'Palestine, State of',
    'PA': 'Panama',
    'PG': 'Papua New Guinea',
    'PY': 'Paraguay',
    'PE': 'Peru',
    'PH': 'Philippines (the)',
    'PN': 'Pitcairn',
    'PL': 'Poland',
    'PT': 'Portugal',
    'PR': 'Puerto Rico',
    'QA': 'Qatar',
    'MK': 'Republic of North Macedonia',
    'RO': 'Romania',
    'RU': 'Russian Federation (the)',
    'RW': 'Rwanda',
    'RE': 'Réunion',
    'BL': 'Saint Barthélemy',
    'SH': 'Saint Helena, Ascension and Tristan da Cunha',
    'KN': 'Saint Kitts and Nevis',
    'LC': 'Saint Lucia',
    'MF': 'Saint Martin (French part)',
    'PM': 'Saint Pierre and Miquelon',
    'VC': 'Saint Vincent and the Grenadines',
    'WS': 'Samoa',
    'SM': 'San Marino',
    'ST': 'Sao Tome and Principe',
    'SA': 'Saudi Arabia',
    'SN': 'Senegal',
    'RS': 'Serbia',
    'SC': 'Seychelles',
    'SL': 'Sierra Leone',
    'SG': 'Singapore',
    'SX': 'Sint Maarten (Dutch part)',
    'SK': 'Slovakia',
    'SI': 'Slovenia',
    'SB': 'Solomon Islands',
    'SO': 'Somalia',
    'ZA': 'South Africa',
    'GS': 'South Georgia and the South Sandwich Islands',
    'SS': 'South Sudan',
    'ES': 'Spain',
    'LK': 'Sri Lanka',
    'SD': 'Sudan (the)',
    'SR': 'Suriname',
    'SJ': 'Svalbard and Jan Mayen',
    'SE': 'Sweden',
    'CH': 'Switzerland',
    'SY': 'Syrian Arab Republic',
    'TW': 'Taiwan',
    'TJ': 'Tajikistan',
    'TZ': 'Tanzania, United Republic of',
    'TH': 'Thailand',
    'TL': 'Timor-Leste',
    'TG': 'Togo',
    'TK': 'Tokelau',
    'TO': 'Tonga',
    'TT': 'Trinidad and Tobago',
    'TN': 'Tunisia',
    'TR': 'Turkey',
    'TM': 'Turkmenistan',
    'TC': 'Turks and Caicos Islands (the)',
    'TV': 'Tuvalu',
    'UG': 'Uganda',
    'UA': 'Ukraine',
    'AE': 'United Arab Emirates (the)',
    'GB': 'United Kingdom of Great Britain and Northern Ireland (the)',
    'UM': 'United States Minor Outlying Islands (the)',
    'US': 'United States of America (the)',
    'UY': 'Uruguay',
    'UZ': 'Uzbekistan',
    'VU': 'Vanuatu',
    'VE': 'Venezuela (Bolivarian Republic of)',
    'VN': 'Viet Nam',
    'VG': 'Virgin Islands (British)',
    'VI': 'Virgin Islands (U.S.)',
    'WF': 'Wallis and Futuna',
    'EH': 'Western Sahara',
    'YE': 'Yemen',
    'ZM': 'Zambia',
    'ZW': 'Zimbabwe',
    'AX': 'Åland Islands',
  };

  Map<String, String> levelUser = {
    'BEGINNER': 'Pre A1 (Beginner)',
    'HIGHER_BEGINNER': 'A1 (Higher-Beginner)',
    'PRE-INTERMEDIATE': 'A2 (Pre-Intermediate)',
    'INTERMEDIATE': 'B1 (Intermediate)',
    'UPPER-INTERMEDIATE': 'B2 (Upper-Intermediate)',
    "ADVANCED": "C1 (Advanced)",
    'PROFICIENCY': 'C2 (Proficiency)'
  };
}
// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/cupertino.dart';

import '../base/base_controller.dart';

class ProfileController extends BaseController {
  static const String nameField = 'nameField';
  static const String emailField = 'emailField';
  static const String countryField = 'countryField';
  static const String phoneField = 'phoneField';
  static const String birthayDayField = 'birthayDayField';
  static const String studyScheduleField = 'studyScheduleField';
  static const String wantToLearnField = 'wantToLearnField';
  static const String levelField = 'levelField';
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      nameField,
      emailField,
      countryField,
      phoneField,
      birthayDayField,
      levelField,
      // wantToLearnField,
      studyScheduleField,
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );
  @override
  void onInit() {
    super.onInit();
    setUpDataProfile();
  }

  @override
  void onReloadData() {}

  void setUpDataProfile() {
    controllers[nameField]?.text = 'Trương Quốc Vương';
    controllers[emailField]?.text = 'Trương Quốc Vương@lettutor.com';
    controllers[countryField]?.text = 'Viet Nam';
    controllers[phoneField]?.text = '0343681753';
    controllers[birthayDayField]?.text = '2001-04-24';
    controllers[levelField]?.text = 'English (Begin)';
    //controllers[studyScheduleField]?.text = '';
  }
}
