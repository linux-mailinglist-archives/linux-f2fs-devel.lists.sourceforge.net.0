Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF71170DDF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 02:29:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j77zO-0007Cw-D4; Thu, 27 Feb 2020 01:29:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j77zN-0007Ch-2r
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 01:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MIkXD+sddQLaBGxZaMwtYHEB3/QKl5imUJ0oFgyei5U=; b=mggW+6ESdeJT010/1LBIQDJMIV
 LIfe4RDZbGHCVsXoMaLYUUfV57ZmrGY2933EhAIautSP7xlCkqeBlUPBsJoKLmXak9ZnB+LptbZ48
 vyKIKbYr7f1yOBUE9TGEWK3OpjJF6O97Ev3NFzRMQAp4e2LD1TBFhiw2VWZkVZYVV4FI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MIkXD+sddQLaBGxZaMwtYHEB3/QKl5imUJ0oFgyei5U=; b=JGkwam4mB2AZyH2FafpbC8m8yw
 Nx561lJ7jbjtLW3pmI+1tt/+W9Y9Tn3hMuxlhFUGcvdTMCdokLuhN2e0wGNh9wRTgUX3Gm4RMojTe
 A7Z6h94pDqXozY0DK+x47bTaG1LP1BJlzR40J2+2IKDCUoRcT+49mWnMLjgKHbPmTtRE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j77zJ-007DSg-8Q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 01:29:21 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 470CE14D073C94A15B54;
 Thu, 27 Feb 2020 09:29:09 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Feb
 2020 09:29:06 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200226164615.170424-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ace413a8-639d-24c9-f36f-5da949be76e3@huawei.com>
Date: Thu, 27 Feb 2020 09:29:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200226164615.170424-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j77zJ-007DSg-8Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: show mounted time
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/2/27 0:46, Jaegeuk Kim wrote:
> Let's show mounted time.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 5 +++++
>  fs/f2fs/debug.c                         | 3 +++
>  fs/f2fs/segment.c                       | 2 +-
>  fs/f2fs/segment.h                       | 2 +-
>  fs/f2fs/sysfs.c                         | 8 ++++++++
>  5 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 1a6cd5397129..ddee45e88270 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -318,3 +318,8 @@ Date:		September 2019
>  Contact:	"Hridya Valsaraju" <hridya@google.com>
>  Description:	Average number of valid blocks.
>  		Available when CONFIG_F2FS_STAT_FS=y.
> +
> +What:		/sys/fs/f2fs/<disk>/mounted_time
> +Date:		February 2020
> +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> +Description:	Show the mounted time of this partition.

It's better to describe its unit: second, otherwise, it looks good to me.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index 6b89eae5e4ca..a8cf9626f71f 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -301,6 +301,9 @@ static int stat_show(struct seq_file *s, void *v)
>  			   si->ssa_area_segs, si->main_area_segs);
>  		seq_printf(s, "(OverProv:%d Resv:%d)]\n\n",
>  			   si->overp_segs, si->rsvd_segs);
> +		seq_printf(s, "Current Time: %llu s / Mounted Time: %llu s\n\n",
> +					ktime_get_boottime_seconds(),
> +					SIT_I(si->sbi)->mounted_time);
>  		if (test_opt(si->sbi, DISCARD))
>  			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
>  				si->utilization, si->valid_count, si->discard_blks);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index fb3e531a36d2..601d67e72c50 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -4073,7 +4073,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	sit_i->dirty_sentries = 0;
>  	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK;
>  	sit_i->elapsed_time = le64_to_cpu(sbi->ckpt->elapsed_time);
> -	sit_i->mounted_time = ktime_get_real_seconds();
> +	sit_i->mounted_time = ktime_get_boottime_seconds();
>  	init_rwsem(&sit_i->sentry_lock);
>  	return 0;
>  }
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 459dc3901a57..7a83bd530812 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -756,7 +756,7 @@ static inline unsigned long long get_mtime(struct f2fs_sb_info *sbi,
>  						bool base_time)
>  {
>  	struct sit_info *sit_i = SIT_I(sbi);
> -	time64_t diff, now = ktime_get_real_seconds();
> +	time64_t diff, now = ktime_get_boottime_seconds();
>  
>  	if (now >= sit_i->mounted_time)
>  		return sit_i->elapsed_time + now - sit_i->mounted_time;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 4e8aae03f26c..7bfbead98c04 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -187,6 +187,12 @@ static ssize_t encoding_show(struct f2fs_attr *a,
>  	return sprintf(buf, "(none)");
>  }
>  
> +static ssize_t mounted_time_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	return sprintf(buf, "%llu", SIT_I(sbi)->mounted_time);
> +}
> +
>  #ifdef CONFIG_F2FS_STAT_FS
>  static ssize_t moved_blocks_foreground_show(struct f2fs_attr *a,
>  				struct f2fs_sb_info *sbi, char *buf)
> @@ -546,6 +552,7 @@ F2FS_GENERAL_RO_ATTR(features);
>  F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
>  F2FS_GENERAL_RO_ATTR(unusable);
>  F2FS_GENERAL_RO_ATTR(encoding);
> +F2FS_GENERAL_RO_ATTR(mounted_time);
>  #ifdef CONFIG_F2FS_STAT_FS
>  F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
>  F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> @@ -623,6 +630,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(reserved_blocks),
>  	ATTR_LIST(current_reserved_blocks),
>  	ATTR_LIST(encoding),
> +	ATTR_LIST(mounted_time),
>  #ifdef CONFIG_F2FS_STAT_FS
>  	ATTR_LIST(cp_foreground_calls),
>  	ATTR_LIST(cp_background_calls),
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
