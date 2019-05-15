Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A67561E6CD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 04:08:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQjLX-00048K-1E; Wed, 15 May 2019 02:08:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hQjLV-00048D-T8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 02:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQ1Qb8gQ38WscQsq0rOB+S4fuGG1p44PiyNgFiYe7Os=; b=FiNHLV9305+sB8I4gYjsN2QgXp
 6vbZ/7nN/2uGbGeF7H//G/7aKxUIuI9zIsrqUg5swOmv98ih2eVKuYR/v6Ncz2G14rvoX7RCYlHVq
 viU/scK0gkbUuPI9L3BqbLFeZxfmFw0OlopgzWkXVcA/JLbldmcj34QF0ay6O9c2MURw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OQ1Qb8gQ38WscQsq0rOB+S4fuGG1p44PiyNgFiYe7Os=; b=DgrJJ5WVf82J6L9TuOGQ/0YOWr
 veqA0oeJpv5wF2TNJ6YNicxYhMDNvD/o5wIHob8UBxX3ARFOiW5UqDbLSRP1XVtPAX9npLqFwDk9L
 Bz/SWsM7Fle0pzmaDMIKvJeHNWnrp8MfGWLYfiFM/+4x8vnQcmZmDc0Gi6oPxLVBKtu8=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQjLT-00HALC-Re
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 02:08:41 +0000
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id A3B85E94C8F26417C5B2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 May 2019 10:08:30 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 15 May 2019 10:08:30 +0800
Received: from [10.134.22.195] (10.134.22.195) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 15 May 2019 10:08:28 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190514063623.57162-1-qkrwngud825@gmail.com>
 <81acd624-8698-a584-f298-7e64ad77752d@huawei.com>
 <CAD14+f0Zia3oAi+QO+wCBrbV_=csp1SWB4BE7yN0h+=paZpg=w@mail.gmail.com>
 <8cd6214c-d15d-d6c6-224e-69ad7936605d@huawei.com>
 <CAD14+f2G5M7qqEvztd7nC=MNvSbLtkRKzNA89zGdYSb1FgP6LQ@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <7d430871-ebae-4ff8-ebeb-1721b8bb90a5@huawei.com>
Date: Wed, 15 May 2019 10:08:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f2G5M7qqEvztd7nC=MNvSbLtkRKzNA89zGdYSb1FgP6LQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-ClientProxiedBy: dggeme761-chm.china.huawei.com (10.3.19.107) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
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
X-Headers-End: 1hQjLT-00HALC-Re
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: remove sleep_time under gc_urgent
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Ju Hyung,

On 2019/5/14 19:30, Ju Hyung Park wrote:
> Hi Chao,
> 
> On Tue, May 14, 2019 at 8:19 PM Chao Yu <yuchao0@huawei.com> wrote:
>>> I've been using this(with a slightly different code) for years and yet to notice
>>> any spikes in lags/slowdowns. Worst scenario, I'd just have to deal with an
>>> added split second(100ms max?) delay in screen wake-up.
>>
>> I'm not sure about why this happened... maybe you need to do some test to
>> analyse the root cause of it, filesystem/device fragment? too many undiscard
>> space? or non-storage issue?
> 
> Um, I'm not sure you understood what I said.
> What I meant is that I haven't found any issues with using an approach
> like this(gc_urgent with 1ms sleep intervals) for years on various
> Android devices.

Ah, sorry, I misread what you said.

> 
>> I agreed that it should done as soon as possible, but it needs to consider IO
>> race in between Apps after screen wake-up and BGGC to avoid potential ANR.
> 
> I actually need to check whether vold turns off gc_urgent immediately
> after screen turns itself back on.
> I don't think we need to take potential ANR in to account *if* vold
> stops gc_urgent right after screen-on. What do you think?

What do you mean, I didn't catch it...

> 
>> It's userspace strategy, we can change both of them
>> (vold_wait_time/gc_urgent_sleep_time) in userspace if current value doesn't make
>> any sense.
> 
> Even the user can set the tunables themselves, the default should be
> sensical imo.

Agreed, how about adjusting this default value according device type, for fast
device, like SSD, we can set default interval to very small value.

Maybe we can implement this base on below commit if you agreed.

f2fs: support tunning for multiple kind of storage device

Thanks,

> An "urgent" GC that only GCs up-to 2 segments per second doesn't sound
> that "urgent" :p
> 
> Thanks.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
