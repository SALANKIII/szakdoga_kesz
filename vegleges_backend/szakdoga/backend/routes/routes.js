const express = require('express');

const router = express.Router();

/* html routes */
const indexRoute = require('./html/indexHTML.js');
const regRoute = require('./html/regHTML.js');
const adminRoute = require('./html/adminHTML.js');
const userRoute = require('./html/userHTML.js');

/* bootsrap routes */
const bootstrapRoute = require('./bootstrap/bootstrap.js');

/* css routes */
const styleCSSRoute = require('./css/styleCSS.js');

/* js (frontend) routes */
const loginRoute = require('./js/login.js');
const registerRoute = require('./js/register.js');
const logoutRoute = require('./js/logout.js');
const adminJSRoute = require('./js/admin/admin.js');
const profileJSRoute = require('./js/profile/profile.js');
const userJSRoute = require('./js/user/user.js');

/* API routes */
const loginDataRoute = require('./API/login.js');
const logoutDataRoute = require('./API/logout.js');
const regDataRoute = require('./API/registration.js');
const getUserEmailRoute = require('./API/getUserEmail.js');
const getUserRoute = require('./API/getUser.js');
const editUserRoute = require('./API/editUser.js');
const adminEditUsersRoute = require('./API/adminEditUsers.js');
const measureRoute = require('./API/measure.js');
const exercisesRoute = require('./API/exercises.js');
const workoutsRoute = require('./API/workouts.js');

// html
router.use('/', indexRoute);
router.use('/', regRoute);
router.use('/', adminRoute);
router.use('/', userRoute);

// bootstrap
router.use('/', bootstrapRoute);

// css
router.use('/', styleCSSRoute);

// frontend js fájljai
router.use('/', loginRoute);
router.use('/', registerRoute);
router.use('/', logoutRoute);
router.use('/', adminJSRoute);
router.use('/', profileJSRoute);
router.use('/', userJSRoute);

// API
router.use('/', loginDataRoute);
router.use('/', logoutDataRoute);
router.use('/', regDataRoute);
router.use('/', getUserEmailRoute);
router.use('/', getUserRoute);
router.use('/', editUserRoute);
router.use('/', adminEditUsersRoute);
router.use('/', measureRoute);
router.use('/', exercisesRoute);
router.use('/', workoutsRoute);

module.exports = router;