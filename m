Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C303122A13C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 23:16:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyM6b-0003cr-T2; Wed, 22 Jul 2020 21:16:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1jyM6a-0003ck-M8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 21:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVOgyjz7EdPpHEdNY36dNK22HoOhiVYfDsFKT3MuFjs=; b=TtOB84UmaAQwNOHpStTHl8jepX
 KpYGRCjWbYyP0VcZ8gFFlmL4BxtXtavH8E2Cnx3TEL6nXeSOmH8i7WOUD1gRQrKNHJC5KmC+WHGbT
 baXnUultLuEma3vq3eYBg7uX3PN3F5kiMKu6/lK51WgHzdyHOt/LL0gP/EB5MT0rM7JU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVOgyjz7EdPpHEdNY36dNK22HoOhiVYfDsFKT3MuFjs=; b=nMEjNMaQ277gCULH6egDVaytwm
 yjNt44a8GLU5q2LTSzQR97JcvOAQMqGt1d/Ohe5DS+A+suAmHShna7ujcn4a9evwF1UnNUweNzb4c
 fuJUmHyBuaD4KIrB6XyPBsgjN70Kf+7TKEhqbGRgPF31YgwCXWUQyxlG437uV2cb7Lgk=;
Received: from mail110.syd.optusnet.com.au ([211.29.132.97])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jyM6Y-00E41D-BE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 21:16:48 +0000
Received: from dread.disaster.area (pa49-180-53-24.pa.nsw.optusnet.com.au
 [49.180.53.24])
 by mail110.syd.optusnet.com.au (Postfix) with ESMTPS id EB94D1093F5;
 Thu, 23 Jul 2020 07:16:31 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1jyM6H-0000dh-VF; Thu, 23 Jul 2020 07:16:29 +1000
Date: Thu, 23 Jul 2020 07:16:29 +1000
From: Dave Chinner <david@fromorbit.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200722211629.GE2005@dread.disaster.area>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720233739.824943-4-satyat@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=QIgWuTDL c=1 sm=1 tr=0
 a=moVtWZxmCkf3aAMJKIb/8g==:117 a=moVtWZxmCkf3aAMJKIb/8g==:17
 a=kj9zAlcOel0A:10 a=_RQrkK6FrEwA:10 a=1XWaLZrsAAAA:8 a=7-415B0cAAAA:8
 a=hXC-IiYu2LMqzBbHlhgA:9 a=LgCiNJQz8qIQRtuf:21 a=o_S2HrWTwrLlo9Lt:21
 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1jyM6Y-00E41D-BE
Subject: Re: [f2fs-dev] [PATCH v4 3/7] iomap: support direct I/O with
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
Cc: Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jul 20, 2020 at 11:37:35PM +0000, Satya Tangirala wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Wire up iomap direct I/O with the fscrypt additions for direct I/O.
> This allows ext4 to support direct I/O on encrypted files when inline
> encryption is enabled.
> 
> This change consists of two parts:
> 
> - Set a bio_crypt_ctx on bios for encrypted files, so that the file
>   contents get encrypted (or decrypted).
> 
> - Ensure that encryption data unit numbers (DUNs) are contiguous within
>   each bio.  Use the new function fscrypt_limit_io_pages() for this,
>   since the iomap code works directly with logical ranges and thus
>   doesn't have a chance to call fscrypt_mergeable_bio() on each page.
> 
> Note that fscrypt_limit_io_pages() is normally a no-op, as normally the
> DUNs simply increment along with the logical blocks.  But it's needed to
> handle an edge case in one of the fscrypt IV generation methods.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  fs/iomap/direct-io.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
> index ec7b78e6feca..12064daa3e3d 100644
> --- a/fs/iomap/direct-io.c
> +++ b/fs/iomap/direct-io.c
> @@ -6,6 +6,7 @@
>  #include <linux/module.h>
>  #include <linux/compiler.h>
>  #include <linux/fs.h>
> +#include <linux/fscrypt.h>
>  #include <linux/iomap.h>
>  #include <linux/backing-dev.h>
>  #include <linux/uio.h>
> @@ -183,11 +184,16 @@ static void
>  iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
>  		unsigned len)
>  {
> +	struct inode *inode = file_inode(dio->iocb->ki_filp);
>  	struct page *page = ZERO_PAGE(0);
>  	int flags = REQ_SYNC | REQ_IDLE;
>  	struct bio *bio;
>  
>  	bio = bio_alloc(GFP_KERNEL, 1);
> +
> +	/* encrypted direct I/O is guaranteed to be fs-block aligned */
> +	WARN_ON_ONCE(fscrypt_needs_contents_encryption(inode));

Which means you are now placing a new constraint on this code in
that we cannot ever, in future, zero entire blocks here.

This code can issue arbitrary sized zeroing bios - multiple entire fs blocks
blocks if necessary - so I think constraining it to only support
partial block zeroing by adding a warning like this is no correct.

> @@ -253,6 +259,7 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
>  		ret = nr_pages;
>  		goto out;
>  	}
> +	nr_pages = fscrypt_limit_io_pages(inode, pos, nr_pages);

So if "pos" overlaps a 2^32 offset when a certain mode is used, we
have to break up the IO?

If true, I'm not sure that this belongs here. Limiting the size of
the IOs because of filesytem contraints belongs in the filesystem
extent mapping code. That's the point where the IO is broken up into
maximally sized chunks the filesystem can issue as a contiguous
range. If the fscrypt code is breaking that "contiguous IO range"
because of the mode being used, the fs mapping code should break
the mapping at the boundery where the IO needs to be broken.

Hence the dio mapping code here will never build IOs that cross this
-filesystem- encryption limitation, and we don't need this fscrypt
code in the direct IO path at all.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
