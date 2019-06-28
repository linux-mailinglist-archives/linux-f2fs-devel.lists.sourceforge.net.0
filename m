Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BCB5A358
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2019 20:19:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgvSy-0006qB-A4; Fri, 28 Jun 2019 18:19:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux+linux-f2fs-devel=lists.sourceforge.net@armlinux.org.uk>)
 id 1hgvSw-0006q4-FU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 18:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nvwlS5cEOUMLkB+OhiPPpM/PP0fhgF6+Us0z9niErA0=; b=i2pwtjIsK8bGk8fp90wSlRqP7
 gUU253H8V7Zr2CXwQYZocF6VLU2lnH1KbASlr80mH/A6ueWQRAMphrss2BWxDfg2kG1eNJ6u0vZll
 K1s5NlwlbjZQPMoqgPZPomsfzZpt+6aH4p6KULXdUuhpb+9Oh39Kl/KO3e2uIpAE3X21Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nvwlS5cEOUMLkB+OhiPPpM/PP0fhgF6+Us0z9niErA0=; b=UZDN0GOZoU+ENEFWXX9rifWofK
 Vjtf0bscDoe2kOeXKGw3MkjAUePgf/UrsYmyofuXUvsLQGKlSG8uWEi8SBzzz/HTC5Jq29swK8/Cv
 0Ee9HEgqS5FV+C173no2M5bA1fozvfD9f2p4/VGiSlYkqc+q7uKL0IFvXsyeRso43IJ4=;
Received: from pandora.armlinux.org.uk ([78.32.30.218])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hgvT4-00122G-SL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 18:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nvwlS5cEOUMLkB+OhiPPpM/PP0fhgF6+Us0z9niErA0=; b=KZBLPQg0yuaGK05D9EFvOg8O6
 /VO2uZ7BTAY+eap/rHqsq20zusigPDhLwZdOZgY2S8MP3oiVJdWlxsBTpts6bp54KxfCK9qa373NG
 Y8pUHaduBn/pu+BJ5FZKgE32+FW50/mEQJComcAn6nX2zFTqEyvrv14WjDrTN7W655daMtR+q4zjp
 KINwlY0kzhhp2gSiTRjFz0Qi9Yp13U866ZLoaYO1z5gjnSr1fWBbaU+JqJJnluNEjhrNJRXTDWGnr
 UB0p89k+ITurKGjpv0aOLRvxPr1WlegmFNAbrwAMUEY0t0O7fXfhYDJ7iOQ/G16IOKDHislSnYnlD
 j2ogFiZaQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60106)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hgv8x-00024o-RA; Fri, 28 Jun 2019 18:58:39 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hgv8t-0001gS-E5; Fri, 28 Jun 2019 18:58:35 +0100
Date: Fri, 28 Jun 2019 18:58:35 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190628175835.hwzfrgrtwphi6kka@shell.armlinux.org.uk>
References: <20190628104007.2721479-1-arnd@arndb.de>
 <20190628124422.GA9888@infradead.org>
 <CAK8P3a1jwPQvX6f+eMZLdnF2ZawDB9obF3hjk2P9RJxDr6HUQA@mail.gmail.com>
 <20190628131738.GA994@infradead.org>
 <CAK8P3a0t+vGge8uDOuwex6j+ddaUqovxCXoJOO8Ec3z6_brvsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0t+vGge8uDOuwex6j+ddaUqovxCXoJOO8Ec3z6_brvsg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hgvT4-00122G-SL
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bit linking
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
Cc: Eric Biggers <ebiggers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wang Shilong <wangshilong1991@gmail.com>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 28, 2019 at 04:46:14PM +0200, Arnd Bergmann wrote:
> On Fri, Jun 28, 2019 at 3:17 PM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Fri, Jun 28, 2019 at 03:09:47PM +0200, Arnd Bergmann wrote:
> > > I came across this on arm-nommu (which disables
> > > CONFIG_CPU_SPECTRE) during randconfig testing.
> > >
> > > I don't see an easy way to add this in there, short of rewriting the
> > > whole __get_user_err() function. Any suggestions?
> >
> > Can't we just fall back to using copy_from_user with a little wrapper
> > that switches based on sizeof()?
> 
> I came up with something now. It's not pretty, but seems to satisfy the
> compiler. Not a proper patch yet, but let me know if you find a bug.

Have you checked what the behaviour is when "ptr" is a pointer to a
pointer?  I think you'll end up with a compiler warning for every
case, complaining about casting an unsigned long long to a pointer.

> 
> This might contain a double uaccess_save_and_enable/uaccess_restore,
> not sure how much we care about that.
> 
>      Arnd
> 
> index 7e0d2727c6b5..c21cdecadf26 100644
> --- a/arch/arm/include/asm/uaccess.h
> +++ b/arch/arm/include/asm/uaccess.h
> @@ -307,6 +307,7 @@ static inline void set_fs(mm_segment_t fs)
>  do {                                                                   \
>         unsigned long __gu_addr = (unsigned long)(ptr);                 \
>         unsigned long __gu_val;                                         \
> +       unsigned long long __gu_val8;                                   \
>         unsigned int __ua_flags;                                        \
>         __chk_user_ptr(ptr);                                            \
>         might_fault();                                                  \
> @@ -315,10 +316,13 @@ do {
>                          \
>         case 1: __get_user_asm_byte(__gu_val, __gu_addr, err);  break;  \
>         case 2: __get_user_asm_half(__gu_val, __gu_addr, err);  break;  \
>         case 4: __get_user_asm_word(__gu_val, __gu_addr, err);  break;  \
> +       case 8: __get_user_asm_dword(__gu_val8, __gu_addr, err);break;  \
>         default: (__gu_val) = __get_user_bad();                         \
>         }                                                               \
>         uaccess_restore(__ua_flags);                                    \
> -       (x) = (__typeof__(*(ptr)))__gu_val;                             \
> +       (x) = __builtin_choose_expr(sizeof(*(ptr)) == 8,                \
> +               (__typeof__(*(ptr)))__gu_val8,                          \
> +               (__typeof__(*(ptr)))__gu_val);                          \
>  } while (0)
> 
>  #define __get_user_asm(x, addr, err, instr)                    \
> @@ -373,6 +377,8 @@ do {
>                          \
>         __get_user_asm(x, addr, err, ldr)
>  #endif
> 
> +#define __get_user_asm_dword(x, addr, err)                     \
> +       do { err = raw_copy_from_user(&x, (void __user *)addr, 8) ?
> -EFAULT : 0; } while (0)
> 
>  #define __put_user_switch(x, ptr, __err, __fn)                         \
>         do {                                                            \
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
