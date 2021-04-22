Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA0367A34
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 08:51:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZTBN-0002v0-QO; Thu, 22 Apr 2021 06:51:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lZTBM-0002us-0j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 06:51:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CC2mwbyAGpdrj5tsshO4VUCIjOwEnXMNGg8B830uQZs=; b=Y6PKRJ9/eXkAYXt4tmXJD7OqMD
 I6BgyYNdpIY4A1ygb/AXtUnwhJ99nvgC4YyYXxchOwUrhnk0QmLLUcLGoYy3vgJMlO39WeueeM2VM
 lto6xbZ40kR9h2M3qddDruCWR9pwIVEDEuNS2wOwqz2WwsvSxbp8d+uI1muXE/2Hrf44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CC2mwbyAGpdrj5tsshO4VUCIjOwEnXMNGg8B830uQZs=; b=RQID1oLbo5g6O5HF5ItsIly4n0
 T91ZKyPed1hgjf/tQBqiWtwBA5GDzYglQAVVsce7dRdMWJfsrhnkGdrS+ovcg4vkc2HWg4saECXQd
 17wPYeJOAwtGKfqerp6xlj7cjAUvDrDOTA4kID8uTYIrYgXdm820HHOPA1ZoJpyOkJGs=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lZTBE-00BTR8-5S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 06:51:24 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FQp0r2Rqxzrdwb;
 Thu, 22 Apr 2021 14:48:44 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 22 Apr
 2021 14:51:04 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210421083941.66371-1-yuchao0@huawei.com>
 <YID1sqemJVeBcdqD@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <2c6f17e6-ef23-f313-5df2-6bd63d7df2b1@huawei.com>
Date: Thu, 22 Apr 2021 14:51:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <YID1sqemJVeBcdqD@google.com>
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
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lZTBE-00BTR8-5S
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: remove unneed check condition
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

On 2021/4/22 12:04, Jaegeuk Kim wrote:
> On 04/21, Chao Yu wrote:
>> In only call path of __cluster_may_compress(), __f2fs_write_data_pages()
>> has checked SBI_POR_DOING condition, and also cluster_may_compress()
>> has checked CP_ERROR_FLAG condition, so remove redundant check condition
>> in __cluster_may_compress() for cleanup.
> 
> I think cp_error can get any time without synchronization. Is it safe to say
> it's redundant?

Yes,

But no matter how late we check cp_error, cp_error can happen after our
check points, it won't cause regression if we remove cp_error check there,
because for compress write, it uses OPU, it won't overwrite any existed data
in device.

Seems it will be more appropriate to check cp_error in
f2fs_write_compressed_pages() like we did in f2fs_write_single_data_page()
rather than in __cluster_may_compress().

BTW, shouldn't we rename __cluster_may_compress() to
cluster_beyond_filesize() for better readability?

Thanks,

> 
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>   fs/f2fs/compress.c | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 3c9d797dbdd6..532c311e3a89 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -906,11 +906,6 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
>>   
>>   		f2fs_bug_on(sbi, !page);
>>   
>> -		if (unlikely(f2fs_cp_error(sbi)))
>> -			return false;
>> -		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>> -			return false;
>> -
>>   		/* beyond EOF */
>>   		if (page->index >= nr_pages)
>>   			return false;
>> -- 
>> 2.29.2
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
