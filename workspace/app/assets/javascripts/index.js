$(document).ready(function(){
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
