Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104634701B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Mar 2021 04:28:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOuBy-0008Q2-5L; Wed, 24 Mar 2021 03:28:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lOuBw-0008Pr-Vh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 03:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zhe3TL43uFjRqKCRhiRRhDcDducHW5a1Y50mwY4j8QI=; b=Zc4Pyqy+NcxrS8pRY5gVdtkq8Q
 AJR0/Dk8GO0Tg2slODuUYCb8iIqh8f9hSn4aBwpD4gXLZnBddnHvcLQ/Ufv6g3VE95uUcC38LcY68
 JLcYyVR9h2yjrL4hcSIe8b9oToZQYIAHu+sNnMiRfUWyU6y6rSdBazXPZzNxWRLUY2/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zhe3TL43uFjRqKCRhiRRhDcDducHW5a1Y50mwY4j8QI=; b=j2R+9M8LY+jXaqz5vNhV4onyx3
 Ot5e5cCVRNMZ9+NblSnvyXvZI9QNyQEsLpkn4FC4AzUTf2HrvifTE3Jpbj/eEGBhX8wMTDbWi3zxI
 2oqnHyCXkaayuHzKAMZsg/HwRVJ0XyV0aELG4x8GuqUIiEkwW7ZBumOaIutjkdxTwCBY=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lOuBu-003kC8-Cm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 03:28:20 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F4ttW0Gl3z93Cx;
 Wed, 24 Mar 2021 11:26:11 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 24 Mar
 2021 11:28:09 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210220094052.64905-1-yuchao0@huawei.com>
 <YFOLNGo+/8sKQ7si@google.com>
 <ec5cda53-d3f4-450c-7567-7bfc68e224f9@huawei.com>
 <YFpy26JZRpZASB7R@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0a2a17af-8719-6865-554a-f339f367485e@huawei.com>
Date: Wed, 24 Mar 2021 11:28:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YFpy26JZRpZASB7R@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lOuBu-003kC8-Cm
Subject: Re: [f2fs-dev] [PATCH RFC] f2fs: fix to avoid selecting full
 segment w/ {AT, }SSR allocator
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/24 6:59, Jaegeuk Kim wrote:
> On 03/19, Chao Yu wrote:
>> On 2021/3/19 1:17, Jaegeuk Kim wrote:
>>> On 02/20, Chao Yu wrote:
>>>> In cp disabling mode, there could be a condition
>>>> - target segment has 128 ckpt valid blocks
>>>> - GC migrates 128 valid blocks to other segment (segment is still in
>>>> dirty list)
>>>> - GC migrates 384 blocks to target segment (segment has 128 cp_vblocks
>>>> and 384 vblocks)
>>>> - If GC selects target segment via {AT,}SSR allocator, however there is
>>>> no free space in targe segment.
>>>>
>>>> Fixes: 4354994f097d ("f2fs: checkpoint disabling")
>>>> Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>    fs/f2fs/f2fs.h    |  1 +
>>>>    fs/f2fs/gc.c      | 17 +++++++++++++----
>>>>    fs/f2fs/segment.c | 20 ++++++++++++++++++++
>>>>    3 files changed, 34 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index ed7807103c8e..9c753eff0814 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -3376,6 +3376,7 @@ block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
>>>>    int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
>>>>    void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
>>>>    int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
>>>> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
>>>>    void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
>>>>    void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi);
>>>>    void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi);
>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>> index 86ba8ed0b8a7..a1d8062cdace 100644
>>>> --- a/fs/f2fs/gc.c
>>>> +++ b/fs/f2fs/gc.c
>>>> @@ -392,10 +392,6 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>>>>    		if (p->gc_mode == GC_AT &&
>>>>    			get_valid_blocks(sbi, segno, true) == 0)
>>>>    			return;
>>>> -
>>>> -		if (p->alloc_mode == AT_SSR &&
>>>> -			get_seg_entry(sbi, segno)->ckpt_valid_blocks == 0)
>>>> -			return;
>>>>    	}
>>>>    	for (i = 0; i < sbi->segs_per_sec; i++)
>>>> @@ -736,6 +732,19 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>>>>    		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>>>>    			goto next;
>>>> +		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>>>> +			/*
>>>> +			 * to avoid selecting candidate which has below valid
>>>> +			 * block distribution:
>>>> +			 * partial blocks are valid and all left ones are valid
>>>> +			 * in previous checkpoint.
>>>> +			 */
>>>> +			if (p.alloc_mode == SSR || p.alloc_mode == AT_SSR) {
>>>> +				if (!segment_has_free_slot(sbi, segno))
>>>> +					goto next;
>>>
>>> Do we need to change this to check free_slot instead of get_ckpt_valid_blocks()?
>>
>> Jaegeuk,
>>
>> LFS was assigned only for GC case, in this case we are trying to select source
>> section, rather than target segment for SSR/AT_SSR case, so we don't need to
>> check free_slot.
>>
>> - f2fs_gc
>>   - __get_victim
>>    - get_victim(sbi, victim, gc_type, NO_CHECK_TYPE, LFS, 0);
>>
>>>
>>>    732                 if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>>>    733                                         get_ckpt_valid_blocks(sbi, segno) &&
>>>    734                                         p.alloc_mode == LFS))
>>
>> BTW, in LFS mode, GC wants to find source section rather than segment, so we
>> should change to check valid ckpt blocks in every segment of targe section here?
> 
> Alright. I refactored a bit on this patch with new one. Could you please take a look?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=00152bd7cabd69b4615ebead823ff23887b0e0f7

I see, newly added comment looks good to me.

One more concern is commit title and commit message is out-of-update,
I've revised it in v2:

https://lore.kernel.org/linux-f2fs-devel/20210324031828.67133-1-yuchao0@huawei.com/T/#u

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>>
>>>> +			}
>>>> +		}
>>>> +
>>>>    		if (is_atgc) {
>>>>    			add_victim_entry(sbi, &p, segno);
>>>>    			goto next;
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index 2d5a82c4ca15..deaf57e13125 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -2650,6 +2650,26 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
>>>>    		seg->next_blkoff++;
>>>>    }
>>>> +bool segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
>>>> +{
>>>> +	struct sit_info *sit = SIT_I(sbi);
>>>> +	struct seg_entry *se = get_seg_entry(sbi, segno);
>>>> +	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
>>>> +	unsigned long *target_map = SIT_I(sbi)->tmp_map;
>>>> +	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
>>>> +	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
>>>> +	int i, pos;
>>>> +
>>>> +	down_write(&sit->sentry_lock);
>>>> +	for (i = 0; i < entries; i++)
>>>> +		target_map[i] = ckpt_map[i] | cur_map[i];
>>>> +
>>>> +	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, 0);
>>>> +	up_write(&sit->sentry_lock);
>>>> +
>>>> +	return pos < sbi->blocks_per_seg;
>>>> +}
>>>> +
>>>>    /*
>>>>     * This function always allocates a used segment(from dirty seglist) by SSR
>>>>     * manner, so it should recover the existing segment information of valid blocks
>>>> -- 
>>>> 2.29.2
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
