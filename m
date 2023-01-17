Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3AA66E453
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 18:02:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHpLi-0005mx-N3;
	Tue, 17 Jan 2023 17:02:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1pHpLg-0005mn-Jm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 17:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AG07rkufzJudbSBlfxWXzYs9DtgP7S33LaaSRTlg/Ec=; b=VVm7A0IynGfBFKVjfBr43Po3gc
 TqKl04KTvV6RWJ/+tOT5uT09HgYkvkhU6nww71NGuRR59h424Ec8RySOFjtJSj/YQHwSNY/a/6+1Z
 3CglN/EV5rGVxI6mIaoF9npetLT46eyQFYMsz5JGj2eOsmBWnbMA/qndIOxOZZ9aA0Bo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AG07rkufzJudbSBlfxWXzYs9DtgP7S33LaaSRTlg/Ec=; b=Jg6W90/cE2HUVXpcCZtKH0fDF0
 o/jdI+kZvPthbcKad9SaKcqfsCqFBOZEWiQLWAJbVfjeY30ROj6r4XWKbEsFR9cjt6MRmbVuR9hFb
 2GMjcRU/bJO1Os3bZSdMHy5BG36P0c5Fpq0JEn4hkduGNuNXv5bQkphPrx0HqpgnWOWs=;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pHpLe-0073BB-57 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 17:02:11 +0000
Received: by mail-oi1-f176.google.com with SMTP id r9so15660592oie.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jan 2023 09:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AG07rkufzJudbSBlfxWXzYs9DtgP7S33LaaSRTlg/Ec=;
 b=cuwjgT3f9J9QmVn55S/oNC0fDb9nkey31fE47CuSt2HEAopsZBq63SFS8idpMdmD7B
 D8qY6Y8VkdDgVyzN8yTmezf5bI45yNHCiLswomRpQkCQFEfpeaSuInk+5Jk6iY8Y/+Q+
 IgKiLDN4xZaeR+D3ZEaSqmSyFMRmB/X3aZ+cwzF41AvrNeWTcVwt9iwp4sbYzadLj28+
 dYRHLzgPC0oUWq+SHBIg39YO9Q46smE7jbvMZchPJkW4QOCmYWCN3w59ysjJOh1L5x+5
 NDyy0HAf81oPrRPM1ZC2M+exdHrAR84P/dSzYz/5uBDcSiCg+9ixaJ4965Te9xhcTkqR
 RwOw==
X-Gm-Message-State: AFqh2kqYSG3+p2s3tXK3bdHwOVwMbpGpjVEg4lC+LKFKN22HvpAZ5WDf
 gpo6RdYgmOKDEOrJ/YYFxn1TLgYuHJVkIQ==
X-Google-Smtp-Source: AMrXdXtWpqrNNg+f8C/I3+FgB0//ZxnrrCogjmaBVMdXOUuZLCwtImYp0v4Y4Z/gvlg3KhvbOQyrIA==
X-Received: by 2002:aca:b303:0:b0:363:ea5c:2c2f with SMTP id
 c3-20020acab303000000b00363ea5c2c2fmr1727353oif.18.1673974923458; 
 Tue, 17 Jan 2023 09:02:03 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 bs15-20020a05620a470f00b006b61b2cb1d2sm20699642qkb.46.2023.01.17.09.02.02
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 09:02:03 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 188so34800208ybi.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Jan 2023 09:02:02 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr418050ybg.202.1673974922451; Tue, 17
 Jan 2023 09:02:02 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
In-Reply-To: <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 18:01:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
Message-ID: <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Adrian, On Tue, Jan 17, 2023 at 5:42 PM John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de> wrote: > On 1/6/23 16:17,
 Geert Uytterhoeven
 wrote: > >> I'm not seeing this one, but I am getting this one ins [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.176 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [geert.uytterhoeven[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1pHpLe-0073BB-57
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Adrian,

On Tue, Jan 17, 2023 at 5:42 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/6/23 16:17, Geert Uytterhoeven wrote:
> >> I'm not seeing this one, but I am getting this one instead:
> >>
> >> In file included from ./arch/sh/include/asm/hw_irq.h:6,
> >>                    from ./include/linux/irq.h:596,
> >>                    from ./include/asm-generic/hardirq.h:17,
> >>                    from ./arch/sh/include/asm/hardirq.h:9,
> >>                    from ./include/linux/hardirq.h:11,
> >>                    from ./include/linux/interrupt.h:11,
> >>                    from ./include/linux/serial_core.h:13,
> >>                    from ./include/linux/serial_sci.h:6,
> >>                    from arch/sh/kernel/cpu/sh2/setup-sh7619.c:11:
> >> ./include/linux/sh_intc.h:100:63: error: division 'sizeof (void *) / sizeof (void)' does not compute the number of array elements [-Werror=sizeof-pointer-div]
> >>     100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
> >>         |                                                               ^
> >> ./include/linux/sh_intc.h:105:31: note: in expansion of macro '_INTC_ARRAY'
> >>     105 |         _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
> >>         |                               ^~~~~~~~~~~
> >
> > The easiest fix for the latter is to disable CONFIG_WERROR.
> > Unfortunately I don't know a simple solution to get rid of the warning.
>
> I did some research and it seems that what the macro _INT_ARRAY() does with "sizeof(a)/sizeof(*a)"
> is a commonly used way to calculate array sizes and the kernel has even its own macro for that
> called ARRAY_SIZE() which Linus asks people to use here [1].
>
> So, I replaced _INTC_ARRAY() with ARRAY_SIZE() (see below), however the kernel's own ARRAY_SIZE()
> macro triggers the same compiler warning. I'm CC'ing Michael Karcher who has more knowledge on
> writing proper C code than me and maybe an idea how to fix this warning.
>
> Thanks,
> Adrian
>
> > [1] https://lkml.org/lkml/2015/9/3/428
>
> diff --git a/include/linux/sh_intc.h b/include/linux/sh_intc.h
> index c255273b0281..07a187686a84 100644
> --- a/include/linux/sh_intc.h
> +++ b/include/linux/sh_intc.h
> @@ -97,14 +97,12 @@ struct intc_hw_desc {
>          unsigned int nr_subgroups;
>   };
>
> -#define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
> -
>   #define INTC_HW_DESC(vectors, groups, mask_regs,       \
>                       prio_regs, sense_regs, ack_regs)   \
>   {                                                      \
> -       _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
> -       _INTC_ARRAY(mask_regs), _INTC_ARRAY(prio_regs), \
> -       _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
> +       ARRAY_SIZE(vectors), ARRAY_SIZE(groups),        \
> +       ARRAY_SIZE(mask_regs), ARRAY_SIZE(prio_regs),   \
> +       ARRAY_SIZE(sense_regs), ARRAY_SIZE(ack_regs),   \
>   }

The issue is that some of the parameters are not arrays, but
NULL. E.g.:

arch/sh/kernel/cpu/sh2/setup-sh7619.c:static
DECLARE_INTC_DESC(intc_desc, "sh7619", vectors, NULL,
arch/sh/kernel/cpu/sh2/setup-sh7619.c-                   NULL,
prio_registers, NULL);
--

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
