Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F399B9F0A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 11:47:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7BfC-00018a-3s;
	Sat, 02 Nov 2024 10:47:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t7BfA-00018T-UP
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 10:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vV8yCMocDv/OPGrEgJmVudUgL/DOpRNs7uqcUGQkYYI=; b=FJUQBHPN6rFBKeC7NqMEocrXuW
 GMYl/xkhXqeeIsNma2Fi9kz0szXA+sKH3Fb9SUD5rmnKoXscAciLWdB6VMmj/9B7/DQBaK/mUiXd0
 8ngtlPmDeUeeoTvHvz2LFzQ5tKssn7uoud8ruqQY6jBbBWsauEjkbRB2mHND+Mg2J/o8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vV8yCMocDv/OPGrEgJmVudUgL/DOpRNs7uqcUGQkYYI=; b=C9EBuA222Co4XouRhIvk1MVB+6
 bX90YmDwFy6QfD+lnBIf3H1efLa2Xk/u70XxQWgYGmvlnpIgkmc8Aa+yAPp0CH3zYedrGlPD6P1lv
 P0K8xMTRJu6Z3/Lys/lV57Ve1zaFwnV7g77dri93m9tKPqFYUJbKaug/UeN+MnEp0fVM=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7BfA-0006bd-UU for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 10:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CF863A40432
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  2 Nov 2024 10:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C58C4CED4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  2 Nov 2024 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730544433;
 bh=M7FdSpu+PhluM81llzaa2KRxqj+jubQ2BPx4TOrWNTc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GETuJANeH7gctgmH/+nyiGbLZgU60kn5uvKaHdxC3jOHXyMIY+5SIP3FVcC5h/4vv
 2F7xHCEoHJS0lX3P7aD3ut8mIFSrFv0fHm6Op2JrumAUKGqrtpD0EWeTVv6BzOthLb
 cOPP8GebgckiemWtQdsi6mBWqLiYHzeSWyMzb1zENPEsHy5Xv2w9L9UtNhAaMFqePl
 DwhnDPyV/TgRCpycn4X3kpJ24lrXa/PI2ONFP7TokPIoc1Slpz4EGZ4aA86XjzMGou
 SSLprHHgimxQ0kP5J6bxA4m+lTjGXKTj+ngmbOktZM9E/03kahXIaRmHD6mbHIg0BX
 2ajJSBCd/ctBA==
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2fb584a8f81so25534211fa.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 Nov 2024 03:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZwFpFNE+iU1WU9mV9Jc64HsbbAA+Zx08FhXlVcOhY++L0aSxbsyUnUuB9MMFbWyRG/CNn1h7SrUOS3Ad+mgxE@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxQ10tIA+WLuK/8IXEnfT2OLDhypUofmy+yYpDk/FbEW6rTNiS4
 v8ISCPaFeeU771jo/fY6ztjM28j2dh+rv/3/lwsKuAIbb/Rt6Lzf4g0c2B8bzqiwdPDVcHEPy6k
 TUrh2p8x7bKlmY651Djc7g0Cu79M=
X-Google-Smtp-Source: AGHT+IH0WCZimX1F/VX+DWohj1qqHgkCvV1OEM1qu/eyPpSjntB2c2S/MHD4wvbHvrBfL9ia8YhfUT4VBcWPbilaETQ=
X-Received: by 2002:a05:651c:506:b0:2fb:4603:da13 with SMTP id
 38308e7fff4ca-2fcbe0989bfmr124544811fa.39.1730544432162; Sat, 02 Nov 2024
 03:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
In-Reply-To: <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
Date: Sat, 2 Nov 2024 11:46:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 2 Nov 2024 at 11:20,
 Herbert Xu <herbert@gondor.apana.org.au>
 wrote: > > On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
 > > > > At least btrfs supports a variety of checksums/ [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7BfA-0006bd-UU
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
 Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, 2 Nov 2024 at 11:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
> >
> > At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
> > sha) via the shash API.
>
> OK, given that btrfs is still doing this, I think we should still
> register crc32c-arch conditionally.  Having it point to crc32c-generic
> is just confusing (at least if you use btrfs).
>

Agreed. So we should take this patch.

The current issue with btrfs is that it will misidentify
crc32c-generic on arm64 as being 'slow', but this was already fixed by
my patches that are already in cryptodev.

On arm64, crc32 instructions are always available (the only known
micro-architecture that omitted them has been obsolete for years), and
on x86_64 the situation is similar in practice (introduced in SSE
4.2), and so this patch changes very little for the majority of btrfs
users.

But on architectures such as 32-bit ARM, where these instructions are
only available if you are booting a 32-bit kernel on a 64-bit CPU
(which is more common than you might think), this patch will ensure
that crc32-arm / crc32c-arm are only registered if the instructions
are actually available, and btrfs will take the slow async patch for
checksumming if they are not. (I seriously doubt that btrfs on 32-bit
ARM is a thing but who knows)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
