var selectedReport;
var citizenID;
var vehPlate;
var locales;
var reports;
var table = [];
var selectedWindow = '';
var canPressEsc = true;

async function retrieveNUI(
    eventName, data = {}) {
    const options = {
          method: "post",
          headers: { 
            "Content-Type": "application/json; charset=UTF-8" 
            },
          body: JSON.stringify(data),
    };

    const resourceName = window.GetParentResourceName 
    ? window.GetParentResourceName() 
    : "nui-frame-app";

    try {
        const resp = await fetch(`https://${resourceName}/${eventName}`, options);
        return await resp.json();
    } catch (error) {
        return null;
    }
}

window.addEventListener('message', function(event) {
	switch (event.data.action) {
		case 'inspectVehicle':
        locales = event.data.locales;
        vehicleInfo = event.data.vehicleInfo;
        phoneNumberFormat = event.data.phoneNumberFormat;
        vehPlate = vehicleInfo.plate;
        $('#inspect_vehicle_name').html(vehicleInfo.label);
        $('#inspect_vehicle_plate').html(vehicleInfo.plate);
        $('#inspect_vehicle_owner').html(vehicleInfo.ownerName);
        $('#inspect_vehicle_citizenid').html(vehicleInfo.citizenid);
        $('#inspect_vehicle_phone').html(formatPhoneNumber(vehicleInfo.phone));
        $('#inspect_vehicle_plate_icon').html(`<i class="fa-solid fa-copy size-1rem" onClick="copyToClipboard('${vehicleInfo.plate}', true)"></i>`)
        $('#inspect_vehicle_phone_icon').html(`<i class="fa-solid fa-copy size-1rem" onClick="copyToClipboard('${vehicleInfo.phone}', false)"></i>`)
        setupUI();
        $('#inspect_menu').fadeIn(500);
        break

        case 'cctvmenu':
        locales = event.data.locales;
        setupUI();
        $('#cctv_menu').fadeIn(500);
        break

        case 'radarmenu':
        locales = event.data.locales;
        setupUI();
        $('#radar_menu').fadeIn(500);
        break

        case 'prisonmenu':
        locales = event.data.locales;
        citizenID = event.data.citizenID;
        $('#prison_menu_name').html(event.data.targetName + ' (' + event.data.targetID + ')');
        setupUI();
        $('#prison_menu').fadeIn(500);
        break

        case 'communitymenu':
        locales = event.data.locales;
        citizenID = event.data.citizenID;
        $('#community_menu_name').html(event.data.targetName + ' (' + event.data.targetID + ')');
        setupUI();
        $('#community_menu').fadeIn(500);
        break

        case 'setJailTime':
        locales = event.data.locales;
        $('.jail_border').css('display', 'flex').hide().fadeIn(1000);
        $('#jail_time_remaining').html(event.data.time + ' ' + locales.monthsleft);
        break

        case 'updateJailTime':
        locales = event.data.locales;
        $('#jail_time_remaining').html(event.data.time + ' ' + locales.monthsleft);
        break

        case 'closePrisonTime':
        $('.jail_border').fadeOut(1000);
        break

        case 'reportmenu':
        locales = event.data.locales;
        phoneNumberFormat = event.data.phoneNumberFormat;
        playerName = event.data.playerName;
        playerPhone = event.data.playerPhone;
        date = event.data.date;
        $('#report_menu_name').html(playerName);
        $('#report_menu_phone').html(formatPhoneNumber(playerPhone));
        $('#report_menu_date').html(date);
        setupUI();
        $('#report_menu').fadeIn(500);
        break

        case 'reportsmenu':
        locales = event.data.locales;
        reports = event.data.reports;
        phoneNumberFormat = event.data.phoneNumberFormat;
        setupUI();
        setupReports();
        $('#reports_menu').fadeIn(500);
        break

        case 'policeMenu':
        locales = event.data.locales;
        options = event.data.options;
        exitOption = event.data.exitOption;
        title = event.data.title;
        setupMenu(options, exitOption, title);
        break

        case 'closePoliceMenu':
        $('#police-menu').fadeOut(10);
        break
    }
});

// Functions

function setupUI() {
    $('#set_cam, #set_radar, #send_to_prison, #send_to_community, #send_report').html(locales.confirm);
    $('#recover_vehicle').html(locales.sendtorecover);
    $('#inspect_vehicle_title').html(locales.vehicleinfo);
    $('#inspect_vehicle_name_title').html(locales.vehiclename);
    $('#inspect_vehicle_plate_title').html(locales.vehicleplate);
    $('#inspect_vehicle_owner_title').html(locales.vehicleowner);
    $('#inspect_vehicle_citizenid_title').html(locales.owneridentifier);
    $('#inspect_vehicle_phone_title').html(locales.ownerphone);
    $('#new_cctv_title').html(locales.cctvsettings);
    $('#new_cam_name_title').html(locales.cctvname);
    $('#new_cam_name').attr('placeholder', locales.cctvplaceholder);
    $('#can_rotate').html(locales.rotate);
    $('#new_radar_title').html(locales.newradar);
    $('#new_radar_name_title').html(locales.radarname);
    $('#new_radar_name').attr('placeholder', locales.radarplaceholder);
    $('#new_radar_speed_title').html(locales.radarspeed);
    $('#new_radar_speed').attr('placeholder', 120);
    $('#prison_menu_title').html(locales.prisonmenu);
    $('#prison_menu_name_title').html(locales.playername);
    $('#prison_menu_time_title').html(locales.months);
    $('#prison_menu_time').attr('placeholder', 18);
    $('#community_menu_title').html(locales.communitymenu);
    $('#community_menu_name_title').html(locales.playername);
    $('#community_menu_time_title').html(locales.months);
    $('#community_menu_time').attr('placeholder', 18);
    $('#report_menu_title').html(locales.newreport);
    $('#report_menu_name_title').html(locales.yourname);
    $('#report_menu_phone_title').html(locales.phonenumber);
    $('#report_menu_date_title').html(locales.date);
    $('#report_menu_description_title').html(locales.description);
    $('#report_info_title').html(locales.newreport);
    $('#report_info_name_title').html(locales.yourname);
    $('#report_info_phone_title').html(locales.phonenumber);
    $('#report_info_date_title').html(locales.date);
    $('#report_info_description_title').html(locales.description);
    $('#anonymous_report_title').html(locales.anonymous);
    $('#report_notes').attr('placeholder', locales.descriptionplaceholder);
    $('#change_report_status').html(locales.confirm);
    $('#report_status_title').html(locales.status);
    $('#delete_report').html(locales.delete);
}

function setupReports() {
    $('#page-title-reports').html(locales.reportslist);
    $('#table_info').html('');
    $('#table_info').html(`
        <table id="reportsTable">
            <thead>
                <tr>
                    <th class="text-center">#</th>
                    <th class="text-center">${locales.player}</th>
                    <th class="text-center">${locales.phone}</th>
                    <th class="text-center">${locales.status}</th>
                    <th class="text-center">${locales.actions}</th>
                </tr>
            </thead>
            <tbody id="reportsTableData">
            </tbody>
        </table>
        `);

    var row = '';
    for (var i = 0; i < reports.length; i++) {
        var status = locales.none;
        if (reports[i].status == 1) {
            status = locales.inreview;
        } else if (reports[i].status == 2) {
            status = locales.archived;
        }
        row += `<tr>
        <td class="text-center align-middle">${reports[i].id}</td>
        <td class="text-center align-middle">${reports[i].reporter}</td>
        <td class="text-center align-middle">${formatPhoneNumber(reports[i].phone)}</td>
        <td class="text-center align-middle">${status}</td>
        <td class="text-center align-middle"><button type="button" class="btn btn-blue btn-view" onClick="openReportInfo('${reports[i].id}')"><i class="fas fa-eye"></i> ${locales.view.toUpperCase()}</button></td>
        </tr>`;
    }

    $("#reportsTableData").html(row);
    var table_id = document.getElementById('reportsTable');
    table.push(new simpleDatatables.DataTable(table_id, {
        perPageSelect: false,
        perPage: 5,
        searchable: false,
        labels: {
            placeholder: locales.search,
            noRows: locales.noentriesfound,
            noResults: locales.noresults,
        }
    }));
}

function closeMenu() {
    if (selectedWindow == '') {
        $('#inspect_menu, #cctv_menu, #radar_menu, #prison_menu, #community_menu, #report_menu, #reports_menu, #report_info').fadeOut(500);
        $('#police-menu').fadeOut(250);
        retrieveNUI('close')
    } else {
        canPressEsc = false;
        $('#report_info').fadeOut(500);
        setupReports();
        setTimeout(() => { $('#reports_menu').fadeIn(500); canPressEsc = true; }, 500);
        $('#change_report_status').prop('disabled', true);
        selectedWindow = '';
    }
}

function copyToClipboard(text, isPlate) {
    const textarea = document.createElement('textarea');
    textarea.value = text;
    textarea.style.position = 'fixed';
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);
    if (isPlate) { retrieveNUI('copiedPlateToClipboard') } else { retrieveNUI('copiedPhoneToClipboard') }
}

function formatPhoneNumber(phoneNumber) {
    if (!phoneNumber) return locales.na;
    const format = phoneNumberFormat;
    let formattedNumber = "";
    let numberIndex = 0;
    for (let i = 0; i < format.length; i++) {
        if (format[i] === 'x') {
            if (numberIndex < phoneNumber.length) {
                formattedNumber += phoneNumber[numberIndex];
                numberIndex++;
            }
        } else {
            formattedNumber += format[i];
        }
    }
    if (numberIndex < phoneNumber.length) {
        formattedNumber += '' + phoneNumber.slice(numberIndex);
    }
    return formattedNumber;
}

function checkIfEmpty() {
    if ($('#report_notes').val().length > 0) {
        $('#send_report').prop('disabled', false);
    } else {
        $('#send_report').prop('disabled', true);
    }
    if ($('#report_status').val() != '') {
        $('#change_report_status').prop('disabled', false);
    } else {
        $('#change_report_status').prop('disabled', true);
    }
}

function setupMenu(options, exitOption, title) {
    var argsArray = options.map(option => option.args);

    $('#menu-info').html('');
    $('#menu-title').html(title);

    var row = ``;
    var length = options.length;
    for (var i = 0; i < options.length; i++) {
        row += `
            <div onClick="openSubMenu('${options[i].event}', ${i})" class="menu-info">
                <div class="menu-info-title">${options[i].title}</div>
                <div class="menu-info-description">${options[i].description}</div>
            </div>
        `;
    }

    $('#menu-info').html(row);

    if (length > 7) {  $('.menu-info').css('width', '20.5rem') } else { $('.menu-info').css('width', '100%') }

    $('#close-menu').html('');
    if (exitOption) {
        if (exitOption.title) { $('#close-menu').html(`<div id="close-menu-text" class="menu-info-title">${exitOption.title}</div>`) }
        if (exitOption.event == 'closePoliceMenu') { 
            $('#close-menu').css('display', 'none');
        } else {
            $('#close-menu').css('display', 'flex');
            $('#close-menu').attr('onClick', `openSubMenu('${exitOption.event}')`);
        }
    } else {
        $('#close-menu').css('display', 'none');
    }
    $('#police-menu').fadeIn(250);

    window.openSubMenu = function(event, argsIndex) {
        var args = argsArray[argsIndex];
        retrieveNUI('openNewMenu', { event: event, args: args })
    }
}

function openReportInfo(id) {
    for (var i = 0; i < reports.length; i++) {
        if (reports[i].id == id) {
            selectedReport = reports[i].id;
            $('#report_info_name').html(reports[i].reporter);
            $('#report_info_phone').html(formatPhoneNumber(reports[i].phone));
            $('#report_info_phone_copy').html(`<i class="fa-solid fa-copy size-1rem" onClick="copyToClipboard('${reports[i].phone}', false)"></i>`)
            $('#report_info_date').html(reports[i].date);
            $('#report_info_description').html(reports[i].description);
            $('#report_info_status').html(reports[i].status == 1 ? locales.inreview : locales.archived);
            var dropdown;
            if (reports[i].status == 0) {
                dropdown = `
                <option value="" disabled selected hidden>${locales.none}</option>
                <option value="1">${locales.inreview}</option>
                <option value="2">${locales.archived}</option>
            `;
            } else if (reports[i].status == 1) {
                dropdown = `
                <option value="" disabled selected hidden>${locales.inreview}</option>
                <option value="2">${locales.archived}</option>
            `;
            } else if (reports[i].status == 2) {
                dropdown = `
                <option value="" disabled selected hidden>${locales.archived}</option>
            `;
            }

        $('#report_status').html(dropdown);
        selectedWindow = 'report_info';
        $('#reports_menu').fadeOut(500);
        setTimeout(() => { $('#report_info').fadeIn(500); }, 500);
        }

    }
}

// Events

$(document).ready(function() {
	document.onkeyup = function(data) {
		if (data.which == 27) {
            if (canPressEsc) {
                closeMenu();
            }
		}
	};
});

$(document).on('click', '#closeInspectMenu, #closeRadarMenu, #closePrisonMenu, #closeCommunityMenu, #closeReportMenu, #closeReportsMenu, #closeReportInfoMenu', function() {
    closeMenu();
});

$(document).on('click', '#recover_vehicle', function() {
    retrieveNUI('sendToRecover', { plate: vehPlate })
    closeMenu();
});

$(document).on('click', '#set_cam', function() {
    var canRotate = $('#rotate_cam').prop('checked');
    var camName = $('#new_cam_name').val();
    retrieveNUI('setNewCam', { name: camName, rotate: canRotate })
    closeMenu();
    setTimeout(() => { $('#new_cam_name').val(''); $('#rotate_cam').prop('checked', true); }, 350);
});

$(document).on('click', '#set_radar', function() {
    var radarName = $('#new_radar_name').val();
    var radarSpeed = $('#new_radar_speed').val();
    retrieveNUI('setNewRadar', { name: radarName, speed: radarSpeed })
    closeMenu();
    setTimeout(() => { $('#new_radar_name').val(''); $('#new_radar_speed').val(''); }, 350);
});

$(document).on('click', '#send_to_prison', function() {
    var months = $('#prison_menu_time').val();
    retrieveNUI('setPlayerJail', { identifier: citizenID, months: months })
    closeMenu();
    setTimeout(() => { $('#prison_menu_time').val(''); }, 350);
});

$(document).on('click', '#send_to_community', function() {
    var months = $('#community_menu_time').val();
    retrieveNUI('setPlayerCommunity', { identifier: citizenID, months: months })
    closeMenu();
    setTimeout(() => { $('#community_menu_time').val(''); }, 350);
});

$(document).on('click', '#send_report', function() {
    var reportNotes = $('#report_notes').val();
    var playerNamex = $('#report_menu_name').html();
    retrieveNUI('sendNewReport', { playerName: playerNamex, playerPhone: playerPhone, date: date, description: reportNotes })
    closeMenu();
    setTimeout(() => { $('#report_notes').val(''); $('#anonymous_report').prop('checked', false); }, 350);
});

$(document).on('change', '#anonymous_report', function() {
    if(this.checked) {
        $('#report_menu_name').html(locales.anonymous);
    } else {
        $('#report_menu_name').html(playerName);
    }
});

$(document).on('click', '#delete_report', async function() {
    selectedWindow = '';
    retrieveNUI('deleteReport', { id: selectedReport });
    setTimeout(async () => {
        var result = await retrieveNUI('getReports');
        reports = result;
        setupReports();
        $('#report_info').fadeOut(500);
        setTimeout(() => { $('#reports_menu').fadeIn(500); }, 500);
    }, 100);
});

$(document).on('click', '#change_report_status', async function() {
    selectedWindow = '';
    var status = $('#report_status').val();
    retrieveNUI('changeReportStatus', { id: selectedReport, status: status });
    setTimeout(async () => {
        var result = await retrieveNUI('getReports');
        reports = result;
        setupReports();
        $('#report_info').fadeOut(500);
        setTimeout(() => { $('#reports_menu').fadeIn(500); }, 600);
    }, 100);
});

$(document).on('click', '#closeMenu', function() {
    closeMenu();
});