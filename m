Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8784E8C5A2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2019 03:47:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxiOF-0001up-B3; Wed, 14 Aug 2019 01:47:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hxiOD-0001ui-Pa
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 01:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i0C87mHM2KOy2M1Ix+DhcWHL3L6z+x/i4b6xu8dpT/o=; b=NhtLvUH8HnyAK6TJgrzdLNl+qS
 /7lSATf2lKlNYx9yrHueJJBBHhoYkaDgDGdohb46O6oxSvX1oc0RDtobPVdX+bakbHmz1WsSF0SoA
 Fnq09mP92QXDPAj/ECn/K60ZCG8/tz3ck/xOHpfgyP96LF3GnPXjrXeUm+UR2PkvpJ54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i0C87mHM2KOy2M1Ix+DhcWHL3L6z+x/i4b6xu8dpT/o=; b=UXtaWugeur86R0WpOH7vzWTSfR
 dArab8soWyULPhM3Yy+p07PB32dD6HeQjbt1fX1RzC+5MTRWwLOuAPye82yPMBxmyfuPKRkN8ECjc
 rFa7ltwXul5QeznE+PALQcCbMpiwFe/ZnseLDM7jIs/GKeSj4SIqirh0Bom2+7gd2yb8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxiOC-003QRW-0x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 14 Aug 2019 01:47:49 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F34FA384CAB67D2B1D6B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Aug 2019 09:47:39 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 14 Aug
 2019 09:47:37 +0800
To: Park Ju Hyung <qkrwngud825@gmail.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c5fbcb16-c7b2-988d-2110-8ce53a6137f6@huawei.com>
Date: Wed, 14 Aug 2019 09:47:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190812225211.1737-1-qkrwngud825@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hxiOC-003QRW-0x
Subject: Re: [f2fs-dev] [PATCH 1/2] mkfs.f2fs: add "zip" to cold data types
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

Hi Ju Hyung,

On 2019/8/13 6:52, Park Ju Hyung wrote:
> A lot of Linux users have big, cold "zip" files.

In android, as I see, most zip file is small-sized log type, and will be removed
after a roll-back, such as:

time1: create log1.zip
time2: create log2.zip
time3: create log3.zip
time4: remove log1.zip, rename log2.zip -> log1.zip; rename log3.zip ->
log2.zip; create log3.zip

I suggest we can keep zip type in android as warm type with IPU mode to avoid
fragmentation caused by small holes in cold area. In linux distro, I agreed to
treat zip as cold type.

So what about configuring zip type in f2fs_init_configuration() under '#ifndef
WITH_ANDROID'?

What do you think?

Thanks,

> 
> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> ---
>  mkfs/f2fs_format.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
> index 9402619..37d82c3 100644
> --- a/mkfs/f2fs_format.c
> +++ b/mkfs/f2fs_format.c
> @@ -66,6 +66,7 @@ const char *media_ext_lists[] = {
>  	"webp",
>  
>  	/* archives */
> +	"zip",
>  	"jar",
>  	"deb",
>  	"iso",
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
