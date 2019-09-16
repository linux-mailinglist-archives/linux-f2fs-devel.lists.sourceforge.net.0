Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B39DCB32ED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2019 03:23:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i9fjf-0003Tc-8O; Mon, 16 Sep 2019 01:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i9fjd-0003TU-86
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 01:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YdC96T0MRe8fklzxO77o/53RvVritoqGgZsDTdmAd+Y=; b=eVucRYRp+55HXcWFx2kghH5oxT
 VpWPGVfXMjvisJaj11RnvVGoY4rRVenQyYTqceeLSRmIPWgyGeBZxX0+Rvq5IKuqTcETfFeCjFsaJ
 PXwCQuyF0PwGbqp8d50uiRrui0fGtDsDezWuuBrL6EOT4JyQ98G/ealQFDYPHuI05FUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YdC96T0MRe8fklzxO77o/53RvVritoqGgZsDTdmAd+Y=; b=EZ/lC2DYqyVHWdonHQebatO2Xl
 g38witXwyZZ/W3hiwJNPrfAxJyUuKSwn2tn4v54eKLFEY/0S6kx02WUMiAKEV13cDr9XQBnu/e5Lc
 q4TfL0eMivh28doA6gH/mZR/1d38ZCCc4JBDNu2qBg8TjeudMqHi/cCp8CB9aqMjkxso=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i9fjb-0072GL-QO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Sep 2019 01:23:21 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AD0EDE2B2C97BAF21A9E;
 Mon, 16 Sep 2019 09:23:10 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 16 Sep
 2019 09:23:06 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
 <20190909080654.GD21625@jaegeuk-macbookpro.roam.corp.google.com>
 <97237da2-897a-8420-94de-812e94aa751f@huawei.com>
 <20190909120443.GA31108@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <27725e65-53fe-5731-0201-9959b8ef6b49@huawei.com>
Date: Mon, 16 Sep 2019 09:22:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190909120443.GA31108@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i9fjb-0072GL-QO
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: do not select same victim right
 again
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

On 2019/9/9 20:04, Jaegeuk Kim wrote:
> On 09/09, Chao Yu wrote:
>> On 2019/9/9 16:06, Jaegeuk Kim wrote:
>>> On 09/09, Chao Yu wrote:
>>>> On 2019/9/9 9:25, Jaegeuk Kim wrote:
>>>>> GC must avoid select the same victim again.
>>>>
>>>> Blocks in previous victim will occupy addition free segment, I doubt after this
>>>> change, FGGC may encounter out-of-free space issue more frequently.
>>>
>>> Hmm, actually this change seems wrong by sec_usage_check().
>>> We may be able to avoid this only in the suspicious loop?
>>>
>>> ---
>>>  fs/f2fs/gc.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>>> index e88f98ddf396..5877bd729689 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1326,7 +1326,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>>>  		round++;
>>>  	}
>>>  
>>> -	if (gc_type == FG_GC)
>>> +	if (gc_type == FG_GC && seg_freed)
>>
>> That's original solution Sahitya provided to avoid infinite loop of GC, but I
>> suggest to find the root cause first, then we added .invalid_segmap for that
>> purpose.
> 
> I've checked the Sahitya's patch. So, it seems the problem can happen due to
> is_alive or atomic_file.

For some conditions, this doesn't help, for example, two sections contain the
same fewest valid blocks, it will cause to loop selecting them if it fails to
migrate blocks.

How about keeping it as it is to find potential bug.

Thanks,

> 
>>
>> Thanks,
>>
>>>  		sbi->cur_victim_sec = NULL_SEGNO;
>>>  
>>>  	if (sync)
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
