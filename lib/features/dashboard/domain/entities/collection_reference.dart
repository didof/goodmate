abstract class CollectionReference {
  final String uid;
  const CollectionReference(this.uid);
}

class FlatUid extends CollectionReference {
  FlatUid(String uid) : super(uid);
  factory FlatUid.generate() {
    return FlatUid('flat_uid');
  }
}

class ChatUid extends CollectionReference {
  ChatUid(String uid) : super(uid);
  factory ChatUid.generate() {
    return ChatUid('chat_uid');
  }
}

class CleaningScheduleUid extends CollectionReference {
  CleaningScheduleUid(String uid) : super(uid);
  factory CleaningScheduleUid.generate() {
    return CleaningScheduleUid('cleaning_schedule_uid');
  }
}

class GroceryShoppingUid extends CollectionReference {
  GroceryShoppingUid(String uid) : super(uid);
  factory GroceryShoppingUid.generate() {
    return GroceryShoppingUid('grocery_shopping_uid');
  }
}
