Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD919AD36E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 09:15:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7Dt5-00044N-Lb; Mon, 09 Sep 2019 07:14:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i7Dt4-00043w-3W
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 07:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MmBX+z5u642J01jpVQpzP6KgPgk6MwX6t5+BH6NB0tY=; b=ZF04RMtx5i5gOaIx7Yw3uDgxRW
 MvyZpigGg7FAt8Frw1NAdi9SWd0tatv7uMq68hGq0XWXoaQtigJmCInncRoBTOZGIazqg/P0nzGLe
 SqmXP1SDvkkUolxoUfT+PISsFHFYIZSb1Q/f4YBc7MFnvBdbp5G/b2rZuQ1IWK1iygLs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MmBX+z5u642J01jpVQpzP6KgPgk6MwX6t5+BH6NB0tY=; b=RtXuBEGl8A+i6dJAw4MSJNyR2b
 rFmhucsIFHMMTdl9RQBUAe423VS1DT/GUZ47NKxLVZGnJ+XvIRNGiLJ56UQNZSadZqzUTcO14AnQ3
 qnDopLUBies7kouBiQ6TjSXtVeV/xtRcS82XNyTkapMwLQHcj7voU8unrq7vOHq3qzsA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7Dsz-00EnDu-BI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 07:14:58 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7CF9920E9D072D0F7C92;
 Mon,  9 Sep 2019 15:14:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019
 15:14:41 +0800
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20190830101936.32265-1-shinichiro.kawasaki@wdc.com>
 <20190830101936.32265-3-shinichiro.kawasaki@wdc.com>
 <486550b2-bb47-d725-79a9-4fb3a4ba28e3@huawei.com>
 <20190903083704.kmc5bwfdpeinzfle@shindev>
 <7e13140d-f031-9eda-3544-747f80880df9@huawei.com>
 <20190906083114.jmjzczqzp4m3kxex@shindev>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
Date: Mon, 9 Sep 2019 15:14:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190906083114.jmjzczqzp4m3kxex@shindev>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i7Dsz-00EnDu-BI
Subject: Re: [f2fs-dev] [PATCH v4 2/2] fsck.f2fs: Check write pointer
 consistency with current segments
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/6 16:31, Shinichiro Kawasaki wrote:
> On Sep 05, 2019 / 17:58, Chao Yu wrote:
>> Hi Shinichiro,
>>
>> Sorry for the delay.
>>
>> On 2019/9/3 16:37, Shinichiro Kawasaki wrote:
>>> On Sep 02, 2019 / 15:02, Chao Yu wrote:
>>>> On 2019/8/30 18:19, Shin'ichiro Kawasaki wrote:
>>>>> On sudden f2fs shutdown, zoned block device status and f2fs current
>>>>> segment positions in meta data can be inconsistent. When f2fs shutdown
>>>>> happens before write operations completes, write pointers of zoned block
>>>>> devices can go further but f2fs meta data keeps current segments at
>>>>> positions before the write operations. After remounting the f2fs, the
>>>>> inconsistency causes write operations not at write pointers and
>>>>> "Unaligned write command" error is reported. This error was observed when
>>>>> xfstests test case generic/388 was run with f2fs on a zoned block device.
>>>>>
>>>>> To avoid the error, have f2fs.fsck check consistency between each current
>>>>> segment's position and the write pointer of the zone the current segment
>>>>> points to. If the write pointer goes advance from the current segment,
>>>>> fix the current segment position setting at same as the write pointer
>>>>> position. If the write pointer goes to the zone end, find a new zone and
>>>>> set the current segment position at the new zone start. In case the write
>>>>> pointer is behind the current segment, write zero data at the write
>>>>> pointer position to make write pointer position at same as the current
>>>>> segment.
>>>>>
>>>>> When inconsistencies are found, turn on c.bug_on flag in fsck_verify() to
>>>>> ask users to fix them or not. When inconsistencies get fixed, turn on
>>>>> 'force' flag in fsck_verify() to enforce fixes in following checks. This
>>>>> position fix is done at the beginning of do_fsck() function so that other
>>>>> checks reflect the current segment modification.
>>>>>
>>>>> Also add GET_SEC_FROM_SEG and GET_SEG_FROM_SEC macros in fsck/fsck.h to
>>>>> simplify the code.
>>>>>
>>>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>>>>> ---
>>>>>  fsck/f2fs.h |   5 ++
>>>>>  fsck/fsck.c | 198 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>  fsck/fsck.h |   3 +
>>>>>  fsck/main.c |   2 +
>>>>>  4 files changed, 208 insertions(+)
>>>>>
>>>>> diff --git a/fsck/f2fs.h b/fsck/f2fs.h
>>>>> index 4dc6698..2c1c2b3 100644
>>>>> --- a/fsck/f2fs.h
>>>>> +++ b/fsck/f2fs.h
>>>>> @@ -337,6 +337,11 @@ static inline block_t __end_block_addr(struct f2fs_sb_info *sbi)
>>>>>  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
>>>>>  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (sbi->blocks_per_seg - 1))
>>>>>  
>>>>> +#define GET_SEC_FROM_SEG(sbi, segno)					\
>>>>> +	((segno) / (sbi)->segs_per_sec)
>>>>> +#define GET_SEG_FROM_SEC(sbi, secno)					\
>>>>> +	((secno) * (sbi)->segs_per_sec)
>>>>> +
>>>>>  #define FREE_I_START_SEGNO(sbi)						\
>>>>>  	GET_SEGNO_FROM_SEG0(sbi, SM_I(sbi)->main_blkaddr)
>>>>>  #define GET_R2L_SEGNO(sbi, segno)	(segno + FREE_I_START_SEGNO(sbi))
>>>>> diff --git a/fsck/fsck.c b/fsck/fsck.c
>>>>> index 8953ca1..a0f6849 100644
>>>>> --- a/fsck/fsck.c
>>>>> +++ b/fsck/fsck.c
>>>>> @@ -2574,6 +2574,190 @@ out:
>>>>>  	return cnt;
>>>>>  }
>>>>>  
>>>>> +/*
>>>>> + * Search a free section in main area. Start search from the section specified
>>>>> + * with segno argument toward main area end. Return first segment of the found
>>>>> + * section in segno argument.
>>>>> + */
>>>>> +static int find_next_free_section(struct f2fs_sb_info *sbi,
>>>>> +				  unsigned int *segno)
>>>>> +{
>>>>> +	unsigned int i, sec, section_valid_blocks;
>>>>> +	unsigned int end_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr)
>>>>> +		+ SM_I(sbi)->main_segments;
>>>>> +	unsigned int end_sec = GET_SEC_FROM_SEG(sbi, end_segno);
>>>>> +	struct seg_entry *se;
>>>>> +	struct curseg_info *cs;
>>>>> +
>>>>> +	for (sec = GET_SEC_FROM_SEG(sbi, *segno); sec < end_sec; sec++) {
>>>>> +		/* find a section without valid blocks */
>>>>> +		section_valid_blocks = 0;
>>>>> +		for (i = 0; i < sbi->segs_per_sec; i++) {
>>>>> +			se = get_seg_entry(sbi, GET_SEG_FROM_SEC(sbi, sec) + i);
>>>>> +			section_valid_blocks += se->valid_blocks;
>>>>
>>>> If we want to find a 'real' free section, we'd better to use
>>>> se->ckpt_valid_blocks (wrapped with get_seg_vblocks()) in where we has recorded
>>>> fsynced data count.
>>>
>>> Thanks. When I create next patch series, I will use get_seg_vblocks().
>>> I will rebase to dev-test branch in which get_seg_vblocks() is available.
>>>
>>>>
>>>>> +		}
>>>>> +		if (section_valid_blocks)
>>>>> +			continue;
>>>>> +
>>>>> +		/* check the cursegs do not use the section */
>>>>> +		for (i = 0; i < NO_CHECK_TYPE; i++) {
>>>>> +			cs = &SM_I(sbi)->curseg_array[i];
>>>>> +			if (GET_SEC_FROM_SEG(sbi, cs->segno) == sec)
>>>>> +				break;
>>>>> +		}
>>>>> +		if (i >= NR_CURSEG_TYPE) {
>>>>> +			*segno = GET_SEG_FROM_SEC(sbi, sec);
>>>>> +			return 0;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	return -1;
>>>>> +}
>>>>> +
>>>>> +struct write_pointer_check_data {
>>>>> +	struct f2fs_sb_info *sbi;
>>>>> +	struct device_info *dev;
>>>>> +};
>>>>> +
>>>>> +static int fsck_chk_write_pointer(int i, struct blk_zone *blkz, void *opaque)
>>>>> +{
>>>>> +	struct write_pointer_check_data *wpd = opaque;
>>>>> +	struct f2fs_sb_info *sbi = wpd->sbi;
>>>>> +	struct device_info *dev = wpd->dev;
>>>>> +	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
>>>>> +	block_t zone_block, wp_block, wp_blkoff, cs_block, b;
>>>>> +	unsigned int zone_segno, wp_segno, new_segno;
>>>>> +	struct seg_entry *se;
>>>>> +	struct curseg_info *cs;
>>>>> +	int cs_index, ret;
>>>>> +	int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
>>>>> +	unsigned int segs_per_zone = sbi->segs_per_sec * sbi->secs_per_zone;
>>>>> +	void *zero_blk;
>>>>> +
>>>>> +	if (blk_zone_conv(blkz))
>>>>> +		return 0;
>>>>> +
>>>>> +	zone_block = dev->start_blkaddr
>>>>> +		+ (blk_zone_sector(blkz) >> log_sectors_per_block);
>>>>> +	zone_segno = GET_SEGNO(sbi, zone_block);
>>>>> +	wp_block = dev->start_blkaddr
>>>>> +		+ (blk_zone_wp_sector(blkz) >> log_sectors_per_block);
>>>>> +	wp_segno = GET_SEGNO(sbi, wp_block);
>>>>> +	wp_blkoff = wp_block - START_BLOCK(sbi, wp_segno);
>>>>> +
>>>>> +	/* find the curseg which points to the zone */
>>>>> +	for (cs_index = 0; cs_index < NO_CHECK_TYPE; cs_index++) {
>>>>> +		cs = &SM_I(sbi)->curseg_array[cs_index];
>>>>> +		if (zone_segno <= cs->segno &&
>>>>> +		    cs->segno < zone_segno + segs_per_zone)
>>>>> +			break;
>>>>> +	}
>>>>> +
>>>>> +	if (cs_index >= NR_CURSEG_TYPE)
>>>>> +		return 0;
>>>>> +
>>>>> +	/* check write pointer consistency with the curseg in the zone */
>>>>> +	cs_block = START_BLOCK(sbi, cs->segno) + cs->next_blkoff;
>>>>> +	if (wp_block == cs_block)
>>>>> +		return 0;
>>>>> +
>>>>> +	if (!c.fix_on) {
>>>>> +		MSG(0, "Inconsistent write pointer: "
>>>>> +		    "curseg %d[0x%x,0x%x] wp[0x%x,0x%x]\n",
>>>>> +		    cs_index, cs->segno, cs->next_blkoff, wp_segno, wp_blkoff);
>>>>> +		fsck->chk.wp_inconsistent_zones++;
>>>>> +		return 0;
>>>>> +	}
>>>>> +
>>>>> +	/*
>>>>> +	 * If the curseg is in advance from the write pointer, write zero to
>>>>> +	 * move the write pointer forward to the same position as the curseg.
>>>>> +	 */
>>>>> +	if (wp_block < cs_block) {
>>>>> +		ret = 0;
>>>>> +		zero_blk = calloc(BLOCK_SZ, 1);
>>>>> +		if (!zero_blk)
>>>>> +			return -EINVAL;
>>>>> +
>>>>> +		FIX_MSG("Advance write pointer to match with curseg %d: "
>>>>> +			"[0x%x,0x%x]->[0x%x,0x%x]",
>>>>> +			cs_index, wp_segno, wp_blkoff,
>>>>> +			cs->segno, cs->next_blkoff);
>>>>> +		for (b = wp_block; b < cs_block && !ret; b++)
>>>>> +			ret = dev_write_block(zero_blk, b);
>>>>> +
>>>>> +		fsck->chk.wp_fixed_zones++;
>>>>> +		free(zero_blk);
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>> +	if (wp_segno == zone_segno + segs_per_zone) {
>>>>> +		/*
>>>>> +		 * If the write pointer is in advance from the curseg and at
>>>>> +		 * the zone end (section end), search a new free zone (section)
>>>>> +		 * between the curseg and main area end.
>>>>> +		 */
>>>>> +		new_segno = wp_segno;
>>>>> +		ret = find_next_free_section(sbi, &new_segno);
>>>>> +		if (ret) {
>>>>> +			/* search again from main area start */
>>>>> +			new_segno = GET_SEGNO(sbi, SM_I(sbi)->main_blkaddr);
>>>>> +			ret = find_next_free_section(sbi, &new_segno);
>>>>> +		}
>>>>
>>>> If curseg's type is warm node, relocating curseg would ruin warm node chain,
>>>> result in losing fsynced data for ever as well.
>>>>
>>>> So I guess we should migrate all dnode blocks chained with cs->next_blkoff in
>>>> current section.
>>>>
>>>>> +		if (ret) {
>>>>> +			MSG(0, "Free section not found\n");
>>>>> +			return ret;
>>>>> +		}
>>>>> +		FIX_MSG("New section for curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
>>>>> +			cs_index, cs->segno, cs->next_blkoff, new_segno, 0);
>>>>> +		cs->segno = new_segno;
>>>>> +		cs->next_blkoff = 0;
>>>>> +	} else {
>>>>> +		/*
>>>>> +		 * If the write pointer is in advance from the curseg within
>>>>> +		 * the zone, modify the curseg position to be same as the
>>>>> +		 * write pointer.
>>>>> +		 */
>>>>> +		ASSERT(wp_segno < zone_segno + segs_per_zone);
>>>>> +		FIX_MSG("Advance curseg %d: [0x%x,0x%x]->[0x%x,0x%x]",
>>>>> +			cs_index, cs->segno, cs->next_blkoff,
>>>>> +			wp_segno, wp_blkoff);
>>>>> +		cs->segno = wp_segno;
>>>>> +		cs->next_blkoff = wp_blkoff;
>>>>
>>>> The same data lose problem here, I guess we'd better handle it with the same way
>>>> as above.
>>>>
>>>> Thoughts?
>>>
>>> I created f2fs status with fsync data and warm node chain, and confirmed the v4
>>> implementation ruins the dnode blocks chain. Hmm.
>>>
>>> My understanding is that when f2fs kernel module recovers the fsync data, it
>>> sets the warm node curseg position at the start of the fsync data, and the fsync
>>> data will be overwritten as new nodes created. Is this understanding correct?
>>
>> Sorry, I'm not sure I've understood you correctly.
> 
> Apology is mine, my question was not clear enough.
> And thanks for the explanation below. It helps me to understand better.
> 
>> Current recovery flow is:
>> 1)   find all valid fsynced dnode in warm node chain
>> 2.a) recover fsynced dnode in memory, and set it dirty
>> 2.b) recover directory entry in memory, and set it dirty
>> 2.c) during regular's dnode recovery, physical blocks indexed by recovered dnode
>> will be revalidated
>> Note: we didn't move any cursegs before 3)
>> 3)   relocate all cursegs to new segments
>> 4)   trigger checkpoint to persist all recovered data(fs' meta, file's meta/data)
> 
> Question, does the step 3) correspond to f2fs_allocate_new_segments(sbi) call
> at the end of recover_data()? The f2fs_allocate_new_segments() function

Yeah, I meant that function.

> relocates new segments only for DATA cursegs, and it keeps NODE cursegs same as
> before the fsync data recovery. Then I thought WARM NODE curseg would not change
> by recovery (and still keeps pointing to the fsync recovery data).

Yes, that's correct. WARM NODE curseg won't change until step 4).
> 
>>>
>>> If this is the case, I think write pointer inconsistency will happen even if
>>> fsck does "migrate all dnode blocks" (I assume that the warm node curseg's next
>>
>> Actually, I notice that scheme's problem is: we've changed zone's write pointer
>> during dnode blocks migration, however if kernel drops recovery, we will still
>> face inconsistent status in between .next_blkaddr and .write_pointer, once we
>> start to write data from .next_blkaddr. So in fsck, after migration, we need to
>> reset .write_pointer to .next_blkaddr.
>>
>> I guess we need to consider four cases:
>>
>> o: support .write_pointer recovery
>> x: not support .write_pointer recovery
>>
>> 1) kernel: o, fsck: x, trigger recovery in kernel
>> 2) kernel: o, fsck: x, not trigger recovery in kernel
>> 3) kernel: x, fsck: o, trigger recovery in kernel
>> 4) kernel: x, fsck: o, not trigger recovery in kernel
>>
>> For 1) and 2), we can simply adjust to reset all invalid zone and allocate new
>> zone for curseg before data/meta writes.
> 
> Thanks for the clarification. This approach for case 1) and 2) is simple. Let me
> try to create a patch for it.
> 
>>
>> For 3) and 4), I haven't figured out a way handling all cases perfectly.
> 
> For 3), I suppose fsck cannot fix write pointer inconsistency without fsync data
> loss, since recovery is judged and done by kernel. The write pointer consistency
> fix after recovery can be done only by kernel.
> 
> It is not a good one but one idea is to confirm fsck users to enforce fsync data
> loss or not. This could be better than nothing.
> 
> For 4), my understanding is that fsync data is not left in the file system. I
> think fsck can check fsync data existence and fix write pointer consistency, as
> my patch series shows.

Yeah.

Let's think about that whether there is a way to cover all cases.

1) For non-opened zones, we need to adjust all such zones' write pointer to
zero. I assume that once write pointer is zero, we still can access valid block
in zone. (recovery may need to revalidate blocks in free segments)

2) For opened zones (cursegs point to)
2.a) .write_pointer == .next_blkaddr, no need to handle
2.b) .write_pointer > .next_blkaddr, that should be the common state in sudden
power-off case. It needs to reset .write_pointer to .next_blkaddr.
2.c) .write_pointer < .next_blkaddr, should be a bug of f2fs, we should have
lost datas in the range of [.write_pointer, .next_blkaddr] at least, if we're
sure about that there is no valid data existed out side of .write_pointer? can we?

3) f2fs_allocate_new_segments() may reset data type cursegs' position, I'd like
to know what's the value of -z option we configured, if we configured as one
zone contains one section, no matter kernel triggers recovery or not (via set
disable_roll_forward option), the write pointer consistency should has been kept
in all cases. Otherwise (one zone contains multiple sections), if kernel doesn't
support .write_pointer recovery, f2fs_allocate_new_segments() can make
.next_blkaddr larger than .write_pointer in the same zone.

Let me know, if I'm missing sth.

Thanks,

> 
>>
>>> blkoff points to the migrated dnode block chain start). After the fsync data fix
>>> by kernel, warm node curseg will not point to the write pointer position.
>>> Anyway, kernel code change will be required to fix the inconsistency after fsync
>>> data fix.
>>>
>>> How about to have fsck leave warm node curseg position untouched if the fsync
>>> data exists? The kernel side change for write pointer inconsistency will be able
>>> to cover this case.
>>
>> If kernel can handle such case, fsck doesn't need to do any thing, IIUC.
> 
> You are right. I mixed cases 1)2) and cases 3)4).
> 
> Thanks again for your comments.
> 
> --
> Best Regards,
> Shin'ichiro Kawasaki.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
