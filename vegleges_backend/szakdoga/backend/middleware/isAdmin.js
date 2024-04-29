const checkRole = (role) => {
    return (req, res, next) => {
        const userString = req.cookies.userData;

        if (!userString) {
            return res.status(401).json("Hozzáférés megtagadva!");
        }

        const user = JSON.parse(userString);

        if (user.role !== role) {
            return res.status(403).json("Nincs jogosultságod a belépésre!");
        }

        next();
    }
}

module.exports = checkRole;