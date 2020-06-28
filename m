Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C610A20C57A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Jun 2020 04:56:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jpNUn-0007QM-F3; Sun, 28 Jun 2020 02:56:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jpNUl-0007QD-MU
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RzypqlbnY5R1Lu95eoB7OksKDmxWThf6dMBLs9p+uO4=; b=QIiptqghwSg/GDZ4GeYW3tAjPo
 gZOQqSn1eAjUTFzxU/m+SXqDM4nPeWldVO5miLlqJ1HGuHafT+J7VuVXhtvYwwqbKJAEqFaCr2qJF
 O0jQYFoStdQVUQyERry47cNfcVGQRBu845PZOFNpSEorLVBsnivjGOqAmtIPvxRfOGjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RzypqlbnY5R1Lu95eoB7OksKDmxWThf6dMBLs9p+uO4=; b=DRenA4n5bFGoUwaFXaV8tebFFb
 VtXNjqkGt22DygP7PRGgdrfSo2Ors5rNiNnlrVwSx2n+wJ3nimdjgjMrMFbiS6FScKk3olLNsc0Gq
 kCI7a2fww1KxQiniC9u9uuAoinOmMAb87j8XxBMN1yCIQPSflT/DxW9yn99AMdVqkJwI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jpNUi-0038fJ-SN
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Jun 2020 02:56:39 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 514568FD9B6562E8C76E;
 Sun, 28 Jun 2020 10:56:22 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Sun, 28 Jun
 2020 10:56:18 +0800
To: Liu Song <fishland@aliyun.com>, <jaegeuk@kernel.org>, <chao@kernel.org>
References: <20200626143927.2792-1-fishland@aliyun.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <34a73209-8384-2818-b6e1-c97fc9c32e69@huawei.com>
Date: Sun, 28 Jun 2020 10:56:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200626143927.2792-1-fishland@aliyun.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zte.com.cn]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jpNUi-0038fJ-SN
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unnecessary judgments in
 __insert_free_nid()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, liu.song11@zte.com.cn,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/26 22:39, Liu Song via Linux-f2fs-devel wrote:
> From: Liu Song <liu.song11@zte.com.cn>
> 
> The value of state must be equal to FREE_NID, so the if
> condition judgment can be removed.
> 
> Signed-off-by: Liu Song <liu.song11@zte.com.cn>
> ---
>  fs/f2fs/node.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 03e24df1c84f..0adeb20f19c9 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2118,8 +2118,7 @@ static int __insert_free_nid(struct f2fs_sb_info *sbi,
>  
>  	f2fs_bug_on(sbi, state != i->state);
>  	nm_i->nid_cnt[state]++;
> -	if (state == FREE_NID)
> -		list_add_tail(&i->list, &nm_i->free_nid_list);
> +	list_add_tail(&i->list, &nm_i->free_nid_list);

In previous design, @state allow accepting both FREE_NID and PREALLOC_NID,
If you remove that condition, it's not correct to add free nid entry into
free_nid_list when passing PREALLOC_NID in @state, now, we only pass @state
with FREE_NID, so it's better to remove that parameter directly.

Thanks,

>  	return 0;
>  }
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
