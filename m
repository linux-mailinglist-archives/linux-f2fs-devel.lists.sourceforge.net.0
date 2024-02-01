Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1D84515D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 07:29:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVQZs-0006Qy-PR;
	Thu, 01 Feb 2024 06:29:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rVQZr-0006Qn-SE
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 06:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6bFGsnGqzlsZVLgpl7C9EFBUGdQyOWNMmpvao2gVrag=; b=lQbH4xkl2mW+oeTFXu2altDX4f
 fdyE/uI/DqK207aFEgdoPIss9RtKGR29K3EylRQ0f6d50zxmsdfK+6mvwkyJMiuhlcOs5r5F/pJkb
 P906ujz8YQqAFQB+CU8vUr0s0k/LYyPDiloty365lQn9vRBLyTfeqfBJunUwIBzm3U6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6bFGsnGqzlsZVLgpl7C9EFBUGdQyOWNMmpvao2gVrag=; b=Liq0wyy2Fz70RpN81a1kCuPZCa
 RHeFGe6s2G6IgtZnxG4NMTJ03BFTjNNb/nO54eVhrsIwTi08sP0Rnbux8BbL12b0zIuKeDmN41Orm
 YsUuxvevhPMV9Wac14GRT5isKbPnFbugVhsAc/MWdMIYOoek9Qe5JsFPS35y8ANW4HZg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVQZq-0005hc-Td for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 06:29:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1ECB961B2F;
 Thu,  1 Feb 2024 06:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E97C433F1;
 Thu,  1 Feb 2024 06:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706768964;
 bh=1BN6jfhT/gk45R5CPCVJSrOjxfYN0aiySJzxnvTLL9I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JskVz43SXLur011T8ECNrlujln8yf0cbj2eLQ/8L+LzS/RKAXRgtfcHTotBopzob3
 Wlf6HNLdn2ERNJfUAEbpVsMg/4X+psQruWFS8EylML+D8qf0VZFSd7AzkSiY1of0ET
 d4fh85DrXTL1nTgPyN5cPHwUABlE6GyZyW0jDTRnsg489WY/7xZ1wVc348nrZy0/sD
 uvfinO86U48GprfFn99SqrAEhUh3fzXZ0FYkYuJoSKBGMM0PMCyT8izcQqSkr/5cpa
 VMjOwhbQsCwgBRJbowJPOV9yKuvAQ2DQQwMjyOtItyS5CoTpGBMy7J2d/EIgBotWbr
 thl2W3EjiHqAQ==
Message-ID: <0477240f-9f52-4418-9a2d-7a5a598cd0a9@kernel.org>
Date: Thu, 1 Feb 2024 14:29:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20240130125113.14081-1-jinbaoliu365@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240130125113.14081-1-jinbaoliu365@gmail.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/30 20:51,
 liujinbao1 wrote: > From: liujinbao1
 <liujinbao1@xiaomi.corp-partner.google.com>
 > > Currently, IO can only be ignored when GC_URGENT_HIGH is set, > and the
 default algorithm used [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rVQZq-0005hc-Td
Subject: Re: [f2fs-dev] [PATCH] UPSTREAM: f2fs: sysfs: support gc_io_aware
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

On 2024/1/30 20:51, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>
> 
> Currently, IO can only be ignored when GC_URGENT_HIGH is set,
>   and the default algorithm used for GC_URGENT_HIGH is greedy.
> It gives a way to enable/disable IO aware feature for background
> gc, so that we can tune background gc more precisely. e.g.
> force to disable IO aware and choose more suitable algorithm
> if there are large number of dirty segments.
> 
> Change-Id: Ic0ea1bf8fb6602f0dd88b924088f1c1b33fcd809

Should remove Change-Id line.

> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.corp-partner.google.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
>   fs/f2fs/f2fs.h                          | 6 ++++++
>   fs/f2fs/gc.c                            | 3 ++-
>   fs/f2fs/gc.h                            | 1 +
>   fs/f2fs/sysfs.c                         | 9 +++++++++
>   5 files changed, 24 insertions(+), 1 deletion(-)
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
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 214fdd590fdf..ebe953e7459e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -374,6 +374,12 @@ enum {
>   	MAX_DPOLICY,
>   };
>   
> +enum {
> +	GC_IO_AWARE_DISABLE,	/* force to not be aware of IO */
> +	GC_IO_AWARE_ENABLE,	/* force to be aware of IO */
> +	GC_IO_AWARE_MAX,
> +};

Not needed.

> +
>   struct discard_policy {
>   	int type;			/* type of discard */
>   	unsigned int min_interval;	/* used for candidates exist */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 309da3d0faff..34a1e6b35af6 100644
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
> +	gc_th->io_aware = GC_IO_AWARE_ENABLE;

gc_th->io_aware = true;

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
> index 417fae96890f..95409cfc48f4 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -516,6 +516,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "gc_io_aware")) {
> +		if (t >= GC_IO_AWARE_MAX)

	if (t > 1)

> +			return -EINVAL;
> +		*ui = t;

	*ui = t ? true : false;

Thanks,

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
