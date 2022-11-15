function show_result(data){
    var result = document.getElementById("res");
    if (data.type == 'Error') {
        alert(data.value)
    } else {
        result.innerHTML = '<h1>Массив до изменения:</h1>'
        result.innerHTML += '<p>' + data.value[0] + '</p>'
        result.innerHTML += '<h1>Массив после изменения:</h1>'
        result.innerHTML += '<p>' + data.value[1] + '</p>'

    }
    
    var arr_field = document.getElementById('arr')
    arr_field.value = ''
    }
  $(document).ready(function(){
    $("#form").bind("ajax:success", function(xhr, data, status)
    {
        show_result(data)
    })
  })