Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF29B11C2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 23:38:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4S0a-0001C8-53;
	Fri, 25 Oct 2024 21:38:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t4S0Y-0001Bu-S2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 21:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=brjCYgcFGdH/pd/f/d70iIVu+Wxfm2XE3Qa70/tryVw=; b=jqZzmw+J1lsu3rmnmxR9dwh+iB
 2IQChJAOy/Tj+LjXoODkk5JmS/WOmzgBkNiG+oi4n4xNgwwNahBKXFlcHHxXNdzvidfEW8GQg9Lqt
 au6kmN9LVC7vsxZfRGR9R9MV+c2iJC9xrfiSfWO4P7FHiQ7ZklvnY55fNoyZSw8p0TV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=brjCYgcFGdH/pd/f/d70iIVu+Wxfm2XE3Qa70/tryVw=; b=CHImI7dYp1wSQewOQbBRwB+CMQ
 sFOyBQ0VcC8SraXyAxJdXVH434qPLE8if85B8dhDt8OnYgiEV9+CAhS6NHZqUw9/j3Onah7SBW4Pd
 EwLI+Zh/iW5+I3wAixpokQDp1X4crcxKJ04f106bkxawYXlU8aSyJX1/2wuIs4T4PoFA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4S0X-0003Ku-UN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 21:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC83FA45144
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 21:36:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C17FFC4CECC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 21:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729892278;
 bh=Q8vC22irZ2uA8WYYvmBwW1+2Pm2qVwYkLgdZ6/sItmw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X9TEdB8NtoLsaY6w4tD051jPTNAuoCaCbQQHkiIzKo7oiJT9AWcwt+FyzmJhovWAp
 2pb0msYmVONirDKwQIfh5V3wPV0dcbDz2pSpVcpHIdMk9tXuPDZ5e6Az8xORI991cm
 xqLA6sL3m9DoZGlSNnVohRg6luGL7923xAU3nr5tH7OjWBmXsAW7KgEF+MDVfsK2ne
 duqlO61GagzVxkZD2Axh5Nb172IRQrUPy3AWEhn1+6vZ+0EOpP8QflDhFwNd3ZyyP/
 h1jEpYwivxBADQX2gGh2Yha+akgPxJ0n7Q8ruu2ds379qCqEjs553wHkorArIKfS4N
 Vw2SZPUxwQngA==
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso39466501fa.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Oct 2024 14:37:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVF8nmYluPbLQoRCRxxzlEvHn61Zu8uGOnG4CVygPlBDbRF0lDq7tuI6S3QT4TQRK9eXYPYHg4fxKagyacN2oj2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy/oIJ2BEE0EAItSpHva82eZ6rxUZfjSG21EvupxqtOvqs1lcE8
 vHc2sUfIqHWuIOn3vJo1JfnkXviyidi7tJGBpOFJE9xyL+75RtN709HLbOu6tlVdpcXYjOvO4ep
 67aGhOljZ6CnSuBX1cBm4tD6ne7Q=
X-Google-Smtp-Source: AGHT+IEQWINSviRss911g3zsmM49RILDHJN+Ssrcrwx15J0k6BAeeRwcNFxqZbNLbvjIoCqISV0e2QKpM5PEk7ZnG3k=
X-Received: by 2002:a05:651c:b0d:b0:2fa:d604:e519 with SMTP id
 38308e7fff4ca-2fcbdf7db48mr5607491fa.11.1729892277115; Fri, 25 Oct 2024
 14:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-4-ebiggers@kernel.org>
 <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
 <20241025213243.GA2637569@google.com>
In-Reply-To: <20241025213243.GA2637569@google.com>
Date: Fri, 25 Oct 2024 23:37:45 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
Message-ID: <CAMj1kXHZy3yPvonS5ZVof0qa0V_Lxhv5Q7i1UVf5P6D3d+=KRw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 25 Oct 2024 at 23:32,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
 > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@ker [...] 
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
X-Headers-End: 1t4S0X-0003Ku-UN
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

On Fri, 25 Oct 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 10:32:14PM +0200, Ard Biesheuvel wrote:
> > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > From: Eric Biggers <ebiggers@google.com>
> > >
> > > Make the CRC32 library export some flags that indicate which CRC32
> > > functions are actually executing optimized code at runtime.  Set these
> > > correctly from the architectures that implement the CRC32 functions.
> > >
> > > This will be used to determine whether the crc32[c]-$arch shash
> > > algorithms should be registered in the crypto API.  btrfs could also
> > > start using these flags instead of the hack that it currently uses where
> > > it parses the crypto_shash_driver_name.
> > >
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > >  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
> > >  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
> > >  include/linux/crc32.h        | 15 +++++++++++++++
> > >  lib/crc32.c                  |  5 +++++
> > >  4 files changed, 50 insertions(+)
> > >
> > ...
> > > diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> > > index 58c632533b08..bf26d454b60d 100644
> > > --- a/include/linux/crc32.h
> > > +++ b/include/linux/crc32.h
> > > @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
> > >         if (IS_ENABLED(CONFIG_CRC32_ARCH))
> > >                 return crc32c_le_arch(crc, p, len);
> > >         return crc32c_le_base(crc, p, len);
> > >  }
> > >
> > > +/*
> > > + * crc32_optimizations contains flags that indicate which CRC32 library
> > > + * functions are using architecture-specific optimizations.  Unlike
> > > + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> > > + * variants and also whether any needed CPU features are available at runtime.
> > > + */
> > > +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> > > +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> > > +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> > > +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> > > +extern u32 crc32_optimizations;
> > > +#else
> > > +#define crc32_optimizations 0
> > > +#endif
> > > +
> >
> > Wouldn't it be cleaner to add a new library function for this, instead
> > of using a global variable?
>
> The architecture crc32 modules need to be able to write to this.  There could be
> a setter function and a getter function, but just using a variable is simpler.
>

If we just add 'u32 crc32_optimizations()', there is no need for those
modules to have init/exit hooks, the only thing they need to export is
this routine.

Or perhaps it could even be a static inline, with the right plumbing
of header files. At least on arm64,

static inline u32 crc32_optimizations() {
  if (!alternative_have_const_cap_likely(ARM64_HAS_CRC32))
    return 0;
  return CRC32_LE_OPTIMIZATION | CRC32_BE_OPTIMIZATION | CRC32C_OPTIMIZATION;
}

should be all we need.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
