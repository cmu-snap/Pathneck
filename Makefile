#****************************************************************************
#  Pathneck: locating network path bottlenecks
#  Copyright (C) 2004
#  Ningning Hu and the Carnegie Mellon University
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License (in the COPYING file) for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#****************************************************************************

# this file applies to both Linux and MAC

CC 	= gcc 
INCS 	= -I. 
DEFS 	=
OBJS	= get-line.o util.o
OBJS_ALL= $(OBJS) choke.o pathneck.o

CFLAGS 	= -g -Wall $(DEFS) $(INCS)
LIBS 	= 

.c.o:
	@rm -f $@
	$(CC) $(CFLAGS) -c $*.c

all: pathneck get-choke

pathneck: $(OBJS_ALL)
	@rm -f $@
	$(CC) $(CFLAGS) -o $@ $(OBJS_ALL) $(LIBS)

clean:
	rm -f *.o pathneck get-choke
