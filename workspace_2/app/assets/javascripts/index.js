$(document).ready(function(){
   var display=$('.option-display');
   $('.welcome').addClass('show');
   $('.fail-screen').addClass('failed');
   $('#main-filter').on('change',function(){
      window.location.href = this.value;
   });
   $('#second-filter').on('change',function(){
      window.location.href = "all?search=" + $('#search-term').val() + "&filter=" + $(this).val();
   });
   
   var text_height=($('.story').height()) - 575;
   
   $('.story-text').scroll(function(){
      var scroll_dist=$('.story-text').scrollTop();
      $('.track').css("width",(scroll_dist/text_height).toFixed(3)*100+"%");
   });
   
   $('.member-nav-btn').mouseover(function(){
      if($(this).hasClass('mem-story')){
      $('.option-display').text("Read Member-Submitted Stories");
      display.addClass('fade');
      }
      else if($(this).hasClass('mem-write')){
         $('.option-display').text("Write Your Own Story");
         display.addClass('fade');
      }
   });
   $('.member-nav-btn').mouseout(function(){
      $('.option-display').text("");
      display.removeClass('fade');
   });
       $(document).bind('page:load page:change', function(){
       $('.welcome').addClass('show');
       $('.fail-screen').addClass('failed');
      $('#main-filter').on('change',function(){
         window.location.href = this.value;
      });
      
   $('#second-filter').on('change',function(){
      window.location.href = "all?search=" + $('#search-term').val() + "&filter=" + $(this).val();
   });
   
      var text_height=($('.story').height()) - 575;
   
       $('.story-text').scroll(function(){
      var scroll_dist=$('.story-text').scrollTop();
      $('.track').css("width",(scroll_dist/text_height).toFixed(3)*100+"%");
   });
   
      
   });
      
   });
