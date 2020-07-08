Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D39217DFD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 06:13:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jt1S5-0001vB-2Z; Wed, 08 Jul 2020 04:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jt1S3-0001v1-UG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 04:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dViwnDB2R8mcGoTykUCSsZ1McJvhz/zzLNoU6cDwj6U=; b=KzKoSYgzhQPu823arti+/wU382
 vNP6kMzE6MztaVrqcwEvCeNEQR3Ah2UZjOgZExoZcVKakeb8E5cW10H2pc5JR076ubpYtA28ldgw8
 37aDyMF5kzoESLlMXzJFBTXR63Z3Oz5hfDREFXFX/q9Xv/TcMiOo17UYLuzz3XOqOfVg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dViwnDB2R8mcGoTykUCSsZ1McJvhz/zzLNoU6cDwj6U=; b=LSTMfK8h2KBSYeC/ipfxkTxo+c
 W1zr3A5d8a9E++gDb5aRSi6Rg3L8I+nMkkISVIy7Svufldp0hQqxmDBvCJFZNG/QTeiqKyF4GhW7+
 IUU89FScog/zTMlWGFmRrbOdPsFV4igOXNamm8C0qm1+cyGJ153sBEog5wVWjBsT8dzI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jt1Rx-00GtsE-Rv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 04:12:55 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F19A6206BE;
 Wed,  8 Jul 2020 04:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594181552;
 bh=vVo5pFG1bIjLvY9lAeAGfvgg5b4sWEYOCkrdKFS1mXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NSWV4k3cUI0VfYbcLiHz5o0XnCW8TiB2Wg/1SLaul78EN8pmhvRHpRmgVoH6YnT7D
 N5iKpo3Z5QvG752hE8YITH/HzmSP2BpWdJ/uS94cOWb+jOSs89Ub/i0bwdiDeUY89N
 cwpUj4+ARwqK6UR8iy1V0w2HiqBTz5/F/K09BnAc=
Date: Tue, 7 Jul 2020 21:12:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200708041230.GL839@sol.localdomain>
References: <20200708030552.3829094-1-drosen@google.com>
 <20200708030552.3829094-3-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708030552.3829094-3-drosen@google.com>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt1Rx-00GtsE-Rv
Subject: Re: [f2fs-dev] [PATCH v11 2/4] fs: Add standard casefolding support
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

On Tue, Jul 07, 2020 at 08:05:50PM -0700, Daniel Rosenberg wrote:
> +/**
> + * generic_ci_d_compare - generic d_compare implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are checking against
> + * @len:	len of name of dentry
> + * @str:	str pointer to name of dentry
> + * @name:	Name to compare against
> + *
> + * Return: 0 if names match, 1 if mismatch, or -ERRNO
> + */
> +int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
> +			  const char *str, const struct qstr *name)
> +{
> +	const struct dentry *parent = READ_ONCE(dentry->d_parent);
> +	const struct inode *inode = READ_ONCE(parent->d_inode);

How about calling the 'inode' variable 'dir' instead?

That would help avoid confusion about what is the directory and what is a file
in the directory.

Likewise in generic_ci_d_hash().

> +/**
> + * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
> + * @dentry:	dentry whose name we are hashing

This comment for @dentry needs to be updated.

It's the parent dentry, not the dentry whose name we are hashing.

> + * @str:	qstr of name whose hash we should fill in
> + *
> + * Return: 0 if hash was successful, or -ERRNO

As I mentioned on v9, this can also return 0 if the hashing was not done because
it wants to fallback to the standard hashing.  Can you please fix the comment?

> +int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
> +{
> +	const struct inode *inode = READ_ONCE(dentry->d_inode);
> +	struct super_block *sb = dentry->d_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	int ret = 0;
> +
> +	if (!inode || !needs_casefold(inode))
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

On v9, Gabriel suggested simplifying this to:

	ret = utf8_casefold_hash(um, dentry, str);
	if (ret < 0 && sb_has_enc_strict_mode(sb))
		return -EINVAL;
	return 0;

Any reason not to do that?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
