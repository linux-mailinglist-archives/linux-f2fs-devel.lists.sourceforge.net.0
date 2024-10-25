Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 296869B11A4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 23:33:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4RvU-0001Mk-Hq;
	Fri, 25 Oct 2024 21:32:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t4RvT-0001MT-CO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 21:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ei0o2F0WAxmbHAc1v9cvoOiKkz6QVV2vp8sChbLZwww=; b=Ya/zWo3pkzCQAiP6FOpzGG0YaP
 I61oMfHk7Nc9ypLZdqfxgY0Yhh4SLb2CDC2MRQTheptKnnEsxhoZG9NAWNvsSIxw403MJVlgXTesM
 p/TpUm+ih0ydhxX3ZJ3oKnxjUacpPU5LBZ5/S/gyqGEjBhtih4ZcwQxeh4aD8MEURj2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ei0o2F0WAxmbHAc1v9cvoOiKkz6QVV2vp8sChbLZwww=; b=ICDBwDucHGILciOzyiOE+9oDhp
 etaOuf7opkhGibiPcskCo9AuX3ZilcJ+RGOCZdjL8ap85X7pBnOt1/dlnJecY42RyNh3+phl8EDlx
 D3l2dTbBID0ULTzlYMuH1Q828NPvX3BIfRwja6qAeAzd7vhSUYO8uf5FQl6mMawFlf2M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4RvT-0002l1-De for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 21:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E0DAF5C5B7A;
 Fri, 25 Oct 2024 21:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6D5C4CEC3;
 Fri, 25 Oct 2024 21:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729891964;
 bh=karHkl1P4MymVDmMVIm5W0oSGt8WGS2RI4WaZcDwTEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ui6KR0kdPRYlpScOp15X+unLeIAbNEI3oGX0lXMaIurlD0BJ0jl9m7sv68bFBvJ8X
 CgmQy4NmGULJhNReu42xHOOaMDZWh8rDiJMHw/GnKiiye07KV68euQMU+mVNPy6Dh5
 q+2Nla53/DZid3rdBbpBsYfaayka1Upsz7x35RnBCM/7/4Qef0Iy4By75QnYsA9YNP
 PwOXPfwaV3rNp69SYU+sRoFrITlEHpzt+P0+Cem8hn3H149Vz/ognobz0PrT4BXTc/
 bchtyRCSYWd93GuJXbMaRcdctbFVLfRi2xAODovc57JIf5w8iiwde7M2cD6qqrEeer
 AmGpk7Tij3AcQ==
Date: Fri, 25 Oct 2024 21:32:43 +0000
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20241025213243.GA2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 25, 2024 at 10:32:14PM +0200,
 Ard Biesheuvel wrote:
 > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
 > > > > From: Eric Biggers <ebiggers@google.com> > > > > Make [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1t4RvT-0002l1-De
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
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

On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Make the CRC32 library export some flags that indicate which CRC32
> > functions are actually executing optimized code at runtime.  Set these
> > correctly from the architectures that implement the CRC32 functions.
> >
> > This will be used to determine whether the crc32[c]-$arch shash
> > algorithms should be registered in the crypto API.  btrfs could also
> > start using these flags instead of the hack that it currently uses where
> > it parses the crypto_shash_driver_name.
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> >  include/linux/crc32.h        | 15 +++++++++++++++
> >  lib/crc32.c                  |  5 +++++
> >  4 files changed, 50 insertions(+)
> >
> ...
> > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > index 58c632533b08..bf26d454b60d 100644
> > --- a/include/linux/crc32.h
> > +++ b/include/linux/crc32.h
> > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> >                 return crc32c_le_arch(crc, p, len);
> >         return crc32c_le_base(crc, p, len);
> >  }
> >
> > +/*
> > + * crc32_optimizations contains flags that indicate which CRC32 library
> > + * functions are using architecture-specific optimizations.  Unlike
> > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > + * variants and also whether any needed CPU features are available at runtime.
> > + */
> > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > +extern u32 crc32_optimizations;
> > +#else
> > +#define crc32_optimizations 0
> > +#endif
> > +
> 
> Wouldn't it be cleaner to add a new library function for this, instead
> of using a global variable?

The architecture crc32 modules need to be able to write to this.  There could be
a setter function and a getter function, but just using a variable is simpler.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
