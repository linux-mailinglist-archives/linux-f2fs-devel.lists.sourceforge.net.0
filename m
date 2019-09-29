Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B528FC1297
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2019 02:56:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iENVv-0000cn-63; Sun, 29 Sep 2019 00:56:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iENVt-0000cg-TI
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 00:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u+QkkSXk4vCHWr7+6Gy6IGiG+wTyGdI3EgmMRLa6czM=; b=BG3hE2Nr9ixhkt3xjnlLM5YZRh
 I623l2uXGZ10zXx06jKA+5oilX1YJFUt+z79GI6WrK9ksWIrHS8QN3Iz9J9VvRU15f/Mobib92oFB
 S4HK5kaueYK0JMkanjCMhSTvEpo51NoT3OZ5kxuPiuHp/kA2yQpr9c9jtYNocNc1MrYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u+QkkSXk4vCHWr7+6Gy6IGiG+wTyGdI3EgmMRLa6czM=; b=hPH+nNRn2Ms7SbRDQU3lMlFGoT
 2kIELlf01ddfAH3eNneHzhvMA7GUawtHsSwMjthb+EaoCfs4S4Fvx5VY/OxMxrRZQ6+1futfNZsfw
 kvUjtxh8zbBdCY7dQVmVZ+54h9E7KrHAy+8qVCMNfspDgBHkmVfYPWUkpRMaCxOldtBU=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iENVs-00A7Lo-9Q
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 29 Sep 2019 00:56:37 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 59F7664C571BA943DC18;
 Sun, 29 Sep 2019 08:56:29 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Sun, 29 Sep
 2019 08:56:26 +0800
To: Chengguang Xu <cgxu519@zoho.com.cn>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <20190928014006.8243-1-cgxu519@zoho.com.cn>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <0d773ecd-076e-54da-e952-8e6ad7894bb6@huawei.com>
Date: Sun, 29 Sep 2019 08:56:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190928014006.8243-1-cgxu519@zoho.com.cn>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zoho.com.cn]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iENVs-00A7Lo-9Q
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix a comment in f2fs_shrink_count()
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

Hi Chengguang,

Thanks a lot for the patch, previously I've sent a patch to fix most
inconsistent comments including below one, could you check that?

https://lore.kernel.org/linux-f2fs-devel/20190927102305.11587-1-yuchao0@huawei.com/T/#u

Thanks,

On 2019/9/28 9:40, Chengguang Xu via Linux-f2fs-devel wrote:
> Fix a mismatched comment in f2fs_shrink_count().
> 
> Signed-off-by: Chengguang Xu <cgxu519@zoho.com.cn>
> ---
>  fs/f2fs/shrinker.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index a467aca29cfe..d66de5999a26 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -58,7 +58,7 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
>  		/* count extent cache entries */
>  		count += __count_extent_cache(sbi);
>  
> -		/* shrink clean nat cache entries */
> +		/* count clean nat cache entries */
>  		count += __count_nat_entries(sbi);
>  
>  		/* count free nids cache entries */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
