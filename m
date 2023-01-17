Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F41E666E3D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jan 2023 17:43:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHp35-0006mi-Bm;
	Tue, 17 Jan 2023 16:42:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <glaubitz@zedat.fu-berlin.de>) id 1pHp33-0006mb-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 16:42:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jBMiC23PuaYE856mBxP4m1QXC3Ppdq8BFbM+KH+7+Eo=; b=g9qUFAUk2MIe776ZCuVc9HN7ml
 i2nyZMxCxCqv8jtZS3Z5cz1+H746UvwP0KvSn6A6GEdTn1XIPTQPW0DxE6SqcRfrwEnTWZCcjczSe
 qtyX/mW4cY27+uGoSASpBBZ+Yi1sODwjfXkujR1VeRTUgHW0BHqVSQoJVm0OTOr1N624=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jBMiC23PuaYE856mBxP4m1QXC3Ppdq8BFbM+KH+7+Eo=; b=Epaf0XT2UKH/NNghdJcSlYqDYN
 SD73Z/hq6ONwHOj3proFSlcLXhBaftGlPuQyqjKZbq+jmZXCPbORhyQ9C4YxiTJ8zvtDVMRTZBI2B
 Zb8wczuP8Q8N4icRjyqHxpXrAsYnVRt6niNTkvq6B23vct2dNiHoDT/RETDc+QdYhaaM=;
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHp2z-0001PT-Ah for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Jan 2023 16:42:56 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pHp2k-001f9B-4y; Tue, 17 Jan 2023 17:42:38 +0100
Received: from p57bd9464.dip0.t-ipconnect.de ([87.189.148.100]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pHp2j-002q0C-UX; Tue, 17 Jan 2023 17:42:38 +0100
Message-ID: <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
Date: Tue, 17 Jan 2023 17:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.148.100
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Geert! On 1/6/23 16:17, Geert Uytterhoeven wrote: >> I'm
 not seeing this one, but I am getting this one instead: >> >> In file included
 from ./arch/sh/include/asm/hw_irq.h:6, >> from ./include/linux/irq.h:59 [...]
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [130.133.4.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [130.133.4.66 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pHp2z-0001PT-Ah
Subject: [f2fs-dev] Calculating array sizes in C - was: Re: Build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Geert!

On 1/6/23 16:17, Geert Uytterhoeven wrote:
>> I'm not seeing this one, but I am getting this one instead:
>>
>> In file included from ./arch/sh/include/asm/hw_irq.h:6,
>>                    from ./include/linux/irq.h:596,
>>                    from ./include/asm-generic/hardirq.h:17,
>>                    from ./arch/sh/include/asm/hardirq.h:9,
>>                    from ./include/linux/hardirq.h:11,
>>                    from ./include/linux/interrupt.h:11,
>>                    from ./include/linux/serial_core.h:13,
>>                    from ./include/linux/serial_sci.h:6,
>>                    from arch/sh/kernel/cpu/sh2/setup-sh7619.c:11:
>> ./include/linux/sh_intc.h:100:63: error: division 'sizeof (void *) / sizeof (void)' does not compute the number of array elements [-Werror=sizeof-pointer-div]
>>     100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
>>         |                                                               ^
>> ./include/linux/sh_intc.h:105:31: note: in expansion of macro '_INTC_ARRAY'
>>     105 |         _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
>>         |                               ^~~~~~~~~~~
> 
> The easiest fix for the latter is to disable CONFIG_WERROR.
> Unfortunately I don't know a simple solution to get rid of the warning.

I did some research and it seems that what the macro _INT_ARRAY() does with "sizeof(a)/sizeof(*a)"
is a commonly used way to calculate array sizes and the kernel has even its own macro for that
called ARRAY_SIZE() which Linus asks people to use here [1].

So, I replaced _INTC_ARRAY() with ARRAY_SIZE() (see below), however the kernel's own ARRAY_SIZE()
macro triggers the same compiler warning. I'm CC'ing Michael Karcher who has more knowledge on
writing proper C code than me and maybe an idea how to fix this warning.

Thanks,
Adrian

> [1] https://lkml.org/lkml/2015/9/3/428

diff --git a/include/linux/sh_intc.h b/include/linux/sh_intc.h
index c255273b0281..07a187686a84 100644
--- a/include/linux/sh_intc.h
+++ b/include/linux/sh_intc.h
@@ -97,14 +97,12 @@ struct intc_hw_desc {
         unsigned int nr_subgroups;
  };
  
-#define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
-
  #define INTC_HW_DESC(vectors, groups, mask_regs,       \
                      prio_regs, sense_regs, ack_regs)   \
  {                                                      \
-       _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
-       _INTC_ARRAY(mask_regs), _INTC_ARRAY(prio_regs), \
-       _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
+       ARRAY_SIZE(vectors), ARRAY_SIZE(groups),        \
+       ARRAY_SIZE(mask_regs), ARRAY_SIZE(prio_regs),   \
+       ARRAY_SIZE(sense_regs), ARRAY_SIZE(ack_regs),   \
  }
  
  struct intc_desc {

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
