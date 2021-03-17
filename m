Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D45333E70C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Mar 2021 03:40:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMM6s-0003Up-1M; Wed, 17 Mar 2021 02:40:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lMM6q-0003UC-Cj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 02:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qwSTq3G02TiA3+rwx8W67pQwlH4iPFyrMc8zYirH31s=; b=AWbwGZtfP+wu+nYKxTslZe9oWa
 Oj+fDrZRjY+BZWVB+usrqz9JPBK5Biu+K49/kQgGXsdt+cjmbNXAsrLWRHUcEAu+OqkMvrfMucVXE
 dKuuydj1VjMDUb8wZx8EOT2smtL3UB+BQmYBMO3Rgg1SWUUjWKXE8fhnD3yv24nzdiYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qwSTq3G02TiA3+rwx8W67pQwlH4iPFyrMc8zYirH31s=; b=MTZIUJgBr/Cp/dII43PW4flamD
 mdcTb6PVYG3vhhCDgjTD/GyV3cV3hOrsKoXDmq/Y8v7hCTDyHpHnZZRkd/Tdi68Nld4Ku9Pa17VVw
 aKuqVRTaueZ9zXos9PvqzvxuwJqvoPvb3bujXH3W8DA7J37Sa/K6vzKBRg5J9BZ1bc+Y=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lMM6f-0008P1-Az
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 02:40:32 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F0Z8T5cn0z19GCr;
 Wed, 17 Mar 2021 10:38:17 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 17 Mar
 2021 10:40:08 +0800
To: Weichao Guo <guoweichao@oppo.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <1615900522-20747-1-git-send-email-guoweichao@oppo.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <88f444a3-0fc4-8b8b-4ab3-2c744fc06e01@huawei.com>
Date: Wed, 17 Mar 2021 10:40:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1615900522-20747-1-git-send-email-guoweichao@oppo.com>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lMM6f-0008P1-Az
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: do not use CURSEG_ALL_DATA_ATGC in
 foreground or urgent GC
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
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/16 21:15, Weichao Guo via Linux-f2fs-devel wrote:
> CURSEG_ALL_DATA_ATGC is introduced by age threshold based GC for better
> hot/cold data seperation and avoiding free segment cost. However, LFS
> write mode is preferred in the scenario of foreground or urgent GC, which
> should be finished ASAP. So, let's only use CURSEG_ALL_DATA_ATGC when not
> urgent in background GC.

Weichao,

select_gc_type()

	case GC_URGENT_HIGH:
		gc_mode = GC_GREEDY;

We have selected 'greedy' algorithm rather than 'atgc' algorithm for high
urgent gc, did you mean we should use 'greedy' for low urgent gc as well?

Thanks,

> 
> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
> Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> ---
>   fs/f2fs/gc.c      | 3 ++-
>   fs/f2fs/segment.c | 4 +++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 86ba8ed..ee42f6e 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1120,7 +1120,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
>   	block_t newaddr;
>   	int err = 0;
>   	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
> -	int type = fio.sbi->am.atgc_enabled ?
> +	int type = fio.sbi->am.atgc_enabled && gc_type == BG_GC &&
> +				fio.sbi->gc_mode < GC_URGENT_HIGH ?
>   				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
>   
>   	/* do not read out */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 32b915e..cbfb0d1 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -3264,7 +3264,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>   		struct inode *inode = fio->page->mapping->host;
>   
>   		if (is_cold_data(fio->page)) {
> -			if (fio->sbi->am.atgc_enabled)
> +			if (fio->sbi->am.atgc_enabled &&
> +				fio->io_type == FS_DATA_IO &&
> +				fio->sbi->gc_mode < GC_URGENT_HIGH)
>   				return CURSEG_ALL_DATA_ATGC;
>   			else
>   				return CURSEG_COLD_DATA;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
