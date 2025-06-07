Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D788AD0D12
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Jun 2025 13:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TXVMLusgkU/3U9YdOkc9EjJqmAs8zOuw1hlPk4weaw=; b=ERAPSrQPSDwcoZIUlAWbA7h7GE
	iA3oL44ckQ2f7q285lfkwECeO/T5/85MhJJsUVRysp2kSmK41DVwZqS/z24HumL0cTX2ZVkRplgkd
	/cZy+NRKQheLJzKL5K4yuwF3+FlyUsue6VERwvQrkeThRvvX468cbbmN+PrB3Wj8g1gk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uNrdD-0000PB-U7;
	Sat, 07 Jun 2025 11:22:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uNrdC-0000P3-Hh
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Jun 2025 11:22:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K28U8O86kB5w79VwYkllNZ7FOfV54UFiKF9pVkuV9YY=; b=WFoFOq1WRMjGcbaj7QOgxYPsmM
 wlM60tS53sooyaZvIZFBlQ3jEBdZVvxZ7oWkdMijbVgBh53ksYRxTPLTrOXvnKWBoFXUc7imJ2Zy6
 ZcWE9FPRIstfayW+bqLm0c2Fu2+ZdeAyGgYSgZzR6jnrvDRRbksQ528avXH1Rd62dJuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K28U8O86kB5w79VwYkllNZ7FOfV54UFiKF9pVkuV9YY=; b=XsBGD3lVuzzdeDXOppsdY2zBR1
 nfSS7D08LJlxoNJUkGTvVlb73mFBgROXdtz//yMQhEAbzXlm7ifDteNJ06dmx4CA67KDcebtDb3MA
 ABquIcOvW3WobBphMlvMpOtzr0BxZtkCiHmjKlZkK2b1ToRIBEmLlKvVnz6QJF79DbB8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uNrdB-0001kn-3s for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 07 Jun 2025 11:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 52752629E2;
 Sat,  7 Jun 2025 11:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3E4C4CEE4;
 Sat,  7 Jun 2025 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749295342;
 bh=s5yMSCcYSIASPVhnuY5XlnyHmjAvCOPsKONTqm3McmU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=P3WBCtuINSNv5XjNJ969epVWAzQTDKmkB3uvQ/nEXY1Xu32HpR0pRimWzXV54kz6C
 zX0Fc4HCUo/AyVz32Sbz3dS1BJKCPekT6R3LMGE2a9JJMy9eIYhsqupuKoGAVE3pkS
 D3ycTjN9BD9LhQUQtFF3/OwVKU0SJsxtM53iKd71hwOzlvz+PD3iAnpttPi9iQ2M8+
 mH84Q43ipss5B3XmIdqxKayiT63xAubFPrrhqpg8US4FAIFzCMzK+7btQTCH2v5qVM
 VgNaakgooQhVIl3BxjZYwGpOyW9xlrwmonV5A4kzZ7GVGiSsZgyUUWEn/YElF35TbL
 LXXCRle3cUhrg==
Message-ID: <3453f0f0-263c-43f6-be6f-85fc0bbaed4f@kernel.org>
Date: Sat, 7 Jun 2025 19:22:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250606192017.439733-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250606192017.439733-1-daeho43@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/7 3:20,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > Add a sysfs knob to set a multiplier for the background GC migration
 > window when F2FS Garbage Collection is boost [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uNrdB-0001kn-3s
Subject: Re: [f2fs-dev] [PATCH] f2fs: add gc_boost_gc_multiple sysfs node
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/7 3:20, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Add a sysfs knob to set a multiplier for the background GC migration
> window when F2FS Garbage Collection is boosted.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
>   fs/f2fs/gc.c                            | 3 ++-
>   fs/f2fs/gc.h                            | 1 +
>   fs/f2fs/sysfs.c                         | 2 ++
>   4 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index bf03263b9f46..931c1f63aa2e 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -861,3 +861,11 @@ Description:	This is a read-only entry to show the value of sb.s_encoding_flags,
>   		SB_ENC_STRICT_MODE_FL            0x00000001
>   		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
>   		============================     ==========
> +
> +What:		/sys/fs/f2fs/<disk>/gc_boost_gc_multiple
> +Date:		June 2025
> +Contact:	"Daeho Jeong" <daehojeong@google.com>
> +Description:	Set a multiplier for the background GC migration window when F2FS GC is
> +		boosted.
> +		Default: 5

Do we need to add lower/upper boundary during setting the value via sysfs entry?

Thanks,

> +
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 3cb5242f4ddf..de7e59bc0906 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -197,6 +197,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>   
>   	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
>   	gc_th->valid_thresh_ratio = DEF_GC_THREAD_VALID_THRESH_RATIO;
> +	gc_th->boost_gc_multiple = BOOST_GC_MULTIPLE;
>   
>   	if (f2fs_sb_has_blkzoned(sbi)) {
>   		gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME_ZONED;
> @@ -1749,7 +1750,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   					!has_enough_free_blocks(sbi,
>   					sbi->gc_thread->boost_zoned_gc_percent))
>   				window_granularity *=
> -					BOOST_GC_MULTIPLE;
> +					sbi->gc_thread->boost_gc_multiple;
>   
>   			end_segno = start_segno + window_granularity;
>   		}
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 5c1eaf55e127..efa1968810a0 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -68,6 +68,7 @@ struct f2fs_gc_kthread {
>   	unsigned int no_zoned_gc_percent;
>   	unsigned int boost_zoned_gc_percent;
>   	unsigned int valid_thresh_ratio;
> +	unsigned int boost_gc_multiple;
>   };
>   
>   struct gc_inode_list {
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 75134d69a0bd..b0270b1c939c 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1050,6 +1050,7 @@ GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
>   GC_THREAD_RW_ATTR(gc_no_zoned_gc_percent, no_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_boost_zoned_gc_percent, boost_zoned_gc_percent);
>   GC_THREAD_RW_ATTR(gc_valid_thresh_ratio, valid_thresh_ratio);
> +GC_THREAD_RW_ATTR(gc_boost_gc_multiple, boost_gc_multiple);
>   
>   /* SM_INFO ATTR */
>   SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1220,6 +1221,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_no_zoned_gc_percent),
>   	ATTR_LIST(gc_boost_zoned_gc_percent),
>   	ATTR_LIST(gc_valid_thresh_ratio),
> +	ATTR_LIST(gc_boost_gc_multiple),
>   	ATTR_LIST(gc_idle),
>   	ATTR_LIST(gc_urgent),
>   	ATTR_LIST(reclaim_segments),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
