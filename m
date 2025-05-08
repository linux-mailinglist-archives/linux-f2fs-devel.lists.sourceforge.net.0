Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0AAAF6E4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 11:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZHVdiBaOLqZ8tX7nRp4NKK0XLZrWcaO/cJARTLSE7g=; b=QeFU80s0THCOg4W/cChQFGUltr
	DrBIBBQ07fYyIPFzgX4cmln9Gni861TuieW7MygysMMyWHJXkrOHPPxW/QG7u1ZmKKwEQxftPHKBg
	HGGWHQ6QEmFPLy2O/vTH54D9/o6mDimxw5Ht3//fIxWXxgPvWhuA4J1Shetpt6xENDD0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCxia-0002Hv-1r;
	Thu, 08 May 2025 09:39:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCxiY-0002Ho-PN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 09:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r9EjWHlLNMPz6Uu2h14EbKjyvjxKS8Nxh/wyU7DwvEU=; b=DhUWeuLFEMi5MEJrDtchF3zlHA
 UgAt1U1YMvJbm1z9wxVafoA9qAdQlZgoehf7jay08vYNoYKsn+svcy41YhcO+7emjj9jzC6/aS3ST
 WnVgvHR0PH4aeD9g7CJuv4WIFTpIxM2OEWj1MKK0ispPuoKstlNbzKDhgGWS8dsnA7r8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r9EjWHlLNMPz6Uu2h14EbKjyvjxKS8Nxh/wyU7DwvEU=; b=e2Fpu/zARPsy1RHdkJ6uQ3pN5J
 +vTF/sgxZ45+qotyWxt3ziIF1Mla4zKptcouHBHezis2jOCAxdv9nKRm4oSBso7cVErsUFAKtrZIp
 WmZ1KemIFPkyVBheRkEMIz2Jb0RFDgGrdZGQGfkGR4HySv+h/CmHbtcf9un7sprqNLc8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCxiY-0002X2-1H for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 09:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B32644CCB;
 Thu,  8 May 2025 09:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41157C4CEE7;
 Thu,  8 May 2025 09:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746697131;
 bh=CMtqZ6TweDxC1ofKfV/gsvJjiOj2ZQ7+zmKfVa08o8A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dj3uPPSjuycussZoOtT39zkxoek6dah6ne/0VZDQ/4Ey+CXdJuryxiRFda6aiylEb
 vZ/mHBFubHNSqRwAk0GQPuoyBBee7ImPal6g5xL+DZGfgSFsfHQE+5UCpyLqZc1mz7
 +aoKrMR6teJrb1u1IDjQZWGat/wCtnqBcLHd6waHUXKn+Y6DUcBEZU84LXGidWBZ92
 J7IUvZGH8EyKYO3kE//RnN5h+nMI4RiE00rdWL6g+3LB6yTcaWAQpj1rg9F292MAwx
 maWfFr/nCa+1EjDWX8VnqZ8diYOhZXR9JSkiOOSiBTtaU0ue5j/8GwO2MofBwCzA7u
 E10qUv+nuQMSA==
Message-ID: <81348540-e3aa-4907-94cd-df0c408e66e0@kernel.org>
Date: Thu, 8 May 2025 17:38:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250508074756.693-1-yohan.joung@sk.com>
 <20250508074756.693-2-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250508074756.693-2-yohan.joung@sk.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/8/25 15:47,
 yohan.joung wrote: > when performing buffered
 writes in a large section, > overhead is incurred due to the iteration through
 > ckpt_valid_blocks within the section. > when SEGS_PER_SE [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCxiY-0002X2-1H
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: add ckpt_valid_blocks to the
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

On 5/8/25 15:47, yohan.joung wrote:
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
>  fs/f2fs/segment.c | 41 +++++++++++++++++++++++++++++-------
>  fs/f2fs/segment.h | 53 +++++++++++++++++++++++++++++++++++++----------
>  2 files changed, 76 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 671bc5a8fd4a..7a53f2d8a474 100644
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
> @@ -2492,15 +2492,22 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>  				f2fs_test_and_clear_bit(offset + i, se->discard_map))
>  			sbi->discard_blks++;
>  
> -		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
> +#ifdef CONFIG_F2FS_CHECK_FS
> +		if (__is_large_section(sbi))
> +			sanity_check_valid_blocks(sbi, segno);
> +#endif
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
> @@ -2532,13 +2539,23 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>  	 * SSR should never reuse block which is checkpointed
>  	 * or newly invalidated.
>  	 */
> +#ifdef CONFIG_F2FS_CHECK_FS
> +	if (__is_large_section(sbi))
> +		sanity_check_valid_blocks(sbi, segno);
> +#endif

How about doing sanity check after ckpt_valid_blocks update?

>  	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
> +		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
>  			se->ckpt_valid_blocks++;
> +			if (__is_large_section(sbi))
> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
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
> @@ -2569,9 +2586,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
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
> @@ -4700,12 +4717,16 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>  					&sit_in_journal(journal, offset));
>  				check_block_count(sbi, segno,
>  					&sit_in_journal(journal, offset));
> +				if (__is_large_section(sbi))
> +					set_ckpt_valid_blocks(sbi, segno);
>  			} else {
>  				sit_offset = SIT_ENTRY_OFFSET(sit_i, segno);
>  				seg_info_to_raw_sit(se,
>  						&raw_sit->entries[sit_offset]);
>  				check_block_count(sbi, segno,
>  						&raw_sit->entries[sit_offset]);
> +				if (__is_large_section(sbi))
> +					set_ckpt_valid_blocks(sbi, segno);
>  			}

Move here for cleanup?

if (__is_large_section(sbi))
	set_ckpt_valid_blocks(sbi, segno);

How about adding sanity check here as well?

>  
>  			__clear_bit(segno, bitmap);
> @@ -5029,6 +5050,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>  	}
>  	up_read(&curseg->journal_rwsem);
>  
> +	/* update ckpt_ckpt_valid_block */
> +	if (__is_large_section(sbi)) {
> +		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))

Let's keep the style of defining variable outside of 'for' statement.

> +			set_ckpt_valid_blocks(sbi, segno);
> +	}

do sanity check here?

> +
>  	if (err)
>  		return err;
>  
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 5777b385e7d2..ebc90d3cb57c 100644
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
> @@ -347,22 +348,52 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
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
> +#ifdef CONFIG_F2FS_CHECK_FS
> +static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
> +		unsigned int segno)
> +{
> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
> +	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
> +	unsigned int blocks = 0;
> +	int i;
> +
> +	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
> +		struct seg_entry *se = get_seg_entry(sbi, start_segno);
> +
> +		blocks += se->ckpt_valid_blocks;
> +	}
> +
> +	if (blocks != get_sec_entry(sbi, segno)->ckpt_valid_blocks) {
> +		f2fs_err(sbi,
> +			"Inconsistent ckpt valid blocks: "
> +			"seg entry(%d) vs sec entry(%d) at secno %d",
> +			blocks, get_sec_entry(sbi, segno)->ckpt_valid_blocks, secno);
> +		f2fs_bug_on(sbi, 1);
> +	}
> +}
> +#endif

#else
static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
			unsigned int segno)
{
}
#endif

Then we don't need to cover sanity_check_valid_blocks() invoking w/
CONFIG_F2FS_CHECK_FS.

Thanks,

>  static inline void seg_info_from_raw_sit(struct seg_entry *se,
>  					struct f2fs_sit_entry *rs)
>  {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
