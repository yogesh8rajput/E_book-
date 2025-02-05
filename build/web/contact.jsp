<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Me</title>
    <style>
        /* Resetting margins and padding for all elements */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styling with background image */
        body {
            background: url("work/wave-haikei.svg") no-repeat center center fixed;
            background-size: cover; /* Ensures the image covers the full screen */
            font-family: Arial, sans-serif;
            height: 100vh; /* Ensures the body takes up the entire height of the screen */
            /*display: flex;*/
            justify-content: center;
            align-items: center;
            /*color: #333;*/
        }

        /* Container for the form with a semi-transparent background */
        .contact-main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 89vh;
            width: 100%;
            background-color: rgba(244, 244, 244, 0.8); /* Semi-transparent background */
            border-radius: 8px;
            padding: 20px;
        }

        /* Contact form styling */
        .contact-form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        /* Title of the form */
        .contact-form h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* Input fields and textarea styling */
        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        /* Submit button styling */
        .contact-form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        /* Submit button hover effect */
        .contact-form input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Placeholder text styling */
        .contact-form input::placeholder,
        .contact-form textarea::placeholder {
            color: #888;
        }

        /* Textarea resizing and height */
        .contact-form textarea {
            resize: vertical;
            height: 150px;
        }

        /* Responsive design for smaller screens */
        @media (max-width: 600px) {
            .contact-form {
                padding: 20px;
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <%@include file="unavbar.jsp"%> <!-- Include your navigation bar -->

    <!-- Main contact section -->
    <div class="contact-main" id="signup">
        <div class="contact-form">
            <h2>Contact Me</h2>
            <form action="contact" method="POST">
                <!-- Name input -->
                <input 
                    type="text" 
                    name="name" 
                    placeholder="Enter Your Name" 
                    required
                />

                <!-- Email input -->
                <input 
                    type="email" 
                    name="email" 
                    placeholder="Enter Your Email" 
                    required
                />

                <!-- Message textarea -->
                <textarea 
                    name="msg" 
                    placeholder="Enter Your Message" 
                    required
                ></textarea>

                <!-- Submit button -->
                <input 
                    type="submit" 
                    value="Submit" 
                    class="n-button btn"
                />
            </form>
        </div>
    </div>

</body>
</html>
