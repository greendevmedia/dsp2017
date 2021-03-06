<%@ include file="../jspf/head.jsp"%>
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="Client_ID">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<title>Schedule Calendar</title>
</head>
<body>

	<div class="col-sm-4">
		<h2>Registration Form</h2>
		<form data-toggle="validator" role="form" method="post"
			action="RegistrationServlet">
			<div class="form-group">
				<label for="firstName" class="control-label">First Name</label> <input
					type="text" class="form-control" name="firstName"
					placeholder="First Name" minlength="3" maxlength="15"
					data-error="Input is invalid - pleasefill the field with minimum thre and maximum 15 letters"
					required>
				<div class="help-block with-errors"></div>

			</div>

			<div class="form-group">
				<label for="lastName" class="control-label">Last Name</label> <input
					type="text" class="form-control" name="lastName"
					placeholder="Last Name" minlength="3" maxlength="15"
					data-error="Input is invalid - pleasefill the field with minimum thre and maximum 15 letters"
					required>
				<div class="help-block with-errors"></div>

			</div>

			<div class="form-group">
				<label for="email" class="control-label">Email</label> <input
					type="email" class="form-control" name="email" placeholder="Email"
					data-error="Bruh, that email address is invalid" required>
				<div class="help-block with-errors"></div>
			</div>

			<div class="form-group">
				<label for="password" class="control-label">Password</label>
				<div class="form-inline row">
					<div class="form-group col-sm-6">
						<input type="password" data-minlength="6" class="form-control"
							name="password" id="password" placeholder="Password" required>
						<div class="help-block">Minimum of 6 characters</div>
					</div>
					<div class="form-group col-sm-6">
						<input type="password" class="form-control" name="passwordConfirm"
							data-match="#password"
							data-match-error="Whoops, these don't match"
							placeholder="Confirm" required>
						<div class="help-block with-errors"></div>
					</div>
				</div>
			</div>

			<div class="form-group">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>
	</div>
	<div class="col-sm-4">
		<h2>Log In</h2>
		<form data-toggle="validator" role="form" method="post"
			action="LogInServlet">
			<div class="form-group">
				<label for="email" class="control-label">Email</label> <input
					type="email" class="form-control" name="email" placeholder="Email"
					data-error="Bruh, that email address is invalid" required>
				<div class="help-block with-errors"></div>
			</div>
			<div class="form-group">
				<label for="password" class="control-label">Password</label> <input
					type="password" data-minlength="6" class="form-control"
					name="password" id="password" placeholder="Password" required>
				<div class="help-block">Minimum of 6 characters</div>

			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
		</form>

	</div>
	<div class="col-sm-4">
		<h2>Log in with Google</h2>
		<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
		<script>
			function onSignIn(googleUser) {
			

				// The ID token you need to pass to your backend:
				var id_token = googleUser.getAuthResponse().id_token;
				console.log("ID Token: " + id_token);
				
				var xhr = new XMLHttpRequest();
				xhr.open('POST', 'https://localhost:8443/schedule-calendar/GoogleLogInServlet');
				xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
				xhr.onload = function() {
				  console.log('Signed in as: ' + xhr.responseText);
				};
				xhr.send('idtoken=' + id_token);
			};
		</script>

	</div>

</body>
</html>
