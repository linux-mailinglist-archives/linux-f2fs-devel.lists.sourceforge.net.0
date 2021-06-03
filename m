Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD7539A518
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jun 2021 17:55:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lopgn-0001qK-Km; Thu, 03 Jun 2021 15:55:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lopgm-0001qC-44
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 15:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Ykh0VDUgpm6tGzESYtotgxHPFruMURQBvNtRajNABg=; b=JRBNf1qbeCDSVs38uLXIKG5ztp
 EoI7XimjMug5Orrlf7fnrM94Pau0C3COHhvh0v82qMVLhPF2UuqlxLQxWQuPeihKxZY9JE13LArSu
 IQlJAf5BJRqUvjQbuPB/UQlGFFYcDa0giYuqvLPKIBP1Wm2r89lh8GMzOLby+GCr/FjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9Ykh0VDUgpm6tGzESYtotgxHPFruMURQBvNtRajNABg=; b=UUgMUR29IDt6slTyjRIQHy/dMF
 z2axuUhcdXW2xlULdAexEbjtZYxPKaEdLeZ8A86N64Zgx4XoMegZPr343isw7xFHOm+TaFyXOyHeT
 fNbxXk/151kO9Iu+s8tsmQDBGFVdykFmwfFM9F6McUZg4I5/KlzKtTk8hd/WqZ+k2aP8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lopgg-0006ek-O9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Jun 2021 15:55:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5893C613DA;
 Thu,  3 Jun 2021 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622735710;
 bh=TId5wYGrUkaaw8Pm5vS104rvnq3wPFmOh7TAFuCAr/I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lVWqWCZ0LV40VYBbWqng7qvpQHKDvnU9y0XwVe4xOBLTz4m5ZWBBcVdlJcxYcrPGI
 ohw5rIwOstg5t8wamtk0xQqMLpLX1mp/ZyIL1NLmpA9szdBdu9GchC7zFJ53QG7gnD
 83YolVMNhBU6/YeyN8gYT1+P1gC0Ox4altzvUW1QuDN3wo4AWNVCXnTqIFDA8hRKwd
 2ntsl3zzkeVBNscOB4+AbzY9fWzLNX15p2wuaqmsRQBfDilBqKusIA72Oo5TCwfEt/
 ZvE1pQ5A0KNs0NJfBKPH93X65EiC9HwxFEGbQezXxrZBkr+i0VxddNospPz1d/3AVi
 bstUf0fIJ8tIA==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <YKz0VJSYYBEnF75V@google.com> <YKz1gGctmOJ+LjOn@google.com>
 <2c4db877-b5e6-1139-98b5-be2d9e7872be@kernel.org>
 <YK0DVi4aTNdXDN3L@google.com>
 <dda2400f-4a06-0ef6-b4f5-8aafe86bd81d@huawei.com>
 <YK5Mewfb3gMg1yGM@google.com>
 <5140516c-e4c6-fd6a-69b2-7566c903cb53@kernel.org>
 <YLZc0y0S3sGkU6f4@google.com> <YLZt+rFClf7xEzOa@google.com>
 <09fa74d3-a9df-028f-3ebc-2b845e5cd609@kernel.org>
 <YLek7U+BaFvHhz58@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <eb52cab7-d9b3-c84b-1c7b-8fee463b06c5@kernel.org>
Date: Thu, 3 Jun 2021 23:55:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLek7U+BaFvHhz58@google.com>
Content-Language: en-US
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lopgg-0006ek-O9
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: compress: add compress_inode to
 cache compressed blocks
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

On 2021/6/2 23:34, Jaegeuk Kim wrote:
> On 06/02, Chao Yu wrote:
>> On 2021/6/2 1:27, Jaegeuk Kim wrote:
>>> On 06/01, Jaegeuk Kim wrote:
>>>> On 05/26, Chao Yu wrote:
>>>>> On 2021/5/26 21:26, Jaegeuk Kim wrote:
>>>>>> On 05/26, Chao Yu wrote:
>>>>>>> On 2021/5/25 22:01, Jaegeuk Kim wrote:
>>>>>>>> On 05/25, Chao Yu wrote:
>>>>>>>>> On 2021/5/25 21:02, Jaegeuk Kim wrote:
>>>>>>>>>> On 05/25, Jaegeuk Kim wrote:
>>>>>>>>>>> On 05/25, Chao Yu wrote:
>>>>>>>>>>>> Also, and queue this?
>>>>>>>>>>>
>>>>>>>>>>> Easy to get this?
>>>>>>>>>>
>>>>>>>>>> need GFP_NOFS?
>>>>>>>>>
>>>>>>>>> Not sure, I use __GFP_IO intentionally here to avoid __GFP_RECLAIM from
>>>>>>>>> GFP_NOFS, because in low memory case, I don't want to instead page cache
>>>>>>>>> of normal file with page cache of sbi->compress_inode.
>>>>>>>>>
>>>>>>>>> What is memory size in your vm?
>>>>>>>>
>>>>>>>> 4GB. If I set GFP_NOFS, I don't see the error anymore, at least.
>>>>>>>
>>>>>>> I applied below patch and don't see the warning message anymore.
>>>>>>>
>>>>>>> ---
>>>>>>>     fs/f2fs/compress.c | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>>>>>> index 701dd0f6f4ec..ed5b7fabc604 100644
>>>>>>> --- a/fs/f2fs/compress.c
>>>>>>> +++ b/fs/f2fs/compress.c
>>>>>>> @@ -1703,7 +1703,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>>>>>>>     	avail_ram = si.totalram - si.totalhigh;
>>>>>>>
>>>>>>>     	/* free memory is lower than watermark, deny caching compress page */
>>>>>>> -	if (free_ram <= sbi->compress_watermark / 100 * avail_ram)
>>>>>
>>>>> This is buggy, because sbi->compress_watermark equals to 20, so that
>>>>> sbi->compress_watermark / 100 * avail_ram always be zero...
>>>>>
>>>>> After this change, if free ram is lower, we may just skip caching
>>>>> compressed blocks here.
>>>>
>>>> Can we move this in f2fs_available_free_memory()?
>>
>> More clean.
>>
>> One comment below:
>>
>>>
>>> Testing this.
>>>
>>> ---
>>>    fs/f2fs/compress.c | 14 +-------------
>>>    fs/f2fs/node.c     | 11 ++++++++++-
>>>    fs/f2fs/node.h     |  1 +
>>>    3 files changed, 12 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>> index 9fd62a0a646b..455561826c7d 100644
>>> --- a/fs/f2fs/compress.c
>>> +++ b/fs/f2fs/compress.c
>>> @@ -1688,8 +1688,6 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>>>    {
>>>    	struct page *cpage;
>>>    	int ret;
>>> -	struct sysinfo si;
>>> -	unsigned long free_ram, avail_ram;
>>>    	if (!test_opt(sbi, COMPRESS_CACHE))
>>>    		return;
>>> @@ -1697,17 +1695,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>>>    	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
>>>    		return;
>>> -	si_meminfo(&si);
>>> -	free_ram = si.freeram;
>>> -	avail_ram = si.totalram - si.totalhigh;
>>> -
>>> -	/* free memory is lower than watermark, deny caching compress page */
>>> -	if (free_ram <= sbi->compress_watermark / 100 * avail_ram)
>>> -		return;
>>> -
>>> -	/* cached page count exceed threshold, deny caching compress page */
>>> -	if (COMPRESS_MAPPING(sbi)->nrpages >=
>>
>> Need to cover COMPRESS_MAPPING() with CONFIG_F2FS_FS_COMPRESSION.
> 
> Added like this.
> 
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -99,6 +99,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>                                  sizeof(struct discard_cmd)) >> PAGE_SHIFT;
>                  res = mem_size < (avail_ram * nm_i->ram_thresh / 100);
>          } else if (type == COMPRESS_PAGE) {
> +#ifdef CONFIG_F2FS_FS_COMPRESSION

How about adding free_ram definition and assigment here?

unsigned long free_ram = val.freeram;

Thanks,

>                  /*
>                   * free memory is lower than watermark or cached page count
>                   * exceed threshold, deny caching compress page.
> @@ -106,6 +107,9 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>                  res = (free_ram > avail_ram * sbi->compress_watermark / 100) &&
>                          (COMPRESS_MAPPING(sbi)->nrpages <
>                           free_ram * sbi->compress_percent / 100);
> +#else
> +               res = false;
> +#endif
>          } else {
>                  if (!sbi->sb->s_bdi->wb.dirty_exceeded)
>                          return true;
> 
>>
>> Thanks,
>>
>>> -			free_ram / 100 * sbi->compress_percent)
>>> +	if (!f2fs_available_free_memory(sbi, COMPRESS_PAGE))
>>>    		return;
>>>    	cpage = find_get_page(COMPRESS_MAPPING(sbi), blkaddr);
>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>> index 3a8f7afa5059..67093416ce9c 100644
>>> --- a/fs/f2fs/node.c
>>> +++ b/fs/f2fs/node.c
>>> @@ -45,7 +45,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>>>    	struct f2fs_nm_info *nm_i = NM_I(sbi);
>>>    	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
>>>    	struct sysinfo val;
>>> -	unsigned long avail_ram;
>>> +	unsigned long avail_ram, free_ram;
>>>    	unsigned long mem_size = 0;
>>>    	bool res = false;
>>> @@ -56,6 +56,7 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>>>    	/* only uses low memory */
>>>    	avail_ram = val.totalram - val.totalhigh;
>>> +	free_ram = val.freeram;
>>>    	/*
>>>    	 * give 25%, 25%, 50%, 50%, 50% memory for each components respectively
>>> @@ -97,6 +98,14 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
>>>    		mem_size = (atomic_read(&dcc->discard_cmd_cnt) *
>>>    				sizeof(struct discard_cmd)) >> PAGE_SHIFT;
>>>    		res = mem_size < (avail_ram * nm_i->ram_thresh / 100);
>>> +	} else if (type == COMPRESS_PAGE) {
>>> +		/*
>>> +		 * free memory is lower than watermark or cached page count
>>> +		 * exceed threshold, deny caching compress page.
>>> +		 */
>>> +		res = (free_ram > avail_ram * sbi->compress_watermark / 100) &&
>>> +			(COMPRESS_MAPPING(sbi)->nrpages <
>>> +			 free_ram * sbi->compress_percent / 100);
>>>    	} else {
>>>    		if (!sbi->sb->s_bdi->wb.dirty_exceeded)
>>>    			return true;
>>> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
>>> index d85e8659cfda..84d45385d1f2 100644
>>> --- a/fs/f2fs/node.h
>>> +++ b/fs/f2fs/node.h
>>> @@ -148,6 +148,7 @@ enum mem_type {
>>>    	EXTENT_CACHE,	/* indicates extent cache */
>>>    	INMEM_PAGES,	/* indicates inmemory pages */
>>>    	DISCARD_CACHE,	/* indicates memory of cached discard cmds */
>>> +	COMPRESS_PAGE,	/* indicates memory of cached compressed pages */
>>>    	BASE_CHECK,	/* check kernel status */
>>>    };
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
