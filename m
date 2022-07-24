Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F757F2A4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 04:02:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFQwo-0000gY-Bl; Sun, 24 Jul 2022 02:02:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1oFQwn-0000gS-Mz
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 02:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G4V6gN/06FkQcJ9lEsLi5ivW9vh82onSRs1wAC3uj/Y=; b=O5oxUyQlUH0fxWHGGIiuju2Tq5
 40axpZsCaQ02zR5/NMgMO2p/kAYW44ffQawH2K4aIl4/diocgKS+RoZb+CYj2LTLknaP1SAoP0x/M
 4jVJxt3VUTdt6ihC/csuk9M3Ln3UgaTMkHXQ7HFVvC+3EbZsLEps+iIHjNCBMtEYLV+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G4V6gN/06FkQcJ9lEsLi5ivW9vh82onSRs1wAC3uj/Y=; b=CUkWJGNQG9VYzQJRZkcXoXfwNk
 nknfyt8ftJBrAmJRIt3kUgLivTom4c6vx7UpM0RF+2FYDm3yhBXOS+8rjSs26WOIHW1S3YlyJ2zpH
 UnPQjqAGIMOtm+a274WdJtCVNsrpceQ1xcqKwkavJj5XHMQOst/m9Q7O//DHR3k461ts=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFQwi-008HIw-5a
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 02:02:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58C9060C8B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 24 Jul 2022 02:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C80C341C0;
 Sun, 24 Jul 2022 02:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658628121;
 bh=P7SNPqf+kK7Uv5jaRDdQvqwL+CiGRzt4kUYwRGuMwuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YJjZPL/MEDF7Q2m0BsBorqsKTC+7h5i+R/udBxD0IuxUYQvVrek2cohPL6C7rPK8C
 BOIHeWQ47tSvQSwI94gwdGleMtB23vMKEb3haUxSBCX5/JlAvuYeArRveRVG8+3QEo
 +6VFDKSDJMw9FFgBBLmQ+cLOLNGbS7+uaGXorNhz/GJCbEk9IrfBzoGFQqA3lvEqT/
 IubqfaoIUl1E/s1tqxFU+K/t7aGL7ohNdS7zbDj5qO6rB7Bo3don7Mrfl370ed4tyB
 ne38gcQUbi3ov4JkM1ULuc7Y1gl4VeaGWhJHpDSVd+ASvcC0gltl164iKK43cuILr1
 i1plHjvIsYaNg==
Date: Sat, 23 Jul 2022 19:01:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YtyoF89iOg8gs7hj@google.com>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-7-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220722071228.146690-7-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/22,
 Eric Biggers wrote: > From: Eric Biggers <ebiggers@google.com>
 > > Currently, if an f2fs filesystem is mounted with the mode=lfs and > io_bits
 mount options, DIO reads are allowed but DIO wr [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFQwi-008HIw-5a
Subject: Re: [f2fs-dev] [PATCH v4 6/9] f2fs: don't allow DIO reads but not
 DIO writes
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

On 07/22, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Currently, if an f2fs filesystem is mounted with the mode=lfs and
> io_bits mount options, DIO reads are allowed but DIO writes are not.
> Allowing DIO reads but not DIO writes is an unusual restriction, which
> is likely to be surprising to applications, namely any application that
> both reads and writes from a file (using O_DIRECT).  This behavior is
> also incompatible with the proposed STATX_DIOALIGN extension to statx.
> Given this, let's drop the support for DIO reads in this configuration.

IIRC, we allowed DIO reads since applications complained a lower performance.
So, I'm afraid this change will make another confusion to users. Could
you please apply the new bahavior only for STATX_DIOALIGN?

> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/file.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 5e5c97fccfb4ee..ad0212848a1ab9 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -823,7 +823,6 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  				struct kiocb *iocb, struct iov_iter *iter)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	int rw = iov_iter_rw(iter);
>  
>  	if (!fscrypt_dio_supported(inode))
>  		return true;
> @@ -841,7 +840,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
>  	 */
>  	if (f2fs_sb_has_blkzoned(sbi))
>  		return true;
> -	if (f2fs_lfs_mode(sbi) && (rw == WRITE)) {
> +	if (f2fs_lfs_mode(sbi)) {
>  		if (block_unaligned_IO(inode, iocb, iter))
>  			return true;
>  		if (F2FS_IO_ALIGNED(sbi))
> -- 
> 2.37.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
