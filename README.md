# nodejs.org2books
A script to convert Node.js documentation to some E-book formats(pdf/epub/mobi).

This allows you to refer API docs with mobile platforms like iOS/Android/Kindle.

see [here](http://nodejs.org) about Node.js.

## Requirements
- [Calibre](http://calibre-ebook.com/)

If you use OSX, you need to install the command line tools, adding to installation with dmg. Go to Preferences->Advanced.

## Content
- books/nodejs.org.(pdf|epub|mobi): original documentation. [http://nodejs.org](http://nodejs.org)
- books/nodejs.org-ja.(pdf|epub|mobi): Japanese translation. [http://nodejs.jp/nodejs.org_ja](http://nodejs.jp/nodejs.org_ja)

note: epub and mobi are alpha quality currently. Copyrights of these belong to each organizations. see web sites above.

## How to compile
After installing requirements, run following commands.

	# get resources.
	$git clone http://github.com/nsyee/nodejs.org2books.git
	$cd nodejs.org2books
	$git submodule update --init

	# publish a books/nodejs.org.pdf.
	$cd nodejs.org
	$./configure
	$make doc
	$cd -
	$make

	# publish a books/nodejs.org-ja.pdf
	$make ja
