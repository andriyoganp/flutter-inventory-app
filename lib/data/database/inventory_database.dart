import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'friend_entity.dart';
import 'loan_tool_entry_entity.dart';
import 'tool_entity.dart';

part 'inventory_database.g.dart';

@DriftDatabase(tables: <Type>[Friends, LoanToolEntries, Tools])
class InventoryDatabase extends _$InventoryDatabase {
  InventoryDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertEntries() async {
    return batch((Batch b) {
      b.insertAll(loanToolEntries, <LoanToolEntriesCompanion>[
        LoanToolEntriesCompanion.insert(
          toolId: 1,
          friendId: 1,
          loanedCount: 1,
          loanedDate: DateTime.now(),
        ),
        LoanToolEntriesCompanion.insert(
          toolId: 1,
          friendId: 2,
          loanedCount: 1,
          loanedDate: DateTime.now(),
        ),
        LoanToolEntriesCompanion.insert(
          toolId: 1,
          friendId: 1,
          loanedCount: 3,
          loanedDate: DateTime.now(),
        ),
        LoanToolEntriesCompanion.insert(
          toolId: 2,
          friendId: 4,
          loanedCount: 2,
          loanedDate: DateTime.now(),
        ),
      ]);
    });
  }

  Future<void> insertAll() async {
    return batch((Batch b) {
      b.insertAll(tools, <ToolsCompanion>[
        ToolsCompanion.insert(
          id: const Value<int>(1),
          name: 'Wrench',
          imageUrl:
              'https://static.bmdstatic.com/pk/product/large/5d425247bb661.jpg',
          totalItem: 6,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(2),
          name: 'Cutter',
          imageUrl:
              'https://bebeli.bekasikab.go.id/asset/foto_produk/cutter.jpg',
          totalItem: 12,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(3),
          name: 'Pliers',
          imageUrl:
              'https://www.major-tech.com/wp-content/uploads/2023/02/EVP0206_web.jpg',
          totalItem: 15,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(4),
          name: 'Screwdriver',
          imageUrl:
              'https://www.lttstore.com/cdn/shop/products/AdditionalLTTScrewDriverPhotos-2000px-4.jpg?v=1680027241&width=1946',
          totalItem: 11,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(5),
          name: 'Welding Machine',
          imageUrl:
              'https://tehniq.com/cdn/shop/products/Mesin-Las-VECTOR-Welding-Machine-MIG-145-Gasless_800x_crop_center.jpg?v=1610692700',
          totalItem: 3,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(6),
          name: 'Welding Glasses',
          imageUrl: 'https://m.media-amazon.com/images/I/51HqP9mmg6L.jpg',
          totalItem: 7,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(7),
          name: 'Hammer',
          imageUrl: 'https://m.media-amazon.com/images/I/71tTWyypTKL.jpg',
          totalItem: 3,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(8),
          name: 'Measuring Tape',
          imageUrl:
              'https://alatsmk.com/storage/products/1/Teknik%20Pengelasan/Measuring%20Tape.jpg',
          totalItem: 8,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(9),
          name: 'Alan key Set',
          imageUrl:
              'https://images.tokopedia.net/img/cache/700/VqbcmM/2020/8/6/fe43b9f2-300c-4910-a977-91b611c87b37.jpg',
          totalItem: 4,
        ),
        ToolsCompanion.insert(
          id: const Value<int>(10),
          name: 'Air compressor',
          imageUrl:
              'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/7/29/9ff15f3e-0afe-4358-9458-b185bf1ec66c.jpg',
          totalItem: 2,
        ),
      ]);

      b.insertAll(friends, <FriendsCompanion>[
        FriendsCompanion.insert(
          id: const Value<int>(1),
          name: 'Joni',
        ),
        FriendsCompanion.insert(
          id: const Value<int>(2),
          name: 'Sentosa',
        ),
        FriendsCompanion.insert(
          id: const Value<int>(3),
          name: 'Siti',
        ),
        FriendsCompanion.insert(
          id: const Value<int>(4),
          name: 'Sari',
        ),
        FriendsCompanion.insert(
          id: const Value<int>(5),
          name: 'Bagas',
        ),
      ]);
    });
  }
}

LazyDatabase _openConnection() => LazyDatabase(() async {
      final Directory dbFolder = await getApplicationDocumentsDirectory();
      final File file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
