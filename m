Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD786E0085
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 11:17:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMqIO-0001sC-2k; Tue, 22 Oct 2019 09:17:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iMqIN-0001ry-6y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ic832CkLxvuZhWZ0myttdJs8Aqt8/7Gfen4uZUV18jY=; b=k0oNHE1ZuMuIBb2wCEDJJl7mTm
 lw09+YPClQG1Q2FEOAt6CFEkIfvCRECjso8vY0xmMPNuUNjqeBUW/hfOYX8fTKGXMmhiINjrJ7EYM
 kRWzT/FyAMrfW7Qj3g1FYX8ErqggUBOJX6ohjc1okzH6xS84Pl+QdF480KIIjsJEKZgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ic832CkLxvuZhWZ0myttdJs8Aqt8/7Gfen4uZUV18jY=; b=cqLcUj5m2rghWGGJ03kJFHeG5Z
 GVNjNxJg4+ecf0Fx8JPSivIWdwcHP2KQQIcsc6t51qNEHCi9ONHDxlAbfY+pXn6mbwsa6SfzmnOsE
 KB+XW8CeUUyzuvoBsrdmfJgks35Fbo/OZv4L2F6s0AemKMSNrIlr3wCWm4CV3PqT3jqo=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMqIL-00Gb3o-BN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 09:17:39 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6AC193647DDDA35DA75D;
 Tue, 22 Oct 2019 17:17:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 22 Oct
 2019 17:17:27 +0800
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20191018063740.2746-1-shinichiro.kawasaki@wdc.com>
 <20191018063740.2746-6-shinichiro.kawasaki@wdc.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8bd9fb3f-5644-0d8c-ff28-ca98184429d8@huawei.com>
Date: Tue, 22 Oct 2019 17:17:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191018063740.2746-6-shinichiro.kawasaki@wdc.com>
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
X-Headers-End: 1iMqIL-00Gb3o-BN
Subject: Re: [f2fs-dev] [PATCH v5 5/8] fsck: Introduce
 move_one_curseg_info() function
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
> When fsck updates one of the current segments, update_curseg_info() is
> called specifying a single current segment as its argument. However,
> update_curseg_info() calls move_curseg_info() function which updates all
> six current segments. Then update_curseg_info() for a single current
> segment moves all current segments.
> 
> This excessive current segment move causes an issue when a new zone is
> assigned to a current segment because of write pointer inconsistency.
> Even when a current segment has write pointer inconsistency, all other
> current segments should not be moved because they may have fsync data
> at their positions.
> 
> To avoid the excessive current segment move, introduce
> move_one_curseg_info() function which does same work as
> move_curseg_info() only for a single current segment. Call
> move_one_curseg_info() in place of move_curseg_info() from
> update_curseg_info().

Good catch!

> 
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
