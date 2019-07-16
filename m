Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C8A6AA93
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jul 2019 16:26:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnOPJ-00069k-Ao; Tue, 16 Jul 2019 14:26:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hnOPI-00069O-2a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 14:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fug01HsDuCPPxMd4KJktNqrsMNgCZ7QnW1iCBuoiqWQ=; b=OsGb0zwTS0AWhqu33Yj9qbWIE3
 75JTxfNmuUTvNuwZsmtqWDWZ7bCOQaDfs6d+kefTpZrulEm2f9Y+GMw/m0i7dNa0jSLZp8iPRbPXN
 omdC3y0mATSXXyzB8hI6S4qAQyplvz9AWK/37mr2w7gQvTL4HJhKp3l5M5yViHRPtXuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fug01HsDuCPPxMd4KJktNqrsMNgCZ7QnW1iCBuoiqWQ=; b=ih0A4U/s60dkZUqo+wlSq1wtfW
 kU4u1pqywsJyO7NWHgolVTTi2qfjQE5Y0aGd3ZzrPHQjnUdIZkhS3x/oQs1yOJ62xJyXyIfGrzhVH
 T9DUpWI8Q88yClH3jRJSzoHupD+13iZ+y7ZCqESECIL3Csyb5yuI2NXG/Oa69pdvxO0k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnOPF-003YZq-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jul 2019 14:26:16 +0000
Received: from [192.168.0.101] (unknown [49.65.245.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4471D2173B;
 Tue, 16 Jul 2019 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563287167;
 bh=sdkcSEaModcaYzfPDVZ05UHTYTfGMwgi3Y4K974him8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=riFxOnJzDUHVJR+2QEwx31iQlJH11fQ2A/ayJnFSjsyNQSLVkdI10MvwcR6ulC5c1
 S5ykJdIOYCqXyIclyXea/OOLPG+fpAnec28ydC9xQJ14/6w5fIsF1GQW8Co9BL9plR
 DER6BCWNGVdlXQfZU3ZFX05MPSczP+UjRvT3pS+U=
To: Chao Yu <yuchao0@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20190626094813.40517-1-yuchao0@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <7a2e35af-50ce-689d-218a-44b106408d5b@kernel.org>
Date: Tue, 16 Jul 2019 22:25:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190626094813.40517-1-yuchao0@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hnOPF-003YZq-Sz
Subject: Re: [f2fs-dev] [PATCH v2] fsck.f2fs: write checkpoint with OPU mode
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ping,

On 2019-6-26 17:48, Chao Yu wrote:
> This original patch was from Weichao Guo.
> 
> We may encounter both checkpoints invalid in such a case:
> 1. kernel writes CP A;
> 2. power-cut when kernel writes CP B, then CP B is corrupted;
> 3. fsck: load CP A, fix meta/data;
> 4. power-cut when fsck writes CP A in-place, then CP A is corrupted too;
> 
> To avoid both checkpoints being invalid, this patch changes to duplicate
> valid checkpoint to mirror position first, and then, write fixed checkpoint
> to CP #0 position.
> 
> This can make sure that, while fsck repairing, even there is sudden
> power-cut, last valid checkpoint can be kept in CP #1 position.
> 
> Signed-off-by: Weichao Guo <guoweichao@huawei.com>
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - duplicate valid CP to mirror position, update CP on #0 position.
>  fsck/f2fs.h  |  2 ++
>  fsck/fsck.c  | 14 ++++++++++++--
>  fsck/fsck.h  |  2 ++
>  fsck/mount.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 66 insertions(+), 3 deletions(-)
> 
> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> index 4dc6698..52e68ec 100644
> --- a/fsck/f2fs.h
> +++ b/fsck/f2fs.h
> @@ -195,6 +195,8 @@ struct f2fs_sb_info {
>  
>  	unsigned int cur_victim_sec;            /* current victim section num */
>  	u32 free_segments;
> +
> +	int cp_backuped;			/* backup valid checkpoint */
>  };
>  
>  static inline struct f2fs_super_block *F2FS_RAW_SUPER(struct f2fs_sb_info *sbi)
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 8953ca1..aee45d9 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2127,6 +2127,16 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>  	ASSERT(ret >= 0);
>  }
>  
> +static void fix_checkpoints(struct f2fs_sb_info *sbi)
> +{
> +	/* copy valid checkpoint to its mirror position */
> +	duplicate_checkpoint(sbi);
> +
> +	/* repair checkpoint at CP #0 position */
> +	sbi->cur_cp = 1;
> +	fix_checkpoint(sbi);
> +}
> +
>  int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, type);
> @@ -2777,10 +2787,10 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  			rewrite_sit_area_bitmap(sbi);
>  			fix_curseg_info(sbi);
>  			fix_checksum(sbi);
> -			fix_checkpoint(sbi);
> +			fix_checkpoints(sbi);
>  		} else if (is_set_ckpt_flags(cp, CP_FSCK_FLAG) ||
>  			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
> -			write_checkpoint(sbi);
> +			write_checkpoints(sbi);
>  		}
>  	}
>  	return ret;
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index d38e8de..3699b35 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -191,7 +191,9 @@ extern void flush_sit_entries(struct f2fs_sb_info *);
>  extern void move_curseg_info(struct f2fs_sb_info *, u64, int);
>  extern void write_curseg_info(struct f2fs_sb_info *);
>  extern int find_next_free_block(struct f2fs_sb_info *, u64 *, int, int);
> +extern void duplicate_checkpoint(struct f2fs_sb_info *);
>  extern void write_checkpoint(struct f2fs_sb_info *);
> +extern void write_checkpoints(struct f2fs_sb_info *);
>  extern void update_superblock(struct f2fs_super_block *, int);
>  extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t);
>  extern void update_nat_blkaddr(struct f2fs_sb_info *, nid_t, nid_t, block_t);
> diff --git a/fsck/mount.c b/fsck/mount.c
> index 60e0e4a..89f538b 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2229,7 +2229,7 @@ void flush_journal_entries(struct f2fs_sb_info *sbi)
>  	int n_sits = flush_sit_journal_entries(sbi);
>  
>  	if (n_nats || n_sits)
> -		write_checkpoint(sbi);
> +		write_checkpoints(sbi);
>  }
>  
>  void flush_sit_entries(struct f2fs_sb_info *sbi)
> @@ -2478,6 +2478,45 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
>  	free(nat_block);
>  }
>  
> +void duplicate_checkpoint(struct f2fs_sb_info *sbi)
> +{
> +	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> +	unsigned long long dst, src;
> +	void *buf;
> +	unsigned int seg_size = 1 << get_sb(log_blocks_per_seg);
> +	int ret;
> +
> +	if (sbi->cp_backuped)
> +		return;
> +
> +	buf = malloc(F2FS_BLKSIZE * seg_size);
> +	ASSERT(buf);
> +
> +	if (sbi->cur_cp == 1) {
> +		src = get_sb(cp_blkaddr);
> +		dst = src + seg_size;
> +	} else {
> +		dst = get_sb(cp_blkaddr);
> +		src = dst + seg_size;
> +	}
> +
> +	ret = dev_read(buf, src << F2FS_BLKSIZE_BITS, seg_size);
> +	ASSERT(ret >= 0);
> +
> +	ret = dev_write(buf, dst << F2FS_BLKSIZE_BITS, seg_size);
> +	ASSERT(ret >= 0);
> +
> +	free(buf);
> +
> +	ret = f2fs_fsync_device();
> +	ASSERT(ret >= 0);
> +
> +	sbi->cp_backuped = 1;
> +
> +	MSG(0, "Info: Duplicate valid checkpoint to mirror position "
> +		"%llu -> %llu\n", src, dst);
> +}
> +
>  void write_checkpoint(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> @@ -2557,6 +2596,16 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  	ASSERT(ret >= 0);
>  }
>  
> +void write_checkpoints(struct f2fs_sb_info *sbi)
> +{
> +	/* copy valid checkpoint to its mirror position */
> +	duplicate_checkpoint(sbi);
> +
> +	/* repair checkpoint at CP #0 position */
> +	sbi->cur_cp = 1;
> +	write_checkpoint(sbi);
> +}
> +
>  void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
>  {
>  	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
