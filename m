Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD46D5CDC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 12:16:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjdi0-0008Qp-5k;
	Tue, 04 Apr 2023 10:16:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pjdhs-0008Q2-PS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 10:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g/LCE4CN0nkHjrR5JVaoNr74pAP6gTOtZCptFYAi/Js=; b=AYeMbYvjdZYXwKvE/Ne+AxKM7o
 YdVztNVJ0fx+WLOUF4dw4zAdp3valMQTjn166wj8B6b0u+WHIo4smXq9YPPG8l2UJ/rrVKf0gplPL
 GVPNDPwNAgR+M7zLS5ViZxad2jS36okyIBxFuFO3+38yNvju7aRBe/vKtmMgw7Wm+yyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g/LCE4CN0nkHjrR5JVaoNr74pAP6gTOtZCptFYAi/Js=; b=bWjpdDdgMyh/+/8/+vAt3z7Jcx
 9zkTBlMwa52zDVVbQwq8SzGpkAVqP97o7DM+nuBqQ4mI9MbTkwioYpa4bO3v0o9H85lRr5eVOCCD5
 X9z2mteQvxL91tOWxWB3w5EqEPQlM6/6K8hJqdbxmwavEtzQZ6fO9YWSEPJsCUU+LnCs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjdhq-000418-1n for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 10:16:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFB146211C;
 Tue,  4 Apr 2023 10:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D5EC433D2;
 Tue,  4 Apr 2023 10:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680603355;
 bh=rm1UGIavk3asvTdDupoxoTwlekUJeaAORF0Tuc7qynU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DRYJlvjw9gWNnAe6f82/pn7KfDTJMBEVV/TAJdpqUwWTLxxt7vLACKYQ/quTv5uoe
 WjUmAmRorb9qFtt5fVHy4833A6ddhbzw90iRznR9VX8D1O+LFYIXMkRQNhs+CUaurR
 Rr5b8u/PHDR/WMLmDscYUwvAPxwlhA/EqnFHvNeUfacGakWxnkavTTJRGd5DA+TMER
 Ox0aBv8UzgqYssYc59KbCqg+EDdAMx2UeiuzGoCaKwuTyqeyY6bsQfjRbKeWGHiogm
 jq/VylYEzM/nLWa38JJfcn8mCj7DaonBuAdKEFfps4bvNOA0Rv6DIAs68RjA3wyNV9
 aOs7dBkDPcALA==
Message-ID: <b66f93fc-b37e-8e9b-6b8b-4589a9929c15@kernel.org>
Date: Tue, 4 Apr 2023 18:15:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230404034847.26667-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230404034847.26667-1-frank.li@vivo.com>
X-Spam-Score: -7.1 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/4 11:48, Yangtao Li wrote: > Commit 3fde13f817e2
 ("f2fs: compress: support compress level") > forgot to do basic compress
 level check, let's add it. > > Signed-off-by: Yangtao Li <frank.li@v [...]
 Content analysis details:   (-7.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjdhq-000418-1n
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add sanity compress level check for
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/4 11:48, Yangtao Li wrote:
> Commit 3fde13f817e2 ("f2fs: compress: support compress level")
> forgot to do basic compress level check, let's add it.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -convert to zstd_max_clevel()
>   fs/f2fs/inode.c | 96 ++++++++++++++++++++++++++++++++++---------------
>   1 file changed, 67 insertions(+), 29 deletions(-)
> 
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index bb5b365a195d..e6f45a7a079d 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -10,6 +10,8 @@
>   #include <linux/buffer_head.h>
>   #include <linux/writeback.h>
>   #include <linux/sched/mm.h>
> +#include <linux/lz4.h>
> +#include <linux/zstd.h>
>   
>   #include "f2fs.h"
>   #include "node.h"
> @@ -202,6 +204,69 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
>   	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
>   }
>   
> +static bool sanity_check_compress_inode(struct inode *inode,
> +			struct f2fs_inode *ri)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	unsigned char compress_level;
> +
> +	if (ri->i_compress_algorithm >= COMPRESS_MAX) {
> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
> +		f2fs_warn(sbi,
> +			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
> +			__func__, inode->i_ino, ri->i_compress_algorithm);
> +		return false;
> +	}
> +	if (le64_to_cpu(ri->i_compr_blocks) >
> +			SECTOR_TO_BLOCK(inode->i_blocks)) {
> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
> +		f2fs_warn(sbi,
> +			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
> +			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
> +			SECTOR_TO_BLOCK(inode->i_blocks));
> +		return false;
> +	}
> +	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> +		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
> +		set_sbi_flag(sbi, SBI_NEED_FSCK);
> +		f2fs_warn(sbi,
> +			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
> +			__func__, inode->i_ino, ri->i_log_cluster_size);
> +		return false;
> +	}
> +
> +	compress_level = le16_to_cpu(ri->i_compress_flag) >>
> +				COMPRESS_LEVEL_OFFSET;
> +	switch (ri->i_compress_algorithm) {
> +	case COMPRESS_LZO:
> +	case COMPRESS_LZORLE:
> +		if (compress_level)
> +			goto err;
> +		break;
> +	case COMPRESS_LZ4:

It needs to cover below codes w/ CONFIG_F2FS_FS_LZ4HC and CONFIG_F2FS_FS_LZ4?

> +		if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
> +				compress_level > LZ4HC_MAX_CLEVEL)
> +			goto err;
> +		break;
> +	case COMPRESS_ZSTD:
> +#ifdef CONFIG_F2FS_FS_ZSTD
> +		if (!compress_level || compress_level > zstd_max_clevel())
> +			goto err;
> +#endif
> +		break;
> +	default:
> +		goto err;
> +	}
> +
> +	return true;
> +
> +err:
> +	set_sbi_flag(sbi, SBI_NEED_FSCK);
> +	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
> +		  __func__, inode->i_ino, compress_level);

Move above codes to default case?

Thanks,

> +	return false;
> +}
> +
>   static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> @@ -286,35 +351,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>   	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
>   			fi->i_flags & F2FS_COMPR_FL &&
>   			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
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
>   	return true;
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
