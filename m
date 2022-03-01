Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE124C9245
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 18:56:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nP6j7-0004Qt-BR; Tue, 01 Mar 2022 17:55:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <greg@kroah.com>)
 id 1nP6j5-0004QQ-PR; Tue, 01 Mar 2022 17:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5OE8xr6GO9X7MbNpDAcWFGeEO3b3B/8LX5WMVM23luQ=; b=mJufLKVnDWl/g32AJT/YO7YRnv
 Y6R93GoHAHvdI+YFP9LYm5E4UYoY7UAdSO9srUo3yFDB5jvxrO09rOOq/Po+Y+HmN0Jf/zoKVq247
 g0OJ6YoFgmK/u54T1t0kw/rHKaTOjpwL5YHuTg3iPhjMlaoNLOdr+SYysQ2PrXUYB3SU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5OE8xr6GO9X7MbNpDAcWFGeEO3b3B/8LX5WMVM23luQ=; b=lxx+MzCae7zp466fV90UCs+AZG
 3r/O3NRs0gd05npu3wMO0XrZt6LJg3dgmFoH8WTAq7fovSz3eIkUxhg86NPsf8zCJNp9v/ReKqYgK
 ZvWZMk6t7sPBOJhopzals0WQEIv97M7z+bYo23FO25n55SLVD4B4C4T/DK1T3ookk8MU=;
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nP6j2-0001GP-FX; Tue, 01 Mar 2022 17:55:54 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 668835801CF;
 Tue,  1 Mar 2022 12:36:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 01 Mar 2022 12:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=5OE8xr6GO9X7MbNpDAcWFGeEO3b3B/8LX5WMVM
 23luQ=; b=PuP2NuoqB9WepsjY0Uqokte1F02OSePW/KnqWPOHGfC62jDMQy8d6J
 jihmHY7jaxPeYmV/brYSLMo2rdd0E65RFIbVZNaw+d6hF5TlV5h/HTFiyyQeuhEh
 tTvMohVc8vJzz2F3uGXDhJ11n60AMBcwryX0OIQ4h4vBoJz9sXnQjtTWmMBfJvV8
 ASNImP/JJmHc6aQngUkaR/9ejN6V67gkY3Ss3hOhMxZ05fa2rytR+8neryd7GnHR
 NnoILjHkJCXbghnuIwO3WAIr0wjFgm+H99CgrlgjXtrJoB87p0eZTz8QaQ9jXLS7
 eUmDU4ThQ2iD/GAcK9q8FPfYZ3dj5Siw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5OE8xr6GO9X7MbNpD
 AcWFGeEO3b3B/8LX5WMVM23luQ=; b=EDVGv6yEMy7PTbky8OfXVA9jYKh0oiM5+
 sk6xt1CX3smAZYI0P9oaKzOCIkwMemVmh9foKoLwOV/IyVUBTTJc+ljLrovpUDdP
 pIA4BCkMgcGpU96mM/8o9zjz4bY87GlxWmxlUETAhWUvR7QqjYOuAQqLjAz9vvM2
 9w41DE+muRcTBgXgq7R5mX2xPAK9bu7QEmldC6d/UhIWw84PgZEMMUkVZDfimvGr
 9rb1WTZ4HmbXffSgmjvpYAD0fz3a3kb/jxO9vzcKzkIUx9MDQUxolnVJ5gWPPm0P
 3SACLLdt3Ji3p4//lVUF9os4MIANF8EQiUgikZ8An4R/ZWSxaE7Og==
X-ME-Sender: <xms:oFkeYrv0LJt2Pjt0ZOYMYd1jCK6G-Z0GZXtRlOiCbijoVlbqDToesg>
 <xme:oFkeYsdRXoRXAxTjhPFWtM5JX8rU2-dsIwxZfpFocA89gDBFD4vx9xsWmcbxEuUyQ
 lpRakwPpYLi7A>
X-ME-Received: <xmr:oFkeYuzzdQb5kL72Vvj74Xn0xRRyhzff8uvNHTyUqFsrLF_56anw9-ykyIbZGqAzSj0KTqXLBgC1Qf0KKdPZ7IM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
 ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:oFkeYqNP0oPgoNRpau1EsmnsGvsi8MuHt5Oau7Uh5DcasQw65k9YTg>
 <xmx:oFkeYr8eoBRonSMDQgE0d2CdwAX12XsrowbLGxOxF_rvtS3YwiTEgg>
 <xmx:oFkeYqVNxx7WBcYUGhcHc73BR9KI7xEAuh9FjZrqFDwJGYsF_7MqUw>
 <xmx:olkeYkWtK93reuC1fg-f2X2RrUvR780eGtvCg6vOtajRgdiJ73bSmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 12:36:31 -0500 (EST)
Date: Tue, 1 Mar 2022 18:36:27 +0100
From: Greg KH <greg@kroah.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Message-ID: <Yh5ZmwiH5AxtQ69K@kroah.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 01, 2022 at 12:28:15PM +0100,
 Jakob Koschel wrote: > > > > On 1. Mar 2022, at 01:41,
 Linus Torvalds <torvalds@linux-foundation.org>
 wrote: > > > > On Mon, Feb 28, 2022 at 1:47 PM Jakob Kos [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [66.111.4.229 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nP6j2-0001GP-FX
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
> 
> 
> > On 1. Mar 2022, at 01:41, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> > 
> > On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
> >> 
> >> The goal of this is to get compiler warnings right? This would indeed be great.
> > 
> > Yes, so I don't mind having a one-time patch that has been gathered
> > using some automated checker tool, but I don't think that works from a
> > long-term maintenance perspective.
> > 
> > So if we have the basic rule being "don't use the loop iterator after
> > the loop has finished, because it can cause all kinds of subtle
> > issues", then in _addition_ to fixing the existing code paths that
> > have this issue, I really would want to (a) get a compiler warning for
> > future cases and (b) make it not actually _work_ for future cases.
> > 
> > Because otherwise it will just happen again.
> > 
> >> Changing the list_for_each_entry() macro first will break all of those cases
> >> (e.g. the ones using 'list_entry_is_head()).
> > 
> > So I have no problems with breaking cases that we basically already
> > have a patch for due to  your automated tool. There were certainly
> > more than a handful, but it didn't look _too_ bad to just make the
> > rule be "don't use the iterator after the loop".
> > 
> > Of course, that's just based on that patch of yours. Maybe there are a
> > ton of other cases that your patch didn't change, because they didn't
> > match your trigger case, so I may just be overly optimistic here.
> 
> Based on the coccinelle script there are ~480 cases that need fixing
> in total. I'll now finish all of them and then split them by
> submodules as Greg suggested and repost a patch set per submodule.
> Sounds good?

Sounds good to me!

If you need help carving these up and maintaining them over time as
different subsystem maintainers accept/ignore them, just let me know.
Doing large patchsets like this can be tough without a lot of
experience.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
