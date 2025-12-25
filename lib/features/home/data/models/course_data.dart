/// Data models and constants for course content
/// Contains all module, topic, and PDF mapping data
library;

/// Represents a single content item (konu or test)
class ContentItem {
  final String title;
  final String pdfPath;
  final ContentType type;

  const ContentItem({
    required this.title,
    required this.pdfPath,
    required this.type,
  });
}

/// Type of content
enum ContentType { konu, test }

/// Represents a topic within a module
class Topic {
  final String name;
  final List<ContentItem> contents;

  const Topic({required this.name, required this.contents});
}

/// Represents a module
class Module {
  final String name;
  final List<Topic> topics;

  const Module({required this.name, required this.topics});
}

/// All course data
class CourseData {
  static const String _basePathModule1 = 'assets/pdf/modül-1/';
  static const String _basePathModule2 = 'assets/pdf/modül-2/';
  static const String _basePathModule3 = 'assets/pdf/modül-3/';
  static const String _basePathModule4 = 'assets/pdf/modül-4/';
  static const String _basePathModule5 = 'assets/pdf/modül-5/';

  static final List<Module> modules = [
    // ============ MODÜL 01 ============
    Module(
      name: 'Modül 01',
      topics: [
        Topic(
          name: 'Mantık',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule1}MANTIK-KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test',
              pdfPath: '${_basePathModule1}MANTIK-TEST-1.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Kümeler',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule1}KÜME KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule1}KÜME TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule1}KÜME TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '${_basePathModule1}KÜME TEST-3.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 4',
              pdfPath: '${_basePathModule1}KÜME TEST-4.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 5',
              pdfPath: '${_basePathModule1}KÜME TEST-5.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Bağıntı',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule1}BAĞINTI KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule1}BAĞINTI TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule1}BAĞINTI TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Fonksiyon',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule1}FONKSİYONLAR KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule1}FONKSİYONLAR TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule1}FONKSİYONLAR TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '${_basePathModule1}FONKSİYONLAR TEST-3.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 4',
              pdfPath: '${_basePathModule1}FONKSİYONLAR TEST-4.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 5',
              pdfPath: '${_basePathModule1}FONKSİYONLAR TEST-5.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'İşlem',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '$_basePathModule1İŞLEM KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test',
              pdfPath: '$_basePathModule1İŞLEM TEST-1.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Modüler Aritmetik',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule1}MODÜLER ARİTMETİK KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule1}MODÜLER ARİTMETİK TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule1}MODÜLER ARİTMETİK TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '${_basePathModule1}MODÜLER ARİTMETİK TEST-3.pdf',
              type: ContentType.test,
            ),
          ],
        ),
      ],
    ),

    // ============ MODÜL 02 ============
    Module(
      name: 'Modül 02',
      topics: [
        Topic(
          name: 'Temel Kavramlar',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}TEMEL KAVRAMLAR KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test',
              pdfPath: '${_basePathModule2}TEMEL KAVRAMLAR TEST-1.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Ardışık Sayılar',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}ARDIŞIK SAYILAR KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test',
              pdfPath: '${_basePathModule2}ARDIŞIK SAYILAR TEST-1.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Sayıların çözümlemesi',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}SAYILARIN ÇÖZÜMLEMESİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test',
              pdfPath: '${_basePathModule2}SAYILARIN ÇÖZÜMLEMESİ TEST-1.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Taban Aritmetiği',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}TABAN ARİTMETİĞİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 01',
              pdfPath: '${_basePathModule2}TABAN ARİTMETİĞİ TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 02',
              pdfPath: '${_basePathModule2}TABAN ARİTMETİĞİ TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Faktöriyel',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}FAKTÖRİYEL KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test',
              pdfPath: '${_basePathModule2}FAKTÖRİYEL TEST-1.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Asal Sayılar',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}ASAL SAYILAR KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 01',
              pdfPath: '${_basePathModule2}ASAL SAYILAR TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 02',
              pdfPath: '${_basePathModule2}ASAL SAYILAR TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Doğal Sayılarda Dört İşlem',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}DOĞAL SAYILARDA DÖRTİŞLEM KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 01',
              pdfPath:
                  '${_basePathModule2}DOĞAL SAYILARDA DÖRTİŞLEM TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 02',
              pdfPath:
                  '${_basePathModule2}DOĞAL SAYILARDA DÖRTİŞLEM TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Bölme-Bölünebilme',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}BÖLÜNEBİME KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test',
              pdfPath: '${_basePathModule2}BÖLÜNEBİLME TEST-1.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'OBEB-OKEK',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule2}OBEB-OKEK KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 01',
              pdfPath: '${_basePathModule2}OBEB-OKEK test-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 02',
              pdfPath: '${_basePathModule2}OBEB-OKEK test-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
      ],
    ),

    // ============ MODÜL 03 ============
    Module(
      name: 'Modül 03',
      topics: [
        Topic(
          name: 'Rasyonel Sayılar',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule3}RASYONEL SAYILAR KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule3}RASYONEL SAYILAR TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule3}RASYONEL SAYILAR TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '${_basePathModule3}RASYONEL SAYILAR TEST-3.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Ondalık Sayılar',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule3}ONDALIK SAYILAR KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule3}ONDALIK SAYILAR TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule3}ONDALIK SAYILAR TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Basit Eşitsizlikler',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule3}BASİT EŞİTSİZLİKLER KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule3}BASİT EŞİTSİZLİKLER TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule3}BASİT EŞİTSİZLİKLER TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Mutlak Değer',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule3}MUTLAK DEĞER KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule3}MJTLAK DEĞER TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule3}MJTLAK DEĞER TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Birinci Dereceden Denklemler',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath:
                  '${_basePathModule3}BİRİNCİ DERECEDEN DENKLEMLER KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath:
                  '${_basePathModule3}BİRİNCİ DERECEDEN DENKLEMLER TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath:
                  '${_basePathModule3}BİRİNCİ DERECEDEN DENKLEMLER TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath:
                  '${_basePathModule3}BİRİNCİ DERECEDEN DENKLEMLER TEST-3.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 4',
              pdfPath:
                  '${_basePathModule3}BİRİNCİ DERECEDEN DENKLEMLER TEST-4.pdf',
              type: ContentType.test,
            ),
          ],
        ),
      ],
    ),

    // ============ MODÜL 04 ============
    Module(
      name: 'Modül 04',
      topics: [
        Topic(
          name: 'Üslü İfadeler',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '$_basePathModule4ÜSLÜ İFADELER KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '$_basePathModule4ÜSLÜ İFADELER TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '$_basePathModule4ÜSLÜ İFADELER TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '$_basePathModule4ÜSLÜ İFADELER TEST-3.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Köklü İfadeler',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule4}KÖKLÜ İFADELER KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule4}KÖKLÜ İFADELER TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule4}KÖKLÜ İFADELER TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '${_basePathModule4}KÖKLÜ İFADELER TEST-3.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 4',
              pdfPath: '${_basePathModule4}KÖKLÜ İFADELER TEST-4.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 5',
              pdfPath: '${_basePathModule4}KÖKLÜ İFADELER TEST-5.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Çarpanlara Ayırma',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '$_basePathModule4ÇARPANLARRA AYIRMA KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '$_basePathModule4ÇARPANLARRA AYIRMA TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '$_basePathModule4ÇARPANLARRA AYIRMA TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '$_basePathModule4ÇARPANLARRA AYIRMA TEST-3.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 4',
              pdfPath: '$_basePathModule4ÇARPANLARRA AYIRMA TEST-4.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Oran Orantı',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule4}ORAN-ORANTI KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule4}ORAN-ORANTI TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule4}ORAN-ORANTI TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '${_basePathModule4}ORAN-ORANTI TEST-3.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 4',
              pdfPath: '${_basePathModule4}ORAN-ORANTI TEST-4.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 5',
              pdfPath: '${_basePathModule4}ORAN-ORANTI TEST-5.pdf',
              type: ContentType.test,
            ),
          ],
        ),
      ],
    ),

    // ============ MODÜL 05 ============
    Module(
      name: 'Modül 05',
      topics: [
        Topic(
          name: 'Sayı ve Kesir Problemleri',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule5}SAYI KESİR PPROBLEMLERİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule5}SAYI KESİR PPROBLEMLERİ TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule5}SAYI KESİR PPROBLEMLERİ TEST-2.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 3',
              pdfPath: '${_basePathModule5}SAYI KESİR PPROBLEMLERİ TEST-3.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Yaş Problemleri',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule5}YAŞ PROBLEMLERİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule5}YAŞ PROBLEMLERİ TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule5}YAŞ PROBLEMLERİ TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'İşçi-Havuz Problemleri',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '$_basePathModule5İŞÇİ HAVUZ PROBLEMLERİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '$_basePathModule5İŞÇİ HAVUZ PROBLEMLERİ TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '$_basePathModule5İŞÇİ HAVUZ PROBLEMLERİ TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Yüzde –Faiz Problemleri',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule5}YÜZDE VE FAİZ PROBLEMLERİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath:
                  '${_basePathModule5}YÜZDE VE FAİZ PROBLEMLERİ TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath:
                  '${_basePathModule5}YÜZDE VE FAİZ PROBLEMLERİ TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Karışım Problemleri',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule5}KARIŞIM PROBLEMLERİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule5}KARIŞIM PROBLEMLERİ TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule5}KARIŞIM PROBLEMLERİ TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
        Topic(
          name: 'Hareket Problemleri',
          contents: [
            ContentItem(
              title: 'konu',
              pdfPath: '${_basePathModule5}HAREKET PROBLEMLERİ KONU.pdf',
              type: ContentType.konu,
            ),
            ContentItem(
              title: 'test 1',
              pdfPath: '${_basePathModule5}HAREKET PROBLEMLERİ TEST-1.pdf',
              type: ContentType.test,
            ),
            ContentItem(
              title: 'test 2',
              pdfPath: '${_basePathModule5}HAREKET PROBLEMLERİ TEST-2.pdf',
              type: ContentType.test,
            ),
          ],
        ),
      ],
    ),
  ];
}
