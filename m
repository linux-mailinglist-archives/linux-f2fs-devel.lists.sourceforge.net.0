Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F33A86602EA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Jan 2023 16:18:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pDoUe-0005WB-H0;
	Fri, 06 Jan 2023 15:18:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1pDoUb-0005Vr-H0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oLTT10Q08SvcCsbZuYubvWn2TjFc+1wP3y0ZN/T09Wc=; b=MP1bW1/K88MMGWVoFqx6Q60YF5
 N6gUDn8vIFqN4mIOirRHyO4f/eFdZdLf7SNiNrhXhcEp3mmRRJ2mdqxufREhQOl2vpJXR+mvBylUg
 6sejOdTd4OhAdhkXHz1n2ULjY7K6JT1Yo2oNSDwS24PR1bSOA/minqqiL+WFVM5vPfCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oLTT10Q08SvcCsbZuYubvWn2TjFc+1wP3y0ZN/T09Wc=; b=OZXjYG5Ws7jXZMz1UwTctRFuOK
 giHXTiugv2wVopHlYCnFNctbzHr18M+cBSjTncfFKfT1dCq+d63A1LaTUVu5pClEqxF5TbQkPe9CA
 XUTQR1f99OQg9FtUn4Pd26bhbREuOlV4FkryIapJSIrC2dJtMDZZ5VZw6gfD9VhLAa1k=;
Received: from mail-qt1-f181.google.com ([209.85.160.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pDoUX-0007GN-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Jan 2023 15:18:49 +0000
Received: by mail-qt1-f181.google.com with SMTP id i20so2214031qtw.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jan 2023 07:18:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLTT10Q08SvcCsbZuYubvWn2TjFc+1wP3y0ZN/T09Wc=;
 b=4pgiFQsFwh6AAIDTp8nm+oG6QE6RdcbOvZKHVpQcFmobtY2WH0zhuIkxRC8vOSaP8y
 PcaVTHZLzoOqW5DFM/mRziOr1dDWMvuWujgeVgQhYyCKndOPEEc4k1Z2WsRqTxhCppx2
 UZZGIVmeP4xhR19T4HNhe7+EvpDvzeNvy2wzdzyzH+xUXY/kRG+ARL5WoLVWTrwqNSXz
 htiCQIhyypcUtqLUuDKouyTIRoxY+AFO0BXF5Me+BRS3RkCOqf8OdU1e01tGZeYx8sic
 czu9dqkOZN4fWJL42rJGSxq33Y1qffSdUu909h0eYPYSmwZ/8t9W2N9OuSEYxykDu1Ri
 xrGQ==
X-Gm-Message-State: AFqh2kqfbDr2T4CE2RrvnkJ6Noe7AXhtZxnWiVfsRYOnzkRmfpbILbxP
 qok73mQhALSpI7eRCI3VnwBdcRfHAKPI4Q==
X-Google-Smtp-Source: AMrXdXvj7UMhpAY9iRLrQ+zYN8CS+wKuimCNj9ycKuSyjJBTjBUdTlUZPUR8vUpeNUJ/8WKrlJ0sOg==
X-Received: by 2002:ac8:7cac:0:b0:39c:da20:f6fa with SMTP id
 z12-20020ac87cac000000b0039cda20f6famr70751854qtv.30.1673018319832; 
 Fri, 06 Jan 2023 07:18:39 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 x23-20020ac87ed7000000b0039467aadeb8sm616560qtj.13.2023.01.06.07.18.38
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 07:18:39 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-4a2f8ad29d5so26428887b3.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Jan 2023 07:18:38 -0800 (PST)
X-Received: by 2002:a81:17ca:0:b0:46f:bd6:957d with SMTP id
 193-20020a8117ca000000b0046f0bd6957dmr4281773ywx.383.1673018318622; Fri, 06
 Jan 2023 07:18:38 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org>
 <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
In-Reply-To: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jan 2023 16:18:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8AKSdujbr=nwaBUy4q4z_R=MERnb5CBPPv=A63BVFXA@mail.gmail.com>
Message-ID: <CAMuHMdU8AKSdujbr=nwaBUy4q4z_R=MERnb5CBPPv=A63BVFXA@mail.gmail.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 6,
 2023 at 4:17 PM Geert Uytterhoeven <geert@linux-m68k.org>
 wrote: > > Hi John, Bummer, "Hi Adrian", ofc ;-) Gr{oetje,eeting}s, 
 Content analysis details:   (3.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [geert.uytterhoeven[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.181 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.181 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1pDoUX-0007GN-W5
Subject: Re: [f2fs-dev] Build regressions/improvements in v6.2-rc1
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
 kasan-dev@googlegroups.com, linux-f2fs-devel@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 6, 2023 at 4:17 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi John,

Bummer, "Hi Adrian", ofc ;-)

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
