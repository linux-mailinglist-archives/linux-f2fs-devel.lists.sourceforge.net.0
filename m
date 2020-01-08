Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA0E133C8E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 09:00:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ip6G0-0000pp-SJ; Wed, 08 Jan 2020 08:00:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ip6Fx-0000pQ-RP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 07:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jR0PukAYI6VJzCiZt2YL8pH7EfBJIJUoNK61tUga4nY=; b=SAReYQKFmzSdQp4Im0n+lcpsdU
 LJx7kfLxqq66MEeO92xrgOKK3fSuYyMncuJVCyGibHbmRPzuq4Vbv7I7lKv/PKuQWsdbbjBj3r7z1
 PVvl9viHhlnAPE+DYokic3SmnHeYienSuc99HMIA/1vHjQpTjJxYnWatIws+NEf8htP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jR0PukAYI6VJzCiZt2YL8pH7EfBJIJUoNK61tUga4nY=; b=S3jRi5EmHZBPbUhKjSLJeMZSRF
 mQo984zmkI6NsEellGauq2RE3Nl2quGe3jRDszMeYgpY/nsi+pP3OIH86/u1ZRNyYFlAw9gh96G4+
 h/OotWbATaj+P5W6L2uvyzbwxM2u+6J/xDuAG4R3N42xpoJXbCFKJqROzPLuii5xY+28=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ip6Fl-00EESk-68
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 07:59:57 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 529256531BB77D6DCB2F;
 Wed,  8 Jan 2020 15:59:34 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 8 Jan 2020
 15:59:28 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200107020709.73568-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <afddac87-b7c5-f68c-4e55-3705be311cf6@huawei.com>
Date: Wed, 8 Jan 2020 15:59:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200107020709.73568-1-jaegeuk@kernel.org>
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
X-Headers-End: 1ip6Fl-00EESk-68
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a way to turn off ipu bio cache
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

On 2020/1/7 10:07, Jaegeuk Kim wrote:
> Setting 0x40 in /sys/fs/f2fs/dev/ipu_policy gives a way to turn off
> bio cache, which is useufl to check whether block layer using hardware
> encryption engine merges IOs correctly.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/filesystems/f2fs.txt | 1 +
>  fs/f2fs/segment.c                  | 2 +-
>  fs/f2fs/segment.h                  | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
> index 41b5aa94b30f..cd93bcc34726 100644
> --- a/Documentation/filesystems/f2fs.txt
> +++ b/Documentation/filesystems/f2fs.txt
> @@ -335,6 +335,7 @@ Files in /sys/fs/f2fs/<devname>
>                                 0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
>                                 0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
>                                 0x10: F2FS_IPU_FSYNC.

. -> ,

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> +			       0x40: F2FS_IPU_NOCACHE disables bio caches.
>  
>   min_ipu_util                 This parameter controls the threshold to trigger
>                                in-place-updates. The number indicates percentage
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index a9519532c029..311fe4937f6a 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3289,7 +3289,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
>  
>  	stat_inc_inplace_blocks(fio->sbi);
>  
> -	if (fio->bio)
> +	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
>  		err = f2fs_merge_page_bio(fio);
>  	else
>  		err = f2fs_submit_page_bio(fio);
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index a1b3951367cd..02e620470eef 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -623,6 +623,7 @@ enum {
>  	F2FS_IPU_SSR_UTIL,
>  	F2FS_IPU_FSYNC,
>  	F2FS_IPU_ASYNC,
> +	F2FS_IPU_NOCACHE,
>  };
>  
>  static inline unsigned int curseg_segno(struct f2fs_sb_info *sbi,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
