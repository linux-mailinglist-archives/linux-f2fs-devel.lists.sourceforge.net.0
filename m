Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91686217C94
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 03:27:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jsys9-0004jU-Qc; Wed, 08 Jul 2020 01:27:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jsys9-0004jM-1n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 01:27:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8DwBGhaYjuDOd7lLonYab4nNGyv1e+R5xdslszF/vNA=; b=afXILuVlKXiQiKOhndGjWHJz2T
 pJqYqwoxIkSAEZPW4pv84d7F+asjdwxH6iJEb93e7GoB52E1PIPNDVm6jwNO70pSRsHbEVE3iWJoZ
 74mGD3LUZrDAC9zf7m8xBLygVeAUQZnNzCXHuIKB9Rhhz0QKba1/IUneEpMO2vLH/BmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8DwBGhaYjuDOd7lLonYab4nNGyv1e+R5xdslszF/vNA=; b=eCX0ObPx3DecN5NaodbwvRujmJ
 5HdnOyCGVCvJp9zAIbBp6KlPBHIWYHDpVrG1NjVIArkH9rseY8viUgq+Qb5zr/cUZhRhrYUzpNg86
 KcQj5CAGdcdkB7zHFKkRHEAEOK5J0PWMYfewJ8pmw1v+sgOKXufLLWfh59q15WGJbkZw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jsys0-00DkBc-TT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 01:27:40 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B77020708;
 Wed,  8 Jul 2020 01:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594171647;
 bh=/7pCaqefr9jo0aoJVKw/0wOb++ZXKm19cVeKnE9mCvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qHRW7YN0Nlb2+aagrXIdgt1BRs2O/ElEgTA8SeDY58ttcpFjV2WMguBka5e0D14/6
 eII1Utr6Zyf7C+j8nqJKF6oIyPa7Lvr7IX+95hdHWJfLY6SYii6lxG8/9KTCfZj1j0
 lMNMPiLdrNgHwelooIlKFukdniOyCGAXm4jCeDcE=
Date: Tue, 7 Jul 2020 18:27:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200708012725.GE839@sol.localdomain>
References: <20200707113123.3429337-1-drosen@google.com>
 <20200707113123.3429337-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707113123.3429337-3-drosen@google.com>
X-Spam-Score: -0.5 (/)
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
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jsys0-00DkBc-TT
Subject: Re: [f2fs-dev] [PATCH v10 2/4] fs: Add standard casefolding support
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
Cc: Theodore Ts'o <tytso@mit.edu>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 07, 2020 at 04:31:21AM -0700, Daniel Rosenberg wrote:
> +/*
> + * Determine if the name of a dentry should be casefolded. It does not make
> + * sense to casefold the no-key token of an encrypted filename.
> + *
> + * Return: if names will need casefolding
> + */
> +static bool needs_casefold(const struct inode *dir, const struct dentry *dentry)
> +{
> +	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
> +			!(dentry->d_flags & DCACHE_ENCRYPTED_NAME);
> +}
> +
[...]
> +/**
> + * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are hashing
> + * @str:	qstr of name whose hash we should fill in
> + *
> + * Return: 0 if hash was successful, or -ERRNO
> + */
> +int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
> +{
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
> +	struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	int ret = 0;
> +
> +	if (!inode || !needs_casefold(inode, dentry))
> +		return 0;
> +
> +	ret = utf8_casefold_hash(um, dentry, str);
> +	if (ret < 0)
> +		goto err;
> +
> +	return 0;
> +err:
> +	if (sb_has_strict_encoding(sb))
> +		ret = -EINVAL;
> +	else
> +		ret = 0;
> +	return ret;
> +}
> +EXPORT_SYMBOL(generic_ci_d_hash);

I thought this was discussed before, but the 'dentry' passed to ->d_hash() is
the parent dentry, not the one being hashed.

Therefore checking DCACHE_ENCRYPTED_NAME on 'dentry' is wrong here.  Instead we
need to use !fscrypt_has_encryption_key() here.  (IOW, while checking
DCACHE_ENCRYPTED_NAME is better *when possible*, it's not possible here.)

Note that the whole point of ->d_hash() is to hash the filename so that the VFS
can find the dentry.  If the VFS already had the dentry, there would be no need
for ->d_hash().

Also, did you consider my suggestion to not handle encrypt+casefold in this
patch?  I'd like to get this series in as a refactoring for 5.9.  The encryption
handling (which is new) might better belong in a later patch series.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
