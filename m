Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A458346EA1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Mar 2021 02:23:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lOsFQ-0004ba-13; Wed, 24 Mar 2021 01:23:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lOsFO-0004bT-Ln
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 01:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=keEeRPK/Vuep/4VY0oJCmIK8EKrQvQjhGKXtZ94R9cA=; b=GiK6TEp9fbMIe/KQ+7nKES/y05
 5NmObPNXjoHNLLk91V1v+s3/47v/EBw1h7nDlBiJ1oyGV+On0CoH52yAJHOg497U7p4zJqC7aZ2a/
 bZrpZzw9U7ebkxAzhCqFeqRvfVKGyTwSRDVWv/bpwhRTS4ZjWYCtfmfDN4OeFjePpN7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=keEeRPK/Vuep/4VY0oJCmIK8EKrQvQjhGKXtZ94R9cA=; b=faEMJWVm891WUWZLa9WY2T+umT
 QRgiOP5zwrEUuiGyPtxo5uXe/tEJ5sqrkKaEQnwT8wMq8rxs645GjR7iOJHhtF9i8v4FUDOxAO+Ff
 /fPkK1GCuTwxteJNs8mM+khE+aYaXNtJlZT781WFSYvlV/IsmOIwifckun0F0C60Rn5A=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lOsFI-000454-Ll
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Mar 2021 01:23:46 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F4r646kJxzPlSH;
 Wed, 24 Mar 2021 09:21:00 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 24 Mar
 2021 09:23:29 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20210305095601.96591-1-yuchao0@huawei.com>
 <d9c118eb-45b3-7f35-70bd-cb016957e6e8@kernel.org>
 <YFo0Tz1zl4tw7lUP@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d08a10bb-d6ac-1dde-7e61-836030c96f34@huawei.com>
Date: Wed, 24 Mar 2021 09:23:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YFo0Tz1zl4tw7lUP@google.com>
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
X-Headers-End: 1lOsFI-000454-Ll
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to align to section for
 fallocate() on pinned file
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

On 2021/3/24 2:32, Jaegeuk Kim wrote:
> On 03/23, Chao Yu wrote:
>> On 2021/3/5 17:56, Chao Yu wrote:
>>> Now, fallocate() on a pinned file only allocates blocks which aligns
>>> to segment rather than section, so GC may try to migrate pinned file's
>>> block, and after several times of failure, pinned file's block could
>>> be migrated to other place, however user won't be aware of such
>>> condition, and then old obsolete block address may be readed/written
>>> incorrectly.
>>>
>>> To avoid such condition, let's try to allocate pinned file's blocks
>>> with section alignment.
>>>
>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>
>> Jaegeuk,
>>
>> Could you please check and apply below diff into original patch?
>>
>> ---
>>   fs/f2fs/file.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 236f3f69681a..24fa68fdcaa0 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1648,13 +1648,13 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
>>   		return 0;
>>
>>   	if (f2fs_is_pinned_file(inode)) {
>> -		block_t len = (map.m_len >> sbi->log_blocks_per_seg) <<
>> -					sbi->log_blocks_per_seg;
>> +		block_t sec_blks = BLKS_PER_SEC(sbi);
>> +		block_t len = rounddown(map.m_len, sec_blks);
> 
> len is declared above, so let me rephrase this as well.

Oh, right.

> 
>>
>> -		if (map.m_len % sbi->blocks_per_seg)
>> -			len += sbi->blocks_per_seg;
>> +		if (map.m_len % sec_blks)
>> +			len += sec_blks;
> 
> is this roundup()?

More clean.

> 
> Could you check this?
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=e1175f02291141bbd924fc578299305fcde35855

Looks good to me. :)

Thanks,

> 
>>
>> -		map.m_len = sbi->blocks_per_seg;
>> +		map.m_len = sec_blks;
>>   next_alloc:
>>   		if (has_not_enough_free_secs(sbi, 0,
>>   			GET_SEC_FROM_SEG(sbi, overprovision_segments(sbi)))) {
>> -- 
>> 2.22.1
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
