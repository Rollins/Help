<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
  "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type"
  content="text/html; charset=utf-8">

<title>
API/CSE test, displaying either
static content or search results
</title>

<script type="text/javascript"
  src="http://www.google.com/jsapi"></script>

<script type="text/javascript">

  function findByClass(tagName, className) {
    var r = new RegExp('\\b' + className + '\\b');
    var elements = document.getElementsByTagName(tagName);
    for (var i = 0;  i < elements.length;  i++) {
      var e = elements[i];
      if (e.className && r.test(e.className)) {
        return e;
      }
    }
    return null;
  }

  function searchSubmitted() {
    var e;
    if ((e = findByClass('input', 'gsc-input')) != null) {
      if (e.value === '') {
        searchCleared();
      }
    }
  }

  function searchComplete() {
    document.getElementById('cse-results')
      .style.display = 'block';
    document.getElementById('static-content')
      .style.display = 'none';
  }

  function searchCleared() {
    document.getElementById('static-content')
      .style.display = 'block';
    document.getElementById('cse-results')
      .style.display = 'none';
  }

  function init() {

    var cseId = '002529120697234686375:aceoz3oxggi';

    var customSearchControl =
      new google.search.CustomSearchControl(cseId);

    customSearchControl.setResultSetSize(
      google.search.Search.FILTERED_CSE_RESULTSET);

    customSearchControl.setSearchCompleteCallback(
      null, searchComplete);


    var options = new google.search.DrawOptions();
    options.setSearchFormRoot('cse-search-form');

    customSearchControl.draw('cse-results', options);

    var e;

    if ((e = findByClass('form', 'gsc-search-box')) != null) {
      if (e.addEventListener) {
        e.addEventListener(
          'submit', searchSubmitted, false); 
      } else if (e.attachEvent) {
        e.attachEvent(
          'onsubmit', searchSubmitted);
      }
    }

    if ((e = findByClass('input', 'gsc-search-button')) != null) {
      if (e.addEventListener) {
        e.addEventListener(
          'click', searchSubmitted, false); 
      } else if (e.attachEvent) {
        e.attachEvent(
          'onclick', searchSubmitted);
      }
    }

    if ((e = findByClass('div', 'gsc-clear-button')) != null) {
      if (e.addEventListener) {
          e.addEventListener(
            'click', searchCleared, false); 
      } else if (e.attachEvent) {
        e.attachEvent(
          'onclick', searchCleared);
      }
    }
  }

  google.load('search', '1');
  google.setOnLoadCallback(init, true);  

</script>

</head>
<body>

<table>
  <tr>
    <td style="width: 500px;  padding: 10px;  border: solid 2px">

      <div id="cse-results" style="display: none;"></div>

      <div id="static-content"
        style="display: block;">

        <b>Static Content</b> ...
        Lorem ipsum dolor sit amet, consectetur adipisici
        elit, sed do eiusmod tempor incididunt ut labore et
        dolore magna aliqua. Ut enim ad minim veniam, quis
        nostrud exercitation ullamco laboris nisi ut aliquip
        ex ea commodo consequat. Duis aute irure dolor in
        reprehenderit in voluptate velit esse cillum dolore
        eu fugiat nulla pariatur. Excepteur sint occaecat
        cupidatat non proident, sunt in culpa qui officia
        deserunt mollit anim id est laborum.

      </div>

    </td>
    <td style="width: 250px;  vertical-align: top;  padding: 10px;">

      <div id="cse-search-form">Loading...</div>

    </td>
  </tr>
</table>

</body>
</html>