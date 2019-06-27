Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D958014
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jun 2019 12:20:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgRVP-00012s-SJ; Thu, 27 Jun 2019 10:19:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hgRVN-00012g-PN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jun 2019 10:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t+Gkml9Tw/7+HbEl3vGG926lw5n0CdI4Yh5JcDl9zTo=; b=Q/Ovv9uY/x5qSQu997724hbbDh
 D9PpB/J/wlMlu0iaNX4Ew/X+tiIUAVNY3mniQLjf8JfHXm1MDRVaLsxXB/Hj5DrdgSVWt/BoCmlHM
 txSFCxGvcFfTrMcExFS7tHI4GzHFo2iSTB4zZs0SepIxsGIO2jkr054EPm0XypXWr0aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t+Gkml9Tw/7+HbEl3vGG926lw5n0CdI4Yh5JcDl9zTo=; b=j2LXhzy6iSQtOtCXppPXtwm02/
 Shk7habQs1upJYI2kftTI2udTBPIW7eWerPYXicKmjvqDvn3ujJ2e0xS4vMw0a0tRcO4DbY9EaEJe
 p/DmzS1VX7WCGNFWCIj0jYZPd5Th9lJLKSFkVEkRywhR7AEJHc3x/IOiPhVa6wyRQvDc=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hgRVR-00GXp5-Ax
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Jun 2019 10:19:55 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CC9CACF30C0E86F4E8AE;
 Thu, 27 Jun 2019 18:19:45 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Jun
 2019 18:19:41 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <CAD14+f2ckNUv9n-Zb9UL_ojX8=24tYBhT-SsrcpVNogqee2tkA@mail.gmail.com>
 <6bcbb5e8-55ad-49c1-bb77-f7f677ceb526@huawei.com>
 <CAD14+f3NHosrL=5UOBSMbFxQ91x-AuWOj_w=JYkJSnmfDgTkvA@mail.gmail.com>
 <CAD14+f0ZTmmLBXtmHF_Kz23JLSJy+UzpNxwSMV4rvSCse3y7EA@mail.gmail.com>
 <7e1bfa07-5ee8-a276-fe6a-6d79bd9270c3@huawei.com>
 <CAD14+f1+puy4M6rL_SbGt9vej=7LgK+qEjq71_878=oqSvjJ2Q@mail.gmail.com>
 <0f89b0b6-5cc5-6618-72e5-8a2f81947161@kernel.org>
 <CAD14+f1xgYKAnzqLb-ZpzbeskZegGHXbrJ+vEHZe19_Jp3pBTQ@mail.gmail.com>
 <e3303318-758e-b263-f6ed-d55e98bdea78@kernel.org>
 <CAD14+f2XWeWvYXTjKbReJa7uZROvnp_-V419sBkpmWFp5L5BtA@mail.gmail.com>
 <20190603202719.GC34729@jaegeuk-macbookpro.roam.corp.google.com>
 <249aff47-cb24-291b-37f7-6ed2d854a207@huawei.com>
 <CAD14+f13+fKvo+-vOwu79O-mSwKS7r0g=gbVL65qv+MXPc+gZg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5c36de6c-fe75-e131-9f18-03e83fb5f439@huawei.com>
Date: Thu, 27 Jun 2019 18:20:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f13+fKvo+-vOwu79O-mSwKS7r0g=gbVL65qv+MXPc+gZg@mail.gmail.com>
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
X-Headers-End: 1hgRVR-00GXp5-Ax
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs-tools: relocate chksum_offset
 for large_nat_bitmap feature
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ju Hyung,

Thanks for the reminding.

Jaegeuk, I can send the kernel patch after you tag a new version on fsck.

Thanks,

On 2019/6/27 17:12, Ju Hyung Park wrote:
> Hi Jaegeuk and Chao.
> 
> A little bump here.
> 
> We still need to tag a new version of fsck and update f2fs kernel code
> to tell which version users should use as we discussed earlier.
> -rc is closing soon, so I felt I needed to remind you.
> 
> Thanks.
> 
> On Tue, Jun 4, 2019 at 10:48 AM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> On 2019/6/4 4:27, Jaegeuk Kim wrote:
>>> On 06/04, Ju Hyung Park wrote:
>>>> Hi Jaegeuk and Chao,
>>>>
>>>> A little update I thought I might share.
>>>>
>>>> Just went through migrating my laptop to another SSD and I've setup
>>>> f2fs from the beginning with mkfs -i from the master branch.
>>>> No issue as of yet and the kernel is working fine as expected :)
>>>
>>> Cool, thanks for your test. :)
>>
>> Great, thanks for the continuous test and report. :)
>>
>> Thanks,
>>
>>>
>>>>
>>>> Thanks.
>>>>
>>>>
>>>> _______________________________________________
>>>> Linux-f2fs-devel mailing list
>>>> Linux-f2fs-devel@lists.sourceforge.net
>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>>
>>>
>>> _______________________________________________
>>> Linux-f2fs-devel mailing list
>>> Linux-f2fs-devel@lists.sourceforge.net
>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>>> .
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
