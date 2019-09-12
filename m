Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC13B08B6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2019 08:18:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i8IQU-0004Du-3o; Thu, 12 Sep 2019 06:17:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i8IQS-0004De-Gb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Sep 2019 06:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eT0j4rFoL95cw1Yc4Td3KWzjofxI+Qe43nrwlq8s+64=; b=JCpCr6tGWHuZ72YV/T+oeHYzeI
 K/RUbtif76XVCw1cD8/6nxM5EHuEhfSINlRT1WM2kABfimmGpKc5qBkJ1ugmz0tH7p/elJflY2Pst
 PvITE7d2EzDRGtr8uKtmowJ0KtmO5AHtfoTY4W14kXwtt0XeorClocfJpcrd+stznZks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eT0j4rFoL95cw1Yc4Td3KWzjofxI+Qe43nrwlq8s+64=; b=Oy2qExIKE6bdbhUVk3cyn/ugcr
 U9ejUWAVoak+4vFFxDLyqer0BkJexvR91TpOa2weaj0IScf72FWjxS7DKPlga1x1U13OM47tCa1tD
 EsOjoglZRm+6ophwU+hQXwrQG0y2dJHA0AYBf+pv4fUb1479Mi4WQ892a6uHp73yO17w=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i8IQO-00AGET-Hm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Sep 2019 06:17:52 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4F5231408ADFCDD35F6B;
 Thu, 12 Sep 2019 14:17:35 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 12 Sep
 2019 14:17:33 +0800
To: Goldwyn Rodrigues <rgoldwyn@suse.de>, <linux-fsdevel@vger.kernel.org>
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
 <20190911164517.16130-1-rgoldwyn@suse.de>
 <20190911164517.16130-4-rgoldwyn@suse.de>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <77bec57d-2bd1-db40-917e-7dccb58cb3b7@huawei.com>
Date: Thu, 12 Sep 2019 14:17:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190911164517.16130-4-rgoldwyn@suse.de>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i8IQO-00AGET-Hm
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix inode rwsem regression
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
Cc: david@fromorbit.com, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, Goldwyn
 Rodrigues <rgoldwyn@suse.com>, linux-ext4@vger.kernel.org, andres@anarazel.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/12 0:45, Goldwyn Rodrigues wrote:
> From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> This is similar to 942491c9e6d6 ("xfs: fix AIM7 regression")
> Apparently our current rwsem code doesn't like doing the trylock, then
> lock for real scheme.  So change our read/write methods to just do the
> trylock for the RWF_NOWAIT case.
> 
> We don't need a check for IOCB_NOWAIT and !direct-IO because it
> is checked in generic_write_checks().
> 
> Fixes: b91050a80cec ("f2fs: add nowait aio support")
> Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> ---
>  fs/f2fs/file.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 3e58a6f697dd..c6f3ef815c05 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3134,16 +3134,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  		goto out;
>  	}
>  
> -	if ((iocb->ki_flags & IOCB_NOWAIT) && !(iocb->ki_flags & IOCB_DIRECT)) {
> -		ret = -EINVAL;
> -		goto out;
> -	}

We have removed above redundant check, could you rebase to dev-test branch of
Jaegeuk's git tree?

Otherwise it looks good to me.

Thanks,

> -
> -	if (!inode_trylock(inode)) {
> -		if (iocb->ki_flags & IOCB_NOWAIT) {
> +	if (iocb->ki_flags & IOCB_NOWAIT) {
> +		if (!inode_trylock(inode)) {
>  			ret = -EAGAIN;
>  			goto out;
>  		}
> +	} else {
>  		inode_lock(inode);
>  	}
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
