Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606C1D0546
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2020 05:12:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYhoU-00081x-1L; Wed, 13 May 2020 03:12:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jYhoT-00081m-2F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 03:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PU4PMuwK3JFO5xVL6WbcbIv2f5C9yhTTAySbJ+L6XtA=; b=Q5jx19INtiAeIzbvGf79WZhtYi
 l/eRIzhX7SYKv0jZx7sRmbK6ZykKTJxsQAfimAEgmzrIO5kbyV3zI7icvVBWMRV2uH50QgBoQs6Tt
 aEvwzhfMm64M3rGA2Dmrlu5ITcCWizXjS6LhWOSsU6pVKt9Ja92pal1h+WxvZAxgZYWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PU4PMuwK3JFO5xVL6WbcbIv2f5C9yhTTAySbJ+L6XtA=; b=fYmirtXLYiqKa5xfImc2dKMU+Q
 NHkq1rJr7xbyrMGFnAQ7zpAEx7zONkUdIpk9Ggb9CStieV2An/LDAcY5lxemOU4vYwsWopKEApfkC
 OyiTHRmIjUPKNr3ijCXgdXaXgQVlu7w+L5hkRMS7J03yen6nA6wvHo9C0IAayC1qRXa0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYhoM-007Am7-TD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 May 2020 03:12:05 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E2492312B;
 Wed, 13 May 2020 03:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589339508;
 bh=CgtQM26zQsNkkrKdi9HpGLwXrn05EP7h4nbZ+DCcoVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iWxHUXvXJcv900iopJpVhXAu8TGOoEMjKD7jrUQ5HC5c3Z2QQBDwsGQrvqDDaHUck
 qGpeHsopWy+2N5msvhl/vxYyInMQq15Zf594eSSTp1+LgJPw09Qzq2mxCc2SCTQPJR
 C4M6BULRUvoflPH0ZwrE9YdsBLTmamjq9p/xswI4=
Date: Tue, 12 May 2020 20:11:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200513031147.GC108075@google.com>
References: <20200512233251.118314-1-ebiggers@kernel.org>
 <20200512233251.118314-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512233251.118314-4-ebiggers@kernel.org>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYhoM-007Am7-TD
Subject: Re: [f2fs-dev] [PATCH 3/4] fscrypt: support test_dummy_encryption=v2
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/12, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> v1 encryption policies are deprecated in favor of v2, and some new
> features (e.g. encryption+casefolding) are only being added for v2.
> 
> Therefore, the "test_dummy_encryption" mount option (which is used for
> encryption I/O testing with xfstests) needs to support v2 policies.
> 
> To do this, extend its syntax to be "test_dummy_encryption=v1" or
> "test_dummy_encryption=v2".  The existing "test_dummy_encryption" (no
> argument) also continues to be accepted, to specify the default setting
> -- currently v1, but the next patch changes it to v2.
> 
> To cleanly support both v1 and v2 while also making it easy to support
> specifying other encryption settings in the future (say, accepting
> "$contents_mode:$filenames_mode:v2"), make ext4 and f2fs maintain a
> pointer to the dummy fscrypt_context rather than using mount flags.
> 
> To avoid concurrency issues, don't allow test_dummy_encryption to be set
> or changed during a remount.  (The former restriction is new, but
> xfstests doesn't run into it, so no one should notice.)
> 
> Tested with 'gce-xfstests -c {ext4,f2fs}/encrypt -g auto'.  On ext4,
> there are two regressions, both of which are test bugs: ext4/023 and
> ext4/028 fail because they set an xattr and expect it to be stored
> inline, but the increase in size of the fscrypt_context from
> 24 to 40 bytes causes this xattr to be spilled into an external block.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  Documentation/filesystems/f2fs.rst |   6 +-
>  fs/crypto/keysetup.c               |  15 ++--
>  fs/crypto/policy.c                 | 125 +++++++++++++++++++++++++++++
>  fs/ext4/ext4.h                     |   7 +-
>  fs/ext4/super.c                    |  68 ++++++++++++----
>  fs/f2fs/f2fs.h                     |   4 +-
>  fs/f2fs/super.c                    |  85 ++++++++++++++------
>  include/linux/fscrypt.h            |  52 ++++++++++--
>  8 files changed, 302 insertions(+), 60 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 87d794bc75a479..4218ac65862934 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -225,8 +225,12 @@ fsync_mode=%s          Control the policy of fsync. Currently supports "posix",
>                         pass, but the performance will regress. "nobarrier" is
>                         based on "posix", but doesn't issue flush command for
>                         non-atomic files likewise "nobarrier" mount option.
> -test_dummy_encryption  Enable dummy encryption, which provides a fake fscrypt
> +test_dummy_encryption
> +test_dummy_encryption=%s
> +                       Enable dummy encryption, which provides a fake fscrypt
>                         context. The fake fscrypt context is used by xfstests.
> +                       The argument may be either "v1" or "v2", in order to
> +                       select the corresponding fscrypt policy version.
>  checkpoint=%s[:%u[%]]  Set to "disable" to turn off checkpointing. Set to "enable"
>                         to reenable checkpointing. Is enabled by default. While
>                         disabled, any unmounting or unexpected shutdowns will cause
> diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
> index 302375e9f719eb..cbfb3c7c4a13a6 100644
> --- a/fs/crypto/keysetup.c
> +++ b/fs/crypto/keysetup.c
> @@ -395,21 +395,18 @@ int fscrypt_get_encryption_info(struct inode *inode)
>  
>  	res = inode->i_sb->s_cop->get_context(inode, &ctx, sizeof(ctx));
>  	if (res < 0) {
> -		if (!fscrypt_dummy_context_enabled(inode) ||
> -		    IS_ENCRYPTED(inode)) {
> +		const union fscrypt_context *dummy_ctx =
> +			fscrypt_get_dummy_context(inode->i_sb);
> +
> +		if (IS_ENCRYPTED(inode) || !dummy_ctx) {
>  			fscrypt_warn(inode,
>  				     "Error %d getting encryption context",
>  				     res);
>  			return res;
>  		}
>  		/* Fake up a context for an unencrypted directory */
> -		memset(&ctx, 0, sizeof(ctx));
> -		ctx.version = FSCRYPT_CONTEXT_V1;
> -		ctx.v1.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
> -		ctx.v1.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
> -		memset(ctx.v1.master_key_descriptor, 0x42,
> -		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
> -		res = sizeof(ctx.v1);
> +		res = fscrypt_context_size(dummy_ctx);
> +		memcpy(&ctx, dummy_ctx, res);
>  	}
>  
>  	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_NOFS);
> diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
> index 10ccf945020ce5..ca0ee337c9627f 100644
> --- a/fs/crypto/policy.c
> +++ b/fs/crypto/policy.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include <linux/random.h>
> +#include <linux/seq_file.h>
>  #include <linux/string.h>
>  #include <linux/mount.h>
>  #include "fscrypt_private.h"
> @@ -605,3 +606,127 @@ int fscrypt_inherit_context(struct inode *parent, struct inode *child,
>  	return preload ? fscrypt_get_encryption_info(child): 0;
>  }
>  EXPORT_SYMBOL(fscrypt_inherit_context);
> +
> +/**
> + * fscrypt_set_test_dummy_encryption() - handle '-o test_dummy_encryption'
> + * @sb: the filesystem on which test_dummy_encryption is being specified
> + * @arg: the argument to the test_dummy_encryption option.
> + *	 If no argument was specified, then @arg->from == NULL.
> + * @dummy_ctx: the filesystem's current dummy context (input/output, see below)
> + *
> + * Handle the test_dummy_encryption mount option by creating a dummy encryption
> + * context, saving it in @dummy_ctx, and adding the corresponding dummy
> + * encryption key to the filesystem.  If the @dummy_ctx is already set, then
> + * instead validate that it matches @arg.  Don't support changing it via
> + * remount, as that is difficult to do safely.
> + *
> + * The reason we use an fscrypt_context rather than an fscrypt_policy is because
> + * we mustn't generate a new nonce each time we access a dummy-encrypted
> + * directory, as that would change the way filenames are encrypted.
> + *
> + * Return: 0 on success (dummy context set, or the same context is already set);
> + *         -EEXIST if a different dummy context is already set;
> + *         or another -errno value.
> + */
> +int fscrypt_set_test_dummy_encryption(struct super_block *sb,
> +				      const substring_t *arg,
> +				      struct fscrypt_dummy_context *dummy_ctx)
> +{
> +	const char *argstr = "v1";
> +	const char *argstr_to_free = NULL;
> +	struct fscrypt_key_specifier key_spec = { 0 };
> +	int version;
> +	union fscrypt_context *ctx = NULL;
> +	int err;
> +
> +	if (arg->from) {
> +		argstr = argstr_to_free = match_strdup(arg);
> +		if (!argstr)
> +			return -ENOMEM;
> +	}
> +
> +	if (!strcmp(argstr, "v1")) {
> +		version = FSCRYPT_CONTEXT_V1;
> +		key_spec.type = FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR;
> +		memset(key_spec.u.descriptor, 0x42,
> +		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
> +	} else if (!strcmp(argstr, "v2")) {
> +		version = FSCRYPT_CONTEXT_V2;
> +		key_spec.type = FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER;
> +		/* key_spec.u.identifier gets filled in when adding the key */
> +	} else {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (dummy_ctx->ctx) {
> +		/*
> +		 * Note: if we ever make test_dummy_encryption support
> +		 * specifying other encryption settings, such as the encryption
> +		 * modes, we'll need to compare those settings here.
> +		 */
> +		if (dummy_ctx->ctx->version == version)
> +			err = 0;
> +		else
> +			err = -EEXIST;
> +		goto out;
> +	}
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
> +
> +	err = fscrypt_add_test_dummy_key(sb, &key_spec);
> +	if (err)
> +		goto out;
> +
> +	ctx->version = version;
> +	switch (ctx->version) {
> +	case FSCRYPT_CONTEXT_V1:
> +		ctx->v1.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
> +		ctx->v1.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
> +		memcpy(ctx->v1.master_key_descriptor, key_spec.u.descriptor,
> +		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
> +		break;
> +	case FSCRYPT_CONTEXT_V2:
> +		ctx->v2.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
> +		ctx->v2.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
> +		memcpy(ctx->v2.master_key_identifier, key_spec.u.identifier,
> +		       FSCRYPT_KEY_IDENTIFIER_SIZE);
> +		break;
> +	default:
> +		WARN_ON(1);
> +		err = -EINVAL;
> +		goto out;
> +	}
> +	dummy_ctx->ctx = ctx;
> +	ctx = NULL;
> +	err = 0;
> +out:
> +	kfree(ctx);
> +	kfree(argstr_to_free);
> +	return err;
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_set_test_dummy_encryption);
> +
> +/**
> + * fscrypt_show_test_dummy_encryption() - show '-o test_dummy_encryption'
> + * @seq: the seq_file to print the option to
> + * @sep: the separator character to use
> + * @sb: the filesystem whose options are being shown
> + *
> + * Show the test_dummy_encryption mount option, if it was specified.
> + * This is mainly used for /proc/mounts.
> + */
> +void fscrypt_show_test_dummy_encryption(struct seq_file *seq, char sep,
> +					struct super_block *sb)
> +{
> +	const union fscrypt_context *ctx = fscrypt_get_dummy_context(sb);
> +
> +	if (!ctx)
> +		return;
> +	seq_printf(seq, "%ctest_dummy_encryption=v%d", sep, ctx->version);
> +}
> +EXPORT_SYMBOL_GPL(fscrypt_show_test_dummy_encryption);
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 91eb4381cae5b7..546504cba84211 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -1357,11 +1357,9 @@ struct ext4_super_block {
>   */
>  #define EXT4_MF_MNTDIR_SAMPLED		0x0001
>  #define EXT4_MF_FS_ABORTED		0x0002	/* Fatal error detected */
> -#define EXT4_MF_TEST_DUMMY_ENCRYPTION	0x0004
>  
>  #ifdef CONFIG_FS_ENCRYPTION
> -#define DUMMY_ENCRYPTION_ENABLED(sbi) (unlikely((sbi)->s_mount_flags & \
> -						EXT4_MF_TEST_DUMMY_ENCRYPTION))
> +#define DUMMY_ENCRYPTION_ENABLED(sbi) ((sbi)->s_dummy_enc_ctx.ctx != NULL)
>  #else
>  #define DUMMY_ENCRYPTION_ENABLED(sbi) (0)
>  #endif
> @@ -1551,6 +1549,9 @@ struct ext4_sb_info {
>  	struct ratelimit_state s_warning_ratelimit_state;
>  	struct ratelimit_state s_msg_ratelimit_state;
>  
> +	/* Encryption context for '-o test_dummy_encryption' */
> +	struct fscrypt_dummy_context s_dummy_enc_ctx;
> +
>  	/*
>  	 * Barrier between writepages ops and changing any inode's JOURNAL_DATA
>  	 * or EXTENTS flag.
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index bf5fcb477f6672..4a3d21972011bb 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1106,6 +1106,7 @@ static void ext4_put_super(struct super_block *sb)
>  		crypto_free_shash(sbi->s_chksum_driver);
>  	kfree(sbi->s_blockgroup_lock);
>  	fs_put_dax(sbi->s_daxdev);
> +	fscrypt_free_dummy_context(&sbi->s_dummy_enc_ctx);
>  #ifdef CONFIG_UNICODE
>  	utf8_unload(sbi->s_encoding);
>  #endif
> @@ -1389,9 +1390,10 @@ static int ext4_set_context(struct inode *inode, const void *ctx, size_t len,
>  	return res;
>  }
>  
> -static bool ext4_dummy_context(struct inode *inode)
> +static const union fscrypt_context *
> +ext4_get_dummy_context(struct super_block *sb)
>  {
> -	return DUMMY_ENCRYPTION_ENABLED(EXT4_SB(inode->i_sb));
> +	return EXT4_SB(sb)->s_dummy_enc_ctx.ctx;
>  }
>  
>  static bool ext4_has_stable_inodes(struct super_block *sb)
> @@ -1410,7 +1412,7 @@ static const struct fscrypt_operations ext4_cryptops = {
>  	.key_prefix		= "ext4:",
>  	.get_context		= ext4_get_context,
>  	.set_context		= ext4_set_context,
> -	.dummy_context		= ext4_dummy_context,
> +	.get_dummy_context	= ext4_get_dummy_context,
>  	.empty_dir		= ext4_empty_dir,
>  	.max_namelen		= EXT4_NAME_LEN,
>  	.has_stable_inodes	= ext4_has_stable_inodes,
> @@ -1605,6 +1607,7 @@ static const match_table_t tokens = {
>  	{Opt_init_itable, "init_itable"},
>  	{Opt_noinit_itable, "noinit_itable"},
>  	{Opt_max_dir_size_kb, "max_dir_size_kb=%u"},
> +	{Opt_test_dummy_encryption, "test_dummy_encryption=%s"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
>  	{Opt_nombcache, "nombcache"},
>  	{Opt_nombcache, "no_mbcache"},	/* for backward compatibility */
> @@ -1816,7 +1819,7 @@ static const struct mount_opts {
>  	{Opt_jqfmt_vfsv0, QFMT_VFS_V0, MOPT_QFMT},
>  	{Opt_jqfmt_vfsv1, QFMT_VFS_V1, MOPT_QFMT},
>  	{Opt_max_dir_size_kb, 0, MOPT_GTE0},
> -	{Opt_test_dummy_encryption, 0, MOPT_GTE0},
> +	{Opt_test_dummy_encryption, 0, MOPT_STRING},
>  	{Opt_nombcache, EXT4_MOUNT_NO_MBCACHE, MOPT_SET},
>  	{Opt_err, 0, 0}
>  };
> @@ -1851,6 +1854,48 @@ static int ext4_sb_read_encoding(const struct ext4_super_block *es,
>  }
>  #endif
>  
> +static int ext4_set_test_dummy_encryption(struct super_block *sb,
> +					  const char *opt,
> +					  const substring_t *arg,
> +					  bool is_remount)
> +{
> +#ifdef CONFIG_FS_ENCRYPTION
> +	struct ext4_sb_info *sbi = EXT4_SB(sb);
> +	int err;
> +
> +	/*
> +	 * This mount option is just for testing, and it's not worthwhile to
> +	 * implement the extra complexity (e.g. RCU protection) that would be
> +	 * needed to allow it to be set or changed during remount.  We do allow
> +	 * it to be specified during remount, but only if there is no change.
> +	 */
> +	if (is_remount && !sbi->s_dummy_enc_ctx.ctx) {
> +		ext4_msg(sb, KERN_WARNING,
> +			 "Can't set test_dummy_encryption on remount");
> +		return -1;
> +	}
> +	err = fscrypt_set_test_dummy_encryption(sb, arg, &sbi->s_dummy_enc_ctx);
> +	if (err) {
> +		if (err == -EEXIST)
> +			ext4_msg(sb, KERN_WARNING,
> +				 "Can't change test_dummy_encryption on remount");
> +		else if (err == -EINVAL)
> +			ext4_msg(sb, KERN_WARNING,
> +				 "Value of option \"%s\" is unrecognized", opt);
> +		else
> +			ext4_msg(sb, KERN_WARNING,
> +				 "Error processing option \"%s\" [%d]",
> +				 opt, err);
> +		return -1;
> +	}
> +	ext4_msg(sb, KERN_WARNING, "Test dummy encryption mode enabled");
> +#else
> +	ext4_msg(sb, KERN_WARNING,
> +		 "Test dummy encryption mount option ignored");
> +#endif
> +	return 1;
> +}
> +
>  static int handle_mount_opt(struct super_block *sb, char *opt, int token,
>  			    substring_t *args, unsigned long *journal_devnum,
>  			    unsigned int *journal_ioprio, int is_remount)
> @@ -2047,14 +2092,8 @@ static int handle_mount_opt(struct super_block *sb, char *opt, int token,
>  		*journal_ioprio =
>  			IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, arg);
>  	} else if (token == Opt_test_dummy_encryption) {
> -#ifdef CONFIG_FS_ENCRYPTION
> -		sbi->s_mount_flags |= EXT4_MF_TEST_DUMMY_ENCRYPTION;
> -		ext4_msg(sb, KERN_WARNING,
> -			 "Test dummy encryption mode enabled");
> -#else
> -		ext4_msg(sb, KERN_WARNING,
> -			 "Test dummy encryption mount option ignored");
> -#endif
> +		return ext4_set_test_dummy_encryption(sb, opt, &args[0],
> +						      is_remount);
>  	} else if (m->flags & MOPT_DATAJ) {
>  		if (is_remount) {
>  			if (!sbi->s_journal)
> @@ -2311,8 +2350,8 @@ static int _ext4_show_options(struct seq_file *seq, struct super_block *sb,
>  		SEQ_OPTS_PRINT("max_dir_size_kb=%u", sbi->s_max_dir_size_kb);
>  	if (test_opt(sb, DATA_ERR_ABORT))
>  		SEQ_OPTS_PUTS("data_err=abort");
> -	if (DUMMY_ENCRYPTION_ENABLED(sbi))
> -		SEQ_OPTS_PUTS("test_dummy_encryption");
> +
> +	fscrypt_show_test_dummy_encryption(seq, sep, sb);
>  
>  	ext4_show_quota_options(seq, sb);
>  	return 0;
> @@ -4780,6 +4819,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>  	for (i = 0; i < EXT4_MAXQUOTAS; i++)
>  		kfree(get_qf_name(sb, sbi, i));
>  #endif
> +	fscrypt_free_dummy_context(&sbi->s_dummy_enc_ctx);
>  	ext4_blkdev_remove(sbi);
>  	brelse(bh);
>  out_fail:
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ba470d5687fe04..157eec34897046 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -138,7 +138,7 @@ struct f2fs_mount_info {
>  	int fsync_mode;			/* fsync policy */
>  	int fs_mode;			/* fs mode: LFS or ADAPTIVE */
>  	int bggc_mode;			/* bggc mode: off, on or sync */
> -	bool test_dummy_encryption;	/* test dummy encryption */
> +	struct fscrypt_dummy_context dummy_enc_ctx; /* test dummy encryption */
>  	block_t unusable_cap;		/* Amount of space allowed to be
>  					 * unusable when disabling checkpoint
>  					 */
> @@ -1259,7 +1259,7 @@ enum fsync_mode {
>  
>  #ifdef CONFIG_FS_ENCRYPTION
>  #define DUMMY_ENCRYPTION_ENABLED(sbi) \
> -			(unlikely(F2FS_OPTION(sbi).test_dummy_encryption))
> +	(unlikely(F2FS_OPTION(sbi).dummy_enc_ctx.ctx != NULL))
>  #else
>  #define DUMMY_ENCRYPTION_ENABLED(sbi) (0)
>  #endif
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index f2dfc21c6abb0a..8a9955902d849c 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -202,6 +202,7 @@ static match_table_t f2fs_tokens = {
>  	{Opt_whint, "whint_mode=%s"},
>  	{Opt_alloc, "alloc_mode=%s"},
>  	{Opt_fsync, "fsync_mode=%s"},
> +	{Opt_test_dummy_encryption, "test_dummy_encryption=%s"},
>  	{Opt_test_dummy_encryption, "test_dummy_encryption"},
>  	{Opt_checkpoint_disable, "checkpoint=disable"},
>  	{Opt_checkpoint_disable_cap, "checkpoint=disable:%u"},
> @@ -394,7 +395,52 @@ static int f2fs_check_quota_options(struct f2fs_sb_info *sbi)
>  }
>  #endif
>  
> -static int parse_options(struct super_block *sb, char *options)
> +static int f2fs_set_test_dummy_encryption(struct super_block *sb,
> +					  const char *opt,
> +					  const substring_t *arg,
> +					  bool is_remount)
> +{
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +#ifdef CONFIG_FS_ENCRYPTION
> +	int err;
> +
> +	if (!f2fs_sb_has_encrypt(sbi)) {
> +		f2fs_err(sbi, "Encrypt feature is off");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * This mount option is just for testing, and it's not worthwhile to
> +	 * implement the extra complexity (e.g. RCU protection) that would be
> +	 * needed to allow it to be set or changed during remount.  We do allow
> +	 * it to be specified during remount, but only if there is no change.
> +	 */
> +	if (is_remount && !F2FS_OPTION(sbi).dummy_enc_ctx.ctx) {
> +		f2fs_warn(sbi, "Can't set test_dummy_encryption on remount");
> +		return -EINVAL;
> +	}
> +	err = fscrypt_set_test_dummy_encryption(
> +		sb, arg, &F2FS_OPTION(sbi).dummy_enc_ctx);
> +	if (err) {
> +		if (err == -EEXIST)
> +			f2fs_warn(sbi,
> +				  "Can't change test_dummy_encryption on remount");
> +		else if (err == -EINVAL)
> +			f2fs_warn(sbi, "Value of option \"%s\" is unrecognized",
> +				  opt);
> +		else
> +			f2fs_warn(sbi, "Error processing option \"%s\" [%d]",
> +				  opt, err);
> +		return -EINVAL;
> +	}
> +	f2fs_warn(sbi, "Test dummy encryption mode enabled");
> +#else
> +	f2fs_warn(sbi, "Test dummy encryption mount option ignored");
> +#endif
> +	return 0;
> +}
> +
> +static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>  	substring_t args[MAX_OPT_ARGS];
> @@ -403,9 +449,7 @@ static int parse_options(struct super_block *sb, char *options)
>  	int arg = 0, ext_cnt;
>  	kuid_t uid;
>  	kgid_t gid;
> -#ifdef CONFIG_QUOTA
>  	int ret;
> -#endif
>  
>  	if (!options)
>  		return 0;
> @@ -778,17 +822,10 @@ static int parse_options(struct super_block *sb, char *options)
>  			kvfree(name);
>  			break;
>  		case Opt_test_dummy_encryption:
> -#ifdef CONFIG_FS_ENCRYPTION
> -			if (!f2fs_sb_has_encrypt(sbi)) {
> -				f2fs_err(sbi, "Encrypt feature is off");
> -				return -EINVAL;
> -			}
> -
> -			F2FS_OPTION(sbi).test_dummy_encryption = true;
> -			f2fs_info(sbi, "Test dummy encryption mode enabled");
> -#else
> -			f2fs_info(sbi, "Test dummy encryption mount option ignored");
> -#endif
> +			ret = f2fs_set_test_dummy_encryption(sb, p, &args[0],
> +							     is_remount);
> +			if (ret)
> +				return ret;
>  			break;
>  		case Opt_checkpoint_disable_cap_perc:
>  			if (args->from && match_int(args, &arg))
> @@ -1213,6 +1250,7 @@ static void f2fs_put_super(struct super_block *sb)
>  	for (i = 0; i < MAXQUOTAS; i++)
>  		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
>  #endif
> +	fscrypt_free_dummy_context(&F2FS_OPTION(sbi).dummy_enc_ctx);
>  	destroy_percpu_info(sbi);
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
>  		kvfree(sbi->write_io[i]);
> @@ -1543,10 +1581,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
>  		seq_printf(seq, ",whint_mode=%s", "user-based");
>  	else if (F2FS_OPTION(sbi).whint_mode == WHINT_MODE_FS)
>  		seq_printf(seq, ",whint_mode=%s", "fs-based");
> -#ifdef CONFIG_FS_ENCRYPTION
> -	if (F2FS_OPTION(sbi).test_dummy_encryption)
> -		seq_puts(seq, ",test_dummy_encryption");
> -#endif
> +
> +	fscrypt_show_test_dummy_encryption(seq, ',', sbi->sb);
>  
>  	if (F2FS_OPTION(sbi).alloc_mode == ALLOC_MODE_DEFAULT)
>  		seq_printf(seq, ",alloc_mode=%s", "default");
> @@ -1575,7 +1611,6 @@ static void default_options(struct f2fs_sb_info *sbi)
>  	F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
>  	F2FS_OPTION(sbi).alloc_mode = ALLOC_MODE_DEFAULT;
>  	F2FS_OPTION(sbi).fsync_mode = FSYNC_MODE_POSIX;
> -	F2FS_OPTION(sbi).test_dummy_encryption = false;
>  	F2FS_OPTION(sbi).s_resuid = make_kuid(&init_user_ns, F2FS_DEF_RESUID);
>  	F2FS_OPTION(sbi).s_resgid = make_kgid(&init_user_ns, F2FS_DEF_RESGID);
>  	F2FS_OPTION(sbi).compress_algorithm = COMPRESS_LZ4;
> @@ -1734,7 +1769,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>  	default_options(sbi);
>  
>  	/* parse mount options */
> -	err = parse_options(sb, data);
> +	err = parse_options(sb, data, true);
>  	if (err)
>  		goto restore_opts;
>  	checkpoint_changed =
> @@ -2410,9 +2445,10 @@ static int f2fs_set_context(struct inode *inode, const void *ctx, size_t len,
>  				ctx, len, fs_data, XATTR_CREATE);
>  }
>  
> -static bool f2fs_dummy_context(struct inode *inode)
> +static const union fscrypt_context *
> +f2fs_get_dummy_context(struct super_block *sb)
>  {
> -	return DUMMY_ENCRYPTION_ENABLED(F2FS_I_SB(inode));
> +	return F2FS_OPTION(F2FS_SB(sb)).dummy_enc_ctx.ctx;
>  }
>  
>  static bool f2fs_has_stable_inodes(struct super_block *sb)
> @@ -2431,7 +2467,7 @@ static const struct fscrypt_operations f2fs_cryptops = {
>  	.key_prefix		= "f2fs:",
>  	.get_context		= f2fs_get_context,
>  	.set_context		= f2fs_set_context,
> -	.dummy_context		= f2fs_dummy_context,
> +	.get_dummy_context	= f2fs_get_dummy_context,
>  	.empty_dir		= f2fs_empty_dir,
>  	.max_namelen		= F2FS_NAME_LEN,
>  	.has_stable_inodes	= f2fs_has_stable_inodes,
> @@ -3366,7 +3402,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto free_sb_buf;
>  	}
>  
> -	err = parse_options(sb, options);
> +	err = parse_options(sb, options, false);
>  	if (err)
>  		goto free_options;
>  
> @@ -3769,6 +3805,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	for (i = 0; i < MAXQUOTAS; i++)
>  		kvfree(F2FS_OPTION(sbi).s_qf_names[i]);
>  #endif
> +	fscrypt_free_dummy_context(&F2FS_OPTION(sbi).dummy_enc_ctx);
>  	kvfree(options);
>  free_sb_buf:
>  	kvfree(raw_super);
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index e3c2d2a155250a..13672564564894 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -15,12 +15,15 @@
>  
>  #include <linux/fs.h>
>  #include <linux/mm.h>
> +#include <linux/parser.h>
>  #include <linux/slab.h>
>  #include <uapi/linux/fscrypt.h>
>  
>  #define FS_CRYPTO_BLOCK_SIZE		16
>  
> +union fscrypt_context;
>  struct fscrypt_info;
> +struct seq_file;
>  
>  struct fscrypt_str {
>  	unsigned char *name;
> @@ -58,7 +61,8 @@ struct fscrypt_operations {
>  	const char *key_prefix;
>  	int (*get_context)(struct inode *, void *, size_t);
>  	int (*set_context)(struct inode *, const void *, size_t, void *);
> -	bool (*dummy_context)(struct inode *);
> +	const union fscrypt_context *(*get_dummy_context)(
> +		struct super_block *sb);
>  	bool (*empty_dir)(struct inode *);
>  	unsigned int max_namelen;
>  	bool (*has_stable_inodes)(struct super_block *sb);
> @@ -87,10 +91,12 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
>  	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
>  }
>  
> -static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
> +static inline const union fscrypt_context *
> +fscrypt_get_dummy_context(struct super_block *sb)
>  {
> -	return inode->i_sb->s_cop->dummy_context &&
> -		inode->i_sb->s_cop->dummy_context(inode);
> +	if (!sb->s_cop->get_dummy_context)
> +		return NULL;
> +	return sb->s_cop->get_dummy_context(sb);
>  }
>  
>  /*
> @@ -143,6 +149,23 @@ extern int fscrypt_ioctl_get_nonce(struct file *filp, void __user *arg);
>  extern int fscrypt_has_permitted_context(struct inode *, struct inode *);
>  extern int fscrypt_inherit_context(struct inode *, struct inode *,
>  					void *, bool);
> +
> +struct fscrypt_dummy_context {
> +	const union fscrypt_context *ctx;
> +};
> +
> +int fscrypt_set_test_dummy_encryption(struct super_block *sb,
> +				      const substring_t *arg,
> +				      struct fscrypt_dummy_context *dummy_ctx);
> +void fscrypt_show_test_dummy_encryption(struct seq_file *seq, char sep,
> +					struct super_block *sb);
> +static inline void
> +fscrypt_free_dummy_context(struct fscrypt_dummy_context *dummy_ctx)
> +{
> +	kfree(dummy_ctx->ctx);
> +	dummy_ctx->ctx = NULL;
> +}
> +
>  /* keyring.c */
>  extern void fscrypt_sb_free(struct super_block *sb);
>  extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
> @@ -222,9 +245,10 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
>  	return false;
>  }
>  
> -static inline bool fscrypt_dummy_context_enabled(struct inode *inode)
> +static inline const union fscrypt_context *
> +fscrypt_get_dummy_context(struct super_block *sb)
>  {
> -	return false;
> +	return NULL;
>  }
>  
>  static inline void fscrypt_handle_d_move(struct dentry *dentry)
> @@ -319,6 +343,20 @@ static inline int fscrypt_inherit_context(struct inode *parent,
>  	return -EOPNOTSUPP;
>  }
>  
> +struct fscrypt_dummy_context {
> +};
> +
> +static inline void fscrypt_show_test_dummy_encryption(struct seq_file *seq,
> +						      char sep,
> +						      struct super_block *sb)
> +{
> +}
> +
> +static inline void
> +fscrypt_free_dummy_context(struct fscrypt_dummy_context *dummy_ctx)
> +{
> +}
> +
>  /* keyring.c */
>  static inline void fscrypt_sb_free(struct super_block *sb)
>  {
> @@ -676,7 +714,7 @@ static inline int fscrypt_prepare_symlink(struct inode *dir,
>  					  unsigned int max_len,
>  					  struct fscrypt_str *disk_link)
>  {
> -	if (IS_ENCRYPTED(dir) || fscrypt_dummy_context_enabled(dir))
> +	if (IS_ENCRYPTED(dir) || fscrypt_get_dummy_context(dir->i_sb) != NULL)
>  		return __fscrypt_prepare_symlink(dir, len, max_len, disk_link);
>  
>  	disk_link->name = (unsigned char *)target;
> -- 
> 2.26.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
