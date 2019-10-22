Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F26BFDFF77
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 10:33:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMpbm-0008GO-4n; Tue, 22 Oct 2019 08:33:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iMpbk-0008GD-ND
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 08:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pqyWbtV0s8tn9e+uDwCF18Vw0p9KcyHu6ZJ5HLO16ng=; b=Yj4Fngb/QIg+oXre114Y8pX+XL
 B9G5+TBx7peezcQkeb5rwg/EZ3CYSAhVWpDD6loDA9XreFLTEZGpY3Jy17OktRmZmwLrU+VYL4TOc
 kueQQgvGJfMc+dqkquIvTXMGHBW1RSMHeAZLoQ9Ll4bfQD7Ceofpjwz/uZOSMR41D+x8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pqyWbtV0s8tn9e+uDwCF18Vw0p9KcyHu6ZJ5HLO16ng=; b=WrPADdUVvmA1ouFoSTVaqy71eV
 9p31uyErBYOVvV/N7w/XgG/ydYuDT2G/82QcJmyYs9EOqpcZauQrBG+JtAjb/t2UsVJFNPLKCzoaG
 0sIKeCTuLV5qAOMMXh1hefbXldvoSTS3JgzYNwdb0qeYnVj03TXGLVESLAUMafkFO4Rc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMpbi-00GblT-Al
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 08:33:36 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id DD972F6525E646930263;
 Tue, 22 Oct 2019 16:33:25 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 22 Oct
 2019 16:33:17 +0800
To: Lihong Kou <koulihong@huawei.com>, <jaegeuk@kernel.org>
References: <1571220689-95274-1-git-send-email-koulihong@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <a2589400-b296-e4c4-8230-1bfd7620cc5f@huawei.com>
Date: Tue, 22 Oct 2019 16:33:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1571220689-95274-1-git-send-email-koulihong@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iMpbi-00GblT-Al
Subject: Re: [f2fs-dev] [PATCH v2 0/2] add a new fio cache for IPU.
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
Cc: zengguangyue@hisilicon.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Lihong,

On 2019/10/16 18:11, Lihong Kou wrote:
> Introdce a new fio cache for IPU.
> After commit 8648de2c581(f2fs: add bio cache for IPU)
> in the mainline, we still have the problem in SQLite. So I
> reuse the fio data structs to cache the mergeale write IO in
> wirtepages().

I have discussed with Jaegeuk about this in below thread,

https://lore.kernel.org/linux-f2fs-devel/20190219081529.5106-1-yuchao0@huawei.com/T/#md5d6dcf60052201994e6df4a915a07a04869d427

IMO, we need a per data type global list to cache all bios to enhance its
scalability, as single bio cache may suffer performance regression due to race
of multiple threads, I've sent a patch [1] for that previously.

For any thoughts, we can discuss in above thread.

[1]
https://lore.kernel.org/linux-f2fs-devel/20190930105325.42870-1-yuchao0@huawei.com/T/#u

Thanks,

> 
> Lihong Kou (1):
>   Revert "f2fs: add bio cache for IPU"
> 
> Lihong Kou (1):
>   f2fs: introduce a new fio cache for IPU.
> 
>  fs/f2fs/checkpoint.c |  1 +
>  fs/f2fs/data.c       | 93 ++++++++--------------------------------------------
>  fs/f2fs/f2fs.h       |  4 +--
>  fs/f2fs/segment.c    | 22 ++++++-------
>  fs/f2fs/super.c      |  2 ++
>  5 files changed, 29 insertions(+), 93 deletions(-)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
