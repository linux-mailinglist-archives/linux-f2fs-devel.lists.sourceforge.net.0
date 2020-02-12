Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7C015A05A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2020 06:10:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j1kI6-0001ph-1g; Wed, 12 Feb 2020 05:10:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j1kI5-0001pV-0c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 05:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xctKs9MJk+46GzGe2gIBLTZnmyUbN0n61dsiHq4F5BE=; b=SZ2MT+RnTCYB15y8bquSKX1diy
 PXvJ9McrzgBVMbE1B0wTrxD/1B4XUnJG9WRT6+K8jd33t46Ty09nZp2ldYFXAt2Yum9Zq6Syf7NxC
 KQoZSbn7ZjuVJQ6Uz5bGKXHQhqJTtVadw1x95MY+mJfu2PtP03niCDtoTykbNW7wQ7xo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xctKs9MJk+46GzGe2gIBLTZnmyUbN0n61dsiHq4F5BE=; b=g4gmGpPwjEBASxf6lF/rcyoWRA
 14QI4/qssP5a5o92nmK1mO0ELDE+loR72Izy0RTVgAF2y49CfWJxvwH1bdjaQCskP6fsYlUztGhfR
 LCP/EK9grtd+wYcH8mVPs5U0dre6rRiaRzxaUKG+TrRufUlDDCjHB5TtNqRPFHkuxPuo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j1kI3-0018V1-0h
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 Feb 2020 05:10:24 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F0782073C;
 Wed, 12 Feb 2020 05:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581484215;
 bh=SoSyxp3A0UA/8Dnh/f7bNxJ3PKh7YiP5yN7Miz0urew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NJ4hV4Xer0eG0SHiCiwOzByKd5JyUN7uZA4Ev57RCddYfHiQhVYc1ZP6Nu/jQiKeI
 sM/IB+kbGDo4+3rniEtpM5HWck5ZfygaFJlCh2p31egPYqFLRTnuG6Vzno8r8uusGN
 eqTOJ2fXAIxq3MOi1WPwMBn/MfIrQVYZVrO20sdk=
Date: Tue, 11 Feb 2020 21:10:13 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200212051013.GG870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
 <20200208013552.241832-7-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-7-drosen@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: decrypted_name.name]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j1kI3-0018V1-0h
Subject: Re: [f2fs-dev] [PATCH v7 6/8] f2fs: Handle casefolding with
 Encryption
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

On Fri, Feb 07, 2020 at 05:35:50PM -0800, Daniel Rosenberg wrote:
> This expands f2fs's casefolding support to include encrypted
> directories. For encrypted directories, we use the siphash of the
> casefolded name. This ensures there is no direct way to go from an
> unencrypted name to the stored hash on disk without knowledge of the
> encryption policy keys.
> 
> Additionally, we switch to using the vfs layer's casefolding support
> instead of storing this information inside of f2fs's private data.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---
>  fs/f2fs/dir.c    | 65 ++++++++++++++++++++++++++++++++----------------
>  fs/f2fs/f2fs.h   |  8 +++---
>  fs/f2fs/hash.c   | 23 +++++++++++------
>  fs/f2fs/inline.c |  9 ++++---
>  fs/f2fs/super.c  |  6 -----
>  5 files changed, 68 insertions(+), 43 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 38c0e6d589be4..3517dd4060341 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -112,30 +112,50 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
>   * doesn't match or less than zero on error.
>   */
>  int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
> -				const struct qstr *entry, bool quick)
> +		    unsigned char *name2, size_t len, bool quick)
>  {
>  	const struct super_block *sb = parent->i_sb;
>  	const struct unicode_map *um = sb->s_encoding;
> +	const struct fscrypt_str crypt_entry = FSTR_INIT(name2, len);
> +	struct fscrypt_str decrypted_entry;
> +	struct qstr decrypted;
> +	struct qstr entry = QSTR_INIT(name2, len);
> +	struct qstr *tocheck;
>  	int ret;
>  
> +	decrypted_entry.name = NULL;
> +
> +	if (IS_ENCRYPTED(parent) && fscrypt_has_encryption_key(parent)) {
> +		decrypted_entry.name = kmalloc(len, GFP_ATOMIC);
> +		decrypted.name = decrypted_entry.name;
> +		decrypted_entry.len = len;
> +		decrypted.len = len;
> +		if (!decrypted.name)
> +			return -ENOMEM;
> +		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &crypt_entry,
> +							&decrypted_entry);
> +		if (ret < 0)
> +			goto out;
> +	}
> +	tocheck = decrypted_entry.name ? &decrypted : &entry;
> +
>  	if (quick)
> -		ret = utf8_strncasecmp_folded(um, name, entry);
> +		ret = utf8_strncasecmp_folded(um, name, tocheck);
>  	else
> -		ret = utf8_strncasecmp(um, name, entry);
> -
> +		ret = utf8_strncasecmp(um, name, tocheck);
>  	if (ret < 0) {
>  		/* Handle invalid character sequence as either an error
>  		 * or as an opaque byte sequence.
>  		 */
>  		if (sb_has_enc_strict_mode(sb))
> -			return -EINVAL;
> -
> -		if (name->len != entry->len)
> -			return 1;
> -
> -		return !!memcmp(name->name, entry->name, name->len);
> +			ret = -EINVAL;
> +		else if (name->len != len)
> +			ret = 1;
> +		else
> +			ret = !!memcmp(name->name, tocheck->name, len);
>  	}
> -
> +out:
> +	kfree(decrypted_entry.name);
>  	return ret;
>  }

The case-sensitive fallback is broken with encrypted filenames; it's checking
the length of the encrypted filename rather than the decrypted filename.  The
decrypted name may be shorter.

Can you please improve your testing to catch bugs like this?

IMO, part of the problem is that there are multiple lengths here, so the
variable named 'len' is ambiguous.  Can you please clean this function up to
name things properly?  Also, the 'tocheck' variable is unnecessary, and it's
confusing having both 'decrypted' and 'decrypted_entry', and to decrypt
conditionally when fscrypt_has_encryption_key() since that's already required.

How about:

int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
		    u8 *de_name, size_t de_name_len, bool quick)
{
	const struct super_block *sb = parent->i_sb;
	const struct unicode_map *um = sb->s_encoding;
	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
	struct qstr entry = QSTR_INIT(de_name, de_name_len);
	int ret;

	if (IS_ENCRYPTED(parent)) {
		const struct fscrypt_str encrypted_name =
			FSTR_INIT(de_name, de_name_len);

		decrypted_name.name = kmalloc(de_name_len, GFP_ATOMIC);
		if (!decrypted_name.name)
			return -ENOMEM;
		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
						&decrypted_name);
		if (ret < 0)
			goto out;
		entry.name = decrypted_name.name;
		entry.len = decrypted_name.len;
	}

	if (quick)
		ret = utf8_strncasecmp_folded(um, name, &entry);
	else
		ret = utf8_strncasecmp(um, name, &entry);
	if (ret < 0) {
		/* Handle invalid character sequence as either an error
		 * or as an opaque byte sequence.
		 */
		if (sb_has_enc_strict_mode(sb))
			ret = -EINVAL;
		else if (name->len != entry.len)
			ret = 1;
		else
			ret = !!memcmp(name->name, entry.name, entry.len);
	}
out:
	kfree(decrypted_name.name);
	return ret;
}


Of course, all this applies to ext4_ci_compare() as well.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
