<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            padding: 48px 40px;
            width: 100%;
            max-width: 400px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .login-header .icon {
            width: 56px;
            height: 56px;
            background: #1a73e8;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            font-size: 24px;
            color: white;
            font-weight: bold;
        }

        .login-header h2 {
            font-size: 22px;
            color: #1a1a2e;
            font-weight: 600;
        }

        .login-header p {
            font-size: 14px;
            color: #888;
            margin-top: 6px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #555;
            margin-bottom: 6px;
            text-transform: uppercase;
            letter-spacing: 0.4px;
        }

        input {
            width: 100%;
            padding: 12px 14px;
            border: 1.5px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            color: #333;
            margin-bottom: 20px;
            transition: border 0.2s;
            outline: none;
        }

        input:focus { border-color: #1a73e8; }

        .btn-login {
            width: 100%;
            background: #1a73e8;
            color: white;
            padding: 13px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
            margin-top: 4px;
        }

        .btn-login:hover { background: #1558b0; }

        .error {
            background: #fdecea;
            color: #c62828;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 14px;
            margin-bottom: 20px;
            text-align: center;
        }

        .footer-text {
            text-align: center;
            font-size: 12px;
            color: #bbb;
            margin-top: 24px;
        }
        
        @media (max-width: 480px) {
    .login-card { padding: 32px 20px; margin: 0 12px; }
    .login-header h2 { font-size: 18px; }
	}
    </style>
</head>
<body>

<div class="login-card">
    <div class="login-header">
        <div class="icon">S</div>
        <h2>Student Management</h2>
        <p>Sign in to your account</p>
    </div>

    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="LoginServlet" method="post">
        <label>Username</label>
        <input type="text" name="username" placeholder="Enter username" required/>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter password" required/>

        <button type="submit" class="btn-login">Sign In</button>
    </form>

    <p class="footer-text">Student Management System</p>
</div>

</body>
</html>