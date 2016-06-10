<%-- 
    Document   : carousel
    Created on : May 17, 2016, 11:12:04 AM
    Author     : jesperlim
--%>

<!-- Header Carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="https://c1.staticflickr.com/5/4095/4804019724_0619c7dda7_b.jpg" style="width: 100%; height: 540px;" alt="...">
            <div class="carousel-caption">
                <h2>KTPH Panorama View</h2>
            </div>
        </div>
        <div class="item">
            <img src="https://www.ktph.com.sg/uploads/13438958580146.jpg" style="width: 100%; height: 540px;" alt="...">
            <div class="carousel-caption">
                <h2>Harnessing Technology</h2>
            </div>
        </div>
        <div class="item">
            <img src="http://cdn.mothership.sg/wp-content/uploads/2015/06/Khoo-Teck-Puat-Hospital.jpg" style="width: 100%; height: 540px;" alt="...">
            <div class="carousel-caption">
                <h2>KTPH Night</h2>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>