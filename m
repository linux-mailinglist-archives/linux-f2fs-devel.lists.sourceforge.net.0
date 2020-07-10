Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CE021AD70
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:22:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjc7-0002yS-Dw; Fri, 10 Jul 2020 03:22:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jtjc5-0002yK-2l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rjy1z6suA/m3GG5L+DBitAYJ3wD7vzUhyu9VZshqYg4=; b=OVEehtvSL3YVYtMTOVGMVZY3PV
 uCIvLwhVo1+kUzzwd632C0ORxuthiI9dSE1U9Gdq2Ucl6hrS880sXq2PuDLG/VyDI6RZMWEvBMTg5
 v0TTteMXQ1+yLuP7S2CKW879clG6IvHx1I5gJXUTSxgtZQyP5BSYTpkYOJ8dv/AryKjo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rjy1z6suA/m3GG5L+DBitAYJ3wD7vzUhyu9VZshqYg4=; b=cA3umO7ozvLdXa3Z5mSsMJioSw
 pgmKRqNvmVrR6RFNsspepcQzU1W2KVGBQlRpf3wKMnAp8JWrPFpGkN1jsVhqfk4TBpANdLVrYsqgk
 sDsmisNJoJ93SNOhYda5AP8dZYwRMh7ps5+qIfzqpJ82WgJ2mXimlHEeruSixKnC2Byw=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtjc1-001aM6-3w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:22:13 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5FDB4283E771936722A9;
 Fri, 10 Jul 2020 11:22:02 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 10 Jul
 2020 11:21:57 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daeho43@gmail.com>
References: <20200710021505.2405872-1-daeho43@gmail.com>
 <20200710030246.GA545837@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <62c9dd7a-5d18-8bb6-8e43-c055fcff51cc@huawei.com>
Date: Fri, 10 Jul 2020 11:21:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200710030246.GA545837@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtjc1-001aM6-3w
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the way of handling range.len
 in F2FS_IOC_SEC_TRIM_FILE
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/10 11:02, Jaegeuk Kim wrote:
> On 07/10, Daeho Jeong wrote:
>> From: Daeho Jeong <daehojeong@google.com>
>>
>> Changed the way of handling range.len of F2FS_IOC_SEC_TRIM_FILE.
>>  1. Added -1 value support for range.len to signify the end of file.
>>  2. If the end of the range passes over the end of file, it means until
>>     the end of file.
>>  3. ignored the case of that range.len is zero to prevent the function
>>     from making end_addr zero and triggering different behaviour of
>>     the function.
>>
>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>> ---
>>  fs/f2fs/file.c | 16 +++++++---------
>>  1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 368c80f8e2a1..1c4601f99326 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -3813,21 +3813,19 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>>  	file_start_write(filp);
>>  	inode_lock(inode);
>>  
>> -	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
>> +	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
>> +			range.start >= inode->i_size) {
>>  		ret = -EINVAL;
>>  		goto err;
>>  	}
>>  
>> -	if (range.start >= inode->i_size) {
>> -		ret = -EINVAL;
>> +	if (range.len == 0)
>>  		goto err;
>> -	}
>>  
>> -	if (inode->i_size - range.start < range.len) {
>> -		ret = -E2BIG;
>> -		goto err;
>> -	}
>> -	end_addr = range.start + range.len;
>> +	if (range.len == (u64)-1 || inode->i_size - range.start < range.len)
>> +		end_addr = inode->i_size;

We can remove 'range.len == (u64)-1' condition since later condition can cover
this?

> 
> Hmm, what if there are blocks beyond i_size? Do we need to check i_blocks for

The blocks beyond i_size will never be written, there won't be any valid message
there, so we don't need to worry about that.

Thanks,

> ending criteria?
> 
>> +	else
>> +		end_addr = range.start + range.len;
>>  
>>  	to_end = (end_addr == inode->i_size);
>>  	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
>> -- 
>> 2.27.0.383.g050319c2ae-goog
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
