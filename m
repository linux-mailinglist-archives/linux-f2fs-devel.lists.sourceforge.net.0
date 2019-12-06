Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAA1114BAA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Dec 2019 05:32:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1id5Hw-0006nD-Td; Fri, 06 Dec 2019 04:32:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1id5Hu-0006n1-Jo
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Dec 2019 04:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bU1QMwTZg/xe8tNuljQONTxx1OviPd0HKgXxq7u1qAA=; b=IB5q9vTJ6GHnsQVsigqJlrf7Cq
 5aJTvkKfggj0tGjbyrQH7PUOQYB0pyH1gzzXOGyPayEbsy6AS7NpYdue8s4BHdUGFthXudjb9vI65
 vWqt7r09q4TLG3U2NreFRoOQjpSnHJGEmhZ9vnfvSHcAzH/cGPp7DjYBJpfEA+pwS6a0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bU1QMwTZg/xe8tNuljQONTxx1OviPd0HKgXxq7u1qAA=; b=YF0bjhNoRptLuOmePBBP0x8kyP
 LWjjKZRXtIDFhTur5FWpb0trfb2qrsONp+5agMXhwvqxUcyGieuVNtkxglOtmHwG3vJtc9LbtqEZ2
 n+WYjeS81OO9Dzm+9xS3usD7ZEplqGa7hYAtarxlzxJ+LLAK5hKeApawtbVof/H1KjYA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1id5Hs-00BVHT-KG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Dec 2019 04:32:18 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id F0B0344229A131A50F8E;
 Fri,  6 Dec 2019 12:32:08 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 6 Dec 2019
 12:32:05 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191206033100.36345-1-yuchao0@huawei.com>
 <20191206040823.GA33758@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <21133017-e538-83b4-b295-abecbcb329df@huawei.com>
Date: Fri, 6 Dec 2019 12:32:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191206040823.GA33758@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1id5Hs-00BVHT-KG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to relocate f2fs_balance_fs() in
 mkwrite()
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

Hi Jaeguek,

On 2019/12/6 12:08, Jaegeuk Kim wrote:
> Hi Chao,
> 
> I was testing this.
> 
> https://github.com/jaegeuk/f2fs/commit/76be33b9f1fce70dd2d3f04f66d0f78b418fe3f5

The patch looks good.

BTW, do you mind adding below call stack into your patch? I guess it
describes this ABBA deadlock with more details. :)

Thanks,

> 
> On 12/06, Chao Yu wrote:
>> As Dinosaur Huang reported, there is a potential deadlock in between
>> GC and mkwrite():
>>
>> Thread A			Thread B
>> - do_page_mkwrite
>>  - f2fs_vm_page_mkwrite
>>   - lock_page
>> 				- f2fs_balance_fs
>>                                  - mutex_lock(gc_mutex)
>> 				 - f2fs_gc
>> 				  - do_garbage_collect
>> 				   - ra_data_block
>> 				    - grab_cache_page
>>   - f2fs_balance_fs
>>    - mutex_lock(gc_mutex)
>>
>> In order to fix this, we just move f2fs_balance_fs() out of page lock's
>> coverage in f2fs_vm_page_mkwrite().
>>
>> Reported-by: Dinosaur Huang <dinosaur.huang@unisoc.com>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/file.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index c0560d62dbee..ed3290225506 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -67,6 +67,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>>  
>>  	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
>>  
>> +	f2fs_balance_fs(sbi, true);
>> +
>>  	file_update_time(vmf->vma->vm_file);
>>  	down_read(&F2FS_I(inode)->i_mmap_sem);
>>  	lock_page(page);
>> @@ -120,8 +122,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>>  out_sem:
>>  	up_read(&F2FS_I(inode)->i_mmap_sem);
>>  
>> -	f2fs_balance_fs(sbi, dn.node_changed);
>> -
>>  	sb_end_pagefault(inode->i_sb);
>>  err:
>>  	return block_page_mkwrite_return(err);
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
