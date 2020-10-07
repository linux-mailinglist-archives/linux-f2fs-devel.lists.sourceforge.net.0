Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B4286965
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Oct 2020 22:52:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQGQa-0007xu-VQ; Wed, 07 Oct 2020 20:52:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQGQZ-0007xn-Ea
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 20:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mFyZdd9E0mXmO6CxaiB4TgH3NG8hxbAUFoniGUGvLdQ=; b=BVTJgaSFuebDIdWS3rPjXcJ3hJ
 I9gSPNfXJnM2r6nes4gTTJ/dzNnkJMYoB28Ct+E7x2PXwc5hVy2ENORi5hwwMip8fksvzURuYmgGm
 VQ3uQF714MDKTRYsWEt6F4QKuGqpj9MLcna8hKlis1EyuAjd1KABE6exQkDpFmfh6BT4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFyZdd9E0mXmO6CxaiB4TgH3NG8hxbAUFoniGUGvLdQ=; b=jstgC8cUT4PVBLyMxdN9v+2BoM
 9ihLlHShA8SJ8ylW6aG40AIaC+bwYqsBBc73ht/toumZcodzikzLc9H3M6G+qOcuiksdDpHSWl1Mg
 ew1UjA3DUn/IaTIM10FWVPBTVcjMLKsJHwXpeAk0Na+Kj2/ST8CmURzMyvxg3OgsOi64=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQGQS-002Shq-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Oct 2020 20:52:47 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACAD92083B;
 Wed,  7 Oct 2020 20:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602103943;
 bh=VufgeyZMr7Y0Kns1vtQDfROiMEQ0QhTW56WCGxEQqpU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ESyIq4FFaT8J3wqUHZHHJCs9U924JFwIsExeqJbr/CFte4AxXjMR72emHGiLRiKn0
 4G5wbBVTq6wX1DBv6sDyGcZINuY0TG3dBpBfdXOH+vbDd5JOt0hpnrMV35zDmCu+iv
 OfTNjJo5ZC/yMcc0bRVgtkbuCAsSGWOylnlBpyS4=
Date: Wed, 7 Oct 2020 13:52:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201007205221.GA1530638@gmail.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <20201005073606.1949772-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005073606.1949772-3-satyat@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQGQS-002Shq-Eh
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 05, 2020 at 07:36:05AM +0000, Satya Tangirala wrote:
> Introduces functions that help with metadata encryption.
> 
> In particular, we introduce:
> 
> fscrypt_setup_metadata_encryption() - filesystems should call this function
> to set up metadata encryption on a super block with the encryption
> algorithm (the desired FSCRYPT_MODE_*) and the key descriptor of the
> encryption key. The key descriptor is looked up in the logon keyring of the
> current session using "fscrypt:" as the descriptor prefix.
> 
> fscrypt_metadata_crypt_bio() - filesystems should call this function on a
> bio that it wants metadata crypted. This function will set a bio-crypt-ctx
> on the bio if the metadata key was set up with
> fscrypt_setup_metadata_encryption(). The DUN for the first block in the bio
> is the offset of that block from the start of the filesystem.
> 
> fscrypt_free_metadata_encryption() - this function should be called when
> the super block is being freed. It ensures that the metadata encryption key
> is evicted, if necessary, from devices.
> 
> Note that the filesystem (rather than fscrypt) controls precisely which
> blocks are encrypted with the metadata encryption key and which blocks are
> encrypted with other keys/not encrypted at all. Fscrypt only provides some
> convenience functions that ultimately help encrypt a bio with the metadata
> encryption key when desired.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  fs/crypto/Kconfig           |   6 +
>  fs/crypto/Makefile          |   1 +
>  fs/crypto/fscrypt_private.h |  19 ++++
>  fs/crypto/inline_crypt.c    |  18 ---
>  fs/crypto/metadata_crypt.c  | 220 ++++++++++++++++++++++++++++++++++++
>  include/linux/fs.h          |   3 +
>  include/linux/fscrypt.h     |  47 ++++++++
>  7 files changed, 296 insertions(+), 18 deletions(-)
>  create mode 100644 fs/crypto/metadata_crypt.c
> 
> diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
> index a5f5c30368a2..3010e91f6659 100644
> --- a/fs/crypto/Kconfig
> +++ b/fs/crypto/Kconfig
> @@ -30,3 +30,9 @@ config FS_ENCRYPTION_INLINE_CRYPT
>  	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
>  	help
>  	  Enable fscrypt to use inline encryption hardware if available.
> +
> +config FS_ENCRYPTION_METADATA
> +	bool "Enable metadata encryption with fscrypt"
> +	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
> +	help
> +	  Enable fscrypt to encrypt metadata.

This needs Kconfig help text to describe what this feature is and why anyone
would want to enable it.  It also needs an update to
Documentation/filesystems/fscrypt.rst, and a test in xfstests that tests that
the encryption is being done correctly.

> diff --git a/fs/crypto/metadata_crypt.c b/fs/crypto/metadata_crypt.c
> new file mode 100644
> index 000000000000..5e16df130509
> --- /dev/null
> +++ b/fs/crypto/metadata_crypt.c
> @@ -0,0 +1,220 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Metadata encryption support for fscrypt
> + *
> + * Copyright 2020 Google LLC
> + */
> +
> +#include <keys/user-type.h>
> +#include <linux/blk-crypto.h>
> +#include <linux/blkdev.h>
> +#include <linux/buffer_head.h>
> +#include <linux/sched/mm.h>
> +
> +#include "fscrypt_private.h"
> +
> +/* TODO: mostly copied from keysetup_v1.c - maybe refactor this function */
> +static int fscrypt_metadata_get_key_from_id(const char *prefix,
> +					    char *descriptor_hex,
> +					    unsigned int min_keysize,
> +					    char *raw_key)
> +{
> +	char *description;
> +	struct key *key;
> +	const struct user_key_payload *ukp;
> +	const struct fscrypt_key *payload;
> +	int err = -ENOKEY;
> +
> +	if (strlen(descriptor_hex) != FSCRYPT_KEY_DESCRIPTOR_SIZE * 2)
> +		return -EINVAL;
> +
> +	description = kasprintf(GFP_NOFS, "%s%s", prefix, descriptor_hex);
> +	if (!description)
> +		return -ENOMEM;
> +
> +	key = request_key(&key_type_logon, description, NULL);
> +	kfree(description);
> +	if (IS_ERR(key))
> +		return PTR_ERR(key);
> +
> +	down_read(&key->sem);
> +	ukp = user_key_payload_locked(key);
> +
> +	if (!ukp) /* was the key revoked before we acquired its semaphore? */
> +		goto out;
> +
> +	payload = (const struct fscrypt_key *)ukp->data;

'struct fscrypt_key' was a mistake.  How about having the key payload just be
the raw key?

Or are you thinking that reserved fields will be needed?

> +/**
> + * fscrypt_setup_metadata_encryption() - prepare a super_block for metadata
> + *					 encryption
> + * @sb: The super_block to set up metadata encryption for
> + * @key_desc_hex: The key descriptor (in hex) to look for in the logon keyring.

There's no such thing as a "logon keyring".  I think you mean "look for a logon
key in the process-subscribed keyrings".

> + * @fscrypt_mode_num: The FSCRYPT_MODE_* to use as the encryption algorithm.
> + *
> + * Return: 0 on success, negative number on error.
> + */
> +int fscrypt_setup_metadata_encryption(struct super_block *sb,
> +				      char *key_desc_hex,
> +				      int fscrypt_mode_num)
> +{
> +	int err = 0;
> +	enum blk_crypto_mode_num crypto_mode;
> +	unsigned int lblk_bits = 64;
> +	unsigned int dun_bytes;
> +	unsigned int dummy;
> +	char raw_key[FSCRYPT_MAX_KEY_SIZE];

For binary data, prefer 'u8' to 'char'.

> +
> +	if (fscrypt_mode_num > __FSCRYPT_MODE_MAX || fscrypt_mode_num < 0 ||
> +	    !fscrypt_modes[fscrypt_mode_num].cipher_str) {
> +		fscrypt_warn(NULL, "Invalid fscrypt mode %d specified for metadata encryption.",
> +			     fscrypt_mode_num);
> +		return -EOPNOTSUPP;
> +	}

The filenames-only encryption modes (FSCRYPT_MODE_AES_256_CTS and
FSCRYPT_MODE_AES_128_CTS) will pass this check, which seems undesired.

> +
> +	if (sb->s_cop->get_ino_and_lblk_bits)
> +		sb->s_cop->get_ino_and_lblk_bits(sb, &dummy, &lblk_bits);
> +	dun_bytes = DIV_ROUND_UP(lblk_bits, 8);
> +
> +	if (fscrypt_modes[fscrypt_mode_num].ivsize < dun_bytes) {
> +		fscrypt_warn(NULL, "The fscrypt mode only supports %d DUN bytes, but FS requires support for %d DUN bytes.",
> +			     fscrypt_modes[fscrypt_mode_num].ivsize, dun_bytes);
> +		return -EOPNOTSUPP;
> +	}

lblk_bits is the number of bits used to represent file logical block numbers
(e.g. ext4_lblk_t).  That's different from the filesystem-wide block number
(e.g. ext4_fsblk_t), which is what metadata encryption will use.

> +	crypto_mode = fscrypt_modes[fscrypt_mode_num].blk_crypto_mode;
> +
> +	err = fscrypt_metadata_get_key_from_id(
> +					FSCRYPT_KEY_DESC_PREFIX,
> +					key_desc_hex,
> +					fscrypt_modes[fscrypt_mode_num].keysize,
> +					raw_key);
> +	if (err)
> +		goto out;

This is allowing for the key to be longer than the provided keysize, in which
case only a prefix of the key is used.

It should require the exact keysize instead.

> +
> +	sb->s_metadata_key = kzalloc(sizeof(*sb->s_metadata_key), GFP_NOFS);

No need for GFP_NOFS here.

> +/**
> + * fscrypt_free_metadata_encryption() - free metadata encryption fields in
> + *					super_block.
> + * @sb: The super_block to free metatdata encryption fields from
> + */
> +void fscrypt_free_metadata_encryption(struct super_block *sb)
> +{
> +	int num_devices;
> +	int i;
> +	struct request_queue *q;
> +
> +	if (!sb->s_metadata_key)
> +		return;
> +
> +	num_devices = fscrypt_get_num_devices(sb);
> +
> +	for (i = 0; i < num_devices; i++) {
> +		q = fscrypt_get_device(sb, i);
> +		if (WARN_ON(!q))
> +			continue;
> +		blk_crypto_evict_key(q, sb->s_metadata_key);
> +	}
> +
> +	memzero_explicit(sb->s_metadata_key, sizeof(*sb->s_metadata_key));
> +	kzfree(sb->s_metadata_key);
> +	sb->s_metadata_key = NULL;
> +}

kfree_sensitive(), not kzfree().

Also, memzero_explicit() is redundant.

> +/**
> + * fscrypt_metadata_crypt_bio() - Add metadata encryption context to bio.
> + *
> + * @bio: The bio to add the encryption context to
> + * @lblk: The logical block number within the filesystem at which this bio
> + *	  starts reading/writing data.

Should be:

   @fsblk: The block number within the filesystem ...

> + * @sb: The superblock of the filesystem
> + * @gfp_mask: gfp_mask for bio_crypt_context allocation
> + */
> +void fscrypt_metadata_crypt_bio(struct bio *bio, u64 lblk,
> +				struct super_block *sb, gfp_t gfp_mask)
> +{
> +	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE] = { 0 };
> +
> +	if (!sb->s_metadata_key)
> +		return;
> +
> +	dun[0] = lblk;
> +	bio_crypt_set_ctx(bio, sb->s_metadata_key, dun, gfp_mask);
> +}

Perhaps fscrypt_set_bio_crypt_ctx() should call this?  It seems there should be
a single function that filesystems can call that handles setting the
bio_crypt_ctx for both file contents and metadata encryption.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
