Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F209121F1DE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Jul 2020 14:49:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvKN3-0008Ni-Hw; Tue, 14 Jul 2020 12:49:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jvKN1-0008I9-4o
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 12:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2zIfUcj9fz85h6yvWkycPud2ao6ImmQdV5ODS2b6af8=; b=K1WvCQ45qBakgJMrS9ZWd4OSwO
 MKAgzyj0ib89fbJpRi85FM26rnHUbmkZU74kJTH0CZOGXNF2bbyHZ+kb0n0J7pBcaXIa9aGCu5Txe
 K5JvYAFlaaPxUSUpFrbGytzNJ640IEHIx+1sEFAfJbQCPbSedXO4ZSUH7s/VEcRs+MDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zIfUcj9fz85h6yvWkycPud2ao6ImmQdV5ODS2b6af8=; b=j10VUAzDRLxdIKYMLeKIpblAso
 6TEhzTTkDZl0tUTeJ4tOR+c19PZqd7L7Vlem0pAy9tcWi6g/SrhR2G/57JDkAQFZ3+E5eIslVE8nG
 8bBaCIp8OSg9MrX7EQyuWjkTL26aQFtrd/Auf1W/+YR8jlR3mg9v7ovj0tuuqVzOJ/hI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvKAx-002pwG-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 12:36:52 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E489B6DA7482A55E837A;
 Tue, 14 Jul 2020 20:36:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 14 Jul
 2020 20:36:32 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daeho43@gmail.com>
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
Date: Tue, 14 Jul 2020 20:36:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200713181152.GC2910046@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvKAx-002pwG-NJ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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

On 2020/7/14 2:11, Jaegeuk Kim wrote:
> Hi Daeho,
> 
> Please take a look at this.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=35245180459aebf6d70fde88a538f0400a794aa6

I'm curious about what will happen if we call
sec_trim_file(F2FS_TRIM_FILE_ZEROOUT) on an encrypted file, will
it use zero bits covering encrypted data on disk?

Thanks,

> 
> Thanks,
> 
> On 07/13, Daeho Jeong wrote:
>> From: Daeho Jeong <daehojeong@google.com>
>>
>> Changed the way of handling range.len of F2FS_IOC_SEC_TRIM_FILE.
>>  1. Added -1 value support for range.len to secure trim the whole blocks
>>     starting from range.start regardless of i_size.
>>  2. If the end of the range passes over the end of file, it means until
>>     the end of file (i_size).
>>  3. ignored the case of that range.len is zero to prevent the function
>>     from making end_addr zero and triggering different behaviour of
>>     the function.
>>
>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>> ---
>> Changes in v2:
>>  - Changed -1 range.len option to mean the whole blocks starting from
>>    range.start regardless of i_size
>> ---
>>  fs/f2fs/file.c | 23 ++++++++++++-----------
>>  1 file changed, 12 insertions(+), 11 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 368c80f8e2a1..2485841e3b2d 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -3792,7 +3792,7 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>>  	pgoff_t index, pg_end;
>>  	block_t prev_block = 0, len = 0;
>>  	loff_t end_addr;
>> -	bool to_end;
>> +	bool to_end = false;
>>  	int ret = 0;
>>  
>>  	if (!(filp->f_mode & FMODE_WRITE))
>> @@ -3813,23 +3813,23 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
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
>> +	if (inode->i_size - range.start > range.len) {
>> +		end_addr = range.start + range.len;
>> +	} else {
>> +		end_addr = range.len == (u64)-1 ?
>> +			sbi->sb->s_maxbytes : inode->i_size;
>> +		to_end = true;
>>  	}
>> -	end_addr = range.start + range.len;
>>  
>> -	to_end = (end_addr == inode->i_size);
>>  	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
>>  			(!to_end && !IS_ALIGNED(end_addr, F2FS_BLKSIZE))) {
>>  		ret = -EINVAL;
>> @@ -3846,7 +3846,8 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
>>  	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>  	down_write(&F2FS_I(inode)->i_mmap_sem);
>>  
>> -	ret = filemap_write_and_wait_range(mapping, range.start, end_addr - 1);
>> +	ret = filemap_write_and_wait_range(mapping, range.start,
>> +			to_end ? LLONG_MAX : end_addr - 1);
>>  	if (ret)
>>  		goto out;
>>  
>> -- 
>> 2.27.0.383.g050319c2ae-goog
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
