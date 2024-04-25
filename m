Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D08A28B1ADD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 08:22:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzsUr-0003xU-UJ;
	Thu, 25 Apr 2024 06:22:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <linmiaohe@huawei.com>) id 1rzsUh-0003xG-Ep
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 06:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNFk7y6L19U7Au+xI/DRdrWmxngq6MO+Cj2PVnt5KSw=; b=KzY1+MOSku7p7IgLMcFgR4BscT
 SHldvRDnCmvXeYLVkhgtbUJfJa/1d3t36X00Sfjjytyq3RUXj8CjUBtdLI1jF3/O8OYkeRuhknTEq
 0U3Tboy+9Hu4240i3sANBf1xpW9rWdwSxUw3ypi+q7YqoUeDjziiBUGxStY7K6iNpTu4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sNFk7y6L19U7Au+xI/DRdrWmxngq6MO+Cj2PVnt5KSw=; b=Zg7hwp8fmYXFWz42ufOOqi/wuC
 Yb0kTHxa8nR75WCvpkyIPBjQoRrCB2Qy9DtDw7AlcBrJB+b5gGtdIzYfmFJwT7uppV4Ql2/k7i6C5
 kpSjJQvI2TD/A98uySVU15ywggzEtYBQqlS41mP7vSx+cjqO7bktTm9KBajnRUlBfnzQ=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzsUg-0002zg-27 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 06:22:07 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4VQ5KD4qPVz1R9NF;
 Thu, 25 Apr 2024 14:18:56 +0800 (CST)
Received: from canpemm500002.china.huawei.com (unknown [7.192.104.244])
 by mail.maildlp.com (Postfix) with ESMTPS id 273C01402E0;
 Thu, 25 Apr 2024 14:21:59 +0800 (CST)
Received: from [10.173.135.154] (10.173.135.154) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 14:21:58 +0800
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
References: <20240423225552.4113447-1-willy@infradead.org>
 <20240423225552.4113447-4-willy@infradead.org>
Message-ID: <82a80acf-7d2e-b207-07bb-2584ef874352@huawei.com>
Date: Thu, 25 Apr 2024 14:21:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20240423225552.4113447-4-willy@infradead.org>
Content-Language: en-US
X-Originating-IP: [10.173.135.154]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/4/24 6:55, Matthew Wilcox (Oracle) wrote: > This is
 mostly just inlining page_mapping() into the two callers. > > Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> Acked-by: Miaohe Lin
 <linmiaohe@huawei.com> Thanks. . 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [45.249.212.255 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -3.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1rzsUg-0002zg-27
Subject: Re: [f2fs-dev] [PATCH 3/6] memory-failure: Remove calls to
 page_mapping()
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
From: Miaohe Lin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-fscrypt@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/4/24 6:55, Matthew Wilcox (Oracle) wrote:
> This is mostly just inlining page_mapping() into the two callers.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Thanks.
.

> ---
>  mm/memory-failure.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index e065dd9be21e..62aa3db17854 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -216,6 +216,7 @@ EXPORT_SYMBOL_GPL(hwpoison_filter_flags_value);
>  
>  static int hwpoison_filter_dev(struct page *p)
>  {
> +	struct folio *folio = page_folio(p);
>  	struct address_space *mapping;
>  	dev_t dev;
>  
> @@ -223,7 +224,7 @@ static int hwpoison_filter_dev(struct page *p)
>  	    hwpoison_filter_dev_minor == ~0U)
>  		return 0;
>  
> -	mapping = page_mapping(p);
> +	mapping = folio_mapping(folio);
>  	if (mapping == NULL || mapping->host == NULL)
>  		return -EINVAL;
>  
> @@ -1090,7 +1091,8 @@ static int me_pagecache_clean(struct page_state *ps, struct page *p)
>   */
>  static int me_pagecache_dirty(struct page_state *ps, struct page *p)
>  {
> -	struct address_space *mapping = page_mapping(p);
> +	struct folio *folio = page_folio(p);
> +	struct address_space *mapping = folio_mapping(folio);
>  
>  	/* TBD: print more information about the file. */
>  	if (mapping) {
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
