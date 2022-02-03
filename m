Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A71E14A86DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Feb 2022 15:47:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nFdO8-0006Ep-WE; Thu, 03 Feb 2022 14:47:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nFdO7-0006EW-4M
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 14:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vmj6dU6P2r9mv3eP4ZrpjDBOA9CSjIXn9dLzH2YcT64=; b=kiUJGWArtwhcjM8bUlddnmkQ6p
 8PTs7GOCAURKH6JldIHs8x+LUQrRW9nAWFhdXqfDxfb8Cv0uh5QFW5eY47A8jqMBhKLY42dFxE280
 MCiybkm5CcHjaoc2naZjYoktaQJgOORm99TuPxhiMm3Q4Vy/3sC5is/BFF9qI4UIVPEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vmj6dU6P2r9mv3eP4ZrpjDBOA9CSjIXn9dLzH2YcT64=; b=mxmBg2tDsb0qB6xaYI52r4FsQz
 qMUmCyu3OdNPPF4jR7c5DKs1780FavgEfG1jORCkVbDNi+XD5trhIX5UFstNk5HIPqdOj8IALJJjE
 yA4nTbYBfH2tuc0IWrU/B5LsqWdR50zaqJNRKUOC1wfBivDDucTAXirPtdzaz9tqGla4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFdO1-0005fp-7o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Feb 2022 14:47:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7247861A11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Feb 2022 14:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DC49C340ED;
 Thu,  3 Feb 2022 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643899612;
 bh=vL16p4UfH1QlfC3k83iqhPwqSj25CS+PjfWpKC1+0ho=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=IPVfWeOs5GwLNMjzD8TgWQbzk2UwWs3Gi0FIywxqoyeL0k9Da61h/K1vjCmmRppHv
 ++cQ7dS7u/Kp+ASMCI4juIT6lRSpIgR7Xvz2WE9rdm6I87lkAq6qgu1qPYFlNQwrRj
 6vG2ZhXZKK90KFzMkNXWbcZ9hzumtu8QP8M6/1ooXCb46v5YGQwb1S2QbtRLiWBYBx
 P2MmUKp/dvG/Oy2f0UC1Y2dRAoZHvsjQDtk3YcRB+CsFqP5Kv7rQQ4AnpaBc6tKqKu
 dvEWCeDHDpbIpan5VW5bhLY+U8X4pU0+ES7d+8vRrYT1Z5d2KPgwM3FJSTy/jfxW1R
 zJev0BeYhysWQ==
Message-ID: <142d2cc9-73f2-f9fa-2543-6426c62e77a6@kernel.org>
Date: Thu, 3 Feb 2022 22:46:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220127214102.2040254-1-jaegeuk@kernel.org>
 <YfsjEb2ii3eyPzng@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YfsjEb2ii3eyPzng@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/3 8:34,
 Jaegeuk Kim wrote: > This adds a sysfs entry
 to call checkpoint during fsync() in order to avoid > long elapsed time to
 run roll-forward recovery when booting the device. > Default v [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nFdO1-0005fp-7o
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add a way to limit roll forward
 recovery time
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/2/3 8:34, Jaegeuk Kim wrote:
> This adds a sysfs entry to call checkpoint during fsync() in order to avoid
> long elapsed time to run roll-forward recovery when booting the device.
> Default value doesn't enforce the limitation which is same as before.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v2 from v1:
>   - make the default w/o enforcement
> 
>   Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
>   fs/f2fs/checkpoint.c                    | 1 +
>   fs/f2fs/f2fs.h                          | 3 +++
>   fs/f2fs/node.c                          | 2 ++
>   fs/f2fs/node.h                          | 3 +++
>   fs/f2fs/recovery.c                      | 4 ++++
>   fs/f2fs/sysfs.c                         | 2 ++
>   7 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 87d3884c90ea..ce8103f522cb 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -567,3 +567,9 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
>   Description:	You can set the trial count limit for GC urgent high mode with this value.
>   		If GC thread gets to the limit, the mode will turn back to GC normal mode.
>   		By default, the value is zero, which means there is no limit like before.
> +
> +What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
> +Date:		January 2022
> +Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> +Description:	Controls max # of node block writes to be used for roll forward
> +		recovery. This can limit the roll forward recovery time.
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index deeda95688f0..57a2d9164bee 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1543,6 +1543,7 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>   	/* update user_block_counts */
>   	sbi->last_valid_block_count = sbi->total_valid_block_count;
>   	percpu_counter_set(&sbi->alloc_valid_block_count, 0);
> +	percpu_counter_set(&sbi->rf_node_block_count, 0);
>   
>   	/* Here, we have one bio having CP pack except cp pack 2 page */
>   	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 63c90416364b..6ddb98ff0b7c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -913,6 +913,7 @@ struct f2fs_nm_info {
>   	nid_t max_nid;			/* maximum possible node ids */
>   	nid_t available_nids;		/* # of available node ids */
>   	nid_t next_scan_nid;		/* the next nid to be scanned */
> +	nid_t max_rf_node_blocks;	/* max # of nodes for recovery */
>   	unsigned int ram_thresh;	/* control the memory footprint */
>   	unsigned int ra_nid_pages;	/* # of nid pages to be readaheaded */
>   	unsigned int dirty_nats_ratio;	/* control dirty nats ratio threshold */
> @@ -1684,6 +1685,8 @@ struct f2fs_sb_info {
>   	atomic_t nr_pages[NR_COUNT_TYPE];
>   	/* # of allocated blocks */
>   	struct percpu_counter alloc_valid_block_count;
> +	/* # of node block writes as roll forward recovery */
> +	struct percpu_counter rf_node_block_count;
>   
>   	/* writeback control */
>   	atomic_t wb_sync_req[META];	/* count # of WB_SYNC threads */
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 93512f8859d5..0d9883457579 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1782,6 +1782,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   
>   			if (!atomic || page == last_page) {
>   				set_fsync_mark(page, 1);
> +				percpu_counter_inc(&sbi->rf_node_block_count);

if (NM_I(sbi)->max_rf_node_blocks)
	percpu_counter_inc(&sbi->rf_node_block_count);

Thanks,

>   				if (IS_INODE(page)) {
>   					if (is_inode_flag_set(inode,
>   								FI_DIRTY_INODE))
> @@ -3218,6 +3219,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>   	nm_i->ram_thresh = DEF_RAM_THRESHOLD;
>   	nm_i->ra_nid_pages = DEF_RA_NID_PAGES;
>   	nm_i->dirty_nats_ratio = DEF_DIRTY_NAT_RATIO_THRESHOLD;
> +	nm_i->max_rf_node_blocks = DEF_RF_NODE_BLOCKS;
>   
>   	INIT_RADIX_TREE(&nm_i->free_nid_root, GFP_ATOMIC);
>   	INIT_LIST_HEAD(&nm_i->free_nid_list);
> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
> index 18b98cf0465b..4c1d34bfea78 100644
> --- a/fs/f2fs/node.h
> +++ b/fs/f2fs/node.h
> @@ -31,6 +31,9 @@
>   /* control total # of nats */
>   #define DEF_NAT_CACHE_THRESHOLD			100000
>   
> +/* control total # of node writes used for roll-fowrad recovery */
> +#define DEF_RF_NODE_BLOCKS			0
> +
>   /* vector size for gang look-up from nat cache that consists of radix tree */
>   #define NATVEC_SIZE	64
>   #define SETVEC_SIZE	32
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 10d152cfa58d..1c8041fd854e 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -53,9 +53,13 @@ extern struct kmem_cache *f2fs_cf_name_slab;
>   bool f2fs_space_for_roll_forward(struct f2fs_sb_info *sbi)
>   {
>   	s64 nalloc = percpu_counter_sum_positive(&sbi->alloc_valid_block_count);
> +	u32 rf_node = percpu_counter_sum_positive(&sbi->rf_node_block_count);
>   
>   	if (sbi->last_valid_block_count + nalloc > sbi->user_block_count)
>   		return false;
> +	if (NM_I(sbi)->max_rf_node_blocks &&
> +			rf_node >= NM_I(sbi)->max_rf_node_blocks)
> +		return false;
>   	return true;
>   }
>   
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 281bc0133ee6..47efcf233afd 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -732,6 +732,7 @@ F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ssr_sections, min_ssr_sections);
>   F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ram_thresh, ram_thresh);
>   F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ra_nid_pages, ra_nid_pages);
>   F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, dirty_nats_ratio, dirty_nats_ratio);
> +F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, max_roll_forward_node_blocks, max_rf_node_blocks);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_victim_search, max_victim_search);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, migration_granularity, migration_granularity);
>   F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, dir_level, dir_level);
> @@ -855,6 +856,7 @@ static struct attribute *f2fs_attrs[] = {
>   	ATTR_LIST(ram_thresh),
>   	ATTR_LIST(ra_nid_pages),
>   	ATTR_LIST(dirty_nats_ratio),
> +	ATTR_LIST(max_roll_forward_node_blocks),
>   	ATTR_LIST(cp_interval),
>   	ATTR_LIST(idle_interval),
>   	ATTR_LIST(discard_idle_interval),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
