Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D46822D387
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2019 03:57:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hVnqI-0002gl-RQ; Wed, 29 May 2019 01:57:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hVnqH-0002ge-QI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 May 2019 01:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V178WAl3NrPWmdPRZ/nB8kUme4waUfo5QkstQ1h6jzo=; b=h/5jobVT1x+xSAo63qdy9F/bsH
 MVkYxwTC0qQcqJppqyrNNRSrQaBFC2wmtLdVOJHb+3oFjcflGJunXnYlWsTeTskGJ4RP/ZthM5+uU
 IH04qXgvYVZwvtGF7qu2U1s+15rZklAOVrx0vqd2yBnjzLQKt5f7NMMir/8tY/mznFDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V178WAl3NrPWmdPRZ/nB8kUme4waUfo5QkstQ1h6jzo=; b=Iztwh0yKTjlZzFXmyP8Tms1arS
 TjhVEVV0HTkWbSySxr2fDjHmLhdlsz1heKdZ+Rm4qSvh40dPB9FbbmjFE5UV1DeGCCHq3xepp1usz
 Khun/tvAyR5ybIV3A90IfN9osRpzKicxoXvTA62legOy48x+Xn84egZrK6ULGkzrxGEI=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hVnq4-002o3l-4e
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 May 2019 01:57:25 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 496F474DC45634C33274
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2019 09:57:04 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 29 May
 2019 09:57:03 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>
References: <20190416064355.29712-1-qkrwngud825@gmail.com>
 <20190416064355.29712-2-qkrwngud825@gmail.com>
 <afdf2ade-6cb7-a335-3584-22bd2681e502@huawei.com>
 <CAD14+f0F0aeqaJMFqoQTBY7wjqAF2H98+Ruvsd3Xd_Wuua8mkw@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e86cf461-42e0-197e-82de-e7acbf4bfe62@huawei.com>
Date: Wed, 29 May 2019 09:57:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f0F0aeqaJMFqoQTBY7wjqAF2H98+Ruvsd3Xd_Wuua8mkw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hVnq4-002o3l-4e
Subject: Re: [f2fs-dev] [PATCH 2/2] mkfs.f2fs: make the default extensions
 list much more sensical
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

On 2019/5/28 18:28, Ju Hyung Park wrote:
> Hi Chao,
> 
> On Tue, May 28, 2019 at 7:19 PM Chao Yu <yuchao0@huawei.com> wrote:
>> How about adding below extensions:
>>
>>         "zip",
>>         "bin",
>>         "dat",
>>         "txt",
> 
> zip is capable of random updates. I didn't add bz2 for the same reason.
> But I do agree that most users won't be constantly updating zip files.

Yup, I think the most possible case is using zip/bz2 to pack log files or for
some downloaded resources, which should be write-once file.

> 
> I personally use my Android device with zip treated as cold, but I'm
> not sure if it makes good sense to make it as the default that's
> supposed to run under various scenarios.
> 
> How much different is the random write performance from cold to hot?

We use different write policies: trigger OPU for hot data mostly, and IPU for
cold data, so performance is quite relating to the test scenario.

> 
> But I'm against the idea of adding the rest 3 extensions.
> "bin" and "dat" is way too generic. You wouldn't know if a program
> happens to heavily update files named .bin/.dat.
> 
> For txt, it won't be uncommon for a user to update it frequently.
> Moreover, most txt size is pretty small anyways.

I think your concern is right, those extensions are too common and it needs to
consider various platforms instead of just android. So, let's leave those three
extensions.

Thanks,

> 
> And finally, circling back to your original concern, we should be more
> careful adding extensions as there's a limit.>
> Thanks.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
