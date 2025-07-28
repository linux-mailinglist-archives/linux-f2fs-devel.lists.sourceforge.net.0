Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD74B1408E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 18:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pM2nwwR8NBArfoSM9LmVFza4CTou160uCt1AF1cozIU=; b=YDonOylcBrZJ92+rO098liDe+d
	HFgI2ScQkUX/CRUrOi/Zui0quYvxt72LBIFVpLYX4YKSPv57gkhTsIktMHAt0ZgX4usKblVd2diH9
	UevfLCK1MK2aaft1z7NfjcaCPKwIMnoBQkCkhhMvx4RG4w9v48MQrGEN2wQlVo7Jr6nU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugQy8-0000Au-7B;
	Mon, 28 Jul 2025 16:44:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ugQy7-0000Am-LE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1b+1PJKBleX1KlVC7LCFDM3UNxwKAjnNaZIn4JAsr44=; b=YPnuDO33YA1BRpEQFlfTz+ukMc
 1U874Y1r1S3wt4l9X10M9TNMPDN5CS8ja/I4oZKPQ+ne6+O7aGWqtQ7bLR70Rt60irJ1jZQYOcja2
 eJ2VB6pFaHAbwy+eBqP26FhK/woLBVrlJlfm2MS1CAUBtl8awDUuo59iKAubcSXXHwf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1b+1PJKBleX1KlVC7LCFDM3UNxwKAjnNaZIn4JAsr44=; b=UYfa1FJPkPPoAM6Hm14lbSw7Zy
 TB+1Og2VqyPQRp+PQEWZdCns3JVoCnrU19Co8U4IM2yLMxynVax2pACIm2jhN8GwiKDAD6nnBgVah
 4V7U2YItKCE6Ay9AG6nlx9mvQRwcRnLtBDP540m4NJqZdhRJamECHwOy9UgSisYrF4Q0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugQy6-0007u3-Ua for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 900FA43BF6;
 Mon, 28 Jul 2025 16:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8E9C4CEE7;
 Mon, 28 Jul 2025 16:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753721084;
 bh=Rgr92Y/bCOkrWYFO5fPTNpSB2Abyvra8IFBe/Do6Be8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8RbLq7vru0JBAQzrTUGjpwURj82H+ha7clts8cKyuxAzJaJcsq5rDtynpRniKg5H
 4Zm7MFcHvi8CFyOyivmUbn5UFCFKhXWzktK1zr71cj058FKurlmaeT/5ZX8X7qx7Sl
 dEuBqusg6cRrH2ug21kdRqdi3KkqgaNKOcuMOgug2ng8EP5WAbUc1AZGe0ImBzobfF
 QYbErvIMejXkrTL+0hA06CTmxDpjng46A9a5c27nvvC5FSjUHNDhirwnYYkoCL4mT+
 lMXREMTDOUOE2npOaEPVWvwzQ8Xqp3EucOCW7tAm+YJ/T9K2H13gWrSG8Us+OG3Urw
 rgfTnNjS+IlEA==
Date: Mon, 28 Jul 2025 16:44:42 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <aIeo-kTFqsUs7L0v@google.com>
References: <20250728163628.1043162-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250728163628.1043162-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Please check
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test
 On 07/28, Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Add a sysfs knob to set a multiplier for the background GC migration >
 window when F2FS Garbage Collection is boosted. > > [...] 
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
X-Headers-End: 1ugQy6-0007u3-Ua
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add gc_boost_gc_multiple sysfs node
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

Please check

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/log/?h=dev-test

On 07/28, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add a sysfs knob to set a multiplier for the background GC migration
> window when F2FS Garbage Collection is boosted.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v3: fix the range check condition
> v2: limit the available value range
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
>  fs/f2fs/gc.c                            | 3 ++-
>  fs/f2fs/gc.h                            | 1 +
>  fs/f2fs/sysfs.c                         | 9 +++++++++
>  4 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bf03263b9f46..931c1f63aa2e 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -861,3 +861,11 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
>  		SB_ENC_STRICT_MODE_FL            0x00000001
>  		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
>  		============================     ==========
> +
> +What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
> +Date:		June 2025
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Set a multiplier for the background GC migration window when F2FS GC is
> +		boosted.
> +		Default: 5
> +
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 3cb5242f4ddf..de7e59bc0906 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -197,6 +197,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>  
>  	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>  	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
> +	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
>  
>  	if (f2fs_sb_has_blkzoned(sbi)) {
>  		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> @@ -1749,7 +1750,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>  					!has_enough_free_blocks(sbi,
>  					sbi->gc_thread->boost_zoned_gc_percent))
>  				window_granularity *=
> -					BOOST_GC_MULTIPLE;
> +					sbi->gc_thread->boost_gc_multiple;
>  
>  			end_segno = start_segno + window_granularity;
>  		}
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..efa1968810a0 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -68,6 +68,7 @@ struct f2fs_gc_kthread {
>  	unsigned int no_zoned_gc_percent;
>  	unsigned int boost_zoned_gc_percent;
>  	unsigned int valid_thresh_ratio;
> +	unsigned int boost_gc_multiple;
>  };
>  
>  struct gc_inode_list {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..b417b655d4e8 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -824,6 +824,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "gc_boost_gc_multiple")) {
> +		if (t < 1 || t > SEGS_PER_SEC(sbi))
> +			return -EINVAL;
> +		sbi->gc_thread->boost_gc_multiple = (unsigned int)t;
> +		return count;
> +	}
> +
>  	*ui = (unsigned int)t;
>  
>  	return count;
> @@ -1050,6 +1057,7 @@ GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
>  GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
>  GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
>  GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
> +GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
>  
>  /* SM_INFO ATTR */
>  SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1220,6 +1228,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(gc_no_zoned_gc_percent),
>  	ATTR_LIST(gc_boost_zoned_gc_percent),
>  	ATTR_LIST(gc_valid_thresh_ratio),
> +	ATTR_LIST(gc_boost_gc_multiple),
>  	ATTR_LIST(gc_idle),
>  	ATTR_LIST(gc_urgent),
>  	ATTR_LIST(reclaim_segments),
> -- 
> 2.50.1.470.g6ba607880d-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
