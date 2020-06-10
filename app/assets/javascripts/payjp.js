document.addEventListener("DOMContentLoaded", function() {
  $(document).on('turbolinks:load', function(){
    Payjp.setPublicKey("pk_test_f81d9627d751a61e9d54d83c"); //ここに公開鍵を直書き
      
    $("#token_submit").on("click", function(e){
      e.preventDefault();

      let card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      }; //入力されたデータを取得します。
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { //成功した場合
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //取得したトークンを送信できる状態にします
          document.inputForm.submit();
          alert("登録が完了しました"); //確認用
        } else {
          alert("カード情報が正しくありません。"); //確認用
        }
      });
    });
  });
});