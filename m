Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521A9BA173
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 Nov 2024 17:36:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7H6m-000340-7e;
	Sat, 02 Nov 2024 16:36:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t7H6l-00033u-3V
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 16:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k39rYMoWjO6+nGMnJR7eYdIhWn0FMNGEl3Akb1BGe20=; b=LWSoLLO2hln1MBkhBbgRHgbEZ2
 uiUCo8coiNgkCPv0PI3n/xoCD/7VStSyTsLfBBWvuCPZwOa+hiI7gisQqlUqpZCATJfV070jf4aG+
 U9fMeNKxFASOQ3nXJiTQLjh5H5wbZXAQ/ucJJCtBDNbBY+ZGSXRxTGF5I0scNhAv2JPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k39rYMoWjO6+nGMnJR7eYdIhWn0FMNGEl3Akb1BGe20=; b=JweC95RzuCbvtS0a9rd84JaecE
 pnd231RakoFKqwS5gD6PDIC1heZftiYcIa+AKsZpCDZk4kCdHSub33sDSStA5nr1hA1J+LGn5/ApF
 KxrJ+cnIvOlc1GQwF2f4saNTzGmYJ6fdaOun3NamYhpitGz2hqrKFkUCjA4YcLYv12ik=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7H6j-00062y-To for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Nov 2024 16:36:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B9844A40E05;
 Sat,  2 Nov 2024 16:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFD1C4CEC3;
 Sat,  2 Nov 2024 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730565367;
 bh=efn4VpG7p6xFb/S4X3ANPIQCQKp6IXfEyCLH0VWZIIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KlpVtnzWd/zB5XmFf980RxtRY6lt695NC4d5DAQWzdJq8P9d/vTpUIa9uhRZxXlNg
 V1d2QzYc2hobwbFxK4fWDOeUmxR84BXOCx0bbPmSs0eqzXhWKKg5gbNDPcqLKd+ItV
 0pXNaQHtN/eHmbiDg0Z7SgO8wxZv7vCv329kh8IFtCEPWR/9ZVZ4PS1sF2pFzadm7O
 KR046MH/33qcHZt/KH+f3V2nu048roFu5R/+fD2mNhDgdzzAq87Tul2/R4s/yR1t+w
 9f2q8hLJXw4bMrhpexvm+tOdexgGWME42h9ZVxDY348o62nZnpHwJGFG+M9IE+WQFR
 2wSFp9BrXYOKQ==
Date: Sat, 2 Nov 2024 09:36:05 -0700
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <20241102163605.GA28213@sol.localdomain>
References: <20241026040958.GA34351@sol.localdomain>
 <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
 <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
 <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
 <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZyYIO6RpjTFteaxH@gondor.apana.org.au>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
 > On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote: > > > >
 The only issue resulting from *not* taking this patch is that btrf [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7H6j-00062y-To
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-mips@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-ext4@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 02, 2024 at 07:08:43PM +0800, Herbert Xu wrote:
> On Sat, Nov 02, 2024 at 12:05:01PM +0100, Ard Biesheuvel wrote:
> >
> > The only issue resulting from *not* taking this patch is that btrfs
> > may misidentify the CRC32 implementation as being 'slow' and take an
> > alternative code path, which does not necessarily result in worse
> > performance.
> 
> If we were removing crc32* (or at least crc32*-arch) from the Crypto
> API then these patches would be redundant.  But if we're keeping them
> because btrfs uses them then we should definitely make crc32*-arch
> do the right thing.  IOW they should not be registered if they're
> the same as crc32*-generic.
> 
> Thanks,

I would like to eventually remove crc32 and crc32c from the crypto API, but it
will take some time to get all the users converted.  If there are AF_ALG users
it could even be impossible, though the usual culprit, iwd, doesn't appear to
use any CRCs, so hopefully we are fine there.

I will plan to keep this patch, but change it to use a crc32_optimizations()
function instead which was Ard's first suggestion.

I don't think Ard's static_call suggestion would work as-is, since considering
the following:

    static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
    {
            if (IS_ENABLED(CONFIG_CRC32_ARCH))
                    return static_call(crc32_le_arch)(crc, p, len);
            return crc32_le_base(crc, p, len);
    }

... the 'static_call(crc32_le_arch)(crc, p, len)' will be inlined into every
user, which could be a loadable module which gets loaded after crc32-${arch}.ko.
And AFAIK, static calls in that module won't be updated in that case.

That could be avoided by making crc32_le() a non-inline function in lib/crc32.c,
so the static call would only be in that one place.  That has the slight
disadvantage that it would introduce an extra jump into the common case where
the optimized function is enabled.  Considering that some users are passing
small amounts of data into the CRC functions (e.g., 4 bytes), I would like to
minimize the overhead as much as possible.

It could also be avoided by making CRC32 and CRC32_ARCH bool rather than
tristate.  I would prefer not to do that, since there can be situations where
only loadable modules need these functions so they should not have to be built
into the core kernel.

So I plan to go with the crc32_optimizations() solution in v3.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
