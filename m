Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B7308EC5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Jan 2021 21:57:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l5apQ-0007l1-8S; Fri, 29 Jan 2021 20:57:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l5apO-0007kq-HE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 20:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CYS+d5i67mPRNhDUZwj3zwRy1n+pCthzSZhJb8HhqaU=; b=GdGzBF4SJv7XezlbVbCACiZMf5
 bnQmg7tGH+4HpShKKYpx+lVdobGTbC8ZOJy5+4sDPv36672Rv+WPxDH5/AwYP3EX76+nDC3uoYtMf
 BKX1KJx4lfxKsQJk0mU5Czg8xp8ZLPd2la14+eNiW8W4lReZxhDHCGao//LCenvp9rEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CYS+d5i67mPRNhDUZwj3zwRy1n+pCthzSZhJb8HhqaU=; b=V0TCBTf7IKlU8fWhJkrm7FRbhi
 cAUnvfEM8SBWpZjPELqNa051AuhP0WbhjYgVaz1jz+RahdXm//szbiwjL6gHiBKgNaw2EQ3TSCQCN
 Ua84wyQ5aBpM1erzIzy4C5K/Vl2y/5P0YALG2l3a26+U8KC+Zg1zRw15KJMAvUOFvkKI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l5apH-0002Dm-DX
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 20:57:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AC2DE64E05;
 Fri, 29 Jan 2021 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611953822;
 bh=v9S6wHwtGdGrrwTyPE1Do5RofOqY+qRTh/Bh20GJ1qc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V3ZsmdujUmQ9dzuY5Q398/k/yoryMqYl8BmcTGLLS8loaaJg0D/A1osCjaItn0KPd
 XSxEaZWndZTL4bd4FJKbKBLOiw2dfXxmMGkdNYxVyu344ooqhiMgr6wdbSdu3ESZ7O
 0rOwZ1OUQEN8q/S66kpCLu9dB52Yw7Mh0yX8QHbRCRvGXHWQjeSVBkbJTjVyGgvWRf
 t4i+2qn8G97qnHtaWylwAWAUqVUbQWc88HlA0ziRuLrCCOjlBf2vS39CbH5+j0bygh
 K3S+worwg8AD+NAoPRiTNxgdHnRNCeT6YbcaRUVnhKJRh5oWVB3MJ/ygyXFwR6vzeW
 p5+T1Lr4s6oOA==
Date: Fri, 29 Jan 2021 12:57:00 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <YBR2nGbrYeWW219s@sol.localdomain>
References: <20201217150435.1505269-1-satyat@google.com>
 <20201217150435.1505269-4-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217150435.1505269-4-satyat@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l5apH-0002Dm-DX
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: Add metadata encryption support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 17, 2020 at 03:04:35PM +0000, Satya Tangirala wrote:
> Wire up metadata encryption support with the fscrypt metadata crypt
> additions. Note that this feature relies on the blk-crypto framework
> for encryption, and thus requires either hardware inline encryption
> support or the blk-crypto-fallback.
> 
> Filesystems can be configured with metadata encryption support using the
> f2fs userspace tools (mkfs.f2fs). Once formatted, F2FS filesystems with
> metadata encryption can be mounted as long as the required key is present.
> fscrypt looks for a logon key with the key descriptor=
> fscrypt:<metadata_key_identifier>. The metadata_key_identifier is stored in
> the filesystem superblock (and the userspace tools print the required
> key descriptor).
> 
> Right now, the superblock of the filesystem is itself not encrypted. F2FS
> reads the superblock using sb_bread, which uses the bd_inode of the block
> device as the address space for any data it reads from the block device -
> the data read under the bd_inode address space must be what is physically
> present on disk (i.e. if the superblock is encrypted, then the ciphertext
> of the superblock must be present in the page cache in the bd_inode's
> address space), but f2fs requires that the superblock is decrypted by
> blk-crypto, which would put the decrypted page contents into the page cache
> instead. We could make f2fs read the superblock by submitting bios directly
> with a separate address space, but we choose to just not encrypt the
> superblock for now.
> 
> Not encrypting the superblock allows us to store the encryption algorithm
> used for metadata encryption within the superblock itself, which simplifies
> a few things. The userspace tools will store the encryption algorithm in
> the superblock when formatting the FS.

The explanation about why the superblock isn't encrypted seems a bit backwards.
It makes it sound like this decision was mainly an accident because of how f2fs
is currently implemented.  But actually we need to leave the superblock
unencrypted anyway in order to keep the filesystem type and metadata encryption
options readable from disk, so that the filesystem can be mounted without
knowing the filesystem type and encryption options ahead of time -- right?
I.e. would anything actually be different if it was super easy to encrypt the
superblock in the kernel?

> 
> +	/* Check if FS has metadata encryption if kernel doesn't support it */
> +#ifndef CONFIG_FS_ENCRYPTION_METADATA
> +	if (raw_super->metadata_crypt_alg) {
> +		f2fs_err(sbi, "Filesystem has metadata encryption but kernel support for it wasn't enabled");
> +		return -EINVAL;
> +	}
> +#endif

This can use !IS_ENABLED(CONFIG_FS_ENCRYPTION_METADATA).

> +	if (fscrypt_metadata_crypted(sb)) {
> +		f2fs_notice(sbi, "Mounted with metadata key identifier = %s%*phN",
> +			    FSCRYPT_KEY_DESC_PREFIX,
> +			    FSCRYPT_KEY_IDENTIFIER_SIZE,
> +			    sbi->raw_super->metadata_crypt_key_ident);
> +	}

Should this show the encryption algorithm too?  Maybe:

"Metadata encryption enabled; algorithm=%s, key_identifier=%*phN"

Note that showing the "fscrypt:" key description prefix doesn't really add
anything, so I recommend leaving it out.

> +	/* The metadata encryption algorithm (FSCRYPT_MODE_*) */

... or 0 if none.

> +	__le32 metadata_crypt_alg;

> +	/* The metadata encryption key identifier */
> +	__u8 metadata_crypt_key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE];

... (if metadata_crypt_alg != 0)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
