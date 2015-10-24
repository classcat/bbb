// Check locale
var localeChain = "en_US";

if (navigator.language)
        localeChain = navigator.language;
else if (navigator.browserLanguage)
        localeChain = navigator.browserLanguage;

if(/^([a-z]+)-([a-z]+)$/i.test(localeChain)){
        var matches = /^([a-z]+)-([a-z]+)$/i.exec(localeChain);
        localeChain = matches[1].toLowerCase() + "_" + matches[2].toUpperCase();
}
// classcat : 24-oct-15
else if(/^ja$/i.test(localeChain)){
        localeChain = "ja_JP";
}
else if(/^en$/i.test(localeChain)){
        localeChain = "en_US";
}
else if(/^([a-z]+)$/i.test(localeChain)){
        var matches = /^([a-z]+)$/i.exec(localeChain);
        localeChain = matches[1].toLowerCase() + "_" + matches[1].toUpperCase();
}
else{
        // classccat : 24-oct-15
        localeChain = "ja_JP";
        // localeChain = "en_US";
}

function getLanguage(){
        return localeChain;
}

