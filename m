Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBB2751B3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 08:39:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKyQs-0007sx-HK; Wed, 23 Sep 2020 06:39:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kKyQr-0007ov-M0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 06:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wXK90ToFbg5J1LEwUL56i8TYd/Ua5rEdc8TTENUxoQc=; b=LbVlsUwCKS7RCVVJKehuyaklvI
 4Z7IqqaZ4KKwZ0RMHLHfET75LxGeYo/AIQP2vKGozMbbw/cIzLMmkoiqPV98rohMYyx7ffqk1z7ZZ
 txjXS3pGb6EAZ7QU2bIuIHexEOnPes+9iBlkKnQXTnAbD/VXYJwspwUnWCOHPAniyKFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wXK90ToFbg5J1LEwUL56i8TYd/Ua5rEdc8TTENUxoQc=; b=YguVkS0T1N5r9u5VBd8g9sYVHa
 vKGyjvbF0gmqSacigD2HOdYd4zskeUigw2jPYJOJm/aAKDnPGJCmgtuj7GbB69QJa1RdW0eTf28Dx
 +0eTyPEbtptk6eMa1kLw175jd66TjQzGoRJt0yLJKEbecq0hGOZ9C+P861PlP8jvOZag=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKyD9-0026lQ-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 06:25:19 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 425FC21D43;
 Wed, 23 Sep 2020 06:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600842298;
 bh=EH8hBpeiETHC+h9j5rcOQFLvuMpOSGcVeSqcrnJIr+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o9hZFORZJfS43AD9qs/eouYS9H2lmfwPF3ydoBftcuORWrWFA+Oosf8DKY1mk3Zm3
 cIZCITTnRgEk6JhC/F6wZsXxGJPNPdgYJYJhHDaphw687jIKp1UHYaNhlwigfbmU7Y
 swkdL+l/hvzPy8OCNZxj+GedL3eT8qcF1ZOoGSNU=
Date: Tue, 22 Sep 2020 23:24:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Message-ID: <20200923062456.GF9538@sol.localdomain>
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-6-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-6-drosen@google.com>
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
X-Headers-End: 1kKyD9-0026lQ-Vw
Subject: Re: [f2fs-dev] [PATCH 5/5] f2fs: Handle casefolding with Encryption
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

On Wed, Sep 23, 2020 at 01:01:51AM +0000, Daniel Rosenberg wrote:
> Expand f2fs's casefolding support to include encrypted directories.  To
> index casefolded+encrypted directories, we use the SipHash of the
> casefolded name, keyed by a key derived from the directory's fscrypt
> master key.  This ensures that the dirhash doesn't leak information
> about the plaintext filenames.
> 
> Encryption keys are unavailable during roll-forward recovery, so we
> can't compute the dirhash when recovering a new dentry in an encrypted +
> casefolded directory.  To avoid having to force a checkpoint when a new
> file is fsync'ed, store the dirhash on-disk appended to i_name.
> 
> This patch incorporates work by Eric Biggers <ebiggers@google.com>
> and Jaegeuk Kim <jaegeuk@kernel.org>.
> 
> Co-developed-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> ---

Generally looks good.  If it's needed, you can add:

Reviewed-by: Eric Biggers <ebiggers@google.com>

(Though, some may claim I can't give Reviewed-by since this patch already has my
Co-developed-by.)

One comment below, though:

> @@ -218,9 +219,28 @@ static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
>  {
>  	const struct super_block *sb = dir->i_sb;
>  	const struct unicode_map *um = sb->s_encoding;
> +	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
>  	struct qstr entry = QSTR_INIT(de_name, de_name_len);
>  	int res;
>  
> +	if (IS_ENCRYPTED(dir)) {
> +		const struct fscrypt_str encrypted_name =
> +			FSTR_INIT((u8 *)de_name, de_name_len);
> +
> +		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(dir)))
> +			return false;
> +
> +		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
> +		if (!decrypted_name.name)
> +			return false;
> +		res = fscrypt_fname_disk_to_usr(dir, 0, 0, &encrypted_name,
> +						&decrypted_name);
> +		if (res < 0)
> +			goto out;

We probably should be passing up errors from here to f2fs_match_name(), then to
f2fs_find_target_dentry(), then to f2fs_find_in_inline_dir() or find_in_block().

Ignoring the filename may be okay if fscrypt_fname_disk_to_usr() returns
-EUCLEAN, indicating that it's invalid.  However, if the error is -ENOMEM,
either from the kmalloc() or from fscrypt_fname_disk_to_usr(), then the caller
should receive an error rather than the filename being ignored.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
