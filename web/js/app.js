/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


// *** carousel ***
$('.carousel').carousel({
    interval: 5000
});
$('.carousel-control.left').click(function () {
    $('#myCarousel').carousel('prev');
});
$('.carousel-control.right').click(function () {
    $('#myCarousel').carousel('next');
});

$('.ribbon').click(function () {
    var productID = $(this).attr('id');
     $.get('UpdateProductStatusServlet', {id: productID}, function (responseText) {
        var div_id = '#' + productID;
                                $(div_id).html(responseText);         
                        });


    //alert(productID);
    /*$.ajax({
     type: "POST",
     url: "UpdateProductStatusServlet",
     data: [
     id = productID
     ],
     dataType: "json",
     //if received a response from the server
     success: function (data, textStatus, jqXHR) {
     //our country code was correct so we have some information to display
     if (data.success) {
     $("#ajaxResponse").html("");
     if(data.productObj.isProductStatus()){
     status = "Sold";
     }
     $("#ajaxResponse").append("<span class='content'>" + s + "</span>");
     
     }
     //display error message
     else {
     $("#ajaxResponse").html("<div><b>Country code in Invalid!</b></div>");
     }
     },
     //If there was no resonse from the server
     error: function (jqXHR, textStatus, errorThrown) {
     console.log("Something really bad happened " + textStatus);
     $("#ajaxResponse").html(jqXHR.responseText);
     }
     /*
     //capture the request before it was sent to server
     beforeSend: function (jqXHR, settings) {
     //adding some Dummy data to the request
     settings.data += "&dummyData=whatever";
     //disable the button until we get the response
     $('#myButton').attr("disabled", true);
     },
     //this is called after the response or error functions are finsihed
     //so that we can take some action
     complete: function (jqXHR, textStatus) {
     //enable the button 
     $('#myButton').attr("disabled", false);
     }*/
    //});
});

$('.report').click(function () {
    var productID = $(this).attr('id');
     $.get('UpdateReportStatusServlet', {id: productID, service: "report"}, function (responseText) {
        var div_id = '#' + productID;
                                $(div_id).html(responseText);         
                        });
});

