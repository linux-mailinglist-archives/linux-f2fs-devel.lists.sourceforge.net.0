Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B73BB377EEA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 11:05:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg1qy-0006S2-4h; Mon, 10 May 2021 09:05:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lg1qw-0006Rs-Do
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:CC:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9yMlnDDgK8BkrZrAEmY00tWkGUO/Ug6XbqY1NGVeAHo=; b=VCgQlArNv2gpeX67C/AwZaSq+v
 UgGTYiDKplrb+hKBUMqmS74P44V3MqJctl/J0rjvchJWcqwr5Fc7GuOtDpOvdi1TghJRdHYWgI/yo
 OQINHee9QfgGJzcPON5TAS4yeweelMnxoPPXS/ZemYnGXAbyc1zUPKAwWklUwvV6Z0po=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:CC:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9yMlnDDgK8BkrZrAEmY00tWkGUO/Ug6XbqY1NGVeAHo=; b=VXVUrBBmZRaV+apqLIP9hRq3mx
 CLJhpiWvxatrI/amJlhTG+A7WOX4PdNfjrxc1LpDMJiqJQMhnHI4HT49DZgvBi6QNRTWhS39Ny9me
 NDfbI4tIPYFTuadqFVJbW1VqhC33zG/Wtp7wLLcT8GGVscWgzHxvHHMHdMpdvAt7yrVA=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg1qr-000z5m-4u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 09:05:28 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fdw656rm2zQldM;
 Mon, 10 May 2021 17:01:49 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 10 May
 2021 17:05:08 +0800
From: Chao Yu <yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210202080056.51658-1-yuchao0@huawei.com>
 <46e9924c-0086-cd2a-2e93-7149b92ba27e@huawei.com>
 <YDsleDjeIcpuBXKA@google.com> <YEFBAuP26t0RzVHZ@google.com>
 <01a0ff76-6fa7-3196-8760-e7f6f163ef64@huawei.com>
 <YEa66ekikyuPWSyd@google.com>
 <a40929d4-a8de-98ea-8dd8-6c807d8a6adc@huawei.com>
 <YEkxpAp8FQjRUfm6@google.com>
 <157988c7-079f-0c9f-5cf9-e83bc2f835d1@huawei.com>
 <YID0sDPrUxOJLz+A@google.com>
 <6d574f4e-fed2-ded8-c9d5-4d88bff5d584@huawei.com>
Message-ID: <3f7ebf46-536e-dc80-ebda-71b2034cb4c9@huawei.com>
Date: Mon, 10 May 2021 17:05:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6d574f4e-fed2-ded8-c9d5-4d88bff5d584@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lg1qr-000z5m-4u
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: compress: add compress_inode to
 cache compressed blockst
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

On 2021/4/22 14:07, Chao Yu wrote:
> On 2021/4/22 11:59, Jaegeuk Kim wrote:
>> On 04/21, Chao Yu wrote:
>>> On 2021/3/11 4:52, Jaegeuk Kim wrote:
>>>> On 03/09, Chao Yu wrote:
>>>>> On 2021/3/9 8:01, Jaegeuk Kim wrote:
>>>>>> On 03/05, Chao Yu wrote:
>>>>>>> On 2021/3/5 4:20, Jaegeuk Kim wrote:
>>>>>>>> On 02/27, Jaegeuk Kim wrote:
>>>>>>>>> On 02/04, Chao Yu wrote:
>>>>>>>>>> Jaegeuk,
>>>>>>>>>>
>>>>>>>>>> On 2021/2/2 16:00, Chao Yu wrote:
>>>>>>>>>>> -	for (i = 0; i < dic->nr_cpages; i++) {
>>>>>>>>>>> +	for (i = 0; i < cc->nr_cpages; i++) {
>>>>>>>>>>>        		struct page *page = dic->cpages[i];
>>>>>>>>>>
>>>>>>>>>> por_fsstress still hang in this line?
>>>>>>>>>
>>>>>>>>> I'm stuck on testing the patches, since the latest kernel is panicking somehow.
>>>>>>>>> Let me update later, once I can test a bit. :(
>>>>>>>>
>>>>>>>> It seems this works without error.
>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4e6e1364dccba80ed44925870b97fbcf989b96c9
>>>>>>>
>>>>>>> Ah, good news.
>>>>>>>
>>>>>>> Thanks for helping to test the patch. :)
>>>>>>
>>>>>> Hmm, I hit this again. Let me check w/o compress_cache back. :(
>>>>>
>>>>> Oops :(
>>>>
>>>> Ok, apprantely that panic is caused by compress_cache. The test is running over
>>>> 24hours w/o it.
>>>
>>> Jaegeuk,
>>>
>>> I'm still struggling troubleshooting this issue.
>>>
>>> However, I failed again to reproduce this bug, I doubt the reason may be
>>> my test script and environment(device type/size) is different from yours.
>>> (btw, I used pmem as back-end device, and test w/ all fault injection
>>> points and w/o write_io/checkpoint fault injection points)
>>>
>>> Could you please share me your run.sh script? and test command?
>>>
>>> And I'd like to ask what's your device type and size?
>>
>> I'm using qemu with 16GB with this script.
>> https://github.com/jaegeuk/xfstests-f2fs/blob/f2fs/run.sh
>>
>> ./run.sh por_fsstress
> 
> Thanks, let me check the difference, and try again.

Finally, I can reproduce this bug, and after troubleshooting this
issue, I guess the root cause is not related to this patch, could
you please test patch "f2fs: compress: fix race condition of overwrite
vs truncate" with compress_cache enabled? I've ran por_fsstress case
for 6 hours w/o any problems.

Thanks,

> 
> Thanks,
> 
>>
>>>
>>> Thanks,
>>>
>>>> .
>>>>
>> .
>>
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
