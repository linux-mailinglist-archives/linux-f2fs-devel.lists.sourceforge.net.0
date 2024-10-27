Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C03939B1C78
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 27 Oct 2024 09:15:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4yQX-0001GK-9w;
	Sun, 27 Oct 2024 08:15:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ardb@kernel.org>) id 1t4yQU-0001FP-N1
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Oct 2024 08:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LMk7TYTfiOGw1ZUTKaXXGsrR341gp20XheXlgdbWBCM=; b=F3Au0jo3hd1qseRG8LBxuem8o9
 gL/S4tFRz4wWPUvSdQ5p6iECAa4HOf/tcQwACCR+Xg0vMbtuDHGlXQmI3i66hL6W7unxBs8D2p38W
 H1m1dSNWT+EUgYCUEMkDnc/7CncgBVA5i3h50lwzhhWujHgkXwYEg2pw5PiZO8yaUyLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LMk7TYTfiOGw1ZUTKaXXGsrR341gp20XheXlgdbWBCM=; b=SmCbbN03IeL0qMYTHfNUGHX8/W
 F42X8eK9CXrhyFKyfHYOq6nzOosFxzzxthcVUeZ0NwDRqdG/+tlNTNBmYZ2cUwdXvKMSRismGvriD
 y6RsE/A7bfx47VSv3bQuEL8mZVOKCxMRwVw3YoULQvQexVGaBT+7hmccU8QPtzqXIRLk=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4yQU-0000Bn-EG for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 27 Oct 2024 08:15:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8D5DCA40C60
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 27 Oct 2024 08:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635ECC4CEC7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 27 Oct 2024 08:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730016895;
 bh=qSAev/CmbF0LEyj0tVSWN8qmCbJsiIZdku/WjaNmB8Q=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MZrpP4MR25ZJQaUjkXbWvdc5yqspOvJPpoP1laWGfu5qW0Bo5w7+sOKkNN0wFTFc6
 PKiAnBHnQLbmymCc6Ix2g32z3lrMLVbYBDbKHRK7wTcnhc0s7TmExnWPBavGFZA2CU
 ZxRZ2yQKLbZi954nmodxa3gz2r2765XCY13DTcc/5moZEI1Y5VMl2qOE1/CaCzYfBZ
 d0xolS/t0CNAWzjdhJc8/vC18yj/tzng9oiNhW1i1/DM5wimZSMibZgTJJr4RQf+Mz
 txNna8i6XM73z7TsjE2DyvvJtyQZu6VY2mWd8g1ZuHlsQxirw+6OUnQuLNMsd9yjTi
 Vo6meRtf3emmg==
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2fb443746b8so31468181fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 27 Oct 2024 01:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMA1YDZo5U6FhqD+s7EJpaZCrFCQKfvETQGcESOig4MRzrPeC6VE5cATyE6aGLS5MDxR/xBsoDXMYhZd1MgacB@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3fo7/2IXvDUQjCxjr06Dq+KAbPIGTetp/66TrIQSAEOLN2GDy
 PyqACZAGCtO9D8XBxVe9uf2oHXlRe6JAOoMCUIa53NemGkL5AVQyjNpMmQahwK8j9gO9cv0azFd
 xScSWutNEsp8hK2eWZwlxyZMBiMM=
X-Google-Smtp-Source: AGHT+IG7GbUAQTdcFb1Y8OjbqKjN3ralEO/b0dHGyoLDxr37yV7KwVs1ozIjCmGYYGFlqbwOihVt3NM/p1aqclI347g=
X-Received: by 2002:a2e:be9a:0:b0:2fb:58c0:de5b with SMTP id
 38308e7fff4ca-2fcbdfb098emr13787941fa.11.1730016893642; Sun, 27 Oct 2024
 01:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
 <20241025220239.GB2637569@google.com> <20241026040958.GA34351@sol.localdomain>
In-Reply-To: <20241026040958.GA34351@sol.localdomain>
Date: Sun, 27 Oct 2024 09:14:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 26 Oct 2024 at 06:10,
 Eric Biggers <ebiggers@kernel.org>
 wrote: > > On Fri, Oct 25, 2024 at 10:02:39PM +0000, Eric Biggers wrote:
 > > On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel w [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4yQU-0000Bn-EG
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

On Sat, 26 Oct 2024 at 06:10, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 10:02:39PM +0000, Eric Biggers wrote:
> > On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > > > the arch-specific code was built, only register them when that code was
> > > > built *and* is not falling back to the base implementation at runtime.
> > > >
> > > > This avoids confusing users like btrfs which checks the shash driver
> > > > name to determine whether it is crc32c-generic.
> > > >
> > >
> > > I think we agree that 'generic' specifically means a C implementation
> > > that is identical across all architectures, which is why I updated my
> > > patch to export -arch instead of wrapping the C code in yet another
> > > driver just for the fuzzing tests.
> > >
> > > So why is this a problem? If no optimizations are available at
> > > runtime, crc32-arch and crc32-generic are interchangeable, and so it
> > > shouldn't matter whether you use one or the other.
> > >
> > > You can infer from the driver name whether the C code is being used,
> > > not whether or not the implementation is 'fast', and the btrfs hack is
> > > already broken on arm64.
> > >
> > > > (It would also make sense to change btrfs to test the crc32_optimization
> > > > flags itself, so that it doesn't have to use the weird hack of parsing
> > > > the driver name.  This change still makes sense either way though.)
> > > >
> > >
> > > Indeed. That hack is very dubious and I'd be inclined just to ignore
> > > this. On x86 and arm64, it shouldn't make a difference, given that
> > > crc32-arch will be 'fast' in the vast majority of cases. On other
> > > architectures, btrfs may use the C implementation while assuming it is
> > > something faster, and if anyone actually notices the difference, we
> > > can work with the btrfs devs to do something more sensible here.
> >
> > Yes, we probably could get away without this.  It's never really been
> > appropriate to use the crypto driver names for anything important.  And btrfs
> > probably should just assume CRC32C == fast unconditionally, like what it does
> > with xxHash64, or even do a quick benchmark to measure the actual speed of its
> > hash algorithm (which can also be sha256 or blake2b which can be very fast too).
> >
> > Besides the btrfs case, my concern was there may be advice floating around about
> > checking /proc/crypto to check what optimized code is being used.  Having
> > crc32-$arch potentially be running the generic code would make that misleading.
> > It might make sense to keep it working similar to how it did before.
> >
> > But I do agree that we could probably get away without this.
>
> While testing this patchset I notice that none of the crypto API drivers for
> crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> system that uses those algorithms (such as ext4) just uses the library APIs now.
> That makes the "check /proc/crypto" trick stop working anyway.
>
> I think you're right that we shouldn't bother with patches 3-4, and I'll plan to
> go back to leaving them out in the next version, unless someone yells.
>

Agreed.

If we need to make this distinction, it might be cleaner to use the
static_call API instead, e.g.,

+DECLARE_STATIC_CALL(crc32_le_arch, crc32_le_base);
+
 static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
 {
        if (IS_ENABLED(CONFIG_CRC32_ARCH))
-               return crc32_le_arch(crc, p, len);
+               return static_call(crc32_le_arch)(crc, p, len);
        return crc32_le_base(crc, p, len);
 }

and use static_call_update() to update the target if the feature is
supported. Then, we could check in the driver whether the static call
points to the default or not:

+static bool have_arch;
+
 static int __init crc32_mod_init(void)
 {
+       have_arch = IS_ENABLED(CONFIG_CRC32_ARCH) &&
+                   static_call_query(crc32_le_arch) != crc32_le_base;
+
        /* register the arch flavor only if it differs from the generic one */
-       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+       return crypto_register_shashes(algs, 1 + have_arch);
 }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
