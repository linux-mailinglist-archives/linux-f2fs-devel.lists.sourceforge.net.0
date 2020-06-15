Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 890411F9004
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 09:35:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkjen-0002fL-DW; Mon, 15 Jun 2020 07:35:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fangwei1@huawei.com>) id 1jkjec-0002eF-Of
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 07:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uTYNOCzIz7+IMOu4lJWTRwcprnRja291cK7Ex/aYxfU=; b=mAKdDSQXWz5JXwkqDqi3m3mv8d
 QgTCqwlFDqXtIUGzIrqsNinMzxGRj40pU+fLjkhdTTiqMhF2w3z6W19GZgPCwMSrc5S/oMJZ6u9RW
 av99+0fmx32vHjU4COZfVdNppZCA6VGHdvgNTNtxcPI/zaC7kLF0hGjLmVqVsJKJUDns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uTYNOCzIz7+IMOu4lJWTRwcprnRja291cK7Ex/aYxfU=; b=Fex1oyAeD/96zFMrhKAQBdWBdd
 iSEo8LdxhjONfty2HQu5Y4vkjNTp6CK7VKuCQhHkH0GlqX8H0m3yFl0nZXVKEH50J3iOxZZftuYjH
 fOLSIpe2DZu4EcTyE7zyWtd3rzPuPeWeKJGjuv0kD2BmTOoMIE0W6ic9wFUf4632CgDM=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jkjeW-003ETl-0q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 07:35:34 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id EEE94F25481E4753DC74
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2020 15:34:26 +0800 (CST)
Received: from [127.0.0.1] (10.166.212.179) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0;
 Mon, 15 Jun 2020 15:34:17 +0800
To: Chao Yu <yuchao0@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200613042526.30382-1-fangwei1@huawei.com>
 <4811f8f8-ea91-6cea-7bd6-a43c4a0cd6d4@huawei.com>
From: Wei Fang <fangwei1@huawei.com>
Message-ID: <75c3d4ab-5506-4a80-740e-e0a7c9ad12cc@huawei.com>
Date: Mon, 15 Jun 2020 15:34:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <4811f8f8-ea91-6cea-7bd6-a43c4a0cd6d4@huawei.com>
X-Originating-IP: [10.166.212.179]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkjeW-003ETl-0q
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove useless truncate in
 f2fs_collapse_range()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2020/6/15 9:42, Chao Yu wrote:
> Hi Wei Fang,
>
> On 2020/6/13 12:25, Wei Fang wrote:
>> Since offset < new_size, no need to do truncate_pagecache() again
>> with new_size.
>>
>> Signed-off-by: Wei Fang <fangwei1@huawei.com>
>> ---
>>  fs/f2fs/file.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 3268f8dd59bb..43544817238b 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1368,13 +1368,12 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
>>  		return ret;
>>  
>>  	/* write out all moved pages, if possible */
>> -	down_write(&F2FS_I(inode)->i_mmap_sem);
>>  	filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
>> +
>> +	down_write(&F2FS_I(inode)->i_mmap_sem);
> I guess this patch mainly avoids useless page cache truncation, could we get rid of
> lock coverage update here? or we can do it in separated patch if necessary.
OK, I'll remove the lock coverage change in this patch.

Thanks,
Wei

> Thanks,
>
>>  	truncate_pagecache(inode, offset);
>>  
>>  	new_size = i_size_read(inode) - len;
>> -	truncate_pagecache(inode, new_size);
>> -
>>  	ret = f2fs_truncate_blocks(inode, new_size, true);
>>  	up_write(&F2FS_I(inode)->i_mmap_sem);
>>  	if (!ret)
>>
> .
>




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
