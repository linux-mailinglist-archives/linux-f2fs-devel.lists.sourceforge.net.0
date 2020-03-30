Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3511976BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Mar 2020 10:40:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jIpxz-00043s-R6; Mon, 30 Mar 2020 08:40:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jIpxz-00043m-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 08:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F28UoHDt0HnwO5yJ6cnnRWDpROErih+W1JbdJy3oLGU=; b=mgaFgdXsyclTtUnyKKTWlAD400
 I5wB9QAjMn7FgoNxo7ak/SB1907v1Wlq18jW+uXYrxuaTa4yqRDcK5OATwEyD8tY4juaACo75UJHz
 D4XH8L6/mw51bO3oAqBaR4+IIWh73zmaEZWecINxLrTjlnQVm2WlB5h8ag0zw+QND0uQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F28UoHDt0HnwO5yJ6cnnRWDpROErih+W1JbdJy3oLGU=; b=WjH6bUBl+DHxl34oq5w3hEeqWV
 hNhWN8rAXKKXPQWxOZqkgtGbuK53yVThzm+gzr+mrGp9sWUlR+GDJ9T01BMRO9OBaSvPx2mRFkU7j
 25QQvWNWtyZQdyCzUwWCQdX9fL5DDV2CCBGHwNoKcBUN9KMf+rJmATSBq1WqhmxpyfS8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jIpxv-001DXS-7O
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Mar 2020 08:40:19 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 22950CB943F4500D454C;
 Mon, 30 Mar 2020 16:40:02 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 30 Mar
 2020 16:39:56 +0800
To: YueHaibing <yuehaibing@huawei.com>, <jaegeuk@kernel.org>,
 <chao@kernel.org>, <qkrwngud825@gmail.com>
References: <20200328112736.28852-1-yuehaibing@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <aee7049c-0154-3280-79a4-8bdc8ef0acbf@huawei.com>
Date: Mon, 30 Mar 2020 16:39:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200328112736.28852-1-yuehaibing@huawei.com>
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
X-Headers-End: 1jIpxv-001DXS-7O
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: xattr.h: Make stub helpers inline
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

On 2020/3/28 19:27, YueHaibing wrote:
> Fix gcc warnings:
> 
> In file included from fs/f2fs/dir.c:15:0:
> fs/f2fs/xattr.h:157:13: warning: 'f2fs_destroy_xattr_caches' defined but not used [-Wunused-function]
>  static void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi) { }
>              ^~~~~~~~~~~~~~~~~~~~~~~~~
> fs/f2fs/xattr.h:156:12: warning: 'f2fs_init_xattr_caches' defined but not used [-Wunused-function]
>  static int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi) { return 0; }
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: a999150f4fe3 ("f2fs: use kmem_cache pool during inline xattr lookups")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
