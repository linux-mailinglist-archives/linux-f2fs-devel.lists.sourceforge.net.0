Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCCA3ECCCF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 04:53:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFSkg-0000YF-Oq; Mon, 16 Aug 2021 02:53:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mFSkf-0000Y8-K1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3tOqlamrJdeBgNCW5MhiDxIFRmJdwgDbPF4boXDW6Pc=; b=I1LCTjQk2PkfRxC0lJn4/VUqKc
 xbeoCIGD8BsIUYiK9ELTKD4VBUxFZ7FdWTDuGfNN4OYOtSbZr4fFSg6nmxyrUpwUNPwAUNT406yw4
 Hxt4aiBm8ITd0oRacF86pbsZVft3qCKjK6dFGerlxcC/wyLq7kC5OYoTifIObbLkNbkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3tOqlamrJdeBgNCW5MhiDxIFRmJdwgDbPF4boXDW6Pc=; b=k6jNqwluFOAF7F53QY+X1HXQ6+
 RgGWcQx6ZIU4nEa/bUU018YsioZWmmQO3l6L7OYSyzXq1fI4Yt5o0k72OqLtocJVZIJoBVaCx+P4L
 a2rOwSTbH6Ee8wxyfumqd8BvPhga4nRKmIOUoAZRI/Ym1nXy54y9YHYZfgkcqIb7wiYk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFSkd-0003gJ-Vv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 02:53:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D771761458;
 Mon, 16 Aug 2021 02:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629082393;
 bh=CvwroGxeDKAQDdpZryAMY6dfaNVpPGDptgQqT5qEPxI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kE124kRLRluccADxTpKOBcTEH7hiQzFCJl5LtIFVainSW/2LXxcG6QJ7mpn5BPvHK
 MtvM5CNqn9Pn+CeNHiz4u9v8GaPaxkDcEqpyw85V7eCewepNBnKfE2R0MSy3WcXCxM
 wj1rbBeAnYaMKBSg7DSjvruK9ibKriCBKM7XWCzFhd18rl3ksKDPxRChdnkhvHb8I1
 KUL0K5T5P67byVtdrVBkaiUNB9qLecnII+4IVGB13W114OzaTLFlX2gtGA7gHMHyrV
 rxUcB0bfoRiMD9tnd5CWhctR4UfpdO/ZFH4nZEZU7/UcGnAkiFkt+1RiIL6du+DUWB
 IiVtrTuC5dOWQ==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210814103702.52405-1-frank.li@vivo.com>
 <20210814103702.52405-2-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <3d4a6b65-9520-4a0f-07e6-bf8fc8769b2f@kernel.org>
Date: Mon, 16 Aug 2021 10:53:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210814103702.52405-2-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mFSkd-0003gJ-Vv
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: introduce
 /sys/fs/f2fs/<disk>/fsck_stack node
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

On 2021/8/14 18:37, Yangtao Li wrote:
> SBI_NEED_FSCK is an indicator that fsck.f2fs needs to be triggered,
> this flag is set in too many places. For some scenes that are not very
> reproducible, adding stack information will help locate the problem.
> 
> Let's record all fsck stack history, I added F2FS_FSCK_STACK_TRACE
> configuration options and sysfs nodes. After opening the configuration
> options and enabling the node, it will start recording. The recorded
> stack information will not be clear, and we can get information form
> kernel log.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++++
>   fs/f2fs/Kconfig                         | 10 ++++++
>   fs/f2fs/f2fs.h                          | 45 +++++++++++++++++++++++++
>   fs/f2fs/sysfs.c                         | 27 +++++++++++++++
>   4 files changed, 89 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index ef4b9218ae1e..047c398093cf 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -493,3 +493,10 @@ Contact:	"Chao Yu" <yuchao0@huawei.com>
>   Description:	When ATGC is on, it controls age threshold to bypass GCing young
>   		candidates whose age is not beyond the threshold, by default it was
>   		initialized as 604800 seconds (equals to 7 days).
> +
> +What:		/sys/fs/f2fs/<disk>/fsck_stack
> +Date:		August 2021
> +Contact:	"Yangtao Li" <frank.li@vivo.com>
> +Description:	Controls to enable/disable fsck stack trace, you can get stack
> +		information from kernel log. Note that the recorded stack information
> +		will not be cleared.

Again, please don't add this into sysfs.

> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 7669de7b49ce..f451e567e4a8 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -135,3 +135,13 @@ config F2FS_FS_LZORLE
>   	default y
>   	help
>   	  Support LZO-RLE compress algorithm, if unsure, say Y.
> +
> +config F2FS_FSCK_STACK_TRACE

I don't think we need another config to wrap this functionality, may be we
can use F2FS_CHECK_FS instead.

> +	bool "F2FS fsck stack information record"
> +	depends on F2FS_FS
> +	depends on STACKDEPOT
> +	default y
> +	help
> +	 Support printing out fsck stack history. With this, you have to
> +	 turn on "fsck_stack" sysfs node. Then you can get information
> +	 from kernel log.
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ee8eb33e2c25..b2d1d1a5a3fc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -24,6 +24,8 @@
>   #include <linux/quotaops.h>
>   #include <linux/part_stat.h>
>   #include <crypto/hash.h>
> +#include <linux/stackdepot.h>
> +#include <linux/stacktrace.h>
>   
>   #include <linux/fscrypt.h>
>   #include <linux/fsverity.h>
> @@ -117,6 +119,8 @@ typedef u32 nid_t;
>   
>   #define COMPRESS_EXT_NUM		16
>   
> +#define FSCK_STACK_DEPTH		64

16?

> +
>   struct f2fs_mount_info {
>   	unsigned int opt;
>   	int write_io_size_bits;		/* Write IO size bits */
> @@ -1748,6 +1752,11 @@ struct f2fs_sb_info {
>   	unsigned int compress_watermark;	/* cache page watermark */
>   	atomic_t compress_page_hit;		/* cache hit count */
>   #endif
> +#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
> +	depot_stack_handle_t *fsck_stack_history;
> +	unsigned int fsck_count;
> +	bool fsck_stack;

IMO, all bug_on()s are corner cases, and catching those stacks won't cost
much, so we can just use CONFIG_XXX to enable/disable this feature.

> +#endif
>   };
>   
>   struct f2fs_private_dio {
> @@ -1954,6 +1963,38 @@ static inline struct address_space *NODE_MAPPING(struct f2fs_sb_info *sbi)
>   	return sbi->node_inode->i_mapping;
>   }
>   
> +#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
> +static void fsck_stack_trace(struct f2fs_sb_info *sbi)
> +{
> +	unsigned long entries[FSCK_STACK_DEPTH];
> +	depot_stack_handle_t stack, *new;
> +	unsigned int nr_entries;
> +	int i;
> +
> +	if (!sbi->fsck_stack)
> +		return;
> +
> +	nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 0);
> +	nr_entries = filter_irq_stacks(entries, nr_entries);
> +	stack = stack_depot_save(entries, nr_entries, GFP_KERNEL);
> +	if (!stack)
> +		return;
> +
> +	/* Try to find an existing entry for this backtrace */
> +	for (i = 0; i < sbi->fsck_count; i++)
> +		if (sbi->fsck_stack_history[i] == stack)
> +			return;
> +
> +	new = krealloc(sbi->fsck_stack_history, (sbi->fsck_count + 1) *
> +		       sizeof(*sbi->fsck_stack_history), GFP_KERNEL);
> +	if (!new)
> +		return;
> +
> +	sbi->fsck_stack_history = new;
> +	sbi->fsck_stack_history[sbi->fsck_count++] = stack;

It will case memory leak after f2fs module exits.

> +}
> +#endif
> +
>   static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>   {
>   	return test_bit(type, &sbi->s_flag);
> @@ -1962,6 +2003,10 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>   static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>   {
>   	set_bit(type, &sbi->s_flag);
> +#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
> +	if (unlikely(type == SBI_NEED_FSCK))
> +		fsck_stack_trace(sbi);
> +#endif
>   }
>   
>   static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 204de4c2c818..4e786bb797e7 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -306,6 +306,26 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
>   	if (!strcmp(a->attr.name, "compr_new_inode"))
>   		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
>   #endif
> +#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
> +	if (!strcmp(a->attr.name, "fsck_stack")) {
> +		unsigned long *entries;
> +		unsigned int nr_entries;
> +		unsigned int i;
> +		int count;
> +
> +		count = sysfs_emit(buf, "%u\n", sbi->fsck_stack);
> +		if (!sbi->fsck_stack)
> +			return count;
> +
> +		for (i = 0; i < sbi->fsck_count; i++) {
> +			nr_entries = stack_depot_fetch(sbi->fsck_stack_history[i], &entries);
> +			if (!entries)
> +				return count;
> +			stack_trace_print(entries, nr_entries, 0);
> +		}
> +		return count;
> +	}
> +#endif
>   
>   	ui = (unsigned int *)(ptr + a->offset);
>   
> @@ -740,6 +760,10 @@ F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_cou
>   F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
>   F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
>   
> +#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
> +F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, fsck_stack, fsck_stack);
> +#endif
> +
>   #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
>   static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(gc_urgent_sleep_time),
> @@ -812,6 +836,9 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(atgc_candidate_count),
>   	ATTR_LIST(atgc_age_weight),
>   	ATTR_LIST(atgc_age_threshold),
> +#ifdef CONFIG_F2FS_FSCK_STACK_TRACE
> +	ATTR_LIST(fsck_stack),
> +#endif
>   	NULL,
>   };
>   ATTRIBUTE_GROUPS(f2fs);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
