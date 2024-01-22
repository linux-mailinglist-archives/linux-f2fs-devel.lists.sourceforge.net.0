Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC518359DD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 04:46:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRlGd-0003oS-FT;
	Mon, 22 Jan 2024 03:46:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rRlGc-0003oL-Eg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 03:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GdsnNBBgM/g4KRs70o590kNkQ0m6lb+oArrSoi2l2aw=; b=kE14BoikFJVyKOGGUU0U5ZsjcI
 EMYet22XdvS/z8yJ0jy8Tm2C4vJbWudZoRXRJ76h1RW8Ciq7euV1Fu8BE2QUUwU87Vq/8d9+HErdR
 renCsriCmaE96sW1Zo5raKlpg9ZK+h052pFaDF5N8iZHuf7zlwk7oLa5HdWoJCFY4CyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GdsnNBBgM/g4KRs70o590kNkQ0m6lb+oArrSoi2l2aw=; b=cUXmeX4FSSZ0puk0S00LgAaX4u
 sx+jxUu8UCYoaQFa28LxTfIZYNk4C46eObMgP6Jr1mIggPaewY57KgZU1BwnoKY6LlRkMYFpcR3rD
 O1zdgGCR/3A07xS6ai8baxnWlZc2c4GHxEzRr+1p0uGiIA/JDQ4293Q8fGBGUl9Oc2aI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRlGb-0003GX-28 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 03:46:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5371061035;
 Mon, 22 Jan 2024 03:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A32EC433F1;
 Mon, 22 Jan 2024 03:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705895182;
 bh=zoejXegjHJcV0qb/kFDz+v6bQRItyzAV9KNxzAmqKVc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fgQlq/GbB6+8LA5iWZU6GowrqI9gQMCYu/djK/+UMe3jkn2jikx8JQJ8xgs6FBP2p
 XmDnpz28VN8vQMM5bUOUI5fHxSuL8KMsnqCn10buT6gv2qkSGku12PtWtwYYQFW5I0
 afTn3oZEF+tKv8kUyaXJ4d2j2OqQh9KsAgtqVEAL6Xjs7TmnHzb3YiHA3jCyIoRPb7
 GYqbtCQFne8Q7EF8haAgiIThDI9c+eXpUyQGln5kE/8BdLql6rOdbAN55QtdXOUi47
 RY2aQh8gHfcs5tjbJZynf6fLJGQYMY7q16odOFBrH6YoxXqeflf/YQZ1DB8OpBrk37
 ZPhrXHfW9qflg==
Message-ID: <74243f43-c129-4530-970c-4de2afcd307e@kernel.org>
Date: Mon, 22 Jan 2024 11:46:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1703502715-11936-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1703502715-11936-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/25 19:11, Zhiguo Niu wrote: > There is a potentail
 deadloop issue in the corner case of > CONFIG_F2FS_FAULT_INJECTION is enabled
 and the return value > of f2fs_reserve_new_block is error bu [...] 
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRlGb-0003GX-28
Subject: Re: [f2fs-dev] [PATCH V1] f2fs: fix potentail deadloop issue in
 do_recover_data
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
Cc: ke.wang@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/12/25 19:11, Zhiguo Niu wrote:
> There is a potentail deadloop issue in the corner case of
> CONFIG_F2FS_FAULT_INJECTION is enabled and the return value
> of f2fs_reserve_new_block is error but not -ENOSPC, such as
> this error case:
> if (unlikely(is_inode_flag_set(dn->inode, FI_NO_ALLOC)))
> 		return -EPERM;

I don't see any path to trigger this error? am I missing something?

> besides, the mainly error -ENOSPC has been handled as bug on,
> so other error cases can be proecssed normally without looping.

commit 975756c41332bc5e523e9f843271ed5ab6aaaaaa
Author: Jaegeuk Kim <jaegeuk@kernel.org>
Date:   Thu May 19 11:57:21 2016 -0700

     f2fs: avoid ENOSPC fault in the recovery process

     This patch avoids impossible error injection, ENOSPC, during recovery process.

Please check above patch, I guess intention of adding such loop is
to avoid mount failure due to fault injection was triggered in
f2fs_reserve_new_block().

What about change as blew?
- keep the loop to avoid mount failure.
- remove bug_on() to avoid panic due to fault injection error.

#define DEFAULT_RETRY_COUNT		8

		for (loops = DEFAULT_RETRY_COUNT; loops > 0; loops--) {
			err = f2fs_reserve_new_block(&dn);
			if (!err ||
				!IS_ENABLED(CONFIG_F2FS_FAULT_INJECTION))
				break;
		}

Thanks,

> 
> Fixes: 956fa1ddc132 ("f2fs: fix to check return value of f2fs_reserve_new_block()")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>   fs/f2fs/recovery.c | 26 ++++++++------------------
>   1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 21381b7..5d658f6 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -710,15 +710,10 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>   		 */
>   		if (dest == NEW_ADDR) {
>   			f2fs_truncate_data_blocks_range(&dn, 1);
> -			do {
> -				err = f2fs_reserve_new_block(&dn);
> -				if (err == -ENOSPC) {
> -					f2fs_bug_on(sbi, 1);
> -					break;
> -				}
> -			} while (err &&
> -				IS_ENABLED(CONFIG_F2FS_FAULT_INJECTION));
> -			if (err)
> +			err = f2fs_reserve_new_block(&dn);
> +			if (err == -ENOSPC)
> +				f2fs_bug_on(sbi, 1);
> +			else if (err)
>   				goto err;
>   			continue;
>   		}
> @@ -727,15 +722,10 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
>   		if (f2fs_is_valid_blkaddr(sbi, dest, META_POR)) {
>   
>   			if (src == NULL_ADDR) {
> -				do {
> -					err = f2fs_reserve_new_block(&dn);
> -					if (err == -ENOSPC) {
> -						f2fs_bug_on(sbi, 1);
> -						break;
> -					}
> -				} while (err &&
> -					IS_ENABLED(CONFIG_F2FS_FAULT_INJECTION));
> -				if (err)
> +				err = f2fs_reserve_new_block(&dn);
> +				if (err == -ENOSPC)
> +					f2fs_bug_on(sbi, 1);
> +				else if (err)
>   					goto err;
>   			}
>   retry_prev:


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
