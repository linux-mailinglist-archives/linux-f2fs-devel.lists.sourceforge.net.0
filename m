Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 432031A2D94
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Apr 2020 04:23:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jMMr2-0005Dp-TG; Thu, 09 Apr 2020 02:23:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jMMr1-0005Da-Da
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 02:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lO08Jw1MjfwgCCeuUqXUaKISxTY0P7BeY2oOhr56vmg=; b=jrIsn4UySReQRMJapeE/9l9gMY
 9lkfXyC6q+s01ru42d0BAIRaQ0hfaxF67otUC3LxBvUAokL48NSnWFi3eC8Tj5sLXBqblPwOnqkyG
 OUMA80vO5hG/I3rCFZh++BWRkOEAceclg7KG6sg2UeixVm8kY2/PxOxerJEK7iYMqrhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lO08Jw1MjfwgCCeuUqXUaKISxTY0P7BeY2oOhr56vmg=; b=K2b/W38fiZV4p+1450Hdwf5z7Q
 e+QTTt2GQUb2locu8V+ivEJKXulFTkIhZY2hNVPuo9ehYXVcsp3MiqdS1pPxci9tu+Eoi9wGOTALb
 PJz6TYfGetl9s6wL7+JGL+/Ap+Z/94UuqZKg2Jq3bpmoOCEIcu3lcefGHq135F8QmCV8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jMMqz-009Ddn-GO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 02:23:43 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E8130F4DDE3D08055245;
 Thu,  9 Apr 2020 10:23:30 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 9 Apr 2020
 10:23:28 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200403161249.68385-1-jaegeuk@kernel.org>
 <0e627c29-7fb0-5bd6-c1d9-b96a94df62ae@huawei.com>
 <20200407025913.GB137081@google.com>
 <2ca452cd-073a-29fa-1884-99ad1199bb97@huawei.com>
 <20200409022005.GA110440@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <69df999a-1df2-595e-579d-a8c3fc700d7b@huawei.com>
Date: Thu, 9 Apr 2020 10:23:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200409022005.GA110440@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jMMqz-009Ddn-GO
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce sysfs/data_io_flag to attach
 REQ_META/FUA
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

On 2020/4/9 10:20, Jaegeuk Kim wrote:
> On 04/07, Chao Yu wrote:
>> On 2020/4/7 10:59, Jaegeuk Kim wrote:
>>> On 04/07, Chao Yu wrote:
>>>> On 2020/4/4 0:12, Jaegeuk Kim wrote:
>>>>> This patch introduces a way to attach REQ_META/FUA explicitly
>>>>> to all the data writes given temperature.
>>>>>
>>>>> -> attach REQ_FUA to Hot Data writes
>>>>>
>>>>> -> attach REQ_FUA to Hot|Warm Data writes
>>>>>
>>>>> -> attach REQ_FUA to Hot|Warm|Cold Data writes
>>>>>
>>>>> -> attach REQ_FUA to Hot|Warm|Cold Data writes as well as
>>>>>           REQ_META to Hot Data writes
>>>>
>>>> Out of curiosity, what scenario it is used for?
>>>
>>> It's testing purpose to compare the bandwidths per different IO flags.
>>
>> Thanks for the hint. :)
>>
>> As nobarrier was set in Android, so REQ_PREFLUSH will not be considered in
>> this sysfs interface?
> 
> I don't see any diff on performance, so not interesting. :)

I doubt it may has diff on non-ufs/emmc device? just guess.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks,
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
