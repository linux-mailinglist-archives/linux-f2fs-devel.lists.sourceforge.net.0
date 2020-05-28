Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A21E5426
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 04:47:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1je8ZT-0005ZA-7t; Thu, 28 May 2020 02:47:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1je8ZR-0005Z2-Jy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 02:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=isx5dw6AMELFIV98dPEshYT7zNAAcGFUAjzFZXv7LWI=; b=VFYweChZ3+FmPvxhBddlLa9PsR
 Of2JqJ1qW7qtfaTCxItpXJRO/30luixPdMM2ybf+LF8ttJkZwPI8xZSkvfP/RxluVEeQI9DxnNgjc
 +dN2BHkx291gXmOg9vP6cu3Ur2GeveaGyXebUq33KTfNSYXcTGMJ7+tZbIRGiGjI7QFs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=isx5dw6AMELFIV98dPEshYT7zNAAcGFUAjzFZXv7LWI=; b=eAVAMuucP5poFSswZfY/B12LrS
 Ul5wWypCaOemB0rLOLRGaWAbefJmmY1eeba6CMDaKnxRx7NdLyfWBLGt7upmp8LrBUDbkrlc/LmAB
 YPGvFHTeVDVeW91m9LQ2OJ2u/pHXBUxaIvyebk1zM0DUy6NtlihoEZxG3ksOCKIe+MpA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1je8ZP-001097-Qd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 02:47:01 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3FBCEDC4BDD68E2F787E;
 Thu, 28 May 2020 10:46:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 28 May
 2020 10:46:39 +0800
To: <jaegeuk@kernel.org>
References: <20200526015502.22313-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <fad281cf-a936-9b5a-6176-f9673b3038c9@huawei.com>
Date: Thu, 28 May 2020 10:46:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200526015502.22313-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1je8ZP-001097-Qd
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: don't compress any datas
 after cp stop
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

Jaegeuk, could you please review this patch?

On 2020/5/26 9:55, Chao Yu wrote:
> While compressed data writeback, we need to drop dirty pages like we did
> for non-compressed pages if cp stops, however it's not needed to compress
> any data in such case, so let's detect cp stop condition in
> cluster_may_compress() to avoid redundant compressing and let following
> f2fs_write_raw_pages() drops dirty pages correctly.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  fs/f2fs/compress.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index bf152c0d79fe..a53578a89211 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -849,6 +849,8 @@ static bool cluster_may_compress(struct compress_ctx *cc)
>  		return false;
>  	if (!f2fs_cluster_is_full(cc))
>  		return false;
> +	if (unlikely(f2fs_cp_error(F2FS_I_SB(cc->inode))))
> +		return false;
>  	return __cluster_may_compress(cc);
>  }
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
