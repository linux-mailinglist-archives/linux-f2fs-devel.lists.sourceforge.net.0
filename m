Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3200B3279E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Aug 2025 10:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcPDmARFsYAV1F71E3MawnhvHBdfcmGi4JyshfZdkqs=; b=TarGvl/j3GCcwniWvQH7zNSDOf
	g9o1sqD8p2ZyDb120F13u/mjII+jQ+SOgcTmKB+gLtTHDYdcwEpMaV/ukkguS2Vx5HXM55jbNHfkD
	tOZYEi7lpbFtLeWxqRB53sBFMGoCpo23lAYUFk6US2xg/hGz+PrGBGOIEWuV6n+ScXKo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1upjcC-0000me-Si;
	Sat, 23 Aug 2025 08:28:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1upjc7-0000mR-Ll
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Aug 2025 08:28:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GVjpO8vKnBUiZ/BPXcNveC4AiQrSSZSfdoyOm1U3UN8=; b=h/rzvgcjxptuq5sGJtIPJpv1Pb
 RVI3prf+lHn14ps/1Huk20C89og4NwrqCy6gKgVQ49DFLGbT8D2UfpzGgerqrm3t1CqhilDhhUiYp
 x7jtOtvdrYeV0Xzjb92Ev4Re6Nv1iSAXHmsdXUmFO8ivkvUTszq/uy8O42w8wMYJVjZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GVjpO8vKnBUiZ/BPXcNveC4AiQrSSZSfdoyOm1U3UN8=; b=Lq8D4NFoqNRVerCp2pTxkS3dcG
 fjvtKVV212+C/2b5kV4Qv/W6nP5bEPOEsEKPtOLcNycLT1DV2xxKAS/SRPrWyUF7C7CMPwO+RdI01
 u4JIevhHzZMa5pZPRYu2pkdAyMsVx/Q0/YWtK8jQQ7D72oK+DRbWqyAxk9Pvh8cQBD9o=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1upjc5-0007xH-OV for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 23 Aug 2025 08:28:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 24C02A58BC6;
 Sat, 23 Aug 2025 08:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7170FC4CEE7;
 Sat, 23 Aug 2025 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755937706;
 bh=996SurDcbUXCCjxdISDE5LrvQQDDtS4PNGYhV53nlno=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=p65KVYfSdiR77Oa8isM0hLDHgZ2oOooVMJA4C38JjYdnqzg2fkW8z2Aq4MmHnK5hd
 4VSp7niCoGCT7CKVPlXdlzOExaAAQTnDjPw2/qfS4RMCkNW3jK+JxvnN54Oj+k2u2E
 ek4qsklkA7979mE4Fh4sA9i6i0q6JDCbRscLTsUQGfLFEkUW/R5Nxkg8jTRT71BVjG
 sMD2WLmo7HV6lYiEfKskib/mBCOsGRFgZxGIPcULw3IccQyPFhJ1hdK4xwnmDkTW6L
 PrST72Y5Wxavtf1ATD0YK69fqwr9N4YewM90BBou1XfX2zKoHZNOGww5aIybM5BKgA
 iEtU80v1vZipA==
Message-ID: <0521479a-4173-4bf8-b0a8-47de61982d44@kernel.org>
Date: Sat, 23 Aug 2025 16:28:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong2021@gmail.com>, jaegeuk@kernel.org
References: <20250820124238.3785621-1-shengyong1@xiaomi.com>
 <20250820124238.3785621-11-shengyong1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20250820124238.3785621-11-shengyong1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/20/2025 8:42 PM, Sheng Yong wrote: > From: Sheng Yong
 <shengyong1@xiaomi.com> > > The following members are added to inject more
 fields in cp: > > * next_blkaddr: inject fsync dnodes > > An error [...] 
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
X-Headers-End: 1upjc5-0007xH-OV
Subject: Re: [f2fs-dev] [PATCH v3 10/13] inject.f2fs: add members in
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

On 8/20/2025 8:42 PM, Sheng Yong wrote:
> From: Sheng Yong <shengyong1@xiaomi.com>
> 
> The following members are added to inject more fields in cp:
> 
> * next_blkaddr: inject fsync dnodes
> 
>    An error is returned if no fsync dnode is found.
>    Furthermore, the injection is not supported on a zoned device. This
>    is because fsync dnodes must remains at the end of current warm node
>    segment, any dnode change causes all previous dnodes in the chain to
>    be updated out-of-place, and there may not have enough space left in
>    the curseg. To simplify the injection, it returns an error on the
>    zoned device.
>    An example of dnode chain shows:
>      [inject_cp: 608] [   0] blkaddr:0x1204
>      [inject_cp: 608] [   1] blkaddr:0x1205
>      [inject_cp: 608] [   2] blkaddr:0x1206
>      [inject_cp: 608] [   3] blkaddr:0x1207
>      [inject_cp: 608] [   4] blkaddr:0x1208
>      [inject_cp: 608] [   5] blkaddr:0x1209
>      [inject_cp: 608] [   6] blkaddr:0x120a
>      [inject_cp: 608] [   7] blkaddr:0x120b
>      [inject_cp: 608] [   8] blkaddr:0x120c
>      [inject_cp: 608] [   9] blkaddr:0x120d
>    where `0' indicates next free blkaddr of warm node curseg, thus
>    start blkaddr + next_blkoff of warm node curseg, which cannot be
>    injected. `1~9` indicate next_blkaddr in node_footer of dnodes in
>    the chain, which can be injected.
> 
> * alloc_type: inject curseg's alloc type
> * crc: inject cp's checksum
> * elapsed_time: inject cp's mount elapsed time
> 
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> ---
> v3: * update commit message to show dnode chain and the injectable range
>      * free(node) before return
> ---
>   fsck/fsck.h       |  4 ++-
>   fsck/inject.c     | 86 ++++++++++++++++++++++++++++++++++++++++++++++-
>   fsck/mount.c      | 18 +++++-----
>   man/inject.f2fs.8 | 11 +++++-
>   4 files changed, 108 insertions(+), 11 deletions(-)
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
> index 5ca105b60f8e..272a4a64dc05 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -151,6 +151,10 @@ static void inject_cp_usage(void)
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
> @@ -456,6 +460,7 @@ out:
>   static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   {
>   	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
> +	bool update_crc = true;
>   	char *buf = NULL;
>   	int ret = 0;
>   
> @@ -534,6 +539,85 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
> +		free(node);
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
> @@ -541,7 +625,7 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   	}
>   
>   	print_ckpt_info(sbi);
> -	write_raw_cp_blocks(sbi, cp, opt->cp);
> +	write_raw_cp_blocks(sbi, cp, opt->cp, update_crc);
>   
>   out:
>   	free(buf);
> diff --git a/fsck/mount.c b/fsck/mount.c
> index f9f780d4aff6..f03fa2d6861a 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3510,17 +3510,19 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
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
> @@ -3754,7 +3756,7 @@ static void del_fsync_inode(struct fsync_inode_entry *entry)
>   	free(entry);
>   }
>   
> -static void destroy_fsync_dnodes(struct list_head *head)
> +void f2fs_destroy_fsync_dnodes(struct list_head *head)
>   {
>   	struct fsync_inode_entry *entry, *tmp;
>   
> @@ -3860,7 +3862,7 @@ static int sanity_check_node_chain(struct f2fs_sb_info *sbi,
>   	return 0;
>   }
>   
> -static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
> +int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
>   {
>   	struct curseg_info *curseg;
>   	struct f2fs_node *node_blk, *node_blk_fast;
> @@ -4056,7 +4058,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
>   	if (!need_fsync_data_record(sbi))
>   		return 0;
>   
> -	ret = find_fsync_inode(sbi, &inode_list);
> +	ret = f2fs_find_fsync_inode(sbi, &inode_list);
>   	if (ret)
>   		goto out;
>   
> @@ -4071,7 +4073,7 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
>   
>   	ret = traverse_dnodes(sbi, &inode_list);
>   out:
> -	destroy_fsync_dnodes(&inode_list);
> +	f2fs_destroy_fsync_dnodes(&inode_list);
>   	return ret;
>   }
>   
> diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
> index 65ac658a129b..0e7cd5065a15 100644
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

alloc_type entry.

Thanks,

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
