Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 107079BC986
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2024 10:48:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8GAS-0001YD-3d;
	Tue, 05 Nov 2024 09:48:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mpe@ellerman.id.au>) id 1t8GAR-0001Y5-LJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 09:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xG1HQhXTKL81M9467zhA4KonLLpV3fuL2upt5lJSShY=; b=kiBCnh9vvJ3eOgFc6ZCQogDc3n
 4caK60L3YadwwUeLQvnYWQoOt+9re1HNg/eipACpg+8oPTKtEhIz/WndsdH9uq8O607OSe/RNUweT
 Nlkn+SuL8XOP0ZoLdgjJO2bDqwesWolofOULoqwPW2cS63JaeHHP4Pdv2JYfGfOxi7gA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xG1HQhXTKL81M9467zhA4KonLLpV3fuL2upt5lJSShY=; b=ULATIP82StJ+mbTANyWsJEpTmx
 8MgeGMo2Fjqpa2qRrof9Nbl6hLuRPVaFH8lFXbIteyTQYmWAKz8wQvpGuc6Kh0sa3po0h36mlXM29
 nfIjLUJtb4nBJeOmrXukILUySSGf9jC0ZrY4D5+MXLXW5XHVIHjSeFoMQD+Q4lrWpazg=;
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t8GAP-0007Ue-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Nov 2024 09:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1730798571;
 bh=xG1HQhXTKL81M9467zhA4KonLLpV3fuL2upt5lJSShY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=abc102v8sCEc4rZgo2gcKLbXmwgvq4GWFHOVFO2bCqlfFdeKKcRV4prB0lNuFM+1J
 +nLMWJEv9C6S0GLYT8NTq4cofEwz+d0GOszV9URcE2cm6ZF5AylDoN/Z59rll0g/Oq
 7WsqGbok2W4NpvuKkzkrDPAQmPNPSM6PFvziT+2hwmqDnVmGWCUcte8UycWZO0fqBM
 8/j6kLdVKhMd+2mHPE+WS4RXiOWy1ZCSKS371LN4mAvJuEGSKgRrakUz5kUENSDU9q
 PGCTVxGOMH7TPanX3MVM/rMyBsqI05mZE6yiJdVSS0qPm3mWfbV8Bv8MQn/EFJHce9
 0DvIPNJTjgI8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XjNCv5y3Wz4wcl;
 Tue,  5 Nov 2024 20:22:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20241103223154.136127-9-ebiggers@kernel.org>
References: <20241103223154.136127-1-ebiggers@kernel.org>
 <20241103223154.136127-9-ebiggers@kernel.org>
Date: Tue, 05 Nov 2024 20:22:53 +1100
Message-ID: <87zfme826q.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Eric Biggers <ebiggers@kernel.org> writes: > From: Eric
 Biggers
 <ebiggers@google.com> > > Move the powerpc CRC32C assembly code into the
 lib directory and wire it > up to the library interface. This a [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [150.107.74.76 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t8GAP-0007Ue-Uf
Subject: Re: [f2fs-dev] [PATCH v3 08/18] powerpc/crc32: expose CRC32
 functions through lib
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric Biggers <ebiggers@kernel.org> writes:
> From: Eric Biggers <ebiggers@google.com>
>
> Move the powerpc CRC32C assembly code into the lib directory and wire it
> up to the library interface.  This allows it to be used without going
> through the crypto API.  It remains usable via the crypto API too via
> the shash algorithms that use the library interface.  Thus all the
> arch-specific "shash" code becomes unnecessary and is removed.
>
> Note: to see the diff from arch/powerpc/crypto/crc32c-vpmsum_glue.c to
> arch/powerpc/lib/crc32-glue.c, view this commit with 'git show -M10'.
>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/powerpc/Kconfig                          |   1 +
>  arch/powerpc/configs/powernv_defconfig        |   1 -
>  arch/powerpc/configs/ppc64_defconfig          |   1 -
>  arch/powerpc/crypto/Kconfig                   |  15 +-
>  arch/powerpc/crypto/Makefile                  |   2 -
>  arch/powerpc/crypto/crc32c-vpmsum_glue.c      | 173 ------------------
>  arch/powerpc/crypto/crct10dif-vpmsum_asm.S    |   2 +-
>  arch/powerpc/lib/Makefile                     |   3 +
>  arch/powerpc/lib/crc32-glue.c                 |  92 ++++++++++
>  .../{crypto => lib}/crc32-vpmsum_core.S       |   0
>  .../{crypto => lib}/crc32c-vpmsum_asm.S       |   0
>  11 files changed, 98 insertions(+), 192 deletions(-)
>  delete mode 100644 arch/powerpc/crypto/crc32c-vpmsum_glue.c
>  create mode 100644 arch/powerpc/lib/crc32-glue.c
>  rename arch/powerpc/{crypto => lib}/crc32-vpmsum_core.S (100%)
>  rename arch/powerpc/{crypto => lib}/crc32c-vpmsum_asm.S (100%)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

...
> deleted file mode 100644
> index 63760b7dbb76..000000000000
> --- a/arch/powerpc/crypto/crc32c-vpmsum_glue.c
> +++ /dev/null
> @@ -1,173 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -
...
> -static int __init crc32c_vpmsum_mod_init(void)
> -{
> -	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
> -		return -ENODEV;
> -
> -	return crypto_register_shash(&alg);
> -}
> -
> -static void __exit crc32c_vpmsum_mod_fini(void)
> -{
> -	crypto_unregister_shash(&alg);
> -}
> -
> -module_cpu_feature_match(PPC_MODULE_FEATURE_VEC_CRYPTO, crc32c_vpmsum_mod_init);
> -module_exit(crc32c_vpmsum_mod_fini);
> -
> -MODULE_AUTHOR("Anton Blanchard <anton@samba.org>");
> -MODULE_DESCRIPTION("CRC32C using vector polynomial multiply-sum instructions");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_CRYPTO("crc32c");
> -MODULE_ALIAS_CRYPTO("crc32c-vpmsum");
...
> new file mode 100644
> index 000000000000..e9730f028afb
> --- /dev/null
> +++ b/arch/powerpc/lib/crc32-glue.c
> @@ -0,0 +1,92 @@
> +// SPDX-License-Identifier: GPL-2.0-only
...
> +
> +static int __init crc32_powerpc_init(void)
> +{
> +	if (cpu_has_feature(CPU_FTR_ARCH_207S) &&
> +	    (cur_cpu_spec->cpu_user_features2 & PPC_FEATURE2_VEC_CRYPTO))
> +		static_branch_enable(&have_vec_crypto);

For any other reviewers, this looks like a new cpu feature check, but
it's not. In the old code there was a module feature check:

  module_cpu_feature_match(PPC_MODULE_FEATURE_VEC_CRYPTO, crc32c_vpmsum_mod_init);

And PPC_MODULE_FEATURE_VEC_CRYPTO maps to PPC_FEATURE2_VEC_CRYPTO, so
the logic is equivalent.

cheers


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
