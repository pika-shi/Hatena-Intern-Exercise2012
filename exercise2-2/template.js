var Template = function(input) {
    this.input = input;
};

Template.prototype = {
    render: function(variables) {
        source = this.input.source
        for(var i in variables){
            str = variables[i];
            str = str.replace(/&/g,'&amp;');
            str = str.replace(/>/g,'&gt;');
            str = str.replace(/</g,'&lt;');
            str = str.replace(/\n/g,'<br>');
            source = source.replace('{% ' + i + ' %}', str);
        }
        return source;
    }
};