$('#search___result').on('click', '#search_place_add', function(event) {
    event.stopPropagation();
    $('#place_add').css('width', '817px');
    $('#cover').css('display', 'block');
    $('.content').css('overflow', 'hidden');
})

$(document).on('click', function(event) {
    if (!$(event.target).closest('#place_add').length) {
        $('#place_add').css('width', '0');
        $('#cover').css('display', 'none');
        $('.content').css('overflow', '');
    }
});

$('#cancle').on('click', function(event) {
    event.stopPropagation();
    $('#place_add').css('width', '0');
    $('#cover').css('display', 'none');
    $('.content').css('overflow', '');
});

$('#explanation_p').on('keyup', function() {
    let count = $('#explanation_p').val().length;

    if (count >= 1000) {
        $('#explanation_p').val($('#explanation_p').val().substring(0,1000));
        $('#count').css('color', 'red').text('1000/1000');
    } else {
        $('#count').text(count + '/1000');
    }
    
});

$('.img').on('click', function() {
    $('.img').attr('class', 'img');
    $(this).addClass('clicked');
    $('.img').not(this).addClass('notClicked');

    $('img').attr('id', '');
    $('.clicked img').attr('id', 'clicked');
})

$('#basic').on('click', function() {
    $('.img').css('display', '');
    $('#computer').css('border-bottom', '');
    $('#basic').css('border-bottom', '');
    $('#img_content1').css('display', '');
    $('#img_content2').css('display', '');
})

$('#computer').on('click', function() {
    $('.img').css('display', 'none').removeClass('notClicked clicked');
    $('.img img').removeAttr('id', 'clicked');
    $('#computer').css('border-bottom', '1.5px solid #000');
    $('#basic').css('border-bottom', 'none');
    $('#img_content1').css('display', 'none');
    $('#img_content2').css('display', 'block');
})

$('#random').on('click', function() {
    if ($('#random').is(':checked')) {
        $('#img_choice_tr').css('display', '');
    }
})

$('#choice').on('click', function() {
    if ($('#choice').is(':checked')) {
        $('#img_choice_tr').css('display', 'contents');
    }
})

$('#search___').on('click', '.search_result', function() {
    $('#place_name').val($(this).text().trim());
    $('#place_name').attr('name', 'choice');
    $('#search___result').html('');
});

$('#computer').on('click', function() {
    $('#random').val('');
    $('#choice').val('');
});

$('#explanation_e').on('keyup', function() {
    let count = $('#explanation_e').val().length;

    if (count >= 1000) {
        $('#explanation_e').val($('#explanation_e').val().substring(0,1000));
        $('#count_else').css('color', 'red').text('1000/1000');
    } else {
        $('#count_else').css('color', 'white').text(count + '/1000');
    }
});

$('#img_content2').on("dragover", dragOver)
                  .on("dragleave", dragOver)
                  .on("drop", uploadFiles);

function dragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    if (e.type == "dragover") {
        $("#img_content2").css({
            "background-color": "#bebebe",
        });
    } else {
        $('#img_content2').css({
            "background-color": "white",
        });
    }
}

function uploadFiles(e) {
    e.stopPropagation();
    e.preventDefault();
    dragOver(e);

    var files = e.originalEvent.dataTransfer.files;

    if (files.length > 1) {
        alert('파일은 하나만 업로드해주세요.');
        return;
    }

    if (!files[0].type.match(/image.*/)) {
        alert('이미지가 아닙니다.');
        return;
    }

    var formData = new FormData();
    formData.append("userImg", files[0]);

    $.ajax({
        url: 'InsertUserBgi.ub', // 이미지 업로드를 처리할 서버 측 엔드포인트
        type: 'POST',
        data: formData,
        processData: false,
        contentType: false,
        success: function(response) {
            if (response > 0) {
                $('#image_section_div').html('<img id="image_section" src="" alt="your image">');
                $('#image_section').attr('src', window.URL.createObjectURL(files[0]));
                $('#choice').val(response);
    
                $('#img_content2').css({
                    height: 'auto',
                    padding: '10px 0' 
                });
            } else {
                alert('이미지 업로드에 실패하였습니다.');
            }
            
        },
        error: function() {
            alert('이미지 업로드에 실패하였습니다.');
        }
    });
}

$('#add_done_plan').on('click', function() {
    if ($('#plan_title').val() === '') {
        event.preventDefault();
        alert('여행명을 입력해주세요.')
    } else if ($('#place_name').val() === '') {
        event.preventDefault();
        alert('여행지를 입력해주세요.')
    } else if ($('#sDate').val() === '' || $('#eDate').val() === '') {
        event.preventDefault();
        alert('여행 일정을 입력해주세요.');
    }
});

