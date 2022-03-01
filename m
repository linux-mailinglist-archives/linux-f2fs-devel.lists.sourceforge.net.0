Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2174C91F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Mar 2022 18:40:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nP6U3-0003qL-KB; Tue, 01 Mar 2022 17:40:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>)
 id 1nP6U0-0003pV-5A; Tue, 01 Mar 2022 17:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:References:Message-Id:Content-Transfer-Encoding:
 Cc:Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pFdYiycpncfTymiwtZowrsS5EyWiXpYxNs42/BHAfYg=; b=l0gQsZXzuqyn9+OboWMpl3G9b7
 bs71DR0dqkhSaRz0zjaDAhFGLjMD3FZqxyTzexo4zNAAhRy3pJEwoShTheWpRswYnaQkTi+plQUG5
 qOM0Tlv6kcFFX6TxLeuwWfKC69rxGEYRguTSfGuUCn+/5Yl0KI1lb5KtuWDJDjqE5tEM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:In-Reply-To:
 From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pFdYiycpncfTymiwtZowrsS5EyWiXpYxNs42/BHAfYg=; b=Z/Aaz+tI0dr5q8MbvAWuhjJS2S
 nD23e9vpMNNBGMz1XILO15L6gmVkM+81uc1PiNW5A9W89hHOFw8R0t/7y46eEjLxRJR12O32o+YdB
 BLZl3fooD7lgVS6/lfXLnGZKDYSz51WIwcCMgU1LpVGBWLuljyHef6PdQMGtMl4RKbJ8=;
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nP6Tt-001W9X-JH; Tue, 01 Mar 2022 17:40:18 +0000
Received: by mail-ej1-f50.google.com with SMTP id r13so32997747ejd.5;
 Tue, 01 Mar 2022 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pFdYiycpncfTymiwtZowrsS5EyWiXpYxNs42/BHAfYg=;
 b=jNa8kCMtl/UUGI9n6DMpRCjqu31f4wAijdvFFxZnjTmTKVAPvZHGvGIS5mEbyeVH7U
 2x/09r6Vjc5jlvMmGEJ/il9wQB7v0QaDJcbwnO54cttgXGRrRpdgplSbMXJLSVGPucZZ
 9N0BbQ67CEO0Sz9E19ATZ7SkTLFNHyfaTEafdxDnprAieU2S7WSxP1eMUqDcJyOgT3om
 KiVwLoBVmeYUr/3jVH1Ywgf3KLmBchJpZXF9NW4w0E+aOTUpi5SfsW8FSQSkfcXvzSp5
 ZeMWPQFNXAG0u+f0IIKFL+VZxclmrwVLcWvb/ml3Qc/gpz+jEOgbpY53v+25m0fIUJKc
 BDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=pFdYiycpncfTymiwtZowrsS5EyWiXpYxNs42/BHAfYg=;
 b=QhgT4+rVf5OQeMSVRZ2DR74IQdJTOqpB+w6554J1rlZzUa6Jiy0dKtL+qHiaKc5Rl/
 wxXc0GZrCg7KYUJ8pchGZm5Fa80zUTFUpmMs0emUV56+tAfGDGwyYmlWLnpT3PCOS3IT
 7MHduw1kjxnoXX9DvQwMjm3jCgrRXNKhgZMq93vp0viF867V+fgsDwYfMtSarI/IKK9Q
 UF6ohCP2W3IRoNBVw0HwlVbnlNgFFMN6qdHNZJL84Xqgkp0hICkHaoJ7UbF9RvmHxl1w
 Mh5vf3jjERnn9eicDQYh1YvJEO5HLzsMo7Oi0yC8Gg8CqjYIYTPQRW/YP/18pOXehH5j
 ZpwQ==
X-Gm-Message-State: AOAM531jQ1Ma7mfXVG+PGT0WIYSUysGNZgnxfA3fkp0SF12Ds3RBGUC7
 uJk7PwZRl+4RjY2VlCS7nxk=
X-Google-Smtp-Source: ABdhPJwzanGhehpmLWEMTTJkMBhYufoyhmHURG9yND716ZZIbM/kd8Ex5thBnsVmcSvoj9ZPyJ3fsw==
X-Received: by 2002:a17:906:948:b0:6d6:e479:1fe4 with SMTP id
 j8-20020a170906094800b006d6e4791fe4mr3312230ejd.240.1646156406993; 
 Tue, 01 Mar 2022 09:40:06 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:6db3:8d4c:747e:98ad])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a50ff19000000b0040f84cd806csm7398100edu.59.2022.03.01.09.40.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Mar 2022 09:40:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <Yh5ZmwiH5AxtQ69K@kroah.com>
Date: Tue, 1 Mar 2022 18:40:04 +0100
Message-Id: <4B1AFAD9-C1B3-499C-945A-C259361ABA8C@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <FC710A1A-524E-481B-A668-FC258F529A2E@gmail.com>
 <CAHk-=whLK11HyvpUtEftOjc3Gup2V77KpAQ2fycj3uai=qceHw@mail.gmail.com>
 <CEDAD0D9-56EE-4105-9107-72C2EAD940B0@gmail.com> <Yh5ZmwiH5AxtQ69K@kroah.com>
To: Greg KH <greg@kroah.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 1. Mar 2022, at 18:36, Greg KH wrote: > > On Tue, Mar
 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote: >> >> >>> On 1. Mar 2022,
 at 01:41, Linus Torvalds wrote: >>> >>> On Mon, Feb 28, 2022 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nP6Tt-001W9X-JH
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
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



> On 1. Mar 2022, at 18:36, Greg KH <greg@kroah.com> wrote:
> 
> On Tue, Mar 01, 2022 at 12:28:15PM +0100, Jakob Koschel wrote:
>> 
>> 
>>> On 1. Mar 2022, at 01:41, Linus Torvalds <torvalds@linux-foundation.org> wrote:
>>> 
>>> On Mon, Feb 28, 2022 at 1:47 PM Jakob Koschel <jakobkoschel@gmail.com> wrote:
>>>> 
>>>> The goal of this is to get compiler warnings right? This would indeed be great.
>>> 
>>> Yes, so I don't mind having a one-time patch that has been gathered
>>> using some automated checker tool, but I don't think that works from a
>>> long-term maintenance perspective.
>>> 
>>> So if we have the basic rule being "don't use the loop iterator after
>>> the loop has finished, because it can cause all kinds of subtle
>>> issues", then in _addition_ to fixing the existing code paths that
>>> have this issue, I really would want to (a) get a compiler warning for
>>> future cases and (b) make it not actually _work_ for future cases.
>>> 
>>> Because otherwise it will just happen again.
>>> 
>>>> Changing the list_for_each_entry() macro first will break all of those cases
>>>> (e.g. the ones using 'list_entry_is_head()).
>>> 
>>> So I have no problems with breaking cases that we basically already
>>> have a patch for due to  your automated tool. There were certainly
>>> more than a handful, but it didn't look _too_ bad to just make the
>>> rule be "don't use the iterator after the loop".
>>> 
>>> Of course, that's just based on that patch of yours. Maybe there are a
>>> ton of other cases that your patch didn't change, because they didn't
>>> match your trigger case, so I may just be overly optimistic here.
>> 
>> Based on the coccinelle script there are ~480 cases that need fixing
>> in total. I'll now finish all of them and then split them by
>> submodules as Greg suggested and repost a patch set per submodule.
>> Sounds good?
> 
> Sounds good to me!
> 
> If you need help carving these up and maintaining them over time as
> different subsystem maintainers accept/ignore them, just let me know.
> Doing large patchsets like this can be tough without a lot of
> experience.

Very much appreciated!

There will probably be some cases that do not match one of the pattern
we already discussed and need separate attention.

I was planning to start with one subsystem and adjust the coming ones
according to the feedback gather there instead of posting all of them
in one go.

> 
> thanks,
> 
> greg k-h

- Jakob

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
