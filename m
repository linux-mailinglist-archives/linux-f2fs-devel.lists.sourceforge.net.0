Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C47286B80
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Oct 2020 01:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/HJWrQtwkiEkKW17Z3IcSg51p+7jlyEWTcbZqpl2S88=; b=SZVwDhU4hU/H8n/9nAsXltjo9
	lqgYAx9Cr/cTQNx1qXT7gSDxuCNH/JPteSJ6k0wj37b0Kp1QI22HQKozmurcd4Xc+sUnUs2Tym3rs
	scRMVqGlabmxjmx45JfcGSR/RrGGw+wbXS0bYPlfct8DmMOmwU/h2m/9ZpAo6zGl7ZCUE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQIrF-0007ei-QY; Wed, 07 Oct 2020 23:28:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <satyat@google.com>) id 1kQIrD-0007eZ-Cb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 23:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rSUbD1+U2Lq2EenlGAYm1ufk2wcygYgfqrlESf3aYUk=; b=HOrqezNjQWpXcQhfah51zsxYa2
 I/7DEMYAPH4zdNlZ0zW4fGa5bhBQRdyyhOkim+B3Sld8Enhg0RVwmd6Sh5I2uRJCHLjs212+6TYoY
 IhWocfTipsnyuBgRONA6jcXJ1YsMSvkbX1gDvKZeu/XuUQhYDEM7upxSPYYccDJaka8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rSUbD1+U2Lq2EenlGAYm1ufk2wcygYgfqrlESf3aYUk=; b=FvZFV/kXUqTCQ1ZkPmNj8C47k1
 UExfpgqL+Rlr5YO2mcLEb/5vNFkMJ/LdysoCy70R0AYaoTi1Kj1li2ECc5TX8CvwZpgBBqnTN2rkJ
 JF0dH3SwH+ZGyo2Rj9bHYAI2bn+MLesmGcRSOVDWCZYLAvoalhBzWxi05tXSzzd6YwSM=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kQIr3-002Z9j-6Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 23:28:27 +0000
Received: by mail-pg1-f196.google.com with SMTP id n9so2625589pgf.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 07 Oct 2020 16:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rSUbD1+U2Lq2EenlGAYm1ufk2wcygYgfqrlESf3aYUk=;
 b=jBIqTXn877ZibdJc8AnFwWz2do9qfKkFOp0AzVz5oGDOCK5rBJAfc65Jhpihkf4sny
 02fP3PEzAo6BqHaMr3y52wQL/PVwa7XQ+xpdcTcsKX2pSamRGyefEVVCjlzBGN+XMkjq
 eO61mY1QEM5sOmJwFt9z+O3IHoCGSfry7zyRbPw5sSYkWwhY7NhLCyQWets08bF/OeV1
 BbIGLMgLxLewbsW243Uy1Gd80kgGGULgoSX2hnyH7t1d4cPZQrZrlLKuCyS+MIpyqiph
 QNv+11XaMfZQDx47TCCjkKiGek0io31iY/gqOgu3MOwI7Y2cp7TvmX66e5ovqo/as91f
 YOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rSUbD1+U2Lq2EenlGAYm1ufk2wcygYgfqrlESf3aYUk=;
 b=Gg7RRTNPlUku2FI4CsipY8tOAJzE0ruCyZKI3bkKm4Vqgzds9GmgO6Nlm9XyIfJpoM
 LyiiBhEYfOJukWUpxO6lELqMvvdumuuXI7s2NKaWa5DtQX1YhgZ+pH0jJNFH95nCiQT3
 H2+nsc+Of6GzviIzTfIxr4lJBmp/Y8qVgeiSWrz5AMk+lHAkUAXRGzAzhVADjk9BFoWP
 flgSakG51gryyJNfN3GXsUbszGzi9e6dIkwOBj1Xo24zHZxjCFqVG3oZ1041c1sma7o+
 QtTFPkOZeMUHK+k7dK8vOcxs0dHSFi3VQjLeyBHJr1wgBC3kGmjoLxKS6Xpv9qkjZta/
 TDZA==
X-Gm-Message-State: AOAM531gCyS9TzpOCs42TdWi4f4e9NDHgR0Y7m7fjZqvJ6VSDIgD/wfU
 SVd5bP8Aep+6gIe1AGi35SpZTA==
X-Google-Smtp-Source: ABdhPJwbAgvlw1gILyFrg3tooZ4NMYx00/ak320lMtII/4wQ89yVoKfddV4PME+12xcrv8ZaFlRbOg==
X-Received: by 2002:a17:90a:804a:: with SMTP id
 e10mr4843620pjw.218.1602113291209; 
 Wed, 07 Oct 2020 16:28:11 -0700 (PDT)
Received: from google.com (154.137.233.35.bc.googleusercontent.com.
 [35.233.137.154])
 by smtp.gmail.com with ESMTPSA id 206sm4596006pgh.26.2020.10.07.16.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 16:28:10 -0700 (PDT)
Date: Wed, 7 Oct 2020 23:28:06 +0000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20201007232806.GB2544297@google.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <20201005073606.1949772-3-satyat@google.com>
 <20201007205221.GA1530638@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007205221.GA1530638@gmail.com>
X-Spam-Score: -15.6 (---------------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF white-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kQIr3-002Z9j-6Q
Subject: Re: [f2fs-dev] [PATCH 2/3] fscrypt: Add metadata encryption support
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 07, 2020 at 01:52:21PM -0700, Eric Biggers wrote:
> On Mon, Oct 05, 2020 at 07:36:05AM +0000, Satya Tangirala wrote:
> > Introduces functions that help with metadata encryption.
> > 
> > In particular, we introduce:
> > 
> > fscrypt_setup_metadata_encryption() - filesystems should call this function
> > to set up metadata encryption on a super block with the encryption
> > algorithm (the desired FSCRYPT_MODE_*) and the key descriptor of the
> > encryption key. The key descriptor is looked up in the logon keyring of the
> > current session using "fscrypt:" as the descriptor prefix.
> > 
> > fscrypt_metadata_crypt_bio() - filesystems should call this function on a
> > bio that it wants metadata crypted. This function will set a bio-crypt-ctx
> > on the bio if the metadata key was set up with
> > fscrypt_setup_metadata_encryption(). The DUN for the first block in the bio
> > is the offset of that block from the start of the filesystem.
> > 
> > fscrypt_free_metadata_encryption() - this function should be called when
> > the super block is being freed. It ensures that the metadata encryption key
> > is evicted, if necessary, from devices.
> > 
> > Note that the filesystem (rather than fscrypt) controls precisely which
> > blocks are encrypted with the metadata encryption key and which blocks are
> > encrypted with other keys/not encrypted at all. Fscrypt only provides some
> > convenience functions that ultimately help encrypt a bio with the metadata
> > encryption key when desired.
> > 
> > Signed-off-by: Satya Tangirala <satyat@google.com>
> > ---
> >  fs/crypto/Kconfig           |   6 +
> >  fs/crypto/Makefile          |   1 +
> >  fs/crypto/fscrypt_private.h |  19 ++++
> >  fs/crypto/inline_crypt.c    |  18 ---
> >  fs/crypto/metadata_crypt.c  | 220 ++++++++++++++++++++++++++++++++++++
> >  include/linux/fs.h          |   3 +
> >  include/linux/fscrypt.h     |  47 ++++++++
> >  7 files changed, 296 insertions(+), 18 deletions(-)
> >  create mode 100644 fs/crypto/metadata_crypt.c
> > 
> > diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
> > index a5f5c30368a2..3010e91f6659 100644
> > --- a/fs/crypto/Kconfig
> > +++ b/fs/crypto/Kconfig
> > @@ -30,3 +30,9 @@ config FS_ENCRYPTION_INLINE_CRYPT
> >  	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
> >  	help
> >  	  Enable fscrypt to use inline encryption hardware if available.
> > +
> > +config FS_ENCRYPTION_METADATA
> > +	bool "Enable metadata encryption with fscrypt"
> > +	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
> > +	help
> > +	  Enable fscrypt to encrypt metadata.
> 
> This needs Kconfig help text to describe what this feature is and why anyone
> would want to enable it.  It also needs an update to
> Documentation/filesystems/fscrypt.rst, and a test in xfstests that tests that
> the encryption is being done correctly.
> 
Sure. I forgot to mention, fwiw I did hack xfstests to enable metadata
encryption on each device to try to test the code, and also some other
informal tests, but as you point out, I should send out actual xfstests
to test this.
> > diff --git a/fs/crypto/metadata_crypt.c b/fs/crypto/metadata_crypt.c
> > new file mode 100644
> > index 000000000000..5e16df130509
> > --- /dev/null
> > +++ b/fs/crypto/metadata_crypt.c
> > @@ -0,0 +1,220 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Metadata encryption support for fscrypt
> > + *
> > + * Copyright 2020 Google LLC
> > + */
> > +
> > +#include <keys/user-type.h>
> > +#include <linux/blk-crypto.h>
> > +#include <linux/blkdev.h>
> > +#include <linux/buffer_head.h>
> > +#include <linux/sched/mm.h>
> > +
> > +#include "fscrypt_private.h"
> > +
> > +/* TODO: mostly copied from keysetup_v1.c - maybe refactor this function */
> > +static int fscrypt_metadata_get_key_from_id(const char *prefix,
> > +					    char *descriptor_hex,
> > +					    unsigned int min_keysize,
> > +					    char *raw_key)
> > +{
> > +	char *description;
> > +	struct key *key;
> > +	const struct user_key_payload *ukp;
> > +	const struct fscrypt_key *payload;
> > +	int err = -ENOKEY;
> > +
> > +	if (strlen(descriptor_hex) != FSCRYPT_KEY_DESCRIPTOR_SIZE * 2)
> > +		return -EINVAL;
> > +
> > +	description = kasprintf(GFP_NOFS, "%s%s", prefix, descriptor_hex);
> > +	if (!description)
> > +		return -ENOMEM;
> > +
> > +	key = request_key(&key_type_logon, description, NULL);
> > +	kfree(description);
> > +	if (IS_ERR(key))
> > +		return PTR_ERR(key);
> > +
> > +	down_read(&key->sem);
> > +	ukp = user_key_payload_locked(key);
> > +
> > +	if (!ukp) /* was the key revoked before we acquired its semaphore? */
> > +		goto out;
> > +
> > +	payload = (const struct fscrypt_key *)ukp->data;
> 
> 'struct fscrypt_key' was a mistake.  How about having the key payload just be
> the raw key?
> 
> Or are you thinking that reserved fields will be needed?
> 
Ah, I should've just made it the raw key to start with - I can't think
of any reserved fields we might need when specifying the key (I thought
we might need something like that when we try to support hardware
wrapped keys with metadata encryption, but we could use extra fields in
the superblock for that).

> > +/**
> > + * fscrypt_setup_metadata_encryption() - prepare a super_block for metadata
> > + *					 encryption
> > + * @sb: The super_block to set up metadata encryption for
> > + * @key_desc_hex: The key descriptor (in hex) to look for in the logon keyring.
> 
> There's no such thing as a "logon keyring".  I think you mean "look for a logon
> key in the process-subscribed keyrings".
> 
Ah, I see - thanks!
> > + * @fscrypt_mode_num: The FSCRYPT_MODE_* to use as the encryption algorithm.
> > + *
> > + * Return: 0 on success, negative number on error.
> > + */
> > +int fscrypt_setup_metadata_encryption(struct super_block *sb,
> > +				      char *key_desc_hex,
> > +				      int fscrypt_mode_num)
> > +{
> > +	int err = 0;
> > +	enum blk_crypto_mode_num crypto_mode;
> > +	unsigned int lblk_bits = 64;
> > +	unsigned int dun_bytes;
> > +	unsigned int dummy;
> > +	char raw_key[FSCRYPT_MAX_KEY_SIZE];
> 
> For binary data, prefer 'u8' to 'char'.
> 
> > +
> > +	if (fscrypt_mode_num > __FSCRYPT_MODE_MAX || fscrypt_mode_num < 0 ||
> > +	    !fscrypt_modes[fscrypt_mode_num].cipher_str) {
> > +		fscrypt_warn(NULL, "Invalid fscrypt mode %d specified for metadata encryption.",
> > +			     fscrypt_mode_num);
> > +		return -EOPNOTSUPP;
> > +	}
> 
> The filenames-only encryption modes (FSCRYPT_MODE_AES_256_CTS and
> FSCRYPT_MODE_AES_128_CTS) will pass this check, which seems undesired.
> 
> > +
> > +	if (sb->s_cop->get_ino_and_lblk_bits)
> > +		sb->s_cop->get_ino_and_lblk_bits(sb, &dummy, &lblk_bits);
> > +	dun_bytes = DIV_ROUND_UP(lblk_bits, 8);
> > +
> > +	if (fscrypt_modes[fscrypt_mode_num].ivsize < dun_bytes) {
> > +		fscrypt_warn(NULL, "The fscrypt mode only supports %d DUN bytes, but FS requires support for %d DUN bytes.",
> > +			     fscrypt_modes[fscrypt_mode_num].ivsize, dun_bytes);
> > +		return -EOPNOTSUPP;
> > +	}
> 
> lblk_bits is the number of bits used to represent file logical block numbers
> (e.g. ext4_lblk_t).  That's different from the filesystem-wide block number
> (e.g. ext4_fsblk_t), which is what metadata encryption will use.
> 
> > +	crypto_mode = fscrypt_modes[fscrypt_mode_num].blk_crypto_mode;
> > +
> > +	err = fscrypt_metadata_get_key_from_id(
> > +					FSCRYPT_KEY_DESC_PREFIX,
> > +					key_desc_hex,
> > +					fscrypt_modes[fscrypt_mode_num].keysize,
> > +					raw_key);
> > +	if (err)
> > +		goto out;
> 
> This is allowing for the key to be longer than the provided keysize, in which
> case only a prefix of the key is used.
> 
> It should require the exact keysize instead.
> 
> > +
> > +	sb->s_metadata_key = kzalloc(sizeof(*sb->s_metadata_key), GFP_NOFS);
> 
> No need for GFP_NOFS here.
> 
> > +/**
> > + * fscrypt_free_metadata_encryption() - free metadata encryption fields in
> > + *					super_block.
> > + * @sb: The super_block to free metatdata encryption fields from
> > + */
> > +void fscrypt_free_metadata_encryption(struct super_block *sb)
> > +{
> > +	int num_devices;
> > +	int i;
> > +	struct request_queue *q;
> > +
> > +	if (!sb->s_metadata_key)
> > +		return;
> > +
> > +	num_devices = fscrypt_get_num_devices(sb);
> > +
> > +	for (i = 0; i < num_devices; i++) {
> > +		q = fscrypt_get_device(sb, i);
> > +		if (WARN_ON(!q))
> > +			continue;
> > +		blk_crypto_evict_key(q, sb->s_metadata_key);
> > +	}
> > +
> > +	memzero_explicit(sb->s_metadata_key, sizeof(*sb->s_metadata_key));
> > +	kzfree(sb->s_metadata_key);
> > +	sb->s_metadata_key = NULL;
> > +}
> 
> kfree_sensitive(), not kzfree().
> 
> Also, memzero_explicit() is redundant.
> 
> > +/**
> > + * fscrypt_metadata_crypt_bio() - Add metadata encryption context to bio.
> > + *
> > + * @bio: The bio to add the encryption context to
> > + * @lblk: The logical block number within the filesystem at which this bio
> > + *	  starts reading/writing data.
> 
> Should be:
> 
>    @fsblk: The block number within the filesystem ...
> 
> > + * @sb: The superblock of the filesystem
> > + * @gfp_mask: gfp_mask for bio_crypt_context allocation
> > + */
> > +void fscrypt_metadata_crypt_bio(struct bio *bio, u64 lblk,
> > +				struct super_block *sb, gfp_t gfp_mask)
> > +{
> > +	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE] = { 0 };
> > +
> > +	if (!sb->s_metadata_key)
> > +		return;
> > +
> > +	dun[0] = lblk;
> > +	bio_crypt_set_ctx(bio, sb->s_metadata_key, dun, gfp_mask);
> > +}
> 
> Perhaps fscrypt_set_bio_crypt_ctx() should call this?  It seems there should be
> a single function that filesystems can call that handles setting the
> bio_crypt_ctx for both file contents and metadata encryption.
> 
I mistakenly dismissed this idea when I was coding this up :( - I'll do
this for the next version... I think it'll also make supporting direct I/O
easier in future :) . Also, I might require FS_ENCRYPTION_INLINE_CRYPT
when enabling FS_ENCRYPTION_METADATA to maybe make the code slightly
cleaner (unless there's a reason we want to support metadata encryption
without FS inline encryption being enabled?).
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
