Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9A9C13DE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2024 03:09:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9ERF-000425-KQ;
	Fri, 08 Nov 2024 02:09:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t9ERE-00041x-GB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 02:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JKJeaA2eORdi0Zq2gNgjXhiR1U57De3aBz7MAXCsSJw=; b=P5rYEGZSbzJht3Ku7si903041O
 I1AWYsqUEK9ZsGQpXemuGTgybiDTdu4b7D7YjmOs5M6QDsmc7K+wY0KkUdspXllirZQdnWNwlul3X
 nj25EXJQohSoEkkq3heTGBLZ5aRnnJOFp26MbYiFBCGGSz6BiaMZv1Y4AhfBAJNg6RSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JKJeaA2eORdi0Zq2gNgjXhiR1U57De3aBz7MAXCsSJw=; b=H2hmuJqF0rESaBp/YjWFnP+Wyl
 HGoDFp5o8ky9OQp1/Dl0G2rJiKRzm3+PS6iFGrDSozGoIvReM2cNVe6sdja/uQt3L4w09npYkKoao
 yVNSRZBygD6Y/wE2T6Q+erIROU7xXgA0McNPOyTIqXez95OXuijI8u2yFevgd23fGbPk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t9ERD-0008WH-J9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Nov 2024 02:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 286B8A44DF0;
 Fri,  8 Nov 2024 02:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F342C4CECC;
 Fri,  8 Nov 2024 02:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731031756;
 bh=DfhJdEl71HGM55RCBpcptfCEmkUTrQ/XMtXe8gJG3/E=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FkvizEaVNaWZ5a/jVTMR4eiChHNVVHO1UZP6axz8uuypOBdBQTffxOSGKHEseGSiS
 LmzW/ahby+cAKPxfPvuH+5dcWqdcNwgfj0iVaTIs9+GnyYWArHu03igF0xRXyEngcw
 erbWmqJaJuVlzomuG27EqFBI3IIly+KFNGU+Gqc08GYXuy1taXTJIOKhqOwmdZ8LUr
 mMIanif9E4k4uvfvC6nhILq1S9Zjzsq9Ni+6A3pEDRdnbkTLGgGf8PWNQGz8MDtktO
 iFov1XlGeMGhhTht8XqqFQuat1ZIeXGRpemibhO2OafaxBEKr0ecknB2j3dQoG6ye0
 wVmfAzzrdaq1A==
Message-ID: <2eb62d79-72b3-4621-a83b-eb5cfd207187@kernel.org>
Date: Fri, 8 Nov 2024 10:09:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sheng Yong <shengyong@oppo.com>, jaegeuk@kernel.org
References: <20241029120956.4186731-1-shengyong@oppo.com>
 <20241029120956.4186731-5-shengyong@oppo.com>
Content-Language: en-US
In-Reply-To: <20241029120956.4186731-5-shengyong@oppo.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/10/29 20:09,
 Sheng Yong wrote: > The following members
 are add to inject more fields in cp: > > * next_blkaddr: inject fsync dnodes
 > > An error is returned if no fsync dnode is found. > > How [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t9ERD-0008WH-J9
Subject: Re: [f2fs-dev] [RFC PATCH 04/24] inject.f2fs: add members in
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/10/29 20:09, Sheng Yong wrote:
> The following members are add to inject more fields in cp:
> 
> * next_blkaddr: inject fsync dnodes
> 
> An error is returned if no fsync dnode is found.
> 
> However, the injection is not supported on zoned device. This is because
> fsync dnodes must remains at the end of current warm node segnemt, any
> dnode change causes all previous dnodes in the chain to be updated
> out-of-place, and there may not have enough space left in the curseg.
> To simplify the injection, it returns an error on zoned device.
> 
> * alloc_type: inject curseg's alloc type
> * crc: inject cp's checksum
> * elapsed_time: inject cp's mount elapsed time
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fsck/fsck.h       |  3 +-
>   fsck/inject.c     | 80 ++++++++++++++++++++++++++++++++++++++++++++++-
>   fsck/mount.c      | 15 ++++++---
>   man/inject.f2fs.8 |  9 ++++++
>   4 files changed, 101 insertions(+), 6 deletions(-)
> 
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index b581d3e0da9f..51061e435f5b 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -222,6 +222,7 @@ extern int f2fs_ra_meta_pages(struct f2fs_sb_info *, block_t, int, int);
>   extern int f2fs_do_mount(struct f2fs_sb_info *);
>   extern void f2fs_do_umount(struct f2fs_sb_info *);
>   extern int f2fs_sparse_initialize_meta(struct f2fs_sb_info *);
> +extern int f2fs_find_fsync_inode(struct f2fs_sb_info *, struct list_head *);
>   
>   extern void flush_journal_entries(struct f2fs_sb_info *);
>   extern void update_curseg_info(struct f2fs_sb_info *, int);
> @@ -238,7 +239,7 @@ extern void duplicate_checkpoint(struct f2fs_sb_info *);
>   extern void write_checkpoint(struct f2fs_sb_info *);
>   extern void write_checkpoints(struct f2fs_sb_info *);
>   extern void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
> -			struct f2fs_checkpoint *cp, int which);
> +			struct f2fs_checkpoint *cp, int which, bool update_crc);
>   extern void update_superblock(struct f2fs_super_block *, int);
>   extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
>   			struct f2fs_node *);
> diff --git a/fsck/inject.c b/fsck/inject.c
> index bd6ab8480972..c3e68eb35246 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -138,6 +138,10 @@ static void inject_cp_usage(void)
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
> @@ -440,6 +444,7 @@ out:
>   static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   {
>   	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
> +	bool update_crc = true;
>   	char *buf = NULL;
>   	int ret = 0;
>   
> @@ -518,6 +523,79 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
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
> +		ret = update_block(sbi, node, &blkaddr, NULL);

Needs to call update_inode() to update & persist chksum fields?

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
> @@ -525,7 +603,7 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
>   	}
>   
>   	print_ckpt_info(sbi);
> -	write_raw_cp_blocks(sbi, cp, opt->cp);
> +	write_raw_cp_blocks(sbi, cp, opt->cp, update_crc);
>   
>   out:
>   	free(buf);
> diff --git a/fsck/mount.c b/fsck/mount.c
> index bbe29dba0f45..c2e0f1a3a9df 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -3454,17 +3454,19 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
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
> @@ -3864,6 +3866,11 @@ next:
>   	return err;
>   }
>   
> +int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
> +{
> +	return find_fsync_inode(sbi, head);
> +}
> +
>   static int do_record_fsync_data(struct f2fs_sb_info *sbi,
>   					struct f2fs_node *node_blk,
>   					block_t blkaddr)
> diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
> index 01d58effbfe4..6cf66bcbf2a3 100644
> --- a/man/inject.f2fs.8
> +++ b/man/inject.f2fs.8
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
