var App = new Object();

App.getUrlBase = function(){
    return location.protocol + '//' + location.host + '/';
};

App.addOptions = function(targetElement, data, value, content, includeBlank){
    var html = "";
    if(includeBlank){
        html += "<option value=''></option>";
    }

    data.forEach( function (item)
    {
        html += "<option value='"+item[value]+"'>"+item[content]+"</option>";
    });

    targetElement.append(html);
};

App.renderErrors = function(errors){
    $('#indicator-errors').empty();
    var html = "<div id='errorExplanation'><ul>\n";

    if(errors){
        errors.forEach( function (error) {
            html += "<li>"+error+"</li>\n"
        });
    }

    html += "</ul></div>";
    $('#indicator-errors').append(html);
};

App.cleanModal = function(el) {
    if (el) {
        $(el).empty();
    } else {
        $('#ajax-modal').empty();
    }

};

App.showModal = function(id, title) {
    var el = $('#' + id).first();
    if (el.length === 0 || el.is(':visible')) {
        return;
    }
    if (!title) title = el.find('h3.title').text();
    // moves existing modals behind the transparent background
    $(".modal").zIndex(99);

    var data = {
        width: '100%',
        draggable: true,
        modal: true,
        resizable: false,
        dialogClass: 'modal',
        position: {my: "center", at: "top", collision: 'fit'},
        title: title,
        beforeClose: function (event, ui) {
            App.cleanModal(el);
        }
    };
    el.dialog(data).on('dialogclose', function(){
        $(".modal").zIndex(101);
    });
    el.find("input[type=text], input[type=submit]").first().focus();
};

App.hideModal = function(el) {
    App.cleanModal(el);
    var modal;
    if (el) {
        modal = $(el);
    } else {
        modal = $('#ajax-modal');
    }
    modal.dialog("close");
};


var Indicator = new Object();

Indicator.loadIndicatorTypes = function(subprocess){
    var subprocess_id =  $(subprocess).val();
    var targetElement = $('#indicator_type_id');
    targetElement.empty();
    if(subprocess_id != '' && typeof subprocess_id !== "undefined"){
        $.ajax({
            url: App.getUrlBase() + "/indicator_types.json",
            type: 'GET',
            data: {subprocess_id: subprocess_id},
            dataType: "JSON",
            complete: function(data) {
                var indicator_types = data.responseJSON.indicator_types;
                if(indicator_types){
                    App.addOptions(targetElement, indicator_types, 'id', 'name', true);
                }
            }
        });
    }
};

Indicator.loadIndicators = function () {
    var indicator_type_id = $("#indicator_type_id").val();
    var year_id = $("#year_id").val();
    var month_id = $("#month_id").val();
    var week_id = $("#week_id").val();

    if(indicator_type_id == '' || typeof indicator_type_id === 'undefined') return;
    if(year_id == '' || typeof year_id === 'undefined') return;
    if(month_id == '' || typeof month_id === 'undefined') return;

    var params = {
        indicator_type_id: indicator_type_id,
        year_id: year_id,
        month_id: month_id
    };

    $.ajax({
        url: App.getUrlBase() + "/indicators.json",
        type: 'GET',
        data: {search: params},
        dataType: "JSON",
        complete: function(data) {
            var indicators = data.responseJSON.indicators;
            if(indicators){
                Indicator.fillIndicatorsTable(indicators);
            }

        }
    });
};

Indicator.fillIndicatorsTable = function(indicators){

    var targetElement = $('#tbody-indicators');
    targetElement.hide();
    targetElement.empty();
    var html = "";
    indicators.forEach( function (indicator)
    {
        html += "<tr>";
        html += "<td>"+indicator['service_name']+"</td>";
        html += "<td>"+indicator['subservice_name']+"</td>";
        html += "<td>"+indicator['application_name']+"</td>";
        html += "<td>"+indicator['app_module_name']+"</td>";
        html += "<td>"+indicator['week_name']+"</td>";
        html += "</tr>";
    });
    targetElement.append(html);
    targetElement.show();
};

Indicator.loadIndicatorLevels = function () {
    var indicator_type_id =  $('#indicator_type_id').val();
    if(indicator_type_id != '' && typeof indicator_type_id !== "undefined"){
        $.ajax({
            url: App.getUrlBase() + "/indicator_levels.json",
            type: 'GET',
            data: {indicator_type_id: indicator_type_id},
            dataType: "JSON",
            complete: function(data) {
                var indicator_leves = data.responseJSON.indicator_levels;
                if(indicator_leves){
                    Indicator.fillIndicatorLevelsTable(indicator_leves);
                }

            }
        });
    }
};

Indicator.loadIndicator = function(service_id, subservice_id, application_id, app_module_id, indicator_level_id){
    var indicator_type_id = $("#indicator_type_id").val();
    var year_id = $("#year_id").val();
    var month_id = $("#month_id").val();
    var week_id = $("#week_id").val();

    if(indicator_type_id == '' || typeof indicator_type_id === 'undefined') return;
    if(year_id == '' || typeof year_id === 'undefined') return;
    if(month_id == '' || typeof month_id === 'undefined') return;
    if(week_id == '' || typeof week_id === 'undefined') return;

    var data = {
        indicator_type_id: indicator_type_id,
        indicator_level_id: indicator_level_id,
        year_id: year_id,
        month_id: month_id,
        week_id: week_id,
        service_id: service_id,
        subservice_id: subservice_id,
        application_id: application_id,
        app_module_id: app_module_id
    };

    $.ajax({
        url: App.getUrlBase() + 'indicators/form.js',
        type: 'post',
        data: data
    });
};

Indicator.fillIndicatorLevelsTable = function(indicator_levels){

    var targetElement = $('#tbody-indicator-levels');
    targetElement.hide();
    targetElement.empty();
    var html = "";
    indicator_levels.forEach( function (indicator_level)
    {

        var buttonLoadIndicator = "<button onclick='Indicator.loadIndicator("+indicator_level['service_id']+","+indicator_level['subservice_id']+","+indicator_level['application_id']+","+indicator_level['app_module_id']+","+indicator_level['id']+")'>Load</button>";

        html += "<tr>";
        html += "<td>"+indicator_level['service_name']+"</td>";
        html += "<td>"+indicator_level['subservice_name']+"</td>";
        html += "<td>"+indicator_level['application_name']+"</td>";
        html += "<td>"+indicator_level['app_module_name']+"</td>";
        html += "<td>"+buttonLoadIndicator+"</td>";
        html += "</tr>";
    });
    targetElement.append(html);
    targetElement.show();
};

Indicator.save = function(id){
    var url = App.getUrlBase();
    var method;
    if(id == '' || typeof id === 'undefined'){
        url += 'indicators.json';
        method = 'post'
    }else{
        url += 'indicators/'+id+'.json';
        method = 'put'
    }

    $.ajax({
        url: url,
        type: method,
        data: $('#indicator-form').serialize(),
        dataType: "JSON",
        complete: function(data) {
            var errors = data.responseJSON.errors;
            var indicator = data.responseJSON.indicator;
            if(errors){
                App.renderErrors(errors);
            }else if(indicator){
                $('#indicator-form').empty();
                window.location.href = App.getUrlBase()+'/indicators/'+indicator['id'];
            }
        }
    });

    return false;
};