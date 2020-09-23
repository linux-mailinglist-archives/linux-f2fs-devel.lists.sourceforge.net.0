Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 418BA27625F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 22:44:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLBdC-00064g-Qc; Wed, 23 Sep 2020 20:44:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <krisman@collabora.com>) id 1kLBdB-00064R-JH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 20:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=komJWqXYYCQE256MNOWtBVLa2SoZT1V8yBjkudT1F/U=; b=R7Nbjh0pFjwWmzKz/NiEe58SEP
 6pYWWrMBaBKeIZoRZB2urzqVhT6dz5txIxrJ/oXeiXpO3+rEAZhNcWURAzjz7ESIsPRXrLoSXZdiF
 8MJDjvTT+6ZLOuGjjnS1prGvE86pbqmE4day7+2DpQACsPFiEXCr24nNagf2yrN4jpY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=komJWqXYYCQE256MNOWtBVLa2SoZT1V8yBjkudT1F/U=; b=m4IN+d8WRF9zkHV/o05MgMe+Zr
 7D3owZQnKJ7m6M+O5Lqb3SyI0HMlfsDEUbVlSgO8mDRQQWBpxFSMEnyMiIhHoovO8tuLe/NiEo9bk
 3OzJiHWsgieOV4crrxp370rSmzWMIMRp67sKQVIBig/Y2rAs+wT/JjBAdU5u35L33754=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLBd5-0056RS-Ne
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 20:44:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 0338129C28A
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Organization: Collabora
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-4-drosen@google.com>
Date: Wed, 23 Sep 2020 16:44:28 -0400
In-Reply-To: <20200923010151.69506-4-drosen@google.com> (Daniel Rosenberg's
 message of "Wed, 23 Sep 2020 01:01:49 +0000")
Message-ID: <87ft785ikz.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1kLBd5-0056RS-Ne
Subject: Re: [f2fs-dev] [PATCH 3/5] libfs: Add generic function for setting
 dentry_ops
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Daniel Rosenberg <drosen@google.com> writes:

> This adds a function to set dentry operations at lookup time that will
> work for both encrypted files and casefolded filenames.
>
> A filesystem that supports both features simultaneously can use this
> function during lookup preperations to set up its dentry operations once
> fscrypt no longer does that itself.
>
> Currently the casefolding dentry operation are always set because the
> feature is toggleable on empty directories. Since we don't know what
> set of functions we'll eventually need, and cannot change them later,
> we add just add them.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/libfs.c         | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h |  1 +
>  2 files changed, 50 insertions(+)
>
> diff --git a/fs/libfs.c b/fs/libfs.c
> index fc34361c1489..83303858f1fe 100644
> --- a/fs/libfs.c
> +++ b/fs/libfs.c
> @@ -1449,4 +1449,53 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
>  	return 0;
>  }
>  EXPORT_SYMBOL(generic_ci_d_hash);
> +
> +static const struct dentry_operations generic_ci_dentry_ops = {
> +	.d_hash = generic_ci_d_hash,
> +	.d_compare = generic_ci_d_compare,
> +};
> +#endif
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
> + * casefolding and encryption of the dentry name.
> + */
> +void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
> +#ifdef CONFIG_UNICODE
> +		if (dentry->d_sb->s_encoding) {
> +			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
> +			return;
> +		}
>  #endif
> +		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
> +		return;
> +	}
> +#endif
> +#ifdef CONFIG_UNICODE
> +	if (dentry->d_sb->s_encoding) {
> +		d_set_d_op(dentry, &generic_ci_dentry_ops);
> +		return;
> +	}
> +#endif
> +}

I think this is harder to read than necessary.  What do you think about
just splitting the three cases like the following:

void generic_set_encrypted_ci_d_ops(struct dentry *dentry) {

#if defined(CONFIG_FS_ENCRYPTION) && defined(CONFIG_UNICODE)
    if (encoding && encryption) {
    	d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
            return;
    }
#endif

#if defined (CONFIG_FS_ENCRYPTION)
    if (encryption) {
    	d_set_d_op(dentry, &generic_encrypted_dentry_ops);
        return;
    }
#endif

#if defined (CONFIG_UNICODE)
    if (encoding) {
    	d_set_d_op(dentry, &generic_ci_dentry_ops);
        return;
    }
#endif
}

> +EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index bc5417c61e12..6627896db835 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3277,6 +3277,7 @@ extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
>  extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
>  				const char *str, const struct qstr *name);
>  #endif
> +extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
>  
>  #ifdef CONFIG_MIGRATION
>  extern int buffer_migrate_page(struct address_space *,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
