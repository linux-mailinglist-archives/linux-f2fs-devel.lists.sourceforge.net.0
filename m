Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FF9163BA9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 04:54:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4GRg-00075K-4k; Wed, 19 Feb 2020 03:54:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j4GRf-00075E-C6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QwcQtZU1Y4lJHW83Mk8BrTF8bNO8n9yGDqn01Nup6Zc=; b=llVEv1yWQp30iEwXRvcThfrboq
 owTNBPEgEwKylF/yJ7fuspZBLLYHmtzoFaJBWknbFzjTIDDtbhXgZ8SZI6M/fwiyIeoZNMe+t+D//
 FUQ0qRW5uQzd5gUfpt0dEpkfDWWitHqxvz7DqQ3BAj56+sOsZEbkgf+WM5pyiyEQz+Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QwcQtZU1Y4lJHW83Mk8BrTF8bNO8n9yGDqn01Nup6Zc=; b=d5YA2bqspTDdzbuyOIWBxS3aiq
 VbcTKFCKuoBC5ZMR/Ek8C5kFPTPcdKFZBA5KCJbjY2Y1HKSvhEs4NynAs5wLtP6/SEmTgzdUsrdRr
 fopwvCkVaLNqe/W6GkVxMGD3SwHYzitKvnVoeiEXj73qizOxS2CwbgSI2QrORw0zMqDg=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4GRc-00HB0t-VA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 03:54:43 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2E7D78F300AE887A7AEF;
 Wed, 19 Feb 2020 11:54:34 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 19 Feb
 2020 11:54:28 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200214185855.217360-1-jaegeuk@kernel.org>
 <20200214185855.217360-3-jaegeuk@kernel.org>
 <9c497f3e-3399-e4a6-f81c-6c4a1f35e5bb@huawei.com>
 <20200218232714.GB10213@google.com>
 <117a927f-7128-b5a1-a961-22934bb62ec5@huawei.com>
 <20200219030425.GA102063@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <266f233b-e084-cccd-d07e-96d8438d5b74@huawei.com>
Date: Wed, 19 Feb 2020 11:54:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200219030425.GA102063@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j4GRc-00HB0t-VA
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: skip migration only when BG_GC is
 called
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

On 2020/2/19 11:04, Jaegeuk Kim wrote:
> On 02/19, Chao Yu wrote:
>> On 2020/2/19 7:27, Jaegeuk Kim wrote:
>>> On 02/17, Chao Yu wrote:
>>>> On 2020/2/15 2:58, Jaegeuk Kim wrote:
>>>>> FG_GC needs to move entire section more quickly.
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>  fs/f2fs/gc.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>>>> index bbf4db3f6bb4..1676eebc8c8b 100644
>>>>> --- a/fs/f2fs/gc.c
>>>>> +++ b/fs/f2fs/gc.c
>>>>> @@ -1203,7 +1203,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>>>>>  
>>>>>  		if (get_valid_blocks(sbi, segno, false) == 0)
>>>>>  			goto freed;
>>>>> -		if (__is_large_section(sbi) &&
>>>>> +		if (gc_type == BG_GC && __is_large_section(sbi) &&
>>>>>  				migrated >= sbi->migration_granularity)
>>>>
>>>> I knew migrating one large section is a more efficient way, but this can
>>>> increase long-tail latency of f2fs_balance_fs() occasionally, especially in
>>>> extreme fragmented space.
>>>
>>> FG_GC requires to wait for whole section migration which shows the entire
>>> latency.
>>
>> That will cause long-tail latency for single f2fs_balance_fs() procedure,
>> which it looks a very long hang when userspace call f2fs syscall, so why
>> not splitting total elapsed time into several f2fs_balance_fs() to avoid that.
> 
> Then, other ops can easily make more dirty segments. The intention of FG_GC is

Yup, that's a problem, if there are more dirty datas being made, reserved segments
may be ran out during FG_GC.

> to block everything and make min. free segments as a best shot.

I just try to simulate write GC's logic in FTL to mitigate single op's max latency,
otherwise benchmark looks hang during FG_GC (in a 500mb+ section).

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>>>
>>>>>  			goto skip;
>>>>>  		if (!PageUptodate(sum_page) || unlikely(f2fs_cp_error(sbi)))
>>>>>
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
