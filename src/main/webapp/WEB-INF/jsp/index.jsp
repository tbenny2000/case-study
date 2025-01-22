<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <jsp:include page="include/header.jsp"/>
</head>

<!-- HERO SECTION -->
<section class="bg-dark text-white py-5"
         style="background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url('/pub/images/soccer-hero.jpg') center/cover;">
    <div class="container py-5">
        <div class="row py-5">
            <div class="col-lg-8">
                <h1 class="display-4 fw-bold mb-4">Welcome to Ben's Soccer Store</h1>
                <p class="lead mb-4">Your one-stop shop for premium soccer gear and equipment</p>
                <a href="/product/search" class="btn btn-primary btn-lg">Shop Now</a>
            </div>
        </div>
    </div>
</section>

<!-- FEATURED CATEGORIES -->
<section class="py-5">
    <div class="container">
        <h2 class="text-center mb-5">Shop by Category</h2>
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="/pub/images/puma-ultra-ultimate-fg.jpg" class="card-img-top" alt="Soccer Cleats">
                    <div class="card-body text-center">
                        <h5 class="card-title">Soccer Cleats</h5>
                        <p class="card-text">Find your perfect fit with our selection of professional cleats</p>
                        <a href="/product/search?category=cleats" class="btn btn-primary">View Cleats</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="/pub/images/arsenal-tiro-trining-jersey.jpg" class="card-img-top" alt="Team Jerseys">
                    <div class="card-body text-center">
                        <h5 class="card-title">Team Jerseys</h5>
                        <p class="card-text">Support your favorite team with official jerseys</p>
                        <a href="/product/search?category=jerseys" class="btn btn-primary">View Jerseys</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card h-100 border-0 shadow-sm">
                    <img src="/pub/images/adidas-predatortraining-ball.jpg" class="card-img-top" alt="Soccer Balls">
                    <div class="card-body text-center">
                        <h5 class="card-title">Soccer Balls</h5>
                        <p class="card-text">Quality balls for training and matches</p>
                        <a href="/product/search?category=balls" class="btn btn-primary">View Balls</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- SPECIAL OFFERS -->
<section class="bg-light py-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6">
                <h2 class="mb-4">Special Offers</h2>
                <p class="lead mb-4">Don't miss out on our current deals!</p>
                <ul class="list-unstyled">
                    <li class="mb-3">Free shipping on orders over $100</li>
                    <li class="mb-3">Student discounts available</li>
                    <li class="mb-3">Price match guarantee</li>
                </ul>
                <a href="/product/search?sale=true" class="btn btn-primary">View Deals</a>
            </div>
            <div class="col-lg-6">
                <img src="/pub/images/placeholder/600/400" alt="Special Offers" class="img-fluid rounded shadow">
            </div>
        </div>
    </div>
</section>

<!-- FEATURES -->
<section class="py-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <div class="text-center p-4">
                    <h5>Fast Shipping</h5>
                    <p>Free delivery on orders over $100</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="text-center p-4">
                    <h5>Secure Payment</h5>
                    <p class="text-muted mb-0">100% secure payment</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="text-center p-4">
                    <h5>Easy Returns</h5>
                    <p class="text-muted mb-0">30-day return policy</p>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="text-center p-4">
                    <h5>24/7 Support</h5>
                    <p class="text-muted mb-0">Dedicated support team</p>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp"/>