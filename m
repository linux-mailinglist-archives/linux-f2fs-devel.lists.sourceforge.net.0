Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5B95AC5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2019 11:17:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i00GO-0000iO-I7; Tue, 20 Aug 2019 09:17:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i00GN-0000iG-24
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 09:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=isMFtwz7KabAHoGlJlcsmxIDUiH5y82m7cI138msfDM=; b=F31kAjBi7qjA0XcryPwTBgi+m2
 5BDBpn4lIgf8L8da8JAMIjervy1M4ek1jUc8s/SbsX47rR79RX7c/dCtf+CEuv+RJoAlCCSs1wKdw
 JdkWsspGVMWfQ1wT6BRICbsedJuxcDH0FdhoWu7BwzhU5J4AsNJkFRN0A4Artg5OZrvg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=isMFtwz7KabAHoGlJlcsmxIDUiH5y82m7cI138msfDM=; b=MhuiWLM221pG+BxAkhKtTgDNuX
 snUNcHIjXPK3CSz6aAcBKIBnRGSxPIINgerEdWQjJmL3bz+jAcuZXOLqHHeyURKQgA+QwrFhJ5KHU
 A2wroVWPITRQJOPNQjG4xlOJY0ZUyDqF+8TbdBuNDF6+Nh2pWkSiIpwvYqerYoT9BFKU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i00GL-00CyIP-PL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Aug 2019 09:17:10 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BD8848EC234F8254D4D4;
 Tue, 20 Aug 2019 17:17:02 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 20 Aug
 2019 17:16:59 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190816030334.81035-1-yuchao0@huawei.com>
 <3349ceea-85ac-173a-81a4-1188ce3804ca@huawei.com>
 <20190820010000.GA45681@jaegeuk-macbookpro.roam.corp.google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <74d1d451-e2a7-dc0f-a218-a05cd4cdcfa8@huawei.com>
Date: Tue, 20 Aug 2019 17:16:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190820010000.GA45681@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i00GL-00CyIP-PL
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid data corruption by
 forbidding SSR overwrite
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

On 2019/8/20 9:00, Jaegeuk Kim wrote:
> On 08/19, Chao Yu wrote:
>> On 2019/8/16 11:03, Chao Yu wrote:
>>> There is one case can cause data corruption.
>>>
>>> - write 4k to fileA
>>> - fsync fileA, 4k data is writebacked to lbaA
>>> - write 4k to fileA
>>> - kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet
>>> - write 4k to fileB
>>> - kworker flush 4k to lbaA due to SSR
>>> - SPOR -> dnode with lbaA will be recovered, however lbaA contains fileB's
>>> data
>>>
>>> One solution is tracking all fsynced file's block history, and disallow
>>> SSR overwrite on newly invalidated block on that file.
>>>
>>> However, during recovery, no matter the dnode is flushed or fsynced, all
>>> previous dnodes until last fsynced one in node chain can be recovered,
>>> that means we need to record all block change in flushed dnode, which
>>> will cause heavy cost, so let's just use simple fix by forbidding SSR
>>> overwrite directly.
>>>
>>
>> Jaegeuk,
>>
>> Please help to add below missed tag to keep this patch being merged in stable
>> kernel.
>>
>> Fixes: 5b6c6be2d878 ("f2fs: use SSR for warm node as well")
> 
> Done.

Thanks! :)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
