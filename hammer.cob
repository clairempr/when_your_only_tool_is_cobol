      *************************************
      * hammer.cob
      *
      * When your only tool is a hammer...
      *************************************
      
       identification division.
       program-id. hammer.
       
       environment division.
       
       input-output section.
       file-control.           
           select html-file
           assign to "hammer.html"
           organization is line sequential.
           

       data division.
       
       file section.
       fd html-file.
       01 html-line				pic x(255).
       
       
       procedure division.
       
      * Open html file
       open output html-file.
       
      * Write some html
       write html-line 			from "<html><head>".
       
      * Gotta have some bootstrap
       perform write-bootstrap-link.
       
      * Load Google web fonts
       perform write-web-fonts.
       
      * Write style
       perform write-style.
      
       write html-line 			from "</head>".
       
       initialize html-line.
       string 	"<body>"
       	"<div class=" quote "container text-center" quote ">"
       	"<h1 class=" quote "when-your-only" quote ">"
       	"When your only tool is COBOL, everything looks like a "
       	"mainframe"
       	"</h1>"			into html-line.
       write html-line.
      
       initialize html-line.
       string	"<h1 class=" quote "display-1" quote "> " 
       	"<span class=" quote "hello-world" quote ">HELLO WORLD</span>"
        	"</h1></div></body></html>"	into html-line.
       write html-line. 	


      * Close html file
       close html-file.

       exit program.
       stop run.
       
       
       write-style.
           initialize html-line.
           string "<style>"
        	   ".hello-world {"
  		      "font-family: 'VT323', sans-serif;"
  		      "padding: 5rem 0;"
		   "}"
		   ".when-your-only {"
		      "font-family: 'Cousine', sans-serif;"
		      "margin: 4rem 0;"
		   "}"
		   "</style>"	 
           					into html-line.	
           write html-line.

       write-bootstrap-link.
      * Gotta have some bootstrap
           initialize html-line.
           string "<link href=" quote 
       	   "https://cdn.jsdelivr.net/npm/"	
                  "bootstrap@5.0.2/dist/css/bootstrap.min.css" quote 
                  "rel=" quote "stylesheet" quote ">" 
                  				into html-line.
           write html-line.
           
       write-web-fonts.
           initialize html-line.
      	   string "<link href=" quote
      	          "https://fonts.googleapis.com/css?family="
		  "VT323|Cousine" quote 
      	          "rel=" quote "stylesheet" quote 
      	          "type=" quote "text/css" quote ">"	
      	          				into html-line.
      	   write html-line.
          
       
