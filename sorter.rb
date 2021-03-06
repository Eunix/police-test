require 'fileutils'

sets = {
  "level" => {
    1 =>   [0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0],
    2 =>   [1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1],
    3 =>   [2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2],
    4 =>   [3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3],
    5 =>   [4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3, 4],
    6 =>   [4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3, 4],
    7 =>   [3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3],
    8 =>   [2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2],
    9 =>   [1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1],
    10 =>  [0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0],
    11 =>  [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0],
    12 =>  [1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1],
    13 =>  [2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2],
    14 =>  [3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3],
    15 =>  [4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4],
    16 =>  [4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4],
    17 =>  [3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3],
    18 =>  [2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2],
    19 =>  [1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1],
    20 =>  [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0],
    21 =>  [4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4],
    22 =>  [3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4],
    23 =>  [2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3],
    24 =>  [1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2],
    25 =>  [0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1],
    26 =>  [0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1],
    27 =>  [1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2],
    28 =>  [2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3],
    29 =>  [3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4],
    30 =>  [4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4],
    31 =>  [0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4],
    32 =>  [1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0],
    33 =>  [2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1],
    34 =>  [3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2],
    35 =>  [4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3],
    36 =>  [0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4],
    37 =>  [1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0],
    38 =>  [2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1],
    39 =>  [3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2],
    40 =>  [4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3],
    41 =>  [4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0],
    42 =>  [3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4],
    43 =>  [2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3],
    44 =>  [1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2],
    45 =>  [0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1],
    46 =>  [0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1],
    47 =>  [1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2],
    48 =>  [2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3],
    49 =>  [3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4],
    50 =>  [4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0],
    51 =>  [0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0],
    52 =>  [1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1],
    53 =>  [2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2],
    54 =>  [3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3],
    55 =>  [4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3, 4],
    56 =>  [4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3, 4],
    57 =>  [3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3],
    58 =>  [2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2],
    59 =>  [1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1],
    60 =>  [0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0],
    61 =>  [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0],
    62 =>  [1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1],
    63 =>  [2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2],
    64 =>  [3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3],
    65 =>  [4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4],
    66 =>  [4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4],
    67 =>  [3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2, 3, 3],
    68 =>  [2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1, 2, 2],
    69 =>  [1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, 1, 1],
    70 =>  [0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0],
    71 =>  [4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4],
    72 =>  [3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4],
    73 =>  [2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3],
    74 =>  [1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2],
    75 =>  [0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1],
    76 =>  [0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1],
    77 =>  [1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2],
    78 =>  [2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3],
    79 =>  [3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4],
    80 =>  [4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4],
    81 =>  [0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4],
    82 =>  [1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0],
    83 =>  [2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1],
    84 =>  [3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2],
    85 =>  [4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3],
    86 =>  [0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4],
    87 =>  [1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0],
    88 =>  [2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1],
    89 =>  [3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2],
    90 =>  [4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3, 4, 0, 1, 2, 3],
    91 =>  [4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0],
    92 =>  [3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4],
    93 =>  [2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3],
    94 =>  [1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2],
    95 =>  [0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1],
    96 =>  [0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1],
    97 =>  [1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2],
    98 =>  [2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3],
    99 =>  [3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4],
    100 => [4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0, 4, 3, 2, 1, 0]
  },
  "noise" => {
    1 =>   ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    2 =>   ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    3 =>   ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    4 =>   ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    5 =>   ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    6 =>   ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    7 =>   ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    8 =>   ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    9 =>   ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    10 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    11 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    12 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    13 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    14 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    15 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    16 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    17 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    18 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    19 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    20 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    21 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    22 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    23 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    24 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    25 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    26 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    27 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    28 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    29 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    30 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    31 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    32 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    33 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    34 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    35 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    36 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    37 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    38 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    39 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    40 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    41 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    42 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    43 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    44 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    45 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    46 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    47 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    48 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    49 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    50 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    51 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    52 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    53 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    54 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    55 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    56 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    57 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    58 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    59 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    60 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    61 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    62 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    63 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    64 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    65 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    66 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    67 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    68 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    69 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    70 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    71 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    72 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    73 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    74 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    75 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    76 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    77 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    78 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    79 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    80 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    81 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    82 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    83 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    84 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    85 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    86 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    87 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    88 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    89 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    90 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    91 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    92 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    93 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    94 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    95 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    96 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    97 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    98 =>  ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"],
    99 =>  ["GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN"],
    100 => ["IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB", "IN", "IN", "GB", "GB"]
  }
}

(1..100).each do |set|
  FileUtils.mkdir_p("sets/#{set}")

  (1..20).each do |image|
    if sets["level"][set][image-1] == 0
      filename = "0.jpg"
    else
      filename = "0_#{sets["noise"][set][image-1]}_#{sets["level"][set][image-1]}.jpg"
    end

    FileUtils.cp("includes/images/#{image}/#{filename}", "sets/#{set}/#{image}.jpg")
    FileUtils.mkdir_p("sets/#{set}/#{image}")

    FileUtils.cp("includes/images/#{image}/0.jpg", "sets/#{set}/#{image}/0.jpg")
    FileUtils.cp("includes/images/#{image}/1.jpg", "sets/#{set}/#{image}/1.jpg")
    FileUtils.cp("includes/images/#{image}/2.jpg", "sets/#{set}/#{image}/2.jpg")
    FileUtils.cp("includes/images/#{image}/3.jpg", "sets/#{set}/#{image}/3.jpg")
  end
end