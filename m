Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F5721AD54
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 05:15:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtjVW-0004tb-Cb; Fri, 10 Jul 2020 03:15:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jtjVU-0004tT-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:15:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LnaFUepZkbofcdBPoUTlsOj6IRkANIebRsgjDgqB7zo=; b=mXcz7+2f/xJUftYEwcgYGNGNFP
 oyr6Qrw2ILkaSASnhTXAk/hduaqe/Denh5pli9Eod8HtqtY/VB3AjnQeU2qFD5mRYzbQET/Z7LgUc
 Kma25xvZeig/zA1+xjHx87ndqXel97hWSr43Za/kICAgBEF9gY0n0oPr+gDqeceNbhW0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LnaFUepZkbofcdBPoUTlsOj6IRkANIebRsgjDgqB7zo=; b=b8i9nP59CRUwfjXLhS6xc7RP56
 vQUw8M3ihyeLRvyqwkfCafZagUd9BQEpbCCkWaYOHttMMnRUWf2/N1kATDNwvqu3fPvrUgKpjEYIn
 TTsiPIzQ8JCUyAPURH30jeRanGuGxpBAZ3jPskcbmKjt1+y24Sf4CC8eTtzl4o4rfaKs=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtjVS-001ZzJ-Fh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 03:15:24 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 599847F8CC46ECA42E9A;
 Fri, 10 Jul 2020 11:15:14 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 10 Jul
 2020 11:15:13 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200709053027.351974-1-jaegeuk@kernel.org>
 <2f4207db-57d1-5b66-f1ee-3532feba5d1f@huawei.com>
 <20200709190545.GA3001066@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <ae1a3e8a-6209-8d4b-7235-5c8897076501@huawei.com>
Date: Fri, 10 Jul 2020 11:15:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200709190545.GA3001066@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtjVS-001ZzJ-Fh
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't skip writeback of quota data
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/7/10 3:05, Jaegeuk Kim wrote:
> On 07/09, Chao Yu wrote:
>> On 2020/7/9 13:30, Jaegeuk Kim wrote:
>>> It doesn't need to bypass flushing quota data in background.
>>
>> The condition is used to flush quota data in batch to avoid random
>> small-sized udpate, did you hit any problem here?
> 
> I suspect this causes fault injection test being stuck by waiting for inode
> writeback completion. With this patch, it has been running w/o any issue so far.
> I keep an eye on this.

Hmmm.. so that this patch may not fix the root cause, and it may hiding the
issue deeper.

How about just keeping this patch in our private branch to let fault injection
test not be stuck? until we find the root cause in upstream codes.

Thanks,

> 
> Thanks,
> 
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>  fs/f2fs/data.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index 44645f4f914b6..72e8b50e588c1 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -3148,7 +3148,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>>>  		goto skip_write;
>>>  
>>> -	if ((S_ISDIR(inode->i_mode) || IS_NOQUOTA(inode)) &&
>>> +	if (S_ISDIR(inode->i_mode) &&
>>>  			wbc->sync_mode == WB_SYNC_NONE &&
>>>  			get_dirty_pages(inode) < nr_pages_to_skip(sbi, DATA) &&
>>>  			f2fs_available_free_memory(sbi, DIRTY_DENTS))
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
