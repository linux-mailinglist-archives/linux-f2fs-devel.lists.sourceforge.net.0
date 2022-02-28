Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF384C7A34
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 21:22:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOmWt-0007me-Gz; Mon, 28 Feb 2022 20:21:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <torvalds@linuxfoundation.org>) id 1nOmWr-0007mY-VL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 20:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rhevy6fb5H45VxDHjLDNCxtPhjJ0u7uFLdfSx9pxlIs=; b=Cs+SR2GX0ehSq8soLrPI+CRGca
 GrniFisBnVhkNCNELygjAVzPUHo2eu9mYpWP/54/Ll1TRq/VhHFAzfsPPUcKzFRSYABnrW2WNYF+z
 mlcjiFqHePaZN1FXVkT17G4gvF91ipLe/vnmD+dp+ZkpleikkcwwC+Dn+W2muxf4HZeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rhevy6fb5H45VxDHjLDNCxtPhjJ0u7uFLdfSx9pxlIs=; b=VxZb9I4VKobaemUdN++0Uy7I1f
 jtPD5W80WdDzEZSBSnvjBUu9WIKNeQYZxTfqhkPepk54HV/LOgXATi0EUJyuwpglTKvbnW64w8HyL
 TXRZ3fbPw6JOOfVUPL4eGx+pj/3eScxuZQ+KLLxC78ypUWXrUFwYruIpenK/k9TVwW4Y=;
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nOmWo-000TYx-OG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 20:21:56 +0000
Received: by mail-ej1-f41.google.com with SMTP id gb39so27221626ejc.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Feb 2022 12:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rhevy6fb5H45VxDHjLDNCxtPhjJ0u7uFLdfSx9pxlIs=;
 b=SFiiDaskyFzzbW4jCoUqiJYglpNWscp1lwtLHE93w8dRI3h8eXZkrLgebAKqQfA9oZ
 haXikdZXvfEB810zRURGwChdn/CvMC8Q7Pab3hpE0iVI/nf3FVJvcryQMcC1uZhcoZUU
 P6IZH9h2w6s9V+B5fc5q6pR5l/tJkcQrm5JJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rhevy6fb5H45VxDHjLDNCxtPhjJ0u7uFLdfSx9pxlIs=;
 b=pAI78ke8eAD4GcTIpBTlCa5YY0FHW+Vj/yTA/ACq8IY8yXrr6B2CXSHrRkfqWzK0RC
 sc3RurRPpcKCE8sdjm2oPMar3Qo50tBOPCeeRW50go9AftYrjSUjn414PtGFaaOYa2SE
 j+15yxraO/tOhQaiF8NMHPhN6Lksmi8MaVLsx5tzz9FLzkaY0xc0p5h0o/8MvbVsenOj
 UkZmqxqHshfWTWuJpOQ85yQvq+6hZU8I2qygiN83nNPQqLmgZh/sHX+1QtjBKyBp3oBn
 HxSka9E1nThOEs/Sv0qkhGgapE8/USkWu+mgxjhkLXpw16ugdrnJsn0NK9s7lRklnZEU
 3tUQ==
X-Gm-Message-State: AOAM531sF+2DfPP4d2jDbhhqs9XNoKHCOlWjhwVtACWD3hMKiClZ5DfK
 pvLf9adjGulVszsIEHwqrcHIszrqPh1WJZc5sWs=
X-Google-Smtp-Source: ABdhPJzVawjNpNtDbS/J04wYV2k7c0vYhfzgRQtTfbCOUYC6FRF4OLv+l8jiLjgeDICJIlLZB15GfA==
X-Received: by 2002:a17:907:2bf7:b0:6cf:86bc:4e2e with SMTP id
 gv55-20020a1709072bf700b006cf86bc4e2emr16763815ejc.200.1646079708186; 
 Mon, 28 Feb 2022 12:21:48 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 n13-20020a1709062bcd00b006cf71d46a1csm4613497ejg.136.2022.02.28.12.21.47
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:21:47 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id j22so17178019wrb.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Feb 2022 12:21:47 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr15110351ljg.358.1646079300900; Mon, 28
 Feb 2022 12:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
In-Reply-To: <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:14:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
Message-ID: <CAHk-=wj27SZQ3kPTesBzkiGhe-mA3gOQqr_adt_bMFzmg1VNaA@mail.gmail.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 28,
 2022 at 12:10 PM Linus Torvalds <torvalds@linux-foundation.org>
 wrote: > > We can do > > typeof(pos) pos > > in the 'for ()' loop, and never
 use __iter at all. > > That means that insi [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.41 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nOmWo-000TYx-OG
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
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 28, 2022 at 12:10 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We can do
>
>         typeof(pos) pos
>
> in the 'for ()' loop, and never use __iter at all.
>
> That means that inside the for-loop, we use a _different_ 'pos' than outside.

The thing that makes me throw up in my mouth a bit is that in that

        typeof(pos) pos

the first 'pos' (that we use for just the typeof) is that outer-level
'pos', IOW it's a *different* 'pos' than the second 'pos' in that same
declaration that declares the inner level shadowing new 'pos'
variable.

If I was a compiler person, I would say "Linus, that thing is too ugly
to live", and I would hate it. I'm just hoping that even compiler
people say "that's *so* ugly it's almost beautiful".

Because it does seem to work. It's not pretty, but hey, it's not like
our headers are really ever be winning any beauty contests...

                Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
