Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F264C7F85
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 01:45:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOqdy-0008Fb-49; Tue, 01 Mar 2022 00:45:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <segher@kernel.crashing.org>)
 id 1nOqdv-0008F2-BY; Tue, 01 Mar 2022 00:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 Mime-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fF0KdNOD0SYiidqwuX5jPlXXH6R6EEEm7Sb7HXwHwrQ=; b=YhtUEPEQQUB9JLzvPCipfGaHuV
 L8PsrfB++eWxjCjeSoK9BAsH5RDvdNJAzlUsaaXKyCrrznFry0UnzfNZ4/jjSnLcarR/tn6KBsOJt
 Bt17dfPglcXZWg3AJRnSBaVhP+UU12hjQQh4Rg2y4JKyz8tXE/hyXuvS3Xu/Nw8gQ77E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:Mime-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fF0KdNOD0SYiidqwuX5jPlXXH6R6EEEm7Sb7HXwHwrQ=; b=K40zcnLxVVcy6+NUHpld+y0F84
 XbyN0qtwci2UXPtQpqbJwjIRSe3OM03GHs/f/rQ7TAgFbEFfPOTUsquBtXPqL0GIDTAS60Iif2ndX
 acyRxfQnAlofIbFdru9Q9+vwwxEb2ZQkb4raAX3z2BDU/bFtM6m/kZgN6iTbvkzS+J9g=;
Received: from gate.crashing.org ([63.228.1.57])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1nOqdr-000ep6-6L; Tue, 01 Mar 2022 00:45:29 +0000
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 2210V56x017328;
 Mon, 28 Feb 2022 18:31:05 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 2210V0er017322;
 Mon, 28 Feb 2022 18:31:00 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 28 Feb 2022 18:30:59 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Message-ID: <20220301003059.GE614@gate.crashing.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <7D0C2A5D-500E-4F38-AD0C-A76E132A390E@kernel.org>
 <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73fa82a20910c06784be2352a655acc59e9942ea.camel@HansenPartnership.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 28, 2022 at 05:28:58PM -0500, James Bottomley
 wrote: > On Mon, 2022-02-28 at 23:59 +0200, Mike Rapoport wrote: > > > > On
 February 28, 2022 10:42:53 PM GMT+02:00, James Bottomley < > > Jam [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOqdr-000ep6-6L
Subject: Re: [f2fs-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net,
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 dma <dmaengine@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 28, 2022 at 05:28:58PM -0500, James Bottomley wrote:
> On Mon, 2022-02-28 at 23:59 +0200, Mike Rapoport wrote:
> > =

> > On February 28, 2022 10:42:53 PM GMT+02:00, James Bottomley <
> > James.Bottomley@HansenPartnership.com> wrote:
> > > On Mon, 2022-02-28 at 21:07 +0100, Christian K=F6nig wrote:
> [...]
> > > > > I do wish we could actually poison the 'pos' value after the
> > > > > loop somehow - but clearly the "might be uninitialized" I was
> > > > > hoping for isn't the way to do it.
> > > > > =

> > > > > Anybody have any ideas?
> > > > =

> > > > I think we should look at the use cases why code is touching
> > > > (pos) after the loop.
> > > > =

> > > > Just from skimming over the patches to change this and experience
> > > > with the drivers/subsystems I help to maintain I think the
> > > > primary pattern looks something like this:
> > > > =

> > > > list_for_each_entry(entry, head, member) {
> > > >      if (some_condition_checking(entry))
> > > >          break;
> > > > }
> > > > do_something_with(entry);
> > > =

> > > Actually, we usually have a check to see if the loop found
> > > anything, but in that case it should something like
> > > =

> > > if (list_entry_is_head(entry, head, member)) {
> > >    return with error;
> > > }
> > > do_somethin_with(entry);
> > > =

> > > Suffice?  The list_entry_is_head() macro is designed to cope with
> > > the bogus entry on head problem.
> > =

> > Won't suffice because the end goal of this work is to limit scope of
> > entry only to loop. Hence the need for additional variable.
> =

> Well, yes, but my objection is more to the size of churn than the
> desire to do loop local.  I'm not even sure loop local is possible,
> because it's always annoyed me that for (int i =3D 0; ...  in C++ defines
> i in the outer scope not the loop scope, which is why I never use it.

In C its scope is the rest of the declaration and the entire loop, not
anything after it.  This was the same in C++98 already, btw (but in
pre-standard versions of C++ things were like you remember, yes, and it
was painful).


Segher


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
