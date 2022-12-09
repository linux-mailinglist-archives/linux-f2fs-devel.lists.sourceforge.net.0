Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7449164896F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Dec 2022 21:20:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p3jqi-0005NA-0I;
	Fri, 09 Dec 2022 20:20:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p3jqd-0005N2-0A
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 20:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rM/WqfzSSQfd8BMHhoTpmscTjbzLeSvwIwcnhSYxbbo=; b=BnYfpJKfhE9vH1dsFQTV4hlIcy
 3WCM17Girx4Lb0JEfTC5/o1muSgXm7E0EWfa0y+yWwMQun7MIawXqeJW0UVTRj0fccT8JrgjVLPes
 2CM226CA7UaNXAPgpqXuqKSUsw7fbCFuaE6jVX/7Jr6sVpN7NUe7e1wMPsRnFF0pBhqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rM/WqfzSSQfd8BMHhoTpmscTjbzLeSvwIwcnhSYxbbo=; b=VPkwXY//Mt2peBs9WqC4Yg/fiM
 QzKQj6G+mnDpU/ooEnb1od6XCn4kvAXalmm4s2wr9k8FUlqyxhEr7jpq2wX/iq5KLYwUbktPzTkP/
 f5/xc58gzgZzhXrMADkw6LVQXROxTPEHnA48lrf1R2l8kG/4O89ExHd68jgYS5mPubis=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p3jqc-00BdIy-6T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Dec 2022 20:19:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1B1BB828D4;
 Fri,  9 Dec 2022 20:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D05C433D2;
 Fri,  9 Dec 2022 20:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670617186;
 bh=n/aLPvjBDYJVMFXxElsDKBo/M3EKYJZF4SnN3OdN5zs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CzhWZ+5epGcSYwjTVOqnGyRc/3hnCRskyG1PI2aBYuzNq0mRZf6lU/fqHOorwhGNy
 HYINjFWS6Jjfh0Nu6Hx+X4fpCgOm3qqh6oO9iaeA1bGp+IPd3ZPo/4z/N4CM1vKMl4
 EBzIJvcZrdxyKyM2+F2GhVyclV41LEp8wwRVxayv7ck+7JSLQy0leJzQALhS6gDyor
 EbUyBb9bBtntXTW2Wlkgso7jizPCiXJJfhgMyzjgqmyzvMZIcggAuMoIaPj6cJvwX2
 J1PxCrbeVcdCKunufoAQHwfLPMz2D4yWJOcpu/kOfwgaRHxltkZvbzUmnXRoayphMJ
 +1kwkz2VHxMHA==
Date: Fri, 9 Dec 2022 12:19:44 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: zhoudan8 <zhuqiandann@gmail.com>
Message-ID: <Y5OYYJYx9G2LbRmc@google.com>
References: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208050808.2448146-1-zhoudan8@xiaomi.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/08, zhoudan8 wrote: > In compress_mode=user,
 f2fs_release_compress_blocks()
 > does not verify whether it has been compressed and > sets
 FI_COMPRESS_RELEASED
 directly. which will lead to > return [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p3jqc-00BdIy-6T
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't set FI_COMPRESS_RELEASED if file
 is not compressed
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
Cc: zhoudan8 <zhoudan8@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/08, zhoudan8 wrote:
> In compress_mode=user, f2fs_release_compress_blocks()
>  does not verify whether it has been compressed and
>  sets FI_COMPRESS_RELEASED directly. which will lead to
> return -EINVAL after calling compress.
> To fix it,let's do not set FI_COMPRESS_RELEASED if file
> is not compressed.

Do you mean you want to avoid EINVAL on a file having FI_COMPRESS_RELEASED
with zero i_compr_blokcs?

I think the current logic is giving the error on a released file already.

> 
> Signed-off-by: zhoudan8 <zhoudan8@xiaomi.com>
> ---
>  fs/f2fs/file.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 82cda1258227..f32910077df6 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3451,14 +3451,13 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
>  	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>  	if (ret)
>  		goto out;
> -
> -	set_inode_flag(inode, FI_COMPRESS_RELEASED);
>  	inode->i_ctime = current_time(inode);
>  	f2fs_mark_inode_dirty_sync(inode, true);
>  
>  	if (!atomic_read(&F2FS_I(inode)->i_compr_blocks))
>  		goto out;
>  
> +	set_inode_flag(inode, FI_COMPRESS_RELEASED);
>  	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>  	filemap_invalidate_lock(inode->i_mapping);
>  
> -- 
> 2.38.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
