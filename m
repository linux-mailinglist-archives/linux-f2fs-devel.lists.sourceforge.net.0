Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A4D1086AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 04:05:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZ4h8-0005vs-I9; Mon, 25 Nov 2019 03:05:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iZ4h7-0005vi-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 03:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YF5JcW8uKs/OEdmEI+zpQEP1nRScuAesjiGp00bT/40=; b=EDofcrOI6FXVWQqMJC8F8aeoPR
 l+yHNNYn3d7PxeKLTiEgYA1r9003UL4dG4tOXO2/zixgtOxcRr/CUOMd0aJ0Pg0u9ybzM+e267N11
 REfku7x++R7VgUvzhJblP6vNBcnQ4qRqBBc9cph4mxHAlu7JEQ8z9h/f9ML7+rLY6M+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YF5JcW8uKs/OEdmEI+zpQEP1nRScuAesjiGp00bT/40=; b=lRXDPITUskdjL8pnrRiyGMxKKK
 PwFp8nrsbymFTjCf8HGr+EYD5DuTQXqvAWQKwxbgN9c0Hnkoezrpwtye+POCi2m8n4ubx0zvRypLf
 pwGacLwTgvsEmS/7U1Ywxczb50NOxy2DkMcM/WuJtq75RJaytCAfvgigguwh+dItcMDo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZ4h3-00Cnmr-RP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 03:05:45 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CCC45D3BB31B1C622EB1;
 Mon, 25 Nov 2019 11:05:34 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 25 Nov
 2019 11:05:34 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191114044454.200461-1-shinichiro.kawasaki@wdc.com>
 <20191114044454.200461-4-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0e589a74-26f3-fc55-f067-1ef4adc62d04@huawei.com>
Date: Mon, 25 Nov 2019 11:05:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191114044454.200461-4-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iZ4h3-00Cnmr-RP
Subject: Re: [f2fs-dev] [PATCH v7 3/8] libf2fs_zoned: Introduce
 f2fs_reset_zone() helper function
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/11/14 12:44, Shin'ichiro Kawasaki wrote:
> To prepare for write pointer consistency fix by fsck, add
> f2fs_reset_zone() helper function which calls RESET ZONE command. The
> function is added to lib/libf2fs_zoned which gathers zoned block device
> related functions.
> 
> When f2fs-tools are built without blkzoned.h kernel header, the helper
> function f2fs_reset_zone() prints an error message as other helper
> functions in lib/libf2fs_zoned print. To make the message consistent
> through the all helper functions, modify message strings in
> f2fs_check_zones() and f2fs_reset_zones().
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
