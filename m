Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8A6752DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 11:59:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIp7V-00049M-OM;
	Fri, 20 Jan 2023 10:59:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <segher@kernel.crashing.org>) id 1pIp7T-00049C-UV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 10:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 Mime-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S/EOSyVIrS5X23ODndRK0e19RWEfHBY5XhZ0AtnhW0A=; b=PhWQQEkRIx9Iw/mN84E9Lh/WA9
 mddjusM6ZmlEyCyPpO4SUc3UrtveM95sYJjPbvoFWj7BEpEpg9riBwtJENJFsJMrY2EJhw66I2YZL
 3Yq2vCKY2cNAmW4/3lCUeQGQxk2TBce6n7NjID7uy15b5YOLRe8KHF49BN9H18EUIOPc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:Mime-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S/EOSyVIrS5X23ODndRK0e19RWEfHBY5XhZ0AtnhW0A=; b=fvCA3FoMhxgO/iZ1CKMhpp9Gc2
 /pdXSFBkcmYwxdSSnuW5a4icytOiX6TZzvd4V3o1T/CEL4iKGHaKGKQf9QhHN7Z/FIpCPqYgj1+vO
 rALZ5GCGQgq2IBm+UBjKbQZorrNRKuHBVuXrpAF4z9xZlImLuXj8u3kDnoKDmLJi1uvc=;
Received: from gate.crashing.org ([63.228.1.57])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1pIp7Q-0001Ab-Dp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 10:59:38 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 30KArkBe026992;
 Fri, 20 Jan 2023 04:53:46 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 30KArgxi026991;
 Fri, 20 Jan 2023 04:53:42 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 20 Jan 2023 04:53:41 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rob Landley <rob@landley.net>
Message-ID: <20230120105341.GI25951@gate.crashing.org>
References: <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
 <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
 <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
 <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
 <0f51dac4-836b-0ff2-38c6-5521745c1c88@landley.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f51dac4-836b-0ff2-38c6-5521745c1c88@landley.net>
User-Agent: Mutt/1.4.2.3i
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jan 19, 2023 at 09:31:21PM -0600, Rob Landley wrote:
    > On 1/19/23 16:11, Michael.Karcher wrote: > > I don't see a clear bug at
    this point. We are talking about the C expression > > > >   __sam [...] 
 
 Content analysis details:   (-0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1pIp7Q-0001Ab-Dp
Subject: Re: [f2fs-dev] Calculating array sizes in C - was: Re: Build
 regressions/improvements in v6.2-rc1
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
Cc: linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-sh@vger.kernel.org, "Michael.Karcher" <Michael.Karcher@fu-berlin.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, kasan-dev@googlegroups.com,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 19, 2023 at 09:31:21PM -0600, Rob Landley wrote:
> On 1/19/23 16:11, Michael.Karcher wrote:
> > I don't see a clear bug at this point. We are talking about the C expre=
ssion
> > =

> >  =A0 __same_type((void*)0, (void*)0)? 0 : sizeof((void*)0)/sizeof(*((vo=
id*0))

(__same_type is a kernel macro, it expands to something with
__builtin_compatible_type()).

> *(void*) is type "void" which does not have a size.

It has size 1, in GCC, so that you can do arithmetic on pointers to
void.  This is a long-standing and very widely used GCC extension.

"""
6.24 Arithmetic on 'void'- and Function-Pointers
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

In GNU C, addition and subtraction operations are supported on pointers
to 'void' and on pointers to functions.  This is done by treating the
size of a 'void' or of a function as 1.

 A consequence of this is that 'sizeof' is also allowed on 'void' and on
function types, and returns 1.

 The option '-Wpointer-arith' requests a warning if these extensions are
used.
"""

> The problem is gcc "optimizing out" an earlier type check, the same way it
> "optimizes out" checks for signed integer math overflowing, or "optimizes=
 out" a
> comparison to pointers from two different local variables from different
> function calls trying to calculate the amount of stack used, or "optimize=
s out"

Are you saying something in the kernel code here is invalid code?
Because your other examples are.

> using char *x =3D (char *)1; as a flag value and then doing "if (!(x-1)) =
because
> it can "never happen"...

Like here.  And no, this is not allowed by -fno-strict-aliasing.

> > I suggest to file a bug against gcc complaining about a "spurious =

> > warning", and using "-Werror -Wno-error-sizeof-pointer-div" until gcc i=
s =

> > adapted to not emit the warning about the pointer division if the resul=
t =

> > is not used.

Yeah.  If the first operand of a conditional operator is non-zero, the
second operand is not evaluated, and if the first is zero, the third
operand is not evaluated.  It is better if we do not warn about
something we do not evaluate.  In cases like here where it is clear at
compile time which branch is taken, that shouldn't be too hard.

Can someone please file a GCC PR?  With reduced testcase preferably.


Segher


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
