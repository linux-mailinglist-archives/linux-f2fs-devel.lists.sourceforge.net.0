Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C070743C2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2019 05:15:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqUDx-0002Vz-2m; Thu, 25 Jul 2019 03:15:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hqUDt-0002Vp-AS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 03:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zI3Vl3M1UoMRtsnKYnK2EWdXr3rDeU3lZrWSz3HhI3U=; b=FqhL9G8NpbYVOfQdJX+wCMSHLD
 jRwQxNXkb428qHsxyOHzw5QuBEANN7PfCgAu587/b7qbMYwrqYNzbRqV/FJb4cGgelYRu8G6rhLiY
 Iuwyz+5nZrfzoCy56DiglW5fCl3DPo70LZhjx9/uCfMNhUcPYMEBnaF2GL9vlbtjnZo0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zI3Vl3M1UoMRtsnKYnK2EWdXr3rDeU3lZrWSz3HhI3U=; b=IB2CmuMN+HLWxyBf8rKbjI6QCv
 I7fSj8bjFM2zQIZMgktUorXKmYW4912iEzEM0DqOPizeirBHzvswmKBHr32YGmfWDSAq593+ER0gG
 7jwbPJFbW88vZkaDWJsLXhcdnkkbGM3vW8kMpCFoNvdsaZYMaanFcQoUOAlfKoEf67Zo=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqUDr-00EXTk-0e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Jul 2019 03:15:17 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CFDA1E13BD828B343EFF;
 Thu, 25 Jul 2019 11:15:07 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 25 Jul
 2019 11:15:02 +0800
To: Icenowy Zheng <icenowy@aosc.io>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190725030852.33161-1-icenowy@aosc.io>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <07060e23-bc6f-5d35-a7f3-e75c8ebb3b65@huawei.com>
Date: Thu, 25 Jul 2019 11:15:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190725030852.33161-1-icenowy@aosc.io>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: aosc.io]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hqUDr-00EXTk-0e
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: use EINVAL for superblock with
 invalid magic
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

On 2019/7/25 11:08, Icenowy Zheng wrote:
> The kernel mount_block_root() function expects -EACESS or -EINVAL for a
> unmountable filesystem when trying to mount the root with different
> filesystem types.
> 
> However, in 5.3-rc1 the behavior when F2FS code cannot find valid block
> changed to return -EFSCORRUPTED(-EUCLEAN), and this error code makes
> mount_block_root() fail when trying to probe F2FS.
> 
> When the magic number of the superblock mismatches, it has a high
> probability that it's just not a F2FS. In this case return -EINVAL seems
> to be a better result, and this return value can make mount_block_root()
> probing work again.
> 
> Return -EINVAL when the superblock has magic mismatch, -EFSCORRUPTED in
> other cases (the magic matches but the superblock cannot be recognized).
> 
> Fixes: 10f966bbf521 ("f2fs: use generic EFSBADCRC/EFSCORRUPTED")
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
