Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE97363EEE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2019 03:25:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hl1Mj-0003Ln-6O; Wed, 10 Jul 2019 01:25:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hl1Mi-0003Lc-3E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 01:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cu9Ev7USkO+Ferj7wq9cXxOfsXPdqxH7nA9dSx/5Zw8=; b=DxDu+RQVuduIfA+x1voaBl8GFU
 GpscxLyyUImT0d8Ue244iSmNy66jBPMF9azsIxFdRjiizk8Hvzq7HYCBV3p6xLec2swb4zvN5TwzG
 jK4W302QDabkQ4xQF6a652SUjnCtfpL2P4JzAZnU3IOmMp9sUzZ1ejjM1JxsVCvmwQoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cu9Ev7USkO+Ferj7wq9cXxOfsXPdqxH7nA9dSx/5Zw8=; b=ixfdhUVM1TGLZxBdr1c50/2lWA
 wpTVdnXWTPBtvPF/r/x8dEK6Od2q2Aniku/HsdzQgVRjrkLe4xhBMmvKioieF8tjUVNf0wurFpd6Z
 I1l3rzulhaLgmtDaF+82YsmwFBjHOki4Z87BwhT+e7rQ77P7aLptN0anLMkgIfXP1WA8=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hl1Md-00EMdz-S7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jul 2019 01:25:48 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D74B0BD00961EB2F6ECA;
 Wed, 10 Jul 2019 09:25:35 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 10 Jul
 2019 09:25:26 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20190704081730.46414-1-yuchao0@huawei.com>
 <20190708234633.GB21769@jaegeuk-macbookpro.roam.corp.google.com>
 <86fb078c-0f9e-8d08-7e3b-29a2b6c8b107@kernel.org>
 <20190709172347.GA53646@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <6a110d61-3dac-2142-d4e5-cda928aa4938@huawei.com>
Date: Wed, 10 Jul 2019 09:25:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190709172347.GA53646@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hl1Md-00EMdz-S7
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate memory in batch in
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

On 2019/7/10 1:23, Jaegeuk Kim wrote:
> On 07/09, Chao Yu wrote:
>> On 2019-7-9 7:46, Jaegeuk Kim wrote:
>>> On 07/04, Chao Yu wrote:
>>>> build_sit_info() allocate all bitmaps for each segment one by one,
>>>> it's quite low efficiency, this pach changes to allocate large
>>>> continuous memory at a time, and divide it and assign for each bitmaps
>>>
>>> It may give more failure rate?
>>
>> For android, I think there should be no problem, since while startup, memory
>> should be sufficient for f2fs mount.
>> For server or desktop, if there is any failure on memory allocation,
>> f2fs_kzalloc will fallback to vmalloc, so that would not be worse than before,
>> right?
>>
>> Or if you worry about this really, could we add a fast path:
> 
> How much time can we really get with this big alloc?

Total build_sit_info()'s elapsed time reduces from 20ms to 10ms on 128gb device.

Thanks,

> 
>>
>> build_sit_info()
>>  - try allocate sit_i->bitmap
>>   - success: divide memory
>>  - fail: fallback to old method
>>
>> Thanks,
>>
>>>
>>>> of segment. For large size image, it can expect improving its mount
>>>> speed.
>>>>
>>>> Signed-off-by: Chen Gong <gongchen4@huawei.com>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>  fs/f2fs/segment.c | 51 +++++++++++++++++++++--------------------------
>>>>  fs/f2fs/segment.h |  1 +
>>>>  2 files changed, 24 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index 402fbbbb2d7c..73c803af1f31 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -3929,7 +3929,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>>>>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
>>>>  	struct sit_info *sit_i;
>>>>  	unsigned int sit_segs, start;
>>>> -	char *src_bitmap;
>>>> +	char *src_bitmap, *bitmap;
>>>>  	unsigned int bitmap_size;
>>>>  
>>>>  	/* allocate memory for SIT information */
>>>> @@ -3950,27 +3950,31 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>>>>  	if (!sit_i->dirty_sentries_bitmap)
>>>>  		return -ENOMEM;
>>>>  
>>>> +#ifdef CONFIG_F2FS_CHECK_FS
>>>> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 4;
>>>> +#else
>>>> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 3;
>>>> +#endif
>>>> +	sit_i->bitmap = f2fs_kzalloc(sbi, bitmap_size, GFP_KERNEL);
>>>> +	if (!sit_i->bitmap)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	bitmap = sit_i->bitmap;
>>>> +
>>>>  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
>>>> -		sit_i->sentries[start].cur_valid_map
>>>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>>>> -		sit_i->sentries[start].ckpt_valid_map
>>>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>>>> -		if (!sit_i->sentries[start].cur_valid_map ||
>>>> -				!sit_i->sentries[start].ckpt_valid_map)
>>>> -			return -ENOMEM;
>>>> +		sit_i->sentries[start].cur_valid_map = bitmap;
>>>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>>>> +
>>>> +		sit_i->sentries[start].ckpt_valid_map = bitmap;
>>>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>>>>  
>>>>  #ifdef CONFIG_F2FS_CHECK_FS
>>>> -		sit_i->sentries[start].cur_valid_map_mir
>>>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>>>> -		if (!sit_i->sentries[start].cur_valid_map_mir)
>>>> -			return -ENOMEM;
>>>> +		sit_i->sentries[start].cur_valid_map_mir = bitmap;
>>>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>>>>  #endif
>>>>  
>>>> -		sit_i->sentries[start].discard_map
>>>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
>>>> -							GFP_KERNEL);
>>>> -		if (!sit_i->sentries[start].discard_map)
>>>> -			return -ENOMEM;
>>>> +		sit_i->sentries[start].discard_map = bitmap;
>>>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>>>>  	}
>>>>  
>>>>  	sit_i->tmp_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>>>> @@ -4440,21 +4444,12 @@ static void destroy_free_segmap(struct f2fs_sb_info *sbi)
>>>>  static void destroy_sit_info(struct f2fs_sb_info *sbi)
>>>>  {
>>>>  	struct sit_info *sit_i = SIT_I(sbi);
>>>> -	unsigned int start;
>>>>  
>>>>  	if (!sit_i)
>>>>  		return;
>>>>  
>>>> -	if (sit_i->sentries) {
>>>> -		for (start = 0; start < MAIN_SEGS(sbi); start++) {
>>>> -			kvfree(sit_i->sentries[start].cur_valid_map);
>>>> -#ifdef CONFIG_F2FS_CHECK_FS
>>>> -			kvfree(sit_i->sentries[start].cur_valid_map_mir);
>>>> -#endif
>>>> -			kvfree(sit_i->sentries[start].ckpt_valid_map);
>>>> -			kvfree(sit_i->sentries[start].discard_map);
>>>> -		}
>>>> -	}
>>>> +	if (sit_i->sentries)
>>>> +		kvfree(sit_i->bitmap);
>>>>  	kvfree(sit_i->tmp_map);
>>>>  
>>>>  	kvfree(sit_i->sentries);
>>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>>>> index 2fd53462fa27..4d171b489130 100644
>>>> --- a/fs/f2fs/segment.h
>>>> +++ b/fs/f2fs/segment.h
>>>> @@ -226,6 +226,7 @@ struct sit_info {
>>>>  	block_t sit_base_addr;		/* start block address of SIT area */
>>>>  	block_t sit_blocks;		/* # of blocks used by SIT area */
>>>>  	block_t written_valid_blocks;	/* # of valid blocks in main area */
>>>> +	char *bitmap;			/* all bitmaps pointer */
>>>>  	char *sit_bitmap;		/* SIT bitmap pointer */
>>>>  #ifdef CONFIG_F2FS_CHECK_FS
>>>>  	char *sit_bitmap_mir;		/* SIT bitmap mirror */
>>>> -- 
>>>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
