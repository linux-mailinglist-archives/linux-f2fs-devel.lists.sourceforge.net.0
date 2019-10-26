Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F0E57DA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Oct 2019 03:38:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iOB2B-0006rU-N4; Sat, 26 Oct 2019 01:38:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iOB2A-0006rM-3M
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Oct 2019 01:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kV8dwHdSKs7su497qkCOarVWPruE2vD5/Y2LlOggrNc=; b=OEkKV6XG6GBZ31mqqHg1o0viVw
 rGpFWg2mcmE5GGYnKk/1kvpucRsDushWvHL/RpZMNEcFy+vnNCnV6z4cpw/Md3SMxWIT+PkeD/EVf
 rDRZM2Op6xwQGipo45Y41SnLd3hBlSfpGkknQNjPb9H1tPxnJIRGm0iC/AGAqnofShAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kV8dwHdSKs7su497qkCOarVWPruE2vD5/Y2LlOggrNc=; b=i9VH4f9/36VnzRHWzUPQvgwH94
 j56VZTrE2WXlr7bHWOweBiCDkx0eyGvBIgCyB8qY5mun/v8EJrxUsmwi1iK7vslgsih20Uhl1mX3k
 3/SV/ib5p4RkOcPbxueIEjnFsyrqlwGaz0Dk7OC8NuDalmK2FjtZq0OQRSxFtGuDp2So=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iOB1u-00HOsH-1c
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Oct 2019 01:38:25 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2FF9ED41810365E8BC66;
 Sat, 26 Oct 2019 09:38:03 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sat, 26 Oct
 2019 09:37:58 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191023214821.107615-1-hridya@google.com>
 <20191023214821.107615-2-hridya@google.com>
 <e61510b8-c8d7-349f-b297-9df367c26a9f@huawei.com>
 <CA+wgaPNas7ixNtepJE_6e7b6Dcutb9a1Who4WrUfKSw1ZnQhTA@mail.gmail.com>
 <96f89e7c-d91e-e263-99f7-16998cc443a7@huawei.com>
 <20191025182229.GB24183@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <eb08716f-2f56-30bb-d71d-28125b3b0608@huawei.com>
Date: Sat, 26 Oct 2019 09:37:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191025182229.GB24183@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1iOB1u-00HOsH-1c
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: Add f2fs stats to sysfs
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
Cc: Hridya Valsaraju <hridya@google.com>,
 Android Kernel Team <kernel-team@android.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/10/26 2:22, Jaegeuk Kim wrote:
> On 10/25, Chao Yu wrote:
>> On 2019/10/25 11:51, Hridya Valsaraju wrote:
>>> On Thu, Oct 24, 2019 at 2:26 AM Chao Yu <yuchao0@huawei.com> wrote:
>>>>
>>>> On 2019/10/24 5:48, Hridya Valsaraju wrote:
>>>>> Currently f2fs stats are only available from /d/f2fs/status. This patch
>>>>> adds some of the f2fs stats to sysfs so that they are accessible even
>>>>> when debugfs is not mounted.
>>>>
>>>> Why don't we mount debugfs first?
>>>
>>> Thank you for taking a look at the patch Chao. We will not be mounting
>>> debugfs for security reasons.
>>
>> Hi, Hridya,
>>
>> May I ask is there any use case for those new entries?
>>
>> So many sysfs entries exist, if there is real use case, how about backuping
>> entire /d/f2fs/status entry into /proc/fs/f2fs/<dev>/ directory rather than
>> adding some of stats as a single entry in sysfs directory?
> 
> These will be useful to keep a track on f2fs health status by one value
> per entry, which doesn't require user-land parsing stuff. Of course, Android
> can exploit them by IdleMaint, rollback feature, and so on.

Alright, I suggest to add a sub-directory for those statistic entries, we can
manage them more easily isolated from those existed switch entries.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>> Regards,
>>> Hridya
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
