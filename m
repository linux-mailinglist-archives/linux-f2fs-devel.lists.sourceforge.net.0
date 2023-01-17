Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56566E766
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 21:06:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHsDy-0002Hm-NY;
	Tue, 17 Jan 2023 20:06:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1pHsDt-0002Hf-0d
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 20:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3xoeiV+nYOsKZ3P5r1QIbmJ251MgYmk7NsIx6imHg00=; b=UWu4qnNKnEPRUbiJmVZM/rU7Cl
 S7c7ZPDd0Yft/QElrqX7s+776Ph+JUSw30VQrHzcVdpeu2E7lWGFoXU7f8/XAnWDUpFWkH3gCmpga
 KAgpjpbm4Z0wijK/+rk3z2Donf2HoXrCpbiTMzsG2UgSelCTHA0F9EO3vj5fCkYc9iM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3xoeiV+nYOsKZ3P5r1QIbmJ251MgYmk7NsIx6imHg00=; b=cEoNzUcsXhepu23lyoZ6Fj7kqm
 LZotTn1PVh9oY32iRBMQSAj51b5ylIXBq+BFaUcjsl6XciwLfkL+bdnxrlZraGAHLfMyiqu3E6pNO
 sHSno7idsbt1CnllO7UQClekTDxXYdUbqimfWSWaFx/f3oM+igkvLZziXUoCRvPctcS4=;
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pHsDq-007BPJ-Cp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 20:06:20 +0000
Received: by mail-qt1-f180.google.com with SMTP id a25so21011217qto.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jan 2023 12:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3xoeiV+nYOsKZ3P5r1QIbmJ251MgYmk7NsIx6imHg00=;
 b=hHVQhBAoZhZWTbr+YuDnWh3rC/fn6QLxMasVYWi3ZeJtLbN1GnXKVwveVQKyyaGr8o
 3tj0hKW66zs9ff0ockr9uslO01hUuu60riWk57S1f8o/4jeOSLIS9z+S/HpAcz/1iHgT
 UzlDc0Fc+6pH2XmVphbuj2eVGlSX3E7F4Fcf30piugUJLPBj7YkfPhOL0GcY1/yq8gfd
 b9QB3GxNP5E9d9uXwGnN9F20C6pO54+aTS6r0Uitb3M+BX+bx0hnfT4CNP9mi9tBrEt3
 ERgQlD5EA1S9K8KaqQIGHm/KfSgobN6ao+KlN1ryN2ncug7NFqpYmVgbIrNfOG+ne0y0
 /8XA==
X-Gm-Message-State: AFqh2krJWKIvr/hUxjxZJr5KLIOymVJTpWA++K/5uK/XXr9a9ljWqu2W
 cUXKo8+XxrAxAt4nWDSLx3mb9t+7grHD8w==
X-Google-Smtp-Source: AMrXdXuu9fNAHou0oncOJY8A1JR+muUZA0LLYlMEPm2thuXda0x3kbtaTaozK2hdCzoakXjnlyHuPw==
X-Received: by 2002:a05:622a:114a:b0:3b6:3a7a:d3c8 with SMTP id
 f10-20020a05622a114a00b003b63a7ad3c8mr5916957qty.17.1673985972068; 
 Tue, 17 Jan 2023 12:06:12 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 ge9-20020a05622a5c8900b003a7e38055c9sm16460353qtb.63.2023.01.17.12.06.10
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 12:06:11 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 123so2342656ybv.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jan 2023 12:06:10 -0800 (PST)
X-Received: by 2002:a25:9012:0:b0:7b8:a0b8:f7ec with SMTP id
 s18-20020a259012000000b007b8a0b8f7ecmr700718ybl.36.1673985970579; Tue, 17 Jan
 2023 12:06:10 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
In-Reply-To: <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 21:05:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
Message-ID: <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Adrian, On Tue, Jan 17, 2023 at 6:06 PM John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de> wrote: > On 1/17/23 18:01, Geert
 Uytterhoeven wrote: > > The issue is that some of the parameters are not array
 [...] Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [geert.uytterhoeven[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1pHsDq-007BPJ-Cp
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
 linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Adrian,

On Tue, Jan 17, 2023 at 6:06 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/17/23 18:01, Geert Uytterhoeven wrote:
> > The issue is that some of the parameters are not arrays, but
> > NULL. E.g.:
> >
> > arch/sh/kernel/cpu/sh2/setup-sh7619.c:static
> > DECLARE_INTC_DESC(intc_desc, "sh7619", vectors, NULL,
> > arch/sh/kernel/cpu/sh2/setup-sh7619.c-                   NULL,
> > prio_registers, NULL);
>
> Isn't this supposed to be caught by this check:
>
>         a, __same_type(a, NULL)
>
> ?

Yeah, but gcc thinks it is smarter than us...
Probably it drops the test, assuming UB cannot happen.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
