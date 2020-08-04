$(function(){
   var fileNames="";
   $(".btn-search").click(function(e){
      searchPop();
   });
   
   $("#submit").click(function(){      
    sendRegData();
});
     function sendRegData(){
        let id = $("#id");
        let category = $(".content");
        console.log("sendRegData()");
        let cate=searchParam('cate');
         $.ajax({
              type: "POST",
              url : "/board/reg-data",
              data: {content:$(".content").html(),title:$(".reg-title").text(),
                 cate:searchParam('cate')},
              dataType:"json",
              async:"true",
              success: function(data) {
                 console.log("success");
                 console.log(data);
                 let url = `/board/detail?cate=${cate}&id=${data}`;
                 console.log(url);
                 location.replace(url);
              }
              })
         };

         
         $("input[type=file]").bind("input",function(){
             var fileInput = $("input[type=file]");
             var files = fileInput[0].files;
             var forms = $("#forms")[0];
             console.log(forms);
             var formData = new FormData(forms);

             formData.append("file",$("#images")[0].files[0]);
             console.log(formData);
             $.ajax({
                type: "POST",
                url: '/uploadImgs',
                datytype:"json",
                data:formData,
                success:function(data){
                   console.log(data);
                   let texts = $(".content").html();
                   $(".content").empty();
                   setTimeout(function(){
                      for(var i =0; i< data.length;i++){
                         var temp=data[i];
                      $(".content").append(`<img width="300px" height="200px" src="/upload/${temp}"> <br>`);
                      }},5000);
// $(".content").append(texts+`<img width="300px" height="200px"
// src="/upload/${data[i]}"> <br>`)},500);
             },
             
// $(".content").append('<div class="insertTitle">추억이 담긴 사진!</div><br><br>
// <br>');
// for(var i=0; i<data.length;i++){
// let texts = $(".content").html();
// $(".content").empty();
// function getImage(texts){
// console.log(texts);
// $(".content").append(texts)
// }
// setTimeout(getImage(texts),7000);
                  processData: false, 
                  contentType: false
                 });
          });
    
   function searchPop(){
       $.ajax({
        type: "POST",
        url : "/board/reg-search",
        data: {content:$(".reg-search-box").text()},     
        async:"true",
        success: function(list) {
           console.log(list.regSearch);
           if(list.regSearch[0] == null){
              alert("검색된 결과가 없습니다! 다시 입력하숑");
           }
           else{
              $("body").append(`
                     <div class="popup">
                          <div class="popup-title">
                          <div><span>'${$(".reg-search-box").text()}'(으)로 검색한 결과</span>   <i class="fas fa-times close"></i> </div>  
                          <ul class="popup-list-title">
                          
                          </ul> 
                          </div>
                     </div>
                     `);
              for(var i = 0; i<list.regSearch.length; i++){
                 var searched = list.regSearch[i];
                    $(".popup-list-title").append(`
                          <li class="popup-li"><div> 이름: <span>${searched.name}</span></div>
                             <div>주소: ${searched.address}</div>
                           </li>
                    `);
              }
              $(".close").click(function(){
                 $(".popup").remove();
              });
              $(".popup-li").click(function(e){
                 console.log(e.target.innerText);
                  $.ajax({
                  type: "POST",
                  url : "/board/reg-popup",
                  data: {content:e.target.innerText},     
                  async:"true",
                  success: function(popupdata) {
                     console.log(popupdata);
                     $(".popup").remove();
                     
                     $(".content").prepend(`
                              <div class="searched-list" >
                 <a href="/camp/detail?id=${popupdata[0].id}">
                 <img src="/images/${popupdata[0].img1}" width="400px" height="300px" /></a> 
                    <div class="searched-content">
                    <a href="/camp/detail?id=${popupdata[0].id}">
                    <div>* 이름 : ${popupdata[0].name}</div></a>     
                    <div>* 주소 : ${popupdata[0].address} </div>
                    <div>* 가격 : ${popupdata[0].price} </div>
                        </div>
                       </div>
                     <hr> <br><br><br>
                     `)
                  }
                  })
                 
              });
              
           }
        }
        })
   }



});

function searchParam(key) {
    return new URLSearchParams(location.search).get(key);
  };

document.execCommand('styleWithCSS', false, true);
document.execCommand('insertBrOnReturn', false, true);
$("#fontSize").change(function(){
    document.execCommand('fontSize', false, $(this).val());
 });