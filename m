Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B259E131D42
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 02:35:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iodmH-0008Dd-RV; Tue, 07 Jan 2020 01:35:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iodmG-0008DB-SW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 01:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+5/ybG7n2omfwObzZ7vfdoop7L14vRkFSlZoht32lCk=; b=jti7OsXgJFPhfX9+lKR7JW6kU5
 nAnmgWQ0K5edHHB1joqxwjaXcZTSfZ5bQi7VW+O7T/IgdaoaMYyfY/h+dnxOUNqr55JrYmrEBVX2+
 3XgLkk1dsGOf8bWdlUVQfaD/laW+KzzhbTzoBXWJRuBj2Y/jH61NXmdA0juNe3JMv0K8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+5/ybG7n2omfwObzZ7vfdoop7L14vRkFSlZoht32lCk=; b=QuaPsU2rIX0WwpgAwc6oh+7OSp
 rDs4dh+YUk4/MRP1lF4vqqefLoTVDEdejYFUPruLJAHSJXVMSm18goxt53QTln1rPKJvdEMt+6Ymn
 JmpBprUimIU3TEI40im/LYIw1li7apgN4MW3sT2jx5PcoOXeI7+F6LNQh+RN10C8el8Y=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iodm7-00C3kz-OJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 01:35:24 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C72D9F1DEBA7F58D88D2;
 Tue,  7 Jan 2020 09:35:05 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 7 Jan 2020
 09:35:00 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200106080144.52363-1-yuchao0@huawei.com>
 <20200106080144.52363-3-yuchao0@huawei.com>
 <20200106190809.GE50058@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e5c45ba2-6437-c84a-11b3-abe8c16a5c6c@huawei.com>
Date: Tue, 7 Jan 2020 09:35:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200106190809.GE50058@jaegeuk-macbookpro.roam.corp.google.com>
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
X-Headers-End: 1iodm7-00C3kz-OJ
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: compress: fix error path in
 prepare_compress_overwrite()
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

On 2020/1/7 3:08, Jaegeuk Kim wrote:
> On 01/06, Chao Yu wrote:
>> - fix to release cluster pages in retry flow
>> - fix to call f2fs_put_dnode() & __do_map_lock() in error path
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  fs/f2fs/compress.c | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index fc4510729654..3390351d2e39 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -626,20 +626,26 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>  	}
>>  
>>  	for (i = 0; i < cc->cluster_size; i++) {
>> +		f2fs_bug_on(sbi, cc->rpages[i]);
>> +
>>  		page = find_lock_page(mapping, start_idx + i);
>>  		f2fs_bug_on(sbi, !page);
>>  
>>  		f2fs_wait_on_page_writeback(page, DATA, true, true);
>>  
>> -		cc->rpages[i] = page;
>> +		f2fs_compress_ctx_add_page(cc, page);
>>  		f2fs_put_page(page, 0);
>>  
>>  		if (!PageUptodate(page)) {
>> -			for (idx = 0; idx < cc->cluster_size; idx++) {
>> -				f2fs_put_page(cc->rpages[idx],
>> -						(idx <= i) ? 1 : 0);
>> +			for (idx = 0; idx <= i; idx++) {
>> +				unlock_page(cc->rpages[idx]);
>>  				cc->rpages[idx] = NULL;
>>  			}
>> +			for (idx = 0; idx < cc->cluster_size; idx++) {
>> +				page = find_lock_page(mapping, start_idx + idx);
> 
> Why do we need to lock the pages again?

Here, all pages in cluster has one extra reference count, we need to find all
pages, and release those references on them.

cc->rpages may not record all pages' pointers, so we can not use

f2fs_put_page(cc->rpages[idx], (idx <= i) ? 1 : 0); to release all pages' references.

BTW, find_get_page() should be fine to instead find_lock_page().

> 
>> +				f2fs_put_page(page, 1);
>> +				f2fs_put_page(page, 0);
>> +			}
>>  			kvfree(cc->rpages);
>>  			cc->nr_rpages = 0;
>>  			goto retry;
>> @@ -654,16 +660,20 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
>>  		for (i = cc->cluster_size - 1; i > 0; i--) {
>>  			ret = f2fs_get_block(&dn, start_idx + i);
>>  			if (ret) {
>> -				/* TODO: release preallocate blocks */
>>  				i = cc->cluster_size;
>> -				goto unlock_pages;
>> +				break;
>>  			}
>>  
>>  			if (dn.data_blkaddr != NEW_ADDR)
>>  				break;
>>  		}
>>  
>> +		f2fs_put_dnode(&dn);
> 
> We don't neeed this, since f2fs_reserve_block() put the dnode.

Correct.

Thanks,

> 
>> +
>>  		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
>> +
>> +		if (ret)
>> +			goto unlock_pages;
>>  	}
>>  
>>  	*fsdata = cc->rpages;
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
