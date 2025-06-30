Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85055AEE4B8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 18:36:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjSe481W1zqOO1tSBE6U0P1/MP4d9SI35a9J8AT4aGw=; b=WMWuiubkUvm/93qTAHhy5BTsR7
	tm/7IXz2viqzvrFwkrRk82G/ut+KLzgfH9jx61MyG8HI4uNuROaI2J6tBptVhSAYjjePpOuSaxoI0
	ovjL88FLISBlwfp54N4rZUU+BKupwVH5hO4GkTZoz62By9pP+qQuHVXJu+o/XJE6cCFc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWHUC-0006wr-O5;
	Mon, 30 Jun 2025 16:36:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uWHUB-0006wk-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 16:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=orKaRl/IL+LlBIh+gduqZMjyMHZV6piIUUv4cwUjwBM=; b=NVX51X++lqB+b/l1/WlvkRaLaG
 8HCOaaWZ6THQvKREB9j/Gm5eP8qYGVEMCPxxdcFR16tUS+nfxXiiwsrry5a9ndXXjO5bVxlKxtido
 OK9IhmEbN3jiv9p9e7A3mrvy4IyOH90zWwSX3Qqo6bUSr+QnYxemJo2KDvoMaJ4SyewY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=orKaRl/IL+LlBIh+gduqZMjyMHZV6piIUUv4cwUjwBM=; b=PY4UPnbM1OxNXtZ/j8WudEptfK
 zrEX8trCQ7GgYvsuaSGgV+kwcJCmrJQyFTfbbq3fe8deSiRbj+EhM+lPrxUP79G44IZpZX0KxYphq
 HQi52goIrNXSTd7HpOPGXgPa+7uEDi1Okiz0Zb0M1OQKynd4rNr9boEC3wEOpug56vlc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWHUB-0004jf-1u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 16:36:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A5E7A5353E;
 Mon, 30 Jun 2025 16:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD49C4CEF1;
 Mon, 30 Jun 2025 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751301352;
 bh=Ml+ykxexs/4VAYBnw+V4Z2aKCJJuZGuUfSSJ+SJWmEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rAg/zjah/TaXBn/ewKWLXuAWNIq3V6JQ2P/51AHn/AHYNADyenNKO727uxLbNDd0C
 AIpaPXBQlKuAgEgkD9QmLi1ze/FWsXvEI4MOd3rATvEfggjApkxzIA8irTnvmPXI2w
 cs0OJlOi9duJEOcfyYkzzMlgQb82tBM9W3vcdFha8lPWJyisYyyRjtgtGrUW22TWeH
 /yTQjLpiq4BEz1YAWxEAMXoBzIQi/wDK1JYnqedlzJTa5FYHLs+zikXYIVR330zASA
 4uHqZcpKXbb8E3dNySo5/8qqc9OClvNlo3pzN+UiM15Ben2iamxpHcinOWcUQEPRz1
 1NCFhInJMbCrw==
Date: Mon, 30 Jun 2025 16:35:49 +0000
To: wangzijie <wangzijie1@honor.com>
Message-ID: <aGK85SAE9kDcVAMe@google.com>
References: <20250630095454.3912441-1-wangzijie1@honor.com>
 <20250630095454.3912441-2-wangzijie1@honor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630095454.3912441-2-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I think we can clean up more like this?
 https://lore.kernel.org/linux-f2fs-devel/20250630160839.1142073-1-jaegeuk@kernel.org/T/#u
 On 06/30, wangzijie wrote: > To prevent scattered pin block generation, don't
 allow non-section aligned truncation > to smaller or equal size on pinned
 file. But for truncation to larger size, after > [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uWHUB-0004jf-1u
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned
 truncation to smaller/equal size on pinned file
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I think we can clean up more like this?

https://lore.kernel.org/linux-f2fs-devel/20250630160839.1142073-1-jaegeuk@kernel.org/T/#u

On 06/30, wangzijie wrote:
> To prevent scattered pin block generation, don't allow non-section aligned truncation
> to smaller or equal size on pinned file. But for truncation to larger size, after
> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
> we only support overwrite IO to pinned file, so we don't need to consider
> attr->ia_size > i_size case.
> In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
> ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
> setattr_prepare().
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
> v5:
> - fix xfstests #494 fail
> ---
>  fs/f2fs/file.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 78368b793..d4feea44b 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1070,6 +1070,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>  	if (err)
>  		return err;
>  
> +	/*
> +	 * To prevent scattered pin block generation, we don't allow
> +	 * smaller/equal size unaligned truncation for pinned file.
> +	 * We only support overwrite IO to pinned file, so don't
> +	 * care about larger size truncation.
> +	 * We need to check this after setattr_prepare() because xfstests
> +	 * #494 assumes truncation on active swapfile(pinned) will
> +	 * return ETXTBSY by setattr_prepare() -> inode_newsize_ok().
> +	 */
> +	if (attr->ia_valid & ATTR_SIZE) {
> +		if (f2fs_is_pinned_file(inode) &&
> +			attr->ia_size <= i_size_read(inode) &&
> +			!IS_ALIGNED(attr->ia_size,
> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
> +			return -EINVAL;
> +	}
> +
>  	err = fscrypt_prepare_setattr(dentry, attr);
>  	if (err)
>  		return err;
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
