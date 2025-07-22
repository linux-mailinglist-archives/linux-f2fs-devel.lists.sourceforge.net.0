Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E38EEB0D03F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Jul 2025 05:24:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYpOQZcRM86iKhrcBiVbkpTeUc+UGuH3pSu4b5reTYs=; b=YOapb+S+46/B2kDC4bXl0JCEgx
	wseMWgvVmtQCDA5A9s65SAan4o4aPrgvJdvZiv69ZXCKt850qDB4ZZX6CpAejl1YR4rwDCuMCpm3H
	kirWck/VhrqGuECSIreEq/cLyjl9s/DvunL5ZYVNApYUPs2Uidp0O814MzXQeNkny23w=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ue3ce-0004G1-Kd;
	Tue, 22 Jul 2025 03:24:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ue3cd-0004Fn-QE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4D03AykMOVm2jACy/Q1ynT63UoKbnzVpgjsR6YhtKTA=; b=Qd4INtoc+ixabLPLoGjjjvO7X+
 /La2rvrhmQ+MpzHU1LfNOefg0pQMyUKBJiTfIQQUyeogctb5t2yD/mSXkNnHB9aG2rdduZyVan5t2
 OvQEg13VHA8r1/oVhBzS0L1wZL3qYbfldlYLsbWD4JRi7QWQLn4SVS75MInf8+aZK09Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4D03AykMOVm2jACy/Q1ynT63UoKbnzVpgjsR6YhtKTA=; b=RkULJlHmbUn9BoI9CD6G8C3kGq
 igRUjJHfk5BbD3R2GpKoo7/RhFDx32ECKM3/Civ/FJLCs2aJMofRwBkD6po7sgsWuVwiRgs1V2r6m
 8XKDDFNaA+jZTtaqx652fveUfZ6NfktWJnIQsfrBfqVgoyW+25z2huPdUwKUc7iLEz+4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ue3cd-0004ER-WE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Jul 2025 03:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 52CB1600AD;
 Tue, 22 Jul 2025 03:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FCEC4CEEB;
 Tue, 22 Jul 2025 03:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753154685;
 bh=5Rzof64fbH46b5Fd+gNbyuLMkJ3pMKbLw+hfXRsX4cA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=P0GnCNbjOg9KTNNwMCEcpDJHy3RTpbjeJJiWKW5XZ4Q1/2lkC7btnAzESoG35AoUw
 meLA0fvlvlkpMnqoBLn4R3QHkLk/nxf9s8+3j0SwGOdW0BGccLX62ela1psk2G8SpG
 SQPnGZkTdImqiayEX6dmwTbSXnqftBHjwKC3ijaBll3BJPqQP6a9d8NWBl7QiNyrPx
 GQAjQvMc/IWwsLxQUFFCLgienXW/dsx6tJj9PZG5wFfrNYl4wlNOX+bQG5wnzjiaIj
 Iuq/toP211c+fqtgwVVusg2oh/h/BLqphyNx1Nl6O6uNLcWl29xlnOSrqWy9RWFT0c
 zPiB6q9RpBqjA==
Message-ID: <6c26bcaa-7a9d-4b30-b326-90395f55e155@kernel.org>
Date: Tue, 22 Jul 2025 11:24:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250718215003.2283009-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250718215003.2283009-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/19/25 05:50,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Add this to control GC algorithm for boost GC. > > Signed-off-by: Daeho
 Jeong <daehojeong@google.com> > --- > v2: u [...] 
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
X-Headers-End: 1ue3cd-0004ER-WE
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/19/25 05:50, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add this to control GC algorithm for boost GC.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: use GC_GREEDY instead of 1
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs |  8 +++++++-
>  fs/f2fs/gc.c                            |  3 ++-
>  fs/f2fs/gc.h                            |  1 +
>  fs/f2fs/sysfs.c                         | 16 ++++++++++++++++
>  4 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 931c1f63aa2e..2158055cd9d1 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -866,6 +866,12 @@ What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
>  Date:		June 2025
>  Contact:	"Daeho Jeong" <daehojeong@google.com>
>  Description:	Set a multiplier for the background GC migration window when F2FS GC is
> -		boosted.
> +		boosted. the range should be from 1 to the segment count in a section.
>  		Default: 5
>  
> +What:		/sys/fs/f2fs/<disk>/gc_boost_gc_greedy
> +Date:		June 2025
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
> +		Default: 1
> +
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index de7e59bc0906..0d7703e7f9e0 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -141,7 +141,7 @@ static int gc_thread_func(void *data)
>  					FOREGROUND : BACKGROUND);
>  
>  		sync_mode = (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC) ||
> -				gc_control.one_time;
> +			(gc_control.one_time && gc_th->boost_gc_greedy);
>  
>  		/* foreground GC was been triggered via f2fs_balance_fs() */
>  		if (foreground)
> @@ -198,6 +198,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>  	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>  	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
>  	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
> +	gc_th->boost_gc_greedy = GC_GREEDY;
>  
>  	if (f2fs_sb_has_blkzoned(sbi)) {
>  		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index efa1968810a0..1a2e7a84b59f 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -69,6 +69,7 @@ struct f2fs_gc_kthread {
>  	unsigned int boost_zoned_gc_percent;
>  	unsigned int valid_thresh_ratio;
>  	unsigned int boost_gc_multiple;
> +	unsigned int boost_gc_greedy;
>  };
>  
>  struct gc_inode_list {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index b0270b1c939c..3a52f51ee3c6 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -824,6 +824,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
> +		if (t < 1 || t > SEGS_PER_SEC(sbi))
> +			return -EINVAL;
> +		sbi->gc_thread->boost_gc_multiple = (unsigned int)t;
> +		return count;
> +	}

This check should be in ("f2fs: add gc_boost_gc_multiple sysfs node"), right?

Thanks,

> +
> +	if (!strcmp(a->attr.name, "gc_boost_gc_greedy")) {
> +		if (t > GC_GREEDY)
> +			return -EINVAL;
> +		sbi->gc_thread->boost_gc_greedy = (unsigned int)t;
> +		return count;
> +	}
> +
>  	*ui = (unsigned int)t;
>  
>  	return count;
> @@ -1051,6 +1065,7 @@ GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
>  GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
>  GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
>  GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
> +GC_THREAD_RW_ATTR(gc_boost_gc_greedy, boost_gc_greedy);
>  
>  /* SM_INFO ATTR */
>  SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1222,6 +1237,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(gc_boost_zoned_gc_percent),
>  	ATTR_LIST(gc_valid_thresh_ratio),
>  	ATTR_LIST(gc_boost_gc_multiple),
> +	ATTR_LIST(gc_boost_gc_greedy),
>  	ATTR_LIST(gc_idle),
>  	ATTR_LIST(gc_urgent),
>  	ATTR_LIST(reclaim_segments),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
