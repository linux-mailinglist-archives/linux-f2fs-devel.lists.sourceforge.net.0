Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36288C7D575
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Nov 2025 19:29:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPbiB1JULrZ7GH3du2wGLtIVVVm7Lx9O3FGm4p9txts=; b=NXgkxve2cXr3OwpDv1q6XiFBu7
	nzF1IXDJ8t2csJ7ix5uyIIbRoqibddYvxVwG7lTAI6WH1bAS7QCWQmBhB4peDYl2hmpjxMxfHzBbW
	+5Rdlf4gWcZMjzmw9yHKaZXOtTBc7KQoj9WOSvP8lBLL5/nVDMPDanBt7gNgSolBOZvw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMsMa-0001aW-7I;
	Sat, 22 Nov 2025 18:29:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vMsMY-0001aQ-Fq
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 18:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WzeJ+E19ytHfa8o8o/KjKC1zizpv7uhrn2IzrnykW3U=; b=e2QRoXzQ/A8z6v+ATyK0GnmyrS
 ee45Z/VF7BJQdsaeIA2Oupz7XNYyM30aoVDU/LjTaVvwZtL/fD0dfKm2dNzaPObf6NtMtwEx55xq4
 t54arwcIEcQqT372Hbo/h52GWly4hqlw95zvqBARji5rgcTqn4q9Cf5ofgdk/pIp9jWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WzeJ+E19ytHfa8o8o/KjKC1zizpv7uhrn2IzrnykW3U=; b=DWmSo8/wKyGq4Y+kyO0lPRHpER
 KUY2+8kHO+pgZoQ4AymWzFRSC4VPfz/L63RR7VkzlJadPWZh0Udhx8MCIe1CHibTNtH8rBXqq2Pvp
 217M2fPenAzmIB5oMOkiuQRVLJK99TxW/wM3PYO9oLsiIHC95XzVVfZJvR4CORZlxvUI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMsMY-0002xM-3Y for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 22 Nov 2025 18:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AA4B4152F;
 Sat, 22 Nov 2025 18:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29B5C4CEF5;
 Sat, 22 Nov 2025 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763836168;
 bh=8xw7rhH6O9SdjYiT0aP0fzTrgTnB7q3imFTDnslqKkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pHFRdYqOPaQX70zmfnjBGRk3tGDlaAS2Jsb7U1vVsHowf+qQ2S/cXKybSueG1RSBe
 khJ2DDVb4v1G/nHgmkDibOsm8EcRQMfHDiM/PONLXco8bieclt85EWjtezvmpUop49
 tAmJNsVrerfklQpFkfZ35arZjm3eOxTm/nUh5EbkluMhEfWAhTb4kNwt9V5vQxd7tk
 o3goh49Axy0FLzNQ6gBSYH0t28ml89l1Q47HdOD9xT22oIGVjV+NlEanAdLF0fAyaf
 TAoz3S5eLQ6OkJCdVBQ5cT4ooEYsBYzDS3JeDNnkWQO5NLI4KGv5WyRt+y/9l5iDbO
 bkyjmhWiOkqvA==
Date: Sat, 22 Nov 2025 10:29:26 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20251122182926.GC1626@quark>
References: <20251118062159.2358085-1-hch@lst.de>
 <20251118062159.2358085-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251118062159.2358085-11-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 18, 2025 at 07:21:53AM +0100, Christoph Hellwig
 wrote: > Range lengths are usually expressed as bytes in the VFS, switch
 > fscrypt_zeroout_range to this convention. > > Signed-off-by: Chri [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMsMY-0002xM-3Y
Subject: Re: [f2fs-dev] [PATCH 10/11] fscrypt: pass a byte length to
 fscrypt_zeroout_range
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 18, 2025 at 07:21:53AM +0100, Christoph Hellwig wrote:
> Range lengths are usually expressed as bytes in the VFS, switch
> fscrypt_zeroout_range to this convention.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/crypto/bio.c | 6 +++---
>  fs/ext4/inode.c | 3 ++-
>  fs/f2fs/file.c  | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
> index 235dd1c3d443..4e9893664c0f 100644
> --- a/fs/crypto/bio.c
> +++ b/fs/crypto/bio.c
> @@ -115,7 +115,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
>   * @inode: the file's inode
>   * @pos: the first file logical offset (in bytes) to zero out
>   * @pblk: the first filesystem physical block to zero out
> - * @len: number of blocks to zero out
> + * @len: bytes to zero out
[...]
> int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,                 
>                           sector_t sector, unsigned int len)

The type of 'len' is still unsigned int, so this reduces the maximum
length accepted by fscrypt_zeroout_range() from UINT32_MAX blocks to
UINT32_MAX bytes.  Is that really okay?

Both ext4 and f2fs call this from functions where they have the length
as a u32 number of logical blocks.  And of course both filesystems
support files longer than UINT32_MAX bytes.  So it's not clear to me.
ext4 extents have a smaller size limit, so maybe at least ext4 is okay.
But different extents can be contiguous and operated on together.  So
we'd have to check the callers of the callers, etc.

It would be safer to change the type to u64 and have the callers do
(u64)len_in_blocks << blockbits.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
