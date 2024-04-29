// változók a jelszó módosításához
const myInput = document.getElementById('editPassword');
const letter = document.getElementById('letter');
const capital = document.getElementById('capital');
const number = document.getElementById('number');
const length = document.getElementById('length');

// oldalról beúszó profil menü megjelenítése
const profile = document.getElementById('profile');
const offcanvas = new bootstrap.Offcanvas(document.getElementById('editProfile'));

profile.addEventListener('click', function () {
    offcanvas.show();
});

// felhasználó email címének kinyerése cookieból:
async function getUserEmail() {
    const res = await fetch('/getUserEmail');
    const data = await res.json();

    const email = data.userEmail;
    //console.log(email);
    getUser(email);
}

// a felhasználó adatainak lekérdezése és oldalsó menübe írása
async function getUser(emailFromCookie) {
    const res = await fetch(`/getUser/${emailFromCookie}`);
    const data = await res.json();

    const username = data[0].username;
    const email = data[0].email;
    const birthday = data[0].formattedBirthday ? data[0].formattedBirthday : "No Data";
    const role = data[0].role;
    const accountID = data[0].accountID;
    document.getElementById('userID').value = accountID;

    if(role!=1) getMeasure(accountID);
    
    const accID = document.getElementById('editProfile');
    accID.setAttribute('data-accountID', accountID);

    let offcanvasBody = `
        <div class="row"> <!-- username -->
            <div class="col-3">
                <i class="fa-solid fa-user mt-3"></i>
            </div>

            <div class="col-6 p-0">
                <h5>Username</h5><br class="d-none">
                <h6 class="text-secondary" id="username">${username}</h6>
            </div>

            <div class="col-3">
                <button type="button" class="btn btn-success border-0 mt-2" onclick="editProfileUsernameModal('${email}')">
                    <i class="fa-solid fa-pen"></i>
                </button>
            </div>
        </div>

        <div class="row"> <!-- email -->
            <div class="col-3">
                <i class="fa-solid fa-envelope mt-3"></i>
            </div>

            <div class="col-6 p-0">
                <h5>Email</h5><br class="d-none">
                <h6 class="text-secondary" id="email">${email}</h6>
            </div>
        </div>

        <div class="row"> <!-- bithday -->
            <div class="col-3">
                <i class="fa-solid fa-cake-candles mt-3"></i>
            </div>

            <div class="col-6 p-0">
                <h5>Birthday</h5><br class="d-none">
                <h6 class="text-secondary" id="birthday">${birthday}</h6>

            </div>

            <div class="col-3">
                <button type="button" class="btn btn-success border-0 mt-2" onclick="editProfileBirthdayModal('${email}')">
                    <i class="fa-solid fa-pen"></i>
                </button>
            </div>
        </div>

        <div class="row"> <!-- password -->
            <div class="col-3">
                <i class="fa-solid fa-lock mt-3"></i>
            </div>

            <div class="col-6 p-0">
                <h5>Password</h5><br class="d-none">
                <h6 class="text-secondary" id="password">**********</h6>
            </div>

            <div class="col-3">
                <button type="button" class="btn btn-success border-0 mt-2" onclick="editProfilePasswordModal('${email}')">
                    <i class="fa-solid fa-pen"></i>
                </button>
            </div>
        </div>

        <div class="row"> <!-- role -->
            <div class="col-3">
                <i class="fa-solid fa-person mt-3"></i>
            </div>

            <div class="col-6 p-0">
                <h5>Role</h5><br class="d-none">
                <h6 class="text-secondary" id="role">${role === 0 ? "user" : "admin"}</h6>
            </div>
        </div>
    `;

    document.getElementById('offcanvasBody').innerHTML = offcanvasBody;
}

// a username szerkesztésének modal ablakának megjelenítése
function editProfileUsernameModal(email) {
    const modal = new bootstrap.Modal(document.getElementById('editProfileUsernameModal'));
    const profilEmail = document.getElementById('editProfileUsernameModal');
    profilEmail.setAttribute('data-profilEmail', email);
    modal.show();
}

// a username módosítása
async function editUsername() {
    const modalElements = document.getElementById('editProfileUsernameModal');
    const modal = bootstrap.Modal.getInstance(modalElements);
    const email = modalElements.getAttribute('data-profilEmail');

    const username = document.getElementById('editUsername').value;

    const res = await fetch(`/editUsername/${email}`, {
        method: "PUT",
        headers: {
            "content-type": "application/json"
        },
        body: JSON.stringify({ username })
    });

    if (res.ok) {
        modal.hide();
        getUserEmail();
    }
}

// a születési dátum szerkesztésének modal ablakának megjelenítése
function editProfileBirthdayModal(email) {
    const modal = new bootstrap.Modal(document.getElementById('editProfileBirthdayModal'));
    const profilEmail = document.getElementById('editProfileBirthdayModal');
    profilEmail.setAttribute('data-profilEmail', email);
    modal.show();
}

// a születési dátum módosítása
async function editBirthday() {
    const modalElements = document.getElementById('editProfileBirthdayModal');
    const modal = bootstrap.Modal.getInstance(modalElements);
    const email = modalElements.getAttribute('data-profilEmail');

    const birthday = document.getElementById('editBirthday').value;

    const res = await fetch(`/editBirthday/${email}`, {
        method: "PUT",
        headers: {
            "content-type": "application/json"
        },
        body: JSON.stringify({ birthday })
    });

    if (res.ok) {
        modal.hide();
        getUserEmail();
    }
}

// a jelszó módosításának modal ablakának megjelenítése
function editProfilePasswordModal(email) {
    const modal = new bootstrap.Modal(document.getElementById('editProfilePasswordModal'));
    const profilEmail = document.getElementById('editProfilePasswordModal');
    profilEmail.setAttribute('data-profilEmail', email);
    modal.show();

    // Amikor beleklikkelünk a jelszó mezőbe, akkor megjelenik a message id-jű div
    myInput.onfocus = function () {
        document.getElementById("message").style.display = "block";
    }

    // Amikor nem vagyunk a jelszó mezőben, akkor eltűnik a message id-jű div
    myInput.onblur = function () {
        document.getElementById("message").style.display = "none";
    }

    myInput.onkeyup = function () {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if (myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if (myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        // Validate numbers
        var numbers = /[0-9]/g;
        if (myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        // Validate length
        if (myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }
}

// a jelszó módosítása
async function editPassword() {
    const modalElements = document.getElementById('editProfilePasswordModal');
    const modal = bootstrap.Modal.getInstance(modalElements);
    const email = modalElements.getAttribute('data-profilEmail');

    const password = document.getElementById('editPassword').value;
    const password2 = document.getElementById('editPassword2').value;

    //console.log(`Jelszó: ${password}, jelszó2: ${password2}`);
    if (!password || !password2) {
        alert("Minden mezőt ki kell tölteni!");
        return;
    }

    if (password.length < 8) {
        alert('A jelszónak legalább 8 karakter hosszúnak kell lenni!');
        return;
    }

    if (password !== password2) {
        alert('A két jelszó nem egyezik meg!');
        return;
    }

    const res = await fetch(`/editPassword/${email}`, {
        method: "PUT",
        headers: {
            "content-type": "application/json"
        },
        body: JSON.stringify({ password })
    });

    if (res.ok) {
        getUserEmail();
        modal.hide();
    }
}

// új mérés felvétele modal ablak megjelenítése
const measure = document.getElementById('measure');
const modal = new bootstrap.Modal(document.getElementById('newMeasure'));

measure.addEventListener('click', function () {
    modal.show();
});

// új mérés felvétele
async function newMeasure() {
    const modalElements = document.getElementById('newMeasure');
    const modal = bootstrap.Modal.getInstance(modalElements);
    const accountID = document.getElementById('userID').value;
    const weight = document.getElementById('newWeight').value;
    const bodyFatPercentage = document.getElementById('newBodyFatPercentage').value;
    const caloricIntake = document.getElementById('newCaloricIntake').value;
    const neck = document.getElementById('newNeck').value;
    const shoulders = document.getElementById('newShoulders').value;
    const chest = document.getElementById('newChest').value;
    const leftBicep = document.getElementById('newLeftBicep').value;
    const rightBicep = document.getElementById('newRightBicep').value;
    const leftForeArm = document.getElementById('newLeftForeArm').value;
    const rightForeArm = document.getElementById('newRightForeArm').value;
    const upperAbs = document.getElementById('newUpperAbs').value;
    const waist = document.getElementById('newWaist').value;
    const lowerAbs = document.getElementById('newLowerAbs').value;
    const hips = document.getElementById('newHips').value;
    const leftThigh = document.getElementById('newLeftThigh').value;
    const rightThigh = document.getElementById('newRightThigh').value;
    const leftCalf = document.getElementById('newLeftCalf').value;
    const rightCalf = document.getElementById('newRightCalf').value;

    console.log(accountID);

    const res = await fetch('/newMeasure', {
        method: "POST",
        headers: {
            "content-type": "application/json"
        },
        body: JSON.stringify({ accountID, weight, bodyFatPercentage, caloricIntake, neck, shoulders, chest, leftBicep, rightBicep, leftForeArm, rightForeArm, upperAbs, waist, lowerAbs, hips, leftThigh, rightThigh, leftCalf, rightCalf })
    });

    const data = await res.json();

    if (data === "Successfully created!") {
        modal.hide();
        getMeasure(accountID);
    }
}

// az adott felhasználó összes eddigi mérési adatnának lekérdezése
async function getMeasure(accountID) {
    console.log(accountID);

    const res = await fetch(`/getMeasure/${accountID}`);
    const data = await res.json();
    drawing(data);
}

// az adott felhasználó összes eddigi mérési adatnának kirajzoló függvénye
function drawing(data) {
    let measureHTML = '';

    for (let measure of data) {
        console.log(measure);
        measureHTML += `
        <tr>
            <td>${measure.weight}</td>
            <td>${measure.bodyFatPercentage}</td>
            <td>${measure.caloricIntake}</td>
            <td>${measure.neck}</td>
            <td>${measure.shoulders}</td>
            <td>${measure.chest}</td>
            <td>${measure.leftBicep}</td>
            <td>${measure.rightBicep}</td>
            <td>${measure.leftForeArm}</td>
            <td>${measure.rightForeArm}</td>
            <td>${measure.upperAbs}</td>
            <td>${measure.waist}</td>
            <td>${measure.lowerAbs}</td>
            <td>${measure.hips}</td>
            <td>${measure.leftThigh}</td>
            <td>${measure.rightThigh}</td>
            <td>${measure.leftCalf}</td>
            <td>${measure.rightCalf}</td>
            <td>${measure.measureDate}</td>
        </tr>
        `
    }

    document.getElementById('users').innerHTML = measureHTML;
}