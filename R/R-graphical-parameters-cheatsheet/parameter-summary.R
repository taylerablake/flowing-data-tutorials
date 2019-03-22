#
# 
# Testing Graphical Parameters
#
#

xvalues <- 1:10
yvalues <- 1:10
sometext <- c("aaaa", "bbbb", "cccc", "dddd", "eeee", "ffff", "gggg", "hhhh", "iiii", "jjjj")
fadecol <- "#cccccc"


######################
# SYMBOL STYLES
######################


#
# pch - Point types
#

par(mfrow=c(5,5), mar=c(0,0,0,0))
for (i in 1:25) {
	plot(xvalues, yvalues, type="n", axes=FALSE, xlim=c(0,1), ylim=c(0,1))
	text(0.72, 0.5, i, cex=1.24)
	points(0.5, 0.5, pch=i, cex=3, bg="gray")
}


#
# lty - Line type
#

plot(xvalues, yvalues, type="n", axes=FALSE, ann=FALSE, ylim=c(1,9))
for (i in 1:6) {
	text(1.1, 10-i*1.5+0.25, paste("lty =", i))
	lines(c(0, 10), c(10-i*1.5, 10-i*1.5), lty=i, lwd=2)
}


#
# lwd - Line width
#

lwds <- c(0.1, 0.25, 0.5, 1, 3, 6)
plot(xvalues, yvalues, type="n", axes=FALSE, ann=FALSE, xlim=c(0,10), ylim=c(1,9))
for (i in 1:length(lwds)) {
	text(0, 10-i*1.5+0.25, paste("lwd =", lwds[i]), adj=0)
	lines(c(0, 10), c(10-i*1.5, 10-i*1.5), lwd=lwds[i])
}




######################
# TEXT AND LABELS
######################

#
# adj - Text justification, short for adjustment
#

par(mar=c(1,0,0,0))
plot(0, 0, type="n", ann=FALSE, xlim=c(-0.5, 0.5), ylim=c(-0.5,11), axes=FALSE)
lines(c(0,0), c(-1,11), lty=3, lwd=0.6)
for (curradj in seq(0, 1, 0.1)) {
	text(0, curradj*10, paste("adj equals", curradj), adj=curradj)
}


#
# ann - annotation on plot e.g. axis labels
#

par(mfrow=c(1,2))

# TRUE, default
par(ann=TRUE, fg=fadecol, col.lab="black", col.axis=fadecol)
plot(xvalues, yvalues, main="Annotated plot")

# FALSE
par(ann=FALSE, fg=fadecol, col.axis=fadecol)
plot(xvalues, yvalues)


#
# las - axis label orientation
#

par(mfrow=c(2,2), fg=fadecol, col.lab=fadecol)
for (i in 0:3) {
	plot(xvalues, yvalues, type="n", las=i, main=paste("las =", i))
}


#
# srt - Angle rotation of text added to plot
#

srts = c(0, 45, 90, 135, 180, 225)
par(mfrow=c(2,3), mar=c(0,0,4,0), fg=fadecol, col.axis=fadecol, col.lab=fadecol)
for(i in 1:length(srts)) {
	plot(0, 0, type="n", xlim=c(0,1), ylim=c(0,.75), axes=FALSE, main=paste("srt =", srts[i]))
	text(0.5, 0.5, "hello", col="black", srt=srts[i], cex=3.5)
}


#
# family - Font family for text on plot
#

par(family="mono", fg=fadecol)
plot(xvalues, yvalues, type="n", main="Various Font Familes")
text(xvalues, yvalues, sometext, col="black")
text(rev(xvalues), yvalues, sometext, col="black", family="sans")
text(rep(6, length(yvalues)), yvalues, col="black", family="serif")

#
# font - Plain, bold, italic, etc
#

fontfamilies <- c("mono", "serif", "sans")
par(mar=c(0,0,0,0), bty="n")
plot(0, 0, type="n", axes=FALSE, xlim=c(0.5,3.5), ylim=c(0.5,4.5))
for (i in 1:length(fontfamilies)) {
	for (j in 1:4) {
		text(i, 5-j, paste("Family: ", fontfamilies[i], ";\n Font: ", j, sep=""), family=fontfamilies[i], font=j, cex=1.2)	
	}
}


#
# font.lab - for x and y labels
#

par(font.lab=4, fg=fadecol, col.axis=fadecol, col.lab="black")
plot(xvalues, yvalues, type="n")


#
# font.main - for main title
#

par(font.main=1, font.lab=4, fg=fadecol, col.axis=fadecol, col.lab=fadecol)
plot(xvalues, yvalues, type="n", main="Changed main title font")


#
# font.sub - for stupid subtitle
#

par(font.sub=4, font.main=1, font.lab=4, fg=fadecol, col.axis=fadecol, col.lab=fadecol, col.main=fadecol)
plot(xvalues, yvalues, type="n", main="Changed subtitle font", sub="Changed subtitle font")


#
# lheight - Line height
#

par(mfrow=c(1,3), mar=c(0,0,3,0), lheight=1.5)
for (lh in c(1, 1.5, 2)) {
	par(lheight=lh)
	plot(0, 0, xlim=c(0,2), ylim=c(0,2), type="n", axes=FALSE, main=paste("lheight =", lh))
	text(1, 1, "Lorem ipsum dolor sit\n amet, consectetur adipiscing elit.\nIn porttitor ante blandit, sollicitudin\n libero eu,lobortis odio. Nunc justo magna,\ncongue nec convallis.", cex=1)
}



######################
# COLOR
######################

somecolors <- c("green", "blue", "gray")

#
# bg - Background color
#

par(mfrow=c(3,1))
par(bg="gray")
plot(xvalues, yvalues)
par(bg="cyan")
plot(xvalues, yvalues)

#
# fg - Foreground color i.e. symbols, box, and axes
#

par(fg="blue", col.axis=fadecol, col.lab=fadecol)
plot(xvalues, yvalues)


#
# col - Default plotting and box color
#

par(col="blue", fg=fadecol, col.axis=fadecol, col.lab=fadecol)
plot(xvalues, yvalues, main="Setting default color", col="blue")


#
# col.axis - Color for axis tick labels
#

par(col.axis="blue", col.main=fadecol, fg=fadecol, col.lab=fadecol)
plot(xvalues, yvalues, main="Set the axis color")


#
# col.lab - Color for axis name labels
#

par(col.lab="blue", col.axis=fadecol, col.main=fadecol, fg=fadecol, col.lab=fadecol)
plot(xvalues, yvalues, col.lab="blue", main="Color the axis label")


#
# col.main - Color main title
#

par(col.lab=fadecol, col.axis=fadecol, col.main="blue", fg=fadecol, col.lab=fadecol)
plot(xvalues, yvalues, main="Plot with a blue title")


#
# col.sub - Color of the useless subtitle on bottom of plot
#

par(col.sub="blue", col.lab=fadecol, col.axis=fadecol, col.main=fadecol, fg=fadecol, col.lab=fadecol)
plot(xvalues, yvalues, sub="Blue subtitle", main="Plot with stupid subtitle")




######################
# AXES ETC.
######################

#
# bty - box around the plot
#

boxtypes <- c("o", "l", "7", "c", "u", "]")
par(mfrow=c(2,3), col="blue", col.lab=fadecol, col.axis=fadecol, col.main="black", fg=fadecol, col.lab=fadecol)
for (bty in boxtypes) {
	plot(xvalues, yvalues, type="n", bty=bty, main=paste("boxtype", bty))
	box(col="black", bty=bty)
}


#
# lab - Number of tick marks for x and y axes
#

par(mfrow=c(2,2), col.axis="black", col.lab=fadecol, col=fadecol)
plot(xvalues, yvalues, type="n", lab=c(10,10,10), main="10,10")
plot(xvalues, yvalues, type="n", lab=c(1,10,10), main="1,10")
plot(xvalues, yvalues, type="n", lab=c(10,1,10), main="10,1")
plot(xvalues, yvalues, type="n", lab=c(2,2,10), main="2,2")

#
# tck - Length of tick marks as a fraction of plot height and width
#

par(mfrow=c(2,2), col.axis=fadecol, col.lab=fadecol, col=fadecol)
for (tck in c(-0.5, -0.1, 0.1, 1)) {
	plot(xvalues, yvalues, type="n", tck=tck, main=paste("tck =", tck))
}


#
# tcl - Length of tick marks as a fraction of line height
#

par(mfrow=c(2,2), col.axis=fadecol, col.lab=fadecol, col=fadecol)
for (tcl in c(-0.75, -0.2, 0.5, 1)) {
	plot(xvalues, yvalues, type="n", tcl=tcl, main=paste("tcl =", tcl))
}



######################
# Margins
######################

par(mfrow=c(1,3), col=fadecol, fg=fadecol, col.axis=fadecol, col.lab=fadecol, bg="black", col.main="white")
for (i in c(3, 5, 8)) {
	par(mar=c(i,i,i,i))
	plot(xvalues, yvalues, main=paste("Margins =", i))
}




######################
# Placement
######################

#
# mfrow - Plot multiples by row
#

par(mfrow=c(2,3), col=fadecol, fg=fadecol, col.axis=fadecol, col.lab=fadecol)
for (i in 1:6) {
	plot(xvalues, yvalues, type="n")
	text(5.5,5.5,i, cex=5, col="black")
}


#
# mfcol - Plot multiples by column
#

par(mfcol=c(2,3), col=fadecol, fg=fadecol, col.axis=fadecol, col.lab=fadecol)
for (i in 1:6) {
	plot(xvalues, yvalues, type="n")
	text(5.5,5.5,i, cex=5, col="black")
}




