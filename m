Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 290B9191EEE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 03:21:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGvfL-0007uQ-Tw; Wed, 25 Mar 2020 02:21:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGvfJ-0007u5-ER
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 02:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8Dr3V1nctjIB5utAvpc27SBDwv/Fs1QuGfXXUbxyMM=; b=FGoTyvJ5K4Bed5mA20GfrixX2Z
 JitAmdsu1J56hnUTNNBf7wt3ah+RwPkEmONELS+rilKn313L66BZrp3ZNtN3/ZG5+FtkYygyFoFLI
 eYK8qFRmsO9E4D6xoWftsHYTqjjAr5XQpp3v+KadKollDushDgGL4/IbCBhkk4xFEZt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i8Dr3V1nctjIB5utAvpc27SBDwv/Fs1QuGfXXUbxyMM=; b=bhCjD9ZSsLTYnSuHd8JEy47Yte
 w///N92I+deacXbGAPvLuyBhyZJZvkcdsFykI2OK9M6LVMDfTVmTfX+XNe/jQQqwpNPIKfwlwqhE5
 P4E5WbsFKowwELgADY0eO0W+TCJEpr98VFyoDYL/UWoK7D3OzskkfkdLJ6dTue520xI0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGvfH-00Fsjm-8u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 02:21:09 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 79E47D1081DD791063F5;
 Wed, 25 Mar 2020 10:20:57 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 25 Mar
 2020 10:20:52 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200229104906.12061-1-yuchao0@huawei.com>
 <6aab59b9-6e33-5b01-acf8-ccbacd9318e3@huawei.com>
 <20200324154322.GB198420@google.com>
 <b0306fcf-27f2-20ab-9e5b-e54a924d4a61@huawei.com>
 <20200325021702.GC198420@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f25a42bd-6d59-6b5c-5e32-8c7d73161373@huawei.com>
Date: Wed, 25 Mar 2020 10:20:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200325021702.GC198420@google.com>
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
X-Headers-End: 1jGvfH-00Fsjm-8u
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove redundant compress inode check
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

On 2020/3/25 10:17, Jaegeuk Kim wrote:
> On 03/25, Chao Yu wrote:
>> On 2020/3/24 23:43, Jaegeuk Kim wrote:
>>> On 03/24, Chao Yu wrote:
>>>> Jaegeuk,
>>>>
>>>> Missed to apply this patch?
>>>>
>>>> On 2020/2/29 18:49, Chao Yu wrote:
>>>>> due to f2fs_post_read_required() has did that.
>>>>>
>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>> ---
>>>>>  fs/f2fs/f2fs.h | 2 --
>>>>>  1 file changed, 2 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>>> index f4bcbbd5e9ed..882f9ad3445b 100644
>>>>> --- a/fs/f2fs/f2fs.h
>>>>> +++ b/fs/f2fs/f2fs.h
>>>>> @@ -4006,8 +4006,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>>>>>  		return true;
>>>>>  	if (f2fs_is_multi_device(sbi))
>>>>>  		return true;
>>>>> -	if (f2fs_compressed_file(inode))
>>>>> -		return true;
>>>
>>> I thought that we can keep this to avoid any confusion when porting to old
>>> production kernel which uses ICE.
>>
>> That old kernel w/ ICE doesn't have f2fs_post_read_required(), right?
> 
> We do have.

Well, so I didn't catch your point why we will confuse. :P

> 
>>
>> I thought we backport features with order of the time fsverity/compression
>> feature was introduced, then f2fs_post_read_required() should be there
>> when we backport compression feature.
>>
>> Thanks,
>>
>>>
>>>>>  	/*
>>>>>  	 * for blkzoned device, fallback direct IO to buffered IO, so
>>>>>  	 * all IOs can be serialized by log-structured write.
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
