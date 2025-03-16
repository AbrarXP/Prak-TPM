import 'dart:convert';

String rawJson = """[
  {
    "username": "123210131",
    "post": "UKT ELIT FASILITAS SULIT",
    "image": "https://miro.medium.com/v2/resize:fit:4800/format:webp/1*8CLugxwP_eoKi5TAVij2EA.jpeg",
    "vote": {
      "upvote": 10000,
      "downvote": 5000
    },
    "comments": [
      {
        "username": "123210111",
        "comment": "Engga Cuy, Sekarang udah ada lift.",
        "vote": {
          "upvote": 9000,
          "downvote": 10
        }
      },
      {
        "username": "123210551",
        "comment": "Liftnya aja suka mt WKWKWKWK",
        "vote": {
          "upvote": 10,
          "downvote": 101000
        }
      },
      {
        "username": "122222222",
        "comment": "Kok kalian punya lift?",
        "vote": {
          "upvote": 250,
          "downvote": 150
        }
      }
    ]
  },
  {
    "username": "123260101",
    "post": "AAAA MAU MOKEL, JOGJA GERAH COY",
    "image": "https://www.minimeinsights.com/wp-content/uploads/2023/03/mie-gacoan-small.jpg",
    "vote": {
      "upvote": 800,
      "downvote": 90000
    },
    "comments": [
      {
        "username": "123210991",
        "comment": "Astagfirullah, gas gacoan?",
        "vote": {
          "upvote": 10,
          "downvote": 30
        }
      },
      {
        "username": "123210551",
        "comment": "HAHAHAHAH BETUL BGT",
        "vote": {
          "upvote": 10000,
          "downvote": 100
        }
      },
      {
        "username": "122222222",
        "comment": "Kalian puasa??????",
        "vote": {
          "upvote": 2500,
          "downvote": 150
        }
      }
    ]
  },
  {
    "username": "123210456",
    "post": "DEADLINE TUGAS TEKNIK INDUSTRI MENUMPUK, KAPAN TIDURNYA?",
    "image": null,
    "vote": {
      "upvote": 5678,
      "downvote": 120
    },
    "comments": [
      {
        "username": "123210789",
        "comment": "Tidur adalah mitos di TI",
        "vote": {
          "upvote": 4578,
          "downvote": 23
        }
      },
      {
        "username": "123210234",
        "comment": "Laporan Praktikum + Tugas Statistik + Rancangan Pabrik = 💀",
        "vote": {
          "upvote": 2345,
          "downvote": 45
        }
      },
      {
        "username": "123210890",
        "comment": "Baru semester 3 aja udah ngeluh, tunggu semester 5 wkwkwk",
        "vote": {
          "upvote": 1234,
          "downvote": 567
        }
      }
    ]
  },
  {
    "username": "123220567",
    "post": "MAKAN DI KANTIN KOMBANG SEKARANG UDAH MAHAL BANGET YA",
    "image": "https://media-cdn.yummyadvisor.com/store/3c328d49-d75f-4997-b299-12ab1d8e09b8.jpg?x-oss-process=style/type_0",
    "vote": {
      "upvote": 7890,
      "downvote": 234
    },
    "comments": [
      {
        "username": "123220345",
        "comment": "Biasanya makan 15rb sekarang minimal 25rb 😭",
        "vote": {
          "upvote": 5678,
          "downvote": 123
        }
      },
      {
        "username": "123220789",
        "comment": "Ke SGM aja bro, masih bisa makan 20rb-an",
        "vote": {
          "upvote": 3456,
          "downvote": 234
        }
      },
      {
        "username": "123220123",
        "comment": "Jajan di luar kampus aja, lebih murah",
        "vote": {
          "upvote": 2345,
          "downvote": 432
        }
      }
    ]
  },
  {
    "username": "123230678",
    "post": "PERPUS BABARSARI WIFI LEMOT BANGET, MENDING BELI PAKET DATA",
    "image": null,
    "vote": {
      "upvote": 4567,
      "downvote": 345
    },
    "comments": [
      {
        "username": "123230456",
        "comment": "Coba ke lantai 3, di sana lumayan kenceng",
        "vote": {
          "upvote": 3456,
          "downvote": 234
        }
      },
      {
        "username": "123230789",
        "comment": "Perpus Condongcatur lebih kenceng wifinya",
        "vote": {
          "upvote": 2345,
          "downvote": 123
        }
      },
      {
        "username": "123230123",
        "comment": "Bawa laptop ke café aja sekalian, serasa orang kaya",
        "vote": {
          "upvote": 1234,
          "downvote": 567
        }
      }
    ]
  },
  {
    "username": "123240789",
    "post": "DOSEN PEMROGRAMAN LANJUT NGASIH TUGAS BIKIN SISTEM BUAT MARS",
    "image": "https://cdn.idntimes.com/content-images/community/2021/06/4-98683f6205efbdd1649342f83fb045bf-436daac94b3431844d851c18996c230b.jpg",
    "vote": {
      "upvote": 9876,
      "downvote": 123
    },
    "comments": [
      {
        "username": "123240456",
        "comment": "Sekalian aja bikin sistem buat alien",
        "vote": {
          "upvote": 8765,
          "downvote": 234
        }
      },
      {
        "username": "123240123",
        "comment": "Minta bantuan Elon Musk aja wkwkwk",
        "vote": {
          "upvote": 7654,
          "downvote": 345
        }
      },
      {
        "username": "123240567",
        "comment": "Saya barusan ngerjain, ternyata gampang cuy",
        "vote": {
          "upvote": 234,
          "downvote": 5678
        }
      }
    ]
  },
  {
    "username": "123250123",
    "post": "KULIAH JURUSAN TAMBANG TAPI MIKIRNYA JADI YOUTUBER",
    "image": null,
    "vote": {
      "upvote": 6543,
      "downvote": 456
    },
    "comments": [
      {
        "username": "123250456",
        "comment": "Kelarin dulu kuliahnya, nanti bisa jadi content creator tentang tambang",
        "vote": {
          "upvote": 5432,
          "downvote": 567
        }
      },
      {
        "username": "123250789",
        "comment": "Nambang emas di YouTube lebih menjanjikan",
        "vote": {
          "upvote": 4321,
          "downvote": 678
        }
      },
      {
        "username": "123250567",
        "comment": "Ortumu bayar UKT mahal-mahal buat nonton kamu jadi YouTuber",
        "vote": {
          "upvote": 3210,
          "downvote": 789
        }
      }
    ]
  },
  {
    "username": "123260234",
    "post": "NUNGGU HASIL SELEKSI ASISTEN DOSEN PAKE HARAP-HARAP CEMAS",
    "image": null,
    "vote": {
      "upvote": 5432,
      "downvote": 321
    },
    "comments": [
      {
        "username": "123260456",
        "comment": "Semoga keterima, biar bisa makan gratis di kantin dosen",
        "vote": {
          "upvote": 4321,
          "downvote": 123
        }
      },
      {
        "username": "123260789",
        "comment": "Jadi asdos enaknya bisa dekat sama dosen, gampang nilai A",
        "vote": {
          "upvote": 3210,
          "downvote": 234
        }
      },
      {
        "username": "123260567",
        "comment": "Tapi capek lho, ngajar + ngerjain tugas sendiri",
        "vote": {
          "upvote": 2345,
          "downvote": 345
        }
      }
    ]
  },
  {
    "username": "123270345",
    "post": "OSPEK FISIP PALING SANTAI SEUPN, CHANGE MY MIND",
    "image": null,
    "vote": {
      "upvote": 4321,
      "downvote": 765
    },
    "comments": [
      {
        "username": "123270456",
        "comment": "Emang bener, ospek teknik jauh lebih keras",
        "vote": {
          "upvote": 3210,
          "downvote": 456
        }
      },
      {
        "username": "123270789",
        "comment": "Fisip santai tapi tugasnya segudang",
        "vote": {
          "upvote": 2345,
          "downvote": 567
        }
      },
      {
        "username": "123270123",
        "comment": "Ospek FISIP santai karena setelahnya baca buku tebal-tebal",
        "vote": {
          "upvote": 1234,
          "downvote": 678
        }
      }
    ]
  },
  {
    "username": "123280456",
    "post": "BELUM BAYAR UKT, TAPI UDAH PENGEN LIBUR SEMESTER",
    "image": null,
    "vote": {
      "upvote": 8765,
      "downvote": 234
    },
    "comments": [
      {
        "username": "123280789",
        "comment": "Mood banget, pengennya langsung wisuda aja",
        "vote": {
          "upvote": 7654,
          "downvote": 345
        }
      },
      {
        "username": "123280123",
        "comment": "Paling kalau libur juga bingung mau ngapain",
        "vote": {
          "upvote": 6543,
          "downvote": 456
        }
      },
      {
        "username": "123280567",
        "comment": "Boro-boro libur, KRS aja belum disetujui",
        "vote": {
          "upvote": 5432,
          "downvote": 567
        }
      }
    ]
  },
  {
    "username": "123290567",
    "post": "KULIAH JURUSAN TAMBANG, TAPI KOK MALAH MAKIN MISKIN",
    "image": null,
    "vote": {
      "upvote": 9876,
      "downvote": 123
    },
    "comments": [
      {
        "username": "123290456",
        "comment": "Sabar, nanti kalau kerja di Freeport gaji pertama langsung beli Fortuner",
        "vote": {
          "upvote": 8765,
          "downvote": 234
        }
      },
      {
        "username": "123290789",
        "comment": "Banyak praktikum = banyak biaya = makin miskin",
        "vote": {
          "upvote": 7654,
          "downvote": 345
        }
      },
      {
        "username": "123290123",
        "comment": "Minimal bisa nambang cryptocurrency dulu",
        "vote": {
          "upvote": 6543,
          "downvote": 456
        }
      }
    ]
  },
  {
    "username": "123300678",
    "post": "DOSENNYA NGASIH NILAI C PADAHAL UDAH NGERJAIN TUGAS SEMUA",
    "image": "https://cdn.idntimes.com/content-images/community/2021/06/7-98683f6205efbdd1649342f83fb045bf-46698f9ccfc29c52b167bfa80e094df1.JPG",
    "vote": {
      "upvote": 7890,
      "downvote": 321
    },
    "comments": [
      {
        "username": "123300456",
        "comment": "Mungkin tugasnya asal-asalan kali",
        "vote": {
          "upvote": 6789,
          "downvote": 432
        }
      },
      {
        "username": "123300789",
        "comment": "Coba komplain ke dosen, minta review",
        "vote": {
          "upvote": 5678,
          "downvote": 543
        }
      },
      {
        "username": "123300123",
        "comment": "Sama nih, padahal udah nunggu 3 jam buat konsultasi",
        "vote": {
          "upvote": 4567,
          "downvote": 654
        }
      }
    ]
  },
  {
    "username": "123310789",
    "post": "SERING BANGET MATI LAMPU DI KAMPUS, JADI ALASAN TELAT NGUMPULIN TUGAS",
    "image": null,
    "vote": {
      "upvote": 6543,
      "downvote": 432
    },
    "comments": [
      {
        "username": "123310456",
        "comment": "Pakai laptop baterai tahan lama aja",
        "vote": {
          "upvote": 5432,
          "downvote": 543
        }
      },
      {
        "username": "123310123",
        "comment": "Coba ke coworking space, bayar 30rb sehari tapi nyaman",
        "vote": {
          "upvote": 4321,
          "downvote": 654
        }
      },
      {
        "username": "123310567",
        "comment": "Dosen udah kebal sama alasan mati lampu",
        "vote": {
          "upvote": 3210,
          "downvote": 765
        }
      }
    ]
  },
  {
    "username": "123320123",
    "post": "MAU MASUK HIMPUNAN TAPI TAKUT NGGAK BISA BAGI WAKTU",
    "image": null,
    "vote": {
      "upvote": 5432,
      "downvote": 543
    },
    "comments": [
      {
        "username": "123320456",
        "comment": "Masuk aja, bagus buat networking",
        "vote": {
          "upvote": 4321,
          "downvote": 654
        }
      },
      {
        "username": "123320789",
        "comment": "Pikir-pikir dulu, nanti IP turun nyesel",
        "vote": {
          "upvote": 3210,
          "downvote": 765
        }
      },
      {
        "username": "123320567",
        "comment": "Aku masuk himpunan tapi cuma jadi hiasan aja",
        "vote": {
          "upvote": 2345,
          "downvote": 876
        }
      }
    ]
  },
  {
    "username": "123210222",
    "post": "Ada yang tau jadwal kuliah pengganti mata kuliah Statistika?",
    "image": null,
    "vote": {
      "upvote": 500,
      "downvote": 10
    },
    "comments": [
      {
        "username": "123210333",
        "comment": "Coba cek di BIMA, biasanya diumumin di sana.",
        "vote": {
          "upvote": 450,
          "downvote": 5
        }
      },
      {
        "username": "123210444",
        "comment": "Belum ada info terbaru nih, kayaknya nunggu dosennya.",
        "vote": {
          "upvote": 200,
          "downvote": 20
        }
      }
    ]
  },
  {
    "username": "123210555",
    "post": "Cafe deket kampus yang wifi-nya kenceng di mana ya?",
    "image": null,
    "vote": {
      "upvote": 1000,
      "downvote": 50
    },
    "comments": [
      {
        "username": "123210666",
        "comment": "Coba ke Kopi Kenangan, wifi-nya lumayan stabil.",
        "vote": {
          "upvote": 800,
          "downvote": 10
        }
      },
      {
        "username": "123210777",
        "comment": "Kalau mau yang lebih tenang, ke perpustakaan pusat aja.",
        "vote": {
          "upvote": 600,
          "downvote": 30
        }
      }
    ]
  },
  {
    "username": "123210888",
    "post": "Ada yang mau ikut study group mata kuliah Pemrograman Web?",
    "image": null,
    "vote": {
      "upvote": 300,
      "downvote": 5
    },
    "comments": [
      {
        "username": "123210999",
        "comment": "Aku mau ikut dong, kebetulan lagi kesulitan di bagian backend.",
        "vote": {
          "upvote": 250,
          "downvote": 2
        }
      },
      {
        "username": "123210000",
        "comment": "Boleh, kapan dan di mana nih?",
        "vote": {
          "upvote": 200,
          "downvote": 3
        }
      }
    ]
  },
  {
    "username": "123211111",
    "post": "Guys, ada yang tau tempat fotocopy yang buka 24 jam di sekitar sini?",
    "image": null,
    "vote": {
      "upvote": 750,
      "downvote": 20
    },
    "comments": [
      {
        "username": "123211222",
        "comment": "Coba di daerah Gejayan, biasanya ada yang buka semalaman.",
        "vote": {
          "upvote": 600,
          "downvote": 5
        }
      },
      {
        "username": "123211333",
        "comment": "Atau di deket terminal Condongcatur, banyak yang buka sampai larut.",
        "vote": {
          "upvote": 400,
          "downvote": 10
        }
      }
    ]
  },
  {
    "username": "123211444",
    "post": "Ada yang mau ikut futsal bareng nanti sore?",
    "image": null,
    "vote": {
      "upvote": 900,
      "downvote": 10
    },
    "comments": [
      {
        "username": "123211555",
        "comment": "Aku ikut dong, tapi mainnya jangan terlalu serius ya, hehe.",
        "vote": {
          "upvote": 700,
          "downvote": 2
        }
      },
      {
        "username": "123211666",
        "comment": "Boleh, jam berapa dan di lapangan mana?",
        "vote": {
          "upvote": 500,
          "downvote": 5
        }
      }
    ]
  },
  {
    "username": "123211777",
    "post": "Guys, ada yang punya catatan mata kuliah Algoritma dan Struktur Data?",
    "image": null,
    "vote": {
      "upvote": 600,
      "downvote": 15
    },
    "comments": [
      {
        "username": "123211888",
        "comment": "Aku punya, tapi masih berantakan, mau?",
        "vote": {
          "upvote": 450,
          "downvote": 3
        }
      },
      {
        "username": "123211999",
        "comment": "Aku juga punya, tapi dalam bentuk digital, mau aku share?",
        "vote": {
          "upvote": 300,
          "downvote": 8
        }
      }
    ]
  },
  {
    "username": "123212000",
    "post": "Ada yang tau tempat makan murah meriah di sekitar kampus?",
    "image": null,
    "vote": {
      "upvote": 800,
      "downvote": 20
    },
    "comments": [
      {
        "username": "123212111",
        "comment": "Coba warung burjo deket gerbang belakang, harganya mahasiswa banget.",
        "vote": {
          "upvote": 650,
          "downvote": 5
        }
      }
    ]
  },
  {
    "username": "123240056",
    "post": "KULIAH INFORMATIKA SEMINGGU SEKALI, TAPI TUGAS KODING TIAP HARI. INI KULIAH APA KERJA FREELANCE SIH???",
    "image": "https://cdn.idntimes.com/content-images/community/2023/07/img-20230715-152512-8ed369cba5cb2e66c0b0dd48d03514ec.jpg",
    "vote": {
      "upvote": 15000,
      "downvote": 42
    },
    "comments": [
      {
        "username": "123240078",
        "comment": "Gaji freelance mah dibayar, ini kita yang bayar wkwkwk",
        "vote": {
          "upvote": 12500,
          "downvote": 20
        }
      },
      {
        "username": "123240234",
        "comment": "Minimal kalo freelance ada client, ini dosennya ngilang pas ditanya error",
        "vote": {
          "upvote": 8760,
          "downvote": 15
        }
      },
      {
        "username": "123240129",
        "comment": "Yang sabar bro, nanti kita jadi Sultan AI wkwkwk",
        "vote": {
          "upvote": 5670,
          "downvote": 890
        }
      }
    ]
  },
  {
    "username": "123210987",
    "post": "MAHASISWA INFORMATIKA: PAGI BANGUN, SIANG NGODING, MALEM DEBUG, SUBUH SUBMIT, PAGI NILAI C",
    "image": null,
    "vote": {
      "upvote": 25678,
      "downvote": 123
    },
    "comments": [
      {
        "username": "123210456",
        "comment": "Dapet C udah berkah, aku malah disuruh perbaiki lagi 😭",
        "vote": {
          "upvote": 20456,
          "downvote": 34
        }
      },
      {
        "username": "123210789",
        "comment": "Aku koding sendiri nilai C, liat temen copas nilai A. Apa gunanya hidup?",
        "vote": {
          "upvote": 18945,
          "downvote": 56
        }
      },
      {
        "username": "123210654",
        "comment": "Dosen: 'Cuma segini kemampuan kalian? ChatGPT aja bisa lebih bagus'",
        "vote": {
          "upvote": 15672,
          "downvote": 123
        }
      }
    ]
  },
  {
    "username": "123250678",
    "post": "PARKIRAN MOTOR KAMPUS BISA DIPAKE BUAT LATIHAN MAIN MAZE RUNNER, SKILL MENCARI MOTOR LEVEL DEWA",
    "image": null,
    "vote": {
      "upvote": 12345,
      "downvote": 321
    },
    "comments": [
      {
        "username": "123250432",
        "comment": "Belum lagi kalo ujan, nyari motor sambil main dance hujan-hujanan",
        "vote": {
          "upvote": 10234,
          "downvote": 98
        }
      },
      {
        "username": "123250876",
        "comment": "Aku udah 3x salah bawa motor orang, untung belum sampe rumah",
        "vote": {
          "upvote": 9876,
          "downvote": 45
        }
      },
      {
        "username": "123250219",
        "comment": "Pro tip: kasih stiker mencolok di motor biar gampang dicari",
        "vote": {
          "upvote": 8765,
          "downvote": 234
        }
      }
    ]
  },
  {
    "username": "123230111",
    "post": "ANAK INFORMATIKA BISA BIKIN WEBSITE TAPI GA BISA BIKIN HATI GEBETAN BERGETAR",
    "image": null,
    "vote": {
      "upvote": 18976,
      "downvote": 456
    },
    "comments": [
      {
        "username": "123230222",
        "comment": "Kita cuma bisa deploy website, ga bisa deploy perasaan 😔",
        "vote": {
          "upvote": 17865,
          "downvote": 32
        }
      },
      {
        "username": "123230333",
        "comment": "Pacarannya virtual, chattingan doang sampe lulus",
        "vote": {
          "upvote": 15432,
          "downvote": 78
        }
      },
      {
        "username": "123230444",
        "comment": "Aku bisa bikin API tapi ga bisa A-PIkat hati dia",
        "vote": {
          "upvote": 14321,
          "downvote": 89
        }
      }
    ]
  },
  {
    "username": "123270555",
    "post": "WIFI KAMPUS KAYAK PERASAANKU KE DIA, KADANG ADA KADANG HILANG",
    "image": null,
    "vote": {
      "upvote": 12543,
      "downvote": 231
    },
    "comments": [
      {
        "username": "123270666",
        "comment": "Wifi kampus & Gebetan: sama-sama susah diconnect",
        "vote": {
          "upvote": 11432,
          "downvote": 98
        }
      },
      {
        "username": "123270777",
        "comment": "Aku pake WiFi hotspot hp sendiri, biar ga PHP kayak WiFi kampus",
        "vote": {
          "upvote": 10321,
          "downvote": 76
        }
      },
      {
        "username": "123270888",
        "comment": "Password WiFi kampus diganti mulu, kayak status gebetan: berubah-ubah",
        "vote": {
          "upvote": 9876,
          "downvote": 123
        }
      }
    ]
  },
  {
    "username": "123290123",
    "post": "INFORMATIKA SEMESTER 1: 'MAU BIKIN STARTUP KEREN'. INFORMATIKA SEMESTER 7: 'MAU LULUS AJA UDAH SYUKUR'",
    "image": "https://cdn.idntimes.com/content-images/community/2023/12/photo-6022705740533313949-y-cc7762ba91ad632c680cfb68da97b3e9-aa2b07a0f3de8a1d5272cb23b4a62b29.jpg",
    "vote": {
      "upvote": 19876,
      "downvote": 45
    },
    "comments": [
      {
        "username": "123290234",
        "comment": "Semester 1: 'Mau jadi Steve Jobs'. Semester 7: 'Mau job apa aja diterima'",
        "vote": {
          "upvote": 18765,
          "downvote": 23
        }
      },
      {
        "username": "123290345",
        "comment": "Semester 1: Belajar bikin AI. Semester 7: Pake ChatGPT buat ngerjain tugas akhir",
        "vote": {
          "upvote": 17654,
          "downvote": 34
        }
      },
      {
        "username": "123290456",
        "comment": "Semester 1: 'Nanti skripsi riset blockchain'. Semester 7: 'Website CRUD aja deh yang penting lulus'",
        "vote": {
          "upvote": 16543,
          "downvote": 45
        }
      }
    ]
  },
  {
    "username": "123220999",
    "post": "KALO DOMPET SEKOSONG PARKIRAN KAMPUS WAKTU JAM PULANG, AKU UDAH BANGKRUT DARI DULU",
    "image": null,
    "vote": {
      "upvote": 13456,
      "downvote": 98
    },
    "comments": [
      {
        "username": "123220888",
        "comment": "Parkiran sepeda aja masih penuh, apalagi parkiran hati~",
        "vote": {
          "upvote": 12345,
          "downvote": 87
        }
      },
      {
        "username": "123220777",
        "comment": "Pro tip: kelas pagi dateng duluan, parkir depan. Kelas siang? selamat berjuang~",
        "vote": {
          "upvote": 11234,
          "downvote": 76
        }
      },
      {
        "username": "123220666",
        "comment": "Kadang aku sengaja dateng telat biar sekalian bolos, daripada parkir jauh banget",
        "vote": {
          "upvote": 10987,
          "downvote": 123
        }
      }
    ]
  },
  {
    "username": "123260555",
    "post": "BERAPA BANYAK PROGRAMMER YANG DIBUTUHKAN UNTUK MENGGANTI BOLA LAMPU? TIDAK ADA, ITU MASALAH HARDWARE!",
    "image": null,
    "vote": {
      "upvote": 14567,
      "downvote": 234
    },
    "comments": [
      {
        "username": "123260666",
        "comment": "Kok bisa error ya? Padahal di laptopku jalan normal",
        "vote": {
          "upvote": 13456,
          "downvote": 123
        }
      },
      {
        "username": "123260777",
        "comment": "Masalahnya pasti di cache, clear cache dulu",
        "vote": {
          "upvote": 12345,
          "downvote": 98
        }
      },
      {
        "username": "123260888",
        "comment": "Sudah coba restart lampu bolanya belum?",
        "vote": {
          "upvote": 11234,
          "downvote": 87
        }
      }
    ]
  },
  {
    "username": "123280333",
    "post": "ADA YG BILANG KANTIN KOMBANG MAHAL, TAPI MASIH LEBIH MURAH DARIPADA BIAYA MENTAL KULIAH DI SINI",
    "image": null,
    "vote": {
      "upvote": 22345,
      "downvote": 78
    },
    "comments": [
      {
        "username": "123280444",
        "comment": "Biaya mental ga bisa dicicil, makan di kombang masih bisa utang",
        "vote": {
          "upvote": 21234,
          "downvote": 67
        }
      },
      {
        "username": "123280555",
        "comment": "Setidaknya kalo makan di kombang kenyang fisik, kuliah di sini kenyang mental",
        "vote": {
          "upvote": 20123,
          "downvote": 56
        }
      },
      {
        "username": "123280666",
        "comment": "Masih mending kombang, ga bikin aku nangis tiap minggu",
        "vote": {
          "upvote": 19876,
          "downvote": 45
        }
      }
    ]
  },
  {
    "username": "123210222",
    "post": "KENAPA PROGRAMMER SELALU BINGUNG DENGAN CHRISTMAS? KARENA MEREKA BIASA DENGAN SINTAKS 25 DEC, BUKAN 25 DEC(EMBER)!",
    "image": null,
    "vote": {
      "upvote": 16789,
      "downvote": 345
    },
    "comments": [
      {
        "username": "123210333",
        "comment": "Lelucon recursion: Lihat lelucon recursion",
        "vote": {
          "upvote": 15678,
          "downvote": 234
        }
      },
      {
        "username": "123210444",
        "comment": "Apa bedanya programmer dan dinosaurus? Dinosaurus punah, programmer pun ah males kerjain bugnya",
        "vote": {
          "upvote": 14567,
          "downvote": 123
        }
      },
      {
        "username": "123210555",
        "comment": "Error 404: Lelucon tidak ditemukan",
        "vote": {
          "upvote": 13456,
          "downvote": 98
        }
      }
    ]
  },
  {
    "username": "123240444",
    "post": "DOSEN: 'DEADLINE BESOK YA'. MAHASISWA: 'DEADLINE ADALAH BESOK JAM 23:59:59'",
    "image": null,
    "vote": {
      "upvote": 20987,
      "downvote": 76
    },
    "comments": [
      {
        "username": "123240555",
        "comment": "Bold of you to assume kita ga nunggu sampe 23:59:58",
        "vote": {
          "upvote": 19876,
          "downvote": 65
        }
      },
      {
        "username": "123240666",
        "comment": "Server down jam 23:50, panik semua wkwkwk",
        "vote": {
          "upvote": 18765,
          "downvote": 54
        }
      },
      {
        "username": "123240777",
        "comment": "Aku pernah submit jam 00:00:01, dianggap telat sehari 🙃",
        "vote": {
          "upvote": 17654,
          "downvote": 43
        }
      }
    ]
  }
]""";

class ForumPost {
  final String username;
  final String post;
  final String? image;
  final Vote vote;
  final List<Comment> comments;

  ForumPost({
    required this.username,
    required this.post,
    required this.image,
    required this.vote,
    required this.comments,
  });

  factory ForumPost.fromJson(Map<String, dynamic> json) {
    return ForumPost(
      username: json['username'],
      post: json['post'],
      image: json['image'],
      vote: Vote.fromJson(json['vote']),
      comments:
          (json['comments'] as List)
              .map((comment) => Comment.fromJson(comment))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'post': post,
      'image': image,
      'vote': vote.toJson(),
      'comments': comments.map((comment) => comment.toJson()).toList(),
    };
  }
}

class Vote {
  final int upvote;
  final int downvote;

  Vote({required this.upvote, required this.downvote});

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(upvote: json['upvote'], downvote: json['downvote']);
  }

  Map<String, dynamic> toJson() {
    return {'upvote': upvote, 'downvote': downvote};
  }
}

class Comment {
  final String username;
  final String comment;
  final Vote vote;

  Comment({required this.username, required this.comment, required this.vote});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      username: json['username'],
      comment: json['comment'],
      vote: Vote.fromJson(json['vote']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'comment': comment, 'vote': vote.toJson()};
  }
}

class DummyData {
  static List<ForumPost> GetDummyData() {
    List<dynamic> _rawData = json.decode(rawJson);
    List<ForumPost> data =
        _rawData.map((item) => ForumPost.fromJson(item)).toList();
    return data;
  }
}