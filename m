Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21244AADAAD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 11:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN0RM51IaF/TBJ0bywYgvb/WM9hgH+d5TtcH45Sdi6c=; b=ZxeOm8WhGA204g9KQrc08xech3
	zsgYMKcQ9I3cRN184//53UCnOtrT423d2VZoY9pGnCHBlpUvXvdPFBUvgk+DSqX8zVAFnMz+Rmu1f
	l/ctcbJaHp0oJFeSVJRkNOeAkq7IJ0gWz1T9FtVtZqz4a6SM1gRP5lWxKt+hcTq0KXKA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCagt-00058V-GQ;
	Wed, 07 May 2025 09:03:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yohan.joung@sk.com>) id 1uCagr-00058P-0p
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 09:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y+kT58ee7AbGc14gTWnK+xOk+d+7IHAQxxMbH2ZknJE=; b=MW9j6wat/udStbHocG9eXsNsFd
 sKQK90YG0UeE4MjIFvNH1Fd5eYotBfgCDqzRF+DYJxsjXjsFcjMS+9NNvktyd8hr6NSrbp1VpfvvO
 +JeBVGwoaPdAsA9+dJHgz3zVaaEmDlY6T3ykrWtKm2EotXS2lVYEQthoza2IFmnmacuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y+kT58ee7AbGc14gTWnK+xOk+d+7IHAQxxMbH2ZknJE=; b=K4gpgtEW6Tr4i/zO3g7IbUnUFq
 EQ0Sf/6Go8LsjgPL6ydSQEiWuRA/MiIHbGPLjairng04jZX9h6rIibAipkgDB6+5JxpyUjAVpEeBC
 QCdzAFfhl9+ySMCyg3IUu3E3b6/TwKy2QpSvEEXAcc4MhpDwhOI9OX6/evQqND/pjWcE=;
Received: from exvmail3.hynix.com ([166.125.252.90] helo=invmail3.skhynix.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1uCagZ-0002vM-88 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 09:03:44 +0000
X-AuditID: a67dfc59-03fff7000000aab6-81-681b21d2637c
From: "yohan.joung" <yohan.joung@sk.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 May 2025 18:03:12 +0900
Message-ID: <20250507090312.614-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <c6714296-6dee-429e-8aa7-897fbf657231@kernel.org>
References: <c6714296-6dee-429e-8aa7-897fbf657231@kernel.org>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXC9ZZnoe4lRekMgxtvZSxOTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErozF
 P9YwFawxrbjaNIm1gXGHdhcjJ4eEgInEkudt7DD2xvV7WUBsNgENiT+9vcwgtoiAlsTEhr+M
 XYxcHMwCfYwSE39cZgNJCAuES7w7PQ2sgUVAVaKt4xVYA6+AqcSk+x1MEEM1JXZ8OQ9mcwrY
 SUyYeJIRxBYSsJXY8/EbE0S9oMTJmU/A5jALyEs0b53NDLJMQqCDTeJ5wzdWiEGSEgdX3GCZ
 wMg/C0nPLCQ9CxiZVjGKZOaV5SZm5hjrFWdnVOZlVugl5+duYgSG5LLaP5E7GL9dCD7EKMDB
 qMTDe+CnZIYQa2JZcWXuIUYJDmYlEd7794FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeY2+lacI
 CaQnlqRmp6YWpBbBZJk4OKUaGN3r423bgsr+rlZl3b/59kT2CMW+tbFXLwi5J/EIiV1wbf8d
 LXH/KsPk/qALllnX8heENn+1nPh54qXDresvlKj76x8q4RG/lMW3wrFp3jXZzvlhieUXbHol
 i+PLInkWXbgR/2yL57pCndovz3WDX/x0rO7Te5zKdL8hWKTvkn/+S+ksAf+FSizFGYmGWsxF
 xYkAujcmh0UCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsXCNUNlju4lRekMg027RCxOTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
 LpuU1JzMstQifbsErozFP9YwFawxrbjaNIm1gXGHdhcjJ4eEgInExvV7WUBsNgENiT+9vcwg
 toiAlsTEhr+MXYxcHMwCfYwSE39cZgNJCAuES7w7PQ2sgUVAVaKt4xVYA6+AqcSk+x1MEEM1
 JXZ8OQ9mcwrYSUyYeJIRxBYSsJXY8/EbE0S9oMTJmU/A5jALyEs0b53NPIGRZxaS1CwkqQWM
 TKsYRTLzynITM3PM9IqzMyrzMiv0kvNzNzECg2xZ7Z9JOxi/XXY/xCjAwajEw3vgp2SGEGti
 WXFl7iFGCQ5mJRHe+/eBQrwpiZVVqUX58UWlOanFhxilOViUxHm9wlMThATSE0tSs1NTC1KL
 YLJMHJxSDYyMPFFNW1auf7r4a8ZezmcmacdmmTPs3aSUL6q06WLf6ii1T7ZnHwt9zr4wp96v
 JubkiR8ZvZ7XyqtM36wtjF1y1vPTowtcN9ctDtg4P8dafAFbn+uEc/92HN76Sun+j3u7ur3f
 Nj91aTou+cH4pde9T6UxTH8Z9hl/1/5+nkOJYft1X7HSD/vllFiKMxINtZiLihMBpU8Zsi4C
 AAA=
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  >On 5/7/25 12:30,
 yohan.joung wrote: >> when performing buffered
 writes in a large section, >> overhead is incurred due to the iteration through
 >> ckpt_valid_blocks within the section. >> when SEGS_P [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [166.125.252.90 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1uCagZ-0002vM-88
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 pilhyun.kim@sk.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>On 5/7/25 12:30, yohan.joung wrote:
>> when performing buffered writes in a large section,
>> overhead is incurred due to the iteration through
>> ckpt_valid_blocks within the section.
>> when SEGS_PER_SEC is 128, this overhead accounts for 20% within
>> the f2fs_write_single_data_page routine.
>> as the size of the section increases, the overhead also grows.
>> to handle this problem ckpt_valid_blocks is
>> added within the section entries.
>> 
>> Test
>> insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
>> hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
>> make_f2fs /dev/block/nullb0
>> make_f2fs -s 128 /dev/block/nullb0
>> fio --bs=512k --size=1536M --rw=write --name=1
>> --filename=/mnt/test_dir/seq_write
>> --ioengine=io_uring --iodepth=64 --end_fsync=1
>> 
>> before
>> SEGS_PER_SEC 1
>> 2556MiB/s
>> SEGS_PER_SEC 128
>> 2145MiB/s
>> 
>> after
>> SEGS_PER_SEC 1
>> 2556MiB/s
>> SEGS_PER_SEC 128
>> 2556MiB/s
>> 
>> Signed-off-by: yohan.joung <yohan.joung@sk.com>
>> ---
>>  fs/f2fs/segment.c | 29 ++++++++++++++++++++++-------
>>  fs/f2fs/segment.h | 29 ++++++++++++++++++-----------
>>  2 files changed, 40 insertions(+), 18 deletions(-)
>> 
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 671bc5a8fd4a..09b66a755559 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2447,7 +2447,7 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
>>   * that the consecutive input blocks belong to the same segment.
>>   */
>>  static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
>> -				block_t blkaddr, unsigned int offset, int del)
>> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>>  {
>>  	bool exist;
>>  #ifdef CONFIG_F2FS_CHECK_FS
>> @@ -2492,15 +2492,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
>>  				f2fs_test_and_clear_bit(offset + i, se->discard_map))
>>  			sbi->discard_blks++;
>>  
>> -		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
>> +		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
>>  			se->ckpt_valid_blocks -= 1;
>> +			if (__is_large_section(sbi))
>> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
>> +		}
>>  	}
>>  
>>  	return del;
>>  }
>>  
>>  static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
>> -				block_t blkaddr, unsigned int offset, int del)
>> +				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
>>  {
>>  	bool exist;
>>  #ifdef CONFIG_F2FS_CHECK_FS
>> @@ -2533,12 +2536,18 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
>>  	 * or newly invalidated.
>>  	 */
>>  	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
>> -		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
>> +		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
>>  			se->ckpt_valid_blocks++;
>> +			if (__is_large_section(sbi))
>> +				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
>
>What about adding sanity_check_valid_blocks() to check consistency between
>valid blocks of segments and valid blocks of section? Covered w/
>CONFIG_F2FS_CHECK_FS.
I will add it, thanks
>
>> +		}
>>  	}
>>  
>> -	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
>> +	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
>>  		se->ckpt_valid_blocks += del;
>> +		if (__is_large_section(sbi))
>> +			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
>> +	}
>>  
>>  	return del;
>>  }
>> @@ -2569,9 +2578,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
>>  
>>  	/* Update valid block bitmap */
>>  	if (del > 0) {
>> -		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
>> +		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
>>  	} else {
>> -		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
>> +		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
>>  	}
>>  
>>  	__mark_sit_entry_dirty(sbi, segno);
>> @@ -5029,6 +5038,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>>  	}
>>  	up_read(&curseg->journal_rwsem);
>>  
>> +	/* update ckpt_ckpt_valid_block */
>> +	if (__is_large_section(sbi)) {
>> +		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
>
>		unsigned int segno;
>
>		for (segno = 0; segno < MAIN_SEGS(sbi);
>					segno += SEGS_PER_SEC(sbi))
>
>> +			set_ckpt_valid_blocks(sbi, segno);
>
>ckpt_valid_blocks will be reset in f2fs_flush_sit_entries -> seg_info_to_raw_sit,
>we need to call set_ckpt_valid_blocks() for each updated section?
>
>Thanks,
going to add set_ckpt_valid_blocks to seg_info_to_raw_sit
Thanks.
>
>> +	}
>> +
>>  	if (err)
>>  		return err;
>>  
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index f5d30f32ebdb..e91d944f003a 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -211,6 +211,7 @@ struct seg_entry {
>>  
>>  struct sec_entry {
>>  	unsigned int valid_blocks;	/* # of valid blocks in a section */
>> +	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
>>  };
>>  
>>  #define MAX_SKIP_GC_COUNT			16
>> @@ -347,20 +348,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
>>  static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
>>  				unsigned int segno, bool use_section)
>>  {
>> -	if (use_section && __is_large_section(sbi)) {
>> -		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>> -		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>> -		unsigned int blocks = 0;
>> -		int i;
>> +	if (use_section && __is_large_section(sbi))
>> +		return get_sec_entry(sbi, segno)->ckpt_valid_blocks;
>> +	else
>> +		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>> +}
>> +
>> +static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
>> +		unsigned int segno)
>> +{
>> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>> +	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>> +	unsigned int blocks = 0;
>> +	int i;
>>  
>> -		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
>> -			struct seg_entry *se = get_seg_entry(sbi, start_segno);
>> +	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
>> +		struct seg_entry *se = get_seg_entry(sbi, start_segno);
>>  
>> -			blocks += se->ckpt_valid_blocks;
>> -		}
>> -		return blocks;
>> +		blocks += se->ckpt_valid_blocks;
>>  	}
>> -	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>> +	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
>>  }
>>  
>>  static inline void seg_info_from_raw_sit(struct seg_entry *se,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
