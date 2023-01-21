Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEB9676993
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 22:27:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJLOC-0005nE-4n;
	Sat, 21 Jan 2023 21:27:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <glaubitz@zedat.fu-berlin.de>) id 1pJLO9-0005mz-Lo
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 21:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhmwtE13OOMQNJIh4iCnBh8C5pkGPy9ns1M5J9HbuAU=; b=m4GBmsOjxSGhBE+CHEbaHIwoAW
 O8b9Y+FB5KewwXp1/GeY3q8kZIwG5VxmBNOlrpnwdgmoP7KwPmtCSBJ68KdUIZGoj/rcMF6XvQKbK
 rmOwRT+5gRubMdZ4n3Zk/XPXNUMys2Mchsu3x0aRw5ebrAOkrSeio9Y/6pCeE0754Two=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yhmwtE13OOMQNJIh4iCnBh8C5pkGPy9ns1M5J9HbuAU=; b=czklicPYnW0tVB3HmDdhlQG1+H
 qioN7defiVxLr3Mfw0NRLdfzyMfwZo65oqk0f1uhQwHxlE6LE6UxkSiaqQKm4Vuf/gBrn0FwhHeds
 mZJB3x43LDy3ZWAbyabIlY/X6NDB57YcaYwTL+EwNODV+Fg3o3CUIfMD3t1NDrBEv3fk=;
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJLO6-00BgRm-P3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 21:27:00 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pJLNr-001fc4-Li; Sat, 21 Jan 2023 22:26:43 +0100
Received: from dynamic-089-012-154-190.89.12.pool.telefonica.de
 ([89.12.154.190] helo=[192.168.1.11])
 by inpost2.zedat.fu-berlin.de (Exim 4.95) with esmtpsa (TLS1.3)
 tls TLS_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pJLNr-001xPR-F4; Sat, 21 Jan 2023 22:26:43 +0100
Message-ID: <7c6b114a-38f8-1a0b-8623-d492f9cc2fb9@physik.fu-berlin.de>
Date: Sat, 21 Jan 2023 22:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
 <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
 <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
 <0d238f02-4d78-6f14-1b1b-f53f0317a910@physik.fu-berlin.de>
 <1732342f-49fe-c20e-b877-bc0a340e1a50@fu-berlin.de>
 <c1d233b9-bc85-dce9-ffa0-eb3170602c6c@physik.fu-berlin.de>
 <def16c9b-7bb1-a454-0896-b063a9e85964@fu-berlin.de>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <def16c9b-7bb1-a454-0896-b063a9e85964@fu-berlin.de>
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 89.12.154.190
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi! On 1/20/23 20:29, Michael Karcher wrote: > Hello Adrian, 
 >> Could you post a kernel patch for that? I would be happy to test it on
 my >> SH-7785CLR board. Also, I'm going to file a bug report against [...]
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [130.133.4.66 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [130.133.4.66 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pJLO6-00BgRm-P3
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
 linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi!

On 1/20/23 20:29, Michael Karcher wrote:
> Hello Adrian,
>> Could you post a kernel patch for that? I would be happy to test it on my
>> SH-7785CLR board. Also, I'm going to file a bug report against GCC.
> 
> I filed the bug already. It's https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108483.
> 
> The diff is attached. It's published as CC0 in case anyone considers this trivial change copyrightable. This patch prevents this one specific warning from being upgraded to "error" even if you configure the kernel to use "-Werror". It still keeps it active as warning, though.

I used the following variant and it fixes the issue for me:

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 5c8776482530..11b22f7167d2 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -167,7 +167,7 @@ drivers-y                   += arch/sh/drivers/
  cflags-y       += $(foreach d, $(cpuincdir-y), -I $(srctree)/arch/sh/include/$(d)) \
                    $(foreach d, $(machdir-y), -I $(srctree)/arch/sh/include/$(d))
  
-KBUILD_CFLAGS          += -pipe $(cflags-y)
+KBUILD_CFLAGS          += -pipe -Wno-error=sizeof-pointer-div $(cflags-y)
  KBUILD_CPPFLAGS                += $(cflags-y)
  KBUILD_AFLAGS          += $(cflags-y)

If you agree, can you post a patch to LKML so we can unbreak the SH build for CONFIG_WERROR?

Thanks,
Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
