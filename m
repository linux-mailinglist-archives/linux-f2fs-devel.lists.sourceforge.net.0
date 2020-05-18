Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0691C1D6EBF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 May 2020 04:21:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jaVPN-0004xX-Pf; Mon, 18 May 2020 02:21:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jaVPM-0004xI-AX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 02:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9a74TipqmTTRValKhwMz6zMuseTiDPhPDRM9wlOEee4=; b=abtJGuNoTbdb7BdCeWTq12vOkg
 chELVJmBrSRX3tAuOjyBMAo0hLDp2hWjHscuxF7rPbbaVr1oCQU/iLAZfPsOQZYVq/OSyC1tgyP1M
 S9T9mzdBvmCGnis+51GhkxWo4LrE5RRxwXKYkXLizu3jrnV20ViqyQXDSgHKvbh9kwt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9a74TipqmTTRValKhwMz6zMuseTiDPhPDRM9wlOEee4=; b=Ubzs/bMiLh3p9YBkgNGpU5MTku
 LpZelknsYrmKu5KkQBVsBgII/WmXlYDI5k/qxuF12utWsp3yY7Wyw+Vvur7N7c9L+hoibCJps6P3V
 Z/ei2XoWwp4/vpPTqpo9X9rz8VePaEUDowCasFb0TxsBiULrUD+Nr+UzzLp9ui9UyIlY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jaVPK-00D5t2-2i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 May 2020 02:21:36 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7B2F8A7CA5DC1B82FDC8;
 Mon, 18 May 2020 10:21:24 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 18 May
 2020 10:21:21 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200515021554.226835-1-jaegeuk@kernel.org>
 <9ba6e5ef-068d-a925-1eb9-107b0523666c@huawei.com>
 <20200515144509.GA46028@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cd964a56-b2a7-48de-97a6-5d89d9a590a3@huawei.com>
Date: Mon, 18 May 2020 10:21:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200515144509.GA46028@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jaVPK-00D5t2-2i
Subject: Re: [f2fs-dev] [PATCH] f2fs: flush dirty meta pages when flushing
 them
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/15 22:45, Jaegeuk Kim wrote:
> On 05/15, Chao Yu wrote:
>> On 2020/5/15 10:15, Jaegeuk Kim wrote:
>>> Let's guarantee flusing dirty meta pages to avoid infinite loop.
>>
>> What's the root cause? Race case or meta page flush failure?
> 
> Investigating, but at least, this can avoid the inifinite loop there.

Hmm... this fix may cover the root cause..

Thanks,

> 
> V2:
> 
>>From c60ce8e7178004fd6cba96e592247e43b5fd98d8 Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Wed, 13 May 2020 21:12:53 -0700
> Subject: [PATCH] f2fs: flush dirty meta pages when flushing them
> 
> Let's guarantee flusing dirty meta pages to avoid infinite loop.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 620a386d82c1a..3dc3ac6fe1432 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1266,6 +1266,9 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>  		if (unlikely(f2fs_cp_error(sbi)))
>  			break;
>  
> +		if (type == F2FS_DIRTY_META)
> +			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
> +							FS_CP_META_IO);
>  		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>  	}
>  	finish_wait(&sbi->cp_wait, &wait);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
