$(function(){
  function buildHTML(count) {
    var html = `<div class="preview-box" id="preview-box__${count}">
                  <div class="upper-box">
                    <img src="" alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="delete-box" id="delete_btn_${count}">
                      <span>削除</span>
                    </div>
                  </div>
                </div>`
    return html;
  }
  //商品編集ページへ遷移した際のアクション
  if (window.location.href.match(/\/items\/\d+\/edit/)){
    //登録済み画像のプレビューの表示
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
    $('.label-content').css('width', labelWidth);
    //プレビューにidを追加
    $('.preview-box').each(function(index, box){
      $(box).attr('id', `preview-box__${index}`);
    })
    //削除ボタンにidを追加
    $('.delete-box').each(function(index, box){
      $(box).attr('id', `delete_btn_${index}`);
    })
    var count = $('.preview-box').length;
    //プレビューが10枚あるときは投稿ボックスを消す
    if (count == 10) {
      $('.label-content').hide();
    }
  }
  // 投稿ボックスの横幅調整
  function setLabel() {
    var prevContent = $('.label-content').prev();
    labelWidth = (620 - $(prevContent).css('width'));
    $('.label-content').css('width', labelWidth);
  }
  // 画像をアップロードする際のアクション
  $(document).on('change', '.hidden-field', function() {
    setLabel();
    //hidden-fieldのidの数値を取得
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    //labelボックスのidとforを更新
    $('.label-box').attr({id: `label-box--${id}`,for: `item_item_imgs_attributes_${id}_url`});
    //選択したfileのオブジェクトを取得
    var file = this.files[0];
    var reader = new FileReader();
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      var image = this.result;
      //画像が元々なかった場合はhtmlを追加
      if ($(`#preview-box__${id}`).length == 0) {
        var count = $('.preview-box').length;
        var html = buildHTML(id);
        //投稿ボックスの直前に画像を追加
        var prevContent = $('.label-content').prev();
        $(prevContent).append(html);
      }
      //画像を追加
      $(`#preview-box__${id} img`).attr('src', `${image}`);
      var count = $('.preview-box').length;
      //画像が10個あったら投稿ボックスを隠す 
      if (count == 10) { 
        $('.label-content').hide();
      }
      //画像を削除したフィールドに削除用のチェックボックスがあった場合、チェックを外す
      if ($(`#item_item_imgs_attributes_${id}__destroy`)){
        $(`#item_item_imgs_attributes_${id}__destroy`).prop('checked',false);
      } 
      setLabel();
      //ラベルのidとforの値を変更
      if(count < 10){
        $('.label-box').attr({id: `label-box--${count}`,for: `item_item_imgs_attributes_${count}_url`});
      }
    }
  });
  // 画像の削除ボタンをクリックした際のアクション
  $(document).on('click', '.delete-box', function() {
    var count = $('.preview-box').length;
    setLabel(count);
    var id = $(this).attr('id').replace(/[^0-9]/g, '');
    $(`#preview-box__${id}`).remove();
    //削除用チェックボックスの有無を判定
    if ($(`#item_item_imgs_attributes_${id}__destroy`).length == 0) {
      //画像を削除 
      $(`#item_item_imgs_attributes_${id}_url`).val("");
      var count = $('.preview-box').length;
      //10個めが消されたら投稿ボックスを表示
      if (count == 9) {
        $('.label-content').show();
      }
      setLabel(count);
      if(id < 10){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_item_imgs_attributes_${id}_url`});
      }
    } else {
      //投稿編集時
      $(`#item_item_imgs_attributes_${id}__destroy`).prop('checked',true);
      //10個めが消されたら投稿ボックスを表示
      if (count == 9) {
        $('.label-content').show();
      }
      setLabel();
      //ラベルのidとforの値を変更
      if(id < 10){
        $('.label-box').attr({id: `label-box--${id}`,for: `item_item_imgs_attributes_${id}_url`});
      }
    }
  });
});

$(function load(){
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