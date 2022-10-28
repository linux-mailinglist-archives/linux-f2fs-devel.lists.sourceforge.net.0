Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D02CD6107EF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 04:25:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooF3j-00055c-Mm;
	Fri, 28 Oct 2022 02:25:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ooF3i-00055S-3y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 02:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SRWj2KW/cXN5vxqPrK2Kd0HhaS+YHiHdFIfMPZ63rZ8=; b=Q7N4peFlvSe0VPBR6FKbT/K/xy
 mTAyNSpE3zOhXAxpKnPcAUQZ38M/uTrww7mgFaph8ZlkPGvmGpcXia+pNLFQeeCNz8M7ChjC/bNmX
 sAc55g1zV0McdfSPxUniIb2Piz7zdcjr0zo3B1UNSzrXUwwiM13IZ93Lo2veNPvLXzX0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SRWj2KW/cXN5vxqPrK2Kd0HhaS+YHiHdFIfMPZ63rZ8=; b=mebW1PllBoHdyGj5rYb1fMA4S/
 wfMGKcGXXfWx0GnV8nWHO+QYgiI+zXMRz+Y6YE4Rniobz09U7pNguSDK5F/I4Z1MUPP7iKNfYh0Zl
 6vQZyQHVNaJp4Iwsg1ZVe7pgAHcs7H9GH56i6I3iO9XoYK8QDFQWhj2GXvubmtZGEodE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooF3g-0000qC-5D for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 02:25:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A13E7625F1;
 Fri, 28 Oct 2022 02:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED068C433D7;
 Fri, 28 Oct 2022 02:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666923910;
 bh=H6oIFHglobZ3uqpVr/Mks3L7N6kUhUIvJGRq5YtZNrE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hIP+06wU/StRZCykHgn1TQOH0+KIsXeGBTAC1hxTwzZKzZoYYdeECn/7XQLUUcBt4
 WOknXqaGygorDCF30cEBaZ5ze+0dmOz4fyH8Dk+zBVrQxip0V/aDY1Si4UXuRbAf8B
 kgoH2BW1bvD9P1hTRfT0uS+Q51yhomm0lyQwo9U6dwKrkL82TZKuEPgiXyLjv/RiO2
 T1q2niNWqtgUQRx/0gk8xFOgPRvkIJJWZIPBz7S2cP06o2Btf39tz3NGoyODNYzMlN
 xFOSBAsSP25Z0FuOrocfVonRelUw/LYEE7ALH4/GHfveiTdHUphrUZ/jbDP0krOHce
 bi4bAsAIAj14Q==
Message-ID: <cd6d15e3-b692-d3c1-0f01-33e632f5f94c@kernel.org>
Date: Fri, 28 Oct 2022 10:25:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025065025.35017-1-frank.li@vivo.com>
 <20221025065025.35017-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025065025.35017-2-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 14:50, Yangtao Li wrote: > Added a new sysfs
 node called gc_urgent_idle_remaining. > The user can set the trial count
 limit for GC urgent and > idle mode with this value. If GC thread ge [...]
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooF3g-0000qC-5D
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: introducr
 gc_urgent_idle_remaining sysfs node and mark gc_urgent_high_remaining node
 deprecated
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

On 2022/10/25 14:50, Yangtao Li wrote:
> Added a new sysfs node called gc_urgent_idle_remaining.
> The user can set the trial count limit for GC urgent and
> idle mode with this value. If GC thread gets to the limit,
> the mode will turn back to GC normal mode finally.
> 
> This method is not only applicable to gc_urgent_high,
> but applicable to all gc modes. Also mark
> gc_urgent_high_remaining as deprecated, so that the node
> can be removed in the future.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
>   fs/f2fs/f2fs.h                          |  6 ++++--
>   fs/f2fs/gc.c                            | 12 ++++++------
>   fs/f2fs/super.c                         |  2 +-
>   fs/f2fs/sysfs.c                         | 14 ++++++++++----
>   5 files changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 483639fb727b..859c4e53a846 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -598,6 +598,14 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	You can set the trial count limit for GC urgent high mode with this value.
>   		If GC thread gets to the limit, the mode will turn back to GC normal mode.
>   		By default, the value is zero, which means there is no limit like before.
> +		<deprecated>
> +
> +What:		/sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
> +Date:		October 2022
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	You can set the trial count limit for GC urgent and idle mode with this value.
> +		If GC thread gets to the limit, the mode will turn back to GC normal mode.
> +		By default, the value is zero, which means there is no limit like before.
>   
>   What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
>   Date:		January 2022
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6355a5683b7..2bad69cf9fd9 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1734,8 +1734,10 @@ struct f2fs_sb_info {
>   	unsigned int cur_victim_sec;		/* current victim section num */
>   	unsigned int gc_mode;			/* current GC state */
>   	unsigned int next_victim_seg[2];	/* next segment in victim section */
> -	spinlock_t gc_urgent_high_lock;
> -	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
> +	spinlock_t gc_urgent_idle_lock;
> +	/* remaining trial count for GC_URGENT_* and GC_IDLE_* */
> +	unsigned int gc_urgent_idle_remaining;
> +	unsigned int gc_urgent_high_remaining;	/* deprecated */
>   
>   	/* for skip statistic */
>   	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index e0ff99c7e3f2..0ed5b3c5922c 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -152,14 +152,14 @@ static int gc_thread_func(void *data)
>   		/* balancing f2fs's metadata periodically */
>   		f2fs_balance_fs_bg(sbi, true);
>   next:
> -		if (sbi->gc_mode == GC_URGENT_HIGH) {
> -			spin_lock(&sbi->gc_urgent_high_lock);
> -			if (sbi->gc_urgent_high_remaining) {
> -				sbi->gc_urgent_high_remaining--;
> -				if (!sbi->gc_urgent_high_remaining)
> +		if (sbi->gc_mode != GC_NORMAL) {
> +			spin_lock(&sbi->gc_urgent_idle_lock);
> +			if (sbi->gc_urgent_idle_remaining) {
> +				sbi->gc_urgent_idle_remaining--;
> +				if (!sbi->gc_urgent_idle_remaining)
>   					sbi->gc_mode = GC_NORMAL;
>   			}
> -			spin_unlock(&sbi->gc_urgent_high_lock);
> +			spin_unlock(&sbi->gc_urgent_idle_lock);
>   		}
>   		sb_end_write(sbi->sb);
>   
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 3834ead04620..f90a8c0a53ec 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3616,7 +3616,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>   	sbi->seq_file_ra_mul = MIN_RA_MUL;
>   	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
>   	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
> -	spin_lock_init(&sbi->gc_urgent_high_lock);
> +	spin_lock_init(&sbi->gc_urgent_idle_lock);
>   	atomic64_set(&sbi->current_atomic_write, 0);
>   
>   	sbi->dir_level = DEF_DIR_LEVEL;
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index df27afd71ef4..2b1c653b37cf 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -531,10 +531,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   		return count;
>   	}
>   
> -	if (!strcmp(a->attr.name, "gc_urgent_high_remaining")) {
> -		spin_lock(&sbi->gc_urgent_high_lock);
> -		sbi->gc_urgent_high_remaining = t;
> -		spin_unlock(&sbi->gc_urgent_high_lock);
> +	/* deprecated */
> +	if (!strcmp(a->attr.name, "gc_urgent_high_remaining"))
> +		return -EINVAL;

How about those users who has already used these interface... it breaks
the usage.

It needs to keep old interface and tag as deprecated, and recommend user
to use new interface you introduced.

e.g.:

What:           /sys/fs/f2fs/<disk>/features
Date:           July 2017
Contact:        "Jaegeuk Kim" <jaegeuk@kernel.org>
Description:    <deprecated: should use /sys/fs/f2fs/<disk>/feature_list/
                 Shows all enabled features in current device.
                 Supported features:
                 encryption, blkzoned, extra_attr, projquota, inode_checksum,
                 flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
                 verity, sb_checksum, casefold, readonly, compression, pin_file.

Thanks,

> +
> +	if (!strcmp(a->attr.name, "gc_urgent_idle_remaining")) {
> +		spin_lock(&sbi->gc_urgent_idle_lock);
> +		sbi->gc_urgent_idle_remaining = t;
> +		spin_unlock(&sbi->gc_urgent_idle_lock);
>   
>   		return count;
>   	}
> @@ -826,6 +830,7 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_idle_remaining, gc_urgent_idle_remaining);
>   F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
>   F2FS_GENERAL_RO_ATTR(dirty_segments);
>   F2FS_GENERAL_RO_ATTR(free_segments);
> @@ -953,6 +958,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(data_io_flag),
>   	ATTR_LIST(node_io_flag),
>   	ATTR_LIST(gc_urgent_high_remaining),
> +	ATTR_LIST(gc_urgent_idle_remaining),
>   	ATTR_LIST(ckpt_thread_ioprio),
>   	ATTR_LIST(dirty_segments),
>   	ATTR_LIST(free_segments),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
