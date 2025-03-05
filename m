Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E11A4F990
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 10:10:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpkmB-0005ch-SM;
	Wed, 05 Mar 2025 09:10:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpkmA-0005cb-Pv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g1DLuGY/qOyXVJF9mRbzGsGxgqbhMytXVAEzwBUXfsM=; b=c2ynWyF0iIln5Zh8wyXokGRqbP
 pg5sj7mqC+kk16tMVWSCWjq2IBC9ro+sMimCwqQ2nnmsN59PrnfGZTgWZeXVHOH3UcabTd6d19Eu/
 o/bBI5pJvGxHfalDJpa9TyeRBOJTi1I3oSuCCtTazkb/SIyy6GDU4IMaOyXqLq1VvUEE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g1DLuGY/qOyXVJF9mRbzGsGxgqbhMytXVAEzwBUXfsM=; b=M5Bx26x/DsZzMrLgRmPgTQX6wY
 14WN21VH/QQ50U5IeiR28WUGaCF6Iiop8T8WrFR4hR7oBdpuI1+MHaxrcF5mSgnghF7BZq7z81UZn
 6ZCXo+XmeENk/RfK1OSX90ma9G+QPeppn7zexKeJ2QFIq9tut2uaGq6ou04Uu/fIvVZY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpkm9-0008MS-Ig for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 09:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 403E75C66ED;
 Wed,  5 Mar 2025 09:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EDE5C4CEE8;
 Wed,  5 Mar 2025 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741165838;
 bh=uT2qFvkPEhiXZfnzHsLaR+FVpRjC893uHKYrLcZSt98=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ispboAbqDsc7sG8WbNWD0u6k7+QPEWMdVf6mZfdArUgVcrwOLwsHocRA+tf2wavPW
 Gjib4fabaOpvtwzeYH6+olnGNPIvdYai30eqg/uvz5oBO98MV8OSWO4MEuIZRPHU7t
 9PyAXupTfFjjJxf8qvkQe8qhJFVasGucvvQt0TK0z7TNEiyi1qJhRNNBkc84v3oJJX
 sxpRQ5qejPweRgtwkwzFxiASFddQ06zsQnO/GPsjNdJax5dMffETzgM58T+V4KzQ81
 twF5+z/wrBy5vpbPc4i256NNBCcUM2+8BkDshD3EKdAfOOzYV6g9pub7qEkzPZtX6O
 nX8pzUmb7zzrg==
Message-ID: <41160b37-16ad-4c12-aad2-1214d87d3df0@kernel.org>
Date: Wed, 5 Mar 2025 17:10:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20250304192041.4048741-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20250304192041.4048741-1-daeho43@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/5/25 03:20,
 Daeho Jeong wrote: > From: Daeho Jeong <daehojeong@google.com>
 > > current_reserved_blocks is not allowed to utilize. For some zoned >
 storage devices, vendors will provide extra spac [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpkm9-0008MS-Ig
Subject: Re: [f2fs-dev] [PATCH] f2fs: subtract current_reserved_blocks from
 total
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/5/25 03:20, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> current_reserved_blocks is not allowed to utilize. For some zoned
> storage devices, vendors will provide extra space which was used for
> device level GC than specs and we will use this space for filesystem
> level GC. This extra space should not be shown to users, otherwise,
> users will see not standardized size number like 530GB, not 512GB.

Hi Daeho,

However, if there are other users e.g. oem or vendor want to use
reserved_blocks and current_reserved_blocks sysfs interface to
reserve space, then, total size will be less than 512GB?

What do you think of adding a new variable to indicate reserved
space for zoned storage case only?

Thanks,

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/super.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 19b67828ae32..c346dcc2518a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1833,10 +1833,9 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
>  	buf->f_type = F2FS_SUPER_MAGIC;
>  	buf->f_bsize = sbi->blocksize;
>  
> -	buf->f_blocks = total_count - start_count;
> -
>  	spin_lock(&sbi->stat_lock);
>  
> +	buf->f_blocks = total_count - start_count - sbi->current_reserved_blocks;
>  	user_block_count = sbi->user_block_count;
>  	total_valid_node_count = valid_node_count(sbi);
>  	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
