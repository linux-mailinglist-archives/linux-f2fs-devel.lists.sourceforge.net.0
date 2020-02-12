Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD93159FB1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 04:56:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1j8A-0007RO-US; Wed, 12 Feb 2020 03:56:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1j89-0007R8-41
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 03:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pNWa8x3voWLEepFqOrgfjz4N8M6OqVps8r27OXNAaPM=; b=cH5Fln5ZiJVSbiZNvz1rZo9r60
 i2+CPUic+JJAL4Abks9v0FugGPAxD4LUk+AvnBqfhbFdFwA9i+Ezk/WvhdcJQXXyCHgTmlQroeibx
 EyudsTC92tbbOVbuZkqyYA7vf6KAP7CcISd5NglccqXff4Ny4wuMayYijvrAYz2nT1iA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pNWa8x3voWLEepFqOrgfjz4N8M6OqVps8r27OXNAaPM=; b=c4QELiO2UukFLPLVYLKBKSyhbI
 8jtVL5W5vYqWjEZtaov4iZm8fkBKRjcEXkTmGLiZfy+JGmwsItv2uKvJ4sVgsmc3mVLM5rDEBTEat
 DshcPDGX5/SJQm18x8cpxUaaN3nTfzCfoefM7olfkPj4T4I4ozAhlEtoiph2jUyEh46A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1j86-0011lD-Rf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 03:56:05 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5566B206D7;
 Wed, 12 Feb 2020 03:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581479745;
 bh=QRHIt8kBfhFwG/eebDuW7D9CmPyDjyjrXyg9CDC5NUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QDjwA1UUCb18CDvTZAWN3AWxXhe8SylkHRngDpUO6Eo0l9UqmK2TbcwHSvmdzSIdq
 8lpBsW3LIAzLnS9/lpjvbuepoMDAj1jRGvX2twIB172UT2z1b0FdwMXW2zw4q/ykCV
 QH0qbBpDSO+kDk6Nfy2KrHxMmTeVcqviduLNqrp8=
Date: Tue, 11 Feb 2020 19:55:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200212035543.GD870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-3-drosen@google.com>
X-Spam-Score: -0.1 (/)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1j86-0011lD-Rf
Subject: Re: [f2fs-dev] [PATCH v7 2/8] fs: Add standard casefolding support
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 07, 2020 at 05:35:46PM -0800, Daniel Rosenberg wrote:
> This adds general supporting functions for filesystems that use
> utf8 casefolding. It provides standard dentry_operations and adds the
> necessary structures in struct super_block to allow this standardization.
> 
> Ext4 and F2fs are switch to these implementations.

I think you mean that ext4 and f2fs *will be switched* to these implementations?
It's later in the series, not in this patch.

> +#ifdef CONFIG_UNICODE
> +bool needs_casefold(const struct inode *dir)
> +{
> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
> +			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
> +}
> +EXPORT_SYMBOL(needs_casefold);

Can you add kerneldoc comments to all the new functions that are exported to
modules?

> +struct hash_ctx {
> +	struct utf8_itr_context ctx;
> +	unsigned long hash;
> +};
> +
> +static int do_generic_ci_hash(struct utf8_itr_context *ctx, int byte, int pos)
> +{
> +	struct hash_ctx *hctx = container_of(ctx, struct hash_ctx, ctx);
> +
> +	hctx->hash = partial_name_hash((unsigned char)byte, hctx->hash);
> +	return 0;
> +}
> +
> +int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
> +{
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
> +	struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	int ret = 0;
> +	struct hash_ctx hctx;
> +
> +	if (!inode || !needs_casefold(inode))
> +		return 0;
> +
> +	hctx.hash = init_name_hash(dentry);
> +	hctx.ctx.actor = do_generic_ci_hash;
> +	ret = utf8_casefold_iter(um, str, &hctx.ctx);
> +	if (ret < 0)
> +		goto err;
> +	str->hash = end_name_hash(hctx.hash);
> +
> +	return 0;
> +err:
> +	if (sb_has_enc_strict_mode(sb))
> +		ret = -EINVAL;
> +	return ret;
> +}
> +EXPORT_SYMBOL(generic_ci_d_hash);
> +#endif

This breaks the !strict_mode case by starting to fail lookups of names that
aren't valid Unicode, instead of falling back to the standard case-sensitive
behavior.

There is an xfstest for casefolding; is this bug not caught by it (in which case
the test needs to be improved)?  Or did you just not run it?

> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 6eae91c0668f9..a260afbc06d22 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_ACTIVE	(1<<30)
>  #define SB_NOUSER	(1<<31)
>  
> +/* These flags relate to encoding and casefolding */
> +#define SB_ENC_STRICT_MODE_FL	(1 << 0)

It would be helpful if the comment mentioned that these flags are stored on-disk
(and therefore can't be re-numbered, unlike the other flags defined nearby).

> +#ifdef CONFIG_UNICODE
> +	struct unicode_map *s_encoding;
> +	__u16 s_encoding_flags;
>  #endif

This isn't a UAPI header, so 's_encoding_flags' should use u16, not __u16.

And for that matter, 's_encoding_flags' will be pointer-sized due to padding
anyway, so maybe just make it 'unsigned int'?

> +static inline bool needs_casefold(const struct inode *dir)
> +{
> +	return 0;
> +}
> +#endif

Use false instead of 0 for 'bool'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
