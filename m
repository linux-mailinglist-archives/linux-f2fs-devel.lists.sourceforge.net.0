Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C7E9B8855
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 02:23:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6gNb-0004Dq-P2;
	Fri, 01 Nov 2024 01:23:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1t6gNZ-0004Dc-Oc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 01:23:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jzy7y6P/lBfK3HvrIgyNtJU919YgrzenIJGTqtSnTjU=; b=nF5O5gYwRje25y6izpIXGNV78S
 yTLiCFKZVOBdl7X4JIlSzZ2kO+1WlgxvIOUJdva37SKV5BhBRJkrOnc2S7N0MvA6gWKQVjvoGQQeq
 N+rGuzSroj0Q3JFAdKhdZ1T5YcYu2Rrwpuu8aFGSspGRm6VXdmgBsAvH11+VCyXJMEEQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jzy7y6P/lBfK3HvrIgyNtJU919YgrzenIJGTqtSnTjU=; b=db02+KFGaLuL1oP3MA3iLBlQwv
 3+pGATd7SGkhxIjImb9kwy5lG3Mf8+d8sveTLpae2mI6oOk4VV3VvjesT38DHoXf4FYSNbzwK5eRO
 GRnDF2ceXtykkD7j3AMXlYZxa6JjyCnxQdp+I0eepLyphPt9zZ4WcaqH9DpTd+Yrzo5s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t6gNV-0006F7-Cx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 01:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1AA04A414C2;
 Fri,  1 Nov 2024 01:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1F2C4CEC3;
 Fri,  1 Nov 2024 01:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730424179;
 bh=wzXs1qdakHCZrExniZa/Yr49WnDzRpD4rfPpqytB2AA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RzXXgyVry1Kt8aZehwH78q50mTUIx92z5UnJtm+a6cRGZshTQ3aXRPibFtizcWwn7
 1EA59r4g1WaI0F8Kj+ULKQjfwzxvzA683fONZKldR0YEbn5qRgk55+CNHJynmX+nLd
 IzlF/DCtyqqbEOojIq4LVZNQx8n0XKOitB18YHxo0Zg9gaSG1xTLULu5FHE2l/mMzi
 yKBwVSM8XQuAaVdK4Wna1ci9aie4eVtOWLheXDN10iJ2ydrP/ZjQ6ue6SvgrAYFyrP
 DXvqKeNfblCzgpxh6AE1CukSL4Puu6gf6sIlxujrj5NlMFgDivytBpk/Qh0kcsfJWO
 cQ6MqBd6JyJzw==
Date: Fri, 1 Nov 2024 01:22:57 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <ZyQtcbtzpixFd6Zs@google.com>
References: <20241031102200.440407-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241031102200.440407-1-chao@kernel.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/31, Chao Yu wrote: > f2fs_map_blocks() supports to map
 continuous holes or preallocated > address,
 we should avoid setting F2FS_MAP_MAPPED
 for these cases > only, otherwise, it may fail f2fs_iom [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t6gNV-0006F7-Cx
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to map blocks correctly for direct
 read
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
Cc: kernel test robot <oliver.sang@intel.com>, linux-kernel@vger.kernel.org,
 Cyril Hrubis <chrubis@suse.cz>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/31, Chao Yu wrote:
> f2fs_map_blocks() supports to map continuous holes or preallocated
> address, we should avoid setting F2FS_MAP_MAPPED for these cases
> only, otherwise, it may fail f2fs_iomap_begin(), and make direct
> write fallbacking to use buffered IO and flush, result in performance
> regression.

Is this fixing direct write or read?

> 
> Fixes: 9f0f6bf42714 ("f2fs: support to map continuous holes or preallocated address")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202409122103.e45aa13b-oliver.sang@intel.com
> Cc: Cyril Hrubis <chrubis@suse.cz>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 306b86b0595d..38b85160c6bd 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1676,7 +1676,12 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>  		/* reserved delalloc block should be mapped for fiemap. */
>  		if (blkaddr == NEW_ADDR)
>  			map->m_flags |= F2FS_MAP_DELALLOC;
> -		if (flag != F2FS_GET_BLOCK_DIO || !is_hole)
> +		/*
> +		 * f2fs_map_blocks() supports to map continuous holes or
> +		 * preallocated address, don't set F2FS_MAP_MAPPED for these
> +		 * cases only.
> +		 */
> +		if (flag != F2FS_GET_BLOCK_DIO || map->m_may_create || !is_hole)

So, this is adding map->m_may_create, which is for writes?

>  			map->m_flags |= F2FS_MAP_MAPPED;
>  
>  		map->m_pblk = blkaddr;
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
