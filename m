Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00916B977
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 07:10:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6TQX-0004Vs-Bm; Tue, 25 Feb 2020 06:10:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6TQW-0004Vj-1n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 06:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D0vgozlleF+obQAUG9wvsA0ZaeeLbRIK8bRDhVowJP8=; b=XXqirVvZVfGcMWuN5GVpHxVa9E
 pBNmLp+acbTCfz/oLhwiJvN+dyZABmhhkHcWoT909b8FO/dI9DdMlkZcLEvgvALibEUZyH1CBFlum
 1KrAjjsgmZLTLLCDbTWQ8dyTqPjBGQfB1pNQNJW8+ivZEys6f/uJa45PG/nq5Rreq2yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D0vgozlleF+obQAUG9wvsA0ZaeeLbRIK8bRDhVowJP8=; b=cLoLgP5GZFSW+/RFE9nbbdP9JW
 /AsrddlwlVPtRwot2zmf6bGkteWH95/OJBSdh3EtuCuw+1fm7hcqGl1/O1q9Y2fdSoH/UD45feWav
 iy2hAFaGzaUySU2gP/v4ZCCJQWuM20BohVrWFVjf1wBYbbQ+kjKu46ajEk/wb6EYMtJg=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6TQS-00Fk6J-DZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 06:10:40 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 647837751992D0EB2F3D;
 Tue, 25 Feb 2020 14:10:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 25 Feb
 2020 14:10:06 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200218102136.32150-1-yuchao0@huawei.com>
 <20200218102136.32150-3-yuchao0@huawei.com>
 <20200219025154.GB96609@google.com>
 <576f8389-ba27-b461-5466-cc62e84b5c92@huawei.com>
 <20200224220031.GC77839@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b4c4f60f-ada5-55c9-7d16-45cecad4d433@huawei.com>
Date: Tue, 25 Feb 2020 14:10:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200224220031.GC77839@google.com>
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
X-Headers-End: 1j6TQS-00Fk6J-DZ
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: avoid unneeded barrier in
 do_checkpoint()
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

On 2020/2/25 6:00, Jaegeuk Kim wrote:
> On 02/19, Chao Yu wrote:
>> On 2020/2/19 10:51, Jaegeuk Kim wrote:
>>> On 02/18, Chao Yu wrote:
>>>> We don't need to wait all dirty page submitting IO twice,
>>>> remove unneeded wait step.
>>>
>>> What happens if checkpoint and other meta writs are reordered?
>>
>> checkpoint can be done as following:
>>
>> 1. All meta except last cp-park of checkpoint area.
>> 2. last cp-park of checkpoint area
>>
>> So we only need to keep barrier in between step 1 and 2, we don't need
>> to care about the write order of meta in step 1, right?
> 
> Ah, let me integrate this patch into Sahitya's patch.>
> f2fs: fix the panic in do_checkpoint()

No problem.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>> ---
>>>>  fs/f2fs/checkpoint.c | 2 --
>>>>  1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>> index 751815cb4c2b..9c88fb3d255a 100644
>>>> --- a/fs/f2fs/checkpoint.c
>>>> +++ b/fs/f2fs/checkpoint.c
>>>> @@ -1384,8 +1384,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>>  
>>>>  	/* Flush all the NAT/SIT pages */
>>>>  	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
>>>> -	/* Wait for all dirty meta pages to be submitted for IO */
>>>> -	f2fs_wait_on_all_pages(sbi, F2FS_DIRTY_META);
>>>>  
>>>>  	/*
>>>>  	 * modify checkpoint
>>>> -- 
>>>> 2.18.0.rc1
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
