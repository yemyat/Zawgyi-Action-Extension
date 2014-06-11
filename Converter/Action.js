//
//  Action.js
//  Converter
//
//  Created by Ye Myat Min on 10/6/14.
//  Copyright (c) 2014 Nex Co., Ltd. All rights reserved.
//

var Action = function() {};

Action.prototype = {
    
    run: function(arguments) {
        var doc = document.createElement('link');
        doc.href = "http://mmwebfonts.comquas.com/fonts/?font=zawgyi";
        doc.rel = "stylesheet";
        document.head.appendChild(doc);
        document.getElementsByTagName("body")[0].style.fontFamily = "zawgyi-one";
    }
    
};
    
var ExtensionPreprocessingJS = new Action
