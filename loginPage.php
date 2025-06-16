<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/loginPage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Afacad+Flux:wght@100..1000&family=Afacad:ital,wght@0,400..700;1,400..700&family=Bebas+Neue&family=Gabarito:wght@400..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Luxora</title>      
    <link rel="icon" href="images/logos/logo.png" type="image/png">
</head>
<body>
    <section id="hero">
        <div class="banner">
        <h1>LUXORA</h1>
        <img src="login/banner.png" class="loginBanner"> 
        </div>
    <div class="container" id="signUp" style="display:none;">
        <h1 class="form-title">Register</h1>
        <h2>Create new account to start shopping!</h2>
       <form method="post" action="register.php">
            <div class="nameForm">
                <div class="input-group">
                    <input class="fName" type="text" name="fName" id="fName" placeholder="Enter your first name" autocomplete="off" required>
                </div>
                <div class="input-group">
                    <input class="lName" type="text" name="lName" id="lName" placeholder="Enter your last name" autocomplete="off" required>
                </div>
            </div>
            <div class="input-group">
                <input type="number" name="phoneNum" id="phoneNum" placeholder="Enter your phone number" autocomplete="off" required>
            </div>
            <div class="addressGender">
                <div class="input-group">
                    <textarea id="address" name="address" placeholder="Enter your address" autocomplete="off"></textarea>
                </div>
                <div class="input-group">
                   <select name="gender" class="genderCat "id="genderCat" required>
                    <option class="unselected" value="">Choose your gender</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                   </select>
                </div>
            </div>
           
            <div class="input-group">
                <input type="email" name="email" id="email" placeholder="Enter your email" autocomplete="off" required>
            </div>
            <div class="input-group">
                <input type="password" name="password" id="password" placeholder="Enter your password" autocomplete="off" required>
            </div>
            
            
            <input type="submit" class="btn" value="Sign Up" name="signUp">
       </form>
        <div class="links">
            <div>
                <p>Already have an account?</p>
                <button id="signInButton">Sign In</button>
            </div>
            <div>
                <p>Are you a seller?</p>
                <button id="signUpSellerButton">Change to seller</button>
            </div>
            </div>
    </div>
    <div class="container" id="signIn">
        <h1>Sign In</h1>
        <h2>Sign in now to explore the new product you need!</h2>
        <form method="post" action="register.php">
            <div class="input-group"> 
                <input type="email" name="email" id="email" placeholder="Enter your email" autocomplete="off" required> 
            </div>
            <div class="input-group">
                <input type="password" name="password" id="password" placeholder="Enter your password" autocomplete="off" required>
            </div>
            <input type="submit" class="btn" value="Sign In" name="signIn">
        </form>
        <div class="links">
            <div class="have">
                <p>Dont have an account?</p>
                <button id="signUpButton">Sign Up</button>
            </div>
            <div>
                <p>Are you a seller?</p>
                <button id="signInSellerButton">Change to seller</button>
            </div>
           
         </div>
    </div>
    <div class="container" id="signUpSeller" style="display:none;">
            <h1 class="form-title">Register</h1>
            <h2>Create new store account to start selling items!</h2>
           <form method="post" action="register.php">

                <div class="input-group">
                    <input type="text" name="sName" id="sName" placeholder="Enter store name" autocomplete="off" required>
                </div>
                <div class="input-group">
                    <input type="number" name="sPhone" id="sPhone" placeholder="Enter store phone number" autocomplete="off" required>
                </div>
                <div class="input-group">
                    <textarea id="sAddress" name="sAddress" placeholder="Enter store address" autocomplete="off"></textarea>
                </div>
                <div class="input-group">
                    <input type="email" name="sEmail" id="sEmail" placeholder="Enter store email" autocomplete="off" required>
                </div>
                <div class="input-group">
                    <input type="password" name="sPassword" id="sPassword" placeholder="Enter store password" autocomplete="off" required>
                </div>
                
                <input type="submit" class="btn" value="Sign Up" name="signUpSeller">
            </form>
            <div class="links">
                <div>
                    <p>Already have an account?</p>
                    <button id="signInSellerButton2">Sign In</button>
                </div>
                <div>
                    <p>Are you looking for product?</p>
                    <button id="signUpBuyer">Change to buyer</button>
                </div>
            </div>
        </div>
    <div class="container" id="signInSeller" style="display:none;">
            <h1>Sign In</h1>
            <h2>Sign in to your store account!</h2>
            <form method="post" action="register.php">
                <div class="input-group"> 
                    <input type="email" name="sEmail" id="sEmail" placeholder="Enter your email" autocomplete="off" required> 
                </div>
                <div class="input-group">
                    <input type="password" name="sPassword" id="sPassword" placeholder="Enter your password" autocomplete="off" required>
                </div>
                <input type="submit" class="btn" value="Sign In" name="signInSeller">
            </form>
            <div class="links">
                <div class="have">
                    <p>Dont have an account?</p>
                    <button id="signUpSellerButton2">Sign Up</button>
                </div>
                <div>
                    <p>Are you looking for product?</p>
                    <button id="signInBuyer">Change to buyer</button>
                </div>
               
            </div>
    </div>
    </section>
    
    

    <script src="js/script.js"></script>
</body>
</html>