Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEC9B106C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 22:47:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4RDd-0005Ms-PA;
	Fri, 25 Oct 2024 20:47:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t4RDc-0005Ml-Lw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 20:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zd5Anit6yA3HTeMzXbpU7mXaEYKhVeL/IUZRK50Rwjk=; b=cwn1LcAA9v+FW5wxpQ4cNkh6GN
 qQH2ns9RlwuAIx3n0xsVxUqGWN4508Mg94MSy/HDDufV6Uhn69HCZHp8NgjR2r1bXK8mvuJr9Q1UP
 4Hgoc3h+8Iazfz2/L9BvRsR3txLrfJ6C8UsUlU/G9w9h7rBy1FJgGRJNRcy/2w7D8VWk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zd5Anit6yA3HTeMzXbpU7mXaEYKhVeL/IUZRK50Rwjk=; b=VTcC9SZEA7eeNem5vfZ2ENJWfg
 uPL1Ayf7g6HDSZdDYaTA6sogFiSmKMjRYNQIf5uHBP8PXLJbltMs2ThIBhyJNLLJixP25jtLEfVCA
 UMTBhdRHSe1dfCTAcN6pspSREyvwnUwFd6vl01kcsnehrMcqriiqTist5Pu7wKd8F5k8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4RDb-0006rD-8e for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 20:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A5244A43160
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 20:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE62C4CEE5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729889248;
 bh=Tfo5X6uc3w/hrU+iP8PZcK2t41JlU/D+FAY3HHNYJHM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gekfskCvWOfIqlAZ/aSuuXFxlPUBLAq/1J8u7BRk+K9IG78a6VWhRP79Fdow15YPf
 44uCMphVFXEm62CFfo0bnfd3n1CW10JYtALJafsVUKuPU3z4maXZ5sT1Bb2UV9pycN
 TGG3d8+d3WVZMhgB/k7H5BucarzeptU7ro6s0+7jd2rjHTv2j/nmLH6oV/WpNORUDA
 xnh/zY6v5NxPpq11QA6EDyZllc/Y/OnW+6atxbqNYXt6wo/B0emCq9krojm4qbnglg
 hOSv/XbGNEBeJM/x1STwgIFbH8+hKzyAcfr+T2d5ym7TYHf4gr/dfs1497Uiengm5Q
 UWHjgLfRLSMlw==
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fb6110c8faso24059111fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 13:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW31XY/qCfW+6ghZB5Wl2q5viN2/dxPCMxw00aHOvv0LESIQkHNrt4DfnuU/ARJ43mzdmT1TpFvbm75TYtn/ye9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxBpFyHQjA5vE5lnh0sxkATbgShndGHAi79dUj0X4fnWmcUrd+A
 tlenuJwuudhkjYT1XPcWGiUusx3Jyk8gRn/iqjiVCa7KMrXwEmfj22xVDaP46R+4ei5tUA1e4W2
 FhslowcJcbtPVxC7ZuG9tWxNaELs=
X-Google-Smtp-Source: AGHT+IEp6Dx2HlT+U0iGzL8ulgjfv3Yq0fFTV7/qQsnbI5MKZCd6PlYP7CAgGzk4GX/wuTuxR8r9WXnoQ2sPlcjTw1A=
X-Received: by 2002:a05:651c:2123:b0:2fb:45cf:5eef with SMTP id
 38308e7fff4ca-2fcbe04dc90mr3314601fa.30.1729889246941; Fri, 25 Oct 2024
 13:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-5-ebiggers@kernel.org>
In-Reply-To: <20241025191454.72616-5-ebiggers@kernel.org>
Date: Fri, 25 Oct 2024 22:47:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
Message-ID: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 25 Oct 2024 at 21:15,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > From: Eric Biggers <ebiggers@google.com> > > Instead of registering
 the crc32-$arch and crc32c-$arch algorithms if > the arc [...] 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4RDb-0006rD-8e
Subject: Re: [f2fs-dev] [PATCH v2 04/18] crypto: crc32 - don't unnecessarily
 register arch algorithms
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
From: Ard Biesheuvel via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> the arch-specific code was built, only register them when that code was
> built *and* is not falling back to the base implementation at runtime.
>
> This avoids confusing users like btrfs which checks the shash driver
> name to determine whether it is crc32c-generic.
>

I think we agree that 'generic' specifically means a C implementation
that is identical across all architectures, which is why I updated my
patch to export -arch instead of wrapping the C code in yet another
driver just for the fuzzing tests.

So why is this a problem? If no optimizations are available at
runtime, crc32-arch and crc32-generic are interchangeable, and so it
shouldn't matter whether you use one or the other.

You can infer from the driver name whether the C code is being used,
not whether or not the implementation is 'fast', and the btrfs hack is
already broken on arm64.

> (It would also make sense to change btrfs to test the crc32_optimization
> flags itself, so that it doesn't have to use the weird hack of parsing
> the driver name.  This change still makes sense either way though.)
>

Indeed. That hack is very dubious and I'd be inclined just to ignore
this. On x86 and arm64, it shouldn't make a difference, given that
crc32-arch will be 'fast' in the vast majority of cases. On other
architectures, btrfs may use the C implementation while assuming it is
something faster, and if anyone actually notices the difference, we
can work with the btrfs devs to do something more sensible here.


> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/crc32_generic.c  | 8 ++++++--
>  crypto/crc32c_generic.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
> index cc064ea8240e..cecd01e4d6e6 100644
> --- a/crypto/crc32_generic.c
> +++ b/crypto/crc32_generic.c
> @@ -155,19 +155,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(u32),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations & CRC32_LE_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32_mod_init);
>  module_exit(crc32_mod_fini);
>
> diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
> index 04b03d825cf4..47d694da9d4a 100644
> --- a/crypto/crc32c_generic.c
> +++ b/crypto/crc32c_generic.c
> @@ -195,19 +195,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(struct chksum_ctx),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32c_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32c_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations & CRC32C_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32c_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32c_mod_init);
>  module_exit(crc32c_mod_fini);
>
> --
> 2.47.0
>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
