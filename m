Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86932553806
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jun 2022 18:39:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o3guv-0000ko-A2; Tue, 21 Jun 2022 16:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o3gui-0000kX-I8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jun 2022 16:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mSwe1bJrqHDJTNeLQh9IIVbXf0exN5f/H0UIM6DcqUk=; b=EvOaQ2RaDUItnsAkK3YS2yrQB6
 uvI567CLWk9Kdz9Ul/2Hm8BUPF4luqq03BgZE2c89rhguJIdStDgcyhAqo5FTmQ/ALKdsVURAdzbm
 65GJ9v0E95dNN9xmmA1zNjqpRdMMzxYdlNYPNuKY6Lh0Qj1Cm9pjjMJBlhDir+VxXrDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mSwe1bJrqHDJTNeLQh9IIVbXf0exN5f/H0UIM6DcqUk=; b=YL8Q9Rlf0VSvu22wWo5Iu/Eec0
 5kAdRHkEoR3OsTW0yGljlLOxPyooyC7oByBB9EaYwlHiJrcsvS6qHWG+O2oxwsKHRVQQz4iMAGYQv
 MWRJdeujT6+dpL58KHxvDWNNtHOexUHTw96LKR95j64LK0QIfE+38glgQNO4vpaIcxZk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o3gud-009Z0A-CJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jun 2022 16:39:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2A726151C;
 Tue, 21 Jun 2022 16:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C602C3411C;
 Tue, 21 Jun 2022 16:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655829569;
 bh=Tlm3/IJ2QuFpVbT58kw0ypDAcLjmg4xZKjrT6jNg/3I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKfrMK/k83a5B4dEBKNANIq7Eb41yJ4bIB8YC52DH8Ybo/oz62R1+2aoFibe6PQAh
 W9fjCXQkHJRsWmX1me6Za9N2v2sUmbx0lGMeAiC/DkbrPwrWuJmrKxnKm1QF1rmMK8
 oDbZoRiE2U67pr9JiQ97+0FkUBW5adMLQwwFXJhA4MIGVNc436cnkWpJC5PTzXJncq
 7VEhOXLLSiGdVmFkfoLZPR+VGs1BIwOy4CINgNTUU50ilJiLljxemblHMzvH0vQjMR
 /jv2mMD9zHTrcKoNIOt5Kn4AZ3e07Sj69jC2eRRS+14ylIeDOxf4ieBd1H826FAUy7
 XIH0sOu9dRFJw==
Date: Tue, 21 Jun 2022 09:39:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ben Chang <ben.chang@sonicsky.net>
Message-ID: <YrH0P0jvYooUFAln@google.com>
References: <20220620035301.63951-1-ben.chang@sonicsky.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220620035301.63951-1-ben.chang@sonicsky.net>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Thanks, applied. On 06/20, Ben Chang wrote: > Some device
 like android phone doesn't show the dev number path in > /dev/block/, for
 example: > > $ ls /dev/block/ > bootdevice dm-6 loop24 loop43 ram13 sda5 sdd4
 sde24 s [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o3gud-009Z0A-CJ
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: fix cannot get bdev information
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Thanks, applied.

On 06/20, Ben Chang wrote:
> Some device like android phone doesn't show the dev number path in
> /dev/block/, for example:
> 
> $ ls /dev/block/
> bootdevice  dm-6    loop24  loop43    ram13  sda5  sdd4   sde24  sde43  sde62  sdf1
> by-name     dm-7    loop25  loop44    ram14  sda6  sdd5   sde25  sde44  sde63  sdf10
> dm-0        dm-8    loop26  loop45    ram15  sda7  sdd6   sde26  sde45  sde64  sdf11
> dm-1        dm-9    loop27  loop46    ram2   sda8  sdd7   sde27  sde46  sde65  sdf12
> dm-10       loop0   loop28  loop47    ram3   sda9  sde    sde28  sde47  sde66  sdf13
> dm-11       loop1   loop29  loop48    ram4   sdb   sde1   sde29  sde48  sde67  sdf14
> dm-12       loop10  loop3   loop49    ram5   sdb1  sde10  sde3   sde49  sde68  sdf15
> dm-13       loop11  loop30  loop5     ram6   sdb2  sde11  sde30  sde5   sde69  sdf16
> dm-14       loop12  loop31  loop50    ram7   sdb3  sde12  sde31  sde50  sde7   sdf17
> dm-15       loop13  loop32  loop51    ram8   sdb4  sde13  sde32  sde51  sde70  sdf18
> dm-16       loop14  loop33  loop6     ram9   sdb5  sde14  sde33  sde52  sde71  sdf19
> dm-17       loop15  loop34  loop7     sda    sdc   sde15  sde34  sde53  sde72  sdf2
> dm-18       loop16  loop35  loop8     sda1   sdc1  sde16  sde35  sde54  sde73  sdf3
> dm-19       loop17  loop36  loop9     sda10  sdc2  sde17  sde36  sde55  sde74  sdf4
> dm-2        loop18  loop37  mapper    sda11  sdc3  sde18  sde37  sde56  sde75  sdf5
> dm-20       loop19  loop38  platform  sda12  sdc4  sde19  sde38  sde57  sde76  sdf6
> dm-21       loop2   loop39  ram0      sda13  sdc5  sde2   sde39  sde58  sde77  sdf7
> dm-3        loop20  loop4   ram1      sda14  sdd   sde20  sde4   sde59  sde78  sdf8
> dm-4        loop21  loop40  ram10     sda2   sdd1  sde21  sde40  sde6   sde8   sdf9
> dm-5        loop22  loop41  ram11     sda3   sdd2  sde22  sde41  sde60  sde9   vold
> dm-53       loop23  loop42  ram12     sda4   sdd3  sde23  sde42  sde61  sdf    zram0
> 
> this will cause stat_bdev cannot show bdev information.
> 
> But most of devices (include android) show dev number path in /sys/dev/block, for example:
> 
> $ ls  /sys/dev/block
> 1:0    254:1   254:6   259:21  259:38  259:54  7:104  7:24   7:368  8:11  8:4   8:70  8:87
> 1:1    254:10  254:7   259:22  259:39  259:55  7:112  7:240  7:376  8:12  8:48  8:71  8:88
> 1:10   254:11  254:8   259:23  259:4   259:56  7:120  7:248  7:384  8:13  8:49  8:72  8:89
> 1:11   254:12  254:9   259:24  259:40  259:57  7:128  7:256  7:392  8:14  8:5   8:73  8:9
> 1:12   254:13  259:0   259:25  259:41  259:58  7:136  7:264  7:40   8:16  8:50  8:74  8:90
> 1:13   254:14  259:1   259:26  259:42  259:59  7:144  7:272  7:400  8:17  8:51  8:75  8:91
> 1:14   254:15  259:10  259:27  259:43  259:6   7:152  7:280  7:408  8:18  8:52  8:76  8:92
> 1:15   254:16  259:11  259:28  259:44  259:60  7:16   7:288  7:48   8:19  8:53  8:77  8:93
> 1:2    254:17  259:12  259:29  259:45  259:61  7:160  7:296  7:56   8:2   8:54  8:78  8:94
> 1:3    254:18  259:13  259:3   259:46  259:62  7:168  7:304  7:64   8:20  8:55  8:79  8:95
> 1:4    254:19  259:14  259:30  259:47  259:63  7:176  7:312  7:72   8:21  8:6   8:8
> 1:5    254:2   259:15  259:31  259:48  259:64  7:184  7:32   7:8    8:3   8:64  8:80
> 1:6    254:20  259:16  259:32  259:49  259:65  7:192  7:320  7:80   8:32  8:65  8:81
> 1:7    254:21  259:17  259:33  259:5   259:66  7:200  7:328  7:88   8:33  8:66  8:82
> 1:8    254:3   259:18  259:34  259:50  259:7   7:208  7:336  7:96   8:34  8:67  8:83
> 1:9    254:4   259:19  259:35  259:51  259:8   7:216  7:344  8:0    8:35  8:68  8:84
> 253:0  254:5   259:2   259:36  259:52  259:9   7:224  7:352  8:1    8:36  8:69  8:85
> 254:0  254:53  259:20  259:37  259:53  7:0     7:232  7:360  8:10   8:37  8:7   8:86
> 
> so change the access path from /dev/block to /sys/dev/block
> (same method of libudev)
> 
> Before:
> 
> $./f2fs.fibmap testfile_4k
> 
> ----------------file info-------------------
> testfile_4k :
> --------------------------------------------
> dev       [254:53]
> ino       [0x    3dda : 15834]
> mode      [0x    81b6 : 33206]
> nlink     [0x       1 : 1]
> uid       [0x       0 : 0]
> gid       [0x       0 : 0]
> size      [0x   40000 : 262144]
> blksize   [0x    1000 : 4096]
> blocks    [0x     200 : 512]
> --------------------------------------------
> 
> file_pos   start_blk     end_blk        blks
>        0     2256926     2256987          62
>   253952     2150337     2150338           2
> 
> Patched:
> $./f2fs.fibmap testfile_4k
> ----------------bdev info-------------------
> devname = 254:53
> start_lba = 0
> 
> ----------------file info-------------------
> testfile_4k :
> --------------------------------------------
> dev       [254:53]
> ino       [0x    3dda : 15834]
> mode      [0x    81b6 : 33206]
> nlink     [0x       1 : 1]
> uid       [0x       0 : 0]
> gid       [0x       0 : 0]
> size      [0x   40000 : 262144]
> blksize   [0x    1000 : 4096]
> blocks    [0x     200 : 512]
> --------------------------------------------
> 
> file_pos   start_blk     end_blk        blks
>        0     2256926     2256987          62
>   253952     2150337     2150338           2
> 
> Signed-off-by: Ben Chang <ben.chang@sonicsky.net>
> ---
>  tools/fibmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/fibmap.c b/tools/fibmap.c
> index 3238f29..9f94b53 100644
> --- a/tools/fibmap.c
> +++ b/tools/fibmap.c
> @@ -102,7 +102,7 @@ static void stat_bdev(struct stat *st, unsigned int *start_lba)
>  	char linkname[32] = { 0, };
>  	int fd;
>  
> -	sprintf(devname, "/dev/block/%d:%d", major(st->st_dev), minor(st->st_dev));
> +	sprintf(devname, "/sys/dev/block/%d:%d", major(st->st_dev), minor(st->st_dev));
>  
>  	fd = open(devname, O_RDONLY);
>  	if (fd < 0)
> -- 
> 2.25.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
