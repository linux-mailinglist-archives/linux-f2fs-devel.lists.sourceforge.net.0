Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E1B1407F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 18:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eB4+LokCl/hVRJ2oUrDqXYJZt+s0gXKR5yVYI4Rr7ww=; b=XeSuaUp+jQuIq0Bwf6ZqY1bZ54
	82Qhz1+o5h6JzdtJlX6X2QzPxIAXHa623o61f+hjc0AwLUqgrJbSqdqzbdwdMCh0ErGiIK/D1BhKN
	wX1VHeoziJAi5xQK7oe4vBrvmAxTZ4lg6+L1oynAIg8iQv6qXNTBplx6ksXddST+xx3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugQuS-0008W3-3b;
	Mon, 28 Jul 2025 16:41:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ugQuQ-0008Vw-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWMmnAHZILuAtKhy59wZEN0nP1v5q1sxEai0uVHl+GE=; b=SxxZEk8Pop3nWImR5hFt5TP4tu
 iqq8XYGXFJGkE3PgPX0wZOVsjaQRUwvsgKSn9brsaSckhdJJOUvWojggH1MqpVYwZEs3664b8zNNC
 rUJX2KxtX6eThmk2NEjo/a/0nTEkSW01ZwATGMDtPj5Cb9ieYH7KGVIu9OT74/48/iRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EWMmnAHZILuAtKhy59wZEN0nP1v5q1sxEai0uVHl+GE=; b=KQP7Nj9JUAwQdNqV/1XsnPBdmR
 WWLAsEUxP3jTlaFjLkDNRPu010YCuRl4RdFpAyw0bCgVAQmWfysLq0Zo4WkWKkqC8aDXD5iIpDZhi
 uYRVfZzEECGW5auZKr8fGAjMA8uBTYbNgm9/2T+ySPi9gNGJRye9ywfoeWOMYNXgGDRc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugQuN-0007iS-4o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B18CA53E30;
 Mon, 28 Jul 2025 16:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE75EC4CEE7;
 Mon, 28 Jul 2025 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753720852;
 bh=6z1DYzhMGiTdo3cVZNQD2vNNg+nClgICYhdNgBn9VzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GX5Gkh5jlBFQCYiBggX4mknonD0WD8i3HVkm0di+4XvNUN+qaWfPm+pk4RDFWO2HD
 vuh2novJwVfZhmFFkXuk6IEHOcUOhu2XqOXjr27CY1T/02McewydnZNOlLP0b3BHYr
 /KPKwIDdpZ4Oh0aXOWL+Esc7jlOLytv5btHgI/EdEUoFetMEfkekaFqH9w8pYK6nwr
 95epBjUykC7TqTGwgo8iqjtk4YTCSWHZa4uzhd4mAHz3RqkzeO9Sfg7/g7hE84XJ7e
 C1aHUm9hicQJBknQwQQXNlbf144VgzLqd+jOgkgwOW2SfaIH4z31TsYXIbzMQZfA1i
 hmKIKgB+3a3ZA==
Date: Mon, 28 Jul 2025 16:40:50 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aIeoEmbeloGR6zdV@google.com>
References: <20250718215003.2283009-1-daeho43@gmail.com>
 <6c26bcaa-7a9d-4b30-b326-90395f55e155@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c26bcaa-7a9d-4b30-b326-90395f55e155@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/22, Chao Yu wrote: > On 7/19/25 05:50,
 Daeho Jeong wrote:
 > > From: Daeho Jeong <daehojeong@google.com> > > > > Add this to control
 GC algorithm for boost GC. > > > > Signed-off-by: Daeho Jeong [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ugQuN-0007iS-4o
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add gc_boost_gc_greedy sysfs node
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/22, Chao Yu wrote:
> On 7/19/25 05:50, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > Add this to control GC algorithm for boost GC.
> > 
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> > v2: use GC_GREEDY instead of 1
> > ---
> >  Documentation/ABI/testing/sysfs-fs-f2fs |  8 +++++++-
> >  fs/f2fs/gc.c                            |  3 ++-
> >  fs/f2fs/gc.h                            |  1 +
> >  fs/f2fs/sysfs.c                         | 16 ++++++++++++++++
> >  4 files changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> > index 931c1f63aa2e..2158055cd9d1 100644
> > --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> > +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> > @@ -866,6 +866,12 @@ What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
> >  Date:		June 2025
> >  Contact:	"Daeho Jeong" <daehojeong@google.com>
> >  Description:	Set a multiplier for the background GC migration window when F2FS GC is
> > -		boosted.
> > +		boosted. the range should be from 1 to the segment count in a section.
> >  		Default: 5
> >  
> > +What:		/sys/fs/f2fs/<disk>/gc_boost_gc_greedy
> > +Date:		June 2025
> > +Contact:	"Daeho Jeong" <daehojeong@google.com>
> > +Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
> > +		Default: 1
> > +
> > diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> > index de7e59bc0906..0d7703e7f9e0 100644
> > --- a/fs/f2fs/gc.c
> > +++ b/fs/f2fs/gc.c
> > @@ -141,7 +141,7 @@ static int gc_thread_func(void *data)
> >  					FOREGROUND : BACKGROUND);
> >  
> >  		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
> > -				gc_control.one_time;
> > +			(gc_control.one_time && gc_th->boost_gc_greedy);
> >  
> >  		/* foreground GC was been triggered via f2fs_balance_fs() */
> >  		if (foreground)
> > @@ -198,6 +198,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
> >  	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
> >  	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
> >  	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
> > +	gc_th->boost_gc_greedy = GC_GREEDY;
> >  
> >  	if (f2fs_sb_has_blkzoned(sbi)) {
> >  		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> > diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> > index efa1968810a0..1a2e7a84b59f 100644
> > --- a/fs/f2fs/gc.h
> > +++ b/fs/f2fs/gc.h
> > @@ -69,6 +69,7 @@ struct f2fs_gc_kthread {
> >  	unsigned int boost_zoned_gc_percent;
> >  	unsigned int valid_thresh_ratio;
> >  	unsigned int boost_gc_multiple;
> > +	unsigned int boost_gc_greedy;
> >  };
> >  
> >  struct gc_inode_list {
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index b0270b1c939c..3a52f51ee3c6 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -824,6 +824,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> >  		return count;
> >  	}
> >  
> > +	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
> > +		if (t < 1 || t > SEGS_PER_SEC(sbi))
> > +			return -EINVAL;
> > +		sbi->gc_thread->boost_gc_multiple = (unsigned int)t;
> > +		return count;
> > +	}
> 
> This check should be in ("f2fs: add gc_boost_gc_multiple sysfs node"), right?

Applied with the fix.

> 
> Thanks,
> 
> > +
> > +	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
> > +		if (t > GC_GREEDY)
> > +			return -EINVAL;
> > +		sbi->gc_thread->boost_gc_greedy = (unsigned int)t;
> > +		return count;
> > +	}
> > +
> >  	*ui = (unsigned int)t;
> >  
> >  	return count;
> > @@ -1051,6 +1065,7 @@ GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
> >  GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
> >  GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
> >  GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
> > +GC_THREAD_RW_ATTR(gc_boost_gc_greedy, boost_gc_greedy);
> >  
> >  /* SM_INFO ATTR */
> >  SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> > @@ -1222,6 +1237,7 @@ static struct attribute *f2fs_attrs[] = {
> >  	ATTR_LIST(gc_boost_zoned_gc_percent),
> >  	ATTR_LIST(gc_valid_thresh_ratio),
> >  	ATTR_LIST(gc_boost_gc_multiple),
> > +	ATTR_LIST(gc_boost_gc_greedy),
> >  	ATTR_LIST(gc_idle),
> >  	ATTR_LIST(gc_urgent),
> >  	ATTR_LIST(reclaim_segments),
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
