Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 620C02D0D07
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 10:31:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmCrU-0008RY-11; Mon, 07 Dec 2020 09:31:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmCrN-0008Ql-6O
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h9YVClE/miDiZnWJMO+XiiHYXrpWW9OUgA7Lcl1VdDo=; b=UWUz0v2X7FPmcLn3ywurr5PA12
 XsERyhhVhmAUVXcaG/Na6MoQMS8SLb9mgiNbdru8Puys0meykb8VoWKeKTNFNb4AZcDqbtAfoYwBW
 iioglHdvk0Cz4zGBefcDpyj00uZqOiygei73hYU+PEV36bayd6fHiDEwOLYgLwJPMLdA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h9YVClE/miDiZnWJMO+XiiHYXrpWW9OUgA7Lcl1VdDo=; b=Lx8Wca3xpqoJu5YH7c9hYrkN6r
 VaTM2wZGe5895CbiHavKXvg6uP2J+uudAgzn/ZytwjIfZs8AmQKcLiVcMp+EDTov6uiDS1KqvtvMt
 z5Wbridujkz2VQ1wgPGAlZTvy4Nz5QnFlS+Mf/5X6uDauSo2DKxwijP+aHJTC+cfgEJk=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmCrI-001l16-DJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:31:09 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqJ290zc7zhnlt
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Dec 2020 17:30:25 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 7 Dec 2020
 17:30:47 +0800
To: Jack Qiu <jack.qiu@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20201207102407.25154-1-jack.qiu@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cc7ff864-f7ab-9bbe-5013-337734987b2b@huawei.com>
Date: Mon, 7 Dec 2020 17:30:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201207102407.25154-1-jack.qiu@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmCrI-001l16-DJ
Subject: Re: [f2fs-dev] [PATCH v2 0/3] f2fs: inline: fix minor bugs in
 f2fs_recover_inline_data
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jack,

I think you should add my reviewed-by tag in patch 1/3 and 3/3
when you send v2 patchset, otherwise, I may need to reply again,
that's unneeded.

On 2020/12/7 18:24, Jack Qiu wrote:
> Jack Qiu (3):
>    f2fs: inline: correct comment in f2fs_recover_inline_data
>    f2fs: inline: remove redundant FI_DATA_EXIST set
>    f2fs: inline: fix wrong inline inode stat
> 
>   fs/f2fs/inline.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --
> 2.17.1
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
