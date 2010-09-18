all: index.pdf api.pdf nodejs.org.pdf

DIR = nodejs.org/doc
JA_DIR = nodejs.org-ja
BOOKS_DIR = books

### original
index.pdf:
	ebook-convert $(DIR)/index.html $(BOOKS_DIR)/index.pdf \
		--title 'Node.js Documentation' \
		--authors 'nodejs.org' \
		--language en \
		--max-levels 0 \
		--extra-css '#logo {display:none;} \
					 #toc {display:none;} \
					 #content {margin-left:30px;} \' \
		--margin-top 0 \
		--margin-bottom 0 \
		--page-breaks-before / \
		--cover cover.jpg

api.pdf:
	ebook-convert $(DIR)/api.html $(BOOKS_DIR)/api.pdf \
		--title 'Node.js Documentation' \
		--authors 'nodejs.org' \
		--language en \
		--max-levels 0 \
		--extra-css '#man {left:0px;overflow:visible;} \
					 #man h1 {display:none;} \
					 ol.man {display:none;} \
					 #toc {display:none;}' \
		--margin-top 0 \
		--margin-bottom 0 \
		--page-breaks-before /

nodejs.org.pdf:
	pdfmanipulate merge --output=$(BOOKS_DIR)/nodejs.org.pdf \
		$(BOOKS_DIR)/index.pdf $(BOOKS_DIR)/api.pdf


### Japanese
ja: index-ja.pdf api-ja.pdf nodejs.org-ja.pdf

index-ja.pdf:
	ebook-convert $(JA_DIR)/index.html $(BOOKS_DIR)/index-ja.pdf \
		--title 'Node.js Documentation' \
		--authors 'nodejs.org/nodejs.jp' \
		--language ja \
		--max-levels 0 \
		--extra-css '#logo {display:none;} \
					 #toc {display:none;} \
					 #content {margin-left:30px;} \
					 #introduction {margin-top:80px;} \
					 #copyright {top:10pt;height:30px;position:absolute;}' \
		--margin-top 0 \
		--margin-bottom 0 \
		--page-breaks-before / \
		--cover cover.jpg

api-ja.pdf:
	ebook-convert $(JA_DIR)/api.html $(BOOKS_DIR)/api-ja.pdf \
		--title 'Node.js Documentation' \
		--authors 'nodejs.org/nodejs.jp' \
		--language ja \
		--max-levels 0 \
		--extra-css '#man {left:0px;overflow:visible;} \
					 #man h1 {display:none;} \
					 ol.man {display:none;} \
					 #toc {display:none;} \
					 #copyright {top:10pt;height:26px;position:absolute;}' \
		--margin-top 0 \
		--margin-bottom 0 \
		--page-breaks-before /

nodejs.org-ja.pdf:
	pdfmanipulate merge --output=$(BOOKS_DIR)/nodejs.org-ja.pdf \
		$(BOOKS_DIR)/index-ja.pdf $(BOOKS_DIR)/api-ja.pdf

clean:
	rm -f $(BOOKS_DIR)/*.pdf
