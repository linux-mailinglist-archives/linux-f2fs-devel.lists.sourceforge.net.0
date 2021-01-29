Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B8308E96
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Jan 2021 21:42:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l5aau-0001Xh-2M; Fri, 29 Jan 2021 20:42:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l5aao-0001XP-7X
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 20:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PHY9XC7lyHenFi/K8gu1OlgfgUpqJ6eDDOurnyCP0Bg=; b=J2+Z/J1hqIhAUXi91eaxPdwq/B
 zTldWVuvuYMWKvTIH8Z1aetBWx4FiGgLygLSZ2RKnhKBX1i1rCx0cM5NY4xqfdqIY5jubvx1Kd0So
 wGILyJmFALwkibRTZN4F0je4YtkfMvnlI2n+kwaG7cnG5GtO8r6vZlSP29aun09VqLpI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PHY9XC7lyHenFi/K8gu1OlgfgUpqJ6eDDOurnyCP0Bg=; b=WXL6keNvlWkODAPmQ5mo/eOZYu
 h9Cp7MmSw8FQ2vKywyVsK9JM7l5ITHXEZUfHDAnWO4pOky3yysPQ4IkgiUTZaDvJkjv7IqoEmzlVN
 7ouWSC9R7Y3ip0iPgHergoFnrG12Ig6Zok7UxZ3ZKywFGsXSHaBJ1Puvlv4OcULBgtYE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l5aaa-001uBc-II
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jan 2021 20:42:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CCB64DDE;
 Fri, 29 Jan 2021 20:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611952905;
 bh=feOQxMhLAjV/hZuL27Uxl1PN0T266Dv3A9DoMHUWP3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rFS9Z9HMg0WHnBz9uZywK5zG9AP1fRWftUzeJz7faI9XN9EzTcYqaZwqkksZC7Mo8
 /tinAO6KGKMnUukKFSyA3XVFAxVC2+vzKbT+mlKLS00hovCRsnCcjX0xdxAlxIOiFj
 MV/dW9ccO7UA4P9RDq2PA4FT2rp3TwyTFRzSxGqEBTccLnRdsdocAhCvgpRhWty/6T
 7o0HGuauJ3Snz4SM9AP4OM8W582PfYnuKm9CxFnUNiILQmNPDaw09fFup9NeIdJpn2
 5mrsBpGhXKCJAyIKRTEXP0UNc9SKzO/IV9h7GfphKTBG5WzvijefhbeWd5HHjuRuB2
 CiUSNMs0tO7Zg==
Date: Fri, 29 Jan 2021 12:41:43 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <YBRzB4K/yzZ9qiwT@sol.localdomain>
References: <20201217150435.1505269-1-satyat@google.com>
 <20201217150435.1505269-3-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217150435.1505269-3-satyat@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l5aaa-001uBc-II
Subject: Re: [f2fs-dev] [PATCH v2 2/3] fscrypt: Add metadata encryption
 support
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

On Thu, Dec 17, 2020 at 03:04:34PM +0000, Satya Tangirala wrote:
> Introduces functions that help with metadata encryption.
> 
> In particular, we introduce:
> 
> fscrypt_setup_metadata_encryption() - filesystems should call this function
> to set up metadata encryption on a super block with the encryption
> algorithm (the desired FSCRYPT_MODE_*) and the key identifier of the
> encryption key.fscrypt looks for a logon key with the specified key
> identifier with prefix "fscrypt:". fscrypt will verify that the key
> identifier matches the identifier that is derived using HKDF-512 with the
> logon key as the keying material, no salt, and
> "fscrypt\0|HKDF_CONTEXT_KEY_IDENTIFIER" as the info string.

This describes *what* is done, but not *why*.  The why is that we want to ensure
that wrong keys get rejected early on, before the filesystem is mounted.

Also, what happens if we want to add support for a KDF other than HKDF-SHA512 in
the future?  With the existing fscrypt use of HKDF-SHA512, we can add support
for more KDFs by using one of the reserved fields in fscrypt_policy_v2 and
fscrypt_add_key_arg to indicate the KDF version.  But as proposed, metadata
encryption has no reserved fields in the filesystem superblock (that are
strictly validated).  It might be a good idea to add some reserved fields.

> Filesystems should call fscrypt_set_bio_crypt_ctx() on any bio that needs
> either metadata or file contents encryption. fscrypt will choose the
> appropriate key (based on the inode argument) to use for encrypting the
> bio.

Filesystem metadata doesn't necessarily have an inode associated with it.  How
does that work?

> diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> index 44b67ebd6e40..708164c413cc 100644
> --- a/Documentation/filesystems/fscrypt.rst
> +++ b/Documentation/filesystems/fscrypt.rst
> @@ -27,8 +27,6 @@ at the block device level.  This allows it to encrypt different files
>  with different keys and to have unencrypted files on the same
>  filesystem.  This is useful for multi-user systems where each user's
>  data-at-rest needs to be cryptographically isolated from the others.
> -However, except for filenames, fscrypt does not encrypt filesystem
> -metadata.
>  
>  Unlike eCryptfs, which is a stacked filesystem, fscrypt is integrated
>  directly into supported filesystems --- currently ext4, F2FS, and
> @@ -47,6 +45,15 @@ userspace provides the key, all regular files, directories, and
>  symbolic links created in that directory tree are transparently
>  encrypted.
>  
> +fscrypt also has support for encrypting filesystem metadata, which
> +can be used independently of file contents encryption. For any
> +filesystem block that isn't part of an encrypted file's contents,
> +the filesystem can ask fscrypt to encrypt it with the metadata encryption
> +key set up ahead of time. In general, filesystems should always choose
> +to encrypt a filesystem block with the metadata encryption key, if
> +that block isn't already encrypted with another key (filesystems may
> +choose to leave certain blocks, like the superblock, unencrypted).

We need to be very careful how we describe the metadata encryption feature
because it's not really self-explanatory; people are going to wonder:

- What is meant by "metadata"?
- How does it relate to dm-crypt, and why not just use dm-crypt?
- How does it interact with the existing filenames encryption?
- How does it interact with unencrypted files?

We need to explain it properly so that all these questions are answered.

I recommend adding metadata encryption as a top-level section in the
documentation file (not just in the Introduction and Implementation Details
sections as this patch currently proposes) and adding a proper explanation of it
from a user's perspective.  The Introduction should be kept brief.

> +fscrypt protects the confidentiality of non-filename metadata, e.g.
> +file sizes, file permissions, file timestamps, and extended attribute
> +only when metadata encryption support is enabled for the filesystem,
> +and the filesystem chooses to protect such information with the
> +metadata encryption key. 

Do we actually anticipate that filesystems might support metadata encryption but
not encrypt these types of metadata?  That would be weird, since the purpose of
metadata encryption is basically to ensure that everything gets encrypted.

> +For v2 encryption policies, if the filesystem has a metadata crypt key,
> +the master key is first "mixed" with the metadata crypt key, generating
> +a "mixed-metadata key", which is then used in place of the master key
> +in the process described above. The "mixed-metadata key" is generated
> +by using the metadata crypt key as the input keying material, and
> +a context specific byte and the original master key as the
> +application-specific information string with HKDF-SHA512 (refer to
> +fscrypt_mix_in_metadata_key() for details).

This explains *what* is done, but not *why*.  The why is that we want to enforce
that the traditional fscrypt keys are at least as strong as the metadata
encryption key (if there is one).

> diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
> index a5f5c30368a2..58b79d757608 100644
> --- a/fs/crypto/Kconfig
> +++ b/fs/crypto/Kconfig
> @@ -30,3 +30,15 @@ config FS_ENCRYPTION_INLINE_CRYPT
>  	depends on FS_ENCRYPTION && BLK_INLINE_ENCRYPTION
>  	help
>  	  Enable fscrypt to use inline encryption hardware if available.
> +
> +config FS_ENCRYPTION_METADATA
> +	bool "Enable metadata encryption with fscrypt"
> +	depends on FS_ENCRYPTION_INLINE_CRYPT
> +	help
> +	  Enable fscrypt to encrypt metadata. This allows filesystems
> +	  that support metadata encryption through fscrypt to mount
> +	  and use filesystem images formatted with metadata encryption
> +	  enabled. Such filesystem images generally have all
> +	  otherwise-non-encrypted data (like filesystem metadata,
> +	  and unencrypted files) encrypted with a metadata encryption
> +	  key instead.

This could use some explanation of *why* someone would want to enable this.

Also, "Enable metadata encryption" => "Enable support for metadata encryption".
Otherwise people could think that they are enabling encryption just by setting
this kernel config option.

> diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
> index b048a0e38516..d5c1dc38461b 100644
> --- a/fs/crypto/bio.c
> +++ b/fs/crypto/bio.c
> @@ -59,7 +59,7 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
>  		unsigned int bytes_this_page = blocks_this_page << blockbits;
>  
>  		if (num_pages == 0) {
> -			fscrypt_set_bio_crypt_ctx(bio, inode, lblk, GFP_NOFS);
> +			fscrypt_set_bio_crypt_ctx(bio, 0, inode, lblk, GFP_NOFS);

Why is this passing 0 for first_fsblk instead of the filesystem block number?

>  /**
>   * fscrypt_set_bio_crypt_ctx() - prepare a file contents bio for inline crypto
>   * @bio: a bio which will eventually be submitted to the file
> + * @first_fsblk: the first FS block number in the I/O (only used if bio will be
> + *		 metadata crypted)
>   * @inode: the file's inode
>   * @first_lblk: the first file logical block number in the I/O
>   * @gfp_mask: memory allocation flags - these must be a waiting mask so that
> @@ -234,12 +218,19 @@ static void fscrypt_generate_dun(const struct fscrypt_info *ci, u64 lblk_num,
>   *
>   * The encryption context will be freed automatically when the bio is freed.
>   */
> -void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
> -			       u64 first_lblk, gfp_t gfp_mask)
> +void fscrypt_set_bio_crypt_ctx(struct bio *bio, u64 first_fsblk,
> +			       const struct inode *inode, u64 first_lblk,
> +			       gfp_t gfp_mask)

This is going to be confused with fscrypt_metadata_crypt_bio().  Also, the fact
that this now does "metadata encryption" for file contents is confusing.  It
would be helpful to update the comments to make it very clear what is going on.

Also, does fscrypt_mergeable_bio() need to be updated too?

> +/**
> + * fscrypt_mix_in_metadata_key() - Mix in the metadata crypt key with an fscrypt
> + *				   master key
> + * @sb: The superblock whose metadata_crypt_key to mix in
> + * @secret: The secret that needs to be mixed with the metadata_crypt_key
> + *
> + * Replaces @secret->raw with hkdf(key=metadata_crypt_key,
> + * info=HKDF_CONTEXT_MIX_METADATA_KEY|@secret->raw). As such,
> + * @secret->raw is at least as strong as the metadata_crypt_key.

How about: "This makes @secret->raw at least as strong as the stronger of its
old value and the metadata_crypt_key."

> + *
> + * Returns 0 on success and a negative value on error;
> + */

This should be "Return: 0 on success and a negative value on error", otherwise
it isn't a valid kerneldoc comment.  You can run
'scripts/kernel-doc -v -none FILE' to check the validity of kerneldoc comments.

> +
> +static int fscrypt_metadata_get_key_from_id(
> +				u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],

key_ident should be const.

> +				unsigned int keysize,
> +				u8 raw_key[FSCRYPT_MAX_KEY_SIZE])

Adding a 1-2 sentence description above this function (not necessarily a full
kerneldoc comment) would be helpful to understand what is going on.

> +static int fscrypt_metadata_setup_hkdf(struct super_block *sb,
> +				       u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],

key_ident should be const.

> +				       unsigned int keysize)

Adding a 1-2 sentence description above this function (not necessarily a full
kerneldoc comment) would be helpful to understand what is going on.

> +	sb->s_metadata_hkdf = kzalloc(sizeof(*sb->s_metadata_hkdf), GFP_KERNEL);
> +	if (!sb->s_metadata_hkdf)
> +		goto out_zero_key;

This is missing 'err = -ENOMEM' in the error path.

> +	if (memcmp(key_ident, key_ident_computed, FSCRYPT_KEY_IDENTIFIER_SIZE)) {
> +		err = -EINVAL;
> +		fscrypt_warn(NULL,
> +			     "Metadata encryption key did not have the correct key identifier. Rejecting the key.");
> +		goto err_destroy_hkdf;
> +	}

It might make more sense to log something like "Incorrect metadata encryption
key provided.".  The key identifiers being different is just how we determine
whether the keys are different; it's the latter that is actually important.

> +/**
> + * fscrypt_setup_metadata_encryption() - prepare a super_block for metadata
> + *					 encryption
> + * @sb: The super_block to set up metadata encryption for
> + * @key_ident: The key identifier of a logon key to look for in the process
> + *	       subscribed keyrings.
> + * @fscrypt_mode_num: The FSCRYPT_MODE_* to use as the encryption algorithm.
> + * @fs_blk_bytes: The number of bytes required to represent fs block numbers.
> + *
> + * Return: 0 on success, negative number on error.

Adding 1-2 more sentences of explanation above would be helpful.

> + */
> +int fscrypt_setup_metadata_encryption(struct super_block *sb,
> +				u8 key_ident[FSCRYPT_KEY_IDENTIFIER_SIZE],

key_ident should be const.

> +	err = blk_crypto_init_key(sb->s_metadata_key, derived_metadata_key,
> +				  fscrypt_mode->blk_crypto_mode,
> +				  fs_blk_bytes, sb->s_blocksize);
> +	if (err)
> +		goto err_free_metadata_encryption;
> +
> +	err = blk_crypto_start_using_key(sb->s_metadata_key,
> +					 bdev_get_queue(sb->s_bdev));
> +	if (err)
> +		goto err_free_metadata_encryption;

The calls to blk_crypto_start_using_key() also happen in
fscrypt_metadata_crypt_prepare_all_devices().  So why is this extra one needed?

> +/**
> + * fscrypt_metadata_crypt_prepare_all_devices() - prepare all devices used by
> + *					the filesystem for metadata encryption.

prepare_all_devices => prepare_devices, to shorten this name a bit?

> +/**
> + * fscrypt_free_metadata_encryption() - free metadata encryption fields in
> + *					super_block.
> + * @sb: The super_block to free metatdata encryption fields from

metatdata => metadata

> + */
> +void fscrypt_free_metadata_encryption(struct super_block *sb)
> +{
> +	int num_devices;
> +	int i;
> +	struct request_queue *q;
> +
> +	if (!sb->s_metadata_hkdf)
> +		return;
> +
> +	fscrypt_destroy_hkdf(sb->s_metadata_hkdf);
> +	kfree(sb->s_metadata_hkdf);

It would be good to use kfree_sensitive() here, in the case the implementation
of fscrypt_hkdf changes in the future (though it's not needed currently).

> +	sb->s_metadata_hkdf = NULL;
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
> +	kfree_sensitive(sb->s_metadata_key);
> +	sb->s_metadata_key = NULL;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_free_metadata_encryption);

This is assuming that s_metadata_hkdf and s_metadata_key got allocated in a
particular order.  It would be better to just handle each field one at a time,
like:

void fscrypt_free_metadata_encryption(struct super_block *sb)
{
	int num_devices;
	int i;
	struct request_queue *q;

	if (sb->s_metadata_hkdf) {
		fscrypt_destroy_hkdf(sb->s_metadata_hkdf);
		kfree_sensitive(sb->s_metadata_hkdf);
		sb->s_metadata_hkdf = NULL;
	}

	if (sb->s_metadata_key) {
		num_devices = fscrypt_get_num_devices(sb);

		for (i = 0; i < num_devices; i++) {
			q = fscrypt_get_device(sb, i);
			if (WARN_ON(!q))
				continue;
			blk_crypto_evict_key(q, sb->s_metadata_key);
		}
		kfree_sensitive(sb->s_metadata_key);
		sb->s_metadata_key = NULL;
	}
}

> +
> +/**
> + * fscrypt_metadata_crypt_bio() - Add metadata encryption context to bio.
> + *
> + * @bio: The bio to add the encryption context to
> + * @fsblk: The block number within the filesystem at which this bio starts
> + *	   reading/writing data.
> + * @sb: The superblock of the filesystem
> + * @gfp_mask: gfp_mask for bio_crypt_context allocation
> + */

It would be helpful to add an explanation of how this differs from
fscrypt_set_bio_crypt_ctx(), and how filesystems should decide which one to
call.  Also maybe one or both of them needs a better name?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
