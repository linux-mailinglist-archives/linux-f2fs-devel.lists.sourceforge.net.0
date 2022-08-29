Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD275A5348
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Aug 2022 19:36:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSigR-0004fn-Sl;
	Mon, 29 Aug 2022 17:36:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oSigQ-0004fg-3f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cCoDmPPGUWi2TaE2u+WE8+bOYVsn1a40EouY9fKWml8=; b=j7Db5iotx4Jj8kK/HeWL5zVUT1
 eyVuUytxTh1sa49F6GUiHh2dRZPrMiycRMLjO4Ht/1b6OOJKma9LV5iAAHqjE7dJHraGchqBKmbSx
 y3hZ0uFVriOpq5FKW35D6rDAwkpgBsk+tFXlyv2X0jzQdnIrSzi23cfcsVVbfNFXDSQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cCoDmPPGUWi2TaE2u+WE8+bOYVsn1a40EouY9fKWml8=; b=Zd2NfyTD7mNjmWW5jANCO2cmVV
 UwTy2/ZNmt0WLnFSyzn+4f2+nSzp7ChjQNt50pvuhujHxXfbXpQ1i797kBb6pmTysbk+7WFUikwS7
 LJeo21ZLE/eymNZf3Ak1au4HxW/0RJoP6ACEukOUV2jEO1PcsnW5atcQmh9np4RzrsrY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSigP-006duS-5o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 17:36:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21523B8119D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Aug 2022 17:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862B4C433B5;
 Mon, 29 Aug 2022 17:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661794572;
 bh=rsrie5xAIPERRfy5hV2/lMm7+uIPsinOty7KExwvFfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OZI38IqpeQLjkNktjbjkZgbz8ZZ7HJoB8Tea+n9Y1xRKTO/HyDpMNuAzHVsLOMW75
 y7XmNUll7k9IlOpkFVIKUPeVhQTzXE7bA7F3FiNVjDZAcG1AoivaphkxETl1B+Cq7x
 T5mDVb1ehKN6HDtTLZKJjHI/j9A37GVoqSezA4k2ffmkzvg3U4x12+5R57HMHDPY+i
 RgVGOf9pfgD26/6OJcurpLwBP4+nLfqbkfgUY7WkfyKsmiTThx7Bz4pfjhv7vKRD4v
 8nwYlpYJ24uSsiO0U345SWUqnGRZDyIj60mpCctnusSQkdS30E1uNNDZILEC0ABtIk
 xM/Sy+JrekpnA==
Date: Mon, 29 Aug 2022 10:36:10 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Ywz5CrBg6udTMnW/@google.com>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <20220827065851.135710-7-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827065851.135710-7-ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 08/26,
 Eric Biggers wrote: > From: Eric Biggers <ebiggers@google.com>
 > > f2fs only allows direct I/O that is aligned to the filesystem block >
 size. Given that fact, simplify f2fs_force_buffered_i [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oSigP-006duS-5o
Subject: Re: [f2fs-dev] [PATCH v5 6/8] f2fs: simplify
 f2fs_force_buffered_io()
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/26, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> f2fs only allows direct I/O that is aligned to the filesystem block
> size.  Given that fact, simplify f2fs_force_buffered_io() by removing
> the redundant call to block_unaligned_IO().
> 
> This makes it easier to reuse this code for STATX_DIOALIGN.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/file.c | 27 +++++----------------------
>  1 file changed, 5 insertions(+), 22 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 8a9455bf956f16..8e11311db21060 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -808,22 +808,9 @@ int f2fs_truncate(struct inode *inode)
>  	return 0;
>  }
>  
> -static int block_unaligned_IO(struct inode *inode, struct kiocb *iocb,
> -			      struct iov_iter *iter)
> -{
> -	unsigned int i_blkbits = READ_ONCE(inode->i_blkbits);
> -	unsigned int blocksize_mask = (1 << i_blkbits) - 1;
> -	loff_t offset = iocb->ki_pos;
> -	unsigned long align = offset | iov_iter_alignment(iter);
> -
> -	return align & blocksize_mask;
> -}
> -
> -static bool f2fs_force_buffered_io(struct inode *inode,
> -				   struct kiocb *iocb, struct iov_iter *iter)
> +static bool f2fs_force_buffered_io(struct inode *inode, int rw)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	int rw = iov_iter_rw(iter);
>  
>  	if (!fscrypt_dio_supported(inode))
>  		return true;
> @@ -836,13 +823,9 @@ static bool f2fs_force_buffered_io(struct inode *inode,
>  	if (f2fs_is_multi_device(sbi) && !sbi->aligned_blksize)
>  		return true;
>  
> -	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
> -		if (block_unaligned_IO(inode, iocb, iter))
> -			return true;
> -		if (F2FS_IO_ALIGNED(sbi))
> -			return true;
> -	}
> -	if (is_sbi_flag_set(F2FS_I_SB(inode), SBI_CP_DISABLED))
> +	if (f2fs_lfs_mode(sbi) && rw == WRITE && F2FS_IO_ALIGNED(sbi))
> +		return true;
> +	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
>  		return true;
>  
>  	return false;
> @@ -4222,7 +4205,7 @@ static bool f2fs_should_use_dio(struct inode *inode, struct kiocb *iocb,
>  	if (!(iocb->ki_flags & IOCB_DIRECT))
>  		return false;
>  
> -	if (f2fs_force_buffered_io(inode, iocb, iter))
> +	if (f2fs_force_buffered_io(inode, iov_iter_rw(iter)))
>  		return false;
>  
>  	/*
> -- 
> 2.37.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
