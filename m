Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C65260B1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 May 2022 13:07:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npT9H-0002yz-Nm; Fri, 13 May 2022 11:07:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ritesh.list@gmail.com>) id 1npT9F-0002ys-VV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 11:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RvcJux6/qW3b1AOWwt1r6yan5cwjm7yOGvtvSlXsj0E=; b=TqDhS6p5I8APuoPWbMxuEPhBKt
 qvXkRsPUKQ6hW9hZuU23hV47TwECE+mc1du4CTswirPq86iEy8/ajl3jVK3WWIUvw5Ms1ZC2cG75c
 imCZbTqyXO8DXCgA7i0JQ1MUkODLJlJ85WZ7ufYKSdeuTH5RSUJW5nIFvd1fDfS1VlrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RvcJux6/qW3b1AOWwt1r6yan5cwjm7yOGvtvSlXsj0E=; b=YtjwUEWAUfkzc+Q01gltQ55se3
 XlKkCUCstUKU4+m1yiisEDMZ7ebfwmS+90v+HdGAWax1duAX+fsr9fYaZJ0RJAeA58G6SmLZ2Srwt
 6WYHHChpfVH7H68w9cSu69sJ5q+lwnvS7uQkhPahlMaMEQdyiLBGQuI1KNHeUztgutLA=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1npT9D-00AlzS-Vw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 11:07:52 +0000
Received: by mail-pl1-f176.google.com with SMTP id q18so7583510pln.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 May 2022 04:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RvcJux6/qW3b1AOWwt1r6yan5cwjm7yOGvtvSlXsj0E=;
 b=ICl/HPtDfpbvQfwxCC4vPQlQAnMsLcbvemITEhqxbnytOGXivo+eQwnKxGH/KZDoLs
 BtYXDKVdOxGe0D+yHyGJXhOqH+JNfoaLEf1Dsx1eeAZYUAw2D3UorOoomS9UV5T0TRDu
 pEOPelbTFghBoWvWtcBKU/jxXVmokEfNMO3xsTR5ZRt0A9HxDk9joKD3OfpTnkwGWPpm
 odnb+uXRQ5mWj93sM5Mo4iSK33soi+T4CX5uLOZgpD0MMqcDA/XENUoFzV9+L552vSL+
 DsJyFwKy5eONosKjYPy8WnRqJWW42nu/cpUNpk690whnETbSaqAD7DFH2HxQBZ1ZBtWc
 pauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RvcJux6/qW3b1AOWwt1r6yan5cwjm7yOGvtvSlXsj0E=;
 b=NV4BXWK9QmeWfHiNH7A1xa9ipj3nsXBT+GfoZkQLYV8A5ZV468whKGUgmB6SH53YTW
 jE8wM6xLoj/JgdJQHaRzJAlAWVE621+e3p78R9ZcrVuJMG0Yc13mJj4NMNFSWgf7RKs2
 fkmHSsvwlWMQPTBdXVddXtJCQwleTenJpT8KhYuuyGX1acErCZVHORsjUey4bPEOU5dN
 MKQjIl3OkCcrDo9P9W+PJviSKBJMAWlNL2Hnl7wsUXqdEDBtTMyfg62gxkQ+YUEjzrF1
 zT0cJ31quCkT3oaR1mXm2RsnzoK+X1U+oE5wCp5HtTzjzRjCyLdoFirAbYuSqeU1GFrF
 VNOQ==
X-Gm-Message-State: AOAM5301IH5GOEmaGRy8u16NkUOvFF5ckoedD7MjNRjeQG7U7TZTI7VG
 tu2jqUzMV9ZkQCIyCenbo90=
X-Google-Smtp-Source: ABdhPJxLbLdV4zBaBgvt1JJlnzNT8s+aVSgGeAZiLoryVNwQXWU2RGe/57UVyzMZnZn/SZiFsm11qA==
X-Received: by 2002:a17:902:da91:b0:15e:d22f:cfd7 with SMTP id
 j17-20020a170902da9100b0015ed22fcfd7mr4454407plx.85.1652440066289; 
 Fri, 13 May 2022 04:07:46 -0700 (PDT)
Received: from localhost ([2406:7400:63:532d:c4bb:97f7:b03d:2c53])
 by smtp.gmail.com with ESMTPSA id
 198-20020a6219cf000000b0050dc76281cfsm1483913pfz.169.2022.05.13.04.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 04:07:45 -0700 (PDT)
Date: Fri, 13 May 2022 16:37:41 +0530
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220513110741.uofbacfs7li4cqio@riteshh-domain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501050857.538984-6-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 22/04/30 10:08PM, Eric Biggers wrote: > From: Eric Biggers
 > > Since ext4 was converted to the new mount API, the test_dummy_encryption
 > mount option isn't being handled entirely correctly, beca [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ritesh.list[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1npT9D-00AlzS-Vw
Subject: Re: [f2fs-dev] [PATCH v2 5/7] ext4: fix up test_dummy_encryption
 handling for new mount API
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Lukas Czerner <lczerner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 22/04/30 10:08PM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Since ext4 was converted to the new mount API, the test_dummy_encryption
> mount option isn't being handled entirely correctly, because the needed
> fscrypt_set_test_dummy_encryption() helper function combines
> parsing/checking/applying into one function.  That doesn't work well
> with the new mount API, which split these into separate steps.
>
> This was sort of okay anyway, due to the parsing logic that was copied
> from fscrypt_set_test_dummy_encryption() into ext4_parse_param(),
> combined with an additional check in ext4_check_test_dummy_encryption().
> However, these overlooked the case of changing the value of
> test_dummy_encryption on remount, which isn't allowed but ext4 wasn't
> detecting until ext4_apply_options() when it's too late to fail.
> Another bug is that if test_dummy_encryption was specified multiple
> times with an argument, memory was leaked.
>
> Fix this up properly by using the new helper functions that allow
> splitting up the parse/check/apply steps for test_dummy_encryption.
>
> Fixes: cebe85d570cf ("ext4: switch to the new mount api")
> Signed-off-by: Eric Biggers <ebiggers@google.com>

I just had a small observation. Feel free to check it at your end too.


> ---
>  fs/ext4/ext4.h  |   6 ---
>  fs/ext4/super.c | 131 +++++++++++++++++++++++++-----------------------
>  2 files changed, 67 insertions(+), 70 deletions(-)
>
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index a743b1e3b89ec..f6d6661817b63 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -1440,12 +1440,6 @@ struct ext4_super_block {
>
>  #ifdef __KERNEL__
>
> -#ifdef CONFIG_FS_ENCRYPTION
> -#define DUMMY_ENCRYPTION_ENABLED(sbi) ((sbi)->s_dummy_enc_policy.policy != NULL)
> -#else
> -#define DUMMY_ENCRYPTION_ENABLED(sbi) (0)
> -#endif
> -
>  /* Number of quota types we support */
>  #define EXT4_MAXQUOTAS 3
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 64ce17714e193..43e4cd358b33b 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -87,7 +87,7 @@ static struct inode *ext4_get_journal_inode(struct super_block *sb,
>  static int ext4_validate_options(struct fs_context *fc);
>  static int ext4_check_opt_consistency(struct fs_context *fc,
>  				      struct super_block *sb);
> -static int ext4_apply_options(struct fs_context *fc, struct super_block *sb);
> +static void ext4_apply_options(struct fs_context *fc, struct super_block *sb);
>  static int ext4_parse_param(struct fs_context *fc, struct fs_parameter *param);
>  static int ext4_get_tree(struct fs_context *fc);
>  static int ext4_reconfigure(struct fs_context *fc);
> @@ -1989,31 +1989,12 @@ ext4_sb_read_encoding(const struct ext4_super_block *es)
>  }
>  #endif
>
> -static int ext4_set_test_dummy_encryption(struct super_block *sb, char *arg)
> -{
> -#ifdef CONFIG_FS_ENCRYPTION
> -	struct ext4_sb_info *sbi = EXT4_SB(sb);
> -	int err;
> -
> -	err = fscrypt_set_test_dummy_encryption(sb, arg,
> -						&sbi->s_dummy_enc_policy);
> -	if (err) {
> -		ext4_msg(sb, KERN_WARNING,
> -			 "Error while setting test dummy encryption [%d]", err);
> -		return err;
> -	}
> -	ext4_msg(sb, KERN_WARNING, "Test dummy encryption mode enabled");
> -#endif
> -	return 0;
> -}
> -
>  #define EXT4_SPEC_JQUOTA			(1 <<  0)
>  #define EXT4_SPEC_JQFMT				(1 <<  1)
>  #define EXT4_SPEC_DATAJ				(1 <<  2)
>  #define EXT4_SPEC_SB_BLOCK			(1 <<  3)
>  #define EXT4_SPEC_JOURNAL_DEV			(1 <<  4)
>  #define EXT4_SPEC_JOURNAL_IOPRIO		(1 <<  5)
> -#define EXT4_SPEC_DUMMY_ENCRYPTION		(1 <<  6)
>  #define EXT4_SPEC_s_want_extra_isize		(1 <<  7)
>  #define EXT4_SPEC_s_max_batch_time		(1 <<  8)
>  #define EXT4_SPEC_s_min_batch_time		(1 <<  9)
> @@ -2030,7 +2011,7 @@ static int ext4_set_test_dummy_encryption(struct super_block *sb, char *arg)
>
>  struct ext4_fs_context {
>  	char		*s_qf_names[EXT4_MAXQUOTAS];
> -	char		*test_dummy_enc_arg;
> +	struct fscrypt_dummy_policy dummy_enc_policy;
>  	int		s_jquota_fmt;	/* Format of quota to use */
>  #ifdef CONFIG_EXT4_DEBUG
>  	int s_fc_debug_max_replay;
> @@ -2061,9 +2042,8 @@ struct ext4_fs_context {
>  	ext4_fsblk_t	s_sb_block;
>  };
>
> -static void ext4_fc_free(struct fs_context *fc)
> +static void __ext4_fc_free(struct ext4_fs_context *ctx)
>  {
> -	struct ext4_fs_context *ctx = fc->fs_private;
>  	int i;
>
>  	if (!ctx)
> @@ -2072,10 +2052,15 @@ static void ext4_fc_free(struct fs_context *fc)
>  	for (i = 0; i < EXT4_MAXQUOTAS; i++)
>  		kfree(ctx->s_qf_names[i]);
>
> -	kfree(ctx->test_dummy_enc_arg);
> +	fscrypt_free_dummy_policy(&ctx->dummy_enc_policy);
>  	kfree(ctx);
>  }
>
> +static void ext4_fc_free(struct fs_context *fc)
> +{
> +	__ext4_fc_free(fc->fs_private);
> +}
> +
>  int ext4_init_fs_context(struct fs_context *fc)
>  {
>  	struct ext4_fs_context *ctx;
> @@ -2148,6 +2133,29 @@ static int unnote_qf_name(struct fs_context *fc, int qtype)
>  }
>  #endif
>
> +static int ext4_parse_test_dummy_encryption(const struct fs_parameter *param,
> +					    struct ext4_fs_context *ctx)
> +{
> +	int err;
> +
> +	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION)) {
> +		ext4_msg(NULL, KERN_WARNING,
> +			 "test_dummy_encryption option not supported");
> +		return -EINVAL;
> +	}
> +	err = fscrypt_parse_test_dummy_encryption(param,
> +						  &ctx->dummy_enc_policy);
> +	if (err == -EINVAL) {
> +		ext4_msg(NULL, KERN_WARNING,
> +			 "Value of option \"%s\" is unrecognized", param->key);
> +	} else if (err == -EEXIST) {
> +		ext4_msg(NULL, KERN_WARNING,
> +			 "Conflicting test_dummy_encryption options");
> +		return -EINVAL;
> +	}
> +	return err;
> +}
> +
>  #define EXT4_SET_CTX(name)						\
>  static inline void ctx_set_##name(struct ext4_fs_context *ctx,		\
>  				  unsigned long flag)			\
> @@ -2410,29 +2418,7 @@ static int ext4_parse_param(struct fs_context *fc, struct fs_parameter *param)
>  		ctx->spec |= EXT4_SPEC_JOURNAL_IOPRIO;
>  		return 0;
>  	case Opt_test_dummy_encryption:
> -#ifdef CONFIG_FS_ENCRYPTION
> -		if (param->type == fs_value_is_flag) {
> -			ctx->spec |= EXT4_SPEC_DUMMY_ENCRYPTION;
> -			ctx->test_dummy_enc_arg = NULL;
> -			return 0;
> -		}
> -		if (*param->string &&
> -		    !(!strcmp(param->string, "v1") ||
> -		      !strcmp(param->string, "v2"))) {
> -			ext4_msg(NULL, KERN_WARNING,
> -				 "Value of option \"%s\" is unrecognized",
> -				 param->key);
> -			return -EINVAL;
> -		}
> -		ctx->spec |= EXT4_SPEC_DUMMY_ENCRYPTION;
> -		ctx->test_dummy_enc_arg = kmemdup_nul(param->string, param->size,
> -						      GFP_KERNEL);
> -		return 0;
> -#else
> -		ext4_msg(NULL, KERN_WARNING,
> -			 "test_dummy_encryption option not supported");
> -		return -EINVAL;
> -#endif
> +		return ext4_parse_test_dummy_encryption(param, ctx);
>  	case Opt_dax:
>  	case Opt_dax_type:
>  #ifdef CONFIG_FS_DAX
> @@ -2623,10 +2609,11 @@ static int parse_apply_sb_mount_options(struct super_block *sb,
>  	if (s_ctx->spec & EXT4_SPEC_JOURNAL_IOPRIO)
>  		m_ctx->journal_ioprio = s_ctx->journal_ioprio;
>
> -	ret = ext4_apply_options(fc, sb);
> +	ext4_apply_options(fc, sb);
> +	ret = 0;
>
>  out_free:
> -	kfree(s_ctx);
> +	__ext4_fc_free(s_ctx);

I think we can still call ext4_fc_free(fc) and we don't need __ext4_fc_free().
Right?

-ritesh


>  	kfree(fc);
>  	kfree(s_mount_opts);
>  	return ret;
> @@ -2792,9 +2779,9 @@ static int ext4_check_test_dummy_encryption(const struct fs_context *fc,
>  {
>  	const struct ext4_fs_context *ctx = fc->fs_private;
>  	const struct ext4_sb_info *sbi = EXT4_SB(sb);
> +	int err;
>
> -	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION) ||
> -	    !(ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION))
> +	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
>  		return 0;
>
>  	if (!ext4_has_feature_encrypt(sb)) {
> @@ -2808,13 +2795,35 @@ static int ext4_check_test_dummy_encryption(const struct fs_context *fc,
>  	 * needed to allow it to be set or changed during remount.  We do allow
>  	 * it to be specified during remount, but only if there is no change.
>  	 */
> -	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
> -	    !DUMMY_ENCRYPTION_ENABLED(sbi)) {
> +	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
> +		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
> +						 &ctx->dummy_enc_policy))
> +			return 0;
>  		ext4_msg(NULL, KERN_WARNING,
> -			 "Can't set test_dummy_encryption on remount");
> +			 "Can't set or change test_dummy_encryption on remount");
>  		return -EINVAL;
>  	}
> -	return 0;
> +	/*
> +	 * fscrypt_add_test_dummy_key() technically changes the super_block, so
> +	 * it technically should be delayed until ext4_apply_options() like the
> +	 * other changes.  But since we never get here for remounts (see above),
> +	 * and this is the last chance to report errors, we do it here.
> +	 */
> +	err = fscrypt_add_test_dummy_key(sb, &ctx->dummy_enc_policy);
> +	if (err)
> +		ext4_msg(NULL, KERN_WARNING,
> +			 "Error adding test dummy encryption key [%d]", err);
> +	return err;
> +}
> +
> +static void ext4_apply_test_dummy_encryption(struct ext4_fs_context *ctx,
> +					     struct super_block *sb)
> +{
> +	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
> +		return;
> +	EXT4_SB(sb)->s_dummy_enc_policy = ctx->dummy_enc_policy;
> +	memset(&ctx->dummy_enc_policy, 0, sizeof(ctx->dummy_enc_policy));
> +	ext4_msg(sb, KERN_WARNING, "Test dummy encryption mode enabled");
>  }
>
>  static int ext4_check_opt_consistency(struct fs_context *fc,
> @@ -2901,11 +2910,10 @@ static int ext4_check_opt_consistency(struct fs_context *fc,
>  	return ext4_check_quota_consistency(fc, sb);
>  }
>
> -static int ext4_apply_options(struct fs_context *fc, struct super_block *sb)
> +static void ext4_apply_options(struct fs_context *fc, struct super_block *sb)
>  {
>  	struct ext4_fs_context *ctx = fc->fs_private;
>  	struct ext4_sb_info *sbi = fc->s_fs_info;
> -	int ret = 0;
>
>  	sbi->s_mount_opt &= ~ctx->mask_s_mount_opt;
>  	sbi->s_mount_opt |= ctx->vals_s_mount_opt;
> @@ -2942,10 +2950,7 @@ static int ext4_apply_options(struct fs_context *fc, struct super_block *sb)
>
>  	ext4_apply_quota_options(fc, sb);
>
> -	if (ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION)
> -		ret = ext4_set_test_dummy_encryption(sb, ctx->test_dummy_enc_arg);
> -
> -	return ret;
> +	ext4_apply_test_dummy_encryption(ctx, sb);
>  }
>
>
> @@ -4667,9 +4672,7 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
>  	if (err < 0)
>  		goto failed_mount;
>
> -	err = ext4_apply_options(fc, sb);
> -	if (err < 0)
> -		goto failed_mount;
> +	ext4_apply_options(fc, sb);
>
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	if (ext4_has_feature_casefold(sb) && !sb->s_encoding) {
> --
> 2.36.0
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
