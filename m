Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1189B1248
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Oct 2024 00:03:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4SOT-0006q8-Fe;
	Fri, 25 Oct 2024 22:02:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t4SOS-0006q2-Lx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qpkv/o79CY52uHe4bP0C2cz6jWIS3ZVo75haFMpKvB8=; b=hBWGJxYCifI2ikfOSNG7JzzX6z
 uVdiedmndwer37d5Auo1Nt+4+6zHA73lisDAjcIy0FH/Kx0XEyuhPk0IcImYgctLprz2+H2nn0fL9
 I8b9Zqtk4VzHpZm0UQP7hRAoGRu6ruEBqFMS5YvC06NILgdazG3czQhjf5OkzsmBsqiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qpkv/o79CY52uHe4bP0C2cz6jWIS3ZVo75haFMpKvB8=; b=TkdAJckeC5qFCWc56l1H1mz6yB
 HKpPChZRqWDAjrclJSiik+dqA6+yBwp5EyjYX4PGgsY2roTtP5AgTdkUtY2AsvLNRraZT9h5UIWdj
 Q8Nx3lbFRfCrBvMabohdHlt+XZ4xUyzYu3Kz1YLbJ69Xn/LvR6cw5oADhTNRxQhFKEkk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4SOR-0006Af-AV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 22:02:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCB6B5C5B7A;
 Fri, 25 Oct 2024 22:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 779EAC4CEC3;
 Fri, 25 Oct 2024 22:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729893760;
 bh=ehUyipyJYKOHtqA1xl/ASG6Px2MP+X3bw4HigUGDv+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nQ+Gvwdd9yysGsp0/7UPqj/qXd3zSzWYpyvhpi0++ZJ5oQTUKoSH0rAiYPTtQ9twV
 qkHDbr3AJhjxOl6A1njpP1LPsg5esbBqjAK0dw53bkgrilMNsjgC8+SWoctEzkofEe
 q5umojB4/VPj4s/EOR8drq3xpoD+hK70iS+el1oIMN7x3T4ma4ag8dWhGsBPuFPD08
 X7fDq4cuocWDtE6fuI3dssWTW6C4FHK/Nv0gXa6ZDOzj9d21s6umvhxfOdT6/qSJJk
 9Kfr57sbZvF4ubur0lRMtnU0gryP99paij167WI2Z/0vW9vxVu0blssafGUNty8k6B
 scwlea49za9xA==
Date: Fri, 25 Oct 2024 22:02:39 +0000
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20241025220239.GB2637569@google.com>
References: <20241025191454.72616-1-ebiggers@kernel.org>
 <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 25, 2024 at 10:47:15PM +0200,
 Ard Biesheuvel wrote:
 > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
 > > > > From: Eric Biggers <ebiggers@google.com> > > > > Inste [...] 
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
X-Headers-End: 1t4SOR-0006Af-AV
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > the arch-specific code was built, only register them when that code was
> > built *and* is not falling back to the base implementation at runtime.
> >
> > This avoids confusing users like btrfs which checks the shash driver
> > name to determine whether it is crc32c-generic.
> >
> 
> I think we agree that 'generic' specifically means a C implementation
> that is identical across all architectures, which is why I updated my
> patch to export -arch instead of wrapping the C code in yet another
> driver just for the fuzzing tests.
> 
> So why is this a problem? If no optimizations are available at
> runtime, crc32-arch and crc32-generic are interchangeable, and so it
> shouldn't matter whether you use one or the other.
> 
> You can infer from the driver name whether the C code is being used,
> not whether or not the implementation is 'fast', and the btrfs hack is
> already broken on arm64.
> 
> > (It would also make sense to change btrfs to test the crc32_optimization
> > flags itself, so that it doesn't have to use the weird hack of parsing
> > the driver name.  This change still makes sense either way though.)
> >
> 
> Indeed. That hack is very dubious and I'd be inclined just to ignore
> this. On x86 and arm64, it shouldn't make a difference, given that
> crc32-arch will be 'fast' in the vast majority of cases. On other
> architectures, btrfs may use the C implementation while assuming it is
> something faster, and if anyone actually notices the difference, we
> can work with the btrfs devs to do something more sensible here.

Yes, we probably could get away without this.  It's never really been
appropriate to use the crypto driver names for anything important.  And btrfs
probably should just assume CRC32C == fast unconditionally, like what it does
with xxHash64, or even do a quick benchmark to measure the actual speed of its
hash algorithm (which can also be sha256 or blake2b which can be very fast too).

Besides the btrfs case, my concern was there may be advice floating around about
checking /proc/crypto to check what optimized code is being used.  Having
crc32-$arch potentially be running the generic code would make that misleading.
It might make sense to keep it working similar to how it did before.

But I do agree that we could probably get away without this.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
