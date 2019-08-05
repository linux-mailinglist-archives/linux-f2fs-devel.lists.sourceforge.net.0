Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DB2815E5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 11:51:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huZdv-00019s-B1; Mon, 05 Aug 2019 09:51:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huZdu-00019l-DR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 09:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o46urYfSg3l2yMT+a6Ezvq7jGc/Y+uq1W8zh3wxF0sc=; b=L336WIPX2BIhJliRINZCz9vRPz
 xFECNabZmWhx2LK+pT835x4Cie2waK2noQXUE633ykk23q6mVHDQrLJqiJCp0gFCtrFX0RMo05IUv
 VwHOfoJYTtlNXpVJJ82PZ5FFfEecDROjk1WAbUXdGkzUubiMMqRdsglzE8v4ccKk3pfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o46urYfSg3l2yMT+a6Ezvq7jGc/Y+uq1W8zh3wxF0sc=; b=GZWKFuK5TWl5tzPi8thXGHMSBq
 WZaJCrdndEAFmAz+XGGGzX7lMAS9Alf3adLsMfSh0AL3abPDfNFDvYdGAb7aGX1ojXMvOAtQMqm17
 cI+LFpokv6frd7LFDEZ8u07L8TNvBs1rWIXgFaERlkjfKN3fJ5gknlPvSNjZGfI8geiw=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huZds-00B4lW-HV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 09:51:02 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 393587E4AFCE78A17903;
 Mon,  5 Aug 2019 17:50:50 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 5 Aug 2019
 17:50:45 +0800
To: <jaegeuk@kernel.org>
References: <20190717012851.80918-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0c178808-ab40-6253-821c-74ffa07dc17e@huawei.com>
Date: Mon, 5 Aug 2019 17:51:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190717012851.80918-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huZds-00B4lW-HV
Subject: Re: [f2fs-dev] [PATCH v3] fsck.f2fs: write checkpoint with OPU mode
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk,

Any test updates on this patch?

Could you update dev/dev-test branch of tools repo, so that I can rebase on them.

On 2019/7/17 9:28, Chao Yu wrote:
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
> v3:
> - fix wrong size of duplication.
>  fsck/f2fs.h  |  2 ++
>  fsck/fsck.c  | 15 +++++++++++++--
>  fsck/fsck.h  |  2 ++
>  fsck/mount.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  4 files changed, 69 insertions(+), 3 deletions(-)
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
> index 8953ca1..49363d3 100644
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
> @@ -2765,6 +2775,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  		}
>  	}
>  #endif
> +
>  	/* fix global metadata */
>  	if (force || (c.fix_on && f2fs_dev_is_writable())) {
>  		struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> @@ -2777,10 +2788,10 @@ int fsck_verify(struct f2fs_sb_info *sbi)
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
> index 60e0e4a..973c82f 100644
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
> @@ -2478,6 +2478,47 @@ void nullify_nat_entry(struct f2fs_sb_info *sbi, u32 nid)
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
> +	ret = dev_read(buf, src << F2FS_BLKSIZE_BITS,
> +				seg_size << F2FS_BLKSIZE_BITS);
> +	ASSERT(ret >= 0);
> +
> +	ret = dev_write(buf, dst << F2FS_BLKSIZE_BITS,
> +				seg_size << F2FS_BLKSIZE_BITS);
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
> @@ -2557,6 +2598,16 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
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
