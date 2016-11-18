
require "open-uri"
require "open3"
require "pp"


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

    @hot_vtname = "babaqunaerdisiji_20161028"
    @hot2_vtname = "zhuixiongzheye"
    @hot3_vtname = "dulirier_juantuchonglai"
    @hot4_vtname = "jingtianmodaotuaner"
    @hot5_vtname = "fushanxing"
    @hot6_vtname = "yinianjibiyeji_20161029"
    @hot7_vtname = "xibushijiedijiyi"

    @kankan_vtnames = []
    @kankan_vtnames[0] = "daomengkongjian"
    @kankan_vtnames[1] = "xingjichuanyue"
    @kankan_vtnames[2] = "jingtiandanizhuan"
    @kankan_vtnames[3] = "xingjichuanyue"
    @kankan_vtnames[4] = "xingjichuanyue"
    @kankan_vtnames[5] = "xingjichuanyue"
    @kankan_vtnames[6] = "xingjichuanyue"

    @kankan_vdetails = []
    @kankan_vsummaries = []
    @kankan_vtnames.each_index do |idx|
      @kankan_vdetails[idx] = VideoDetail.find_by vtname: @kankan_vtnames[idx]
      @kankan_vsummaries[idx] = VideoSummary.find_by vtname: @kankan_vtnames[idx]
      # p "idx:" + idx.inspect
      # p "@kankan_vtnames[idx]:" + @kankan_vtnames[idx].inspect
      # p "@kankan_vsummaries[idx]:" + @kankan_vsummaries[idx].inspect
      # p "@kankan_vdetails[idx]:" + @kankan_vdetails[idx].inspect
    end

    p VideoDetail.all.inspect

  end

  def drama

  end

  def movie

  end

  def tv_show

  end

  def weekly_display
    @weekly_vtname = "duzhan"
    @weekly2_vtname = "saodu"
    @weekly3_vtname = "bianjingfengyun"
  end

  def playtemp
    # @temp_vurl = youtbe_parse_turl "https://www.youtube.com/watch?v=5KKTY9KLI8o"
    # p "@temp_vurl:" + @temp_vurl
    @url = test_http "https://api.openload.co/1/file/dlticket?file=2Uror4ytvdg&login=bb285d7b4b2d2b16&key=AlNN_XAl"
    p "@url: " + @url
  end

  def single
    @vtname = params[:tname]
  end

  def album
    @vtname = params[:tname]
  end

  def videojs_play

    # p "request.location.inspect: " + request.location.address.inspect
    # p "request.location.inspect: " + request.location.city.inspect
    # p "request.location.inspect: " + request.location.country.inspect
    # p "request.location.inspect: " + request.location.country_code.inspect
    # p "request.location.inspect: " + request.location.state.inspect
    # p "request.location.inspect: " + request.location.state_code.inspect

    @country_code = request.location.country_code

    # url = URI.parse("https://www.youtube.com/watch?v=7J0fRj04s8U")
    # req = Net::HTTP.new(url.host, url.port)
    # req.use_ssl = true
    # res = req.request_head(url.path)
    # p "res.code: " + res.code.inspect
    # "success: 200"

    tname = params[:tname]

    # p "tname@videojs_play: " + tname 

    @vjs_cdn_url = "http://vjs.zencdn.net/5.11.9/video.js"
    @vjshls_cdn_url = "https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/3.6.6/videojs-contrib-hls.min.js"

    # @vname = ""
    @vurl = ""
    # @vtype = ""

    @vsummary = VideoSummary.find_by vtname: tname
    @vdetail = VideoDetail.find_by vtname: tname

    if "CN" == @country_code
      # use baidupcs
      @vurl = bdpcs_parse_vurl tname
    else
      
      # use youtube, baidupcs backup

      @vurl = youtube_parse_vurl @vsummary.vurl
      # @vurl = youtube_parse_vurl "https://www.youtube.com/watch?v=7J0fRj04s8U"

      if "" == @vurl
        @vurl = bdpcs_parse_vurl tname
      end

    end

    # if nil != @vsummary
    #   case @vsummary.vweb
    #   when "baidupcs"
    #     @vurl = bdpcs_parse_vurl tname
    #   when "youtube"
    #     @vurl = youtube_parese_vurl tname
    #   else

    #   end
    # end

    #parese temp video name, get real video name, real video type, real video url
    #parse_video_tname(tname)

    # p "@vurl: " + @vurl
    # p "@vsummary: " + @vsummary.inspect
    # p "@vdetail: " + @vdetail.inspect

  end

  def test_http turl
    user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36"
    # html = open(turl, "User-Agent" => user_agent)  
    # pp html 
    # doc = Nokogiri::HTML(html)
    # #pp doc.inner_html.class
    # File.open("/opt/ISSC/gotp.html","w") { |f|
    #   doc.inner_html.each_line { |line|
    #     f.puts line
    #   }
    # }
    # url = doc.css("#html5-player")[0].attribute("src").value

    # res = Net::HTTP.get URI("https://api.openload.co/1/file/dlticket?file=2Uror4ytvdg&login=bb285d7b4b2d2b16&key=AlNN_XAl")
    # p "res: " + res
    # res_hash = JSON.parse res
    # pp res_hash
    # ticket = res_hash["result"]["ticket"]
    # req = "https://api.openload.co/1/file/dl?file=2Uror4ytvdg&ticket=" + ticket
    # p "req: " + req
    # url_res = Net::HTTP.get URI(req)
    # url_hash = JSON.parse url_res
    # pp res_hash
    # url = url_hash["result"]["url"]
    # p "url: " + url
    # "https://api.openload.co/1/file/dl?file=2Uror4ytvdg&ticket=2Uror4ytvdg~bb285d7b4b2d2b16~1478911279~def~Cl6elajknk_DkidI~1~7K2mvwn_L8qj_bjr"
    # url

    @vjs_cdn_url = "http://vjs.zencdn.net/5.11.9/video.js"
    @vjshls_cdn_url = "https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/3.6.6/videojs-contrib-hls.min.js"

  end

  def check_url_available turl
    # false == test "https://www.youtube.com/watch?v=7J0fRj04s8U" LaoPaoEr
    url = URI.parse(turl)
    req = Net::HTTP.new(url.host, url.port)
    if turl.start_with? "https"
      req.use_ssl = true
    end
    res = req.request_head(url.path)
    p "check_url_available result: " + res.code.inspect
    url_availabe = false
    if "200" == res.code
      url_availabe = true
    end

    url_availabe
  end

  def bdpcs_parse_vurl tname
    bdpcs = "https://pcs.baidu.com/rest/2.0/pcs/stream?method=download&"
    bd_access_token = "access_token=23.3c473ff6aea5aafe94bfc16a2ee1cd8b.2592000.1480200057.2644256190-2293434&"
    bd_vpath = "path=%2Fapps%2FSyncY%2Fseewhat%2F" + @vsummary.vclass + "%2F"
    bd_vpath = bd_vpath + tname + "." + @vsummary.vfileext
    # @vtype = "video/mp4"
    url = bdpcs + bd_access_token + bd_vpath
    # p "@vurl: " + @vurl
    # @vname = "测试"
  end

  def youtube_parse_vurl turl, options=""
    stdin, stdout, stderr = Open3.popen3("/usr/local/bin/youtube-dl -g #{turl} #{options}")
    tstring = stdout.readlines[0]
    # p "tstring: "+ tstring.inspect
    url = ""
    if nil != tstring
      url = tstring.chomp
    end
    url
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

  def append_one_record_into_video_summaries

    # t.integer :vid
    # t.string :vtname
    # t.string :vname
    # t.string :vtitle
    # t.string :vlanguage
    # t.string :vclass
    # t.string :vtype
    # t.string :vweb
    # t.string :vurl
    # t.integer :vurl_update_time
    # t.string :vdomain
    # t.string :vpath
    # t.string :vfilename
    # t.string :vfileext
    # t.string :vbanner_url
    # t.string :vsmall_poster_url
    # t.string :vmid_poster_url
    # t.string :vlarge_poster_url
    # t.integer :vupload_time

    trecord = VideoSummary.new
    trecord.vid = 1
    trecord.vtname = "zhuixiongzheye"
    trecord.vname = "追凶者也"
    trecord.vtitle = "追凶者也"
    trecord.vlanguage = "chinese"
    trecord.vclass = "movie"
    trecord.vtype = "video/mp4"
    trecord.vweb = "baidupcs"
    trecord.vurl = "https://pcs.baidu.com/rest/2.0/pcs/stream?method=download&access_token=23.3c473ff6aea5aafe94bfc16a2ee1cd8b.2592000.1480200057.2644256190-2293434&path=%2Fapps%2FSyncY%2Fseewhat%2Fmovies%2Fzhuixiongzheye.mp4"
    trecord.vurl_update_time = 0
    trecord.vdomain = "pcs.baidu.com?"
    trecord.vpath = ".../app/..."
    trecord.vfilename = "zhuixiongzheye"
    trecord.vfileext = "mp4"
    trecord.vbanner_url = "zhuixiongzheye_banner.jpg"
    trecord.vsmall_poster_url = "zhuixiongzheye_small_poster.jpg"
    trecord.vmid_poster_url = "zhuixiongzheye_small_poster.jpg"
    trecord.vlarge_poster_url = "zhuixiongzheye_small_poster.jpg"
    trecord.vupload_time = "10/31/2016"
    trecord.vothers = ""

    trecord.save


  end

end
