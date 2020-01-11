Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EE7137C9E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jan 2020 10:27:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iqD34-0000kH-Mc; Sat, 11 Jan 2020 09:27:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iqD2z-0000jQ-8n
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 09:27:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aHnEY0WZSuOprgp6zYLLP2ROjnwPtaV4bV1qhCteZm4=; b=Q6G0fjev2DksTFhFpLn7G8XJBs
 IpGmgNjF0J0RLSjRy0WnTte5Fg5pMig+A7uwT+XGClebCe73gx6qyhIEx/gAtNFbdIMNcW/f4JF0B
 akFqnmeQqs8VeMOV+bYkyZGvgxBYPUHFWfEbXnwEEvtLIzu/hF8Q0z3ZSuIg4dVqy2e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aHnEY0WZSuOprgp6zYLLP2ROjnwPtaV4bV1qhCteZm4=; b=RAXjfHreSLXfbR21ekaDwr0Uj9
 0nHQ7ruPgMlEh//zJ2M0UQu651T5SRE2l0j+aW+rgRFXXqhQ0WeQjhtyb9UF3Xun92R3EHCw1MySH
 8u8yu0eYSuFRb7rnGcAos7HmsltKPDWD1bVPDC7lq3S8Z8gLokFnqdYADCcgWCZ2aNlI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iqD2u-00GKR4-BP
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Jan 2020 09:27:07 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5A99D26524B0229798D5;
 Sat, 11 Jan 2020 17:26:54 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 11 Jan
 2020 17:26:51 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200107020709.73568-1-jaegeuk@kernel.org>
 <afddac87-b7c5-f68c-4e55-3705be311cf6@huawei.com>
 <20200108120444.GC28331@jaegeuk-macbookpro.roam.corp.google.com>
 <d5555fd8-736f-cc2f-1e57-d9ac01b3d012@huawei.com>
 <20200108231840.GB42219@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <bdd79445-cf45-4841-bfcd-f66260ef8bd3@huawei.com>
Date: Sat, 11 Jan 2020 17:26:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200108231840.GB42219@jaegeuk-macbookpro.roam.corp.google.com>
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
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iqD2u-00GKR4-BP
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a way to turn off ipu bio cache
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

On 2020/1/9 7:18, Jaegeuk Kim wrote:
> On 01/08, Chao Yu wrote:
>> On 2020/1/8 20:04, Jaegeuk Kim wrote:
>>> On 01/08, Chao Yu wrote:
>>>> On 2020/1/7 10:07, Jaegeuk Kim wrote:
>>>>> Setting 0x40 in /sys/fs/f2fs/dev/ipu_policy gives a way to turn off
>>>>> bio cache, which is useufl to check whether block layer using hardware
>>>>> encryption engine merges IOs correctly.
>>>>>
>>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>>>> ---
>>>>>  Documentation/filesystems/f2fs.txt | 1 +
>>>>>  fs/f2fs/segment.c                  | 2 +-
>>>>>  fs/f2fs/segment.h                  | 1 +
>>>>>  3 files changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
>>>>> index 41b5aa94b30f..cd93bcc34726 100644
>>>>> --- a/Documentation/filesystems/f2fs.txt
>>>>> +++ b/Documentation/filesystems/f2fs.txt
>>>>> @@ -335,6 +335,7 @@ Files in /sys/fs/f2fs/<devname>
>>>>>                                 0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
>>>>>                                 0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
>>>>>                                 0x10: F2FS_IPU_FSYNC.
>>>>
>>>> . -> ,
>>>
>>> Actually, we can't do it. I revised it a bit instead.
>>
>> One more question, why skipping 0x20 bit position?
> 
> It seems original patch missed to add comment.
> 
>>From f9447095de55a3cda1023a37a5e1cb6dd2f54ebb Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Wed, 8 Jan 2020 15:10:02 -0800
> Subject: [PATCH] f2fs: update f2fs document regarding to fsync_mode
> 
> This patch adds missing fsync_mode entry in f2fs document.
> 
> Fixes: 04485987f053 ("f2fs: introduce async IPU policy")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
