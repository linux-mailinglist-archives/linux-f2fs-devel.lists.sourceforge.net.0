Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B893127508D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 08:00:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKxp8-00062H-CW; Wed, 23 Sep 2020 06:00:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kKxp6-000629-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 06:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zQg/8fzf3YsUqfG31jPTFmC0O31v7k/VO6H9niwMa/g=; b=V4pgI3P8/JAgPzF9EfFODP4V4M
 iGeXZ+PyNdxFT+IRSEum6o4asvHtD7wLmGNT0pNyRgwKiuMrKhYvRFQWqaH531Z4Hdaz9cz6tH3x4
 3iCWzXkg+JirtNR8MT2Wy5jngV1YP6bPWIuk8Q5WqS3d0QjCWZBhsRmvRSCZQ6Wez7VQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zQg/8fzf3YsUqfG31jPTFmC0O31v7k/VO6H9niwMa/g=; b=DpUH59qjBY/pFRCI95uZRXmhx5
 2tuu7b6Dr/Azv7SeTAF17qM/APs+XofsFHReXXtJDwXrQMn3RRg4vMYUgGEifTq1NfStT2FHLY+kh
 DGTDsb3l6UA424YBFohaX/qfoyYz/8SqVVdTWq+q64pU5Egx0ggYCPX+jewp6ASKcTpY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKxov-0025gA-2z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 06:00:12 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73F0123444;
 Wed, 23 Sep 2020 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600840792;
 bh=I/8XzISzbBcCgYVmxLepZyG9w1CITHS3v+J9bySyNa0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ma7PADmZA95LLBo9KrXphWNWVsOVp+R73XlXBBcLHitEY4X5VwCFJSVq7vuCYgC3V
 HIT9jQdNXpRYH0Rkj3vSz4V7G9BGteBdDqsxV/pAjN1mmz6khsLf9uFQEZlx+JA+bt
 9uHpKQjziJ+IY+pVDK+nuHCnTz8A3CoT7WQ/HOGU=
Date: Tue, 22 Sep 2020 22:59:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200923055950.GC9538@sol.localdomain>
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-3-drosen@google.com>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kKxov-0025gA-2z
Subject: Re: [f2fs-dev] [PATCH 2/5] fscrypt: Export fscrypt_d_revalidate
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 23, 2020 at 01:01:48AM +0000, Daniel Rosenberg wrote:
> This is in preparation for shifting the responsibility of setting the
> dentry_operations to the filesystem, allowing it to maintain its own
> operations.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/crypto/fname.c       | 3 ++-
>  include/linux/fscrypt.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
> index 011830f84d8d..d45db23ff6c4 100644
> --- a/fs/crypto/fname.c
> +++ b/fs/crypto/fname.c
> @@ -541,7 +541,7 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_siphash);
>   * Validate dentries in encrypted directories to make sure we aren't potentially
>   * caching stale dentries after a key has been added.
>   */
> -static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
> +int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  {
>  	struct dentry *dir;
>  	int err;
> @@ -580,6 +580,7 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
>  
>  	return valid;
>  }
> +EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
>  
>  const struct dentry_operations fscrypt_d_ops = {
>  	.d_revalidate = fscrypt_d_revalidate,
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 991ff8575d0e..265b1e9119dc 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -207,6 +207,7 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
>  bool fscrypt_match_name(const struct fscrypt_name *fname,
>  			const u8 *de_name, u32 de_name_len);
>  u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
> +extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);

Please don't use 'extern' here.

Also FYI, Jeff Layton has sent this same patch as part of the ceph support for
fscrypt: https://lkml.kernel.org/linux-fscrypt/20200914191707.380444-4-jlayton@kernel.org

I'd like to apply one of them for 5.10 to get it out of the way for both
patchsets, but I'd like for the commit message to mention both users.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
