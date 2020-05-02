int gameLogic(dynamic value, int i, int j) {
  int val;
  if (value.toString().contains("player1")) {
    print("game l => $value");

    //if (i == 0) {
    // int temp =
    //     int.parse(value.toString().trim().replaceRange(0, 7, "").trim());
    // if (temp == 1) {
    //   i += temp;
    // } else {
    //   i = 0;
    // }
    // } else {
    print(value
        .toString()
        .trim()
        .replaceRange(0, 7, "")
        .trim()
        .replaceRange(1, 1, "")
        .trim());
    i += int.parse(value
        .toString()
        .trim()
        .replaceRange(0, 7, "")
        .trim()
        .replaceRange(1, 1, "")
        .trim());
    val = i;
    // if (i == 7) {
    //   i += 28;
    // }
    //}

  } else if (value.toString().contains("player2")) {
    if (j == 0) {
      int temp =
          int.parse(value.toString().trim().replaceRange(0, 7, "").trim());
      if (temp == 1) {
        j += temp;
      } else {
        j = 0;
      }
      val = j;
    } else {
      j += int.parse(value.toString().trim().replaceRange(0, 7, "").trim());
      val = j;
    }
  }

  return val;
}
