Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA49622D32C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jul 2020 02:15:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz7qF-0002M2-HB; Sat, 25 Jul 2020 00:15:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jz7qE-0002Lw-LQ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 00:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XMEPaEzFhY8Q8YJ1C62c9BgBS/36D1q0gqXa/0FDCs=; b=U7lEhHt3ismpV3/PuxDOvbnKH6
 mfTTvUf+YeN43yj/H5OchG6ZTE/p4S/z4H82OChKgMrfg1UrplCsb+U34beuD87UVKV9VHWx2eHcq
 a61H08+nsQiHtvDCUwk8XRowEP5Xxi8sextXTkVYrNB2htDqqYPzsZU2PmD/IW2/ELv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7XMEPaEzFhY8Q8YJ1C62c9BgBS/36D1q0gqXa/0FDCs=; b=SCldbKre7XzjiEUO2GpKSu/twr
 hxUqxYSWsROQVNe41Ap2T/hD9ArWoBiV+nbCw16TnrEuhv0SBe/t8H8pw8sVn0NdWxc2tMbJ0fxGH
 4KWWeMoiJMQlT4MWMIkSqSQp+K7J1IMpA+FWGIUPsX9z8ulG+w/85GBTl/AzJLUdNlYU=;
Received: from mail108.syd.optusnet.com.au ([211.29.132.59])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jz7qC-0085kg-2g
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 00:15:06 +0000
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
 [49.180.53.24])
 by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id B54F51AA49D;
 Sat, 25 Jul 2020 10:14:44 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jz7pp-0001fR-24; Sat, 25 Jul 2020 10:14:41 +1000
Date: Sat, 25 Jul 2020 10:14:41 +1000
From: Dave Chinner <david@fromorbit.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200725001441.GQ2005@dread.disaster.area>
References: <20200724184501.1651378-1-satyat@google.com>
 <20200724184501.1651378-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724184501.1651378-2-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LPwYv6e9 c=1 sm=1 tr=0
 a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
 a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=1XWaLZrsAAAA:8 a=7-415B0cAAAA:8
 a=Rqi5QEisB4je2o-fgwEA:9 a=938-DbcbG5wzybhJ:21 a=PkVgxCpPGaEuij1c:21
 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 0.0 RCVD_IN_MSPIKE_L5      RBL: Very bad reputation (-5)
 [211.29.132.59 listed in bl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz7qC-0085kg-2g
Subject: Re: [f2fs-dev] [PATCH v6 1/7] fscrypt: Add functions for direct I/O
 support
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

On Fri, Jul 24, 2020 at 06:44:55PM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Introduce fscrypt_dio_supported() to check whether a direct I/O request
> is unsupported due to encryption constraints.
> 
> Also introduce fscrypt_limit_io_blocks() to limit how many blocks can be
> added to a bio being prepared for direct I/O. This is needed for
> filesystems that use the iomap direct I/O implementation to avoid DUN
> wraparound in the middle of a bio (which is possible with the
> IV_INO_LBLK_32 IV generation method). Elsewhere fscrypt_mergeable_bio()
> is used for this, but iomap operates on logical ranges directly, so
> filesystems using iomap won't have a chance to call fscrypt_mergeable_bio()
> on every block added to a bio. So we need this function which limits a
> logical range in one go.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  fs/crypto/crypto.c       |  8 +++++
>  fs/crypto/inline_crypt.c | 74 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/fscrypt.h  | 18 ++++++++++
>  3 files changed, 100 insertions(+)
> 
> diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> index 9212325763b0..f72f22a718b2 100644
> --- a/fs/crypto/crypto.c
> +++ b/fs/crypto/crypto.c
> @@ -69,6 +69,14 @@ void fscrypt_free_bounce_page(struct page *bounce_page)
>  }
>  EXPORT_SYMBOL(fscrypt_free_bounce_page);
>  
> +/*
> + * Generate the IV for the given logical block number within the given file.
> + * For filenames encryption, lblk_num == 0.
> + *
> + * Keep this in sync with fscrypt_limit_io_blocks().  fscrypt_limit_io_blocks()
> + * needs to know about any IV generation methods where the low bits of IV don't
> + * simply contain the lblk_num (e.g., IV_INO_LBLK_32).
> + */
>  void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
>  			 const struct fscrypt_info *ci)
>  {
> diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
> index d7aecadf33c1..4cdf807b89b9 100644
> --- a/fs/crypto/inline_crypt.c
> +++ b/fs/crypto/inline_crypt.c
> @@ -16,6 +16,7 @@
>  #include <linux/blkdev.h>
>  #include <linux/buffer_head.h>
>  #include <linux/sched/mm.h>
> +#include <linux/uio.h>
>  
>  #include "fscrypt_private.h"
>  
> @@ -362,3 +363,76 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
>  	return fscrypt_mergeable_bio(bio, inode, next_lblk);
>  }
>  EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
> +
> +/**
> + * fscrypt_dio_supported() - check whether a direct I/O request is unsupported
> + *			     due to encryption constraints
> + * @iocb: the file and position the I/O is targeting
> + * @iter: the I/O data segment(s)
> + *
> + * Return: true if direct I/O is supported
> + */
> +bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
> +{
> +	const struct inode *inode = file_inode(iocb->ki_filp);
> +	const unsigned int blocksize = i_blocksize(inode);
> +
> +	/* If the file is unencrypted, no veto from us. */
> +	if (!fscrypt_needs_contents_encryption(inode))
> +		return true;
> +
> +	/* We only support direct I/O with inline crypto, not fs-layer crypto */
> +	if (!fscrypt_inode_uses_inline_crypto(inode))
> +		return false;
> +
> +	/*
> +	 * Since the granularity of encryption is filesystem blocks, the I/O
> +	 * must be block aligned -- not just disk sector aligned.
> +	 */
> +	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
> +		return false;

Doesn't this force user buffers to be filesystem block size aligned,
instead of 512 byte aligned as is typical for direct IO?

That's going to cause applications that work fine on normal
filesystems becaues the memalign() buffers to 512 bytes or logical
block device sector sizes (as per the open(2) man page) to fail on
encrypted volumes, and it's not going to be obvious to users as to
why this happens.

XFS has XFS_IOC_DIOINFO to expose exactly this information to
userspace on a per-file basis. Other filesystem and VFS developers
have said for the past 15 years "we don't need no stinking DIOINFO".
The same people shot down adding optional IO alignment
constraint fields to statx() a few years ago, too.

Yet here were are again, with alignment of DIO buffers being an
issue that userspace needs to know about....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
