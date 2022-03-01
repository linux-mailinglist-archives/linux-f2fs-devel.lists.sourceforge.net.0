Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C424C8ABD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 12:28:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nP0gR-0002mB-14; Tue, 01 Mar 2022 11:28:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>)
 id 1nP0g6-0002fp-OV; Tue, 01 Mar 2022 11:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLPvv7mVdDwWU3WqqHUc/M/t9o2wkfNNz2uUSA/i/Q0=; b=f5DKMODQ6dCW1ah9ZJT7vakdOL
 Z9oOAp4eOBKjljqXqV+wlChMRq+6FfuA1EHgZCaV7vubpi0YFwbx9QMWnlK+hxI4w4w8DrEeZaLE3
 IlA5hh2nrugXnp1kUeQeijy8EaRsZ1c/rMV0C7TkaSWagDwSwR4HBU/QG3z6RuaKDqoo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rLPvv7mVdDwWU3WqqHUc/M/t9o2wkfNNz2uUSA/i/Q0=; b=kI46Lx34b1y+YbOt+5skUxiAMp
 aSvOQjNvdCklhGRBN6u5TxSfr5pT+69Q4wElXjr9S1FSRQ69SOfDmA2MKd7HfVrUgJ9CFQhol/Sy3
 84p6/zGkfgGn8vdFGriXYJUVuzwnUw04qwXGjb/2IPgpG4strsvkC1BkWkvDb4GKHo3w=;
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nP0g4-001C3K-8D; Tue, 01 Mar 2022 11:28:25 +0000
Received: by mail-ej1-f54.google.com with SMTP id kt27so1740756ejb.0;
 Tue, 01 Mar 2022 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rLPvv7mVdDwWU3WqqHUc/M/t9o2wkfNNz2uUSA/i/Q0=;
 b=ioxwEWwSec2mkWoQpVaP+m+cuqfrILVMZy97DsxGJQFNwUj5vt0t9wo5G7myUpC8Gn
 ea9oHHWNkcI1g0+ETzPDSekL4muwhDYsG3jrD0dPjJWnH1vW4gUq2ufbL8yBIo9ax2rC
 LCc4peu3G2+oC3D/CoxTwxe0jKznErkS9hGO2cQ4rpTAmgLJ5M6BCvPaoqQObgiQcr6n
 RKDduahlScES6wicQqME3eGzY8GUno55Oqx2eUsC/sQVyrcKAkNt4/DW8JZWJd6l/Vwp
 mTTzA+edxLDCldwyXcUf3Jn0ErW39L5ba+PqRXF7jiU95w3jgcW/Rs/bUGAwA8mWZWkw
 L2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rLPvv7mVdDwWU3WqqHUc/M/t9o2wkfNNz2uUSA/i/Q0=;
 b=44J/WVUxSi8oQM8wnW69bqzaOS3/Oq4/vFyzykBjFd5hL5H+xeZIxdjNroG9y1gi0F
 xFQ6SS81yyuIJDaTokcptqofvmuU7UM160Wik4jt3w6mr97Da3XaDpT6eMuZx3ohCoSI
 aeBcv50Xd9rz7+1AtTNlfxgwt3QkKoewJyRkuOUHq6GgQBqFLB2sIfMiuKRz418GNTik
 +UBGyufbnhjZrOEZGPeSGbwYh4fLxcrjHnRFVeHh39WnKaG5VLMuPaRSaq5PQ072Znzo
 H+WRRiSJipYXQndN/2U1PPA9WeWbjOoqptpSffDXTQe4EiVMpfKbO2PFItp/TGqKBIUx
 J0/Q==
X-Gm-Message-State: AOAM530j9DyKKdOY+jUGoeBCZwmvZuNUpF07KM5sWaKkjoUDndul5j1M
 N14VyHv6b2fz1pf6lAplCSA=
X-Google-Smtp-Source: ABdhPJykJwlP+KqTh6zSzndCpDSZzE2bN4aLh28OSmyBBaWLei6TdHv4i/sMtFtkO4GxsNuXK9LBkw==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr18827008ejr.41.1646134097608; 
 Tue, 01 Mar 2022 03:28:17 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:6db3:8d4c:747e:98ad])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a50ff19000000b0040f84cd806csm7036870edu.59.2022.03.01.03.28.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Mar 2022 03:28:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
Date: Tue, 1 Mar 2022 12:28:15 +0100
Message-Id: <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 1. Mar 2022, at 01:41, Linus Torvalds wrote: > > On Mon,
 Feb 28, 2022 at 1:47 PM Jakob Koschel wrote: >> >> The goal of this is to
 get compiler warnings right? This would indeed be great. > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1nP0g4-001C3K-8D
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On 1. Mar 2022, at 01:41, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>> 
>> The goal of this is to get compiler warnings right? This would indeed be great.
> 
> Yes, so I don't mind having a one-time patch that has been gathered
> using some automated checker tool, but I don't think that works from a
> long-term maintenance perspective.
> 
> So if we have the basic rule being "don't use the loop iterator after
> the loop has finished, because it can cause all kinds of subtle
> issues", then in _addition_ to fixing the existing code paths that
> have this issue, I really would want to (a) get a compiler warning for
> future cases and (b) make it not actually _work_ for future cases.
> 
> Because otherwise it will just happen again.
> 
>> Changing the list_for_each_entry() macro first will break all of those cases
>> (e.g. the ones using 'list_entry_is_head()).
> 
> So I have no problems with breaking cases that we basically already
> have a patch for due to  your automated tool. There were certainly
> more than a handful, but it didn't look _too_ bad to just make the
> rule be "don't use the iterator after the loop".
> 
> Of course, that's just based on that patch of yours. Maybe there are a
> ton of other cases that your patch didn't change, because they didn't
> match your trigger case, so I may just be overly optimistic here.

Based on the coccinelle script there are ~480 cases that need fixing
in total. I'll now finish all of them and then split them by
submodules as Greg suggested and repost a patch set per submodule.
Sounds good?

> 
> But basically to _me_, the important part is that the end result is
> maintainable longer-term. I'm more than happy to have a one-time patch
> to fix a lot of dubious cases if we can then have clean rules going
> forward.
> 
>> I assumed it is better to fix those cases first and then have a simple
>> coccinelle script changing the macro + moving the iterator into the scope
>> of the macro.
> 
> So that had been another plan of mine, until I actually looked at
> changing the macro. In the one case I looked at, it was ugly beyond
> belief.
> 
> It turns out that just syntactically, it's really nice to give the
> type of the iterator from outside the way we do now. Yeah, it may be a
> bit odd, and maybe it's partly because I'm so used to the
> "list_for_each_list_entry()" syntax, but moving the type into the loop
> construct really made it nasty - either one very complex line, or
> having to split it over two lines which was even worse.
> 
> Maybe the place I looked at just happened to have a long typename, but
> it's basically always going to be a struct, so it's never a _simple_
> type. And it just looked very odd adn unnatural to have the type as
> one of the "arguments" to that list_for_each_entry() macro.
> 
> So yes, initially my idea had been to just move the iterator entirely
> inside the macro. But specifying the type got so ugly that I think
> that
> 
>        typeof (pos) pos
> 
> trick inside the macro really ends up giving us the best of all worlds:
> 
> (a) let's us keep the existing syntax and code for all the nice cases
> that did everything inside the loop anyway
> 
> (b) gives us a nice warning for any normal use-after-loop case
> (unless you explicitly initialized it like that
> sgx_mmu_notifier_release() function did for no good reason
> 
> (c) also guarantees that even if you don't get a warning,
> non-converted (or newly written) bad code won't actually _work_
> 
> so you end up getting the new rules without any ambiguity or mistaken
> 
>> With this you are no longer able to set the 'outer' pos within the list
>> iterator loop body or am I missing something?
> 
> Correct. Any assignment inside the loop will be entirely just to the
> local loop case. So any "break;" out of the loop will have to set
> another variable - like your updated patch did.
> 
>> I fail to see how this will make most of the changes in this
>> patch obsolete (if that was the intention).
> 
> I hope my explanation above clarifies my thinking: I do not dislike
> your patch, and in fact your patch is indeed required to make the new
> semantics work.

ok it's all clear now, thanks for clarifying.
I've defined all the 'tmp' iterator variables uninitialized so applying
your patch on top of that later will just give the nice compiler warning 
if they are used past the loop body.

> 
> What I disliked was always the maintainability of your patch - making
> the rules be something that isn't actually visible in the source code,
> and letting the old semantics still work as well as they ever did, and
> having to basically run some verification pass to find bad users.

Since this patch is not a complete list of cases that need fixing (30%)
I haven't included the actual change of moving the iterator variable
into the loop and thought that would be a second step coming after this
is merged.

With these changes alone, yes you still rely on manual verification passes.

> 
> (I also disliked your original patch that mixed up the "CPU
> speculation type safety" with the actual non-speculative problems, but
> that was another issue).
> 
>                Linus

- Jakob



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
