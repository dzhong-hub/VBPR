"""Python module calls the PCI Geomatica algorithms"""

# Import necessary PCI Geomatica modules

from pci.pcimod import pcimod

from pci.fimport import fimport
from pci.fexport import fexport

from pci.poly2ras import *
from pci.clip import *
from pci.reproj import *
from pci.mergeband import *

from pci.inscoreg import inscoreg

# import os

# add new image channels to existing file
def add_channels(file,channels):
    # file = r"c:\data\image.pix"
    # channels = [0,1,0,0] #add 0 8bit, 1 16bit signed, 0 16bit unsigned and 0 32bit real channels
    pcimod(file, "ADD", channels)
    return 'add channels done'

# delete image channel(s) from existing file
def delete_channels(file,channels):
    # file = r"c:\data\image.pix"
    # channels = [1,4,6] #delete channels 1, 4 and 6
    pcimod(file, "DEL", channels)
    return 'delete channels done'

# convert jp2 image file to tif image file
def call_mergeband(in_image_list,out_image):
    mfile	=	in_image_list
    filo	=	out_image
    rpcfile	= ""

    mergeband( mfile, filo, rpcfile )
    return 'call_mergeband done'

# convert envi image file to pix image file
def envi2pix(envi_hdr,pix_image):
    fili = envi_hdr
    filo = pix_image
    dbiw = []
    poption = "OFF"
    dblayout = ""		#Defaults to "BAND"
    fimport(fili, filo, dbiw, poption, dblayout)
    return 'envi2pix done'

# convert jp2 image file to tif image file
def call_fimport(in_image,out_image):
    fili = in_image
    filo = out_image
    dbiw = []
    poption = "OFF"
    dblayout = ""		#Defaults to "BAND"
    fimport(fili, filo, dbiw, poption, dblayout)
    return 'call_fimport done'

# export the class data channel to a seperate file
def call_fexport(in_image,out_image,file_type):
    fili	=	in_image
    filo	=	out_image
    dbiw	=	[]
    dbic	=	[]         
    dbib	=	[]
    dbvs	=	[]
    dblut	=	[]
    dbpct	=	[]
    ftype	=	file_type
    foptions	= ""

    fexport( fili, filo, dbiw, dbic, dbib, dbvs, dblut, dbpct, ftype, foptions )
    return 'export_file done'


# extract subset image or clip input an input image using a reference file
def call_clip(s_fili,o_filo,o_ftype,i_clipfil):
    fili = s_fili
    dbic = [1]
    dbsl = []
    sltype = "ALL"
    filo = o_filo
    ftype = "TIF"
    foptions = ""
    clipmeth = "FILE"
    clipfil = i_clipfil
    cliplay = []
    laybnds = "SHAPES"
    coordtyp = ""
    clipul = ""
    cliplr = ""
    clipwh = ""
    initvalu = [0]
    setnodat = "Y";
    oclipbdy = "Y"

    clip (fili, dbic, dbsl, sltype, filo, ftype, \
    foptions, clipmeth, clipfil, cliplay, \
    laybnds, coordtyp, clipul, cliplr, \
    clipwh, initvalu, setnodat, oclipbdy )

    return 'extraction subset done'

# extract subset image or clip input an input image using defined coordinates
def call_clip2(s_fili,o_filo,o_ftype,ul,lr):
    fili = s_fili
    dbic = [1]
    dbsl = []
    sltype = "ALL"
    filo = o_filo
    ftype = "TIF"
    foptions = ""
    clipmeth = "USERCRD"
    clipfil = ""
    cliplay = []
    laybnds = "EXTENTS"
    coordtyp = "GEOEXT"
    clipul = ul
    cliplr = lr
    clipwh = ""
    initvalu = [0]
    setnodat = "Y";
    oclipbdy = "Y"

    clip (fili, dbic, dbsl, sltype, filo, ftype, \
    foptions, clipmeth, clipfil, cliplay, \
    laybnds, coordtyp, clipul, cliplr, \
    clipwh, initvalu, setnodat, oclipbdy )

    return 'extraction subset done'

# reproject an input image
def call_reproj(in_fili,out_filo,ftype):
    fili        =   in_fili     # input image file
    dbic        =   [1,2,3]     # use channel 1, 2, 3
    dbsl        =   []
    sltype      =   "All"
    filo        =   out_filo    # output image file
    ftype       =   "TIF"       # uses TIF format by default
    foptions    =   ""          # no file options are used    
    repmeth     =   "BR"        # uses bounds and resolution
    dbsz        =   []
    pxsz        =   [20,20]     # define resolution 20 x 20 meters
    maxbnds     =   "YES"         # applies the maximum bounds
    # repmeth   =   "PLR"       # uses pixel, line and resolution
    # dbsz      =   [6612,6612]     
    # pxsz      =   [20,20]     # define resolution 20 x 20 meters
    # maxbnds   =   "NO"        # applies the maximum bounds
    mapunits    =   "CanLCC"    # uses MAPUNITS defined in 'userproj.txt'
    # mapunits  =   "METER"     # 
                                # file, located in the PCI/etc/ directory
    llbounds    =   "NO"
    ulx         =   ""
    uly         =   ""
    lrx         =   ""
    lry         =   ""
    resample    =   ""      # uses NEAR by default
    proc        =   ""          # uses AUTO by default

    reproj( fili, dbic, dbsl, sltype, filo, ftype, \
    foptions, repmeth, dbsz, pxsz, maxbnds,\
    mapunits, llbounds, ulx, uly, lrx, \
    lry, resample, proc )

    return 'reprojection done'

# automatic coregistration
def call_inscoreg(ref_file, ref_band, dep_file, dep_band, dep_list, out_file):
    filref   =  ref_file        # reference file name
    dbic_ref =  ref_band        # reference input channel
    fili     =  dep_file        # dependent file name
    dbic_dep =  dep_band        # dependent input channel
    dbic     =  dep_list        # dependent input channel list
    numpts   =  []              # Number of candidate GCPs (default: 500)
    minscore =  []              # Minimum acceptance score (default: 0.75)
    searchr  =  []              # Search radius (default: 50)
    filo     =  out_file        # output file name
    
    inscoreg( filref, dbic_ref, fili, dbic_dep, dbic, numpts, minscore, searchr, filo )

    return 'inscoreg done'
