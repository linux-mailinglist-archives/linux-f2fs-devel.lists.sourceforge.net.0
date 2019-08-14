Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBD18C5A9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 03:51:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxiRr-00024x-Oj; Wed, 14 Aug 2019 01:51:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hxiRq-00024p-2t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 01:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L/XQFBXNVeGXoGjq+mG0PLvHw6gwna5N9NINv2DIu7o=; b=QivBUbAx19F9GG9qBRMimaWZJS
 Y33EmZhLWjvpiTyKkq7iBxxj4wQPNFBeYFMrqdI7fnlrB2l8Jd2c216LzfWZuQJWtc5IzFkcYHSN4
 ZL5X9dj+26U52BRojPmGJ+XTODUFZQPt69GWi3n0d1i7cNpC1p7VzuJaEiJBawlIeC0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L/XQFBXNVeGXoGjq+mG0PLvHw6gwna5N9NINv2DIu7o=; b=jtQTJ/OSmdr+Rkzge4g4pqpBMA
 aS78TLR+IuMuMOpjOmC996RbQJk1yYdpFZjIN0jvtoBW3LZ1NjxrLoSVi2GoQcQX19mPSXbi/saCk
 5gaCYjI1qxiK+8g42pmrPT+n3N0GsngwNs0XzxjVuPfvTIIOI2Zy8oWKm3bCMD+IqPVk=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxiRo-003Qb5-Sd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 01:51:34 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 862CBCB959F5A58C4CE8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 09:51:25 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug
 2019 09:51:22 +0800
To: Park Ju Hyung <qkrwngud825@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
 <20190812225211.1737-2-qkrwngud825@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <5761733a-ae6a-2bab-4a68-7f91823e775d@huawei.com>
Date: Wed, 14 Aug 2019 09:51:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190812225211.1737-2-qkrwngud825@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hxiRo-003Qb5-Sd
Subject: Re: [f2fs-dev] [PATCH 2/2] mkfs.f2fs: add VM disk files to hot data
 types
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

On 2019/8/13 6:52, Park Ju Hyung wrote:
> Similar to .db files, these are randomly updated extremely frequently.

It looks android doesn't need this, how about adding them under "#ifndef
WITH_ANDROID"?

Thanks,

> 
> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> ---
>  mkfs/f2fs_format.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 37d82c3..1c08e3e 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -94,6 +94,11 @@ const char *media_ext_lists[] = {
>  
>  const char *hot_ext_lists[] = {
>  	"db",
> +
> +	/* Virtual machines */
> +	"vmdk", // VMware or VirtualBox
> +	"vdi", // VirtualBox
> +	"qcow2", // QEMU
>  	NULL
>  };
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
