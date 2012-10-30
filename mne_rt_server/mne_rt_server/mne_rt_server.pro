#--------------------------------------------------------------------------------------------------------------
#
# @file     mne_rt_server.pro
# @author   Christoph Dinh <chdinh@nmr.mgh.harvard.edu>;
#           Matti Hämäläinen <msh@nmr.mgh.harvard.edu>
# @version  1.0
# @date     July, 2012
#
# @section  LICENSE
#
# Copyright (C) 2012, Christoph Dinh and Matti Hamalainen. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification, are permitted provided that
# the following conditions are met:
#     * Redistributions of source code must retain the above copyright notice, this list of conditions and the
#       following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
#       the following disclaimer in the documentation and/or other materials provided with the distribution.
#     * Neither the name of the Massachusetts General Hospital nor the names of its contributors may be used
#       to endorse or promote products derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL MASSACHUSETTS GENERAL HOSPITAL BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
#
# @brief    This project file generates the makefile to build the core app source connector.
#
#--------------------------------------------------------------------------------------------------------------


TEMPLATE = app

QT += network

CONFIG   += console
CONFIG   -= app_bundle

TARGET = mne_rt_server

CONFIG(debug, debug|release) {
    TARGET = $$join(TARGET,,,d)
}

LIBS += -L$${PWD}/../../lib/
CONFIG(debug, debug|release) {
    LIBS += -lmned
    LIBS += -lfiffd
}
else {
    LIBS += -lmne
    LIBS += -lfiff
}

DESTDIR = $${PWD}/../../bin

SOURCES += \
    main.cpp \
    connectormanager.cpp \
    mne_rt_server.cpp \
    fiffstreamserver.cpp \
    fiffstreamthread.cpp \
    commandserver.cpp \
    commandthread.cpp


HEADERS += \
# has to be moved to connectors
    IConnector.h \
    connectormanager.h \
    mne_rt_server.h \
    mne_rt_server.h \
    fiffstreamserver.h \
    fiffstreamthread.h \
    commandserver.h \
    commandthread.h
