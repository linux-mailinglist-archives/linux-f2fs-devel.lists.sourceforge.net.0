Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E07642E672
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2019 22:48:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hW5UT-000180-Ra; Wed, 29 May 2019 20:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hW5US-00017s-JQ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 May 2019 20:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QU7/Zm88fW0G9TVGfGYtSmgY7ccEd0AFaLCmueBeLik=; b=DbtFm4kjrijOg4qircGpKGMJfm
 7qLIf+bQIUa9WABSC16hIE6sJI0wAsmD2cahJ4uSN2JT2PIMtWZ9UXU9aWyYrODuAdtXx0yrwulL2
 AYZ4mIZlfjtt6Q1P2iK0J6wsrbDl2vIWJ+Ly7hme4EKXBp/IrmkmWX/0b/MflnoXWVlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QU7/Zm88fW0G9TVGfGYtSmgY7ccEd0AFaLCmueBeLik=; b=HzDEdSeA6+H+DugZh523H3bzSn
 aUa7xO1QvXqKyv9Ao0z3Fe0ByjnK+hJgCwgjBk8RprbvAEhSN3faVVO0qW1PE/6Z/4FpuWxgciV1P
 jnMZ/G28JrHE7NogHBgA4MI6nmncwLFyJMMuHv9mxL56GkE1a3PvLDawJ635ZHNm5SbY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hW5UQ-0042n2-VH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 May 2019 20:48:04 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4B60E2419D;
 Wed, 29 May 2019 20:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559162876;
 bh=/h0YRele2HgHkOZgeVioQRed572yyLTKQ40p6fvDYw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lb1DvaJJHbk0WgcihUPP6WKeOKiLCST6LBMU309vMD6yXyT/o/4JTHPxrFxkTU9EO
 NSM/ONxEZ81Yu4WnG7Vh6YfH08T4wiXKKCHwNySkJGtxqZE5k4Ys/uctQ+Tlzg3Jug
 K6XB6SwDdiK2V2HU79sMV/UvG7D8wgagV6puSOcg=
Date: Wed, 29 May 2019 13:47:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20190529204753.GB141639@gmail.com>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 6.2 (++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hW5UQ-0042n2-VH
Subject: Re: [f2fs-dev] [PATCH v2 00/14] fscrypt,
 ext4: prepare for blocksize != PAGE_SIZE
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, May 20, 2019 at 09:29:38AM -0700, Eric Biggers wrote:
> Hello,
> 
> This patchset prepares fs/crypto/, and partially ext4, for the
> 'blocksize != PAGE_SIZE' case.
> 
> This basically contains the encryption changes from Chandan Rajendra's
> patchset "[V2,00/13] Consolidate FS read I/O callbacks code"
> (https://patchwork.kernel.org/project/linux-fscrypt/list/?series=111039)
> that don't require introducing the read_callbacks and don't depend on
> fsverity stuff.  But they've been reworked to clean things up a lot.
> 
> I'd like to apply this patchset for 5.3 in order to make things forward
> for ext4 encryption with 'blocksize != PAGE_SIZE'.
> 
> AFAICT, after this patchset the only thing stopping ext4 encryption from
> working with blocksize != PAGE_SIZE is the lack of encryption support in
> block_read_full_page(), which the read_callbacks will address.
> 
> This patchset applies to v5.2-rc1, and it can also be retrieved from git
> at https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
> branch "fscrypt-subpage-blocks-prep".
> 
> Changed since v1 (minor cleanups only):
> 
> - In "fscrypt: simplify bounce page handling", also remove
>   the definition of FS_CTX_HAS_BOUNCE_BUFFER_FL.
> 
> - In "ext4: decrypt only the needed blocks in ext4_block_write_begin()",
>   simplify the code slightly by moving the IS_ENCRYPTED() check.
> 
> - Change __fscrypt_decrypt_bio() in a separate patch rather than as part
>   of "fscrypt: support decrypting multiple filesystem blocks per page".
>   The resulting code is the same, so I kept Chandan's Reviewed-by.
> 
> - Improve the commit message of
>   "fscrypt: introduce fscrypt_decrypt_block_inplace()".
> 
> Chandan Rajendra (3):
>   ext4: clear BH_Uptodate flag on decryption error
>   ext4: decrypt only the needed blocks in ext4_block_write_begin()
>   ext4: decrypt only the needed block in __ext4_block_zero_page_range()
> 
> Eric Biggers (11):
>   fscrypt: simplify bounce page handling
>   fscrypt: remove the "write" part of struct fscrypt_ctx
>   fscrypt: rename fscrypt_do_page_crypto() to fscrypt_crypt_block()
>   fscrypt: clean up some BUG_ON()s in block encryption/decryption
>   fscrypt: introduce fscrypt_encrypt_block_inplace()
>   fscrypt: support encrypting multiple filesystem blocks per page
>   fscrypt: handle blocksize < PAGE_SIZE in fscrypt_zeroout_range()
>   fscrypt: introduce fscrypt_decrypt_block_inplace()
>   fscrypt: support decrypting multiple filesystem blocks per page
>   fscrypt: decrypt only the needed blocks in __fscrypt_decrypt_bio()
>   ext4: encrypt only up to last block in ext4_bio_write_page()
> 
>  fs/crypto/bio.c             |  73 +++------
>  fs/crypto/crypto.c          | 299 ++++++++++++++++++++----------------
>  fs/crypto/fscrypt_private.h |  15 +-
>  fs/ext4/inode.c             |  37 +++--
>  fs/ext4/page-io.c           |  44 +++---
>  fs/f2fs/data.c              |  17 +-
>  fs/ubifs/crypto.c           |  19 +--
>  include/linux/fscrypt.h     |  96 ++++++++----
>  8 files changed, 319 insertions(+), 281 deletions(-)
> 

I've applied this series to fscrypt.git for 5.3.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
