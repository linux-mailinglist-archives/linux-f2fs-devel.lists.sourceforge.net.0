Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A2AF93FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 15:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JP8a7lW1gKIwrOgSTBMcluhBAYSIC3UwKzpuc3WAoZo=; b=NQX5mk+CjgHjNuLilG2+JKhl38
	752kY0JstKeFqHPdQi+WMVgz7Ebz2ZnZxFs8B9yqzE8dPeeqgJOl35FXA33zZ249kIosrhg1eLKTD
	OiEUy78YEhdoGWW8dWUY/oAU6RpZi1Mp+BU0Wq5VSG4mTEsVyYJlNoCECNvsIkvRduLo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXgQM-0002YN-Uj;
	Fri, 04 Jul 2025 13:25:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1uXgQL-0002YF-Nc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 13:25:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/4PJJ0rEAULh4m+TKZWRgM/xnKTjh0RuaI15dFYpByM=; b=hmqjUNEHk0vV04bKOmviN/HvjU
 7PTq+Vh7YjRJj5XJDy4/+RYT+H01S8txgA+MTEK3h6GaisbYVkagv2ROYQfagyj46MZfZNRe4iBJT
 9lFjFdnMQJDLjWHxajH4vST45VWhfR1EkKZfkQBqUDY7y1jetSnsN58mmWo56xMUV0rY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/4PJJ0rEAULh4m+TKZWRgM/xnKTjh0RuaI15dFYpByM=; b=Rk6SM14HkMKDnuYbGMGpEot9Je
 wgrJpNnqZBE4hd8ZK/54wyRGhZ42iD3HqWPAWRvyRQeQIxC14Mxz0MVXqKCEgX04x8EJzZ/GhiGaR
 tDLJ0dS3CRBwyKfXCC9ja/rtiZ80UIb4ewe3tEPjk6E0p6ziDE7UwxDOOJk6N1iJEyWQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXgQK-0000L7-Px for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 13:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D52A46959
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Jul 2025 13:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA83C4CEEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Jul 2025 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751635547;
 bh=Y8/sWHcRSxGkxKgiBtjNuX2C63mDV7SS0hUAWMjYJOY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=muyfSRjuIvVRTg70xq54yTqu9FJUKwyaszdgBHgCcx4oPsNrBcvvcDrBLZ3FLv4RR
 HX+HlTz53471OSOmzwvtMXS1ZyQMbua09oChoTIm6o+URhv3hi2KBhm5GOj5RULLJQ
 bjWnrKhm+rL/JrnfaEzluOs0mCN+4kepE9BDp4fH63dbeluzgK44892EeE2Lw5YLyN
 VguTEzVDffn2rR3a17FLNzT8o3CV04DsEF5kJUdgBm586gvQJ6oQAHHPw5bkd0emZr
 53+V7JL6Q4vJfkUOknrs5xn0py9PSW7Uo2g9o4vrQl5mtU/l3SXtEM4UDUqM3f5T3h
 Dcn4S5iaHbFyw==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-32cd0dfbdb8so8045251fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jul 2025 06:25:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyuOD073axrLh60sHjObvYVCax0a7JCtFkVyoktdp1tSzqbAaiLxVFzBCqP4jnv00MW7HakCaHQsYoUNS1wtiD@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxy4BvTmBrJ1WmSutUOMjRRs6ITAmoeKo21uLuAbVOSZfWqe/1i
 mMXjNP+iJqViE4WODkb9bbao2zQjEw/AavT4/5haVezZuCGca7UDEurV7WMUwmndAhaSifkZd4t
 mbbP89snARP+4WKaN8uNX0zRUHJqoELM=
X-Google-Smtp-Source: AGHT+IFoY1+EMY6O6RmK1LK1SlxAShksDW8+PxvQamlUjFlpkc6F3nTevfk6TxZNIPcaGVoB230oztavB+XZZTYck5E=
X-Received: by 2002:a2e:a588:0:b0:32a:7122:58c9 with SMTP id
 38308e7fff4ca-32f00c66105mr5773971fa.5.1751635545535; Fri, 04 Jul 2025
 06:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250704070322.20692-1-ebiggers@kernel.org>
In-Reply-To: <20250704070322.20692-1-ebiggers@kernel.org>
Date: Fri, 4 Jul 2025 15:25:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXH--PGu1C64TRas0uhGPd-k3TV+zcd0pounq0nL+5006g@mail.gmail.com>
X-Gm-Features: Ac12FXylxqX3zFyXgbJAJUz4PoF4aS3bOUyf4HgX6sQjHQi75Hz4zBECu8BcGpY
Message-ID: <CAMj1kXH--PGu1C64TRas0uhGPd-k3TV+zcd0pounq0nL+5006g@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 4 Jul 2025 at 09:05,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > Make fscrypt no longer use Crypto API drivers for non-inline crypto
 > engines, even when the Crypto API prioritizes them over [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uXgQK-0000L7-Px
Subject: Re: [f2fs-dev] [PATCH v3] fscrypt: Don't use problematic non-inline
 crypto engines
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 4 Jul 2025 at 09:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Make fscrypt no longer use Crypto API drivers for non-inline crypto
> engines, even when the Crypto API prioritizes them over CPU-based code
> (which unfortunately it often does).  These drivers tend to be really
> problematic, especially for fscrypt's workload.  This commit has no
> effect on inline crypto engines, which are different and do work well.
>
> Specifically, exclude drivers that have CRYPTO_ALG_KERN_DRIVER_ONLY or
> CRYPTO_ALG_ALLOCATES_MEMORY set.  (Later, CRYPTO_ALG_ASYNC should be
> excluded too.  That's omitted for now to keep this commit backportable,
> since until recently some CPU-based code had CRYPTO_ALG_ASYNC set.)
>
> There are two major issues with these drivers: bugs and performance.
>
> First, these drivers tend to be buggy.  They're fundamentally much more
> error-prone and harder to test than the CPU-based code.  They often
> don't get tested before kernel releases, and even if they do, the crypto
> self-tests don't properly test these drivers.  Released drivers have
> en/decrypted or hashed data incorrectly.  These bugs cause issues for
> fscrypt users who often didn't even want to use these drivers, e.g.:
>
> - https://github.com/google/fscryptctl/issues/32
> - https://github.com/google/fscryptctl/issues/9
> - https://lore.kernel.org/r/PH0PR02MB731916ECDB6C613665863B6CFFAA2@PH0PR02MB7319.namprd02.prod.outlook.com
>
> These drivers have also similarly caused issues for dm-crypt users,
> including data corruption and deadlocks.  Since Linux v5.10, dm-crypt
> has disabled most of them by excluding CRYPTO_ALG_ALLOCATES_MEMORY.
>
> Second, these drivers tend to be *much* slower than the CPU-based code.
> This may seem counterintuitive, but benchmarks clearly show it.  There's
> a *lot* of overhead associated with going to a hardware driver, off the
> CPU, and back again.  To prove this, I gathered as many systems with
> this type of crypto engine as I could, and I measured synchronous
> encryption of 4096-byte messages (which matches fscrypt's workload):
>
> Intel Emerald Rapids server:
>    AES-256-XTS:
>       xts-aes-vaes-avx512   16171 MB/s  [CPU-based, Vector AES]
>       qat_aes_xts             289 MB/s  [Offload, Intel QuickAssist]
>
> Qualcomm SM8650 HDK:
>    AES-256-XTS:
>       xts-aes-ce             4301 MB/s  [CPU-based, ARMv8 Crypto Extensions]
>       xts-aes-qce              73 MB/s  [Offload, Qualcomm Crypto Engine]
>
> i.MX 8M Nano LPDDR4 EVK:
>    AES-256-XTS:
>       xts-aes-ce              647 MB/s   [CPU-based, ARMv8 Crypto Extensions]
>       xts(ecb-aes-caam)        20 MB/s   [Offload, CAAM]
>    AES-128-CBC-ESSIV:
>       essiv(cbc-aes-caam,sha256-lib) 23 MB/s   [Offload, CAAM]
>
> STM32MP157F-DK2:
>    AES-256-XTS:
>       xts-aes-neonbs         13.2 MB/s   [CPU-based, ARM NEON]
>       xts(stm32-ecb-aes)     3.1 MB/s    [Offload, STM32 crypto engine]
>    AES-128-CBC-ESSIV:
>       essiv(cbc-aes-neonbs,sha256-lib)
>                              14.7 MB/s   [CPU-based, ARM NEON]
>       essiv(stm32-cbc-aes,sha256-lib)
>                              3.2 MB/s    [Offload, STM32 crypto engine]
>    Adiantum:
>       adiantum(xchacha12-arm,aes-arm,nhpoly1305-neon)
>                              52.8 MB/s   [CPU-based, ARM scalar + NEON]
>
> So, there was no case in which the crypto engine was even *close* to
> being faster.  On the first three, which have AES instructions in the
> CPU, the CPU was 30 to 55 times faster (!).  Even on STM32MP157F-DK2
> which has a Cortex-A7 CPU that doesn't have AES instructions, AES was
> over 4 times faster on the CPU.  And Adiantum encryption, which is what
> actually should be used on CPUs like that, was over 17 times faster.
>
> Other justifications that have been given for these non-inline crypto
> engines (almost always coming from the hardware vendors, not actual
> users) don't seem very plausible either:
>
>   - The crypto engine throughput could be improved by processing
>     multiple requests concurrently.  Currently irrelevant to fscrypt,
>     since it doesn't do that.  This would also be complex, and unhelpful
>     in many cases.  2 of the 4 engines I tested even had only one queue.
>
>   - Some of the engines, e.g. STM32, support hardware keys.  Also
>     currently irrelevant to fscrypt, since it doesn't support these.
>     Interestingly, the STM32 driver itself doesn't support this either.
>
>   - Free up CPU for other tasks and/or reduce energy usage.  Not very
>     plausible considering the "short" message length, driver overhead,
>     and scheduling overhead.  There's just very little time for the CPU
>     to do something else like run another task or enter low-power state,
>     before the message finishes and it's time to process the next one.
>
>   - Some of these engines resist power analysis and electromagnetic
>     attacks, while the CPU-based crypto generally does not.  In theory,
>     this sounds great.  In practice, if this benefit requires the use of
>     an off-CPU offload that massively regresses performance and has a
>     low-quality, buggy driver, the price for this hardening (which is
>     not relevant to most fscrypt users, and tends to be incomplete) is
>     just too high.  Inline crypto engines are much more promising here,
>     as are on-CPU solutions like RISC-V High Assurance Cryptography.
>
> Fixes: b30ab0e03407 ("ext4 crypto: add ext4 encryption facilities")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> ---
>
> Changed in v3:
> - Further improved the commit message and comment.  Added data for
>   STM32MP157F-DK2 and i.MX 8M Nano LPDDR4 EVK.
> - Updated fscrypt.rst
>
> Changed in v2:
> - Improved commit message and comment
> - Dropped CRYPTO_ALG_ASYNC from the mask, to make this patch
>   backport-friendly
> - Added Fixes and Cc stable
>
>  Documentation/filesystems/fscrypt.rst | 37 +++++++++++----------------
>  fs/crypto/fscrypt_private.h           | 17 ++++++++++++
>  fs/crypto/hkdf.c                      |  2 +-
>  fs/crypto/keysetup.c                  |  3 ++-
>  fs/crypto/keysetup_v1.c               |  3 ++-
>  5 files changed, 37 insertions(+), 25 deletions(-)
>
> diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> index 29e84d125e02..4a3e844b790c 100644
> --- a/Documentation/filesystems/fscrypt.rst
> +++ b/Documentation/filesystems/fscrypt.rst
> @@ -145,13 +145,12 @@ However, these ioctls have some limitations:
>    caches are freed but not wiped.  Therefore, portions thereof may be
>    recoverable from freed memory, even after the corresponding key(s)
>    were wiped.  To partially solve this, you can add init_on_free=1 to
>    your kernel command line.  However, this has a performance cost.
>
> -- Secret keys might still exist in CPU registers, in crypto
> -  accelerator hardware (if used by the crypto API to implement any of
> -  the algorithms), or in other places not explicitly considered here.
> +- Secret keys might still exist in CPU registers or in other places
> +  not explicitly considered here.
>
>  Full system compromise
>  ~~~~~~~~~~~~~~~~~~~~~~
>
>  An attacker who gains "root" access and/or the ability to execute
> @@ -404,13 +403,16 @@ of hardware acceleration for AES.  Adiantum is a wide-block cipher
>  that uses XChaCha12 and AES-256 as its underlying components.  Most of
>  the work is done by XChaCha12, which is much faster than AES when AES
>  acceleration is unavailable.  For more information about Adiantum, see
>  `the Adiantum paper <https://eprint.iacr.org/2018/720.pdf>`_.
>
> -The (AES-128-CBC-ESSIV, AES-128-CBC-CTS) pair exists only to support
> -systems whose only form of AES acceleration is an off-CPU crypto
> -accelerator such as CAAM or CESA that does not support XTS.
> +The (AES-128-CBC-ESSIV, AES-128-CBC-CTS) pair was added to try to
> +provide a more efficient option for systems that lack AES instructions
> +in the CPU but do have a non-inline crypto engine such as CAAM or CESA
> +that supports AES-CBC (and not AES-XTS).  This is deprecated.  It has
> +been shown that just doing AES on the CPU is actually faster.
> +Moreover, Adiantum is faster still and is recommended on such systems.
>
>  The remaining mode pairs are the "national pride ciphers":
>
>  - (SM4-XTS, SM4-CBC-CTS)
>
> @@ -1324,26 +1326,17 @@ that systems implementing a form of "verified boot" take advantage of
>  this by validating all top-level encryption policies prior to access.
>
>  Inline encryption support
>  =========================
>
> -By default, fscrypt uses the kernel crypto API for all cryptographic
> -operations (other than HKDF, which fscrypt partially implements
> -itself).  The kernel crypto API supports hardware crypto accelerators,
> -but only ones that work in the traditional way where all inputs and
> -outputs (e.g. plaintexts and ciphertexts) are in memory.  fscrypt can
> -take advantage of such hardware, but the traditional acceleration
> -model isn't particularly efficient and fscrypt hasn't been optimized
> -for it.
> -
> -Instead, many newer systems (especially mobile SoCs) have *inline
> -encryption hardware* that can encrypt/decrypt data while it is on its
> -way to/from the storage device.  Linux supports inline encryption
> -through a set of extensions to the block layer called *blk-crypto*.
> -blk-crypto allows filesystems to attach encryption contexts to bios
> -(I/O requests) to specify how the data will be encrypted or decrypted
> -in-line.  For more information about blk-crypto, see
> +Many newer systems (especially mobile SoCs) have *inline encryption
> +hardware* that can encrypt/decrypt data while it is on its way to/from
> +the storage device.  Linux supports inline encryption through a set of
> +extensions to the block layer called *blk-crypto*.  blk-crypto allows
> +filesystems to attach encryption contexts to bios (I/O requests) to
> +specify how the data will be encrypted or decrypted in-line.  For more
> +information about blk-crypto, see
>  :ref:`Documentation/block/inline-encryption.rst <inline_encryption>`.
>
>  On supported filesystems (currently ext4 and f2fs), fscrypt can use
>  blk-crypto instead of the kernel crypto API to encrypt/decrypt file
>  contents.  To enable this, set CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y in
> diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
> index c1d92074b65c..6e7164530a1e 100644
> --- a/fs/crypto/fscrypt_private.h
> +++ b/fs/crypto/fscrypt_private.h
> @@ -43,10 +43,27 @@
>   * hardware-wrapped keys has made it misleading as it's only for raw keys.
>   * Don't use it in kernel code; use one of the above constants instead.
>   */
>  #undef FSCRYPT_MAX_KEY_SIZE
>
> +/*
> + * This mask is passed as the third argument to the crypto_alloc_*() functions
> + * to prevent fscrypt from using the Crypto API drivers for non-inline crypto
> + * engines.  Those drivers have been problematic for fscrypt.  fscrypt users
> + * have reported hangs and even incorrect en/decryption with these drivers.
> + * Since going to the driver, off CPU, and back again is really slow, such
> + * drivers can be over 50 times slower than the CPU-based code for fscrypt's
> + * workload.  Even on platforms that lack AES instructions on the CPU, using the
> + * offloads has been shown to be slower, even staying with AES.  (Of course,
> + * Adiantum is faster still, and is the recommended option on such platforms...)
> + *
> + * Note that fscrypt also supports inline crypto engines.  Those don't use the
> + * Crypto API and work much better than the old-style (non-inline) engines.
> + */
> +#define FSCRYPT_CRYPTOAPI_MASK \
> +       (CRYPTO_ALG_ALLOCATES_MEMORY | CRYPTO_ALG_KERN_DRIVER_ONLY)
> +
>  #define FSCRYPT_CONTEXT_V1     1
>  #define FSCRYPT_CONTEXT_V2     2
>
>  /* Keep this in sync with include/uapi/linux/fscrypt.h */
>  #define FSCRYPT_MODE_MAX       FSCRYPT_MODE_AES_256_HCTR2
> diff --git a/fs/crypto/hkdf.c b/fs/crypto/hkdf.c
> index 0f3028adc9c7..5b9c21cfe2b4 100644
> --- a/fs/crypto/hkdf.c
> +++ b/fs/crypto/hkdf.c
> @@ -56,11 +56,11 @@ int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
>         struct crypto_shash *hmac_tfm;
>         static const u8 default_salt[HKDF_HASHLEN];
>         u8 prk[HKDF_HASHLEN];
>         int err;
>
> -       hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, 0);
> +       hmac_tfm = crypto_alloc_shash(HKDF_HMAC_ALG, 0, FSCRYPT_CRYPTOAPI_MASK);
>         if (IS_ERR(hmac_tfm)) {
>                 fscrypt_err(NULL, "Error allocating " HKDF_HMAC_ALG ": %ld",
>                             PTR_ERR(hmac_tfm));
>                 return PTR_ERR(hmac_tfm);
>         }
> diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
> index 0d71843af946..d8113a719697 100644
> --- a/fs/crypto/keysetup.c
> +++ b/fs/crypto/keysetup.c
> @@ -101,11 +101,12 @@ fscrypt_allocate_skcipher(struct fscrypt_mode *mode, const u8 *raw_key,
>                           const struct inode *inode)
>  {
>         struct crypto_skcipher *tfm;
>         int err;
>
> -       tfm = crypto_alloc_skcipher(mode->cipher_str, 0, 0);
> +       tfm = crypto_alloc_skcipher(mode->cipher_str, 0,
> +                                   FSCRYPT_CRYPTOAPI_MASK);
>         if (IS_ERR(tfm)) {
>                 if (PTR_ERR(tfm) == -ENOENT) {
>                         fscrypt_warn(inode,
>                                      "Missing crypto API support for %s (API name: \"%s\")",
>                                      mode->friendly_name, mode->cipher_str);
> diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
> index b70521c55132..158ceae8a5bc 100644
> --- a/fs/crypto/keysetup_v1.c
> +++ b/fs/crypto/keysetup_v1.c
> @@ -50,11 +50,12 @@ static int derive_key_aes(const u8 *master_key,
>  {
>         int res = 0;
>         struct skcipher_request *req = NULL;
>         DECLARE_CRYPTO_WAIT(wait);
>         struct scatterlist src_sg, dst_sg;
> -       struct crypto_skcipher *tfm = crypto_alloc_skcipher("ecb(aes)", 0, 0);
> +       struct crypto_skcipher *tfm =
> +               crypto_alloc_skcipher("ecb(aes)", 0, FSCRYPT_CRYPTOAPI_MASK);
>
>         if (IS_ERR(tfm)) {
>                 res = PTR_ERR(tfm);
>                 tfm = NULL;
>                 goto out;
>
> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> --
> 2.50.0
>
>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
