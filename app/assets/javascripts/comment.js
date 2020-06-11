$(document).on('turbolinks:load', function(){
// $(function(){
  function buildHTML(comment){
    let html = `<div class="lists_comment__list">
                <p class="name">${comment.user_name}</p>
                <p class="comment">${comment.comment}
                <a class="comment-delete-btn" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.id}">削除
                </a></p>
                </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.lists_comment').append(html);
      $('#comment_comment').val('');
      $('.comment-btn').prop('disabled', false);
      $('.comment-btn').removeAttr("data-disable-with");
    })
    .fail(function(){
      alert('error');
    })
  });
});