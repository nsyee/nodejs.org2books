# nodejs.org2books
A script to convert Node.js Documentation to some E-book formats(currently pdf only). see [here](http://nodejs.org) about Node.js.

## Requirements
- [Calibre](http://calibre-ebook.com/)

If you use OSX, you need to install the command line tools, adding to installation with dmg. Go to Preferences->Advanced.

## Content
- books/nodejs.org.pdf: original documentation. [http://nodejs.org](http://nodejs.org)
- books/nodejs.org-ja.pdf: Japanese translation. [http://nodejs.jp/nodejs.org_ja](http://nodejs.jp/nodejs.org_ja)

copyrights of these belong to each organizations. see web sites above.

## How to compile
After installing requirements, run following commands.

	# get resources.
	$git submodule update --init

	# publish a books/nodejs.org.pdf.
	$cd nodejs.org/doc
	$./configure
	$make doc
	$cd -
	$make

	# publish a books/nodejs.org-ja.pdf
	$make ja
