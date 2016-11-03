
require "open3"


class SeewtController < ApplicationController

  # @@vjs_cdn_url = "http://vjs.zencdn.net/5.11.9/video.js"
  # @@vjshls_cdn_url = "https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/3.6.6/videojs-contrib-hls.min.js"

  def welcome
    @banner_vtname = "zhuixiongzheye"
    @banner1_vtname = "zhenzhengnanzihan_20161028"
    @banner2_vtname = "dulirier_juantuchonglai"
  end

  def index
    @banner_vtname = "zhuixiongzheye"
    @banner1_vtname = "zhenzhengnanzihan_20161028"
    @banner2_vtname = "dulirier_juantuchonglai"

    @hot_vtname = "babaqunaersi_20161028"
    @hot2_vtname = "zhuixiongzheye"
    @hot3_vtname = "dulirier_juantuchonglai"
    @hot4_vtname = "jingtianmodaotuaner"
    @hot5_vtname = "fushanxing"
    @hot6_vtname = "yinianjibiyeji_20161029"
    @hot7_vtname = "xibushijiedijiyi"
  end

  def drama

  end

  def movie

  end

  def tv_show

  end

  def single
    @vtname = params[:tname]
  end

  def album
    @vtname = params[:tname]
  end

  def videojs_play

    tname = params[:tname]

    # p "tname@videojs_play: " + tname 

    @vjs_cdn_url = "http://vjs.zencdn.net/5.11.9/video.js"
    @vjshls_cdn_url = "https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/3.6.6/videojs-contrib-hls.min.js"

    @vname = ""
    @vurl = ""
    @vtype = ""

    #parese temp video name, get real video name, real video type, real video url
    parse_video_tname(tname)

  end

  def parse_video_tname(tname)

    #production solution
    #tname = vid@database ? => get @vname, @vtype, @vurl from database
    # ???

    case tname
    when "yinianjibiyeji_20161029"
      #pp "gotp_vid: " + vid
      @vurl = youtbe_parse_turl "https://www.youtube.com/watch?v=MpmTen3M39M"
      @vtype = "video/mp4"
      p "@vurl: " + @vurl
      @vname = "测试"
      
    when "youtube"
      #pp "youtube"
      @vurl = youtube_vid_to_url vid
      @vtype = "video/mp4"
    when "iqiyi"
      @vurl = iqiyi_vid_to_url vid
      # @vurl = "http://f24hls-i.akamaihd.net/hls/live/221193/F24_EN_LO_HLS/master_1200.m3u8"
      # @vurl = "http://k.youku.com/player/getFlvPath/sid/3472005488780128fe779_00/st/flv/fileid/0300010F0E57BA7A0186132BEEFCF919991AFE-0280-727C-DD75-7F597FD5DECD?ypp=0&myp=0&K=5b8d985c3f8085ad2412b7af&ctype=12&token=1704&ev=1&ep=cSaTGEmNU8oI7STXiD8bb3q3c3AGXP4J9h%2BFgNIUAM4hT5rOnk%2FRxpW2T%2FxAZIxsBFFwGer4otnmGzZhYfBBoWgQ2EyvSvqUivfm5aolwZkHEG0zBrikwFSfRDD1&hd=1&oip=1857209301"
      @vtype = "application/x-mpegURL"
      #@vtype = "application/vnd.apple.mpegurl"
    when "baidupcs"
      @vurl = baidupcs_vid_to_url vid
      @vtype = "video/mp4"
    when "test"
      @vurl = ""
      @vtype = ""
    else
      #temporary solution for baidupcs
      bdpcs = "https://pcs.baidu.com/rest/2.0/pcs/stream?method=download&"
      bd_access_token = "access_token=23.3c473ff6aea5aafe94bfc16a2ee1cd8b.2592000.1480200057.2644256190-2293434&"
      bd_vpath = "path=%2Fapps%2FSyncY%2Fseewhat%2Fmovies%2F"
      bd_vpath = bd_vpath + tname + ".mp4"
      @vtype = "video/mp4"
      @vurl = bdpcs + bd_access_token + bd_vpath
      p "@vurl: " + @vurl
      @vname = "测试"
    end
    

  end

  def videojs_play_old_ref

    parts = File.basename(request.fullpath).partition("_")
    web = parts[0]
    vid = parts[2].partition("video-")[2]
    pp "vid: "+ vid
    @vurl = ""
    #video type: type="application/x-mpegURL", type="video/mp4"
    @vtype = "video/mp4"
    
    case web
    when "gotp"
      #pp "gotp_vid: " + vid
      @vurl = gotp_vid_to_url vid
      @vtype = "video/mp4"
    when "youtube"
      #pp "youtube"
      @vurl = youtube_vid_to_url vid
      @vtype = "video/mp4"
    when "iqiyi"
      @vurl = iqiyi_vid_to_url vid
      # @vurl = "http://f24hls-i.akamaihd.net/hls/live/221193/F24_EN_LO_HLS/master_1200.m3u8"
      # @vurl = "http://k.youku.com/player/getFlvPath/sid/3472005488780128fe779_00/st/flv/fileid/0300010F0E57BA7A0186132BEEFCF919991AFE-0280-727C-DD75-7F597FD5DECD?ypp=0&myp=0&K=5b8d985c3f8085ad2412b7af&ctype=12&token=1704&ev=1&ep=cSaTGEmNU8oI7STXiD8bb3q3c3AGXP4J9h%2BFgNIUAM4hT5rOnk%2FRxpW2T%2FxAZIxsBFFwGer4otnmGzZhYfBBoWgQ2EyvSvqUivfm5aolwZkHEG0zBrikwFSfRDD1&hd=1&oip=1857209301"
      @vtype = "application/x-mpegURL"
      #@vtype = "application/vnd.apple.mpegurl"
    when "baidupcs"
      @vurl = baidupcs_vid_to_url vid
      @vtype = "video/mp4"
    when "test"
      @vurl = ""
      @vtype = ""
      
    end
    
  end

  def youtbe_parse_turl(turl, options="")
    stdin, stdout, stderr = Open3.popen3("/usr/local/bin/youtube-dl -g #{turl} #{options}")
    url = stdout.readlines[0].chomp
    #pp url
    url
  end

end
