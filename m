Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D527BAADA75
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 10:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RA7SdA6b4CeSvFPvJMBT5/2ifpU0AB8mSDGknvHoeKA=; b=ESpiIgJDeMBvRZDT+7g55S0IFY
	/ge7r8Ou9HY62udGkItSCDGSK+Mi7ehqsVTLKl9fpSiqp4NHBBPVqtKGt0FfQNanzJQnNl+VVhZ0q
	vEJwKvM21JNgwCs8KnaBsQAa6UsecBGg4duft7shQ18y3kLMBnC9sp7WZl0ipcC4uIUQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCaRP-0004dS-MG;
	Wed, 07 May 2025 08:47:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCaRJ-0004d3-CA
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 08:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h/dLKeQmmgnPpcMC4A+EyN/kz4EVcHSwdVwragnJqqM=; b=U67WNK2fyImLVR7hLyucAVM952
 YJWTvBgIQJqifzB7h1LyQas1Io8JdIu/3ntqDcdvFvUxCBJifG0tXLhETILOYBSItfDYnakhbz33X
 rpiTd7eV/WD7TRSw1DExglic0JR8xSHcAu/Qc5+ipTCTmb14X7Y0DgmlNfPG0PKg9ca4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h/dLKeQmmgnPpcMC4A+EyN/kz4EVcHSwdVwragnJqqM=; b=E98n4vhe/00vBsMAVFPu93ihcd
 w7Fhk6+yILRQoBERmkD8lUvOoHf7lFLY0Lsu6ZD41+eAcOWwdAIJ+tU6t9m1CEFj0uZ1kv1VNWQfk
 2GsEXz4VbRzpKTGbEFstYvmOjiRSLxSKXh3xSKPgiSUlkijwg96ynFdUjFApwMCGBfbU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCaR3-00016W-AT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 08:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 88799629CF;
 Wed,  7 May 2025 08:47:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCD4C4CEE7;
 Wed,  7 May 2025 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746607639;
 bh=skT+jm/I1+s3qJ/34RV3f3ESCZC3ZUA97zf2RRElj5k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TD4vV4Xgx+V5MEtMgOEy0PdEFx09x2DRlJqCkaA3Mh8vg2K6GFC8ezzMi19DEZl/2
 o5Rr4i1ap3cA6KIQeDBLCQATn1OLrKxq8bfI3Nm1CTvQcC/SoWUulYHtAJEpeUFd6C
 9p3gaABnGP5gBrHCwUvjF0E0IrbfmcmJ5YlzjIvlGOq8hrI9AbccSsZHQJnQ+k9tU0
 lcwt5mTS4A1hOW8Un8J70iAg6pEKSzxPoC3oXDPWHrL7S8lh+HTAGECjDPUvvYI6p6
 A0AD+OBZspMWoj/EqanpgdlQ/QYxrdf8nNJDc7wvYr7As9wzuMewQQH/YBjOr7a+QH
 kFJYrYskicXtw==
Message-ID: <c6714296-6dee-429e-8aa7-897fbf657231@kernel.org>
Date: Wed, 7 May 2025 16:47:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250507043038.591-1-yohan.joung@sk.com>
 <20250507043038.591-2-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250507043038.591-2-yohan.joung@sk.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/7/25 12:30,
 yohan.joung wrote: > when performing buffered
 writes in a large section, > overhead is incurred due to the iteration through
 > ckpt_valid_blocks within the section. > when SEGS_PER_SE [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCaR3-00016W-AT
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: add ckpt_valid_blocks to the
 section entry
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 5/7/25 12:30, yohan.joung wrote:
> when performing buffered writes in a large section,
> overhead is incurred due to the iteration through
> ckpt_valid_blocks within the section.
> when SEGS_PER_SEC is 128, this overhead accounts for 20% within
> the f2fs_write_single_data_page routine.
> as the size of the section increases, the overhead also grows.
> to handle this problem ckpt_valid_blocks is
> added within the section entries.
> 
> Test
> insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
> hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
> make_f2fs /dev/block/nullb0
> make_f2fs -s 128 /dev/block/nullb0
> fio --bs=512k --size=1536M --rw=write --name=1
> --filename=/mnt/test_dir/seq_write
> --ioengine=io_uring --iodepth=64 --end_fsync=1
> 
> before
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2145MiB/s
> 
> after
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2556MiB/s
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/segment.c | 29 ++++++++++++++++++++++-------
>  fs/f2fs/segment.h | 29 ++++++++++++++++++-----------
>  2 files changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 671bc5a8fd4a..09b66a755559 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2447,7 +2447,7 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
>   * that the consecutive input blocks belong to the same segment.
>   */
>  static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
> -				block_t blkaddr, unsigned int offset, int del)
> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>  {
>  	bool exist;
>  #ifdef CONFIG_F2FS_CHECK_FS
> @@ -2492,15 +2492,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>  				f2fs_test_and_clear_bit(offset + i, se->discard_map))
>  			sbi->discard_blks++;
>  
> -		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
> +		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
>  			se->ckpt_valid_blocks -= 1;
> +			if (__is_large_section(sbi))
> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
> +		}
>  	}
>  
>  	return del;
>  }
>  
>  static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
> -				block_t blkaddr, unsigned int offset, int del)
> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>  {
>  	bool exist;
>  #ifdef CONFIG_F2FS_CHECK_FS
> @@ -2533,12 +2536,18 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>  	 * or newly invalidated.
>  	 */
>  	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
> +		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
>  			se->ckpt_valid_blocks++;
> +			if (__is_large_section(sbi))
> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;

What about adding sanity_check_valid_blocks() to check consistency between
valid blocks of segments and valid blocks of section? Covered w/
CONFIG_F2FS_CHECK_FS.

> +		}
>  	}
>  
> -	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
> +	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
>  		se->ckpt_valid_blocks += del;
> +		if (__is_large_section(sbi))
> +			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
> +	}
>  
>  	return del;
>  }
> @@ -2569,9 +2578,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>  
>  	/* Update valid block bitmap */
>  	if (del > 0) {
> -		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
> +		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
>  	} else {
> -		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
> +		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
>  	}
>  
>  	__mark_sit_entry_dirty(sbi, segno);
> @@ -5029,6 +5038,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	}
>  	up_read(&curseg->journal_rwsem);
>  
> +	/* update ckpt_ckpt_valid_block */
> +	if (__is_large_section(sbi)) {
> +		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))

		unsigned int segno;

		for (segno = 0; segno < MAIN_SEGS(sbi);
					segno += SEGS_PER_SEC(sbi))

> +			set_ckpt_valid_blocks(sbi, segno);

ckpt_valid_blocks will be reset in f2fs_flush_sit_entries -> seg_info_to_raw_sit,
we need to call set_ckpt_valid_blocks() for each updated section?

Thanks,

> +	}
> +
>  	if (err)
>  		return err;
>  
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index f5d30f32ebdb..e91d944f003a 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -211,6 +211,7 @@ struct seg_entry {
>  
>  struct sec_entry {
>  	unsigned int valid_blocks;	/* # of valid blocks in a section */
> +	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
>  };
>  
>  #define MAX_SKIP_GC_COUNT			16
> @@ -347,20 +348,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
>  static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
>  				unsigned int segno, bool use_section)
>  {
> -	if (use_section && __is_large_section(sbi)) {
> -		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> -		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> -		unsigned int blocks = 0;
> -		int i;
> +	if (use_section && __is_large_section(sbi))
> +		return get_sec_entry(sbi, segno)->ckpt_valid_blocks;
> +	else
> +		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> +}
> +
> +static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
> +		unsigned int segno)
> +{
> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> +	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> +	unsigned int blocks = 0;
> +	int i;
>  
> -		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
> -			struct seg_entry *se = get_seg_entry(sbi, start_segno);
> +	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
> +		struct seg_entry *se = get_seg_entry(sbi, start_segno);
>  
> -			blocks += se->ckpt_valid_blocks;
> -		}
> -		return blocks;
> +		blocks += se->ckpt_valid_blocks;
>  	}
> -	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> +	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
>  }
>  
>  static inline void seg_info_from_raw_sit(struct seg_entry *se,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
