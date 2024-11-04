Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D05ED9BB1C7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 11:55:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7uk4-0000Ko-9N;
	Mon, 04 Nov 2024 10:55:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t7uk3-0000Kg-Au
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 10:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0y/BHzMpgtNQY/m9htna2CTEfpV1lk9uBvppiDVkNEE=; b=jU9cVgdsKz5tvO0hBZt9KDWsIM
 Imm7QDjFX61t459nro+niwvDBaxJ3+WoVPmcY5cpIcukf/lloWSlunI7ZUM8I5BdrnwBsfX+YRV92
 41wj1Es52Q65SU/TTBwqtx/Vg0nfEFGsuZP4MUqOab8nJgljaGUQYHThfY1bk+xEzVMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0y/BHzMpgtNQY/m9htna2CTEfpV1lk9uBvppiDVkNEE=; b=BPvPEh/QzYBx8wA1+HpDinfbxH
 EOhwvKqjvkZwR+DD4BvRXNCEOp9Exr1LPLdhYBFOvlYQoSGy9lgy6fSKu1jKYmGBsAe2lu0uOF9IP
 XlXnmElt5pNMt23n3Vg//rdfDSzSiowctrY9xDYJzMvK6kzEwea/1UTtFSLuey1Yl+94=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7uk3-00087i-7O for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 10:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 158695C54A6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Nov 2024 10:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB3FC4CED2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Nov 2024 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730717721;
 bh=Xsd60VaJMVJJJZwPYCiMbYDsq4aVLjYnOCS09bBiIXw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mluckDeMk6i5aN2XBOA1zfp0B5xurNz8wOuuO6UKYkZqld8M1vPhMjikatVUxYIq1
 o/o2n4QC5unxoa1BCq0QEJuuUGosOaiWVlAfms7oPabM1IPV7T5QCnjD432LtwU6jM
 qNyRNziXoq7Y5K909RLvlKf7uf+1MvZd6Ak8eCwV7pk3wdhybH+DxGdKIZqFxDiZgi
 /iQnjicc1WrBfd1q+/hj/6yterw6uw+CgPyujA3SNAenk3a2+tEKgLA1Q7vvvsnEYL
 Fa4fRc5HTw91i3Ikfsm6UaVHVMpdSHGkU3B2sp1paNLh1UwprUskCBwrZH7BP89RDz
 Po3mKNTx8CmzQ==
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb51e00c05so57266921fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Nov 2024 02:55:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVAeSaaZ8ZK5piBPT0vJpGmzEln85YHi2l0dbWC/sjz+33pTHeBnIY23CYI/LMBAg+ignwTmZT/igTLoTpwAA7e@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwIjD4Ri/AAwpVwi5OICP0bwz5MIKge6ZyLfjJ+yTY2YyR834vY
 7OGFSQotKQ9D0Y6U/YROIeUDFcEtdP5VthoOXkJCHJgp1e4UsSJBVFQnAkhCUs7nRnfetHzez7e
 vogC+QlTcZe5zp7t594zYWLMLtD8=
X-Google-Smtp-Source: AGHT+IFk0/CXdpRr9EA2xNrpgIcdFsD8CEdy30mzTFb0ZlXY/QnyWMuejDDml1MTkf5LmjGORWJ2C6sLEZMa+NCqqXc=
X-Received: by 2002:a2e:be9f:0:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-2fedb7c8904mr72976731fa.22.1730717719875; Mon, 04 Nov 2024
 02:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-4-ebiggers@kernel.org>
In-Reply-To: <20241103223154.136127-4-ebiggers@kernel.org>
Date: Mon, 4 Nov 2024 11:55:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXErAGvJ+ZK1SMQQKVbbZVhjxaWzn0gmV-xxtsoWSuwT9g@mail.gmail.com>
Message-ID: <CAMj1kXErAGvJ+ZK1SMQQKVbbZVhjxaWzn0gmV-xxtsoWSuwT9g@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, 3 Nov 2024 at 23:34,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > From: Eric Biggers <ebiggers@google.com> > > Make the CRC32 library
 export a function crc32_optimizations() which > returns f [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7uk3-00087i-7O
Subject: Re: [f2fs-dev] [PATCH v3 03/18] lib/crc32: expose whether the lib
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

On Sun, 3 Nov 2024 at 23:34, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Make the CRC32 library export a function crc32_optimizations() which
> returns flags that indicate which CRC32 functions are actually executing
> optimized code at runtime.
>
> This will be used to determine whether the crc32[c]-$arch shash
> algorithms should be registered in the crypto API.  btrfs could also
> start using these flags instead of the hack that it currently uses where
> it parses the crypto_shash_driver_name.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm64/lib/crc32-glue.c  | 10 ++++++++++
>  arch/riscv/lib/crc32-riscv.c | 10 ++++++++++
>  include/linux/crc32.h        | 15 +++++++++++++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
> index d7f6e1cbf0d2..15c4c9db573e 100644
> --- a/arch/arm64/lib/crc32-glue.c
> +++ b/arch/arm64/lib/crc32-glue.c
> @@ -83,7 +83,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
>
>         return crc32_be_arm64(crc, p, len);
>  }
>  EXPORT_SYMBOL(crc32_be_arch);
>
> +u32 crc32_optimizations(void)
> +{
> +       if (alternative_has_cap_likely(ARM64_HAS_CRC32))
> +               return CRC32_LE_OPTIMIZATION |
> +                      CRC32_BE_OPTIMIZATION |
> +                      CRC32C_OPTIMIZATION;
> +       return 0;
> +}
> +EXPORT_SYMBOL(crc32_optimizations);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
> diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
> index a3ff7db2a1ce..53d56ab422c7 100644
> --- a/arch/riscv/lib/crc32-riscv.c
> +++ b/arch/riscv/lib/crc32-riscv.c
> @@ -295,7 +295,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
>  legacy:
>         return crc32_be_base(crc, p, len);
>  }
>  EXPORT_SYMBOL(crc32_be_arch);
>
> +u32 crc32_optimizations(void)
> +{
> +       if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
> +               return CRC32_LE_OPTIMIZATION |
> +                      CRC32_BE_OPTIMIZATION |
> +                      CRC32C_OPTIMIZATION;
> +       return 0;
> +}
> +EXPORT_SYMBOL(crc32_optimizations);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 58c632533b08..e9bd40056687 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
>         if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                 return crc32c_le_arch(crc, p, len);
>         return crc32c_le_base(crc, p, len);
>  }
>
> +/*
> + * crc32_optimizations() returns flags that indicate which CRC32 library
> + * functions are using architecture-specific optimizations.  Unlike
> + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> + * variants and also whether any needed CPU features are available at runtime.
> + */
> +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +u32 crc32_optimizations(void);
> +#else
> +static inline u32 crc32_optimizations(void) { return 0; }
> +#endif
> +
>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
>   *                   sequences of bytes, seq1 and seq2 with lengths len1
>   *                   and len2, crc32_le() check values were calculated
>   *                   for each, crc1 and crc2.
> --
> 2.47.0
>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
