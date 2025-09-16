Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7891B58BD1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 04:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C13LOYFOE525Iz/WG5n7vScj4hL7vHKxycBSgeFaNkM=; b=HctPbZfWI8jspOGFWH2is6BJQB
	mN7ws1lMXQKz3LGByLuiLqelgv+kIszIfmLX2iD2b5+b/gxhyXzRWAimdVn2lprdZvDsdlYLlPwB5
	sy0RQESQHXmMjqIpq3SdGRP5lLnNgUdh1rP5ozT+5V1mfp/G4vB4bvcfl1vBTX1q3HUQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyLQW-0001cU-AL;
	Tue, 16 Sep 2025 02:28:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uyLQV-0001cI-Em
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:28:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RCE5+7D31ucG4mqRD+QiGg31r3ghFSotJJkGEqjpHsA=; b=BMKKADdm7kOEUWtpHcUU2dYBvY
 pM3HnHTS8UW26gviM/s1/BchR3O4/Rtb5MrM5u1YnF1Z5TjWk70FAeM9msU4FGuxjSSx7h4v6Ihy1
 HAOZ3UlM4Od41/2Reuzlfnn2kSwDINtLxo0DcPv9PZXI38pNLRetkTpac+TcI8xJY1HE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RCE5+7D31ucG4mqRD+QiGg31r3ghFSotJJkGEqjpHsA=; b=Cokwvz4CQ4kn5cx4ukiPMsXq2A
 M/889BBkmvQqPCOs0no2kuAdv/p11nO9zo4+YcJCG/t2ovaIRGaU11PRL8S71c3iV2ZiinRW82Nf6
 ruk/WKw+OasuRTi7ao2+v0c/uAMyGtUPKinEqnc/M3TCUGaatEviV2eP8Bi6KOpE+U3E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyLQV-0001fQ-N6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:28:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5FE9A43C82;
 Tue, 16 Sep 2025 02:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B9FC4CEF1;
 Tue, 16 Sep 2025 02:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757989685;
 bh=cUI+GduIRyVlpYvUYsfmG89UKOgODbBvtSJCHqDtaKc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nrTQFkQi9jBkK0BqRbPVRHBZyi3fKTIRjMbAYnNeJ+jizcWiR1PgMBGuk+vmHHIva
 U/IvUOU1oyqP8Y27t1o/5hCdrrRTI7qT3NYNNdTqZQ/kHLZE0vTviudJjGQaIyyD+6
 7p8sjoCaraZFYZisWtA7JFex45QzP+6L2bDIYj5Jathst6GRD0CUrnHaaNknJbTspw
 2HnLKNeVYpLRoSRwpiRTPokrT7vHMz9wTfCfcjoPWsnCAQK2z3xdwCEVAexRoKFXKw
 Xep0vcqGSAw6fFJRAWmoGVowzcPUZUM6vxRh1j9aPJW1AgD8l9dHk1VbynFQyNuU7H
 qFMlfdAgy+04Q==
Date: Tue, 16 Sep 2025 02:28:03 +0000
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Message-ID: <aMjLMwNDjabD8MVH@google.com>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
 <20250909134418.502922-2-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250909134418.502922-2-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Could you please share some trends of relation between
 has_enough_free_blocks()
 vs. has_enough_dirty_blocks()? I'm wondering whethere there's a missing case
 where has_enough_free_blocks() is not enoug [...] 
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
X-Headers-End: 1uyLQV-0001fQ-N6
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Optimize excessive write
 operations caused by continuous background garbage collection in Zoned UFS
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Could you please share some trends of relation between has_enough_free_blocks()
vs. has_enough_dirty_blocks()? I'm wondering whethere there's a missing case
where has_enough_free_blocks() is not enough.

On 09/09, Liao Yuanhong wrote:
> Incorporate a check using has_enough_dirty_blocks() to prevent redundant
> background GC in Zoned UFS. When there are insufficient dirty segments,
> continuous execution of background GC should be avoided, as it results in
> unnecessary write operations and impacts device lifespan. The initial
> threshold is set to 3 * section size (since f2fs data uses three write
> pointers).
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  fs/f2fs/gc.c |  8 ++++++--
>  fs/f2fs/gc.h | 10 +++++++++-
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index ed3acbfc83ca..4a8c08f970e3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -120,7 +120,9 @@ static int gc_thread_func(void *data)
>  
>  		if (f2fs_sb_has_blkzoned(sbi)) {
>  			if (has_enough_free_blocks(sbi,
> -				gc_th->no_zoned_gc_percent)) {
> +				gc_th->no_zoned_gc_percent) ||
> +				!has_enough_dirty_blocks(sbi,
> +				LIMIT_GC_DIRTY_SECTION_NUM)) {
>  				wait_ms = gc_th->no_gc_sleep_time;
>  				f2fs_up_write(&sbi->gc_lock);
>  				goto next;
> @@ -1750,7 +1752,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>  
>  			if (f2fs_sb_has_blkzoned(sbi) &&
>  					!has_enough_free_blocks(sbi,
> -					sbi->gc_thread->boost_zoned_gc_percent))
> +					sbi->gc_thread->boost_zoned_gc_percent) &&
> +					has_enough_dirty_blocks(sbi,
> +					LIMIT_GC_DIRTY_SECTION_NUM))
>  				window_granularity *=
>  					sbi->gc_thread->boost_gc_multiple;
>  
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 24e8b1c27acc..1ef234c2702b 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -36,6 +36,7 @@
>  #define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
>  #define BOOST_GC_MULTIPLE	5
>  #define ZONED_PIN_SEC_REQUIRED_COUNT	1
> +#define LIMIT_GC_DIRTY_SECTION_NUM	3
>  
>  #define DEF_GC_FAILED_PINNED_FILES	2048
>  #define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
> @@ -177,6 +178,12 @@ static inline bool has_enough_free_blocks(struct f2fs_sb_info *sbi,
>  	return free_sections(sbi) > ((sbi->total_sections * limit_perc) / 100);
>  }
>  
> +static inline bool has_enough_dirty_blocks(struct f2fs_sb_info *sbi,
> +						unsigned int limit_num)
> +{
> +	return dirty_segments(sbi) > limit_num * SEGS_PER_SEC(sbi);
> +}
> +
>  static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>  {
>  	block_t user_block_count = sbi->user_block_count;
> @@ -197,6 +204,7 @@ static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>  {
>  	if (f2fs_sb_has_blkzoned(sbi))
>  		return !has_enough_free_blocks(sbi,
> -				sbi->gc_thread->boost_zoned_gc_percent);
> +				sbi->gc_thread->boost_zoned_gc_percent) &&
> +				has_enough_dirty_blocks(sbi, LIMIT_GC_DIRTY_SECTION_NUM);
>  	return has_enough_invalid_blocks(sbi);
>  }
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
