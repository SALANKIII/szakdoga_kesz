// Sorozatok lekérdezése
async function fetchAccounts() {
    const response = await fetch('/getUsers');
    const szakdoga = await response.json();

    tableRow(szakdoga);
}

// felhasználó törlése
async function deleteUser(accountID) {
   console.log(accountID);

    const confirmed = confirm('Biztosan szeretnéd törölni?');

    if (!confirmed) {
        return;
    }
    const res = await fetch(`/deleteUser/${accountID}`, {
        method: "DELETE"
    });
    const data = await res.json();

    if (data.success) {
        fetchAccounts();
    }
}

// felhasználók közötti keresés
document.getElementById('searchingForm').onsubmit = async function(event) {
    event.preventDefault();

    const columnNames = {
        1: 'email',
        2: 'username',
        3: 'role'
    };

    let searching = event.target.elements.searching.value;
    const searchingType = columnNames[event.target.elements.searchType.value];
    
    // ha a szerepkörre keresünk, akkor csak user vagy 0 vagy admin vagy 1-et adhatunk meg a kereső mezőben
    if (searchingType === 'role') {
        if (searching === 'user' || searching === "0") {
            searching = 0;
        } else if (searching === 'admin' || searching === "1") {
            searching = 1;
        } else if (searching === '') {
            searching = '';
        } else {
            alert('Only admin or 1 or user or 0 can be used!');
            return;
        }
    }

    const res = await fetch('/searchingUser', {
        method: "POST",
        headers: {
            "content-type": "application/json"
        },
        body: JSON.stringify({ searching, searchingType })
    });
    const users = await res.json();

    if (users.length === 0) {
        document.getElementById('users').innerHTML = '<tr><td colspan=6>Nincs találat</td></tr>';
    } else {
        tableRow(users);
    }

}

function tableRow(szakdoga) {
    let accountHTML = '';
    for (let account of szakdoga) {
        accountHTML += `
        <tr>
            <td>${account.accountID}</td>
            <td>${account.username}</td>
            <td>${account.email}</td>
            <td>${account.gender}</td>
            <td>${account.role === 1 ? "admin" : "user"}</td>
            <td>${account.formattedBirthday ? account.formattedBirthday : "No data"}</td>
            <td>
                <button type="button" class="btn btn-outline-danger" onclick="deleteUser(${account.accountID})">
                    <i class="fa-solid fa-user-xmark"></i>
                </button>
            </td>
        </tr>
        `
    }

    document.getElementById('users').innerHTML = accountHTML;
}

