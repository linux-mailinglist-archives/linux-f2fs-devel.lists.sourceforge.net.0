Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B71E84A2A97
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jan 2022 01:27:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDbas-0001yS-1O; Sat, 29 Jan 2022 00:27:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nDbar-0001yM-1I
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 00:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kgggCxgOf3l4epz8hb/uElWAXdfNjDOPm9mdtvPWSLQ=; b=CNiQNw2VSG/AEBw1RDHOvt4bva
 Bhiz/r2T4p2+kDyNu/aplxG/bqj/7Nx4oUk7JSgGPnMjrASX4eDK6L7EGeljqzK1MZnsZAI7DPqJx
 gZmnwjMrJfX/hQcubF9f4t3yEu4xrAlbEI1jQs4s+CNOLebQiLG6GfRfGkD43BbQZ5IQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kgggCxgOf3l4epz8hb/uElWAXdfNjDOPm9mdtvPWSLQ=; b=NdwW96ktHtTB7Js8yBd8PIJFF4
 Wa8mNNCNyuC9tirAQi/CQBK+bEK0+aIObYQHnKwLZj+PH6LznvNu9wD+s5ULrVfFIqFTTVQ8OplLt
 fEHAyyy4yV4pVoUn1ZWDIS+qxOdnVO7Z+WvBxk6HtjUOMLSz8DdVUuUIzbtO6pie3gcE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDbao-001cRC-UU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 00:27:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9033661F6E;
 Sat, 29 Jan 2022 00:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B71C340E7;
 Sat, 29 Jan 2022 00:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643416065;
 bh=pMYiYWwTXCaMUttKGxLCbba/TS8VTa1Kq/qthmLQc8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hTAM+kCV/tcMtH1taJy3HbXKHFdeNrapKvJ55E6k6BNArYcDR9hvzVgpghKlX+fo8
 HSMYhybQBTB3flb/RRUQcCjU/wcnYCL3Jt1CTeg+J9diUVbSi1+k/E6nd9NK8ZSRHU
 QPAuxWZPSPNSrt2i47uKzMi7EydVnxmMd06oSEIaEqbxc5XzW539kHtLE5NeNWKwyg
 GF1Y/+nW/SESPfVZxVHkIqFDwtt1JIUzHbBjA7oeQIhiTtmv6Gt8OqmagKkT/tsq0r
 staxJFN6kFqa9jRH5RC5sjz723a4e4C3jEV0y6EyJ2XFxaPkcfzlFoVx9/KThoREV1
 ybqbbx6by3l4A==
Date: Fri, 28 Jan 2022 16:27:43 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YfSJ/xstxw8mFw80@google.com>
References: <20220128233940.79464-1-ebiggers@kernel.org>
 <20220128233940.79464-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128233940.79464-5-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/28,
 Eric Biggers wrote: > From: Eric Biggers <ebiggers@google.com>
 > > Encrypted files traditionally haven't supported DIO, due to the need
 to > encrypt/decrypt the data. However, when the encry [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDbao-001cRC-UU
Subject: Re: [f2fs-dev] [PATCH v11 4/5] f2fs: support direct I/O with
 fscrypt using blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/28, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Encrypted files traditionally haven't supported DIO, due to the need to
> encrypt/decrypt the data.  However, when the encryption is implemented
> using inline encryption (blk-crypto) instead of the traditional
> filesystem-layer encryption, it is straightforward to support DIO.
> 
> Therefore, make f2fs support DIO on files that are using inline
> encryption.  Since f2fs uses iomap for DIO, and fscrypt support was
> already added to iomap DIO, this just requires two small changes:
> 
> - Let DIO proceed when supported, by checking fscrypt_dio_supported()
>   instead of assuming that encrypted files never support DIO.
> 
> - In f2fs_iomap_begin(), use fscrypt_limit_io_blocks() to limit the
>   length of the mapping in the rare case where a DUN discontiguity
>   occurs in the middle of an extent.  The iomap DIO implementation
>   requires this, since it assumes that it can submit a bio covering (up
>   to) the whole mapping, without checking fscrypt constraints itself.
> 
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/f2fs/data.c | 7 +++++++
>  fs/f2fs/f2fs.h | 6 +++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8c417864c66ae..020d47f97969c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4044,6 +4044,13 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  
>  	iomap->offset = blks_to_bytes(inode, map.m_lblk);
>  
> +	/*
> +	 * When inline encryption is enabled, sometimes I/O to an encrypted file
> +	 * has to be broken up to guarantee DUN contiguity.  Handle this by
> +	 * limiting the length of the mapping returned.
> +	 */
> +	map.m_len = fscrypt_limit_io_blocks(inode, map.m_lblk, map.m_len);
> +
>  	if (map.m_flags & (F2FS_MAP_MAPPED | F2FS_MAP_UNWRITTEN)) {
>  		iomap->length = blks_to_bytes(inode, map.m_len);
>  		if (map.m_flags & F2FS_MAP_MAPPED) {
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index eb22fa91c2b26..db46f3cf0885d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4371,7 +4371,11 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>  	int rw = iov_iter_rw(iter);
>  
> -	if (f2fs_post_read_required(inode))
> +	if (!fscrypt_dio_supported(iocb, iter))
> +		return true;
> +	if (fsverity_active(inode))
> +		return true;
> +	if (f2fs_compressed_file(inode))
>  		return true;
>  
>  	/* disallow direct IO if any of devices has unaligned blksize */
> -- 
> 2.35.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
