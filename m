Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 346461A7A19
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2020 13:51:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOK60-0003ea-Ge; Tue, 14 Apr 2020 11:51:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jOK5z-0003eT-9V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 11:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XLxLAs/egI8vtYoB3v0LuXjZ1u+jzC+FQI98loMoHF4=; b=gMXHWLhmARtxJDjMi3yxkioSeV
 BVpHxXzv0dBjQnxdmJDDDUJitgc2GtAilj24rE75oj3LDKL+7tbEmnk013o0bKmKe9Ty3OSrUBK10
 m0CIwgx28etxKslnCkp6BYrS55AiR8gYqUYy3sx3FGkTroKdo1XrNMUR1RW2NgxGzeUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XLxLAs/egI8vtYoB3v0LuXjZ1u+jzC+FQI98loMoHF4=; b=KpETmYnqKe/k4uKlBcjKBkx6+E
 TfdDI+LMZYHWWp8WnzPpvpRqP8f/kLWcAporPYSGWpTsQG2x3OB5KhypvfTQmWX4gbUb/4BGyTiJJ
 nYa0M0wHEZm/eMqCqpYY/OtbFeiC/KPH76tZt3MgvxiaGPmFgPlRhX1B7Tb2J9CrDkzI=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOK5w-00FkNe-OE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 11:51:15 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 423F69CEE555CC6FCEA4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Apr 2020 19:50:59 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 14 Apr
 2020 19:50:54 +0800
To: Tim Walker <timtwalker@outlook.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <BN6PR02MB3379134F5821A8D6995E3084DEDA0@BN6PR02MB3379.namprd02.prod.outlook.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c81b3ef8-1266-829e-5276-a11e167810c7@huawei.com>
Date: Tue, 14 Apr 2020 19:50:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <BN6PR02MB3379134F5821A8D6995E3084DEDA0@BN6PR02MB3379.namprd02.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jOK5w-00FkNe-OE
Subject: Re: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

On 2020/4/14 12:23, Tim Walker wrote:
> Hello-
> 
> I am trying to determine how f2fs handles an offline (or read-only) zone when it is backed by a host-managed SMR HDD. I haven't been able to find any specific code path that places an offline zone into a separate list, or a path that checks the zone condition. Do we support a zone going read-only or offline? Thanks for the info.

So you mean different zones in SMR device can have different status? some
of them can be tagged as readonly? if my understanding is correct, f2fs
needs to handle such readonly zone correctly, e.g. write/discard IO should
be avoided being issued to those zones, right?

Thanks,

> 
> Best regards,
> Tim Walker
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
