Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED178C1C28
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 May 2024 03:33:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5F8s-0004D0-DJ;
	Fri, 10 May 2024 01:33:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1s5F8r-0004Cu-Rm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kajXW06+yRa7TIhitoKOHAvmGWaCvXAH3otjh0Ab5gY=; b=hIl8tBq2rJvFbEO/CS3iDJhI1+
 ZWhg0U+PgM2bw+Wk+9nFfl1uw/6moS6cnls8Eq1Dkud/dehIoYEZ7MnZzaJ+YE9x2TrC4se+jcEy/
 1NwPYH60EXgs2lsQ1xD37aLc4ssmfYMqg3EKoeMxu5Vclpuqkh/YD3Ys7AvIqAuzIgHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kajXW06+yRa7TIhitoKOHAvmGWaCvXAH3otjh0Ab5gY=; b=Eg6wPejFrHwlp/UjQV8DvdeMmw
 RfNGgUPSee+MID7kK5D7Ir5NttvOqYCZP+hd1OK3GamgVTmxulE7lzyLnuYp1TTAkyF1rqPev/8fJ
 OHj0ybnixxSA/2j23wOn+X9pDr/c6mp8eRHhTCs3HLPEv5OJDXVTW7NXIp+nUr7hoilM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5F8s-0007th-Oa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 01:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3367CCE1BAB;
 Fri, 10 May 2024 01:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFD6C116B1;
 Fri, 10 May 2024 01:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715304812;
 bh=jo2BzBRrRJMYVX1EgU8hOrka+kTaZZ2coGuJC5mSa9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RRFtePo+YEyD+qy4sC1+JJSrwUxDTsPjzlaO3jKndejZOJKx/aJJvzEK229uFiy5r
 zjP6IgPuO5eGIO8vwen7wRlIpgsHXvcW8nQHIhGNf7JzZI+qONSq/V9C92aIHQ/lcn
 3CsQwh48LMQTeq3SUn55svpVcdB9Vi4zPgotqsH4uiWl8oplnSOszq7OgE3F8Ot2tF
 dYLTbEe40bOu/MU0h9kKqxJQYhOM1X5KckOHHPYdAKXzOOPNmfoQWE7DbnGPyIYP0U
 hY0Vu3F+R5lzHTINSZhJp8UaM+KFOYr5IfnbST0QAOaLpBWb2DDBxrUeMkvtEKMGjB
 o0/qGQVDs1iOQ==
Date: Fri, 10 May 2024 01:33:30 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240510013330.GI1110919@google.com>
References: <20240405121332.689228-1-eugen.hristev@collabora.com>
 <20240405121332.689228-4-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240405121332.689228-4-eugen.hristev@collabora.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 05, 2024 at 03:13:26PM +0300,
 Eugen Hristev wrote:
 > +/** > + * generic_ci_match() - Match a name (case-insensitively) with
 a dirent. > + * This is a filesystem helper for comparison with [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5F8s-0007th-Oa
Subject: Re: [f2fs-dev] [PATCH v16 3/9] libfs: Introduce case-insensitive
 string comparison helper
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 05, 2024 at 03:13:26PM +0300, Eugen Hristev wrote:
> +/**
> + * generic_ci_match() - Match a name (case-insensitively) with a dirent.
> + * This is a filesystem helper for comparison with directory entries.
> + * generic_ci_d_compare should be used in VFS' ->d_compare instead.
> + *
> + * @parent: Inode of the parent of the dirent under comparison
> + * @name: name under lookup.
> + * @folded_name: Optional pre-folded name under lookup
> + * @de_name: Dirent name.
> + * @de_name_len: dirent name length.
> + *
> + * Test whether a case-insensitive directory entry matches the filename
> + * being searched.  If @folded_name is provided, it is used instead of
> + * recalculating the casefold of @name.
> + *
> + * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
> + * < 0 on error.
> + */
> +int generic_ci_match(const struct inode *parent,
> +		     const struct qstr *name,
> +		     const struct qstr *folded_name,
> +		     const u8 *de_name, u32 de_name_len)
> +{
> +	const struct super_block *sb = parent->i_sb;
> +	const struct unicode_map *um = sb->s_encoding;
> +	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
> +	struct qstr dirent = QSTR_INIT(de_name, de_name_len);
> +	int res = 0;
> +
> +	if (IS_ENCRYPTED(parent)) {
> +		const struct fscrypt_str encrypted_name =
> +			FSTR_INIT((u8 *) de_name, de_name_len);
> +
> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
> +			return -EINVAL;
> +
> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
> +		if (!decrypted_name.name)
> +			return -ENOMEM;
> +		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
> +						&decrypted_name);
> +		if (res < 0)
> +			goto out;

If fscrypt_fname_disk_to_usr() returns an error and !sb_has_strict_encoding(sb),
then this function returns 0 (indicating no match) instead of the error code
(indicating an error).  Is that the correct behavior?  I would think that
strict_encoding should only have an effect on the actual name comparison.

> +	/*
> +	 * Attempt a case-sensitive match first. It is cheaper and
> +	 * should cover most lookups, including all the sane
> +	 * applications that expect a case-sensitive filesystem.
> +	 */
> +	if (folded_name->name) {
> +		if (dirent.len == folded_name->len &&
> +		    !memcmp(folded_name->name, dirent.name, dirent.len))
> +			goto out;
> +		res = utf8_strncasecmp_folded(um, folded_name, &dirent);

Shouldn't the memcmp be done with the original user-specified name, not the
casefolded name?  I would think that the user-specified name is the one that's
more likely to match the on-disk name, because of case preservation.  In most
cases users will specify the same case on both file creation and later access.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
