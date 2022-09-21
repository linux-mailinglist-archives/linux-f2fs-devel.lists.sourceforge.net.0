Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A85135C00A6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Sep 2022 17:02:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ob1Eb-0006GJ-VQ;
	Wed, 21 Sep 2022 15:02:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ob1Eb-0006GD-DX
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 15:02:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8GEP0JCCcU9PsV3gGPK/4LKwQRBkkBmsp5QDdxHdunM=; b=GfueT2X+hFuYq8NLSqql11bZqZ
 WcjyYF4HiPvqjiTZ93K2AtDgdh43PAYFJduQVbfD8rLNX/dLrv0TKqP+b8C4AMNwMdh/fo2p0cpAM
 L1drVFrT0pl9Y9UzLYDghsv9mleMJKz3Jk8at7Uj/IdC2rV+bm3vKyxJmAkfvrmHjfFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8GEP0JCCcU9PsV3gGPK/4LKwQRBkkBmsp5QDdxHdunM=; b=bsN0QRBuu16QRbg141AMMW2Q7J
 vl24HCaa2dvn5YfY/UJzQFPTajqdqnJZdOskyXg9kWSZLTqmUABP/oYhK7ryHpiJqfAeWeJIWh0hG
 eTMIXS7vrsFSSDrJpN0pd1HEQOznt34yvxJwJskATJlNJY/5ig8S4JKwjiuzdfwQULsE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ob1EX-00020k-6Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 15:02:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79A27B81C6A;
 Wed, 21 Sep 2022 15:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39063C433D6;
 Wed, 21 Sep 2022 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663772503;
 bh=mXvkdT2JfR0V7W1eGyVpVQcag9AJIo7DJ37S/zrSs54=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bVJ5DGTnzWhDq0kNaiP9nZjx7SeKdMVCXsL6nhDMQ4eCU2c0hSJnY5g0aTS7eEvSD
 9XIfGP66sSa6PhSBWoBAsNZ+Hy9mtDqV7njmJzz6oRlej/oCtvn3F6AQrOGP3tosrD
 M+Mn0Brj4fxRgwBevzbmnLksdP2Mt2SupBY7U83zMfcWO26Ayto9OfyzHtl8ZrmaSp
 sNCfd5Q7MzT0sKIox4aMiQtKgqgbN1oupXYXrohcIlrPAZeQaGDIrWcx2tdMC+aoaN
 bM7w5YJByVerC0DtVvvf50LyE0QPJcXn8BTz2PJZ+I9DFtYKAHFJmmIsKizQOCM5aZ
 kg9NiGsS3Iqog==
Message-ID: <cbdffedf-8d2f-46b1-a73a-a1975d6907b1@kernel.org>
Date: Wed, 21 Sep 2022 23:01:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: zhangqilong <zhangqilong3@huawei.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <4f61c8821ce94c97879f48501090c53f@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <4f61c8821ce94c97879f48501090c53f@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/21 21:57, zhangqilong wrote: >> On 2022/9/21 20:14,
 zhangqilong wrote: >>>> On 2022/9/21 15:57,
 Zhang Qilong wrote: >>>>> No-compressed
 file may suffer read performance issue due to it can't [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ob1EX-00020k-6Z
Subject: Re: [f2fs-dev] Reply: Reply: [PATCH -next 2/4] f2fs: extent cache:
 support extent for no-compressed file
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/9/21 21:57, zhangqilong wrote:
>> On 2022/9/21 20:14, zhangqilong wrote:
>>>> On 2022/9/21 15:57, Zhang Qilong wrote:
>>>>> No-compressed file may suffer read performance issue due to it can't
>>>>> use extent cache or the largest extent in inode can't covered other
>>>>> parts of continuous blocks in readonly format f2fs image.
>>>>>
>>>>> Now it won't build extent cacge tree for no-compressed file in
>>>>> readonly format f2fs image.
>>>>>
>>>>> For readonly format f2fs image, maybe the no-compressed file don't
>>>>> have the largest extent, or it have more than one part which have
>>>>
>>>> Why it can not have largest extent in f2fs_inode?
>>>
>>> The following several situations may occur:
>>> 	1) Wrote w/o the extent when the filesystem is read-write fs.
>>>
>>>       2) Largest extent have been drop after being re-wrote, or it have
>> been split to smaller parts.
>>>
>>>       3) The largest extent only covered one part of continuous blocks,
>> like:
>>>         |------parts 1(continuous blocks)-----|----not
>> continuous---|---------------------parts 2 (continuous blocks)-----------|---------|
>>>         The largest extent is part 2, but other parts (like part1, ) can't be
>> mapped in readonly format f2fs image which should have been mapped.
>>
>> largest extent of non-compressed file should be updated during sload in a
>> ro f2fs image?
> 
> Hi,
> 
> I am sorry, I don't fully understand what you mean. I want to show that the extent of file in readonly
> format f2fs image could not existed or can't covered other parts that contain continuous blocks.

Well, I mean the extent should be updated due to below flow? during
the file was loaded into a formated f2fs image w/ ro feature.

- f2fs_sload
  - build_directory
   - f2fs_build_file

	if (!c.compress.enabled || (c.feature & cpu_to_le32(F2FS_FEATURE_RO)))
		update_largest_extent(sbi, de->ino);

Thanks,

> Whether it exists or not, we will not change or update largest extent during sload in a ro f2fs image.
> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>>
>>> Thanks,
>>>
>>>>
>>>> Thanks,
>>>>
>>>>> internally continuous blocks. So we add extent cache tree for the
>>>>> no-compressed file in readonly format f2fs image.
>>>>>
>>>>> The cache policy is almost same with compressed file. The difference
>>>>> is that, the no-compressed file part will set min-number of
>>>>> continuous blocks F2FS_MIN_EXTENT_LEN in order to reduce cache
>> fragmentation.
>>>>>
>>>>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
>>>>> ---
>>>>>     fs/f2fs/extent_cache.c | 52
>>>> ++++++++++++++++++++++++++++++++++--------
>>>>>     1 file changed, 42 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c index
>>>>> 387d53a61270..7e39381edca0 100644
>>>>> --- a/fs/f2fs/extent_cache.c
>>>>> +++ b/fs/f2fs/extent_cache.c
>>>>> @@ -695,9 +695,12 @@ static void
>>>> f2fs_update_extent_tree_range_compressed(struct inode *inode,
>>>>>     	set_extent_info(&ei, fofs, blkaddr, llen);
>>>>>     	ei.c_len = c_len;
>>>>>
>>>>> -	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
>>>>> +	if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en)) {
>>>>> +		if (!c_len && llen < F2FS_MIN_EXTENT_LEN)
>>>>> +			goto unlock_out;
>>>>>     		__insert_extent_tree(sbi, et, &ei,
>>>>>     				insert_p, insert_parent, leftmost);
>>>>> +	}
>>>>>     unlock_out:
>>>>>     	write_unlock(&et->lock);
>>>>>     }
>>>>> @@ -726,24 +729,53 @@ static unsigned int
>>>> f2fs_cluster_blocks_are_contiguous(struct dnode_of_data *dn)
>>>>>     	return compressed ? i - 1 : i;
>>>>>     }
>>>>>
>>>>> +/*
>>>>> + * check whether normal file blocks are contiguous, and add extent
>>>>> +cache
>>>>> + * entry only if remained blocks are logically and physically
>> contiguous.
>>>>> + */
>>>>> +static unsigned int f2fs_normal_blocks_are_contiguous(struct
>>>>> +dnode_of_data *dn) {
>>>>> +	int i = 0;
>>>>> +	struct inode *inode = dn->inode;
>>>>> +	block_t first_blkaddr = data_blkaddr(inode, dn->node_page,
>>>>> +						dn->ofs_in_node);
>>>>> +	unsigned int max_blocks = ADDRS_PER_PAGE(dn->node_page,
>> inode)
>>>>> +					- dn->ofs_in_node;
>>>>> +
>>>>> +	for (i = 1; i < max_blocks; i++) {
>>>>> +		block_t blkaddr = data_blkaddr(inode, dn->node_page,
>>>>> +				dn->ofs_in_node + i);
>>>>> +
>>>>> +		if (!__is_valid_data_blkaddr(blkaddr) ||
>>>>> +				first_blkaddr + i != blkaddr)
>>>>> +			return i;
>>>>> +	}
>>>>> +
>>>>> +	return i;
>>>>> +}
>>>>> +
>>>>>     void f2fs_readonly_update_extent_cache(struct dnode_of_data
>> *dn,
>>>>>     					pgoff_t index)
>>>>>     {
>>>>> -	unsigned int c_len = f2fs_cluster_blocks_are_contiguous(dn);
>>>>> +	unsigned int c_len = 0;
>>>>> +	unsigned int llen = 0;
>>>>>     	block_t blkaddr;
>>>>>
>>>>> -	if (!c_len)
>>>>> -		return;
>>>>> -
>>>>>     	blkaddr = f2fs_data_blkaddr(dn);
>>>>> -	if (blkaddr == COMPRESS_ADDR)
>>>>> -		blkaddr = data_blkaddr(dn->inode, dn->node_page,
>>>>> +	if (f2fs_compressed_file(dn->inode)) {
>>>>> +		c_len = f2fs_cluster_blocks_are_contiguous(dn);
>>>>> +		if (!c_len)
>>>>> +			return;
>>>>> +		llen = F2FS_I(dn->inode)->i_cluster_size;
>>>>> +		if (blkaddr == COMPRESS_ADDR)
>>>>> +			blkaddr = data_blkaddr(dn->inode, dn->node_page,
>>>>>     					dn->ofs_in_node + 1);
>>>>> +	} else {
>>>>> +		llen = f2fs_normal_blocks_are_contiguous(dn);
>>>>> +	}
>>>>>
>>>>>     	f2fs_update_extent_tree_range_compressed(dn->inode,
>>>>> -				index, blkaddr,
>>>>> -				F2FS_I(dn->inode)->i_cluster_size,
>>>>> -				c_len);
>>>>> +				index, blkaddr, llen, c_len);
>>>>>     }
>>>>>     #endif
>>>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
