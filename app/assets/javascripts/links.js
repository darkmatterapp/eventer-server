jQuery(document).ready(function($) {

  function toggleLinkMeta(event) {
    var url = $(event.target).val();
    var tweet_url_regex = /^(http(s)?:\/\/)?(mobile\.)?twitter\.com\/[\w\d_]+\/status\/\d+$/

    if (url.match(tweet_url_regex)) {
      $("#link-meta").hide();
    } else {
      $("#link-meta").show();
    }
  }

  $("#link_url").on("keyup change", toggleLinkMeta);

});
