$(function(){
  function buildFileField(num){
       let html = `<div data-index="${num}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="product[images_attributes][${num}][src]"
                    id="product_images_attributes_${num}_src"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
      return html;
  }
  var dataBox = new DataTransfer();
  var file_field = document.querySelector('input[type=file]')
  $('#img-file').change(function(){
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      var fileReader = new FileReader();

      dataBox.items.add(file)
      file_field.files = dataBox.files

      var num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);
      if (num == 10){
        $('#image-box__container').css('display', 'none')   
      }
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html=`<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__area'>
                      <div class=' item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src} width="100" height="75" >
                        </div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>
                    </div>
                  </div>`
        $('#image-box__container').before(html);
      };
      $('#image-box__container').attr('class', `item-num-${num}`)
    });
    // let html = buildFileField(num)
  });

  $(document).on("click", '.item-image__operetion--delete', function(){
    //削除を押されたプレビュー要素を取得
    var target_image = $(this).parent().parent()
    //削除を押されたプレビューimageのfile名を取得
    var target_name = $(target_image).data('image')
    //プレビューがひとつだけの場合、file_fieldをクリア
    if(file_field.files.length==1){
      //inputタグに入ったファイルを削除
      $('input[type=file]').val(null)
      dataBox.clearData();
      console.log(dataBox)
    }else{
      //プレビューが複数の場合
      $.each(file_field.files, function(i,input){
        //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
        if(input.name==target_name){
          dataBox.items.remove(i) 
        }
      })
      //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
      file_field.files = dataBox.files
    }
    //プレビューを削除
    target_image.remove()
    //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
    var num = $('.item-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `item-num-${num}`)
  })
  var dropArea = document.getElementById("image-box-1");

  //loadイベント発生時に発火するイベント
  window.onload = function(e){
    //ドラッグした要素がドロップターゲットの上にある時にイベントが発火
    dropArea.addEventListener("dragover", function(e){
      e.preventDefault();
      //ドロップエリアに影がつく
      $(this).children('#image-box__container').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
    },false);
    //ドラッグした要素がドロップターゲットから離れた時に発火するイベント
    dropArea.addEventListener("dragleave", function(e){
      e.preventDefault();
   //ドロップエリアの影が消える
      $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})      
    },false);
    //ドラッグした要素をドロップした時に発火するイベント
    dropArea.addEventListener("drop", function(e) {
      e.preventDefault();
      $(this).children('#image-box__container').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
      var files = e.dataTransfer.files;
      //ドラッグアンドドロップで取得したデータについて、プレビューを表示
      $.each(files, function(i,file){
        //アップロードされた画像を元に新しくfilereaderオブジェクトを生成
        var fileReader = new FileReader();
        //dataTransferオブジェクトに値を追加
        dataBox.items.add(file)
        file_field.files = dataBox.files
        //lengthで要素の数を取得
        var num = $('.item-image').length + i + 1
        //指定されたファイルを読み込む
        fileReader.readAsDataURL(file);
        // 10枚プレビューを出したらドロップボックスが消える
        if (num==10){
          $('#image-box__container').css('display', 'none')   
        }
        //image fileがロードされた時に発火するイベント
        fileReader.onload = function() {
          //変数srcにresultで取得したfileの内容を代入
          var src = fileReader.result
          var html =`<div class='item-image' data-image="${file.name}">
                      <div class=' item-image__area'>
                        <div class=' item-image__content'>
                          <div class='item-image__content--icon'>
                            <img src=${src} width="100" height="75" >
                          </div>
                        </div>
                        <div class='item-image__operetion'>
                          <div class='item-image__operetion--delete'>削除</div>
                        </div>
                      </div>
                    </div>`
        //image-box__containerの前にhtmlオブジェクトを追加
        $('#image-box__container').before(html);
        };
        //image-box__containerにitem-num-(変数)という名前のクラスを追加する
        $('#image-box__container').attr('class', `item-num-${num}`)
      })
    })
  }
});

$(function(){
  $('#item_price').on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#item_price').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.right_bar').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.right_bar').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.right_bar_2').html(profit)
    $('.right_bar_2').prepend('¥')
    $('#price').val(profit) // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(profit == '') {   // もし､計算結果が''なら表示も消す｡
    $('.right_bar_2').html('');
    $('.right_bar').html('');
    }
  })
})
