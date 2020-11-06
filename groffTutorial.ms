
.TL
Groff cheatsheet
.AU
Subhaditya Mukherjee

www.github.com/SubhadityaMukherjee 
.NH
Introduction
.LP
Groff is a minimalistic text editor. Something like latex/markdown. 
As far as I know, it exists preinstalled in most Linux distributions.
Why not use docs/markdown/latex? You could. But this is pretty easy for most things. Especially if you quickly need to create a text based PDF document with formatting and everything but you don't want to think too much.

.NH
This cheatsheet?
.LP
.I
This was also made using groff.
.LP
I will aim to go through the documentation and list down some things I find useful here. Note that this is not extensive by any means.
If you want a super extensive list just refer to 
.B "man 7 groff" 
on your terminal.

.NH
Setup
.RS 
.IP 1.
Firstly check if groff is installed by going to the terminal and typing 'man groff'
.IP 2.
Then create a file with an extension of .ms if you dont have tables in your document. Or .me if you do.
.IP 3.
To compile the document into a PDF file we need to run the command 'groff -ms temp.ms -Tpdf > temp.pdf'.

Note that we pipe it because groff outputs to terminal otherwise.

.IP 4.
If you are using vim, you can automate this saving bit very easily.

Just go to your ~/.vimrc file and add these lines.

au BufWritePost,BufFilePost *.ms !groff -ms % -T pdf > %:r.pdf 

au BufWritePost,BufFilePost *.me !tbl % | groff -me -T pdf > %:r.pdf 

.IP 5.
How to write them in the file?
.IP
Add them like this: 

 .TL
 This is the title
 .LP
 Hello world

.IP 6.
You can then open the .pdf with whatever you use. (I use zathura).
.RE

.NH 
Basics 

.NH 2 
Title
.LP
This will create a title. Like this document
    .TL
.NH 2 
Author
.LP
This will add an author.
    .AU

.NH 2 
Indented Paragraph
.LP
This create an indent with a number . at the start. Like this list.
    .IP 1.

.NH 2 
Headers
.LP
This creates the next heading and autonumbers it. The number after it determines level. eg. 1 for something like 1.0, 2.0 and 2 for something like 1.1, 2.1 etc
    .NH 1

.NH 2 
Indented List
.LP
If you have a list you want to indent. 
    .RS
    .IP 1.
    .IP 2.
    .RE

.NH 2 
Convert to bold.
.LP
If you want to convert to 
.B
bold.
.LP
    .B
    hello

.NH 2 
Convert to 
.I
italic.
.LP
If you want to convert to italic.
    .I
    hello

.NH 2 
Add 
.UL "underline".
.LP
If you want to add underlines.
    .UL "Underlined"

.NH 2 
Comments
.LP
This adds a comment to a line
    \\" comment

.NH 2 
Boxes
.LP
.BX "Add box around text."
.B1
    .B1
    hello
    .B2
.B2
.NH 2 
Page break
.LP
This creates a page break.
    \.bp

.NH 2 
Add images
.LP
Adds images. (Note: only accepts .eps files. So convert it using imageMagick. Eg: convert temp.jpg temp.eps)
.PSPIC -L "house.eps"
        .PSPIC -L "house.eps"
.LP
To make things go faster you can use this command in your vimrc

groff -e -ms % -Tps > %:r.ps && ps2pdf %:r.ps %:r.pdf

.NH 2
Table of contents!
.LP
        .XS 1
        heading
        .XA 2 
        heading 2
        .XE

        .TC
        .bp



---------------------------------------------------------------- 

.NH
Equations
.EQ
y = 3x + 1000
.EN
.LP
This adds any kind of equations.
        .EQ
        y = 3x + 1000
        .EN
        .LP
            
.NH 2 
Add super/subscript
.EQ
y = 3 sup{ phi +100}
.EN
This adds superscripts/subscripts. To write greek write the name of the letter.
        .EQ
        y = 3 sup{ phi + 100}   "\\or sub for subscript
        .EN
        .LP

.NH 2
To add a division type thing.
.EQ
y = {1 + sqrt 5} over {2+x}
.EN

        .EQ
        y = {1 + sqrt 5} over {2+x}
        .EN
.NH 2
To add sum over.
.EQ
y = sqrt {
{sum from i=1 to N (x sub i - x bar ) sup 2}
over 
x-1
}
.EN

        .EQ
        y = sqrt {
        {sum from i=1 to N (x sub i - x bar ) sup 2}
        over {x-1}
        .EN

.NH 2
To add integral 
.EQ
pi = int from -1 to 1 dx over sqrt {1-x sup 2}
.EN

        .EQ
        pi = int from -1 to 1 dx over sqrt {1-x sup 2}
        .EN

.NH 2
To add text replacement shortcuts.
.EQ
define disc `b sup 2 -4ac`
2* disc
.EN
.EQ
3* disc
.EN

.NH 2
Inline equations
.EQ
delim $$
.EN
.PP
This is a text where I can add $3 alpha + 10 beta = 4p$
.LP
        .EQ
        delim $$
        .EN
        .PP
        This $3 alpha + 10 beta = 4p$




