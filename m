Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5912B6CE6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 19:17:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf5Xk-0003JM-5E; Tue, 17 Nov 2020 18:17:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kf5Xe-0003IY-Qv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 18:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xo2hoVo6kjy9rNjJoWda4Xi/zFTJxlZl40M0wZmhrWQ=; b=F2WAneORGKGmQfzRQ0ugZILnJr
 FD9wkWJCgIuZupX/9MlqxIuP4uMMc+a/4FLTw4KTJCkjuwq7qTuxQnBGkzksG9HyF0HFo0uF3zbxc
 HJ7jEZlu4n/W5vj32T0uAzAb+ZIUIv2CoN3GCzqm4RBx8r+7f3Su35+r4asAj2t6FYUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xo2hoVo6kjy9rNjJoWda4Xi/zFTJxlZl40M0wZmhrWQ=; b=VgMDm6gcvLR6kyzMI96ljE8pYA
 1jmz+s52DU64ljeRSAtRMGPBm3aKOJFr/+rNZyX5bhjveZq4ylr2e/b+s4UQlyM3FKWf5zMlK5DXM
 tXYSGecCDFnfGKtWc1tDclzPG+16R+3oytrMrzxANso74Gxp/FUsA7LreK/jf5A7x9Pk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf5XN-001INK-18
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 18:17:22 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8B352222E;
 Tue, 17 Nov 2020 18:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605637011;
 bh=LYmQa3sjmY4vGoc9PzmWfJg6D+u8panQLU6mw2v2bU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BIyHtChuKC/1Z2hfN01FJL2lQedY2Jopd9Xk6ljOb8WSU5039BmyYLu1lS/JerWeZ
 P+zilHNPhlrTLNiM1v44Y5EagbQsJhPY2JHB3h9CWIqeujkTkuhcWx5hjeDSPcyMf4
 ccWF5nBSvvcF0BXkSIJq0FUknVkLg8jyR9SxjF2Y=
Date: Tue, 17 Nov 2020 10:16:49 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <X7QTkSyiMojM6T10@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-2-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117040315.28548-2-drosen@google.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kf5XN-001INK-18
Subject: Re: [f2fs-dev] [PATCH v2 1/3] libfs: Add generic function for
 setting dentry_ops
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

On Tue, Nov 17, 2020 at 04:03:13AM +0000, Daniel Rosenberg wrote:
> 
> Currently the casefolding dentry operation are always set if the
> filesystem defines an encoding because the features is toggleable on
> empty directories. Since we don't know what set of functions we'll
> eventually need, and cannot change them later, we add just add them.

This isn't a very useful explanation, since encryption can be toggled on empty
directories too (at least from off to on --- not the other way).  Why is
casefolding different?

> +static const struct dentry_operations generic_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +};
>  #endif
> +
> +#ifdef CONFIG_FS_ENCRYPTION
> +static const struct dentry_operations generic_encrypted_dentry_ops = {
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
> +static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +	.d_revalidate = fscrypt_d_revalidate,
> +};
> +#endif
> +
> +/**
> + * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
> + * @dentry:	dentry to set ops on
> + *
> + * This function sets the dentry ops for the given dentry to handle both
> + * casefolded and encrypted dentry names.
> + *
> + * Encryption requires d_revalidate to remove nokey names once the key is present.
> + * Casefolding is toggleable on an empty directory. Since we can't change the
> + * operations later on, we just add the casefolding ops if the filesystem defines an
> + * encoding.
> + */

There are some overly long lines here (> 80 columns).

But more importantly this still isn't a good explanation.  Encryption can also
be enabled on empty directories; what makes casefolding different?

It's also not obvious why so many different copies of the dentry operations
needed, instead of just using generic_encrypted_ci_dentry_ops on all.

If I'm still struggling to understand this after following these patches for a
long time, I expect everyone else will have trouble too...

Here's a suggestion which I think explains it a lot better.  It's still possible
I'm misunderstanding something, though, so please check it carefully:

/**
 * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
 * @dentry:	dentry to set ops on
 *
 * Casefolded directories need d_hash and d_compare set, so that the dentries
 * contained in them are handled case-insensitively.  Note that these operations
 * are needed on the parent directory rather than on the dentries in it, and the
 * casefolding flag can be enabled on an empty directory later but the
 * dentry_operations can't be changed later.  As a result, if the filesystem has
 * casefolding support enabled at all, we have to give all dentries the
 * casefolding operations even if their inode doesn't have the casefolding flag
 * currently (and thus the casefolding ops would be no-ops for now).
 *
 * Encryption works differently in that the only dentry operation it needs is
 * d_revalidate, which it only needs on dentries that have the no-key name flag.
 * The no-key flag can't be set "later", so we don't have to worry about that.
 *
 * Finally, to maximize compatibility with overlayfs (which isn't compatible
 * with certain dentry operations) and to avoid taking an unnecessary
 * performance hit, we use custom dentry_operations for each possible
 * combination rather always installing all operations.
 */

> +void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	bool needs_encrypt_ops = dentry->d_flags & DCACHE_NOKEY_NAME;
> +#endif
> +#ifdef CONFIG_UNICODE
> +	bool needs_ci_ops = dentry->d_sb->s_encoding;
> +#endif
> +#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
> +	if (needs_encrypt_ops && needs_ci_ops) {
> +		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> +			return;
> +	}

The return statement above has the wrong indentation level.

> +#endif
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (needs_encrypt_ops) {
> +		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +#ifdef CONFIG_UNICODE
> +	if (needs_ci_ops) {
> +		d_set_d_op(dentry, &generic_ci_dentry_ops);
> +		return;
> +	}
> +#endif
> +}
> +EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8667d0cdc71e..11345e66353b 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3202,6 +3202,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
>  extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
>  				const char *str, const struct qstr *name);
>  #endif
> +extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
>  
>  #ifdef CONFIG_MIGRATION
>  extern int buffer_migrate_page(struct address_space *,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
