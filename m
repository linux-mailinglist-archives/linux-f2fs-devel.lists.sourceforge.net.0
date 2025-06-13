Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD84AD8407
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 09:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1s2DqJOEKpluDi+99UMZ+aPi1MgLiHjdMmsaqSDGUM=; b=ifxvZnNtgRGqpIAyPW9KHCOP5l
	2PNGch+BWp9c6XDWjJcr2I/IvDIY8nH/ZXEY9XqE3+oroQXO3QnUSs9f32ogT1lUJKOCrVWg+EIZT
	cC3kM+dhxZYj1ZJsKHDpgVeMkIgiEuDjzrpfTUW/aGJEVKtRS8aRqAxhq4uQ8+kP6d3c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPyry-0006bc-OA;
	Fri, 13 Jun 2025 07:30:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPyrx-0006bN-Hx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 07:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tc6JVCgotV7mEw57Nx+LFfQWE4G81lqBzDgyBHIJJxU=; b=QYpsD1LtjksNkl8MOZtswpJjkN
 kT1qWp/2oOlqXcaQCrsK9vfbMC59ShbyyWYT3VHW06ejI7BD2m+C1S1GPxpFVBOiRVj/bxcFqN20H
 NK+RQruj05E/LpviK1vuwGhHF+KgnpkxbvoCK8SotIWKi3jYqMHl9lUZJ2XGJDEiOkUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tc6JVCgotV7mEw57Nx+LFfQWE4G81lqBzDgyBHIJJxU=; b=XMkKKqjxo6txHz910vF22P9WSz
 6PyQDjOqxO5j4T5zjYQMIw4pbTrbAHHliwmIth9izZARyTOzdDixWFAIzFIp7hYl5mw1YqDaa7kQG
 D9hW5I4wRnUwYTGWmdXnZpkikxbshOFErzGts23hQvq+rfxv2+ZkrwTDrad0lu5q4B+c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPyrw-0006gX-PB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 07:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2CA0945343;
 Fri, 13 Jun 2025 07:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9E7C4CEE3;
 Fri, 13 Jun 2025 07:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749799822;
 bh=3PndtDWZcs+QxHU7bDkvEbXY0nBLX/Xt/dqPotjqXNQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SuHn/c2+oYeOSJY/3/gCwRBN4KKRuE4VrXlzeUGssKB3M8KoeREYsBI6EK1NFUJBB
 0Wf8ReBT8f3u92pZxloHCBShn1Ggp5QzfE0rJSxHzdSVofg7KjM4Zbn/CY+iEQ310v
 JnZp4+ktg5513rnayg978/y0bxd4VO5S+eDN73F4l6HoUv5pFRDcIoW2cscCdrQ2wm
 xr0MpiPjre/LH+tOOfUv/fXu4t811p7lu+fZSRJySX6qW22Yfq/QBtycxEEJ4ruRpI
 UWHPos6Y19YP04XfYAv5VFOa9S6tnt3f+TeqI4QxmA0RPe2O9hYi/zST/zwMpSJyXH
 KX4PUyv86slaQ==
Message-ID: <d5f578c0-a685-4b22-bccb-4f856b0e3bce@kernel.org>
Date: Fri, 13 Jun 2025 15:30:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250610123743.667183-1-shengyong1@xiaomi.com>
 <20250610123743.667183-11-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250610123743.667183-11-shengyong1@xiaomi.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/10 20:37,
 Sheng Yong wrote: > From: Sheng Yong <shengyong1@xiaomi.com>
 > > The following members are added to inject more fields in cp: > > *
 next_blkaddr: inject fsync dnodes > > An error i [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPyrw-0006gX-PB
Subject: Re: [f2fs-dev] [RFC PATCH v2 10/32] inject.f2fs: add members in
 inject_cp
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
Cc: shengyong1@xiaomi.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/10 20:37, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> The following members are added to inject more fields in cp:
> 
> * next_blkaddr: inject fsync dnodes
> 
> An error is returned if no fsync dnode is found.
> 
> However, the injection is not supported on zoned device. This is because
> fsync dnodes must remains at the end of current warm node segment, any
> dnode change causes all previous dnodes in the chain to be updated
> out-of-place, and there may not have enough space left in the curseg.
> To simplify the injection, it returns an error on zoned device.
> 
> * alloc_type: inject curseg's alloc type
> * crc: inject cp's checksum
> * elapsed_time: inject cp's mount elapsed time
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
>   fsck/fsck.h       |  4 ++-
>   fsck/inject.c     | 85 ++++++++++++++++++++++++++++++++++++++++++++++-
>   fsck/mount.c      | 18 +++++-----
>   man/inject.f2fs.8 | 11 +++++-
>   4 files changed, 107 insertions(+), 11 deletions(-)
> 
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index 40cb6d9a6417..05daa2de9531 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -223,6 +223,8 @@ extern int f2fs_ra_meta_pages(struct f2fs_sb_info *, block_t, int, int);
>   extern int f2fs_do_mount(struct f2fs_sb_info *);
>   extern void f2fs_do_umount(struct f2fs_sb_info *);
>   extern int f2fs_sparse_initialize_meta(struct f2fs_sb_info *);
> +extern int f2fs_find_fsync_inode(struct f2fs_sb_info *, struct list_head *);
> +extern void f2fs_destroy_fsync_dnodes(struct list_head *);
>   
>   extern void flush_journal_entries(struct f2fs_sb_info *);
>   extern void update_curseg_info(struct f2fs_sb_info *, int);
> @@ -239,7 +241,7 @@ extern void duplicate_checkpoint(struct f2fs_sb_info *);
>   extern void write_checkpoint(struct f2fs_sb_info *);
>   extern void write_checkpoints(struct f2fs_sb_info *);
>   extern void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
> -			struct f2fs_checkpoint *cp, int which);
> +			struct f2fs_checkpoint *cp, int which, bool update_crc);
>   extern void update_superblock(struct f2fs_super_block *, int);
>   extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
>   			struct f2fs_node *);
> diff --git a/fsck/inject.c b/fsck/inject.c
> index c879ca99c0d8..53667730775f 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -139,6 +139,10 @@ static void inject_cp_usage(void)
>   	MSG(0, "  cur_node_blkoff: inject cur_node_blkoff array selected by --idx <index>\n");
>   	MSG(0, "  cur_data_segno: inject cur_data_segno array selected by --idx <index>\n");
>   	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
> +	MSG(0, "  alloc_type: inject alloc_type array selected by --idx <index>\n");
> +	MSG(0, "  next_blkaddr: inject next_blkaddr of fsync dnodes selected by --idx <index>\n");
> +	MSG(0, "  crc: inject crc checksum\n");
> +	MSG(0, "  elapsed_time: inject elapsed_time\n");
>   }
>   
>   static void inject_nat_usage(void)
> @@ -443,6 +447,7 @@ out:
>   static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   {
>   	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
> +	bool update_crc = true;
>   	char *buf = NULL;
>   	int ret = 0;
>   
> @@ -521,6 +526,84 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   		    opt->idx, opt->cp, get_cp(cur_data_blkoff[opt->idx]),
>   		    (u16)opt->val);
>   		set_cp(cur_data_blkoff[opt->idx], (u16)opt->val);
> +	} else if (!strcmp(opt->mb, "alloc_type")) {
> +		if (opt->idx >= MAX_ACTIVE_LOGS) {
> +			ERR_MSG("invalid index %u of cp->alloc_type[]\n",
> +				opt->idx);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +		MSG(0, "Info: inject alloc_type[%d] of cp %d: 0x%x -> 0x%x\n",
> +		    opt->idx, opt->cp, cp->alloc_type[opt->idx],
> +		    (unsigned char)opt->val);
> +		cp->alloc_type[opt->idx] = (unsigned char)opt->val;
> +	} else if (!strcmp(opt->mb, "next_blkaddr")) {
> +		struct fsync_inode_entry *entry;
> +		struct list_head inode_list = LIST_HEAD_INIT(inode_list);
> +		struct f2fs_node *node;
> +		block_t blkaddr;
> +		int i = 0;
> +
> +		if (c.zoned_model == F2FS_ZONED_HM) {
> +			ERR_MSG("inject fsync dnodes not supported in "
> +				"zoned device\n");
> +			ret = -EOPNOTSUPP;
> +			goto out;
> +		}
> +
> +		if (!need_fsync_data_record(sbi)) {
> +			ERR_MSG("no need to recover fsync dnodes\n");
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		ret = f2fs_find_fsync_inode(sbi, &inode_list);
> +		if (ret) {
> +			ERR_MSG("failed to find fsync inodes: %d\n", ret);
> +			goto out;
> +		}
> +
> +		list_for_each_entry(entry, &inode_list, list) {
> +			if (i == opt->idx)
> +				blkaddr = entry->blkaddr;
> +			DBG(0, "[%4d] blkaddr:0x%x\n", i++, entry->blkaddr);
> +		}
> +
> +		f2fs_destroy_fsync_dnodes(&inode_list);
> +
> +		if (opt->idx == 0 || opt->idx >= i) {
> +			ERR_MSG("invalid index %u of fsync dnodes range [1, %u]\n",

... [0, %u]\n", opt->idx, i - 1);?

> +				opt->idx, i);
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		MSG(0, "Info: inject next_blkaddr[%d] of cp %d: 0x%x -> 0x%x\n",
> +		    opt->idx, opt->cp, blkaddr, (u32)opt->val);
> +
> +		node = malloc(F2FS_BLKSIZE);
> +		ASSERT(node);
> +		ret = dev_read_block(node, blkaddr);
> +		ASSERT(ret >= 0);
> +		F2FS_NODE_FOOTER(node)->next_blkaddr = cpu_to_le32((u32)opt->val);
> +		if (IS_INODE(node))
> +			ret = update_inode(sbi, node, &blkaddr);
> +		else
> +			ret = update_block(sbi, node, &blkaddr, NULL);

free(node);

Thanks,

> +		ASSERT(ret >= 0);
> +		goto out;
> +	} else if (!strcmp(opt->mb, "crc")) {
> +		__le32 *crc = (__le32 *)((unsigned char *)cp +
> +						get_cp(checksum_offset));
> +
> +		MSG(0, "Info: inject crc of cp %d: 0x%x -> 0x%x\n",
> +		    opt->cp, le32_to_cpu(*crc), (u32)opt->val);
> +		*crc = cpu_to_le32((u32)opt->val);
> +		update_crc = false;
> +	} else if (!strcmp(opt->mb, "elapsed_time")) {
> +		MSG(0, "Info: inject elapsed_time of cp %d: %llu -> %"PRIu64"\n",
> +		    opt->cp, get_cp(elapsed_time), (u64)opt->val);
> +		set_cp(elapsed_time, (u64)opt->val);
>   	} else {
>   		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
>   		ret = -EINVAL;
> @@ -528,7 +611,7 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   	}
>   
>   	print_ckpt_info(sbi);
> -	write_raw_cp_blocks(sbi, cp, opt->cp);
> +	write_raw_cp_blocks(sbi, cp, opt->cp, update_crc);
>   
>   out:
>   	free(buf);
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 1f2cc960b9c0..eb019ad6826e 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3503,17 +3503,19 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
>   	write_checkpoint(sbi);
>   }
>   
> -void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
> -			 struct f2fs_checkpoint *cp, int which)
> +void write_raw_cp_blocks(struct f2fs_sb_info *sbi, struct f2fs_checkpoint *cp,
> +			 int which, bool update_crc)
>   {
>   	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
>   	uint32_t crc;
>   	block_t cp_blkaddr;
>   	int ret;
>   
> -	crc = f2fs_checkpoint_chksum(cp);
> -	*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
> +	if (update_crc) {
> +		crc = f2fs_checkpoint_chksum(cp);
> +		*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
>   							cpu_to_le32(crc);
> +	}
>   
>   	cp_blkaddr = get_sb(cp_blkaddr);
>   	if (which == 2)
> @@ -3747,7 +3749,7 @@ static void del_fsync_inode(struct fsync_inode_entry *entry)
>   	free(entry);
>   }
>   
> -static void destroy_fsync_dnodes(struct list_head *head)
> +void f2fs_destroy_fsync_dnodes(struct list_head *head)
>   {
>   	struct fsync_inode_entry *entry, *tmp;
>   
> @@ -3853,7 +3855,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi,
>   	return 0;
>   }
>   
> -static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
> +int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   {
>   	struct curseg_info *curseg;
>   	struct f2fs_node *node_blk, *node_blk_fast;
> @@ -4049,7 +4051,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
>   	if (!need_fsync_data_record(sbi))
>   		return 0;
>   
> -	ret = find_fsync_inode(sbi, &inode_list);
> +	ret = f2fs_find_fsync_inode(sbi, &inode_list);
>   	if (ret)
>   		goto out;
>   
> @@ -4064,7 +4066,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
>   
>   	ret = traverse_dnodes(sbi, &inode_list);
>   out:
> -	destroy_fsync_dnodes(&inode_list);
> +	f2fs_destroy_fsync_dnodes(&inode_list);
>   	return ret;
>   }
>   
> diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
> index 01d58effbfe4..975d8c65030a 100644
> --- a/man/inject.f2fs.8
> +++ b/man/inject.f2fs.8
> @@ -45,7 +45,7 @@ The available \fImb\fP of \fIsb\fP are:
>   .RS 1.2i
>   .TP
>   .BI magic
> -magic numbe.
> +magic number.
>   .TP
>   .BI s_stop_reason
>   s_stop_reason array.
> @@ -79,6 +79,15 @@ cur_data_segno array.
>   .TP
>   .BI cur_data_blkoff
>   cur_data_blkoff array.
> +.TP
> +.BI next_blkaddr
> +fsync dnodes.
> +.TP
> +.BI crc
> +crc checksum.
> +.TP
> +.BI elapsed_time
> +elapsed mount time.
>   .RE
>   .TP
>   .BI \-\-nat " 0 or 1 or 2"



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
