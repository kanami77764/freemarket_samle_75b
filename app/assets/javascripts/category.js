$(document).on('turbolinks:load', function(){
  $(function(){
    //オプション設定
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    //子カテゴリー表示（items/new.html.hamlのカテゴリー選択部分を編集した場合は要確認）
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='status_register__status_category_groupl__category__choose__added' id= 'children_wrapper'>
                          <div class='status_register__status_category_group__category__choose1'>
                            <i class='fas fa-chevron-down status_register__status_category_group__category__choose--arrow-down'></i>
                            <select class="status_register__status_category_group__category__choose--select" id="child_category" name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.status_register__status_category_group__category__choose').append(childSelectHtml);
    }
    //孫カテゴリー表示（items/new.html.hamlのカテゴリー選択部分を編集した場合は要確認）
    function appendGrandchidrenBox(insertHTML){
      var grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='status_register__status_category_group__category__choose__added' id= 'grandchildren_wrapper'>
                                <div class='status_register__status_category_group__category__choose2'>
                                  <i class='fas fa-chevron-down status_register__status_category_group__category__choose--arrow-down'></i>
                                  <select class="status_register__status_category_group__category__choose__box--select" id="grandchild_category" name="item[category_id]">
                                    <option value="---" data-category="---">---</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.status_register__status_category_group__category__choose').append(grandchildSelectHtml);
    }
    //親カテゴリー選択後イベント発火
    $('#parent_category').on('change', function(){
      //選択された親カテゴリーのidを取得
      var parent_category_id = document.getElementById
      ('parent_category').value;
      $.ajax({
        url: '/items/category/get_category_children',
        type: 'GET',
        data: { parent_id: parent_category_id },
        dataType: 'json'
      })
      .done(function(children){
        //親カテゴリが変更された時に子・孫カテゴリを削除する
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        //商品編集時、親カテゴリが変更された時に子・孫カテゴリを削除する
        $('#child_icon').remove();
        $('#child_category').remove();
        $('#grandchild_icon').remove();
        $('#grandchild_category').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      //エラー警告
      .fail(function(){
        alert('再度カテゴリーを選択してください');
      })
    });
    //子カテゴリー選択後イベント発火
    $('.status_register__status_category_group__category').on('change', '#child_category', function(){
      //選択された子カテゴリーのidを取得
      var child_category_id = $('#child_category option:selected').data('category');
      $.ajax({
        url: '/items/category/get_category_grandchildren',
        type: 'GET',
        data: { child_id: child_category_id },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          //子カテゴリが変更された時に孫カテゴリを削除する
          $('#grandchildren_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      //エラー警告
      .fail(function(){
        alert('再度カテゴリーを選択してください');
      })
    });
  });
});