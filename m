Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C44A8E4E3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Aug 2019 08:24:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hy9B1-0003yT-K0; Thu, 15 Aug 2019 06:23:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hy9B0-0003yE-6g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Aug 2019 06:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L22Qnr1bGZz8tWfBG/B0A8cTth5r5mEOgMWN4Y5+VBk=; b=kAQtK5KoTeG6y/9+LzVH2DqLd8
 jcfTqXmHG++yQBT7jGK9Ncx2i9PrrQpyhDFuA7LxHB1G4RU9BxQeCqa5TgafIEeTgnBCQUr1HDDj0
 JMdXzO9duR2haQPlM/WigBtynNsiZSy5oYWWw8rYxBTaZyKx06eeMzS2p7sQyEiGrvSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L22Qnr1bGZz8tWfBG/B0A8cTth5r5mEOgMWN4Y5+VBk=; b=lKRAziwkYEcH3JYiGCMNlZyduA
 tUqdX53y0HmAuZhsWdrJQT1pomt3VHmiwUVQJaPOCmRRKTh74HRD1nzjI3LR8Vr7f0BVqerFdiOij
 0fNDx90lHL9QXUoYt/KA4LeN6/eBn5hJ6c3TwQhiuQwoQBGjllkkEjXBUe5bfZ1d1Hsw=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hy9Ax-004ZVA-TG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Aug 2019 06:23:58 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5935CD5FC3AB30AE690A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Aug 2019 14:23:47 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 15 Aug
 2019 14:23:42 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
 <20190812225211.1737-2-qkrwngud825@gmail.com>
 <5761733a-ae6a-2bab-4a68-7f91823e775d@huawei.com>
 <CAD14+f1cTyUrj0a-vFaubR+309YUXQeSVNmOqDj9jjjbduEW3w@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fc7813d8-83f8-1416-2df2-ba8f91b7838e@huawei.com>
Date: Thu, 15 Aug 2019 14:23:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f1cTyUrj0a-vFaubR+309YUXQeSVNmOqDj9jjjbduEW3w@mail.gmail.com>
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
X-Headers-End: 1hy9Ax-004ZVA-TG
Subject: Re: [f2fs-dev] [PATCH 2/2] mkfs.f2fs: add VM disk files to hot data
 types
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

On 2019/8/14 17:22, Ju Hyung Park wrote:
> Hi Chao,
> 
> You're right and Android will never use those types.
> 
> But then again, what's the point of separating the list?

I'm just thinking to use extension list space more efficiently to avoid free
slot exhaustion.

And in android, let f2fs_create() always to compare nonexistent extension name
is unneeded, right?

> I haven't encountered an Android user or an OEM that wants to
> customize this list by passing an argument to mkfs.f2fs.

That sounds sad for this interface's low use frequency, except Google and
Huawei, it looks f2fs needs more stable users first, now vendor like Huawei,
just use default list (had upstreamed .db as hot type as default yet). :(

> 
> If an OEM want to customize this list, directly modifying the code for
> mkfs.f2fs sounds better anyways.

Yes, also we support adding/deleting extensions via sys node.

Thanks,

> 
> Thanks.
> 
> On Wed, Aug 14, 2019 at 10:51 AM Chao Yu <yuchao0@huawei.com> wrote:
>>
>> On 2019/8/13 6:52, Park Ju Hyung wrote:
>>> Similar to .db files, these are randomly updated extremely frequently.
>>
>> It looks android doesn't need this, how about adding them under "#ifndef
>> WITH_ANDROID"?
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
>>> ---
>>>  mkfs/f2fs_format.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
>>> index 37d82c3..1c08e3e 100644
>>> --- a/mkfs/f2fs_format.c
>>> +++ b/mkfs/f2fs_format.c
>>> @@ -94,6 +94,11 @@ const char *media_ext_lists[] = {
>>>
>>>  const char *hot_ext_lists[] = {
>>>       "db",
>>> +
>>> +     /* Virtual machines */
>>> +     "vmdk", // VMware or VirtualBox
>>> +     "vdi", // VirtualBox
>>> +     "qcow2", // QEMU
>>>       NULL
>>>  };
>>>
>>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
