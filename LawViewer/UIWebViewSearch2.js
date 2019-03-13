var uiWebview_SearchResultCount = 0;
//var totale = "";
var totale2=""; var bandera=1; var jivn=0;

/*!
 @method     uiWebview_HighlightAllOccurencesOfStringForElement
 @abstract   // helper function, recursively searches in elements and their child nodes
 @discussion // helper function, recursively searches in elements and their child nodes
 
 element    - HTML elements
 keyword    - string to search
 */

function uiWebview_HighlightAllOccurencesOfStringForElement(element,keyword) {
    
    if (element) {
        if (element.nodeType == 3) {        // Text node
            while (true) {
                //if (counter < 1) {
                var value = element.nodeValue;  // Search for keyword in text node
                var idx = value.toLowerCase().indexOf(keyword);
                
                if (idx < 0) break;             // not found, abort
                
                //(value.split);
                
                //we create a SPAN element for every parts of matched keywords
                var span = document.createElement("span");
                var text = document.createTextNode(value.substr(idx,keyword.length));
                span.appendChild(text);
                
                span.setAttribute("class","uiWebviewHighlight");
                span.style.backgroundColor="yellow";//black
                span.style.color="black"; //white
                
                uiWebview_SearchResultCount++;    // update the counter
                
                text = document.createTextNode(value.substr(idx+keyword.length));
                element.deleteData(idx, value.length - idx);
                var next = element.nextSibling;
                element.parentNode.insertBefore(span, next);
                element.parentNode.insertBefore(text, next);
                element = text;
                
                //totale += "["+findPos(span).x+","+findPos(span).y+"]";
               totale2 += findPos(span).y+",";//""+findPos(span).y+",";
                
                /*if (uiWebview_SearchResultCount >= 1)
                {
                    var desiredHeight = span.offsetTop - 140;
                    window.scrollTo(0, desiredHeight);
                }*/

            }
        } else if (element.nodeType == 1) { // Element node
            if (element.style.display != "none" && element.nodeName.toLowerCase() != 'select') {
                for (var i=element.childNodes.length-1; i>=0; i--) {
                    uiWebview_HighlightAllOccurencesOfStringForElement(element.childNodes[i],keyword);
                }
            }
        }
    }
}
function findPos(obj) {
    var pos = new Object();
    pos.x = pos.y = 0;        
    if (obj.offsetParent)  
    {
        do  
        {
            pos.x += obj.offsetLeft;
            pos.y += obj.offsetTop;
        } while (obj = obj.offsetParent);
    }
    return pos;
}

/*function scrollToDesiredHeight(row) {
 var desiredHeight = span.offsetTop - 140;
 window.scrollTo(0,row * desiredHeight);
 }*/
function scrollToDesiredHeight()
{
    if (bandera==1)
    {
        totale2 = totale2.split(",");
        for(var i=0; i<totale2.length; i++) { totale2[i]=parseInt(totale2[i],10); }
        
        jivn = totale2.length-1;
    }
    
    if (jivn<0)//jivn>=totale2.length || jivn<0
    {
        jivn = totale2.length-1;
    }
    
    //if (jivn<=totale2.length && jivn>=0)
    //{
    jivn--;
    window.scrollTo(0, totale2[jivn] - 10);
    //}
    
    bandera=0;
}
function scrollToDesiredHeightBack()
{
    if (bandera==1)
    {
    totale2 = totale2.split(",");
    for(var i=0; i<totale2.length; i++) { totale2[i]=parseInt(totale2[i],10); }
    
      jivn = -1;
    }
    
    if (jivn>=totale2.length-1)//jivn>=totale2.length || jivn<0
    {
      jivn = -1;
    }
    //if (jivn<=totale2.length && jivn>=0)
    //{  
    jivn++;
    window.scrollTo(0, totale2[jivn] - 10);
    //}
    
    bandera=0;
}

// the main entry point to start the search
function uiWebview_HighlightAllOccurencesOfString(keyword) {
    uiWebview_RemoveAllHighlights();
    uiWebview_HighlightAllOccurencesOfStringForElement(document.body, keyword.toLowerCase());
}

// helper function, recursively removes the highlights in elements and their childs
function uiWebview_RemoveAllHighlightsForElement(element) {
    if (element) {
        if (element.nodeType == 1) {
            if (element.getAttribute("class") == "uiWebviewHighlight") {
                var text = element.removeChild(element.firstChild);
                element.parentNode.insertBefore(text,element);
                element.parentNode.removeChild(element);
                return true;
            } else {
                var normalize = false;
                for (var i=element.childNodes.length-1; i>=0; i--) {
                    if (uiWebview_RemoveAllHighlightsForElement(element.childNodes[i])) {
                        normalize = true;
                    }
                }
                if (normalize) {
                    element.normalize();
                }
            }
        }
    }
    return false;
}

// the main entry point to remove the highlights
function uiWebview_RemoveAllHighlights() {
    uiWebview_SearchResultCount = 0;
    uiWebview_RemoveAllHighlightsForElement(document.body);
}