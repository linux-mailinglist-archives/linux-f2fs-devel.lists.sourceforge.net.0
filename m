Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3DA1725CE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 18:59:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7NRT-0007X4-Vo; Thu, 27 Feb 2020 17:59:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j7NRS-0007Wp-EC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 17:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rcIjealSi90sMZOQsMQwcYF6kyYQ8JFq74/vnF2vem4=; b=JkdfbvaOnBGufDfsKSM/QRRZIT
 W7DSHLFRgNJLftVoKgDd1dvD7f4UCwfToVEf1vLe6gopXlPQvJ/Ogz6s9KmWyZ2J5W78K+DOOPBth
 ieHMib+PXtpGqOruipfRnq1a2nq/cK7+Jk0fXXPaUFlcePCkZE7/Yb+8gaLY2JkzvJxg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rcIjealSi90sMZOQsMQwcYF6kyYQ8JFq74/vnF2vem4=; b=jm0iHWaitgnFsBSSwC3uwMgsBV
 8TdP+9T8Ub8aOq+SHBHyJeKA+vevM2r8uJ7ZiJRskSzgKNSVXJJ0/GSVUWTpXsJYgkyTpWMpYPVRT
 8XRhCrgHknYBXpeD4tCEC+SPbJ68xRwc0FcbhYrEb0jvzSUBlUYw3+pY42212NraAqH0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7NRL-000kgR-9B
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 17:59:22 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCB65246A3;
 Thu, 27 Feb 2020 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582826344;
 bh=yuxtO3e/a768sMDv+0KsbT2pPeVNtHRCp8kO9r0yIco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DFkAvsxqy1V/ZWShlgqlvikVPya1vUke31kyn5q1UbLlHAZsz5+db0hNRYbsBZxmQ
 gLo813UATdkWf9cjFbnIzh1bpxxYgR+RrF2oljFdUVD8sMb29ahZY6sEECxxPHHQwj
 WXLaFbxLqDdGBaFMjLS/1u2nIdA/8z0BuZo2bVJE=
Date: Thu, 27 Feb 2020 09:59:04 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200227175904.GA33965@google.com>
References: <20200226164615.170424-1-jaegeuk@kernel.org>
 <ace413a8-639d-24c9-f36f-5da949be76e3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ace413a8-639d-24c9-f36f-5da949be76e3@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j7NRL-000kgR-9B
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/27, Chao Yu wrote:
> On 2020/2/27 0:46, Jaegeuk Kim wrote:
> > Let's show mounted time.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  Documentation/ABI/testing/sysfs-fs-f2fs | 5 +++++
> >  fs/f2fs/debug.c                         | 3 +++
> >  fs/f2fs/segment.c                       | 2 +-
> >  fs/f2fs/segment.h                       | 2 +-
> >  fs/f2fs/sysfs.c                         | 8 ++++++++
> >  5 files changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 1a6cd5397129..ddee45e88270 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -318,3 +318,8 @@ Date:		September 2019
> >  Contact:	"Hridya Valsaraju" <hridya@google.com>
> >  Description:	Average number of valid blocks.
> >  		Available when CONFIG_F2FS_STAT_FS=y.
> > +
> > +What:		/sys/fs/f2fs/<disk>/mounted_time
> > +Date:		February 2020
> > +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> > +Description:	Show the mounted time of this partition.
> 
> It's better to describe its unit: second, otherwise, it looks good to me.

I've added it. Thanks.

> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> > diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> > index 6b89eae5e4ca..a8cf9626f71f 100644
> > --- a/fs/f2fs/debug.c
> > +++ b/fs/f2fs/debug.c
> > @@ -301,6 +301,9 @@ static int stat_show(struct seq_file *s, void *v)
> >  			   si->ssa_area_segs, si->main_area_segs);
> >  		seq_printf(s, "(OverProv:%d Resv:%d)]\n\n",
> >  			   si->overp_segs, si->rsvd_segs);
> > +		seq_printf(s, "Current Time: %llu s / Mounted Time: %llu s\n\n",
> > +					ktime_get_boottime_seconds(),
> > +					SIT_I(si->sbi)->mounted_time);
> >  		if (test_opt(si->sbi, DISCARD))
> >  			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
> >  				si->utilization, si->valid_count, si->discard_blks);
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index fb3e531a36d2..601d67e72c50 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -4073,7 +4073,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
> >  	sit_i->dirty_sentries = 0;
> >  	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK;
> >  	sit_i->elapsed_time = le64_to_cpu(sbi->ckpt->elapsed_time);
> > -	sit_i->mounted_time = ktime_get_real_seconds();
> > +	sit_i->mounted_time = ktime_get_boottime_seconds();
> >  	init_rwsem(&sit_i->sentry_lock);
> >  	return 0;
> >  }
> > diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> > index 459dc3901a57..7a83bd530812 100644
> > --- a/fs/f2fs/segment.h
> > +++ b/fs/f2fs/segment.h
> > @@ -756,7 +756,7 @@ static inline unsigned long long get_mtime(struct f2fs_sb_info *sbi,
> >  						bool base_time)
> >  {
> >  	struct sit_info *sit_i = SIT_I(sbi);
> > -	time64_t diff, now = ktime_get_real_seconds();
> > +	time64_t diff, now = ktime_get_boottime_seconds();
> >  
> >  	if (now >= sit_i->mounted_time)
> >  		return sit_i->elapsed_time + now - sit_i->mounted_time;
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index 4e8aae03f26c..7bfbead98c04 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -187,6 +187,12 @@ static ssize_t encoding_show(struct f2fs_attr *a,
> >  	return sprintf(buf, "(none)");
> >  }
> >  
> > +static ssize_t mounted_time_show(struct f2fs_attr *a,
> > +		struct f2fs_sb_info *sbi, char *buf)
> > +{
> > +	return sprintf(buf, "%llu", SIT_I(sbi)->mounted_time);
> > +}
> > +
> >  #ifdef CONFIG_F2FS_STAT_FS
> >  static ssize_t moved_blocks_foreground_show(struct f2fs_attr *a,
> >  				struct f2fs_sb_info *sbi, char *buf)
> > @@ -546,6 +552,7 @@ F2FS_GENERAL_RO_ATTR(features);
> >  F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
> >  F2FS_GENERAL_RO_ATTR(unusable);
> >  F2FS_GENERAL_RO_ATTR(encoding);
> > +F2FS_GENERAL_RO_ATTR(mounted_time);
> >  #ifdef CONFIG_F2FS_STAT_FS
> >  F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
> >  F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
> > @@ -623,6 +630,7 @@ static struct attribute *f2fs_attrs[] = {
> >  	ATTR_LIST(reserved_blocks),
> >  	ATTR_LIST(current_reserved_blocks),
> >  	ATTR_LIST(encoding),
> > +	ATTR_LIST(mounted_time),
> >  #ifdef CONFIG_F2FS_STAT_FS
> >  	ATTR_LIST(cp_foreground_calls),
> >  	ATTR_LIST(cp_background_calls),
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
