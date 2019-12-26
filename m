Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9E12AB56
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2019 10:39:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikPbg-0001Tf-EH; Thu, 26 Dec 2019 09:39:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ikPbd-0001TX-9V
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 09:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6tIt2XNyhYdchqJJvZS2jYqA2NHWUEiHx8zQUCxlU0s=; b=HuE/m5Fm3xpbN2/GlG0aYps0Fa
 HMmcg5EHVyHPJdF8BYasrmsAIArHg6N9Ipl7QtA5W314y/ek/6HtNp2crUAVAzPf8NEdkfKBy2pAE
 3pjJwirdnzcQPR8ahAO5TE6eDguRjJr8ccnfv44eGxEwv5kNI0jSB+fyqV3L/zs8A2wU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6tIt2XNyhYdchqJJvZS2jYqA2NHWUEiHx8zQUCxlU0s=; b=JCGYbljbyseKyk0kmDBq7PQ88f
 tctZKSU1goG/8Y6AsuwRIJ/Eo/O31dtXOKOAeaFwUYnirPXGeiwE/Y5Sfm67T+MBxmKZc4IluDsda
 0gA8h0PzkLgiv7wn/bJoxI5OLicURUZfyNB7OeoawQpjSK4tfjiOX5FXjAoFj8m5v6J4=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ikPbb-00FZpD-0j
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 09:38:57 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 61E2EAFD2DD65EB152BF;
 Thu, 26 Dec 2019 17:38:47 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 26 Dec
 2019 17:38:43 +0800
To: Vyacheslav Dubeyko <slava@dubeyko.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>
References: <20191223040020.109570-1-yuchao0@huawei.com>
 <CAMuHMdUDMv_mMw_ZU4BtuRKX1OvMhjLWw2owTcAP-0D4j5XROw@mail.gmail.com>
 <1cc2d2a093ebb15a1fc6eb96d683e918a8d5a7d4.camel@dubeyko.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8a196bfe-666b-3d7b-e78b-8d3a9bcca978@huawei.com>
Date: Thu, 26 Dec 2019 17:38:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1cc2d2a093ebb15a1fc6eb96d683e918a8d5a7d4.camel@dubeyko.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ikPbb-00FZpD-0j
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce DEFAULT_IO_TIMEOUT_JIFFIES
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
Cc: Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/12/25 17:58, Vyacheslav Dubeyko wrote:
> On Mon, 2019-12-23 at 09:41 +0100, Geert Uytterhoeven wrote:
>> Hi,
>>
>> CC linux-fsdevel
>>
>> On Mon, Dec 23, 2019 at 5:01 AM Chao Yu <yuchao0@huawei.com> wrote:
>>> As Geert Uytterhoeven reported:
>>>
>>> for parameter HZ/50 in congestion_wait(BLK_RW_ASYNC, HZ/50);
>>>
>>> On some platforms, HZ can be less than 50, then unexpected 0
>>> timeout
>>> jiffies will be set in congestion_wait().
>>>
> 
> 
> It looks like that HZ could have various value on diferent platforms.
> So, why does it need to divide HZ on 50? Does it really necessary?

I guess this code was copied from other filesystems, I have no idea why
we should use HZ/50 as timeout interval value.

> Could it be used HZ only without the division operation?

Actually, as Geert pointed out, we can handle that zeroed value parameter
inside congestion_wait() to cover all filesystems use cases.

Thanks,

> 
> Thanks,
> Viacheslav Dubeyko.
> 
> 
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
