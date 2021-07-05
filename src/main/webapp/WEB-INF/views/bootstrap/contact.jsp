
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Foodies - Restaurant Category Responsive Web Template - Contact</title>
    <!-- google-fonts -->
    <link href="//fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
        rel="stylesheet">
    <!-- //google-fonts -->
    <!-- Template CSS Style link -->
    <link rel="stylesheet" href="asset/css/style-liberty.css">
</head>

<body>
    
    <!-- inner banner -->
    <div class="inner-banner">
        <section class="w3l-breadcrumb">
            <div class="container">
                <h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Contact Us</h4>
                <ul class="breadcrumbs-custom-path">
                    <li><a href="index.html">Home</a></li>
                    <li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span> Contact Us</li>
                </ul>
            </div>
        </section>
    </div>
    <!-- //inner banner -->
    <!-- contact -->
    <section class="w3l-contact-info-main" id="contact">
        <div class="contact-sec py-5">
            <div class="container py-md-4 py-3">
                <div class="contact-w3pvt-form">
                    <h3 class="title-big mb-5">Get In Touch</h3>
                    <form method="post" class="w3layouts-contact-fm" action="https://sendmail.w3layouts.com/submitForm">
                        <div class="row main-cont-sec">
                            <div class="col-md-6 left-cont-contact">
                                <div class="form-group">
                                    <label for="w3lName">First Name</label>
                                    <input class="form-control" type="text" name="w3lName" id="w3lName" placeholder=""
                                        required="">
                                </div>
                                <div class="form-group">
                                    <label for="w3lName">Last Name</label>
                                    <input class="form-control" type="text" name="w3lName" id="w3lName" placeholder=""
                                        required="">
                                </div>
                                <div class="form-group">
                                    <label for="w3lSender">Email</label>
                                    <input class="form-control" type="email" name="w3lSender" id="w3lSender"
                                        placeholder="" required="">
                                </div>
                            </div>
                            <div class="col-md-6 right-cont-contact mt-md-0 mt-1">
                                <div class="form-group">
                                    <label for="w3lSubject">Write Message</label>
                                    <textarea class="form-control" name="w3lMessage" id="w3lMessage" placeholder=""
                                        required=""></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group-2 mt-4">
                            <button type="submit" class="btn button-style d-flex ml-auto">Send Now</button>
                        </div>
                    </form>
                    <iframe class="map-w3layouts"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6509162.831475898!2d-123.79818215689443!3d37.19305185672543!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808fb9fe5f285e3d%3A0x8b5109a227086f55!2sCalifornia%2C+USA!5e0!3m2!1sen!2sin!4v1535716535953"
                        allowfullscreen></iframe>
                </div>
            </div>
        </div>
    </section>
    <!-- //contact -->
    <!-- section divide border style -->
    <div class="border-sec">

    </div>
    <!-- //section divide border style -->


    <!-- Js scripts -->
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fa fa-level-up" aria-hidden="true"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
    <!-- //move top -->

    <!-- common jquery plugin -->
    <script src="asset/js/jquery-3.3.1.min.js"></script>
    <!-- //common jquery plugin -->

    <!-- theme switch js (light and dark)-->
    <script src="asset/js/theme-change.js"></script>
    <script>
        function autoType(elementClass, typingSpeed) {
            var thhis = $(elementClass);
            thhis.css({
                "position": "relative",
                "display": "inline-block"
            });
            thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
            thhis = thhis.find(".text-js");
            var text = thhis.text().trim().split('');
            var amntOfChars = text.length;
            var newString = "";
            thhis.text("|");
            setTimeout(function () {
                thhis.css("opacity", 1);
                thhis.prev().removeAttr("style");
                thhis.text("");
                for (var i = 0; i < amntOfChars; i++) {
                    (function (i, char) {
                        setTimeout(function () {
                            newString += char;
                            thhis.text(newString);
                        }, i * typingSpeed);
                    })(i + 1, text[i]);
                }
            }, 1500);
        }

        $(document).ready(function () {
            // Now to start autoTyping just call the autoType function with the 
            // class of outer div
            // The second paramter is the speed between each letter is typed.   
            autoType(".type-js", 200);
        });
    </script>
    <!-- //theme switch js (light and dark)-->

    <!-- MENU-JS -->
    <script>
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function () {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });
    </script>
    <!-- //MENU-JS -->

    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function () {
            $('.navbar-toggler').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
    <!-- //disable body scroll which navbar is in active -->

    <!--bootstrap-->
    <script src="asset/js/bootstrap.min.js"></script>
    <!-- //bootstrap-->
    <!-- //Js scripts -->
</body>

</html>