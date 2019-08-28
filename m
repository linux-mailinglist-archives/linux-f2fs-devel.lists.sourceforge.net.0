Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D73799F7F2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 03:41:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2mxU-0002zA-Nb; Wed, 28 Aug 2019 01:41:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2mxP-0002yv-FE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 01:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=99YeqSDoL1ehXm5BwjU/OTvmovuYfqJJxiZYYwO0p/s=; b=OYvlkzN8eDjEZhRoHRnR2/4GwF
 a9dF/xAEPRc5PBvhLr0a7Kf3XYsRVeUImrNPlQ23uquac0BEmfpZxtM5+3HEZ6hJYE81I5lvMKwlE
 m8k1PLv4hyZ99tJZDHScz9EyAh8PqlwmynhCZ7lPi7Ho9StBCPcLZ/MVSkB3L22uxD7s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=99YeqSDoL1ehXm5BwjU/OTvmovuYfqJJxiZYYwO0p/s=; b=SpoygFswD2zH2EMYi0EQHo50O0
 Sm31KBDt/kcttGOfr5elQ41P0P73jjnNMcJOlHG/Crk7Mc50iKmm5BSl17btUFtUSoXYwVI0qPW1D
 J8RnSJg9RBqVTt8atilRQbhwhNoa1eBskx3GhUZfFjEh5pEb4r6UVdDdo7usaLa0yFtE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2mxL-000IyY-BJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 01:41:07 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AC4A14872DF823F086EF;
 Wed, 28 Aug 2019 09:40:51 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 28 Aug
 2019 09:40:49 +0800
To: Chao Yu <chao@kernel.org>, Surbhi Palande <f2fsnewbie@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190823224045.26377-1-csurbhi@gmail.com>
 <3fdb292d-5eb7-5cb0-c9dd-ac1e98212efd@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e91a5e8b-b326-5e1f-31f8-dfe6551c08e3@huawei.com>
Date: Wed, 28 Aug 2019 09:40:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3fdb292d-5eb7-5cb0-c9dd-ac1e98212efd@kernel.org>
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
X-Headers-End: 1i2mxL-000IyY-BJ
Subject: Re: [f2fs-dev] [PATCH] Check all the data segments against all node
 ones.
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Surbhi,

I guess this patch is okay, please wait Jaegeuk to merge it.

On 2019/8/24 17:48, Chao Yu wrote:
> On 2019-8-24 6:40, Surbhi Palande wrote:
>> As a part of the sanity checking while mounting, distinct segment number
>> assignment to data and node segments is verified. Fixing a small bug in
>> this verification between node and data segments. We need to check all
>> the data segments with all the node segments.
>>
> 
> Fixes: 042be0f849e5f ("f2fs: fix to do sanity check with current segment number")

I meant it will be better to add this line to indicate which patch introduced
this bug, it can help LTS kernel maintainer to recognize and backport the
necessary fixing patches.

BTW, it needs to update commit tile as format of "f2fs: check all...."

Anyway, thanks for the patch!

Thanks,

> 
>> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
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
