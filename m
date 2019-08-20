Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122F95AB5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 11:12:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i00Bz-00030Y-21; Tue, 20 Aug 2019 09:12:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i00Bx-00030H-SB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 09:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yr4DWOS0wZ9pQnLznA6p79dP+OgDCCcVoOSKs0QoAnE=; b=Xp5B7UGtOEpVV0HW6Wy/PnZDYz
 2o7qHlxQUHNEIDJe8x7VTUiACek2MJj2d7bf7Zcx+spw8P6mNmjXT/vfYoEOetlylRmchtTK0yvJd
 EnLHy3Y77HaPkndJmr4HHxZXGA0aOuZFHPF0VG7axPprGo4Tr8slZUvA0axS9sAdqeMk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yr4DWOS0wZ9pQnLznA6p79dP+OgDCCcVoOSKs0QoAnE=; b=l7WMYEfwkWeF5uTKqxNdjqh3Kd
 B8R8pyvL3FWbhl543LFuKh6Lc7QjtHHaKj7zuWu9786awojrqpo6Ap9MU+0METRn/x5lBv8AVMuMC
 uxw+KW5vgWUhpscWDglRtdA0kvEOzzjvRsZFWQL9SeagUkTL0/e8zoOJC5QK5VkqUUvc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i00Bu-009h5l-5R
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 09:12:37 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D3DE6B93F5B37132134D;
 Tue, 20 Aug 2019 17:12:25 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 20 Aug
 2019 17:12:17 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190726074120.3278-1-yuchao0@huawei.com>
 <20190819202007.GA23891@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <99a2713a-50d2-8a77-87d9-661ab7ed3a0c@huawei.com>
Date: Tue, 20 Aug 2019 17:12:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190819202007.GA23891@jaegeuk-macbookpro.roam.corp.google.com>
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
X-Headers-End: 1i00Bu-009h5l-5R
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

On 2019/8/20 4:20, Jaegeuk Kim wrote:
> On 07/26, Chao Yu wrote:
>> build_sit_info() allocate all bitmaps for each segment one by one,
>> it's quite low efficiency, this pach changes to allocate large
>> continuous memory at a time, and divide it and assign for each bitmaps
>> of segment. For large size image, it can expect improving its mount
>> speed.
> 
> Hmm, I hit a kernel panic when mounting a partition during fault injection test:
> 
> 726 #ifdef CONFIG_F2FS_CHECK_FS
> 727         if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
> 728                         f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
> 729                 f2fs_bug_on(sbi, 1);
> 730 #endif

We didn't change anything about sit_i->sit_bitmap{_mir,}, it's so wired we panic
here... :(

I double check the change, but find nothing suspicious, btw, my fault injection
testcase shows normal.

Jaegeuk, do you have any idea about this issue?

Thanks,

> 
> For your information, I'm testing without this patch.
> 
> Thanks,
> 
>>
>> Signed-off-by: Chen Gong <gongchen4@huawei.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v2:
>> - fix warning triggered in kmalloc() if requested memory size exceeds 4MB.
>>  fs/f2fs/segment.c | 51 +++++++++++++++++++++--------------------------
>>  fs/f2fs/segment.h |  1 +
>>  2 files changed, 24 insertions(+), 28 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index a661ac32e829..d720eacd9c57 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -3941,7 +3941,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
>>  	struct sit_info *sit_i;
>>  	unsigned int sit_segs, start;
>> -	char *src_bitmap;
>> +	char *src_bitmap, *bitmap;
>>  	unsigned int bitmap_size;
>>  
>>  	/* allocate memory for SIT information */
>> @@ -3964,27 +3964,31 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
>>  	if (!sit_i->dirty_sentries_bitmap)
>>  		return -ENOMEM;
>>  
>> +#ifdef CONFIG_F2FS_CHECK_FS
>> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 4;
>> +#else
>> +	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 3;
>> +#endif
>> +	sit_i->bitmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
>> +	if (!sit_i->bitmap)
>> +		return -ENOMEM;
>> +
>> +	bitmap = sit_i->bitmap;
>> +
>>  	for (start = 0; start < MAIN_SEGS(sbi); start++) {
>> -		sit_i->sentries[start].cur_valid_map
>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>> -		sit_i->sentries[start].ckpt_valid_map
>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>> -		if (!sit_i->sentries[start].cur_valid_map ||
>> -				!sit_i->sentries[start].ckpt_valid_map)
>> -			return -ENOMEM;
>> +		sit_i->sentries[start].cur_valid_map = bitmap;
>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>> +
>> +		sit_i->sentries[start].ckpt_valid_map = bitmap;
>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>>  
>>  #ifdef CONFIG_F2FS_CHECK_FS
>> -		sit_i->sentries[start].cur_valid_map_mir
>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>> -		if (!sit_i->sentries[start].cur_valid_map_mir)
>> -			return -ENOMEM;
>> +		sit_i->sentries[start].cur_valid_map_mir = bitmap;
>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>>  #endif
>>  
>> -		sit_i->sentries[start].discard_map
>> -			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
>> -							GFP_KERNEL);
>> -		if (!sit_i->sentries[start].discard_map)
>> -			return -ENOMEM;
>> +		sit_i->sentries[start].discard_map = bitmap;
>> +		bitmap += SIT_VBLOCK_MAP_SIZE;
>>  	}
>>  
>>  	sit_i->tmp_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
>> @@ -4492,21 +4496,12 @@ static void destroy_free_segmap(struct f2fs_sb_info *sbi)
>>  static void destroy_sit_info(struct f2fs_sb_info *sbi)
>>  {
>>  	struct sit_info *sit_i = SIT_I(sbi);
>> -	unsigned int start;
>>  
>>  	if (!sit_i)
>>  		return;
>>  
>> -	if (sit_i->sentries) {
>> -		for (start = 0; start < MAIN_SEGS(sbi); start++) {
>> -			kvfree(sit_i->sentries[start].cur_valid_map);
>> -#ifdef CONFIG_F2FS_CHECK_FS
>> -			kvfree(sit_i->sentries[start].cur_valid_map_mir);
>> -#endif
>> -			kvfree(sit_i->sentries[start].ckpt_valid_map);
>> -			kvfree(sit_i->sentries[start].discard_map);
>> -		}
>> -	}
>> +	if (sit_i->sentries)
>> +		kvfree(sit_i->bitmap);
>>  	kvfree(sit_i->tmp_map);
>>  
>>  	kvfree(sit_i->sentries);
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index b74602813a05..ec4d568fd58c 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -226,6 +226,7 @@ struct sit_info {
>>  	block_t sit_base_addr;		/* start block address of SIT area */
>>  	block_t sit_blocks;		/* # of blocks used by SIT area */
>>  	block_t written_valid_blocks;	/* # of valid blocks in main area */
>> +	char *bitmap;			/* all bitmaps pointer */
>>  	char *sit_bitmap;		/* SIT bitmap pointer */
>>  #ifdef CONFIG_F2FS_CHECK_FS
>>  	char *sit_bitmap_mir;		/* SIT bitmap mirror */
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
