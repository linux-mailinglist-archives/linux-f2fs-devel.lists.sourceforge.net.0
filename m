Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6234EE0041
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 11:04:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMq5p-00055T-OX; Tue, 22 Oct 2019 09:04:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iMq5m-00054u-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:04:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HqL/WQ/YDk6JTEbFVMauam2jh5E93Bb48dIxrasgM+8=; b=HDqkGw9xwWVNzwIgTimUt5Npe0
 jjWmzZR4gG+fUNK5+6pQZoQdg+FIW9CwEqHcRpF78cWbl20+JPjAyr6rlX8RtwuWI+0LK9Ya1dV+W
 ZYhN6nvJ3G4I/3KsXw+2oBK2Ch//ZJJHhPP2jRzibAP5NloY6qPjwGhAkCraFNc47t9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HqL/WQ/YDk6JTEbFVMauam2jh5E93Bb48dIxrasgM+8=; b=X+W5eGBTSpAbyBGw4dHOEZHRPI
 u6if40AsSCa53nn2nwm7flbA73sy2L9Shzs8kTfPs5ILEYmKOJA4nnLZKsDbUZyfzxYEzpRyv6+qU
 7YLxT9CztJ2kdupiDGQRI9aX6lT5+xl+jtDWmBm7FOjaugC2dx7ZyoXLR5QTDFkLng+M=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMq5k-00BFXN-BX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:04:38 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 69624ECA4872FC37B7AD;
 Tue, 22 Oct 2019 17:04:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 22 Oct
 2019 17:04:25 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-5-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4c9948ad-af34-b024-9764-c14d50267147@huawei.com>
Date: Tue, 22 Oct 2019 17:04:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191018063740.2746-5-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iMq5k-00BFXN-BX
Subject: Re: [f2fs-dev] [PATCH v5 4/8] fsck: Find free zones instead of
 blocks to assign to current segments
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

On 2019/10/18 14:37, Shin'ichiro Kawasaki wrote:
> When fsck needs to assign a new area to a curreng segment, it calls
> find_next_free_block() function to find a new block to assign. For zoned
> block devices, fsck checks write pointer consistency with current
> segments' positions. In case a curseg is inconsistent with the
> write pointer of the zone it points to, fsck should assign not a new free
> block but a new free zone/section with write pointer at the zone start,
> so that next write to the current segment succeeds without error.
> 
> To extend find_next_free_block() function's capability to find not only
> a block but also a zone/section, add new_sec flag to
> find_next_free_block() function. When new_sec flag is true, skip check
> for each block's availability so that the check is done with unit of
> section. Note that it is ensured that one zone has one section for f2fs
> on zoned block devices. Then the logic to find a new free section is good
> to find a new free zone.
> 
> When fsck target devices have ZONED_HM model, set new_sec flag true to
> call find_next_free_block() from move_curseg_info(). Set curseg's
> alloc_type not SSR but LFS for the devices with ZONED_HM model, because

I think this is correct, but just to declear, SSR allocator on a freed section
will also allocate data block sequentially.

> SSR block allocation is not allowed for zoned block devices. Also skip
> relocate_curseg_offset() for the devices with ZONED_HM model for the
> same reason.
> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
