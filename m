Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A09CD5526
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Dec 2025 10:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRwCgzisBexkXa7Y2Ilr0V1ztl+fLnTLbhnUsnpf6qk=; b=ezgHeLYoRhHYXYc7+vv2r0uKvh
	gvOUVO9IlTg3uNgmOxsC+2pJNuYsVR0Q6PzJwex5GTZFfsAOLxBOU6T03wuvncJJ4KNa+EoysGTuQ
	jVJixpeUopalq0Jkn6jvvX/elhUovl0qMfK/n2TxEFqkEq/oc1b4EgUfQiMUEZVbq2co=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vXcD6-0004l2-HG;
	Mon, 22 Dec 2025 09:28:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vXcD5-0004kw-Hl
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Dec 2025 09:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S+md5InQ3hu3bHugt3EOsltvG2ZN6GracIeAtGVW9Rk=; b=Qv4x3aWjbYgAGTvnkR2fSqwNLl
 8udRqywk5NzyxizF1d6jUu7WaT4yM99xKOKl2QsiWBv6v61wS/Ywcq+39zgjKJRdyozw8OmRcmt1U
 Fpe7nfsHGdaZP6obd8ieb4TctNfhK/fhlMfmGxg6ePeWsCdzqsehddRg2dMUbhJQc72Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S+md5InQ3hu3bHugt3EOsltvG2ZN6GracIeAtGVW9Rk=; b=I2Y44wGjrrSQj4nyZxM3Gkq+ug
 dYlrmisCZJvgqwHyqRdXFvCmKIpkNvsEkQnHZE1Utz8dx8nT+ke+I1eOK+K+n+AWl1yIxPvvc9EHi
 s6VAgcxmHYMIgYVjV0ewKQeGBHV6TrxmurvAnZfmS/utUf1JkgImc32C9g3FL42A66e8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vXcD4-00052J-52 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Dec 2025 09:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C379A4031F;
 Mon, 22 Dec 2025 09:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4766BC4CEF1;
 Mon, 22 Dec 2025 09:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766395679;
 bh=a+IsRXjZdg4fTpwan2mQYgSVE/7I90VN4ebz2rMsryE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rIIgX3xyJLKLgN1nqeQP0aeog5LGUPCfcC4DPK3JJefDl2S3DyeK5rGTv06Ir9Ake
 ei2v+t2ZpUhd/pDGZPV4nkRx6T3PWisgrTWLGBRy2MgsAVNDOEytH+dq/lggpWUUE2
 3EmEq/yuAokAgTGXo/cUTUMlyQdOFznNvNLLFw+C0jImF+KPRPXQ6Yln7Ini4Q4PLP
 wsZ1s4mjKQ5EzhIYhxb3UHSoLWmHZByRWfaa4lDbdgojutTmjJ9nbb3alrd8Ri9SdV
 ftDqOMP5+j1vMUtsayyu1CX2ep88784zJD8Bq3/v+HgfoKh5Mgo4y/sVBbL5zRoLT8
 LK8Gl9rd59IWw==
Message-ID: <c7f171bd-eebe-424e-92f7-439bee25458d@kernel.org>
Date: Mon, 22 Dec 2025 17:27:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251221032336.3374290-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251221032336.3374290-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/21/25 11:23, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > The recent increase in the number of Segment
 Summary
 Area (SSA) entries > from 512 to 2048 was an unintentional ch [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vXcD4-00052J-52
Subject: Re: [f2fs-dev] [PATCH v5] f2fs-tools: revert summary entry count
 from 2048 to 512 in 16kb block support
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/21/25 11:23, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> The recent increase in the number of Segment Summary Area (SSA) entries
> from 512 to 2048 was an unintentional change in logic of 16kb block
> support. This commit corrects the issue.
> 
> To better utilize the space available from the erroneous 2048-entry
> calculation, we are implementing a solution to share the currently
> unused SSA space with neighboring segments. This enhances overall
> SSA utilization without impacting the established 8MB segment size.
> 
> Fixes: 50fd00b168d7 ("f2fs-tools: Support different block sizes")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v5: support both old and new format with packed_ssa feature option
> v4: move enabling the feature position.
> v3: add a feature to prevent from mounting deprecated format
> v2: detect legacy layout and prevent mount.
>     fix ssa block calculation bug in resize tool.
> ---
>  fsck/f2fs.h             | 27 ++++++++++-
>  fsck/fsck.c             | 16 +++----
>  fsck/inject.c           |  4 +-
>  fsck/mount.c            | 51 ++++++++++-----------
>  fsck/resize.c           | 99 ++++++++++++++++++++++++++---------------
>  include/f2fs_fs.h       | 17 ++++---
>  lib/libf2fs_io.c        | 12 +++++
>  mkfs/f2fs_format.c      | 10 ++++-
>  mkfs/f2fs_format_main.c |  6 +++
>  9 files changed, 158 insertions(+), 84 deletions(-)
> 
> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
> index 60e3a2e..5e7eb63 100644
> --- a/fsck/f2fs.h
> +++ b/fsck/f2fs.h
> @@ -447,12 +447,37 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
>  	(SM_I(sbi) ? SM_I(sbi)->seg0_blkaddr :				\
>  		le32_to_cpu(F2FS_RAW_SUPER(sbi)->segment0_blkaddr))
>  
> +#define SUMS_PER_BLOCK (F2FS_BLKSIZE / F2FS_SUM_BLKSIZE)
>  #define GET_SUM_BLKADDR(sbi, segno)					\
> -	((sbi->sm_info->ssa_blkaddr) + segno)
> +	(c.feature & F2FS_FEATURE_PACKED_SSA ? \
> +	((SM_I(sbi)->ssa_blkaddr) + (segno) / SUMS_PER_BLOCK) : \
> +	((SM_I(sbi)->ssa_blkaddr) + (segno)))
> +#define GET_SUM_BLKOFF(segno)					\
> +	(c.feature & F2FS_FEATURE_PACKED_SSA ? \
> +	((segno) % SUMS_PER_BLOCK) : 0)
>  
>  #define GET_SEGOFF_FROM_SEG0(sbi, blk_addr)				\
>  	((blk_addr) - SM_I(sbi)->seg0_blkaddr)
>  
> +static inline int write_sum_block(struct f2fs_sb_info *sbi,
> +		void *buf, unsigned int segno, enum rw_hint whint)

What do you think of changing parameters as below?

static inline int write_sum_block(struct f2fs_sb_info *sbi,
		void *buf, block_t block, unsigned blkoff, enum rw_hint whint)

So we can use this function to clean up codes in other places.

> +{
> +	if (c.feature & F2FS_FEATURE_PACKED_SSA)
> +		return dev_write_4k_block(buf, GET_SUM_BLKADDR(sbi, segno),
> +				GET_SUM_BLKOFF(segno), whint);
> +	return dev_write_block(buf, GET_SUM_BLKADDR(sbi, segno), whint);
> +}
> +
> +static inline int read_sum_block(struct f2fs_sb_info *sbi,
> +		void *buf, unsigned int segno)

Ditto,

> +{
> +	if (c.feature & F2FS_FEATURE_PACKED_SSA)
> +		return dev_read_4k_block(buf, GET_SUM_BLKADDR(sbi, segno),
> +				GET_SUM_BLKOFF(segno));
> +	return dev_read_block(buf, GET_SUM_BLKADDR(sbi, segno));
> +}
> +
> +
>  #define GET_SEGNO_FROM_SEG0(sbi, blk_addr)				\
>  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) >> sbi->log_blocks_per_seg)
>  
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 0b53c67..db44f9d 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -228,11 +228,9 @@ static int is_valid_ssa_node_blk(struct f2fs_sb_info *sbi, u32 nid,
>  		}
>  	}
>  	if (need_fix && f2fs_dev_is_writable()) {
> -		u64 ssa_blk;
>  		int ret2;
>  
> -		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
> -		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
> +		ret2 = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
>  		ASSERT(ret2 >= 0);
>  	}
>  out:
> @@ -367,11 +365,9 @@ static int is_valid_ssa_data_blk(struct f2fs_sb_info *sbi, u32 blk_addr,
>  		}
>  	}
>  	if (need_fix && f2fs_dev_is_writable()) {
> -		u64 ssa_blk;
>  		int ret2;
>  
> -		ssa_blk = GET_SUM_BLKADDR(sbi, segno);
> -		ret2 = dev_write_block(sum_blk, ssa_blk, WRITE_LIFE_NONE);
> +		ret2 = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
>  		ASSERT(ret2 >= 0);
>  	}
>  out:
> @@ -3879,14 +3875,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
>  			rewrite_sit_area_bitmap(sbi);
>  			if (c.zoned_model == F2FS_ZONED_HM) {
>  				struct curseg_info *curseg;
> -				u64 ssa_blk;
>  
>  				for (i = 0; i < NO_CHECK_TYPE; i++) {
>  					curseg = CURSEG_I(sbi, i);
> -					ssa_blk = GET_SUM_BLKADDR(sbi,
> -							curseg->segno);
> -					ret = dev_write_block(curseg->sum_blk,
> -							ssa_blk,
> +					ret = write_sum_block(sbi,
> +							curseg->sum_blk,
> +							curseg->segno,
>  							WRITE_LIFE_NONE);
>  					ASSERT(ret >= 0);
>  				}
> diff --git a/fsck/inject.c b/fsck/inject.c
> index 0e46b1b..b00e356 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -935,7 +935,6 @@ static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  	struct summary_footer *footer;
>  	struct f2fs_summary *sum;
>  	u32 segno, offset;
> -	block_t ssa_blkaddr;
>  	int type;
>  	int ret;
>  
> @@ -1000,8 +999,7 @@ static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
>  
>  	print_sum_footer_info(footer);
>  
> -	ssa_blkaddr = GET_SUM_BLKADDR(sbi, segno);
> -	ret = dev_write_block(sum_blk, ssa_blkaddr, WRITE_LIFE_NONE);
> +	ret = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  out:
> diff --git a/fsck/mount.c b/fsck/mount.c
> index f03fa2d..43b1246 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -2150,6 +2150,7 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
>  	struct curseg_info *curseg;
>  	unsigned int segno = 0;
>  	block_t blk_addr = 0;
> +	__u32 blk_offset = 0;
>  	int ret;
>  
>  	if (IS_DATASEG(type)) {
> @@ -2160,24 +2161,29 @@ static void read_normal_summaries(struct f2fs_sb_info *sbi, int type)
>  			blk_addr = sum_blk_addr(sbi, NR_CURSEG_DATA_TYPE, type);
>  	} else {
>  		segno = get_cp(cur_node_segno[type - CURSEG_HOT_NODE]);
> -		if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
> +		if (is_set_ckpt_flags(cp, CP_UMOUNT_FLAG)) {
>  			blk_addr = sum_blk_addr(sbi, NR_CURSEG_NODE_TYPE,
>  							type - CURSEG_HOT_NODE);
> -		else
> +		} else {
>  			blk_addr = GET_SUM_BLKADDR(sbi, segno);
> +			blk_offset = GET_SUM_BLKOFF(segno);
> +		}
>  	}
>  
> -	sum_blk = malloc(F2FS_BLKSIZE);
> +	sum_blk = malloc(F2FS_SUM_BLKSIZE);
>  	ASSERT(sum_blk);
>  
> -	ret = dev_read_block(sum_blk, blk_addr);
> +	if (c.feature & F2FS_FEATURE_PACKED_SSA)
> +		ret = dev_read_4k_block(sum_blk, blk_addr, blk_offset);
> +	else
> +		ret = dev_read_block(sum_blk, blk_addr);
>  	ASSERT(ret >= 0);
>  
>  	if (IS_NODESEG(type) && !is_set_ckpt_flags(cp, CP_UMOUNT_FLAG))
>  		restore_node_summary(sbi, segno, sum_blk);
>  
>  	curseg = CURSEG_I(sbi, type);
> -	memcpy(curseg->sum_blk, sum_blk, F2FS_BLKSIZE);
> +	memcpy(curseg->sum_blk, sum_blk, F2FS_SUM_BLKSIZE);
>  	reset_curseg(sbi, type);
>  	free(sum_blk);
>  }
> @@ -2205,8 +2211,7 @@ void update_sum_entry(struct f2fs_sb_info *sbi, block_t blk_addr,
>  							SUM_TYPE_DATA;
>  
>  	/* write SSA all the time */
> -	ret = dev_write_block(sum_blk, GET_SUM_BLKADDR(sbi, segno),
> -			      WRITE_LIFE_NONE);
> +	ret = write_sum_block(sbi, sum_blk, segno, WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  
>  	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
> @@ -2244,7 +2249,7 @@ static int build_curseg(struct f2fs_sb_info *sbi)
>  	SM_I(sbi)->curseg_array = array;
>  
>  	for (i = 0; i < NR_CURSEG_TYPE; i++) {
> -		array[i].sum_blk = calloc(F2FS_BLKSIZE, 1);
> +		array[i].sum_blk = calloc(F2FS_SUM_BLKSIZE, 1);
>  		if (!array[i].sum_blk) {
>  			MSG(1, "\tError: Calloc failed for build_curseg!!\n");
>  			goto seg_cleanup;
> @@ -2405,11 +2410,9 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
>  	struct f2fs_summary_block *sum_blk;
>  	struct curseg_info *curseg;
>  	int type, ret;
> -	u64 ssa_blk;
>  
>  	*ret_type= SEG_TYPE_MAX;
>  
> -	ssa_blk = GET_SUM_BLKADDR(sbi, segno);
>  	for (type = 0; type < NR_CURSEG_NODE_TYPE; type++) {
>  		curseg = CURSEG_I(sbi, CURSEG_HOT_NODE + type);
>  		if (segno == curseg->segno) {
> @@ -2440,10 +2443,10 @@ struct f2fs_summary_block *get_sum_block(struct f2fs_sb_info *sbi,
>  		}
>  	}
>  
> -	sum_blk = calloc(F2FS_BLKSIZE, 1);
> +	sum_blk = calloc(F2FS_SUM_BLKSIZE, 1);
>  	ASSERT(sum_blk);
>  
> -	ret = dev_read_block(sum_blk, ssa_blk);
> +	ret = read_sum_block(sbi, sum_blk, segno);
>  	ASSERT(ret >= 0);
>  
>  	if (IS_SUM_NODE_SEG(sum_blk))
> @@ -3060,7 +3063,6 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
>  		struct curseg_info *curseg = CURSEG_I(sbi, want_type);
>  		unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
>  		char buf[F2FS_BLKSIZE];

char buf[F2FS_SUM_BLKSIZE];

> -		u64 ssa_blk;
>  		int ret;
>  
>  		*to = NEXT_FREE_BLKADDR(sbi, curseg);
> @@ -3078,17 +3080,15 @@ int find_next_free_block(struct f2fs_sb_info *sbi, u64 *to, int left,
>  				segno = GET_SEGNO(sbi, new_blkaddr);
>  			}
>  
> -			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -			ret = dev_write_block(curseg->sum_blk, ssa_blk,
> -					      WRITE_LIFE_NONE);
> +			ret = write_sum_block(sbi, curseg->sum_blk,
> +					curseg->segno, WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
>  
>  			curseg->segno = segno;
>  			curseg->next_blkoff = 0;
>  			curseg->alloc_type = LFS;
>  
> -			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -			ret = dev_read_block(&buf, ssa_blk);
> +			ret = read_sum_block(sbi, &buf, curseg->segno);
>  			ASSERT(ret >= 0);
>  
>  			memcpy(curseg->sum_blk, &buf, SUM_ENTRIES_SIZE);
> @@ -3166,7 +3166,7 @@ void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
>  	struct curseg_info *curseg = CURSEG_I(sbi, i);
>  	char buf[F2FS_BLKSIZE];

char buf[F2FS_SUM_BLKSIZE];

>  	u32 old_segno;
> -	u64 ssa_blk, to;
> +	u64 to;
>  	int ret;
>  
>  	if ((get_sb(feature) & F2FS_FEATURE_RO)) {
> @@ -3184,8 +3184,8 @@ void move_one_curseg_info(struct f2fs_sb_info *sbi, u64 from, int left,
>  	}
>  
>  	/* update original SSA too */
> -	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -	ret = dev_write_block(curseg->sum_blk, ssa_blk, WRITE_LIFE_NONE);
> +	ret = write_sum_block(sbi, curseg->sum_blk, curseg->segno,
> +			WRITE_LIFE_NONE);
>  	ASSERT(ret >= 0);
>  bypass_ssa:
>  	to = from;
> @@ -3199,8 +3199,7 @@ bypass_ssa:
>  	curseg->alloc_type = c.zoned_model == F2FS_ZONED_HM ? LFS : SSR;
>  
>  	/* update new segno */
> -	ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -	ret = dev_read_block(buf, ssa_blk);
> +	ret = read_sum_block(sbi, buf, curseg->segno);
>  	ASSERT(ret >= 0);
>  
>  	memcpy(curseg->sum_blk, buf, SUM_ENTRIES_SIZE);
> @@ -3464,7 +3463,6 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  	/* update summary blocks having nullified journal entries */
>  	for (i = 0; i < NO_CHECK_TYPE; i++) {
>  		struct curseg_info *curseg = CURSEG_I(sbi, i);
> -		u64 ssa_blk;
>  
>  		if (!(flags & CP_UMOUNT_FLAG) && IS_NODESEG(i))
>  			continue;
> @@ -3475,9 +3473,8 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
>  
>  		if (!(get_sb(feature) & F2FS_FEATURE_RO)) {
>  			/* update original SSA too */
> -			ssa_blk = GET_SUM_BLKADDR(sbi, curseg->segno);
> -			ret = dev_write_block(curseg->sum_blk, ssa_blk,
> -					      WRITE_LIFE_NONE);
> +			ret = write_sum_block(sbi, curseg->sum_blk,
> +					curseg->segno, WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
>  		}
>  	}
> diff --git a/fsck/resize.c b/fsck/resize.c
> index bef05d6..e650283 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -115,7 +115,11 @@ static int get_new_sb(struct f2fs_super_block *sb)
>  			get_sb(segment_count_sit) +
>  			get_sb(segment_count_nat))) * blks_per_seg;
>  
> -	blocks_for_ssa = total_valid_blks_available / blks_per_seg + 1;
> +	if (c.feature & F2FS_FEATURE_PACKED_SSA)
> +		blocks_for_ssa = round_up(total_valid_blks_available / blks_per_seg,
> +				SUMS_PER_BLOCK);
> +	else
> +		blocks_for_ssa = total_valid_blks_available / blks_per_seg + 1;
>  
>  	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
>  
> @@ -209,23 +213,36 @@ static void migrate_main(struct f2fs_sb_info *sbi, unsigned int offset)
>  				START_BLOCK(sbi, 0) + offset);
>  }
>  
> -static void move_ssa(struct f2fs_sb_info *sbi, unsigned int segno,
> -					block_t new_sum_blk_addr)
> +#define GET_SUM_NEW_BLKADDR(new_sb, segno)	\
> +	(c.feature & F2FS_FEATURE_PACKED_SSA ?	\
> +	(get_newsb(ssa_blkaddr) +		\
> +	 (segno >> (get_newsb(log_blocksize) - DEFAULT_BLKSIZE_BITS))) :	\
> +	(get_newsb(ssa_blkaddr) + segno))
> +#define GET_SUM_NEW_BLKOFF(new_sb, segno)	\
> +	(c.feature & F2FS_FEATURE_PACKED_SSA ?	\
> +	(segno % (1 << (get_newsb(log_blocksize) - DEFAULT_BLKSIZE_BITS))) : 0)
> +
> +static void move_ssa(struct f2fs_sb_info *sbi, struct f2fs_super_block *new_sb,
> +		unsigned int old_segno, unsigned int new_segno)
>  {
>  	struct f2fs_summary_block *sum_blk;
>  	int type;
>  
> -	sum_blk = get_sum_block(sbi, segno, &type);
> +	sum_blk = get_sum_block(sbi, old_segno, &type);
>  	if (type < SEG_TYPE_MAX) {
>  		int ret;
> -
> -		ret = dev_write_block(sum_blk, new_sum_blk_addr,
> -				      WRITE_LIFE_NONE);
> +		u64 new_blkaddr = GET_SUM_NEW_BLKADDR(new_sb, new_segno);
> +		if (c.feature & F2FS_FEATURE_PACKED_SSA)
> +			ret = dev_write_4k_block(sum_blk, new_blkaddr,
> +					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
> +					WRITE_LIFE_NONE);
> +		else
> +			ret = dev_write_block(sum_blk, new_blkaddr,
> +					WRITE_LIFE_NONE);
>  		ASSERT(ret >= 0);
>  		DBG(1, "Write summary block: (%d) segno=%x/%x --> (%d) %x\n",
> -				type, segno, GET_SUM_BLKADDR(sbi, segno),
> -				IS_SUM_NODE_SEG(sum_blk),
> -				new_sum_blk_addr);
> +			type, old_segno, GET_SUM_BLKADDR(sbi, old_segno),
> +			IS_SUM_NODE_SEG(sum_blk), (unsigned int)new_blkaddr);
>  	}
>  	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
>  			type == SEG_TYPE_MAX) {
> @@ -240,36 +257,48 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
>  	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
>  	block_t old_sum_blkaddr = get_sb(ssa_blkaddr);
>  	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
> -	block_t end_sum_blkaddr = get_newsb(main_blkaddr);
> -	block_t expand_sum_blkaddr = new_sum_blkaddr +
> -					MAIN_SEGS(sbi) - offset;
> -	block_t blkaddr;
> -	int ret;
> -	void *zero_block = calloc(F2FS_BLKSIZE, 1);
> +	unsigned int expand_segno = MAIN_SEGS(sbi) - offset;
> +	unsigned int new_seg_total = get_newsb(segment_count);
> +	int new_segno;
> +	int ret = 0;
> +	void *zero_block = calloc(F2FS_SUM_BLKSIZE, 1);
>  	ASSERT(zero_block);
>  
> -	if (offset && new_sum_blkaddr < old_sum_blkaddr + offset) {
> -		blkaddr = new_sum_blkaddr;
> -		while (blkaddr < end_sum_blkaddr) {
> -			if (blkaddr < expand_sum_blkaddr) {
> -				move_ssa(sbi, offset++, blkaddr++);
> -			} else {
> -				ret = dev_write_block(zero_block, blkaddr++,
> -						      WRITE_LIFE_NONE);
> -				ASSERT(ret >=0);
> -			}
> +	if (offset && new_sum_blkaddr <= (old_sum_blkaddr +
> +				offset / SUMS_PER_BLOCK)) {
> +		new_segno = 0;
> +		while (new_segno < new_seg_total) {
> +			if (new_segno < expand_segno)
> +				move_ssa(sbi, new_sb, offset++, new_segno);
> +			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
> +				ret = dev_write_4k_block(zero_block,
> +					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> +					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
> +					WRITE_LIFE_NONE);
> +			else
> +				ret = dev_write_block(zero_block,
> +					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> +					WRITE_LIFE_NONE);
> +			ASSERT(ret >= 0);
> +			new_segno++;
>  		}
>  	} else {
> -		blkaddr = end_sum_blkaddr - 1;
> +		new_segno = new_seg_total - 1;
>  		offset = MAIN_SEGS(sbi) - 1;
> -		while (blkaddr >= new_sum_blkaddr) {
> -			if (blkaddr >= expand_sum_blkaddr) {
> -				ret = dev_write_block(zero_block, blkaddr--,
> -						      WRITE_LIFE_NONE);
> -				ASSERT(ret >=0);
> -			} else {
> -				move_ssa(sbi, offset--, blkaddr--);
> -			}
> +		while (new_segno >= 0) {
> +			if (new_segno < expand_segno)
> +				move_ssa(sbi, new_sb, offset--, new_segno);
> +			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
> +				ret = dev_write_4k_block(zero_block,
> +					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> +					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
> +					WRITE_LIFE_NONE);
> +			else
> +				ret = dev_write_block(zero_block,
> +					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> +					WRITE_LIFE_NONE);
> +			ASSERT(ret >= 0);
> +			new_segno--;
>  		}
>  	}
>  
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index b85ded2..83e1484 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -655,6 +655,7 @@ enum {
>  #define F2FS_MIN_BLKSIZE		4096
>  #define F2FS_MAX_BLKSIZE		16384
>  #define F2FS_BLKSIZE			c.blksize	/* support configurable block size */
> +#define F2FS_SUM_BLKSIZE	((c.feature & F2FS_FEATURE_PACKED_SSA) ? 4096 : F2FS_BLKSIZE)

How about using F2FS_MIN_BLKSIZE instead of all magic number 4096?

>  #define F2FS_MAX_EXTENSION		64	/* # of extension entries */
>  #define F2FS_EXTENSION_LEN		8	/* max size of extension */
>  #define F2FS_BLK_ALIGN(x)	(((x) + F2FS_BLKSIZE - 1) / F2FS_BLKSIZE)
> @@ -715,6 +716,7 @@ enum {
>  #define F2FS_FEATURE_COMPRESSION	0x2000
>  #define F2FS_FEATURE_RO			0x4000
>  #define F2FS_FEATURE_DEVICE_ALIAS	0x8000
> +#define F2FS_FEATURE_PACKED_SSA		0x10000
>  
>  #define MAX_NR_FEATURE			32
>  
> @@ -1219,7 +1221,7 @@ struct f2fs_sit_block {
>   * from node's page's beginning to get a data block address.
>   * ex) data_blkaddr = (block_t)(nodepage_start_address + ofs_in_node)
>   */
> -#define ENTRIES_IN_SUM		(F2FS_BLKSIZE / 8)
> +#define ENTRIES_IN_SUM		(F2FS_SUM_BLKSIZE / 8)
>  #define	SUMMARY_SIZE		(7)	/* sizeof(struct summary) */
>  #define	SUM_FOOTER_SIZE		(5)	/* sizeof(struct summary_footer) */
>  #define SUM_ENTRIES_SIZE	(SUMMARY_SIZE * ENTRIES_IN_SUM)
> @@ -1249,7 +1251,7 @@ struct summary_footer {
>  
>  static_assert(sizeof(struct summary_footer) == 5, "");
>  
> -#define SUM_JOURNAL_SIZE	(F2FS_BLKSIZE - SUM_FOOTER_SIZE -\
> +#define SUM_JOURNAL_SIZE	(F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE -\
>  				SUM_ENTRIES_SIZE)
>  #define NAT_JOURNAL_ENTRIES	((SUM_JOURNAL_SIZE - 2) /\
>  				sizeof(struct nat_journal_entry))
> @@ -1348,7 +1350,7 @@ struct f2fs_summary_block {
>  };
>  #define F2FS_SUMMARY_BLOCK_JOURNAL(blk) ((struct f2fs_journal *)(&(blk)->entries[ENTRIES_IN_SUM]))
>  #define F2FS_SUMMARY_BLOCK_FOOTER(blk) ((struct summary_footer *)&((char *)\
> -					(&(blk)->entries[0]))[F2FS_BLKSIZE - SUM_FOOTER_SIZE])
> +		(&(blk)->entries[0]))[F2FS_SUM_BLKSIZE - SUM_FOOTER_SIZE])
>  
>  /*
>   * For directory operations
> @@ -1711,6 +1713,8 @@ extern int dev_fill_block(void *, __u64, enum rw_hint);
>  
>  extern int dev_read_block(void *, __u64);
>  extern int dev_reada_block(__u64);
> +extern int dev_write_4k_block(void *, __u64, __u32, enum rw_hint);
> +extern int dev_read_4k_block(void *, __u64, __u32);
>  
>  extern int dev_read_version(void *, __u64, size_t);
>  extern void get_kernel_version(__u8 *);
> @@ -2022,6 +2026,7 @@ struct feature feature_table[] = {					\
>  	{ "compression",		F2FS_FEATURE_COMPRESSION,	1}, \
>  	{ "ro",				F2FS_FEATURE_RO,		1}, \
>  	{ "device_alias",		F2FS_FEATURE_DEVICE_ALIAS,	0}, \
> +	{ "packed_ssa",			F2FS_FEATURE_PACKED_SSA,	1}, \

                                                                        ^
IIUC, this feature can not be tunned by fsck? since it will change the disk layout?

Thanks,

>  	{ NULL,				0x0,				0}, \
>  };
>  
> @@ -2161,18 +2166,18 @@ static inline void check_block_struct_sizes(void)
>  	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
>  			+ offsetof(struct f2fs_journal, nat_j)
>  			+ NAT_JOURNAL_ENTRIES * sizeof(struct nat_journal_entry)
> -			+ NAT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
> +			+ NAT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
>  
>  	/* Check SIT Journal Block Size */
>  	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM
>  			+ offsetof(struct f2fs_journal, sit_j)
>  			+ SIT_JOURNAL_ENTRIES * sizeof(struct sit_journal_entry)
> -			+ SIT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
> +			+ SIT_JOURNAL_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
>  
>  	/* Check Info Journal Block Size */
>  	assert(sizeof(struct f2fs_summary) * ENTRIES_IN_SUM + sizeof(__le64)
>  			+ offsetof(struct f2fs_journal, info)
> -			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_BLKSIZE);
> +			+ EXTRA_INFO_RESERVED + sizeof(struct summary_footer) == F2FS_SUM_BLKSIZE);
>  
>  	/* Check Dentry Block Size */
>  	assert(sizeof(__u8) * (SIZE_OF_DENTRY_BITMAP + SIZE_OF_RESERVED)
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index c31f3b8..deafc4f 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -734,6 +734,18 @@ int dev_reada_block(__u64 blk_addr)
>  	return dev_readahead(blk_addr << F2FS_BLKSIZE_BITS, F2FS_BLKSIZE);
>  }
>  
> +int dev_write_4k_block(void *buf, __u64 blk_addr, __u32 offset, enum rw_hint whint)
> +{
> +	return dev_write(buf, (blk_addr << F2FS_BLKSIZE_BITS) + offset * 4096,
> +			4096, whint);
> +}
> +
> +int dev_read_4k_block(void *buf, __u64 blk_addr, __u32 offset)
> +{
> +	return dev_read(buf, (blk_addr << F2FS_BLKSIZE_BITS) + offset * 4096,
> +			4096);
> +}
> +
>  int f2fs_fsync_device(void)
>  {
>  #ifdef HAVE_FSYNC
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index d05e897..b3dccd0 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -500,8 +500,16 @@ static int f2fs_prepare_super_block(void)
>  	if (c.feature & F2FS_FEATURE_RO) {
>  		blocks_for_ssa = 0;
>  	} else {
> +		unsigned int ssa_per_block;
> +
>  		ASSERT((total_valid_blks_available % c.blks_per_seg) == 0);
> -		blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
> +		if (c.feature & F2FS_FEATURE_PACKED_SSA) {
> +			ssa_per_block = c.blksize / F2FS_SUM_BLKSIZE;
> +			blocks_for_ssa = round_up(total_valid_blks_available /
> +					c.blks_per_seg, ssa_per_block);
> +		} else {
> +			blocks_for_ssa = total_valid_blks_available / c.blks_per_seg;
> +		}
>  	}
>  
>  	set_sb(segment_count_ssa, SEG_ALIGN(blocks_for_ssa));
> diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> index 8f8e975..8d44a9b 100644
> --- a/mkfs/f2fs_format_main.c
> +++ b/mkfs/f2fs_format_main.c
> @@ -380,6 +380,12 @@ static void f2fs_parse_options(int argc, char *argv[])
>  		}
>  	}
>  
> +	if ((c.feature & F2FS_FEATURE_PACKED_SSA) &&
> +			(c.blksize == F2FS_MIN_BLKSIZE)) {
> +		c.feature &= ~F2FS_FEATURE_PACKED_SSA;
> +		MSG(0, "\tInfo: packed_ssa feature is disabled for 4k block.\n");
> +	}
> +
>  	if (optind >= argc) {
>  		MSG(0, "\tError: Device not specified\n");
>  		mkfs_usage();



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
