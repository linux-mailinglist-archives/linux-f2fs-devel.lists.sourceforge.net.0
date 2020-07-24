Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC35D22BAE1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 02:17:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jylPJ-000470-JI; Fri, 24 Jul 2020 00:17:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <drinkcat@chromium.org>) id 1jylPF-00046o-91
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 00:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tn6bqYg/1KWkV4kpAzCYFhcP+XCPRuDgdoeZet33vWk=; b=PJIdOwsdcavhGJpzF/C0TaC5fE
 KXQrfYgN5fpQWb4voloTR6xjnvZcUBtUi6YaMMBtS7ANu+rLNl5Ims+VqspTHGFh2FsfNfhKnS4fj
 eP/BKjgjR83qlXY2/LYJC+yLn3njy9BBeeT1HSKK7pQIeSae6meEv4Sr5brgqa7wllQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tn6bqYg/1KWkV4kpAzCYFhcP+XCPRuDgdoeZet33vWk=; b=HpOQzY7b/MfJom4BIXGtHYK3Mu
 YLvS2OamofKWvhaJ7mOYoQXVsT6izdawyQFF0nROBTq0oGkmlZXSfMZPhz7+hbidukq9BqKj5Aqhv
 P6elbX7pQal41wkP7EW/M4mlpjWEb5CASDDAN431eRiUdOiEHCm0RWcbUq5DCCXybnE0=;
Received: from mail-ua1-f68.google.com ([209.85.222.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jylPC-000t9t-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 00:17:44 +0000
Received: by mail-ua1-f68.google.com with SMTP id r63so2408375uar.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jul 2020 17:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tn6bqYg/1KWkV4kpAzCYFhcP+XCPRuDgdoeZet33vWk=;
 b=awreHD28nDVNZexMGVyopatjZJnZVe7HOWZqVLh+RCrrko33Dtr7aUGgwOkz5TkDTZ
 0yYGVwi8WX8RUoZPeer0O6R6Mkxv2fwqIKd57tgnZhCiaJXkJVcV2SPbhNZ3XCGWvsmS
 wfHBen5QSZrel1hvkK/0sXZYsKhLRDS4KyFac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tn6bqYg/1KWkV4kpAzCYFhcP+XCPRuDgdoeZet33vWk=;
 b=iX2JJAnYkIaVc2rlQCc13wDOVD/6fYR1fDccrL8ce/Y00Sa9AzWXaDWgn7CmGJ32PT
 kte3ylMlp0I0T5Axd2L3hXpD2yeC6GVpNuKfeErtUq0YhG3+buVvSfp/jyUKHdghOp04
 2bRzVKSo2L73C8vLChJLuQmdoJ1XnNJGBkGGmpWxVFp46bC/V9rQ8xbipvZoENrN2Pbl
 xDrluj1N3PuOVPTMAuPp3MX+PQD/KH8QWf1bhkyXu+eWXZZ9ssAzOfFWp01YzESmkKWe
 PMAvx0I5HmbtvoAg2+CuyH0bsoCD6gJIJKrGUsYR8zqk+Y/3M7uZ1+HXYYhqQkCFuUpc
 CA5A==
X-Gm-Message-State: AOAM532qjmiEzYjOEPCl5TlBsSPPAnDff15aDe7hSJOMf6ZWP4FC/1QH
 RE3GtF/s4mIyVYMY9aNQm/jtplM5brbWdC9Thhi0Cg==
X-Google-Smtp-Source: ABdhPJyap0e7CTwf8HrhrJhPhF9DOR7AKPD9OIoxL1bXe7v3Dk4cmLWDUcc1+/hhsto3hTn53fbsk/M7qmHWyPm46q8=
X-Received: by 2002:a9f:22c4:: with SMTP id 62mr6134025uan.135.1595549856863; 
 Thu, 23 Jul 2020 17:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200627070307.516803-1-drinkcat@chromium.org>
 <20200627070307.516803-2-drinkcat@chromium.org> <878sfanzft.fsf@kernel.org>
In-Reply-To: <878sfanzft.fsf@kernel.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 24 Jul 2020 08:17:25 +0800
Message-ID: <CANMq1KDugXcmvrGOJzcvWvbzScPDsQVuJ4gSDXTJan+FY1H3Ew@mail.gmail.com>
To: Felipe Balbi <balbi@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jylPC-000t9t-Pf
Subject: Re: [f2fs-dev] [PATCH 1/4] usb: cdns3: gadget: Replace trace_printk
 by dev_dbg
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
Cc: Peter Chen <peter.chen@nxp.com>,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>,
 Rafael Aquini <aquini@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 Will Deacon <will@kernel.org>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Kees Cook <keescook@chromium.org>, devel@driverdev.osuosl.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jayshri Pawar <jpawar@cadence.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andy Gross <agross@kernel.org>,
 Tomas Winkler <tomas.winkler@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Roger Quadros <rogerq@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Divya Indi <divya.indi@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 23, 2020 at 9:17 PM Felipe Balbi <balbi@kernel.org> wrote:
>
> Nicolas Boichat <drinkcat@chromium.org> writes:
>
> > trace_printk should not be used in production code, replace it
> > call with dev_dbg.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > ---
> >
> > Unclear why a trace_printk was used in the first place, it's
> > possible that some rate-limiting is necessary here.
> >
> >  drivers/usb/cdns3/gadget.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> > index 5e24c2e57c0d8c8..c303ab7c62d1651 100644
> > --- a/drivers/usb/cdns3/gadget.c
> > +++ b/drivers/usb/cdns3/gadget.c
> > @@ -421,7 +421,7 @@ static int cdns3_start_all_request(struct cdns3_device *priv_dev,
> >               if ((priv_req->flags & REQUEST_INTERNAL) ||
> >                   (priv_ep->flags & EP_TDLCHK_EN) ||
> >                       priv_ep->use_streams) {
> > -                     trace_printk("Blocking external request\n");
> > +                     dev_dbg(priv_dev->dev, "Blocking external request\n");
>
> Instead, I would suggest adding a proper trace event here; one that
> includes "priv_ep->flags" in the output.

The patch was already merged by Greg
(https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/usb/cdns3/gadget.c?id=b3a5ce874c2619c9b8a6c5bbcfefdb95e0227600),
but feel free to do that as a follow-up CL.

Looks like Peter -- the main author, is ok with dev_dbg (also,
apologies for missing the R-b tag when I sent a v2 -- which is the one
that was merged by Greg).

Thanks,

>
> --
> balbi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
