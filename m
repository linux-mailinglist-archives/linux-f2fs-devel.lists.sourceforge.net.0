Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F222072CE21
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 20:29:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8mHc-0004VJ-7N;
	Mon, 12 Jun 2023 18:28:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q8mHb-0004VD-1h
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 18:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NMEvv/gGiSVl+qG10Wxp1VYIbyZTCcH5Sgt3y00Mn3Y=; b=joGmfzBcxsP6nMOXWh/9SW2y2O
 oS47wzSRo7aIIvutaLBR/VThTgWMSiUAPzNUt66XvjiSXbMZnVzk8JiqmLgDzbHSuajMZoLHgWlbm
 yqQR3KdrPfHCEp69RLeiJQtMFkrgAvm9u7pq2fInctAc5KlUEKrZjXzU9TsNhaP7VTNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NMEvv/gGiSVl+qG10Wxp1VYIbyZTCcH5Sgt3y00Mn3Y=; b=jFlqTjWwTCSCCTYuXMXB92T9gV
 5PGLUWFlOL5AM65hRkLbqtHoBhdSRS+BMWx/x1Hcg7N5s6sDXlrzcQFetAB+MqN8+kqJoSyjPwqbU
 4p27ePApNbNDCoCXq0Sjn01nkoRmHxql+E1SnENp0JiuEZKwuzvTEBEm2oJ7O/4YnpTk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8mHb-0002de-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 18:28:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8B1562CFB;
 Mon, 12 Jun 2023 18:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25848C433EF;
 Mon, 12 Jun 2023 18:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686594524;
 bh=c+yC6Rpmu7pRoA+uZdVLb6zb7tJTIGh/t+XCxSFYxDs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iajpz+lP7/dk43ai9rqBh+O7PPCHDIZd05sufNM+6EO7KM9eKW3Z1qTrWvYZZh/FU
 iFXUPYu5iGQs25ISSPV4Km+kUF2Z3mqiIqiDXfvy0OfyQvrJqXhy6Sq9CUNoVvDRYH
 aCOv/YJmbv8WZdg/1OoiUC6+t/xDaGgukIWc3HDDNI7tZ70/5UbWx6C6+T8ubIbx53
 U86tXtY3KZ8sBet2znXFUojKWc2YqTmoU61PLhSGZ0VdK1hIzEP1GE/ybSOZyMTH17
 NRjnqCxSjIQTvzNkJD4zyOiDdxetYJZ9Rt0puZm71mmZUbZeDWbnGT4nz3lT3umAY4
 H4bFUz3GMhwVg==
Date: Mon, 12 Jun 2023 11:28:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <ZIdj2jAFDvkZ3eJW@google.com>
References: <20230407183148.23231-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230407183148.23231-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/08, Yangtao Li wrote: > Commit 3fde13f817e2 ("f2fs:
 compress: support compress level") > forgot to do basic compress level check, 
 let's add it. > > Signed-off-by: Yangtao Li <frank.li@vivo.com> [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8mHb-0002de-2Q
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add sanity compress level check for
 compressed file
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
Cc: Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/08, Yangtao Li wrote:
> Commit 3fde13f817e2 ("f2fs: compress: support compress level")
> forgot to do basic compress level check, let's add it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  fs/f2fs/inode.c | 106 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 77 insertions(+), 29 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index bb5b365a195d..c2460f51bf80 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -10,6 +10,8 @@
>  #include <linux/buffer_head.h>
>  #include <linux/writeback.h>
>  #include <linux/sched/mm.h>
> +#include <linux/lz4.h>
> +#include <linux/zstd.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -202,6 +204,79 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
>  	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
>  }
>  
> +static bool sanity_check_compress_inode(struct inode *inode,
> +			struct f2fs_inode *ri)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	unsigned char compress_level;
> +
> +	if (ri->i_compress_algorithm >= COMPRESS_MAX) {
> +		f2fs_warn(sbi,
> +			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
> +			__func__, inode->i_ino, ri->i_compress_algorithm);
> +		goto err;
> +	}
> +	if (le64_to_cpu(ri->i_compr_blocks) >
> +			SECTOR_TO_BLOCK(inode->i_blocks)) {
> +		f2fs_warn(sbi,
> +			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
> +			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
> +			SECTOR_TO_BLOCK(inode->i_blocks));
> +		goto err;
> +	}
> +	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> +		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
> +		f2fs_warn(sbi,
> +			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
> +			__func__, inode->i_ino, ri->i_log_cluster_size);
> +		goto err;
> +	}
> +
> +	compress_level = le16_to_cpu(ri->i_compress_flag) >>
> +				COMPRESS_LEVEL_OFFSET;
> +	switch (ri->i_compress_algorithm) {
> +	case COMPRESS_LZO:
> +#ifdef CONFIG_F2FS_FS_LZO
> +		if (compress_level)
> +			goto err_level;
> +#endif
> +		break;
> +	case COMPRESS_LZORLE:
> +#ifdef CONFIG_F2FS_FS_LZORLE
> +		if (compress_level)
> +			goto err_level;
> +#endif
> +		break;
> +	case COMPRESS_LZ4:
> +#ifdef CONFIG_F2FS_FS_LZ4
> +#ifdef CONFIG_F2FS_FS_LZ4HC
> +		if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
> +				compress_level > LZ4HC_MAX_CLEVEL)
> +#else
> +		if (compress_level)
> +#endif
> +			goto err_level;
> +#endif
> +		break;
> +	case COMPRESS_ZSTD:
> +#ifdef CONFIG_F2FS_FS_ZSTD
> +		if (!compress_level || compress_level > zstd_max_clevel())

I think compress_level=0 is wrong, since that'll be changed to the default level later.
I'll modify to assign the correct level, so please revisit this patch later.

> +			goto err_level;
> +#endif
> +		break;
> +	default:
> +		goto err_level;
> +	}
> +
> +	return true;
> +err_level:
> +	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
> +		  __func__, inode->i_ino, compress_level);
> +err:
> +	set_sbi_flag(sbi, SBI_NEED_FSCK);
> +	return false;
> +}
> +
>  static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> @@ -286,35 +361,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
>  			fi->i_flags & F2FS_COMPR_FL &&
>  			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
> -						i_log_cluster_size)) {
> -		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
> -			set_sbi_flag(sbi, SBI_NEED_FSCK);
> -			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
> -				"compress algorithm: %u, run fsck to fix",
> -				  __func__, inode->i_ino,
> -				  ri->i_compress_algorithm);
> -			return false;
> -		}
> -		if (le64_to_cpu(ri->i_compr_blocks) >
> -				SECTOR_TO_BLOCK(inode->i_blocks)) {
> -			set_sbi_flag(sbi, SBI_NEED_FSCK);
> -			f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
> -				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
> -				  __func__, inode->i_ino,
> -				  le64_to_cpu(ri->i_compr_blocks),
> -				  SECTOR_TO_BLOCK(inode->i_blocks));
> -			return false;
> -		}
> -		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> -			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
> -			set_sbi_flag(sbi, SBI_NEED_FSCK);
> -			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
> -				"log cluster size: %u, run fsck to fix",
> -				  __func__, inode->i_ino,
> -				  ri->i_log_cluster_size);
> -			return false;
> -		}
> -	}
> +						i_log_cluster_size))
> +		return sanity_check_compress_inode(inode, ri);
>  
>  	return true;
>  }
> -- 
> 2.35.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
