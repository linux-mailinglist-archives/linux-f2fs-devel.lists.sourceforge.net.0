Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8C64C9267
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 18:58:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nP6lM-0008Jb-8K; Tue, 01 Mar 2022 17:58:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <greg@kroah.com>)
 id 1nP6lJ-0008J6-Sy; Tue, 01 Mar 2022 17:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1b8nHfrBOcjPGYcB+Q6wr00uk1GmKX3v3ZNCnj2Fc4I=; b=T/DkjigdsdwUcaelD/iUVWc+HZ
 BVg7lejZlmenJ7V2hQfVSOAxZz5pDdT/Lx2VgyhohQmQ1HJhSfAIY3Y1iErVGYbThR+hA3KP+Qvw4
 zCBnJ/Hsf1jhcwjWQWRi0W32nFdmyQ4vAmWP4IxRiQjO0iUF2CgKvx6M7RyBRCOJP+Oo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1b8nHfrBOcjPGYcB+Q6wr00uk1GmKX3v3ZNCnj2Fc4I=; b=jPs1V71Ro0BVjXtuv0UYjAZFRs
 6n2FIytu5/Jn6Qo58X6DU8Fu/NxSVuHc9W44Xtvuyd0SoLR4ZhtrCcUYOuSwJWUCzxVfJOK3lKpsa
 YRZk5G5bvbFiSlkpXbgcU1600Tz7xj7DvMFa7LSXUndKR5N/UgY9l16UezEVpO5TXLLc=;
Received: from new3-smtp.messagingengine.com ([66.111.4.229])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nP6lH-0001MK-Qh; Tue, 01 Mar 2022 17:58:12 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1F34E5801D0;
 Tue,  1 Mar 2022 12:58:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 01 Mar 2022 12:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=1b8nHfrBOcjPGYcB+Q6wr00uk1GmKX3v3ZNCnj
 2Fc4I=; b=ZBUT+xBEPIHuw8jHImLNH+x52gankwE7MJd8sDFwnEoy45z1BwbhNh
 xKsOdQ1yD9u7q0d/6DIUtrg535wnOmT4Lvdd1apo2YuuhLLDVkYx1vSgNyoTE5fJ
 ofsW7j8uCMJyXK6Loz8rrLOzHyzxWsYiemruNwAl4gNUMe4M/NVtyIVhNAgsOfjy
 b/w/wzWa4VwoEUleGhkhNF3kRyKpQ3Usq/8Ca14buwUMr/k/0v+gPaqGXYzqUKuv
 KllGIGlPN88CAydfwqCLzM8aK7V+EiOvYiI4kF7OI9OB3TO949n6Hy8EMtjF8IqZ
 MBlpj07s0Rnbq4GNXj6M7/3IgLXdvpRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1b8nHfrBOcjPGYcB+
 Q6wr00uk1GmKX3v3ZNCnj2Fc4I=; b=EY31l7G2XfgL9rSC/gwvRf8zFgwtBT7xS
 zGIS7YVvo/KA/v9LCSJOIARDHfRqiRvn2gTz078tIpwk3oIxG21buWNUxNQmSUyy
 MyYKa/Xe0zh4/DCiQIRNMfBLOEXackhRaibWR2bFKht/sqIYkVYfZsf6JTqkc8aS
 N/+KxLe8dnTTbLIJQe4lQN4jxuybvA2M70S25Fv9b7VdN/aPfJftqSYQ4WVfyPqY
 0tbQrYevVZ6RBtubRdYtr3gnZBflyWFJSH5G+LkmECZ7pFmQ2xcqosvgp1dXRrwM
 GXM5n5s+pyNtUs5gG+ueV8296EmUoxyY6tuEcr0WZBCuK4oOvJTLg==
X-ME-Sender: <xms:rF4eYt_khXW9JUELKd3sbskivfb6p9VNYJ9HJTNdiVa20a5SzZwcHg>
 <xme:rF4eYhvpLP3jG67Y92AJSSlOEm5MH8cOme-q_WmBEiKHi2-d33bdpDbAgKuSlQzhv
 bEXTTYYFzUc5A>
X-ME-Received: <xmr:rF4eYrDa0WtfQIncLyLiGZ2_QzeJH36bSCyCi0g3L7auz9QrwNL4PuRbLUYhHGofRJvw4tCnLgWVuPYzt-8dyqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
 ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:rF4eYhep9_FqzdGryzLUlkyDm8oB4NZlyIpp5U2aPsiBO5Uc_pu1KA>
 <xmx:rF4eYiNt1Zd7p4zbskEHRd607PiISY-ihvHig6bYJF7awgzM4cA48A>
 <xmx:rF4eYjmGF931qz2wbkLW14iXG2GvWL_-CIczc4jJ1wtvDsjYWSRagQ>
 <xmx:rl4eYkl7_n3lofGsDcutmkSMBLsPYoIzfmJgc1TjOF9wAZv0ieQERQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 12:58:03 -0500 (EST)
Date: Tue, 1 Mar 2022 18:58:02 +0100
From: Greg KH <greg@kroah.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Message-ID: <Yh5eqmAv0P2nnSq0@kroah.com>
References: <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
 <Yh5ZmwiH5AxtQ69K@kroah.com>
 <4B1AFAD9-C1B3-499C-945A-C259361ABA8C@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B1AFAD9-C1B3-499C-945A-C259361ABA8C@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 01, 2022 at 06:40:04PM +0100,
 Jakob Koschel wrote:
 > > > > On 1. Mar 2022, at 18:36, Greg KH <greg@kroah.com> wrote: > > > >
 On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote: [...] 
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
X-Headers-End: 1nP6lH-0001MK-Qh
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

On Tue, Mar 01, 2022 at 06:40:04PM +0100, Jakob Koschel wrote:
> 
> 
> > On 1. Mar 2022, at 18:36, Greg KH <greg@kroah.com> wrote:
> > 
> > On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
> >> 
> >> 
> >>> On 1. Mar 2022, at 01:41, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >>> 
> >>> On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
> >>>> 
> >>>> The goal of this is to get compiler warnings right? This would indeed be great.
> >>> 
> >>> Yes, so I don't mind having a one-time patch that has been gathered
> >>> using some automated checker tool, but I don't think that works from a
> >>> long-term maintenance perspective.
> >>> 
> >>> So if we have the basic rule being "don't use the loop iterator after
> >>> the loop has finished, because it can cause all kinds of subtle
> >>> issues", then in _addition_ to fixing the existing code paths that
> >>> have this issue, I really would want to (a) get a compiler warning for
> >>> future cases and (b) make it not actually _work_ for future cases.
> >>> 
> >>> Because otherwise it will just happen again.
> >>> 
> >>>> Changing the list_for_each_entry() macro first will break all of those cases
> >>>> (e.g. the ones using 'list_entry_is_head()).
> >>> 
> >>> So I have no problems with breaking cases that we basically already
> >>> have a patch for due to  your automated tool. There were certainly
> >>> more than a handful, but it didn't look _too_ bad to just make the
> >>> rule be "don't use the iterator after the loop".
> >>> 
> >>> Of course, that's just based on that patch of yours. Maybe there are a
> >>> ton of other cases that your patch didn't change, because they didn't
> >>> match your trigger case, so I may just be overly optimistic here.
> >> 
> >> Based on the coccinelle script there are ~480 cases that need fixing
> >> in total. I'll now finish all of them and then split them by
> >> submodules as Greg suggested and repost a patch set per submodule.
> >> Sounds good?
> > 
> > Sounds good to me!
> > 
> > If you need help carving these up and maintaining them over time as
> > different subsystem maintainers accept/ignore them, just let me know.
> > Doing large patchsets like this can be tough without a lot of
> > experience.
> 
> Very much appreciated!
> 
> There will probably be some cases that do not match one of the pattern
> we already discussed and need separate attention.
> 
> I was planning to start with one subsystem and adjust the coming ones
> according to the feedback gather there instead of posting all of them
> in one go.

That seems wise.  Feel free to use USB as a testing ground for this if
you want to :)

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
