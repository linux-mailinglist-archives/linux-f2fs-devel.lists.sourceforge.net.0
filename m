Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E9C2153F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jul 2020 10:26:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsMS1-0000dm-ML; Mon, 06 Jul 2020 08:26:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jsMRy-0000dc-Pl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NdObz4/eAlNw4xrxIyOT+aFxIW2uOyWubgwa1eXBb6E=; b=EEXwPY2rBJ2cXLnfk7w7D0sR6l
 wY0+FDFCTscbsLg2XEoq0EG3lBBQst/FbriVsn4/VLLSp0nuR5OfQZ8AwsfnUDK3NKp2SYj9xV6JO
 j6BQYH3HZCwh3hzQUP23KCHWDcRiq28aonQR1V32zr+nVa0qXt9ZkVfrIiVUKIH8BGVs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NdObz4/eAlNw4xrxIyOT+aFxIW2uOyWubgwa1eXBb6E=; b=hUV0h20VKPnZAu1agDrpMB9fIu
 jPD95pl0vCW+9TuFtMhTzn7Oc13AY+xNMjxF//OQtZS8BDbcCXpbkYeQow1hbUJk/R40H7IoxhQPz
 bc/C+lukeD2d1VsXhI/zdmR7dK4aXeqxtPrQ5jd6pVLfeIFIIWtuc3Kp4QH7/UqHLMRo=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsMRw-00EphR-4D
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jul 2020 08:26:06 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4FA6BC70C4CE2936EBA5;
 Mon,  6 Jul 2020 16:25:53 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 6 Jul 2020
 16:25:49 +0800
To: <jaegeuk@kernel.org>
References: <20200630100428.19105-1-yuchao0@huawei.com>
 <20200630100428.19105-5-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <84332ea5-f7b2-f996-31de-b6189c09f27d@huawei.com>
Date: Mon, 6 Jul 2020 16:25:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200630100428.19105-5-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsMRw-00EphR-4D
Subject: Re: [f2fs-dev] [PATCH RFC 5/5] f2fs: support age threshold based
 garbage collection
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

Jaegeuk,

This is a commercialized feature in huawei products for years, I think
it's time to try to upstream it, could you please take a look at this
idea, to see whether it could be a formal feature of f2fs?

On 2020/6/30 18:04, Chao Yu wrote:
> There are several issues in current background GC algorithm:
> - valid blocks is one of key factors during cost overhead calculation,
> so if segment has less valid block, however even its age is young or
> it locates hot segment, CB algorithm will still choose the segment as
> victim, it's not appropriate.
> - GCed data/node will go to existing logs, no matter in-there datas'
> update frequency is the same or not, it may mix hot and cold data
> again.
> - GC alloctor mainly use LFS type segment, it will cost free segment
> more quickly.
> 
> This patch introduces a new algorithm named age threshold based
> garbage collection to solve above issues, there are three steps
> mainly:
> 
> 1. select a source victim:
> - set an age threshold, and select candidates beased threshold:
> e.g.
>  0 means youngest, 100 means oldest, if we set age threshold to 80
>  then select dirty segments which has age in range of [80, 100] as
>  candiddates;
> - set candidate_ratio threshold, and select candidates based the
> ratio, so that we can shrink candidates to those oldest segments;
> - select target segment with fewest valid blocks in order to
> migrate blocks with minimum cost;
> 
> 2. select a target victim:
> - select candidates beased age threshold;
> - set candidate_radius threshold, search candidates whose age is
> around source victims, searching radius should less than the
> radius threshold.
> - select target segment with most valid blocks in order to avoid
> migrating current target segment.
> 
> 3. merge valid blocks from source victim into target victim with
> SSR alloctor.
> 
> Test steps:
> - create 160 dirty segments:
>  * half of them have 128 valid blocks per segment
>  * left of them have 384 valid blocks per segment
> - run background GC
> 
> Benefit: GC count and block movement count both decrease obviously:
> 
> - Before:
>   - Valid: 86
>   - Dirty: 1
>   - Prefree: 11
>   - Free: 6001 (6001)
> 
> GC calls: 162 (BG: 220)
>   - data segments : 160 (160)
>   - node segments : 2 (2)
> Try to move 41454 blocks (BG: 41454)
>   - data blocks : 40960 (40960)
>   - node blocks : 494 (494)
> 
> IPU: 0 blocks
> SSR: 0 blocks in 0 segments
> LFS: 41364 blocks in 81 segments
> 
> - After:
> 
>   - Valid: 87
>   - Dirty: 0
>   - Prefree: 4
>   - Free: 6008 (6008)
> 
> GC calls: 75 (BG: 76)
>   - data segments : 74 (74)
>   - node segments : 1 (1)
> Try to move 12813 blocks (BG: 12813)
>   - data blocks : 12544 (12544)
>   - node blocks : 269 (269)
> 
> IPU: 0 blocks
> SSR: 12032 blocks in 77 segments
> LFS: 855 blocks in 2 segments


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
