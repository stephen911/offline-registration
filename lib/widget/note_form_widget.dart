import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoteFormWidget extends StatefulWidget {
  final bool? isImportant;
  final int? number;
  final String? title;
  final String? description;
  final String? contact;
  final String? lincense;
  final String? regnumber;
  String? region;
  String? district;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<String> onChangedContact;
  final ValueChanged<String> onChangedLincense;
  final ValueChanged<String> onChangedRegnumber;
  final ValueChanged<String> onChangedRegion;
  final ValueChanged<String> onChangedDistrict;

  NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
    this.contact = '',
    this.lincense = '',
    this.regnumber = '',
    this.region = '',
    this.district = '',
    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedContact,
    required this.onChangedLincense,
    required this.onChangedRegnumber,
    required this.onChangedRegion,
    required this.onChangedDistrict,
  }) : super(key: key);

  @override
  State<NoteFormWidget> createState() => _NoteFormWidgetState();
}

class _NoteFormWidgetState extends State<NoteFormWidget> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row(
              //   children: [
              //     Switch(
              //       value: widget.isImportant ?? false,
              //       onChanged: widget.onChangedImportant,
              //     ),
              //     Expanded(
              //       child: Slider(
              //         value: (widget.number ?? 0).toDouble(),
              //         min: 0,
              //         max: 5,
              //         divisions: 5,
              //         onChanged: (number) =>
              //             widget.onChangedNumber(number.toInt()),
              //       ),
              //     )
              //   ],
              // ),
              buildTitle(),
              const SizedBox(height: 16),
              buildDescription(),
              const SizedBox(height: 16),
              buildContact(),
              const SizedBox(height: 16),
              buildLincense(),
              const SizedBox(height: 16),
              buildRegnumber(),
              const SizedBox(height: 16),
              buildRegion(),
              const SizedBox(height: 16),
              buildDistrict(),
              const SizedBox(height: 16),
              // buildregio(),
              // SizedBox(height: 16),
              // builddis(),
              // SizedBox(height: 16),
            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // fontSize: 24,
        ),
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white)),
            labelText: 'Name',
            focusColor: Colors.white,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white),
            hintText: "Your Name",
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
            // focusedBorder:
            // hintText: 'Username or Email',
            ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The name cannot be empty' : null,
        onChanged: widget.onChangedTitle,
      );

  Widget buildDescription() => TextFormField(
        maxLines: 1,
        initialValue: widget.description,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // fontSize: 24,
        ),
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white)),
            labelText: 'Email',
            focusColor: Colors.white,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white),
            hintText: "Your email",
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
            // focusedBorder:
            // hintText: 'Username or Email',
            ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The email cannot be empty' : null,
        onChanged: widget.onChangedDescription,
      );

  Widget buildContact() => TextFormField(
        maxLines: 1,
        initialValue: widget.contact,
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // fontSize: 24,
        ),
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white)),
            labelText: 'Contact',
            focusColor: Colors.white,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white),
            hintText: "e.g. 050 000 0000",
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
            // focusedBorder:
            // hintText: 'Username or Email',
            ),
        validator: (title) => title != null && title.isEmpty
            ? 'The contact cannot be empty'
            : null,
        onChanged: widget.onChangedContact,
      );

  Widget buildLincense() => TextFormField(
        maxLines: 1,
        initialValue: widget.lincense,
        keyboardType: TextInputType.text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // fontSize: 24,
        ),
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white)),
            labelText: 'Lincense Number',
            focusColor: Colors.white,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white),
            hintText: "e.g. PT/000000/22",
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
            // focusedBorder:
            // hintText: 'Username or Email',
            ),
        validator: (title) => title != null && title.isEmpty
            ? 'The linceses number cannot be empty'
            : null,
        onChanged: widget.onChangedLincense,
      );

  Widget buildRegnumber() => TextFormField(
        maxLines: 1,
        initialValue: widget.contact,
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // fontSize: 24,
        ),
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white)),
            labelText: 'Registered Number',
            focusColor: Colors.white,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            hintStyle: TextStyle(color: Colors.white),
            hintText: "e.g. 123456",
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
            // focusedBorder:
            // hintText: 'Username or Email',
            ),
        validator: (title) => title != null && title.isEmpty
            ? 'The registered number cannot be empty'
            : null,
        onChanged: widget.onChangedRegnumber,
      );

  String value = "";

  List<DropdownMenuItem<String>> menuitems = [];

  bool disabledropdown = true;

  final accra = {
    '1': 'ABLEKUMA CENTRAL MUNICIPAL',
    '2': 'ABLEKUMA NORTH MUNICIPAL',
    '3': 'ABLEKUMA WEST MUNICIPAL',
    '4': 'ACCRA METROPOLITAN',
    '5': 'ADA EAST DISTRICT',
    '6': 'ADA WEST DISTRICT',
    '7': 'ADENTAN MUNICIPAL',
    '8': 'ASHAIMAN MUNICIPAL',
    '9': 'AYAWASO CENTRAL MUNICIPAL',
    '10': 'AYAWASO EAST MUNICIPAL',
    '11': 'AYAWASO NORTH MUNICIPAL',
    '12': 'AYAWASO WEST MUNICIPAL',
    '13': 'GA CENTRAL MUNICIPAL',
    '14': 'GA EAST MUNICIPAL',
    '15': 'GA NORTH MUNICIPAL',
    '16': 'GA SOUTH MUNICIPAL',
    '17': 'GA WEST MUNICIPAL',
    '18': 'KORLE KLOTTEY MUNICIPAL',
    '19': 'KPONE KATAMANSO DISTRICT',
    '20': 'KROWOR MUNICIPAL',
    '21': 'LA DADE-KOTOPON MUNICIPAL',
    '22': 'LA NKWANTANANG MADINA MUNICIPAL',
    '23': 'LEDZOKUKU MUNICIPAL',
    '24': 'NINGO PRAMPRAM DISTRICT',
    '25': 'OKAIKWEI NORTH MUNICIPAL',
    '26': 'SHAI-OSUDOKU DISTRICT',
    '27': 'TEMA METROPOLITAN',
    '28': 'TEMA WEST MUNICIPAL',
    '29': 'WEIJA GBAWE MUNICIPAL',
  };

  final ahafo = {
    '33': 'ASUNAFO NORTH MUNICIPAL',
    '34': 'ASUNAFO SOUTH DISTRICT',
    '35': 'ASUTIFI NORTH DISTRICT',
    '36': 'ASUTIFI SOUTH DISTRICT',
    '37': 'TANO NORTH MUNICIPAL',
    '38': 'TANO SOUTH MUNICIPAL',
  };

  // ignore: non_constant_identifier_names
  final bono_east = {
    '43': 'ATEBUBU-AMANTIN DISTRICT',
    '44': 'KINTAMPO NORTH MUNICIPAL',
    '45': 'KINTAMPO SOUTH DISTRICT',
    '46': 'NKORANZA NORTH DISTRICT',
    '47': 'NKORANZA SOUTH MUNICIPAL',
    '48': 'PRU EAST DISTRICT',
    '49': 'PRU WEST DISTRICT',
    '50': 'SENE EAST DISTRICT',
    '51': 'SENE WEST DISTRICT',
    '52': 'TECHIMAN MUNICIPAL',
    '53': 'TECHIMAN NORTH DISTRICT',
  };

  final ashanti = {
    '58': 'ADANSI ASOKWA DISTRICT',
    '59': 'ADANSI NORTH DISTRICT',
    '60': 'ADANSI SOUTH DISTRICT',
    '61': 'AFIGYA-KWABERE DISTRICT',
    '62': 'AFIGYA KWABRE NORTH DISTRICT',
    '63': 'AHAFO ANO NORTH DISTRICT',
    '64': 'AHAFO ANO SOUTH EAST DISTRICT',
    '65': 'AHAFO ANO SOUTH WEST DISTRICT',
    '66': 'AKROFUOM DISTRICT',
    '67': 'AMANSIE CENTRAL DISTRICT',
    '68': 'AMANSIE SOUTH DISTRICT',
    '69': 'AMANSIE WEST DISTRICT',
    '70': 'ASANTE-AKIM CENTRAL MUNICIPAL',
    '71': 'ASANTE-AKIM NORTH DISTRICT',
    '72': 'ASANTE-AKIM SOUTH DISTRICT',
    '73': 'ASOKORE MAMPONG MUNICIPAL',
    '74': 'ASOKWA MUNICIPAL',
    '75': 'ATWIMA-KWANWOMA DISTRICT',
    '76': 'ATWIMA MPONUA DISTRICT',
    '77': 'ATWIMA NWABIAGYA MUNICIPAL',
    '78': 'ATWIMA NWABIAGYA NORTH DISTRICT',
    '79': 'BEKWAI MUNICIPAL',
    '80': 'BOSOME FREHO DISTRICT',
    '81': 'BOSOMTWE DISTRICT',
    '82': 'EJISU MUNICIPAL',
    '83': 'EJURA SEKYEDUMASE MUNICIPAL',
    '84': 'JUABEN MUNICIPAL',
    '85': 'KUMASI METROPOLITAN',
    '86': 'KWABRE EAST MUNICIPAL',
    '87': 'KWADASO MUNICIPAL',
    '88': 'MAMPONG MUNICIPAL',
    '89': 'OBUASI EAST MUNICIPAL',
    '90': 'OBUASI MUNICIPAL',
    '91': 'OFFINSO MUNICIPAL',
    '92': 'OFFINSO NORTH DISTRICT',
    '93': 'OFORIKROM MUNICIPAL',
    '94': 'OLD TAFO MUNICIPAL',
    '95': 'SEKYERE AFRAM PLAINS DISTRICT',
    '96': 'SEKYERE CENTRAL DISTRICT',
    '97': 'SEKYERE EAST DISTRICT',
    '98': 'SEKYERE KUMAWU DISTRICT',
    '99': 'SEKYERE SOUTH DISTRICT',
    '100': 'SUAME MUNICIPAL',
  };

  final central = {
    '106': 'ABURA-ASEBU-KWAMANKESE DISTRICT',
    '107': 'AGONA EAST DISTRICT',
    '108': 'AGONA WEST MUNICIPAL',
    '109': 'AJUMAKO-ENYAN-ESSIAM DISTRICT',
    '110': 'ASIKUMA-ODOBEN-BRAKWA DISTRICT',
    '111': 'ASSIN FOSU MUNICIPAL',
    '112': 'ASSIN NORTH DISTRICT',
    '113': 'ASSIN SOUTH DISTRICT',
    '114': 'AWUTU SENYA DISTRICT',
    '115': 'AWUTU SENYA EAST MUNICIPAL',
    '116': 'CAPE COAST METROPOLITAN',
    '117': 'EFUTU MUNICIPAL',
    '118': 'EKUMFI DISTRICT',
    '119': 'GOMOA CENTRAL DISTRICT',
    '120': 'GOMOA EAST DISTRICT',
    '121': 'GOMOA WEST DISTRICT',
    '122': 'KOMENDA-EDINA-EGUAFO-ABIREM MUNICIPAL',
    '123': 'MFANTSEMAN MUNICIPAL',
    '124': 'TWIFO ATI-MORKWA MUNICIPAL',
    '125': 'TWIFO HEMANG-LOWER DENKYIRA DISTRICT',
    '126': 'UPPER DENKYIRA EAST MUNICIPAL',
    '127': 'UPPER DENKYIRA WEST DISTRICT',
  };

  final bono = {
    '133': 'BANDA DISTRICT',
    '134': 'BEREKUM MUNICIPAL',
    '135': 'BEREKUM WEST DISTRICT',
    '136': 'DORMAA CENTRAL MUNICIPAL',
    '137': 'DORMAA EAST DISTRICT',
    '138': 'DORMAA WEST DISTRICT',
    '139': 'JAMAN NORTH DISTRICT',
    '140': 'JAMAN SOUTH MUNICIPAL',
    '141': 'SUNYANI MUNICIPAL',
    '142': 'SUNYANI WEST DISTRICT',
    '143': 'TAIN DISTRICT',
    '144': 'WENCHI MUNICIPAL',
  };

  // ignore: non_constant_identifier_names
  final north_east = {
    '150': 'BUNKPURUGU-NAKPANDURI DISTRICT',
    '151': 'CHEREPONI DISTRICT',
    '152': 'EAST MAMPRUSI DISTRICT',
    '153': 'MAMPRUGU MOADURI DISTRICT',
    '154': 'WEST MAMPRUSI DISTRICT',
    '155': 'YUNYOO-NASUAN DISTRICT',
  };
  final northern = {
    '161': 'GUSHIEGU MUNICIPAL',
    '162': 'KARAGA DISTRICT',
    '163': 'KPANDAI DISTRICT',
    '164': 'KUMBUNGU DISTRICT',
    '165': 'MION DISTRICT',
    '166': 'NANTON DISTRICT',
    '167': 'NANUMBA NORTH MUNICIPAL',
    '168': 'NANUMBA SOUTH DISTRICT',
    '169': 'SABOBA DISTRICT',
    '170': 'SAGNARIGU MUNICIPAL',
    '171': 'SAVELUGU MUNICIPAL',
    '172': 'TAMALE METROPOLITAN',
    '173': 'TATALE SANGULI DISTRICT',
    '174': 'TOLON DISTRICT',
    '175': 'YENDI MUNICIPAL',
    '176': 'ZABZUGU DISTRICT',
  };
  final eastern = {
    '181': 'ABUAKWA NORTH MUNICIPAL',
    '182': 'ABUAKWA SOUTH MUNICIPAL',
    '183': 'ACHIASE DISTRICT',
    '184': 'AFRAM PLAINS (KWAHU NORTH) DISTRICT',
    '185': 'AKWAPIM NORTH MUNICIPAL',
    '186': 'AKWAPIM SOUTH DISTRICT',
    '187': 'AKYEMANSA DISTRICT',
    '188': 'ASENE MANSO DISTRICT',
    '189': 'ASUOGYAMAN DISTRICT',
    '190': 'ATIWA EAST DISTRICT',
    '191': 'ATIWA WEST DISTRICT',
    '192': 'AYENSUANO DISTRICT',
    '193': 'BIRIM CENTRAL MUNICIPAL',
    '194': 'BIRIM NORTH DISTRICT',
    '195': 'BIRIM SOUTH DISTRICT',
    '196': 'DENKYEMBOUR DISTRICT',
    '197': 'FANTEAKWA NORTH DISTRICT',
    '198': 'FANTEAKWA SOUTH DISTRICT',
    '199': 'KWAEBIBIREM MUNICIPAL',
    '200': 'KWAHU AFRAM PLAINS SOUTH DISTRICT',
    '201': 'KWAHU EAST DISTRICT',
    '202': 'KWAHU SOUTH DISTRICT',
    '203': 'KWAHU WEST MUNICIPAL',
    '204': 'LOWER MANYA KROBO MUNICIPAL',
    '205': 'NEW JUABEN NORTH DISTRICT',
    '206': 'NEW JUABEN SOUTH MUNICIPAL',
    '207': 'NSAWAM ADOAGYIRI MUNICIPAL',
    '208': 'OKERE DISTRICT',
    '209': 'SUHUM MUNICIPAL',
    '210': 'UPPER MANYA KROBO DISTRICT',
    '211': 'UPPER WEST AKIM DISTRICT',
    '212': 'WEST AKIM MUNICIPAL',
    '213': 'YILO KROBO MUNICIPAL',
  };

  // ignore: non_constant_identifier_names
  final upper_east = {
    '218': 'BAWKU MUNICIPAL',
    '219': 'BAWKU WEST DISTRICT',
    '220': 'BINDURI DISTRICT',
    '221': 'BOLGATANGA EAST DISTRICT',
    '222': 'BOLGATANGA MUNICIPAL',
    '223': 'BONGO DISTRICT',
    '224': 'BUILSA NORTH MUNICIPAL',
    '225': 'BUILSA SOUTH DISTRICT',
    '226': 'GARU DISTRICT',
    '227': 'KASSENA-NANKANA MUNICIPAL',
    '228': 'KASSENA-NANKANA WEST DISTRICT',
    '229': 'NABDAM DISTRICT',
    '230': 'PUSIGA DISTRICT',
    '231': 'TALENSI DISTRICT',
    '232': 'TEMPANE DISTRICT',
  };
  final savannah = {
    '237': 'BOLE DISTRICT',
    '238': 'CENTRAL GONJA DISTRICT',
    '239': 'EAST GONJA DISTRICT',
    '240': 'NORTH EAST GONJA DISTRICT',
    '241': 'NORTH GONJA DISTRICT',
    '242': 'SAWLA-TUNA-KALBA DISTRICT',
    '243': 'WEST GONJA DISTRICT',
  };
  final oti = {
    '248': 'BIAKOYE DISTRICT',
    '249': 'JASIKAN DISTRICT',
    '250': 'KADJEBI DISTRICT',
    '251': 'KRACHI EAST DISTRICT',
    '252': 'KRACHI NCHUMURU DISTRICT',
    '253': 'KRACHI WEST DISTRICT',
    '254': 'NKWANTA NORTH DISTRICT',
    '255': 'NKWANTA SOUTH DISTRICT',
  };
  final volta = {
    '261': 'ADAKLU DISTRICT',
    '262': 'AFADZATO SOUTH DISTRICT',
    '263': 'AGOTIME ZIOPE DISTRICT',
    '264': 'AKATSI NORTH DISTRICT',
    '265': 'AKATSI SOUTH DISTRICT',
    '266': 'ANLOGA DISTRICT',
    '267': 'ANLO (KETA) MUNICIPAL',
    '268': 'CENTRAL TONGU DISTRICT',
    '269': 'HOHOE MUNICIPAL',
    '270': 'HO MUNICIPAL',
    '271': 'HO WEST DISTRICT',
    '272': 'KETU NORTH MUNICIPAL',
    '273': 'KETU SOUTH MUNICIPAL',
    '274': 'KPANDO MUNICIPAL',
    '275': 'NORTH DAYI DISTRICT',
    '276': 'NORTH TONGU DISTRICT',
    '277': 'SOUTH DAYI DISTRICT',
    '278': 'SOUTH TONGU DISTRICT',
  };
  // ignore: non_constant_identifier_names
  final upper_west = {
    '283': 'DAFFIAMA-BUSSIE-ISSA DISTRICT',
    '284': 'JIRAPA MUNICIPAL',
    '285': 'LAMBUSSIE-KARNI DISTRICT',
    '286': 'LAWRA MUNICIPAL',
    '287': 'NADOWLI-KALEO DISTRICT',
    '288': 'NANDOM DISTRICT',
    '289': 'SISSALA EAST MUNICIPAL',
    '290': 'SISSALA WEST DISTRICT',
    '291': 'WA EAST DISTRICT',
    '292': 'WA MUNICIPAL',
    '293': 'WA WEST DISTRICT',
  };
  // ignore: non_constant_identifier_names
  final western_north = {
    '298': 'AOWIN DISTRICT',
    '299': 'BIA EAST DISTRICT',
    '300': 'BIA WEST DISTRICT',
    '301': 'BIBIANI-ANHWIASO-BEKWAI DISTRICT',
    '302': 'BODI DISTRICT',
    '303': 'JUABOSO DISTRICT',
    '304': 'SEFWI AKONTOMBRA DISTRICT',
    '305': 'SEFWI WIAWSO DISTRICT',
    '306': 'SUAMAN DISTRICT',
  };
  final western = {
    '312': 'AHANTA WEST MUNICIPAL',
    '313': 'EFFIA-KWESIMINTSIM DISTRICT',
    '314': 'ELLEMBELE DISTRICT',
    '315': 'JOMORO MUNICIPAL',
    '316': 'MPOHOR DISTRICT',
    '317': 'NZEMA EAST MUNICIPAL',
    '318': 'PRESTEA HUNI VALLEY MUNICIPAL',
    '319': 'SEKONDI-TAKORADI METROPOLITAN',
    '320': 'SHAMA DISTRICT',
    '321': 'TARKWA-NSUAEM MUNICIPAL',
    '322': 'WASA AMENFI CENTRAL DISTRICT',
    '323': 'WASA AMENFI EAST MUNICIPAL',
    '324': 'WASA AMENFI WEST MUNICIPAL',
    '325': 'WASSA EAST DISTRICT',
  };

  void populateGreaterAccra() {
    for (String key in accra.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: accra[key],
        child: Center(
          child: Text(accra[key].toString()),
        ),
      ));
    }
  }

  void populateahafo() {
    for (String key in ahafo.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: ahafo[key],
        child: Center(
          child: Text(ahafo[key].toString()),
        ),
      ));
    }
  }

  // ignore: non_constant_identifier_names
  void populatebono_east() {
    for (String key in bono_east.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: bono_east[key],
        child: Center(
          child: Text(bono_east[key].toString()),
        ),
      ));
    }
  }

  void populateashanti() {
    for (String key in ashanti.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: ashanti[key],
        child: Center(
          child: Text(ashanti[key].toString()),
        ),
      ));
    }
  }

  void populatecentral() {
    for (String key in central.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: central[key],
        child: Center(
          child: Text(central[key].toString()),
        ),
      ));
    }
  }

  void populatebono() {
    for (String key in bono.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: bono[key],
        child: Center(
          child: Text(bono[key].toString()),
        ),
      ));
    }
  }

  // ignore: non_constant_identifier_names
  void populatenorth_east() {
    for (String key in north_east.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: north_east[key],
        child: Center(
          child: Text(north_east[key].toString()),
        ),
      ));
    }
  }

  void populatenorthern() {
    for (String key in northern.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: northern[key],
        child: Center(
          child: Text(northern[key].toString()),
        ),
      ));
    }
  }

  void populateeastern() {
    for (String key in eastern.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: eastern[key],
        child: Center(
          child: Text(eastern[key].toString()),
        ),
      ));
    }
  }

  // ignore: non_constant_identifier_names
  void populateupper_east() {
    for (String key in upper_east.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: upper_east[key],
        child: Center(
          child: Text(upper_east[key].toString()),
        ),
      ));
    }
  }

  void populatesavannah() {
    for (String key in savannah.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: savannah[key],
        child: Center(
          child: Text(savannah[key].toString()),
        ),
      ));
    }
  }

  void populateoti() {
    for (String key in oti.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: oti[key],
        child: Center(
          child: Text(oti[key].toString()),
        ),
      ));
    }
  }

  void populatevolta() {
    for (String key in volta.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: volta[key],
        child: Center(
          child: Text(volta[key].toString()),
        ),
      ));
    }
  }

  // ignore: non_constant_identifier_names
  void populateupper_west() {
    for (String key in upper_west.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: upper_west[key],
        child: Center(
          child: Text(upper_west[key].toString()),
        ),
      ));
    }
  }

  // ignore: non_constant_identifier_names
  void populatewestern_north() {
    for (String key in western_north.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: western_north[key],
        child: Center(
          child: Text(western_north[key].toString()),
        ),
      ));
    }
  }

  void populatewestern() {
    for (String key in western.keys) {
      menuitems.add(DropdownMenuItem<String>(
        value: western[key],
        child: Center(
          child: Text(western[key].toString()),
        ),
      ));
    }
  }

  void selected(value) {
    if (value == "GREATER ACCRA") {
      menuitems = [];
      populateGreaterAccra();
    } else if (value == "AHAFO REGION") {
      menuitems = [];
      populateahafo();
    } else if (value == "BONO EAST REGION") {
      menuitems = [];
      populatebono_east();
    } else if (value == "ASHANTI REGION") {
      menuitems = [];
      populateashanti();
    } else if (value == "CENTRAL REGION") {
      menuitems = [];
      populatecentral();
    } else if (value == "BONO REGION") {
      menuitems = [];
      populatebono();
    } else if (value == "NORTH EAST REGION") {
      menuitems = [];
      populatenorth_east();
    } else if (value == "NORTHERN REGION") {
      menuitems = [];
      populatenorthern();
    } else if (value == "EASTERN REGION") {
      menuitems = [];
      populateeastern();
    } else if (value == "UPPER EAST REGION") {
      menuitems = [];
      populateupper_east();
    } else if (value == "SAVANNAH REGION") {
      menuitems = [];
      populatesavannah();
    } else if (value == "OTI REGION") {
      menuitems = [];
      populateoti();
    } else if (value == "VOLTA REGION") {
      menuitems = [];
      populatevolta();
    } else if (value == "UPPER WEST REGION") {
      menuitems = [];
      populateupper_west();
    } else if (value == "WESTERN NORTH REGION") {
      menuitems = [];
      populatewestern_north();
    } else if (value == "WESTERN REGION") {
      menuitems = [];
      populatewestern();
    }
    setState(() {
      value = value;
      disabledropdown = false;
      widget.region = value;
      widget.onChangedRegion;
    });
  }

  void secondselected(value) {
    setState(() {
      value = value;
      widget.district = value;
      widget.onChangedDistrict;
      // widget.region = _value;
    });
  }

  Widget buildRegion() => DropdownButton<String>(
        items: <String>[
          'GREATER ACCRA',
          'AHAFO REGION',
          'BONO EAST REGION',
          'ASHANTI REGION',
          'CENTRAL REGION',
          'BONO REGION',
          'NORTH EAST REGION',
          'NORTHERN REGION',
          'EASTERN REGION',
          'UPPER EAST REGION',
          'SAVANNAH REGION',
          'OTI REGION',
          'VOLTA REGION',
          'UPPER WEST REGION',
          'WESTERN NORTH REGION',
          'WESTERN REGION'
        ].map((String value) {
          return DropdownMenuItem<String>(
            
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        onChanged: (value) {
          selected(value);

          setState(() {
            widget.region = value;
            widget.onChangedRegion(value!);
          });
        },
        // hint: Text("Select Your Field"),
        hint: value == ""
            ? Row(
              children: [IconButton(onPressed: (){}, icon: const Icon(Icons.location_city, color: Colors.white)),
                const Text("Select Your Region",
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            )
            : Row(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.location_city, color: Colors.white)),
                Text(
                    widget.region.toString(),
                    style:
                        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
              ],
            ),

        disabledHint: const Text(
          "Disabled",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        menuMaxHeight: 500,
        elevation: 8,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        icon: const Icon(Icons.arrow_drop_down_circle),
        iconDisabledColor: Colors.red,
        iconEnabledColor: Colors.green,
        isExpanded: true,
        dropdownColor: Colors.grey.shade700,
      );

  Widget buildDistrict() => DropdownButton<String>(
        items: menuitems,
        menuMaxHeight: 500,
        
        onChanged: disabledropdown
            ? null
            : (value) {
                secondselected(value);

                setState(() {
                  widget.district = value;
                  widget.onChangedDistrict(value!);
                });
              },
        hint: widget.region!.isNotEmpty && widget.district!.isEmpty
            ? Row(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.location_on, color: Colors.white)),
                const Text(
                    "Select Your District",
                    style:
                        TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
              ],
            )
            : Row(
              children: [
                 IconButton(onPressed: (){}, icon: const Icon(Icons.location_on, color: Colors.white)),
                Text(
                  
                    widget.district.toString(),
                    style:
                        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
        disabledHint: Row(
          children: [
             IconButton(onPressed: (){}, icon: const Icon(Icons.location_on, color: Colors.white)),
            const Text(
              "First Select Your Region",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        elevation: 8,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        icon: const Icon(Icons.arrow_drop_down_circle),
        iconDisabledColor: Colors.red,
        iconEnabledColor: Colors.green,
        dropdownColor: Colors.grey.shade700,
        isExpanded: true,
      );

  // Widget buildregio() => TextFormField(
  //       maxLines: 1,
  //       initialValue: widget.region?.toUpperCase(),
  //       style: TextStyle(color: Colors.white60, fontSize: 18),
  //       decoration: InputDecoration(
  //           enabledBorder: UnderlineInputBorder(
  //             borderSide: BorderSide(color: Colors.white),
  //           ),
  //           border: OutlineInputBorder(
  //               borderSide: BorderSide(width: 1, color: Colors.white)),
  //           labelText: 'Region',
  //           focusColor: Colors.white,
  //           fillColor: Colors.white,
  //           prefixIcon: const Icon(
  //             Icons.person,
  //             color: Colors.white,
  //           ),
  //           hintStyle: TextStyle(color: Colors.white),
  //           hintText: "e.g. Region",
  //           labelStyle: TextStyle(color: Colors.white),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
  //           // focusedBorder:
  //           // hintText: 'Username or Email',
  //           ),
  //       validator: (title) => title != null && title.isEmpty
  //           ? 'The Region cannot be empty'
  //           : null,
  //       onChanged: widget.onChangedRegion,
  //     );
  // Widget builddis() => TextFormField(
  //       maxLines: 1,
  //       initialValue: widget.district?.toUpperCase(),
  //       style: TextStyle(color: Colors.white60, fontSize: 18),
  //       decoration: InputDecoration(
  //           enabledBorder: UnderlineInputBorder(
  //             borderSide: BorderSide(color: Colors.white),
  //           ),
  //           border: OutlineInputBorder(
  //               borderSide: BorderSide(width: 1, color: Colors.white)),
  //           labelText: 'District',
  //           focusColor: Colors.white,
  //           fillColor: Colors.white,
  //           prefixIcon: const Icon(
  //             Icons.person,
  //             color: Colors.white,
  //           ),
  //           hintStyle: TextStyle(color: Colors.white),
  //           hintText: "e.g. District",
  //           labelStyle: TextStyle(color: Colors.white),
  //           focusedBorder:
  //               OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
  //           // focusedBorder:
  //           // hintText: 'Username or Email',
  //           ),
  //       validator: (title) => title != null && title.isEmpty
  //           ? 'The district cannot be empty'
  //           : null,
  //       onChanged: widget.onChangedDistrict,
  //     );


      
}
