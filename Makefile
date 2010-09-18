DIR = nodejs.org/doc
JA_DIR = nodejs.org-ja
BOOKS_DIR = books

### original
all: index.pdf api.pdf nodejs.org.pdf nodejs.org.epub nodejs.org.mobi

index.pdf:
	ebook-convert $(DIR)/index.html $(BOOKS_DIR)/index.pdf \
		--title 'Node.js Documentation' \
		--authors 'nodejs.org' \
		--language en \
		--max-levels 0 \
		--extra-css '#logo {display:none;} \
					 #toc {display:none;} \
					 #content {margin-left:30px;} \' \
		--page-breaks-before / \
		--cover cover.jpg

api.pdf:
	ebook-convert $(DIR)/api.html $(BOOKS_DIR)/api.pdf \
		--title 'Node.js Documentation' \
		--authors 'nodejs.org' \
		--language en \
		--max-levels 0 \
		--extra-css '#man {left:0px;overflow:visible;} \
					 #man h1 {height:0px;} \
					 ol.man {display:none;} \
					 #toc {display:none;}' \
		--page-breaks-before /

nodejs.org.pdf:
	pdfmanipulate merge --output=$(BOOKS_DIR)/nodejs.org.pdf \
		$(BOOKS_DIR)/index.pdf $(BOOKS_DIR)/api.pdf

nodejs.org.epub:
	ebook-convert $(BOOKS_DIR)/nodejs.org.pdf $(BOOKS_DIR)/nodejs.org.epub \
		--output-profile ipad \
		--language en \
		--base-font-size 9 \
		--line-height 5 \
		--remove-first-image \
		--cover cover.jpg

nodejs.org.mobi:
	ebook-convert $(BOOKS_DIR)/nodejs.org.pdf $(BOOKS_DIR)/nodejs.org.mobi \
		--output-profile kindle \
		--language en \
		--base-font-size 9 \
		--line-height 5 \
		--no-images \
		--remove-first-image \
		--cover cover.jpg


### Japanese
ja: index-ja.pdf api-ja.pdf nodejs.org-ja.pdf nodejs.org-ja.epub nodejs.org-ja.mobi

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
		--page-breaks-before / \
		--cover cover.jpg

api-ja.pdf:
	ebook-convert $(JA_DIR)/api.html $(BOOKS_DIR)/api-ja.pdf \
		--title 'Node.js Documentation' \
		--authors 'nodejs.org/nodejs.jp' \
		--language ja \
		--max-levels 0 \
		--extra-css '#man {left:0px;overflow:visible;} \
					 #man h1 {height:0px;} \
					 ol.man {display:none;} \
					 #toc {display:none;} \
					 #copyright {top:10pt;height:26px;position:absolute;}' \
		--page-breaks-before /

nodejs.org-ja.pdf:
	pdfmanipulate merge --output=$(BOOKS_DIR)/nodejs.org-ja.pdf \
		$(BOOKS_DIR)/index-ja.pdf $(BOOKS_DIR)/api-ja.pdf

nodejs.org-ja.epub:
	ebook-convert $(BOOKS_DIR)/nodejs.org-ja.pdf $(BOOKS_DIR)/nodejs.org-ja.epub \
		--output-profile ipad \
		--language ja \
		--base-font-size 9 \
		--line-height 5 \
		--no-images \
		--remove-first-image \
		--cover cover.jpg
	### hack
	cd $(BOOKS_DIR); \
	unzip nodejs.org-ja.epub -d nodejs.org-ja.tmp; \
	perl -pi -e 's/xml:lang="en"/xml:lang="ja"/' nodejs.org-ja.tmp/titlepage.xhtml; \
	perl -pi -e 's/<html xmlns="http:\/\/www.w3.org\/1999\/xhtml">/<html xmlns="http:\/\/www.w3.org\/1999\/xhtml" xml:lang="ja">/' nodejs.org-ja.tmp/index.html; \
	cd nodejs.org-ja.tmp; \
	zip -q0X ../nodejs.org-ja.epub mimetype; \
	zip -qXr9D ../nodejs.org-ja.epub * -x mimetype; \
	cd ..; \
	rm -f -r nodejs.org-ja.tmp

nodejs.org-ja.mobi:
	ebook-convert $(BOOKS_DIR)/nodejs.org-ja.pdf $(BOOKS_DIR)/nodejs.org-ja.mobi \
		--output-profile kindle \
		--language ja \
		--base-font-size 9 \
		--line-height 5 \
		--no-images \
		--remove-first-image \
		--cover cover.jpg

clean:
	rm -f $(BOOKS_DIR)/*
