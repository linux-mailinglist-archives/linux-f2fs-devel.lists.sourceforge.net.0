Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E42229DE0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 19:07:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyIDa-0008Ic-Tj; Wed, 22 Jul 2020 17:07:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyIDa-0008IV-4H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0meEFeG4bJPayZeEdQs8Am8nAdoiZC7KNExpkO94+N0=; b=QFUJDRSnTsgM7lBcuWDEUf2S2f
 aYJxDRPFsUz25lV73gSXaE9qoFALdHGkMB4za+/XSLq7eb6S+WYCXwKO4LTyWi2H/Qs4zftcJNI5S
 l5IvAxQkBx3Ovp0R5ZBfPUhlodfv3yPozpQzFA1Gcn6Zax4Wf0aBL9BxZKjJEmWU5yTk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0meEFeG4bJPayZeEdQs8Am8nAdoiZC7KNExpkO94+N0=; b=PC955Db3UImXKA5mvomqk2K5o+
 9Ya5Q2PVodldqHX5GHMmQXNSxTXfN5nTEltfyyq8cZy20ajF/3MjBWedVApyzPgxyRaeIwtUwXQFv
 h0PHFL4Izdfki8d9KL/hfG9YFZ6PFU9SEjTkz6YL4QIf93NW8/hdLp7JimCuhqoGHIJQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyIDY-00GnIO-UQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 17:07:46 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76DED2065F;
 Wed, 22 Jul 2020 17:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595437659;
 bh=lrvRB6IMtIhg3LyXmKGp5DKL4F5360nyGUKKpkB6a6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aI9Wi6pSaEG/S9c9su+uORfKY473DfMmnndryhb7OhnbvOIVUD6fkKmpBSCRE7UDh
 Fq+REBJwGcG+FFGpCsa9h1LBIEdi95Eq9jp274ieWYidzJHQ1isIWpZej9n0sosl/9
 WLUxZiNa6zn3W1aeuYxFOmFX5AxdqOZWPdUA+NKU=
Date: Wed, 22 Jul 2020 10:07:39 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200722170739.GG3912099@google.com>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-5-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720233739.824943-5-satyat@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyIDY-00GnIO-UQ
Subject: Re: [f2fs-dev] [PATCH v4 4/7] ext4: support direct I/O with fscrypt
 using blk-crypto
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
Cc: Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/20, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up ext4 with fscrypt direct I/O support. direct I/O with fscrypt is
> only supported through blk-crypto (i.e. CONFIG_BLK_INLINE_ENCRYPTION must
> have been enabled, the 'inlinecrypt' mount option must have been specified,
> and either hardware inline encryption support must be present or
> CONFIG_BLK_INLINE_ENCYRPTION_FALLBACK must have been enabled). Further,
> direct I/O on encrypted files is only supported when I/O is aligned
> to the filesystem block size (which is *not* necessarily the same as the
> block device's block size).
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/ext4/file.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 2a01e31a032c..d534f72675d9 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -36,9 +36,11 @@
>  #include "acl.h"
>  #include "truncate.h"
>  
> -static bool ext4_dio_supported(struct inode *inode)
> +static bool ext4_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
>  {
> -	if (IS_ENABLED(CONFIG_FS_ENCRYPTION) && IS_ENCRYPTED(inode))
> +	struct inode *inode = file_inode(iocb->ki_filp);
> +
> +	if (!fscrypt_dio_supported(iocb, iter))
>  		return false;
>  	if (fsverity_active(inode))
>  		return false;
> @@ -61,7 +63,7 @@ static ssize_t ext4_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		inode_lock_shared(inode);
>  	}
>  
> -	if (!ext4_dio_supported(inode)) {
> +	if (!ext4_dio_supported(iocb, to)) {
>  		inode_unlock_shared(inode);
>  		/*
>  		 * Fallback to buffered I/O if the operation being performed on
> @@ -490,7 +492,7 @@ static ssize_t ext4_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
>  	}
>  
>  	/* Fallback to buffered I/O if the inode does not support direct I/O. */
> -	if (!ext4_dio_supported(inode)) {
> +	if (!ext4_dio_supported(iocb, from)) {
>  		if (ilock_shared)
>  			inode_unlock_shared(inode);
>  		else
> -- 
> 2.28.0.rc0.105.gf9edc3c819-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
