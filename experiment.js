var sets = {
  level: {
    1:  [0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0],
    2:  [1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1],
    3:  [2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2],
    4:  [3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3],
    5:  [4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3, 4],
    6:  [4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3, 4],
    7:  [3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2, 3],
    8:  [2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1, 2],
    9:  [1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 1],
    10: [0, 1, 2, 3, 4, 4, 3, 2, 1, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1, 0]
  },
  noise: {
    1:  ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    2:  ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    3:  ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    4:  ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    5:  ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    6:  ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    7:  ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    8:  ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    9:  ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    10: ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    11: ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    12: ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    13: ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    14: ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    15: ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    16: ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    17: ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    18: ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"],
    19: ["IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB"],
    20: ["GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM", "GB", "GB", "IM", "IM"]
  }
}

window.set_number  = 1;
window.step = 1;
window.csv  = 'Набор,Номер изображения,Ответ';

$(".set_button").on('click', function(e) {
  $(".new").addClass("hide");
  $(".intro").removeClass("hide");
  window.set_number = $(".set_number").val();
  e.preventDefault();
});

$(".start_button").on('click', function(e) {
  $(".intro").addClass("hide");
  next_step();
  e.preventDefault();
});

$(document).on('click', ".answer img", function(e) {
  // Задерживаем его
  alert("Спасибо! Нажмите ОК для следующего вопроса.");

  // Выбранный ответ
  chosen_answer = $(this).attr("data-number");
  window.csv += "\n" + window.set_number + "," + window.step + "," + chosen_answer

  // Следующий шаг
  $(".answer").addClass("hide");
  window.step += 1;
  next_step();

  e.preventDefault();
});

$(".download_button").on("click", function(e) {
  var blob = new Blob([window.csv], {type: "text/plain;charset=utf-8"});
  saveAs(blob, "result_" + window.set_number + ".txt");
});

$(".reload_button").on('click', function(e) {
  window.set_number  = 1;
  window.step = 1;
  window.csv  = 'Набор,Номер изображения,Шум,Степень,Ответ';

  $(".thankyou").addClass("hide");
  $(".new").removeClass("hide");
  e.preventDefault();
});

function next_step() {
  if(window.step < 5) {
    // Preparation
    $(".question img").attr("src", "images/" + window.step + "/0_" + + "_" + 0.jpg");
    $(".answer img").each(function(index) {
      $(this).attr("src", "images/" + window.step + "/" + index + ".jpg");
      $(this).attr("data-number", index);
    });

    $(".question").removeClass("hide");

    // Original
    setTimeout(function() {
      $(".question").addClass("hide");
      $(".relax").removeClass("hide");
    }, 1500);

    // Relax
    setTimeout(function() {
      $(".relax").addClass("hide");
      $(".answer").randomize().removeClass("hide");
    }, 5000);
  } else {
    $(".thankyou").removeClass("hide");
  }
}

$.fn.randomize = function(selector){
  var $elems = selector ? $(this).find(selector) : $(this).children(),
    $parents = $elems.parent();

  $parents.each(function(){
    $(this).children(selector).sort(function(){
      return Math.round(Math.random()) - 0.5;
    }).remove().appendTo(this);
  });

  return this;
};