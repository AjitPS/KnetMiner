/* 
 * Functions for logging into KnetSpace using the jBox libs
 * Author: hearnshawj
 */


var knetspace_address = 'http://babvs72.rothamsted.ac.uk:8000' // Update accordingly


function jboxNotice(content, colour, yPos) {
    new jBox('Notice', {
        content: content,
        color: colour,
        autoClose: 1000,
        position: {
            x: 0,
            y: yPos
        }
    });
}

function loginModalToggle() {
    $('#login_icon').click(function (e) {
        //e.preventDefault();
        var loginHtml = "<form class='form' method='post' action='#'>"
                + "<label>Username or Email</label>"
                + "<input type='text' name='demail' id='email'>"
                + "<p></p>"
                + "<label>Password</label>"
                + "<input type='password' name='password' id='password'>"
                + "<p></p>"
                + "<input type='button' name='KnetSpacelogin' id='KnetSpacelogin' value='Sign in'>"
                + "<p></p>"
                + "<a href='" + knetspace_address + "/password-reset' style='text-decoration: none'>Forgot your password?</a>"
                + "<p></p>"
                + "<a href='" + knetspace_address + "/sign-up' style='text-decoration: none'>Create an account</a>"
                + "</form>"

        var loginModal = new jBox('Modal', {
            animation: 'pulse',
            title: '<font size="5"><font color="white">Sign in to </font><font color="orange">Knet</font><font size="5"><font color="white">Miner</font>',
            content: loginHtml,
            cancelButton: 'Exit',
            draggable: 'title',
            attributes: {
                x: 'right',
                y: 'top'
            },
            delayOpen: 50
        });
        loginModal.open();

        // Checking for blank fields on clicking login
        $('.jBox-container').on('click', '#KnetSpacelogin', function () {
            fetchCredentials(loginModal);
            loginHandler(loginModal);

        });
    });
    return false;
}

/** Handles the logging in event for KnetSpace **/
function loginHandler(loginModal) {
    var email = $("#email").val();
    var password = $("#password").val();
    if (email == 'undefined' && password !== 'undefined' || email == '' && password !== '') {
        jboxNotice("You haven't given an email!", 'red', 60);
    } else if (password == 'undefined' && email !== 'undefined' || password == '' && email !== '') {
        jboxNotice("You haven't given a password!", red, 60);
    } else if (email == '' && password == '' || email == 'undefined' || password == 'undefined') {
        jboxNotice("You haven't given an email and password!", 'red', 60);
    } else {
        // Send to KnetSpace - check if there's a returned JSON and add to the user login details, if successful alert user
        $.ajax({
            type: "POST",
            url: knetspace_address + '/auth/jwt/',
            xhrFields: {
                withCredentials: true
            },
            data: {username_or_email: email, password: password},
        }).success(function (data) {
            // process result
            fetchCredentials(null);
            loginModal.toggle();

            // Refactor i.e. put jboxes into a function and have the content and color changeable
        }).fail(function () {
            jboxNotice("Incorrect credentials given", 'red', 60);
        });
    }
    email = "", password = "";
}

function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time));
}

function logOut() {
    fetch(knetspace_address + '/api/v1/logout', {
        credentials: 'include'
    }).then((response) => {
        return response.json();

    }).then((myJson) => {
        console.log("Logged out");
    });
    var cookie = getCookie("knetspace_token");
    console.log(cookie);
    eraseCookie(cookie);
    $('#login_icon').attr("title", "Sign in"); // insert new link
    $('#login_icon').text("Sign in");
    //$('#login_icon').on('click');
    //$('#login_icon').css("color", "white");
}

/** Fetches user credentials **/
function fetchCredentials(loginModal) {
    // Initial check for credentials
    fetch(knetspace_address + '/api/v1/me', {
        credentials: 'include'
    }).then((response) => {
        if (response.status === 200) {
            return response.json();
        } else {
            console.log("No Authentication found");
        }
    }).then((myJson) => {
        if (typeof (myJson.username) !== 'undefined') {
            if (loginModal === "undefined" || typeof loginModal === null) {
                loginModal.toggle();
            }

            var content = "Welcome, " + myJson.username; // Welcome the user
            jboxNotice(content, 'blue', 60);
            // Update the login icon & name
            $('#login_icon').attr("title", "More"); // insert new link
            $('#login_icon').attr("target", "");
            $('#login_icon').attr("title", "");
            $('#profile_icon').attr("title", "");
            $('#login_icon').text(" " + myJson.username);
            $('#login_icon').off('click');
            $('#text').text("");


            fetch(knetspace_address + '/api/v1/me', {
                credentials: 'include'
            }).then((response) => {
                if (response.status === 200) {
                    return response.json();
                } else {
                    console.log("No Authentication found, retrying...");
                    fetchCredentials(null);
                }
            }).then((myJson) => {
                if (typeof myJson.username !== 'undefined') {
                    $('#login_icon').click(function () {
                        // move block outside if logged in then do this


                        var firstName = myJson.first_name,
                                lastName = myJson.last_name, // Not yet using the lastName, may be used in future.
                                organisation = myJson.organisation,
                                email = myJson.email;

                        if (organisation === "null" || typeof organisation == "object") {
                            organisation = "Not given";
                        }
                        if (email === "null" || typeof email == "object") {
                            email = "Not given";
                        }
                        // If the user doesn't give their first name, we should use the username instead.
                        if (firstName !== "null" || typeof firstName == "object") {
                            var profileTitle = '<font size="5"><font color="white">Welcome, </font><font color="orange">' + firstName + '</font>';
                        } else {
                            var profileTitle = '<font size="5"><font color="white">Welcome, </font><font color="orange">' + myJson.username + '</font>';
                        }

                        var profile_menu_html = "<font size='4'><a href='" + knetspace_address + "/profile' style='text-decoration: none' class='profileClass'>Manage my profile</a>"
                                + "<hr>"
                                + "<a href='" + knetspace_address + "/network' style='text-decoration: none' class='profileClass'>Manage my Knetworks</a>"
                                + "<hr></font>"
                                + "<font size='2'><label><b>Email</b></label>"
                                + "<p></p>"
                                + email
                                + "<p></p>"
                                + "<label><b>Organisation</b></label>"
                                + "<p></p>"
                                + organisation
                                + "<hr>"
                                + "<input type='button' name='KnetlogOut' id='logOutButton' value='Sign out' class='knetButton'>";

                        // Profile modal box
                        var profileModal = new jBox('Modal', {
                            animation: 'pulse',
                            title: profileTitle,
                            content: profile_menu_html,
                            target: $('#login_icon'),
                            width: 350,
                            offset: {
                                x: 100,
                                y: 200
                            },
                            delayOpen: 100
                        });
                        profileModal.open();
                        // Sign out button logic, perform api request for logging out
                        $('#logOutButton').click(function () {
                            profileModal.destroy();
                            logOut();
                            $('#login_icon').unbind('click');
                            var cookie = getCookie("knetspace_token");
                            if (cookie === 'undefined' || cookie === null) {
                                sleep(300).then(() => {
                                    loginModalToggle(); // Currently delaying this to ensure both servers perform their respective HTTP requests before performing the next method
                                    window.location.reload();
                                });
                            }
                        });
                    });
                } else { console.log("Not logged in"); }
            });
        } else {
            console.log("No Authentication found");
        }
    });
}