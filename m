Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7824C7C75
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 22:47:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOnrg-0002KR-6N; Mon, 28 Feb 2022 21:47:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>)
 id 1nOnrT-0002Jk-T0; Mon, 28 Feb 2022 21:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=; b=Q/tieumxBfFoa+yhyidWrtcWvb
 Z/XiI7A5PAgRrLoPQ90k8fk/8xuzfY5YCNCrEcMPwAGYh2XuUr2PiXozTnpwsdieXEuSTCsuX9R53
 3OlVb1NcI4tkeTzOq0E8ljp5+Vm/p6BaP9FrDaqGy9CMMYfWo0SbFXiVo68eOb1q5kHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=; b=mDvZpTTNflDibiAN9ruZ9h6QuT
 WJ332WPijP+EEIAaWlbr9k9icub9VxqsIajhHi58H/NbMFVmRBn90bsS+3W8dY9bZPM5978uWFRxH
 LjqlPk3b8UvI/DFVKNaEWLtxSbABaAce0ElUxAaC5pV/GT0ywDhJvS1I80OdP63TZEcQ=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOnrK-00009l-Bj; Mon, 28 Feb 2022 21:47:12 +0000
Received: by mail-ed1-f54.google.com with SMTP id p4so4399911edi.1;
 Mon, 28 Feb 2022 13:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
 b=DcAOXNn/ViLnmA/Pl4xJfWkhBybquVghVb27ULjvzphMd1cBlP8EnT2avc3nlq8Ncp
 XU0OlwqVPcxmpQGfXIX8cDSYeDqzQFDIjUJw6vYkNcJJHsbpQaotozEaUyIGD250VuoD
 60I5wOFshLHgsaHS54p/JatmHLrrllGTo/egDJjxoeGmck3vK6ZaE0ldZN4szqLK845U
 BQNwjpOC8zhohOQR/VOEr6j/DtNOqZN6I6F48XJrq+10cNhH40s7WdjZ8f4gJpCeR9JY
 suF4D0bui+heOiMd0XjHUkKuJX/fj0a+j8l22tTUgDxT9LwW7gkDbHU26uOV2JCB+l1v
 aZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=U6qUODqKVLrC7qZqs553HfNOTdovwKFxE93drAu/Dlk=;
 b=4BXN5DwKb8RvvFdQsbvJ+xEYFyL45evqBHxUtafvXmbopZRUvR2fLwX6VReHqmxIQD
 2VjBqXawk2WYX9PRVG3wgtgt6dT4an2iP5vqRr29PAyXvKKIsX95aMwrgz9SwAOofkh4
 4bvc4UiCZ8I9w2wRe3EInDXMkdPsWRKxDqAMTY0OpQYJ8C20Ht5kqc53mpBKohXt+TbI
 11sGVajdKK+zqMsECh5dCVJXimkSCh48/ZQxBapkd1xlnhArx0TCBBwILKMPbmhMCPNF
 H1wcKGpYinJWxrlQ31WrYCvSgTLN3pQ+ul7zYVC/qVDYzTA4WyKvO1KoLhh4HvOr0qeS
 RHxA==
X-Gm-Message-State: AOAM5338C1TPb/hywKQF8nt6J0DzED8f5a7jloalN/C49+XSOCXWC0dC
 +78PFkE71lckESni9l4Fttk=
X-Google-Smtp-Source: ABdhPJxKG2ff16tCWsK6Ck3Y2a57p3q44AgnQUgUMRZ3ajKrFkwS/Wlp6PHXO9g9MP9OhOujc97TPw==
X-Received: by 2002:a05:6402:40d0:b0:412:f86a:efd1 with SMTP id
 z16-20020a05640240d000b00412f86aefd1mr21791110edb.194.1646084823834; 
 Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 ce7-20020a170906b24700b006cf095c2f5bsm4701847ejb.83.2022.02.28.13.47.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 13:47:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
Date: Mon, 28 Feb 2022 22:47:00 +0100
Message-Id: <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 28. Feb 2022, at 21:10, Linus Torvalds wrote: > > On
 Mon, Feb 28, 2022 at 12:03 PM Linus Torvalds > wrote: >> >> Side note: we
 do need *some* way to do it. > > Ooh. > > This patch is a work o [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.54 listed in list.dnswl.org]
X-Headers-End: 1nOnrK-00009l-Bj
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



> On 28. Feb 2022, at 21:10, Linus Torvalds <torvalds@linux-foundation.org> wrote:
> 
> On Mon, Feb 28, 2022 at 12:03 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> 
>> Side note: we do need *some* way to do it.
> 
> Ooh.
> 
> This patch is a work of art.
> 
> And I mean that in the worst possible way.
> 
> We can do
> 
>        typeof(pos) pos
> 
> in the 'for ()' loop, and never use __iter at all.
> 
> That means that inside the for-loop, we use a _different_ 'pos' than outside.
> 
> And then the compiler will not see some "might be uninitialized", but
> the outer 'pos' *will* be uninitialized.
> 
> Unless, of course, the outer 'pos' had that pointless explicit initializer.

The goal of this is to get compiler warnings right? This would indeed be great.

Changing the list_for_each_entry() macro first will break all of those cases
(e.g. the ones using 'list_entry_is_head()).
I assumed it is better to fix those cases first and then have a simple
coccinelle script changing the macro + moving the iterator into the scope
of the macro.

> 
> Here - can somebody poke holes in this "work of art" patch?

With this you are no longer able to set the 'outer' pos within the list
iterator loop body or am I missing something? Like this it stays
uninitialized but you'll probably want to set it from within the loop.

You would then yet again need a variable with another name to use
after the loop.

I fail to see how this will make most of the changes in this
patch obsolete (if that was the intention).

> 
>                     Linus
> <patch.diff>

- Jakob



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
