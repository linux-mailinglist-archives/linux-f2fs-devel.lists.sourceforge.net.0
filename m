Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D49B12A2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Oct 2024 00:32:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4Sqk-0005Qb-Lj;
	Fri, 25 Oct 2024 22:32:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t4Sqj-0005QV-DA
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pmMrJRYzrtx0eulT7RJiLZMuZUhbX4LJa/Dc4U1fcrE=; b=XgWFjlxdofjcQoGnwTFy0OAWjw
 DcBM2FxCPzbqchpoaq8EyA7QoVIuowxHDgTGllRj6jmo8zoB5IxeTyWiYk2ZQpYiGYqQYvEjp4inF
 HImtcPXLv0iS37WkJu+9kQcUt07ovm42p061aCcS5dweFtCWw+lv2Yg7lUHgjyyE3Nbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pmMrJRYzrtx0eulT7RJiLZMuZUhbX4LJa/Dc4U1fcrE=; b=U+Ceycdygxm/rNNDuLD2GVHeOU
 2r1E/i+lJYFrUXDzPPQUBZVOJNKd3AYelnuPRhWYxVIVEQEEwNvffzTAqwZfDSArBBorbhmgX2yz5
 aZsKnJk6UWPw4mtJ5eqCcxFo6b2XT4q6LhCsSxDuZw6k74FImHMCx+4GC6zNzxJ24teM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4Sqi-0008ST-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D6DF5C51BA;
 Fri, 25 Oct 2024 22:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE278C4CEC3;
 Fri, 25 Oct 2024 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729895514;
 bh=mVLVxjwpOT42Kb7f4O3vXqKoUSnuXxrku5/kKxjIyIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=de2ooFjpzQqfyvs6eWpep/LU6bZMauqxFRrPPIOcoo6RLnaqtZhiBAtYfGHHWnscC
 dF2y5c896ibxWAiYOAVTj7IgcnlKP5L75BhK0Tc8wjgHsq9xSq4k1kTDEtU1VCVpVV
 KnGgdBnEQWIoO/2j34UM4IMNdYaajjOueVlox5Cf9Q4R746AKJSlNaQMSFchAMua3K
 xtNbR4CRre/5BmANz4U4u0zWkBsw0zpk3Hxas9iQsUUMtnzMnCcn+DJ54uFulKs2BJ
 SwTm/+DeTIx0AxPhIDiLCAroqEegH6HVTKiWTZ/RBPNhDys5MIq020g5RWnq0r3QWN
 +fqhDOV967kMA==
Date: Fri, 25 Oct 2024 22:31:52 +0000
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20241025223152.GC2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
 <20241025213243.GA2637569@google.com>
 <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 25, 2024 at 11:37:45PM +0200,
 Ard Biesheuvel wrote:
 > On Fri, 25 Oct 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
 > > > > On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuv [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4Sqi-0008ST-M3
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

On Fri, Oct 25, 2024 at 11:37:45PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Make the CRC32 library export some flags that indicate which CRC32
> > > > functions are actually executing optimized code at runtime.  Set these
> > > > correctly from the architectures that implement the CRC32 functions.
> > > >
> > > > This will be used to determine whether the crc32[c]-$arch shash
> > > > algorithms should be registered in the crypto API.  btrfs could also
> > > > start using these flags instead of the hack that it currently uses where
> > > > it parses the crypto_shash_driver_name.
> > > >
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> > > >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> > > >  include/linux/crc32.h        | 15 +++++++++++++++
> > > >  lib/crc32.c                  |  5 +++++
> > > >  4 files changed, 50 insertions(+)
> > > >
> > > ...
> > > > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > > > index 58c632533b08..bf26d454b60d 100644
> > > > --- a/include/linux/crc32.h
> > > > +++ b/include/linux/crc32.h
> > > > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> > > >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> > > >                 return crc32c_le_arch(crc, p, len);
> > > >         return crc32c_le_base(crc, p, len);
> > > >  }
> > > >
> > > > +/*
> > > > + * crc32_optimizations contains flags that indicate which CRC32 library
> > > > + * functions are using architecture-specific optimizations.  Unlike
> > > > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > > > + * variants and also whether any needed CPU features are available at runtime.
> > > > + */
> > > > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > > > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > > > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > > > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > > > +extern u32 crc32_optimizations;
> > > > +#else
> > > > +#define crc32_optimizations 0
> > > > +#endif
> > > > +
> > >
> > > Wouldn't it be cleaner to add a new library function for this, instead
> > > of using a global variable?
> >
> > The architecture crc32 modules need to be able to write to this.  There could be
> > a setter function and a getter function, but just using a variable is simpler.
> >
> 
> If we just add 'u32 crc32_optimizations()', there is no need for those
> modules to have init/exit hooks, the only thing they need to export is
> this routine.
> 
> Or perhaps it could even be a static inline, with the right plumbing
> of header files. At least on arm64,
> 
> static inline u32 crc32_optimizations() {
>   if (!alternative_have_const_cap_likely(ARM64_HAS_CRC32))
>     return 0;
>   return CRC32_LE_OPTIMIZATION | CRC32_BE_OPTIMIZATION | CRC32C_OPTIMIZATION;
> }
> 
> should be all we need.

In 7 of the 9 affected arches, I already have a module_init function that checks
the CPU features in order to set up static keys.  (arm64 and riscv already used
alternatives patching, so I kept that.)  It's slightly convenient to set these
flags at the same time, but yes the above solution would work too.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
