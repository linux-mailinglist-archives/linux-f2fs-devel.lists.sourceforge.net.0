Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFA213BCF7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jan 2020 11:00:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1irfT7-0002GZ-EY; Wed, 15 Jan 2020 10:00:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1irfSu-0002De-Ag
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 09:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9YteP5GzoEgeCiv/2SwlJCeygTqboUjvturZJ3ErSkc=; b=D3xZTTq/HbkQuN6ZaY6O/Nn5OB
 +vg4IJfyudSsAfkxIe1OsoQ4aqcAOYlaCPn8/J7TM7jS1ZjYrJcJE2txzDFmABuBncQwcp8ZclxPz
 oxWycTskAM0wGO/3Bz5t3h5q7Y2bLz6vGVY9ixrtQMksk9RR0f+75vxB7epgQG752bis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9YteP5GzoEgeCiv/2SwlJCeygTqboUjvturZJ3ErSkc=; b=j4UwgTD02C22oAnUW6kc+0492t
 YpBIVeGAaRLOFf7O2fHQ/4Ls9HpeoQBn0w/JY8uLLKJ3keaflkVgp3DzNcdzZ2tBwlR/YumccRxZQ
 BSrhK+pQ4F5EcpaeV5TL64DdG0nn7zcmg/7TaagIYPMy+6rNUHvn0A4bKesY5nzB/GWU=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1irfSp-006z0k-V5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jan 2020 09:59:56 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B6D1B12F2BA9F911C53F;
 Wed, 15 Jan 2020 17:59:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 Jan
 2020 17:59:38 +0800
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20200115015424.41496-1-zhangxiaoxu5@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <dcdba6c2-7ad1-86ae-c5d8-7ad0ee8ea3b2@huawei.com>
Date: Wed, 15 Jan 2020 17:59:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200115015424.41496-1-zhangxiaoxu5@huawei.com>
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
X-Headers-End: 1irfSp-006z0k-V5
Subject: Re: [f2fs-dev] [PATCH] f2fs: Make f2fs_verify_pages static
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Xiaoxu,

On 2020/1/15 9:54, Zhang Xiaoxu wrote:
> Fix sparse warning:
> 
> fs/f2fs/data.c:187:6: warning:
>   symbol 'f2fs_verify_pages' was not declared. Should it be static?

Thanks for your patch.

It will be better to merge this patch into original patch which is
still on dev status, let us know if you have any other concern. :)

Thanks,

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
> ---
>  fs/f2fs/data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 2576d7dd047d..b27b72107911 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -184,7 +184,7 @@ static void f2fs_decompress_work(struct bio_post_read_ctx *ctx)
>  }
>  
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
> -void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
> +static void f2fs_verify_pages(struct page **rpages, unsigned int cluster_size)
>  {
>  	f2fs_decompress_end_io(rpages, cluster_size, false, true);
>  }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
