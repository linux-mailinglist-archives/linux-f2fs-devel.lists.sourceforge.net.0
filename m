Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C49D079B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 02:35:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tCqfT-00007q-5X;
	Mon, 18 Nov 2024 01:35:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tCqfR-00007i-Ni
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 01:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PA/Agr2LUakvOrX1ub4vGJ6Cc/Nj4GfSGs2ntxlNpWs=; b=DX3ptFpiSm1bAR51PieoBYpXQv
 f9Hx++NEJuugADSTdUzA7EiqojuXgYFAtHmhDjSBpQN3BcnlrMUNY9qGqyUywd1BZLRp05zMOMKVy
 O7p5BEqgWXGOHO2gvFh1rwWEkJRfjGAr2UE6SRtyP/u5KiZSx7kOPwpFBWE87F38iOSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PA/Agr2LUakvOrX1ub4vGJ6Cc/Nj4GfSGs2ntxlNpWs=; b=FgDqWFMgoX8EhS9lJCxzic+gqR
 UrzrlVmklFOBW6q1t6AOmrebLX3oTLFgolsXBkvOwtU5zXtqUrvKluDXJR4qTlg1YEkHW28dMq3ug
 VfGFQhDHzqxseTxeBxUp/Wa30/Rck3eJE0jrJfUmXmgHXq9yuddHmaz1iEizMewt5roM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tCqfQ-0007bQ-GM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 01:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0BF205C53D1;
 Mon, 18 Nov 2024 01:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BDBC4CECD;
 Mon, 18 Nov 2024 01:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731893693;
 bh=itPS2D8lix0vRvGPciYIZks5hFGiawS88A+qR27pYu0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=oyJwH6pf6cv5pdLgLRu/jh031aEWdKSqOYdY9supFoMTMaLaAsf/ydRpI6+fSc06p
 Y4vqKs0lm7kPh4KaU2/XXyL4YaZKA5Hu/Oi+JYn67LTX9jJpl7j5NV6iAw4OPnBnz/
 cki5TiMgsYGNzR9E+imc33Bhvd193Z2BTVAHHcWjTR+MfkViAXWKQlNj3W+Hj+ixzb
 sc9n9iAbr6O2RrEtQCRPjz+KwCdCewKUU8yJLgBX+rlRsjGFwc7QBfpS0byqZAXYzR
 YFP9RD4oQZSBDpyvH8+BHrkF+2GAWBkOml7q4XYxe1YNd9aO9OpZbKHoqq5qa83qPG
 ViN750kaCR54g==
Message-ID: <6ad6a7a4-d5a5-416c-8340-5611fee79c0b@kernel.org>
Date: Mon, 18 Nov 2024 09:34:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: zangyangyang1 <zangyangyang1@xiaomi.com>
References: <20241111043106.864722-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20241111043106.864722-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/11 12:31,
 zangyangyang1 wrote: > f2fs_find_data_page
 is used to find dentry pages, > I think we should cache more dentry pages.
 Hi, Did you suffer any issue w/o this change? 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tCqfQ-0007bQ-GM
Subject: Re: [f2fs-dev] [PATCH] f2fs: cache more dentry pages
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/11/11 12:31, zangyangyang1 wrote:
> f2fs_find_data_page is used to find dentry pages,
> I think we should cache more dentry pages.

Hi,

Did you suffer any issue w/o this change?

Thanks,

> 
> Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
> ---
>   fs/f2fs/data.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 402e00d54c0b..71ca987fe7cd 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1286,7 +1286,7 @@ struct page *f2fs_find_data_page(struct inode *inode, pgoff_t index,
>          struct address_space *mapping = inode->i_mapping;
>          struct page *page;
> 
> -       page = find_get_page(mapping, index);
> +       page = find_get_page_flags(mapping, index, FGP_ACCESSED);
>          if (page && PageUptodate(page))
>                  return page;
>          f2fs_put_page(page, 0);
> --
> 2.43.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
