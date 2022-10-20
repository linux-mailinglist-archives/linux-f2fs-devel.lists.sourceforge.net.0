Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63101605917
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 09:55:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olQOK-0004t0-22;
	Thu, 20 Oct 2022 07:55:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1olQOI-0004su-4N
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 07:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7u1h1lqzF2Fv8q72RkHs44wLXSdf3202MyGP3XSwTU0=; b=HTYajNPEKts1eCxsI+Hcw72FQB
 xLyUC1B+KiSWTrk/Ox6yScrMkJNcvvfMRZ3HutqsaZE7X8i+jM3eUJ4/2a4NqKa8fBWrDOy4JiS3J
 /4UanNrpqAQJOT9//O/FrWrFfdwK44tR2Nodqtz+aG9WLzd3jAvS9XtBtNheDdCByA5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7u1h1lqzF2Fv8q72RkHs44wLXSdf3202MyGP3XSwTU0=; b=fndhnsruT3LyWrr+pdEzg2YONF
 6k/MYUpXCkApNpXVumxJxvruTMeOCxKWMKPK2s5Ge5JsgfR8aJ8G4WVPyBGwObeH62fUY09ZDkViP
 ItD1iTj/MkAveMP4sImgsje0HjPZr+2MLadXxA2Q72KZpLo5XV75zh2VfjDxpDjrLkvU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olQOH-00Ad3G-E9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 07:54:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1156461A5E;
 Thu, 20 Oct 2022 07:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64638C433C1;
 Thu, 20 Oct 2022 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666252491;
 bh=BHDB8Kd2xEmYB76BxmchxxWXe2Rxre5+Q3z//+IATxA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RmPb5jXraHNVcGs3bWrEwLwWQxMI2xFF0PYDQxUBeE52LtwpoMwskD3IdNTQiBaS5
 U5oWoHCoaWCuHJAbG+cLOsG1HPEoH2Jz5qkkqizAxbiTW5VOh9ZIa5Svh2BjsjIkOs
 g2Nt41VefC5X5Neiwi2SS7lwytvROIwriLziB15lIKihmHbe2lXRt7Xode56jMc9Xn
 2wAO00k3nC8bHHUIx/u9iNjXfBbpuKVkCAGZh7b2hksECEvalEQNuGoE8dZZH4DJma
 bJqV8WYO5aljyl0iG4S5iXa8di44fsO7d7FPM0rIUaoIH5XJe0JLVJ+2hNZj5xyqeB
 5aysrbVT6g4Sg==
Message-ID: <3ed1c3a5-e299-4915-a339-e2b6360635e5@kernel.org>
Date: Thu, 20 Oct 2022 15:54:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221018074621.16019-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221018074621.16019-1-frank.li@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Yangtao, On 2022/10/18 15:46, Yangtao Li wrote: > Added a
 new sysfs node called gc_urgent_mid_remaining. The user can > set the trial
 count limit for GC urgent mid mode with this value. If > GC thread gets to
 [...] Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olQOH-00Ad3G-E9
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce gc_urgent_mid_remaining
 sysfs node
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Yangtao,

On 2022/10/18 15:46, Yangtao Li wrote:
> Added a new sysfs node called gc_urgent_mid_remaining. The user can
> set the trial count limit for GC urgent mid mode with this value. If
> GC thread gets to the limit, the mode will turn back to GC normal mode.

Not sure, we will add gc_urgent_low_remaining later...

Can we share the same interface for all gc_mode? since each mode is
exclusive.

Thoughts?

Thanks,

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
>   fs/f2fs/f2fs.h                          |  2 ++
>   fs/f2fs/gc.c                            |  8 ++++++++
>   fs/f2fs/super.c                         |  1 +
>   fs/f2fs/sysfs.c                         | 10 ++++++++++
>   5 files changed, 28 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 483639fb727b..11ce4a8bdacd 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -599,6 +599,13 @@ Description:	You can set the trial count limit for GC urgent high mode with this
>   		If GC thread gets to the limit, the mode will turn back to GC normal mode.
>   		By default, the value is zero, which means there is no limit like before.
>   
> +What:		/sys/fs/f2fs/<disk>/gc_urgent_mid_remaining
> +Date:		October 2022
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	You can set the trial count limit for GC urgent mid mode with this value.
> +		If GC thread gets to the limit, the mode will turn back to GC normal mode.
> +		By default, the value is zero.
> +
>   What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
>   Date:		January 2022
>   Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6355a5683b7..2f33d6f23a26 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1736,6 +1736,8 @@ struct f2fs_sb_info {
>   	unsigned int next_victim_seg[2];	/* next segment in victim section */
>   	spinlock_t gc_urgent_high_lock;
>   	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
> +	spinlock_t gc_urgent_mid_lock;
> +	unsigned int gc_urgent_mid_remaining;	/* remaining trial count for GC_URGENT_MID */
>   
>   	/* for skip statistic */
>   	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 4546e01b2ee0..39d794b33d27 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -104,6 +104,14 @@ static int gc_thread_func(void *data)
>   					sbi->gc_mode = GC_NORMAL;
>   			}
>   			spin_unlock(&sbi->gc_urgent_high_lock);
> +		} else if (sbi->gc_mode == GC_URGENT_MID) {
> +			spin_lock(&sbi->gc_urgent_mid_lock);
> +			if (sbi->gc_urgent_mid_remaining) {
> +				sbi->gc_urgent_mid_remaining--;
> +				if (!sbi->gc_urgent_mid_remaining)
> +					sbi->gc_mode = GC_NORMAL;
> +			}
> +			spin_unlock(&sbi->gc_urgent_mid_lock);
>   		}
>   
>   		if (sbi->gc_mode == GC_URGENT_HIGH ||
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 3834ead04620..13919ad152b7 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3617,6 +3617,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>   	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
>   	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
>   	spin_lock_init(&sbi->gc_urgent_high_lock);
> +	spin_lock_init(&sbi->gc_urgent_mid_lock);
>   	atomic64_set(&sbi->current_atomic_write, 0);
>   
>   	sbi->dir_level = DEF_DIR_LEVEL;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index df27afd71ef4..b4476adea776 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -539,6 +539,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> +	if (!strcmp(a->attr.name, "gc_urgent_mid_remaining")) {
> +		spin_lock(&sbi->gc_urgent_mid_lock);
> +		sbi->gc_urgent_mid_remaining = t;
> +		spin_unlock(&sbi->gc_urgent_mid_lock);
> +
> +		return count;
> +	}
> +
>   #ifdef CONFIG_F2FS_IOSTAT
>   	if (!strcmp(a->attr.name, "iostat_enable")) {
>   		sbi->iostat_enable = !!t;
> @@ -826,6 +834,7 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_mid_remaining, gc_urgent_mid_remaining);
>   F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
>   F2FS_GENERAL_RO_ATTR(dirty_segments);
>   F2FS_GENERAL_RO_ATTR(free_segments);
> @@ -953,6 +962,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(data_io_flag),
>   	ATTR_LIST(node_io_flag),
>   	ATTR_LIST(gc_urgent_high_remaining),
> +	ATTR_LIST(gc_urgent_mid_remaining),
>   	ATTR_LIST(ckpt_thread_ioprio),
>   	ATTR_LIST(dirty_segments),
>   	ATTR_LIST(free_segments),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
