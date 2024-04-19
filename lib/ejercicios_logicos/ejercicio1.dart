class MyMatrix {
  int dimension(List<dynamic> matrix) {
    int dim = 0;
    dynamic element = matrix;
    while (element is List) {
      dim++;
      if (element.isEmpty) break;
      element = element[0];
    }
    return dim;
  }

  bool straight(List<dynamic> matrix) {
    bool isStraight = true;
    int firstLength = matrix[0] is List<dynamic> ? matrix[0].length : 1;
    for (var item in matrix) {
      if (item is List<dynamic> && item.length != firstLength) {
        isStraight = false;
        break;
      }
    }
    return isStraight;
  }

  int compute(List<dynamic> matrix) {
    int sum = 0;
    void sumElements(dynamic item) {
      if (item is List<dynamic>) {
        for (var subItem in item) {
          sumElements(subItem);
        }
      } else if (item is int) {
        sum += item;
      }
    }

    sumElements(matrix);
    return sum;
  }
}

void main() {
  final MyMatrix o = MyMatrix();
  var a = [1, 2];
  var b = [
    [1, 2],
    [2, 4]
  ];
  var c = [
    [1, 2],
    [2, 4],
    [2, 4]
  ];
  var d = [
    [
      [3, 4],
      [6, 5]
    ]
  ];
  var e = [
    [
      [1, 2, 3]
    ],
    [
      [5, 6, 7],
      [5, 4, 3]
    ],
    [
      [3, 5, 6],
      [4, 8, 3],
      [2, 3]
    ]
  ];
  var f = [
    [
      [1, 2, 3],
      [2, 3, 4]
    ],
    [
      [5, 6, 7],
      [5, 4, 3]
    ],
    [
      [3, 5, 6],
      [4, 8, 3]
    ]
  ];
  print(o.dimension(a)); // 1
  print(o.dimension(b)); // 2
  print(o.dimension(c)); // 2
  print(o.dimension(d)); // 3
  print(o.dimension(e)); // 3
  print(o.dimension(f)); // 3

  print(o.straight(a)); // true
  print(o.straight(b)); // true
  print(o.straight(c)); // true
  print(o.straight(d)); // true
  print(o.straight(e)); // false
  print(o.straight(f)); // true

  print(o.compute(a)); // 3
  print(o.compute(b)); // 9
  print(o.compute(c)); // 15
  print(o.compute(d)); // 18
  print(o.compute(e)); // 70
  print(o.compute(f)); // 77
}
