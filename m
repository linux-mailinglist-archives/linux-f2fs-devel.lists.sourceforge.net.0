Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F071116B62
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2019 11:48:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieGau-00040M-6s; Mon, 09 Dec 2019 10:48:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ieGas-000404-R9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A/bTw8CoFTrTMQ82hUUAG7XUgxo/wORCh4QySCblu3A=; b=cZ3SsHzrvXCmm9SGPu6PP0R4I+
 j5n8XZ0nptmCe7mQmiMTFg6L6YXczk595eQdgNl6drL4i+3srSnRsZRkhv1nC8Pzz8h2PImfSzMJN
 900ub6x1ElHscg03f3RaU0+pgys4OSFaazbKEbkj4ONkoHi4ILxZEkfb+D4res5w2czI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A/bTw8CoFTrTMQ82hUUAG7XUgxo/wORCh4QySCblu3A=; b=BVJecCRCrDR93WKqEdZ9wBJOBo
 CjZ9i/knIKHN2Jmfm2gzmZq4Ca2ANf6t8/OvYOjccvs4xhYY2shbX1f0tmUt4ZTXLxjEDzKOPVUEy
 MmIDfbbZ/Z5bwxYl+o2RWEZNSl/0YLHJekLZ4QJIYN/dhintMzf8aFeHhJsFteptMvak=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieGao-00FMoI-Hs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Dec 2019 10:48:46 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2ADC0C36F9219C8801F8;
 Mon,  9 Dec 2019 18:48:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Dec 2019
 18:48:27 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191209104445.216327-1-shinichiro.kawasaki@wdc.com>
 <20191209104445.216327-2-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0614b871-9019-de6d-3da0-5a1676c656b7@huawei.com>
Date: Mon, 9 Dec 2019 18:48:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191209104445.216327-2-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ieGao-00FMoI-Hs
Subject: Re: [f2fs-dev] [PATCH v5 1/2] f2fs: Check write pointer consistency
 of open zones
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

On 2019/12/9 18:44, Shin'ichiro Kawasaki wrote:
> On sudden f2fs shutdown, write pointers of zoned block devices can go
> further but f2fs meta data keeps current segments at positions before the
> write operations. After remounting the f2fs, this inconsistency causes
> write operations not at write pointers and "Unaligned write command"
> error is reported.
> 
> To avoid the error, compare current segments with write pointers of open
> zones the current segments point to, during mount operation. If the write
> pointer position is not aligned with the current segment position, assign
> a new zone to the current segment. Also check the newly assigned zone has
> write pointer at zone start. If not, reset write pointer of the zone.
> 
> Perform the consistency check during fsync recovery. Not to lose the
> fsync data, do the check after fsync data gets restored and before
> checkpoint commit which flushes data at current segment positions. Not to
> cause conflict with kworker's dirfy data/node flush, do the fix within
> SBI_POR_DOING protection.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
