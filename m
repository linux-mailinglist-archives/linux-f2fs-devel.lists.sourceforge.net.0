Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5A9C9FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2019 09:17:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i29Fr-0001tQ-A0; Mon, 26 Aug 2019 07:17:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i29Fq-0001tH-3C
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 07:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xuac1sAokhm24Ya4Ff8Dt3resrf9ItgrGBls8W1Xq/w=; b=YwsKqWVJNKlG4zQxVYohzQ3VCh
 /aJMAebjlVxz60muTWfQyIGs9bI+2tWetDYeLdrLkeF9taB7+zXSd/ogZB3qdJ10Ec/xnFxSGD6xQ
 KVPycPs7HAifIu9ltcnzB9Lz5wv+T5bQZVoc3p0hqThTN+c8uE0JSJ4FtnC0U2Z7hpxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xuac1sAokhm24Ya4Ff8Dt3resrf9ItgrGBls8W1Xq/w=; b=MVEvXIM6o8tu8aA4U6nw1njSdJ
 xqeDjr5IV9tU64QC1pEcLqffTYn+P1xVsrRnxURGKZcphYACqNTC2DZccjacbCr78ZV2R2tDlCOpm
 dV10CAhdwpgOX4K70TzyxNbe/gFWH2rA5dnqT8q8L1uhU6yANGvfB9UnufNnqORA+ISo=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i29Fn-00FxZA-MF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 07:17:30 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 7B039DC4DF080FB5E485;
 Mon, 26 Aug 2019 15:17:17 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 26 Aug
 2019 15:17:15 +0800
To: Ju Hyung Park <qkrwngud825@gmail.com>, Chao Yu <chao@kernel.org>
References: <CAD14+f1YGinNQuVKc371vgJGJaaqYWqcaP6WwSuP1mwf-D2Tzw@mail.gmail.com>
 <5696f35e-d91a-801a-d2bb-fbbc188bbf4c@huawei.com>
 <CAD14+f3a1Uifebv8cybJOW8FrCnsvbrCCbT+JupxRVu3kpji9w@mail.gmail.com>
 <baa8b0ce-99b4-4f74-ff7d-e204bced4168@kernel.org>
 <CAD14+f1vkJtPpUEU1MJbxkZRRjR5Jqa8WWAGKBb2Xw4pPS3WRg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c40b6c29-3684-918f-0d27-4da9f0c25159@huawei.com>
Date: Mon, 26 Aug 2019 15:17:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAD14+f1vkJtPpUEU1MJbxkZRRjR5Jqa8WWAGKBb2Xw4pPS3WRg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i29Fn-00FxZA-MF
Subject: Re: [f2fs-dev] f2fs: dirty memory increasing during gc_urgent
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

On 2019/8/25 19:06, Ju Hyung Park wrote:
> Hi Chao,
> 
> On Sat, Aug 24, 2019 at 12:52 AM Chao Yu <chao@kernel.org> wrote:
>> It's not intentional, I failed to reproduce this issue, could you add some logs
>> to track why we stop urgent GC even there are still dirty segments?
> 
> I'm pretty sure you can reproduce this issue quite easily.

Oh, I just notice that my scope of data sample is too small.

> 
> I can see this happening on multiple devices including my workstation,
> laptop and my Android phone.
> 
> Here's a simple reproduction step:
> 1. Do `rm -rf * && git reset --hard` a few times under a Linux kernel Git
> 2. Do a sync
> 3. echo 1 > /sys/fs/f2fs/dev/gc_urgent_sleep_time
> 4. echo 1 > /sys/fs/f2fs/dev/gc_urgent
> 5. Once the number on "GC calls" doesn't change, look at "Dirty" under
> /sys/kernel/debug/f2fs/status. It's close to 0.
> 6. After doing a 'sync', "Dirty" increases a lot.
> 7. Remember the number on "GC calls" and run 3 and 4 again.
> 8. The number of "GC calls" increases by a few hundreds.

Thank for provided test script.

I found out that after data blocks migration, their parent dnodes will become
dirty, so that once we execute step 6), some node segments become dirty...

So after step 6), we can run 3), 4) and 6) again, "Dirty" will close to zero,
that's because node blocks migration will not dirty their parent
(indirect/didirect) nodes.

Thanks,

> 
> Thanks.
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
