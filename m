Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 278319A4C7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 03:10:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0y6C-0000ma-4Z; Fri, 23 Aug 2019 01:10:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i0y6A-0000m0-5z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 01:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wxsyQa1HLFypqV5UIppO613ujZQelabsVMNwHmtJdyc=; b=X7iCMDXI5Y06m6RV5ZEVS4UTES
 vW0lUSyTh+RolwzWshr2zdMErelT78X3HZK2q6GBaTz5GCUmOhTCNeq7BpEi3Gu3WHVg55X9aoK7S
 PkhmWM8QmTyOQT0rGhF+0GvV+8x/EHq8TebA6QN21tWpDOn0h5K5ZS2AyaEnsyoK8A5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wxsyQa1HLFypqV5UIppO613ujZQelabsVMNwHmtJdyc=; b=XJHqCcoA8zGqJRP8LbVg9pp4MA
 Uu8g2A8xkxbVBSMVUpKie3ZQm3ucZhum/QRcevsdjlOKTbvOyB+BK3YbotzGzlwom74fr9sR7Ud0S
 CIgJfBhSg9FyMJs9e6B0+P4pWlFIHa8tMoJkmhjqIZtBg/iBUWFBKN68ukkBp+OumM5E=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0y68-00CNvp-1I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 01:10:38 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6A3F7B9633B95D8F850;
 Fri, 23 Aug 2019 09:10:26 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 23 Aug
 2019 09:10:24 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190726074120.3278-1-yuchao0@huawei.com>
 <20190819202007.GA23891@jaegeuk-macbookpro.roam.corp.google.com>
 <99a2713a-50d2-8a77-87d9-661ab7ed3a0c@huawei.com>
 <20190820174121.GB58214@jaegeuk-macbookpro.roam.corp.google.com>
 <20190822174736.GA88722@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4ce7de89-fafb-3796-ae90-8132d2c819cf@huawei.com>
Date: Fri, 23 Aug 2019 09:10:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190822174736.GA88722@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0y68-00CNvp-1I
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allocate memory in batch in
 build_sit_info()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/8/23 1:47, Jaegeuk Kim wrote:
> On 08/20, Jaegeuk Kim wrote:
>> On 08/20, Chao Yu wrote:
>>> On 2019/8/20 4:20, Jaegeuk Kim wrote:
>>>> On 07/26, Chao Yu wrote:
>>>>> build_sit_info() allocate all bitmaps for each segment one by one,
>>>>> it's quite low efficiency, this pach changes to allocate large
>>>>> continuous memory at a time, and divide it and assign for each bitmaps
>>>>> of segment. For large size image, it can expect improving its mount
>>>>> speed.
>>>>
>>>> Hmm, I hit a kernel panic when mounting a partition during fault injection test:
>>>>
>>>> 726 #ifdef CONFIG_F2FS_CHECK_FS
>>>> 727         if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
>>>> 728                         f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
>>>> 729                 f2fs_bug_on(sbi, 1);
>>>> 730 #endif
>>>
>>> We didn't change anything about sit_i->sit_bitmap{_mir,}, it's so wired we panic
>>> here... :(
>>>
>>> I double check the change, but find nothing suspicious, btw, my fault injection
>>> testcase shows normal.
>>>
>>> Jaegeuk, do you have any idea about this issue?
>>
>> I'm bisecting. :P
> 
> It was caused by wrong bitmap size in "f2fs: Fix indefinite loop in f2fs_gc()".
> Fixed by:

Good catch! This alternative one looks good to me.

Thanks,

> ---
>  fs/f2fs/segment.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 9b20ce3b87cc..cc230fc829e1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3950,7 +3950,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	struct sit_info *sit_i;
>  	unsigned int sit_segs, start;
>  	char *src_bitmap, *bitmap;
> -	unsigned int bitmap_size;
> +	unsigned int bitmap_size, main_bitmap_size, sit_bitmap_size;
>  
>  	/* allocate memory for SIT information */
>  	sit_i = f2fs_kzalloc(sbi, sizeof(struct sit_info), GFP_KERNEL);
> @@ -3966,8 +3966,8 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	if (!sit_i->sentries)
>  		return -ENOMEM;
>  
> -	bitmap_size = f2fs_bitmap_size(MAIN_SEGS(sbi));
> -	sit_i->dirty_sentries_bitmap = f2fs_kvzalloc(sbi, bitmap_size,
> +	main_bitmap_size = f2fs_bitmap_size(MAIN_SEGS(sbi));
> +	sit_i->dirty_sentries_bitmap = f2fs_kvzalloc(sbi, main_bitmap_size,
>  								GFP_KERNEL);
>  	if (!sit_i->dirty_sentries_bitmap)
>  		return -ENOMEM;
> @@ -4016,19 +4016,21 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	sit_segs = le32_to_cpu(raw_super->segment_count_sit) >> 1;
>  
>  	/* setup SIT bitmap from ckeckpoint pack */
> -	bitmap_size = __bitmap_size(sbi, SIT_BITMAP);
> +	sit_bitmap_size = __bitmap_size(sbi, SIT_BITMAP);
>  	src_bitmap = __bitmap_ptr(sbi, SIT_BITMAP);
>  
> -	sit_i->sit_bitmap = kmemdup(src_bitmap, bitmap_size, GFP_KERNEL);
> +	sit_i->sit_bitmap = kmemdup(src_bitmap, sit_bitmap_size, GFP_KERNEL);
>  	if (!sit_i->sit_bitmap)
>  		return -ENOMEM;
>  
>  #ifdef CONFIG_F2FS_CHECK_FS
> -	sit_i->sit_bitmap_mir = kmemdup(src_bitmap, bitmap_size, GFP_KERNEL);
> +	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
> +					sit_bitmap_size, GFP_KERNEL);
>  	if (!sit_i->sit_bitmap_mir)
>  		return -ENOMEM;
>  
> -	sit_i->invalid_segmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
> +	sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
> +					main_bitmap_size, GFP_KERNEL);
>  	if (!sit_i->invalid_segmap)
>  		return -ENOMEM;
>  #endif
> @@ -4039,7 +4041,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>  	sit_i->sit_base_addr = le32_to_cpu(raw_super->sit_blkaddr);
>  	sit_i->sit_blocks = sit_segs << sbi->log_blocks_per_seg;
>  	sit_i->written_valid_blocks = 0;
> -	sit_i->bitmap_size = bitmap_size;
> +	sit_i->bitmap_size = sit_bitmap_size;
>  	sit_i->dirty_sentries = 0;
>  	sit_i->sents_per_block = SIT_ENTRY_PER_BLOCK;
>  	sit_i->elapsed_time = le64_to_cpu(sbi->ckpt->elapsed_time);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
