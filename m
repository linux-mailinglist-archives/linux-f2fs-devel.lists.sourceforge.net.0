Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BA848A23
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 02:26:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWRGX-0004fp-29;
	Sun, 04 Feb 2024 01:25:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rWRGW-0004fj-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 01:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ESMkuwLFJYZTQtf0DBQRmReJtN7pWWJU6zwXLVVs/ls=; b=BbwXpfcRIUOMbNbFmBxNrdd9tc
 LLvfGsUcxp4V7IlNWrB+8w0Hb13s8eWZlvpXYuutfn76UjG8o4SkCkt/rRzJg0JvW4AEhn5ejm1Lf
 0sl3Drj9slb2vX1AhAABPKDqJe/9nZA9+amVSgqrZxsCN4L8I8Rl0ksRpQ76NOs2cP20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ESMkuwLFJYZTQtf0DBQRmReJtN7pWWJU6zwXLVVs/ls=; b=VeW3SEF4NNpV3zSl3TUydd4osu
 cUy19If4ZvOP9nMtKktWpa42Tx+oXF63Xg3R9OD42VpX01IRuewC3ys5Nq+Q45kWP18Ssq3VFCRQe
 Nk/0EpduTxBKBlxYHU2qg+okwCFw6kvfh5oGPdDfAiAuOPqsxbUiI7RcEkDtF24MGInw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWRGV-0001IB-QY for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 01:25:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CB1960BCB;
 Sun,  4 Feb 2024 01:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A17C433F1;
 Sun,  4 Feb 2024 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707009937;
 bh=WpCKdFqw5IN67E9Y7z93QSOdWPaN4BD4TFaa8l4D5Cg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YJ1YLtbEjbSL8fHL6KuOOJ19qt+pEVsMiNLRnXQVX4SgbdzaW/Hm4snK4xa/04qVB
 ra+AxK7FGu4DCkMO+BmyKcXe2KMrjctXyYPSWO3mjQtePhoUJ5lWBxvfWB4tbvO92W
 w3FE4GBUHADVCQV9GSU6Z/S7Wel6pr9DzsosDE9voRfeLnvJqIE8kX13ZHYKGuy64T
 Hj+AbKwJV8oidFDQm6kZ5WS5kiElX3gZ/gJVGgD5t6H9o67f4P8Z0/s9qwCASPbWCw
 vzf+FVEHUJ4rg9nuMZd4xmWwHrE4mUMEVz6S8ejbC4Wb9bQiiJ6XguDH0jwfP/7Azy
 gJfKBGUeRsJJw==
Message-ID: <be86741f-a3b2-4c75-b645-371761a5b99e@kernel.org>
Date: Sun, 4 Feb 2024 09:25:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <5a4cdc020f19e136e79f9d0b6ca2adf2879db888.1706859367.git.liujinbao1@xiaomi.corp-partner.google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <5a4cdc020f19e136e79f9d0b6ca2adf2879db888.1706859367.git.liujinbao1@xiaomi.corp-partner.google.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/2 19:22,
 liujinbao1 wrote: > From: liujinbao1
 <liujinbao1@xiaomi.corp-partner.google.com>
 AFAIK, this account is only used for interaction between google and its partner,
 I guess you can use xiaomi's email address instead? 
 Content analysis details:   (-7.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rWRGV-0001IB-QY
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: sysfs: support gc_io_aware
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
Cc: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/2 19:22, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>

AFAIK, this account is only used for interaction between google and
its partner, I guess you can use xiaomi's email address instead?

> 
> Currently, IO can only be ignored when GC_URGENT_HIGH is set,
> and the default algorithm used for GC_URGENT_HIGH is greedy.
> It gives a way to enable/disable IO aware feature for background
> gc, so that we can tune background gc more precisely. e.g.
> force to disable IO aware and choose more suitable algorithm
> if there are large number of dirty segments.
> 
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>

Ditto,

> 
> changes of v2: Improve the patch according to Chao's suggestions

Trivial thing, it's better not include above line in commit message.

Thanks,

> 
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
>   fs/f2fs/gc.c                            | 3 ++-
>   fs/f2fs/gc.h                            | 1 +
>   fs/f2fs/sysfs.c                         | 9 +++++++++
>   4 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 36c3cb547901..47f02fa471fe 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -16,6 +16,12 @@ Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
>   Description:	Controls the default sleep time for gc_thread. Time
>   		is in milliseconds.
>   
> +What:		/sys/fs/f2fs/<disk>/gc_io_aware
> +Date:		January 2024
> +Contact:	"Jinbao Liu" <liujinbao1@xiaomi.com>
> +Description:	It controls to enable/disable IO aware feature for background gc.
> ++		By default, the value is 1 which indicates IO aware is on.
> +
>   What:		/sys/fs/f2fs/<disk>/gc_idle
>   Date:		July 2013
>   Contact:	"Namjae Jeon" <namjae.jeon@samsung.com>
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 309da3d0faff..0b75d37acc63 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -109,7 +109,7 @@ static int gc_thread_func(void *data)
>   			goto next;
>   		}
>   
> -		if (!is_idle(sbi, GC_TIME)) {
> +		if (gc_th->io_aware && !is_idle(sbi, GC_TIME)) {
>   			increase_sleep_time(gc_th, &wait_ms);
>   			f2fs_up_write(&sbi->gc_lock);
>   			stat_io_skip_bggc_count(sbi);
> @@ -182,6 +182,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
>   	gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
>   	gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
>   	gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
> +	gc_th->io_aware = true;
>   
>   	gc_th->gc_wake = false;
>   
> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
> index 28a00942802c..51d6ad26b76a 100644
> --- a/fs/f2fs/gc.h
> +++ b/fs/f2fs/gc.h
> @@ -41,6 +41,7 @@ struct f2fs_gc_kthread {
>   	unsigned int min_sleep_time;
>   	unsigned int max_sleep_time;
>   	unsigned int no_gc_sleep_time;
> +	bool io_aware;
>   
>   	/* for changing gc mode */
>   	bool gc_wake;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 417fae96890f..e8d5667cfddd 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -516,6 +516,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "gc_io_aware")) {
> +		if (t > 1)
> +			return -EINVAL;
> +		*ui = t ? true : false;
> +		return count;
> +	}
> +
>   	if (!strcmp(a->attr.name, "migration_granularity")) {
>   		if (t == 0 || t > sbi->segs_per_sec)
>   			return -EINVAL;
> @@ -906,6 +913,7 @@ GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
>   GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
>   GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
>   GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
> +GC_THREAD_RW_ATTR(gc_io_aware, io_aware);
>   
>   /* SM_INFO ATTR */
>   SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
> @@ -1061,6 +1069,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_min_sleep_time),
>   	ATTR_LIST(gc_max_sleep_time),
>   	ATTR_LIST(gc_no_gc_sleep_time),
> +	ATTR_LIST(gc_io_aware),
>   	ATTR_LIST(gc_idle),
>   	ATTR_LIST(gc_urgent),
>   	ATTR_LIST(reclaim_segments),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
