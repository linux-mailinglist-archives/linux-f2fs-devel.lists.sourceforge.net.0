Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FEB14047
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jul 2025 18:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vb8umvaPYp6UlvTjPdeSEDViLLNmWcVCBI7v9cV2HY4=; b=W/mep9oG8mRyL2eoUoiBuKB7nb
	7mFr8NbXohQRL5UopmgfBNdpI7/HWrSukWLRKVtdibyNqqQONDqeRPkwkg1dIHWZ9HeLgVYKHg5eo
	/5jQk1gFMF6pigQHKrNQV31REDrcSEeWHHVDJ77DpFlm+EE+eYHWChs/HR08nIehkaSI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugQhu-0001l2-5B;
	Mon, 28 Jul 2025 16:28:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ugQht-0001kt-07
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BZg+ApNcBOzJUMbbdleC5A9Q+2d4bkaiggYTcam4Qc0=; b=V1KBoNZMKD2ooMEApGI0dCLX8p
 kfYq0/o/HXmoO1FPU1aV9RD8uv86J4Us+yKGlcpDm/o5W1aJT44HSr0jQtF7a6aZJ1Y8DdIee2CPk
 +WayAzWOKB+aHZm3rjUTTr3IqV8G6/rItlXz7mG4jLv0g4L4V9e6uyBo0AMXczzJSI0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BZg+ApNcBOzJUMbbdleC5A9Q+2d4bkaiggYTcam4Qc0=; b=EQp0hhmBPjaFeW8sffM1i4PHEA
 J6TG+foGUNYTfcdyIokEPDU6SmdRLPoMgwTxRdUkEbn6aSqJJNmq6Gzn3xa/HUhFtnBK4/8Lb/ih9
 n3dxit0Jin6ia4MYoesk/go74umxRoXLaJbm5eM/95u4+qEMxmOeK44tfqJjnN8AEo5Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ugQhs-0006Yj-Ag for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Jul 2025 16:28:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF1045C6332;
 Mon, 28 Jul 2025 16:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C00C4CEE7;
 Mon, 28 Jul 2025 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753720077;
 bh=jaYdpvSZph5GN/uLRWaaBmC73dJtiUOC1QnK3SoCOv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7+jYF8JA+4m49qo7TqKaDtoHNnU4AlELj4bsUwGS+XqBJJ5wJrOnV8/O1kN0OHjF
 MtMA75KOzWO9yTwDH/UxGt2sRDVX3r70KquzUAPbbhisgsSjP8igCCZnSSLGssw66x
 OK7TxGgpqIK18sJilR5KOLjPhQ1RoYInTAEfBUd6CTwAp3GnlSPocRIujOett/n1I3
 HuWu7SqNC48Jl++MdUYjqYiBE4251w2N58HIhvFbHG7jQr41e3SMzWA/KsqZly8fQx
 ehwNAfGyO555z/zPpOGdqtz2aBdnukq4fIU1ItCNC9wuKfcdSlZq4L3sU93oftzmTQ
 HIfDynnLN42/w==
Date: Mon, 28 Jul 2025 16:27:55 +0000
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Message-ID: <aIelC5HYSNEfV3Fx@google.com>
References: <20250723084955.547901-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250723084955.547901-1-liaoyuanhong@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I think this is a simple hack, so NAK. It seems the ask is
 to support storage tiering, and we need to design a better approach. Something
 like allocating a section per defined device priority. On 07/23, Liao Yuanhong
 wrote: > During the development process, we encounter the following two issues:
 > > 1.In a multi-device scenario, it's likely that two devices exhibit >
 inconsistent performanc [...] 
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
X-Headers-End: 1ugQhs-0006Yj-Ag
Subject: Re: [f2fs-dev] [PATCH] f2fs:Add adjustable write endpoints for
 multiple devices
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I think this is a simple hack, so NAK.

It seems the ask is to support storage tiering, and we need to design a better
approach. Something like allocating a section per defined device priority.

On 07/23, Liao Yuanhong wrote:
> During the development process, we encounter the following two issues:
> 
> 1.In a multi-device scenario, it's likely that two devices exhibit
> inconsistent performance, causing fluctuations in performance and making
> usage and testing inconvenient. Under normal circumstances, we hope to
> prioritize the use of the device with better performance and consider the
> device with poorer performance when space is insufficient. Using reuse
> mode can solve some of the issues, but tests reveal that the fragmentation
> degree in reuse mode is significantly higher than in default mode, which
> poses performance risks.
> 
> 2.We need to examine the differences in data placement for different sizes
> of storage devices under specific write patterns. Currently, this
> comparison can only be made by switching storage devices.
> 
> To address the above issues, I am considering adding a last_secno node. By
> adjusting this node, we can change the end of the addressing in
> get_new_segment so that it readdresses from 0 once the set value is
> reached. The default value of the node is the maximum number of sections
> for the current storage device, so making no modifications will not affect
> the current logic. If the space before the set value is already filled with
> valid data, it will normally write into the free area after the set value.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
>  fs/f2fs/f2fs.h                          | 1 +
>  fs/f2fs/segment.c                       | 4 ++--
>  fs/f2fs/super.c                         | 1 +
>  fs/f2fs/sysfs.c                         | 9 +++++++++
>  5 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index c2a233f2a085..e5ad8dc70cb6 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -870,3 +870,11 @@ Description:	This threshold is used to control triggering garbage collection whi
>  		reserved section before preallocating on pinned file.
>  		By default, the value is ovp_sections, especially, for zoned ufs, the
>  		value is 1.
> +
> +What:		/sys/fs/f2fs/<disk>/last_secno
> +Date:		July 2025
> +Contact:	"Yuanhong Liao" <liaoyuanhong@vivo.com>
> +Description:	This node is used to adjust the addressing end of f2fs when writing.
> +		The default value is the maximum number of sections in the storage. If the
> +		frontend space is full after adjusting the address, it will still address to
> +		the back of the address until reaching the end of the memory.
> \ No newline at end of file
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e6dcd7e6f47c..7d93d8671033 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1802,6 +1802,7 @@ struct f2fs_sb_info {
>  	spinlock_t dev_lock;			/* protect dirty_device */
>  	bool aligned_blksize;			/* all devices has the same logical blksize */
>  	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
> +	unsigned int last_secno;		/* for adjust the end of target device */
>  
>  	/* For write statistics */
>  	u64 sectors_written_start;
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index cc82d42ef14c..192619bb2034 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2811,7 +2811,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>  	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>  
>  #ifdef CONFIG_BLK_DEV_ZONED
> -	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
> +	if (secno >= sbi->last_secno && f2fs_sb_has_blkzoned(sbi)) {
>  		/* Write only to sequential zones */
>  		if (sbi->blkzone_alloc_policy == BLKZONE_ALLOC_ONLY_SEQ) {
>  			hint = GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone_segno);
> @@ -2827,7 +2827,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>  	}
>  #endif
>  
> -	if (secno >= MAIN_SECS(sbi)) {
> +	if (secno >= sbi->last_secno) {
>  		secno = find_first_zero_bit(free_i->free_secmap,
>  							MAIN_SECS(sbi));
>  		if (secno >= MAIN_SECS(sbi)) {
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 30c038413040..5b7de0734da7 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3859,6 +3859,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>  	segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
>  	secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
>  	total_sections = le32_to_cpu(raw_super->section_count);
> +	sbi->last_secno = total_sections;
>  
>  	/* blocks_per_seg should be 512, given the above check */
>  	blocks_per_seg = BIT(le32_to_cpu(raw_super->log_blocks_per_seg));
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index bdef926b3377..a4ab5c38e883 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -649,6 +649,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "last_secno")) {
> +		if (t < 0 || t > MAIN_SECS(sbi))
> +			return -EINVAL;
> +		sbi->last_secno = t;
> +		return count;
> +	}
> +
>  #ifdef CONFIG_F2FS_IOSTAT
>  	if (!strcmp(a->attr.name, "iostat_enable")) {
>  		sbi->iostat_enable = !!t;
> @@ -1122,6 +1129,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
>  F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
>  F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
>  F2FS_SBI_GENERAL_RW_ATTR(dir_level);
> +F2FS_SBI_GENERAL_RW_ATTR(last_secno);
>  #ifdef CONFIG_F2FS_IOSTAT
>  F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
>  F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
> @@ -1285,6 +1293,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(discard_idle_interval),
>  	ATTR_LIST(gc_idle_interval),
>  	ATTR_LIST(umount_discard_timeout),
> +	ATTR_LIST(last_secno),
>  #ifdef CONFIG_F2FS_IOSTAT
>  	ATTR_LIST(iostat_enable),
>  	ATTR_LIST(iostat_period_ms),
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
