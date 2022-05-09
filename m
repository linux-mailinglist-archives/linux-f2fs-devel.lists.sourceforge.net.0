Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F55520972
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 May 2022 01:40:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1noCzZ-00086q-9w; Mon, 09 May 2022 23:40:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1noCzY-00086k-3f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 23:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z7gCAC3XIK1Ei3AgBRzRpDRN+kIB8M1f7D41zKn6VmI=; b=M5QCYvBIlqeHcB7dvnvjmmQslp
 j6FZW787OFSOIYGy99/T4zELZFHclzXNnF895cSbDfIJF4EKnNelqK/uFHJb6V/ISBj/VEVfA8ATy
 hQPOkgj1TX4ZWg1+yjZdeW7xwUITY9MO2ahF5vT+m+MFK4OOZXhXgclcxKgpPGzwD99M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z7gCAC3XIK1Ei3AgBRzRpDRN+kIB8M1f7D41zKn6VmI=; b=LFUY33J4mlSBkKBr7VaCAGFAz1
 VNXD0oqfHyuPpCljr4s8PjEdvLztDVPNSkRSp/x4bFHKF0AyqF0ZYpIyLkgW6sGFZAiDqY6POURCs
 En8g/pb6Ps3FuGEczbHycOtchdpuOE2eswzb7VQY7TKKn292wXS6dcbCUmNPtpZxbQZE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1noCzT-006ofJ-4g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 May 2022 23:40:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5F19612F4;
 Mon,  9 May 2022 23:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCDFC385C2;
 Mon,  9 May 2022 23:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652139629;
 bh=RLRAqi8NcpOLCm0sad+42+BXu2XUKaGuSgWzJjtxch0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OB6Bv54N3c1nd1ASVso50lKwDGHnTt3gojR/6u9cXxTNXqkrPFwKTRS22ATNcXBvU
 FupdC/uG4ukZCXgG2H3BNJpxkeS8LLVNxEoyQ2oSocyxx4kH/d0y3mXElKwwvIPtHe
 dUDzt35YsU5vqDWLVD6p/TTs61j/q6G+YoBgJBuENC0jDB0r4IdlyRaI8+FwAgXL8y
 SWkEEEi7WUg2UseIzsD8TmxEY1Uwb+iSOZ9mgm9c9snZ8emFvzxv4f4Zmyt6NUfQOi
 TzMZlseoamQ7+mj8VAL+eVvudLGA3viK3ePWFp7W1RLT3znPRwKTk3rkEthqPAsOpF
 0nMruR3yXmo4g==
Date: Mon, 9 May 2022 16:40:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Ynmma+tkA2myRvz6@sol.localdomain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <20220501050857.538984-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220501050857.538984-6-ebiggers@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  A couple corrections I'll include in the next version: On
 Sat, Apr 30, 2022 at 10:08:55PM -0700, Eric Biggers wrote: > + if (fc->purpose
 == FS_CONTEXT_FOR_RECONFIGURE) { > + if
 (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy, 
 > + &ctx->dummy_enc_po [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1noCzT-006ofJ-4g
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
Cc: Lukas Czerner <lczerner@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A couple corrections I'll include in the next version:

On Sat, Apr 30, 2022 at 10:08:55PM -0700, Eric Biggers wrote:
> +	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
> +		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
> +						 &ctx->dummy_enc_policy))
> +			return 0;
>  		ext4_msg(NULL, KERN_WARNING,
> -			 "Can't set test_dummy_encryption on remount");
> +			 "Can't set or change test_dummy_encryption on remount");
>  		return -EINVAL;
>  	}

I think this needs to be 'fc->purpose == FS_CONTEXT_FOR_RECONFIGURE ||
fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)', since ext4 can parse
mount options from both s_mount_opts and the regular mount options.

> +static void ext4_apply_test_dummy_encryption(struct ext4_fs_context *ctx,
> +                                            struct super_block *sb)
> +{
> +	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
> +		return;

To handle remounts correctly, this needs to be
'!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy) ||
fscrypt_is_dummy_policy_set(&EXT4_SB(sb)->s_dummy_enc_policy)'.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
