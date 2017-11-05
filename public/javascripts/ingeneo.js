var App = new Object();

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

var Indicator = new Object();

Indicator.loadIndicatorTypes = function(subprocess){
    var subprocess_id =  $(subprocess).val();
    var targetElement = $('#indicator_type_id');
    targetElement.empty();
    if(subprocess_id != '' && typeof subprocess_id !== "undefined"){
        $.ajax({
            url: "/indicator_types.json",
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

Indicator.loadIndicatorLevels = function (indicatorType) {
    var indicator_type_id =  $(indicatorType).val();
    if(indicator_type_id != '' && typeof indicator_type_id !== "undefined"){
        $.ajax({
            url: "/indicator_levels.json",
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

Indicator.loadIndicator = function(service_id, subservice_id, application_id, app_module_id){};

Indicator.fillIndicatorLevelsTable = function(indicator_levels){

    var targetElement = $('#tbody-indicator-levels');
    targetElement.hide();
    targetElement.empty();
    var html = "";
    indicator_levels.forEach( function (indicator_level)
    {

        var buttonLoadIndicator = "<button onclick='Indicator.loadIndicator("+indicator_level['service_id']+","+indicator_level['subservice_id']+","+indicator_level['application_id']+","+indicator_level['app_module_id']+")'>Load</button>";

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