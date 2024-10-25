Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 960789B0FD7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 22:32:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Qz5-0002Cl-9z;
	Fri, 25 Oct 2024 20:32:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t4Qz4-0002Cf-KH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 20:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTUERFsy8K5/pl07EUDBeFnq3I9Zkbo0oaQDqVJpurU=; b=YxsnCpJFFTPsGu76/DnJXEOiNV
 dHVbeJBi4s2op1Qs8lfPxzK7VorsvLsWWSfG8wu5pXVYLMFBsi1CLpp6W0hk/6RejK5MsLJG7M0Am
 4a8aYTFhoQTFMMfMD81tdEP+rfO70A4lMh2Q+kZw8xcPr78D5MzMEkReq0BQHWYcBuTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cTUERFsy8K5/pl07EUDBeFnq3I9Zkbo0oaQDqVJpurU=; b=VMTmHrOnd8Rhbb7TRGmJFFTIZ1
 d5+s8FENCFTXVwEpTdy4T+d30XxQr3dlujuNaHwLRbbucbcUlclSGV2XyHeQaQaz0+MljGuLytNRm
 xqX3e/4QBlD95jjBZjBppn0MIKDiD4/dZDaH4WThf1fxRWfIOMu7wCZGwkpD4Tn9KX6g=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Qz3-0004TD-ST for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 20:32:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A4D89A44B36
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 20:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE772C4CECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729888347;
 bh=ZOwjJ8kzzckhcIYE8j5hMZsSJUKc5cYu8yXf20E0HuM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qQe2ZQ+tSWetaoVGslaOuLKxN45AkmR2qZL3ILBwg0inR1U0Bmqzc2I/H0SPNy1q+
 xqhvZ1lVsaUgvK+i94ztGpOyctfsh9xsUmDl7oWGF8DsRY0dU+ALpo3kC2CFzgTRCs
 d1Gn2syKnR1u3PGOMFPA5PNTxrRkzCzY8B16NsRjasHVCOlyrTHAR42WYFBMOtUfdG
 GuwI0SitSv5h2cI0j6gOREAiw+lsj8YMWu7ap7hTnjYpP9sp1h+2oosiZ+DKa4ioms
 DkdlTrqAnhayaHpQbacjuHAxvBZczD1BLzN5cmfWkxHDMqhlulxn98YRbq9P+Xq7+2
 Z2GT/dJ3wtK6A==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb498a92f6so25523471fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 13:32:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRi3X422VMEx85Y6a0DbG9/04vPrDN+yD74nCT8TMQ7SIt7QI1CykvXA879z3UatIrOhfWmk884dFSCAt7/+j0@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx7WIlyoZ8655tk++mbLa10J+BOXkYk6IO1E9mZxeACusxJL50G
 6gmvXH7Opd1XRSEXccSpGRkqdh95l96NrzfMD8EvoicnALOczf5Qv1X6a3KQZ/yT4Th63x5Fiol
 1D+yF1hGFiBpfXLn2XYlBE0pj+/o=
X-Google-Smtp-Source: AGHT+IHWDYSNqGzTxA1yucLBJm6V+3waey3TQHM3kNvlUas/obIoVX4SuU3pAE8hqdaCjuOs8zy+d7cgGIIryFN5WyY=
X-Received: by 2002:a05:651c:50b:b0:2f9:cc40:6afe with SMTP id
 38308e7fff4ca-2fcbdfae574mr3209411fa.14.1729888345976; Fri, 25 Oct 2024
 13:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
In-Reply-To: <20241025191454.72616-4-ebiggers@kernel.org>
Date: Fri, 25 Oct 2024 22:32:14 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
Message-ID: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
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
 wrote: > > From: Eric Biggers <ebiggers@google.com> > > Make the CRC32 library
 export some flags that indicate which CRC32 > functions [...] 
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
X-Headers-End: 1t4Qz3-0004TD-ST
Subject: Re: [f2fs-dev] [PATCH v2 03/18] lib/crc32: expose whether the lib
 is really optimized at runtime
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
> Make the CRC32 library export some flags that indicate which CRC32
> functions are actually executing optimized code at runtime.  Set these
> correctly from the architectures that implement the CRC32 functions.
>
> This will be used to determine whether the crc32[c]-$arch shash
> algorithms should be registered in the crypto API.  btrfs could also
> start using these flags instead of the hack that it currently uses where
> it parses the crypto_shash_driver_name.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
>  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
>  include/linux/crc32.h        | 15 +++++++++++++++
>  lib/crc32.c                  |  5 +++++
>  4 files changed, 50 insertions(+)
>
...
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 58c632533b08..bf26d454b60d 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
>         if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                 return crc32c_le_arch(crc, p, len);
>         return crc32c_le_base(crc, p, len);
>  }
>
> +/*
> + * crc32_optimizations contains flags that indicate which CRC32 library
> + * functions are using architecture-specific optimizations.  Unlike
> + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> + * variants and also whether any needed CPU features are available at runtime.
> + */
> +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +extern u32 crc32_optimizations;
> +#else
> +#define crc32_optimizations 0
> +#endif
> +

Wouldn't it be cleaner to add a new library function for this, instead
of using a global variable?

>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
>   *                   sequences of bytes, seq1 and seq2 with lengths len1
>   *                   and len2, crc32_le() check values were calculated
>   *                   for each, crc1 and crc2.
> diff --git a/lib/crc32.c b/lib/crc32.c
> index 47151624332e..194de73f30f8 100644
> --- a/lib/crc32.c
> +++ b/lib/crc32.c
> @@ -336,5 +336,10 @@ u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
>  {
>         return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
>  }
>  #endif
>  EXPORT_SYMBOL(crc32_be_base);
> +
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +u32 crc32_optimizations;
> +EXPORT_SYMBOL(crc32_optimizations);
> +#endif
> --
> 2.47.0
>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
