Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B896779C69
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Aug 2023 03:59:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUduX-0007HS-IO;
	Sat, 12 Aug 2023 01:59:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qUduW-0007HL-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 01:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lRiZBwK97WHAjg4wO5uFgMB148aHT7LI+2Rtf0H1064=; b=Bpp0jfAoN3900e4JOAL05HkM2D
 A3MMdvSH7c5UufuUUK4Vtt1OV9n05rJq8c3N+ZdnJCM3khsmC0ii+KMBwQ6nx2iageyrFPMeJhqxf
 r6KnvnsbagaB+GnjiJ6itZZa/FMdmSsci6r/V1yqpFnHZ5whfxY6uyq9EQHxT/u+xqx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lRiZBwK97WHAjg4wO5uFgMB148aHT7LI+2Rtf0H1064=; b=Gfes9eFjRhbB8tfFWQg8hG82/B
 kzfroQ1WMJ8qePrM/twGvIa5+uwvvua5//y1/rn/QeaHSAA1tz0ejsqpZ/dZ4gxwiWqXeF7zxhS1Y
 ZgL/lxJYp/CtW6Zpd7kaax85yxvXiGJ7OtaGHSD/+RynaOcQLd8w6AGyWgis2euUWXSs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qUduV-0004Sb-Ix for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 01:59:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1FB0612B9;
 Sat, 12 Aug 2023 01:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E97C433C7;
 Sat, 12 Aug 2023 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691805557;
 bh=nAJmbpwTFQg79wN1L8Hwf7i2NhG4ry3JrZqe/1RgP6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uo+6bf47lZ6FIDB/B6UeLXM9d5L7Wkv8oX/AwcApqynO7J5p1UBnfMdR91KELqHqc
 F1QL7ifceNwBQmF6ny1QzGIbHPdZvQIfEj53kJ3QOhKHCRz/S/eEBo6AhpDLpwDiVE
 xDKzrW766UaBxMsBJ5IDiaSuwwnSC6+FgDFrER5i2Th+1WVD6tGy7ca1sYVl2ZZHl4
 C5tyTThejdiELIai1/gNPgpHDzLE0cFycvpifjF2db5MREBAPdIJ415qdvmHvgBq9k
 aLOh1GK+dTbQW2H80fWrWTbAbq0kU3AG/ZC07Y47Yx/hvtbQde1GdDGxdVmzDXSLrL
 4qME5GREFAxLg==
Date: Fri, 11 Aug 2023 18:59:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230812015915.GA971@sol.localdomain>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812004146.30980-2-krisman@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 11, 2023 at 08:41:37PM -0400, Gabriel Krisman
 Bertazi wrote: > In preparation to use it in ecryptfs, move needs_casefolding
 into a > public header and give it a namespaced name. > > Signed [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qUduV-0004Sb-Ix
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 11, 2023 at 08:41:37PM -0400, Gabriel Krisman Bertazi wrote:
> In preparation to use it in ecryptfs, move needs_casefolding into a
> public header and give it a namespaced name.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
> ---
>  fs/libfs.c         | 14 ++------------
>  include/linux/fs.h | 21 +++++++++++++++++++++
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/libfs.c b/fs/libfs.c
> index 5b851315eeed..8d0b64cfd5da 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1381,16 +1381,6 @@ bool is_empty_dir_inode(struct inode *inode)
>  }
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
> -/*
> - * Determine if the name of a dentry should be casefolded.
> - *
> - * Return: if names will need casefolding
> - */
> -static bool needs_casefold(const struct inode *dir)
> -{
> -	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding;
> -}
> -
>  /**
>   * generic_ci_d_compare - generic d_compare implementation for casefolding filesystems
>   * @dentry:	dentry whose name we are checking against
> @@ -1411,7 +1401,7 @@ static int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
>  	char strbuf[DNAME_INLINE_LEN];
>  	int ret;
>  
> -	if (!dir || !needs_casefold(dir))
> +	if (!dir || !dir_is_casefolded(dir))
>  		goto fallback;
>  	/*
>  	 * If the dentry name is stored in-line, then it may be concurrently
> @@ -1453,7 +1443,7 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>  	const struct unicode_map *um = sb->s_encoding;
>  	int ret = 0;
>  
> -	if (!dir || !needs_casefold(dir))
> +	if (!dir || !dir_is_casefolded(dir))
>  		return 0;
>  
>  	ret = utf8_casefold_hash(um, dentry, str);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 6867512907d6..e3b631c6d24a 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3213,6 +3213,27 @@ static inline bool dir_relax_shared(struct inode *inode)
>  	return !IS_DEADDIR(inode);
>  }
>  
> +/**
> + * dir_is_casefolded - Safely determine if filenames inside of a
> + * directory should be casefolded.
> + * @dir: The directory inode to be checked
> + *
> + * Filesystems should usually rely on this instead of checking the
> + * S_CASEFOLD flag directly when handling inodes, to avoid surprises
> + * with corrupted volumes.  Checking i_sb->s_encoding ensures the
> + * filesystem knows how to deal with case-insensitiveness.
> + *
> + * Return: if names will need casefolding
> + */
> +static inline bool dir_is_casefolded(const struct inode *dir)
> +{
> +#if IS_ENABLED(CONFIG_UNICODE)
> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding;
> +#else
> +	return false;
> +#endif
> +}

To be honest I've always been confused about why the ->s_encoding check is
there.  It looks like Ted added it in 6456ca6520ab ("ext4: fix kernel oops
caused by spurious casefold flag") to address a fuzzing report for a filesystem
that had a casefolded directory but didn't have the casefold feature flag set.
It seems like an unnecessarily complex fix, though.  The filesystem should just
reject the inode earlier, in __ext4_iget().  And likewise for f2fs.  Then no
other code has to worry about this problem.

Actually, f2fs already does it, as I added it in commit f6322f3f1212:

        if ((fi->i_flags & F2FS_CASEFOLD_FL) && !f2fs_sb_has_casefold(sbi)) {
                set_sbi_flag(sbi, SBI_NEED_FSCK);
                f2fs_warn(sbi, "%s: inode (ino=%lx) has casefold flag, but casefold feature is off",
                          __func__, inode->i_ino);
                return false;
        }

So just __ext4_iget() needs to be fixed.  I think we should consider doing that
before further entrenching all the extra ->s_encoding checks.

Also I don't understand why this needs to be part of your patch series anyway.
Shouldn't eCryptfs check IS_CASEFOLDED() anyway?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
