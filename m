Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57614523361
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 May 2022 14:50:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nolnc-0001lf-5a; Wed, 11 May 2022 12:50:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ritesh.list@gmail.com>) id 1nolnZ-0001lL-RF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 12:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+viyLqjrUdtjOibi08MOw0j4Eq0aWUQozPemEDDC3QU=; b=c63n3ZscFcMoquzpYicZcevy8k
 04+sxYgBc/4ruYBtxeTYYDA6YFO47oX86varuIMvMJUGtqYYvVchv46sFHVdU0M4qISDjYZSMoCQm
 QZnQywZGMhWxriSjl2+7KJfvOGYoFmS7eKdqXcTBGXtWcP93qN0cE0HnHzwU+5RfIZ08=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+viyLqjrUdtjOibi08MOw0j4Eq0aWUQozPemEDDC3QU=; b=AVIErFzgopzf3KOldAmiqWdbDJ
 qlYwFpwFNY/3PT6GG/VOwXKz5+x59JLqJbu3WDvp5pihPD87RcohTqqtH8OEJAEvObTvHqnTkznuN
 orjIhIOJMAXdnNg0j1SWvG/v7lzPleI+dGyEyQo2MLxHjZZ1LX0LNsdtcpk70dOMdqQE=;
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nolnV-008oUI-Sm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 May 2022 12:50:38 +0000
Received: by mail-pj1-f42.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso1973729pjb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 May 2022 05:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+viyLqjrUdtjOibi08MOw0j4Eq0aWUQozPemEDDC3QU=;
 b=lL9dLvBjj7LiM1PLF7+ChiPTLOQzhWf1wmKbcqqI24qrOfsY9/Je7d9WiU4L+tEu+r
 jPQcOlQqVX/SS2WAfD7ghSJ+J8edxf0C7UxbPDMQslfKcQye/lXTPNNi3BaP72Eu8qdl
 gIWbXqlS3WMSDVr6IPxS3JDR0tb3ZfTYlThGOpZtXOGJ1ThRaGVutya/0Tci04flRr3I
 xPPD0yBrDJ7WEk38IUBuGUh5IzYWI/vihFNikyjS5kivJfjTuRh4KsxeJeaaPbMV9nDh
 iqYkAxNODjweFov4shSAh4aKhbbRWDnqU/SXAp6SSHN85OMBoWnA7Ni8AJAFuYrLQ5aF
 3Ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+viyLqjrUdtjOibi08MOw0j4Eq0aWUQozPemEDDC3QU=;
 b=40bI3D+bcxUslSoBDp3w+CvHj4l30cE5GnRk+syFvVlWKWi8DYj2y4FZinq7mXAYIA
 NHTOMTlxgGFt/XdTMKu+mI7a5irarKtzfHQKaZKyaDq4SXxtQ7RD0MMCHI+7aYZbrVk0
 esXHPAjrM+yqy1oFiyT3zAKfQHZoYtayEUn1Mm2AAxSc0yi6HeXgZUvHjwkVoVHYrO3n
 Q2hm9+6cURRe+gLC77pmb/JqSqIOcSkjNyWGLPwsJIqfPBb115wHvF+rAQbA0xnOymi+
 3KgnALVK6AQRNzE69PYqxZDbLI1aIlL7fyquM4ztAMOMSYrWr2HwlNF/mdfwuluVd2nh
 nmkw==
X-Gm-Message-State: AOAM531tCxVcsG1AoUa11WVBUvqMAxb/Qn+q4uhynLuuMzqxwL2VPgxv
 bdi38G34c8tzONOHms2xmjmbzku5+gw=
X-Google-Smtp-Source: ABdhPJx7yP2M50cFkRqGLDJe9numrZNfsCFjSZWPTWZ80iF63V521EQf8g/ynHHyzcHfXyKnuoc3Fg==
X-Received: by 2002:a17:902:ccc4:b0:156:5d37:b42f with SMTP id
 z4-20020a170902ccc400b001565d37b42fmr25008502ple.157.1652273428265; 
 Wed, 11 May 2022 05:50:28 -0700 (PDT)
Received: from localhost ([2406:7400:63:532d:2759:da01:e9ea:1584])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170902c20900b0015f36687452sm1514743pll.296.2022.05.11.05.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 05:50:27 -0700 (PDT)
Date: Wed, 11 May 2022 18:20:23 +0530
From: Ritesh Harjani <ritesh.list@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20220511125023.gxfkgft35gkjyhef@riteshh-domain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501050857.538984-2-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 22/04/30 10:08PM, Eric Biggers wrote: > From: Eric Biggers
 > > Make the test_dummy_encryption mount option require that the encrypt
 > feature flag be already enabled on the filesystem, rather tha [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [ritesh.list[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nolnV-008oUI-Sm
Subject: Re: [f2fs-dev] [PATCH v2 1/7] ext4: only allow
 test_dummy_encryption when supported
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
> Make the test_dummy_encryption mount option require that the encrypt
> feature flag be already enabled on the filesystem, rather than
> automatically enabling it.  Practically, this means that "-O encrypt"
> will need to be included in MKFS_OPTIONS when running xfstests with the
> test_dummy_encryption mount option.  (ext4/053 also needs an update.)
>
> Moreover, as long as the preconditions for test_dummy_encryption are
> being tightened anyway, take the opportunity to start rejecting it when
> !CONFIG_FS_ENCRYPTION rather than ignoring it.
>
> The motivation for requiring the encrypt feature flag is that:
>
> - Having the filesystem auto-enable feature flags is problematic, as it
>   bypasses the usual sanity checks.  The specific issue which came up
>   recently is that in kernel versions where ext4 supports casefold but
>   not encrypt+casefold (v5.1 through v5.10), the kernel will happily add
>   the encrypt flag to a filesystem that has the casefold flag, making it
>   unmountable -- but only for subsequent mounts, not the initial one.
>   This confused the casefold support detection in xfstests, causing
>   generic/556 to fail rather than be skipped.
>
> - The xfstests-bld test runners (kvm-xfstests et al.) already use the
>   required mkfs flag, so they will not be affected by this change.  Only
>   users of test_dummy_encryption alone will be affected.  But, this
>   option has always been for testing only, so it should be fine to
>   require that the few users of this option update their test scripts.
>
> - f2fs already requires it (for its equivalent feature flag).
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

So we are changing user behavior with this patch, but since it is only for
test_dummy_encryption mount option which is used for testing and given it is
nicely documented here, the patch looks good to me with a small nit.


> ---
>  fs/ext4/super.c | 59 +++++++++++++++++++++++++++++++------------------
>  1 file changed, 37 insertions(+), 22 deletions(-)
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 1466fbdbc8e34..64ce17714e193 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -2427,11 +2427,12 @@ static int ext4_parse_param(struct fs_context *fc, struct fs_parameter *param)
>  		ctx->spec |= EXT4_SPEC_DUMMY_ENCRYPTION;
>  		ctx->test_dummy_enc_arg = kmemdup_nul(param->string, param->size,
>  						      GFP_KERNEL);
> +		return 0;
>  #else
>  		ext4_msg(NULL, KERN_WARNING,
> -			 "Test dummy encryption mount option ignored");
> +			 "test_dummy_encryption option not supported");
> +		return -EINVAL;
>  #endif
> -		return 0;
>  	case Opt_dax:
>  	case Opt_dax_type:
>  #ifdef CONFIG_FS_DAX
> @@ -2786,12 +2787,43 @@ static int ext4_check_quota_consistency(struct fs_context *fc,
>  #endif
>  }
>
> +static int ext4_check_test_dummy_encryption(const struct fs_context *fc,
> +					    struct super_block *sb)

Maybe the function name should match with other option checking, like
ext4_check_test_dummy_encryption_consistency() similar to
ext4_check_quota_consistency(). This makes it clear that both are residents of
ext4_check_opt_consistency()

One can argue it makes the function name quite long. So I don't have hard
objections anyways.

So either ways, feel free to add -

Reviewed-by: Ritesh Harjani <ritesh.list@gmail.com>



> +{
> +	const struct ext4_fs_context *ctx = fc->fs_private;
> +	const struct ext4_sb_info *sbi = EXT4_SB(sb);
> +
> +	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION) ||
> +	    !(ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION))
> +		return 0;
> +
> +	if (!ext4_has_feature_encrypt(sb)) {
> +		ext4_msg(NULL, KERN_WARNING,
> +			 "test_dummy_encryption requires encrypt feature");
> +		return -EINVAL;
> +	}
> +	/*
> +	 * This mount option is just for testing, and it's not worthwhile to
> +	 * implement the extra complexity (e.g. RCU protection) that would be
> +	 * needed to allow it to be set or changed during remount.  We do allow
> +	 * it to be specified during remount, but only if there is no change.
> +	 */
> +	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
> +	    !DUMMY_ENCRYPTION_ENABLED(sbi)) {
> +		ext4_msg(NULL, KERN_WARNING,
> +			 "Can't set test_dummy_encryption on remount");
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
>  static int ext4_check_opt_consistency(struct fs_context *fc,
>  				      struct super_block *sb)
>  {
>  	struct ext4_fs_context *ctx = fc->fs_private;
>  	struct ext4_sb_info *sbi = fc->s_fs_info;
>  	int is_remount = fc->purpose == FS_CONTEXT_FOR_RECONFIGURE;
> +	int err;
>
>  	if ((ctx->opt_flags & MOPT_NO_EXT2) && IS_EXT2_SB(sb)) {
>  		ext4_msg(NULL, KERN_ERR,
> @@ -2821,20 +2853,9 @@ static int ext4_check_opt_consistency(struct fs_context *fc,
>  				 "for blocksize < PAGE_SIZE");
>  	}
>
> -#ifdef CONFIG_FS_ENCRYPTION
> -	/*
> -	 * This mount option is just for testing, and it's not worthwhile to
> -	 * implement the extra complexity (e.g. RCU protection) that would be
> -	 * needed to allow it to be set or changed during remount.  We do allow
> -	 * it to be specified during remount, but only if there is no change.
> -	 */
> -	if ((ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION) &&
> -	    is_remount && !sbi->s_dummy_enc_policy.policy) {
> -		ext4_msg(NULL, KERN_WARNING,
> -			 "Can't set test_dummy_encryption on remount");
> -		return -1;

Nice, we also got rid of -1 return value in this patch which is returned to user.
I think this should have been -EINVAL from the very beginning.


-ritesh

> -	}
> -#endif
> +	err = ext4_check_test_dummy_encryption(fc, sb);
> +	if (err)
> +		return err;
>
>  	if ((ctx->spec & EXT4_SPEC_DATAJ) && is_remount) {
>  		if (!sbi->s_journal) {
> @@ -5279,12 +5300,6 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
>  		goto failed_mount_wq;
>  	}
>
> -	if (DUMMY_ENCRYPTION_ENABLED(sbi) && !sb_rdonly(sb) &&
> -	    !ext4_has_feature_encrypt(sb)) {
> -		ext4_set_feature_encrypt(sb);
> -		ext4_commit_super(sb);
> -	}
> -
>  	/*
>  	 * Get the # of file system overhead blocks from the
>  	 * superblock if present.
> --
> 2.36.0
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
