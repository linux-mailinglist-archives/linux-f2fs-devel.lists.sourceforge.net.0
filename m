Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E71EA30C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 13:44:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfirQ-0006Pc-JN; Mon, 01 Jun 2020 11:44:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jfirP-0006PU-Dc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 11:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pFY4mRr7mmUOg+bGWfGTTQq51AVauaIFqxlm+7EVQ4c=; b=ODHS3yzmNG3Lu5eUSFkI2vvddY
 50RlhoYr5RUdKyv3YIgdsHZSuc7KUSj78/qPIeAktDOZQt2Ce3VsXxA7o7aUKWDMLCNNmqh6fi2M/
 Ap2DQvoTMHYVnbSILIATLmwrutakNKSVKrFTxBlZCjFUZ7KsL5SvkHtyK7qCx0KHVHOk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pFY4mRr7mmUOg+bGWfGTTQq51AVauaIFqxlm+7EVQ4c=; b=InXH7wBvaQRSIcZvswqQHawKZf
 6nt5T76pN3Qzu8Qb9I6AGKZu9M/Z396YMqf4k2ygduzgQvFAxqt3CROmwkuEVp1L+knt2R7GAr3PZ
 gaD9RnAgXnCYdvcMWxhwOFIN7/PfQBRQtZWGsBECxS0PS47XZqt/eg18fBHN/EfpCbQg=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfirN-003bF1-AR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 11:44:07 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6FD09ECC3EF7D00DC03F;
 Mon,  1 Jun 2020 19:43:54 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 1 Jun 2020
 19:43:53 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <1590546056-17871-1-git-send-email-stummala@codeaurora.org>
 <1d54379e-35c7-76e0-0c8a-d89bfcecb935@huawei.com>
 <78d2f29b-3ec0-39bc-46cf-88e82f1970c9@huawei.com>
 <20200528191839.GA180586@google.com> <20200601092035.GA19831@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8e938d5c-251c-9922-34a0-5e606cdb4afb@huawei.com>
Date: Mon, 1 Jun 2020 19:43:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200601092035.GA19831@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfirN-003bF1-AR
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix retry logic in
 f2fs_write_cache_pages()
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

On 2020/6/1 17:20, Sahitya Tummala wrote:
> Hi Chao,
> 
> Can you please help review the diff given by Jaegeuk below?
> If it looks good, I can post a v2.

Oops, I missed to review that patch...

> 
> Thanks,
> 
> On Thu, May 28, 2020 at 12:18:39PM -0700, Jaegeuk Kim wrote:
>> On 05/28, Chao Yu wrote:
>>> On 2020/5/28 10:45, Chao Yu wrote:
>>>> On 2020/5/27 10:20, Sahitya Tummala wrote:
>>>>> In case a compressed file is getting overwritten, the current retry
>>>>> logic doesn't include the current page to be retried now as it sets
>>>>> the new start index as 0 and new end index as writeback_index - 1.
>>>>> This causes the corresponding cluster to be uncompressed and written
>>>>> as normal pages without compression. Fix this by allowing writeback to
>>>>> be retried for the current page as well (in case of compressed page
>>>>> getting retried due to index mismatch with cluster index). So that
>>>>> this cluster can be written compressed in case of overwrite.
>>>>>
>>>>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
>>>>> ---
>>>>>  fs/f2fs/data.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>> index 4af5fcd..bfd1df4 100644
>>>>> --- a/fs/f2fs/data.c
>>>>> +++ b/fs/f2fs/data.c
>>>>> @@ -3024,7 +3024,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>>>>>  	if ((!cycled && !done) || retry) {
>>>>
>>>> IMO, we add retry logic in wrong place, you can see that cycled value is
>>>> zero only if wbc->range_cyclic is true, in that case writeback_index is valid.
>>>>
>>>> However if retry is true and wbc->range_cyclic is false, then writeback_index
>>>> would be uninitialized variable.
>>>>
>>>> Thoughts?
>>>>
>>>> Thanks,
>>>>
>>>>>  		cycled = 1;
>>>>>  		index = 0;
>>>>> -		end = writeback_index - 1;
>>>
>>> BTW, I notice that range_cyclic writeback flow was refactored in below commit,
>>> and skeleton of f2fs.writepages was copied from mm/page-writeback.c::write_cache_pages(),
>>> I guess we need follow that change.
>>>
>>> 64081362e8ff ("mm/page-writeback.c: fix range_cyclic writeback vs writepages deadlock")
>>
>> Is that something like this?
>>
>> ---
>>  fs/f2fs/data.c | 11 ++---------
>>  1 file changed, 2 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 48a622b95b76e..28fcdf0d4dcb9 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2861,7 +2861,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>>  	pgoff_t index;
>>  	pgoff_t end;		/* Inclusive */
>>  	pgoff_t done_index;
>> -	int cycled;
>>  	int range_whole = 0;
>>  	xa_mark_t tag;
>>  	int nwritten = 0;
>> @@ -2879,17 +2878,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>>  	if (wbc->range_cyclic) {
>>  		writeback_index = mapping->writeback_index; /* prev offset */
>>  		index = writeback_index;
>> -		if (index == 0)
>> -			cycled = 1;
>> -		else
>> -			cycled = 0;
>>  		end = -1;
>>  	} else {
>>  		index = wbc->range_start >> PAGE_SHIFT;
>>  		end = wbc->range_end >> PAGE_SHIFT;
>>  		if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
>>  			range_whole = 1;
>> -		cycled = 1; /* ignore range_cyclic tests */
>>  	}
>>  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
>>  		tag = PAGECACHE_TAG_TOWRITE;
>> @@ -3054,10 +3048,9 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>>  		}
>>  	}
>>  #endif
>> -	if ((!cycled && !done) || retry) {
>> -		cycled = 1;
>> +	if (retry) {
>>  		index = 0;
>> -		end = writeback_index - 1;
>> +		end = -1;
>>  		goto retry;
>>  	}

+	if (wbc->range_cyclic && !done)
+		done_index = 0;

Thanks,

>>  	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
>> -- 
>> 2.27.0.rc0.183.gde8f92d652-goog
>>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
