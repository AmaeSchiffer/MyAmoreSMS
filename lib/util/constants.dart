import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:format_indonesia/format_indonesia.dart';

Color bluePrimary = Color(0xff446595);
Color white = Color(0xffffffff);
Color grey = Color(0xff393e46);
Color black = Color(0xff393e46);
Color green = Color(0xff12d732);
Color lightGrey = Color(0xff9a9a9a);
const String baseUrl = "https://amasbersama.000webhostapp.com/api/";

List<Map<String, dynamic>> userContacts = [
  {
    "name": "said m khatami",
    "numberphone": "081310894329",
    "photo":
        "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
  },
  {
    "name": "Marina",
    "numberphone": "081310894329",
    "photo":
        "https://blog.photofeeler.com/wp-content/uploads/2017/12/linkedin-profile-picture.jpg",
  },
  {
    "name": "Vaseline",
    "numberphone": "081310894329",
    "photo":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRkR76m2hBHiJNOZeLHauIoEgCQuQ5NnhkNEA&usqp=CAU",
  },
  {
    "name": "Putri",
    "numberphone": "081310894329",
    "photo":
        "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp",
  },
  {
    "name": "Cahyo",
    "numberphone": "081310894329",
    "photo":
        "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp",
  },
  {
    "name": "Joko",
    "numberphone": "081310894329",
    "photo":
        "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp",
  },
];

List<Map<String, dynamic>> listPesan = [
  {
    "jam": "13:00",
    "hari": "Senin",
    "tanggal": "02 Januari 2020",
    "pesan": "yxgKuy",
    "details": [
      {
        "photo":
            "https://blog.photofeeler.com/wp-content/uploads/2017/12/linkedin-profile-picture.jpg",
        "nama": "Said Muhammad Khatami",
        "nomertelpon": "081310894329",
        "berita": "Delivered",
      },
      {
        "photo":
            "https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp",
        "nama": "Arifai",
        "nomertelpon": "081310894329",
        "berita": "Error",
      },
      {
        "photo":
            "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRkR76m2hBHiJNOZeLHauIoEgCQuQ5NnhkNEA&usqp=CAU",
        "nama": "Mey Russandi",
        "nomertelpon": "081310894329",
        "berita": "Error",
      },
    ]
  },
  {
    "jam": "08:25",
    "hari": "Selasa",
    "tanggal": "02 Januari 2020",
    "pesan": "yxgKuy1",
    "details": [
      {
        "photo":
            "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
        "nama": "Achmad",
        "nomertelpon": "089627303284",
        "berita": "Error",
      }
    ]
  },
  {
    "jam": "08:25",
    "hari": "Rabu",
    "tanggal": "02 Januari 2020",
    "pesan": "yxgKuy2",
    "details": [
      {
        "photo":
            "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
        "nama": "Achmad",
        "nomertelpon": "089627303284",
        "berita": "Error",
      }
    ]
  },
  {
    "jam": "08:25",
    "hari": "Kamis",
    "tanggal": "02 Januari 2020",
    "pesan": "yxgKuy3",
    "details": [
      {
        "photo":
            "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
        "nama": "Achmad",
        "nomertelpon": "089627303284",
        "berita": "Error",
      }
    ]
  },
  {
    "jam": "08:25",
    "hari": "Jumat",
    "tanggal": "02 Januari 2020",
    "pesan": "yxgKuy4",
    "details": [
      {
        "photo":
            "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
        "nama": "Achmad",
        "nomertelpon": "089627303284",
        "berita": "Error",
      }
    ]
  },
  {
    "jam": "08:25",
    "hari": "Sabtu",
    "tanggal": "02 Januari 2020",
    "pesan": "yxgKuy5",
    "details": [
      {
        "photo":
            "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
        "nama": "Achmad",
        "nomertelpon": "089627303284",
        "berita": "Error",
      }
    ]
  },
  {
    "jam": "08:25",
    "hari": "Minggu",
    "tanggal": "02 Januari 2020",
    "pesan": "yxgKuy6",
    "details": [
      {
        "photo":
            "http://www.bbk.ac.uk/mce/wp-content/uploads/2015/03/8327142885_9b447935ff.jpg",
        "nama": "Achmad",
        "nomertelpon": "089627303284",
        "berita": "Error",
      }
    ]
  },
];

bool equalIgnoreCase(String string1, String string2) {
  return string1.toLowerCase() == string2.toLowerCase();
}

String getImageAsset(String hari) {
  String val = "";
  if (equalIgnoreCase(hari, "Senin")) {
    val = 'assets/images/calsenin.png';
  } else if (equalIgnoreCase(hari, "Selasa")) {
    val = 'assets/images/calselasa.png';
  } else if (equalIgnoreCase(hari, "Rabu")) {
    val = 'assets/images/calrabu.png';
  } else if (equalIgnoreCase(hari, "Kamis")) {
    val = 'assets/images/calkamis.png';
  } else if (equalIgnoreCase(hari, "Jumat")) {
    val = 'assets/images/caljumat.png';
  } else if (equalIgnoreCase(hari, "Sabtu")) {
    val = 'assets/images/calsabtu.png';
  } else if (equalIgnoreCase(hari, "Minggu")) {
    val = 'assets/images/calminggu.png';
  }
  return val;
}

String getJam() {
  final DateTime now = DateTime.now();
  final String jam = Waktu(now).format('HH:mm');
  return jam;
}

String getHari() {
  final DateTime now = DateTime.now();
  final String hari = Waktu(now).EEEE();
  return hari;
}

String getTanggal() {
  final DateTime now = DateTime.now();
  final String tanggal = Waktu(now).format('d-MMMM-yyyy');
  return tanggal;
}