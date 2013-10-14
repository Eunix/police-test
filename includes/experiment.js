window.set_number  = 1;
window.step = 1;
window.csv  = 'Набор,Номер изображения,Шум,Степень,Ответ';

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
  window.csv += "\n" + window.set_number + "," + window.step + "," + current_noise() + "," + current_level() + "," + chosen_answer

  // Следующий шаг
  $(".answer").addClass("hide");
  window.step += 1;
  next_step();

  e.preventDefault();
});

$(".download_button").on("click", function(e) {
  var blob = new Blob([window.csv], {type: "text/plain;charset=utf-8"});
  saveAs(blob, "result_" + window.set_number + ".txt");
  $(".reload_button").removeClass("hide");
});

$(".reload_button").on('click', function(e) {
  window.set_number  = 1;
  window.step = 1;
  window.csv  = 'Набор,Номер изображения,Шум,Степень,Ответ';

  $(".thankyou").addClass("hide");
  $(".new").removeClass("hide");
  $(".reload_button").addClass("hide");
  e.preventDefault();
});

function next_step() {
  if(window.step < 21) {
    // Preparation
    if(current_level() == 0) {
      $(".question img").attr("src", "includes/images/" + window.step + "/0.jpg");
    } else {
      $(".question img").attr("src", "includes/images/" + window.step + "/0_" + current_noise() + "_" + current_level() + ".jpg");
    }
    $(".answer img").each(function(index) {
      $(this).attr("src", "includes/images/" + window.step + "/" + index + ".jpg");
      $(this).attr("data-number", index);
    });
    $(".relax img").attr("src", "includes/gifs/" + window.step + ".gif");

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

function current_noise() {
  return sets["noise"][window.set_number][(window.step - 1)];
}

function current_level() {
  return sets["level"][window.set_number][(window.step - 1)];
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