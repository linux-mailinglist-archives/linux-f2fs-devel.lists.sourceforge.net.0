Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7412AC56
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Dec 2019 14:16:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ikT0P-0002AY-PX; Thu, 26 Dec 2019 13:16:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1ikT0O-0002AG-S1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 13:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YXEQfNaH8VgTuSjnmguZGyC11qEHXS5tzAGI8RrbPY8=; b=ZFKoo6S+YvPL+Aeckx/+vYQ/0A
 qI9JTGEWTAYY5CQCsOej8zbsj7rxMMPcuziwlBXQcXD82A64hBiybMmDZ9MVM10FJtKLpzJIpcUxW
 OkB96arSqJyOHaFmxkiUDXogGSBCeHbMUzFtTHbzLgYmGzSax8a0yT7ILIuepNZ7o1mw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YXEQfNaH8VgTuSjnmguZGyC11qEHXS5tzAGI8RrbPY8=; b=bTMmltyDw8prwKn1BzflSSmPY8
 NemhOag7yKwcS+tJVNzORCuCdnn4z3GElXJg2pDr8fhG60HJXY7BHA5oTQXhkj8RHR6rYZnDrAu1/
 A9mQYc0WCOrCqy2kHomksISNEJigntLbZNe6sFR6VXQriS8cV/WSV6u6oe86uuxHDDg4=;
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ikT0L-00FhoU-9h
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Dec 2019 13:16:44 +0000
Received: by mail-ot1-f65.google.com with SMTP id 59so32517949otp.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 26 Dec 2019 05:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YXEQfNaH8VgTuSjnmguZGyC11qEHXS5tzAGI8RrbPY8=;
 b=SjHcyVT1HjzxW3YB+6ZeXmJ1H+k+SZIIPm40BewuupFsNziUhxWarObR7onm/O1YU0
 eNC+H4I3TRUxwSKfVRR3ySIGkwPDafRS+4tYKxnd6iC8lhVaC53KOjU43cIgidJaiquB
 VmNWHALYryqCl8mi8vOE4WaPQmKuQSCexEGF59bRE8mBj4FiMqthFlwFjb5PvLDjxLok
 Iy1UgONG0nMhvuYKc9DelXy5WjXWRuc9BQPtV7aO1ITsVuY7q7Roq7p743U3Gj+OW5cA
 nhSOFVJFs8geod15eeJr+2b/KbHv2TLJrz8ztVMJtrx+Friqozdawamhxo6Pj0TxwKG9
 /00w==
X-Gm-Message-State: APjAAAWD4JbSED7Kki8eZD4A+wK3fVxA8mN2tEbn/AjSC36FIACYRGEU
 9dEesyVfPK+8ty4XeOnA2/Chvuldh7OUI0TALRw=
X-Google-Smtp-Source: APXvYqzjoOLS5EFKuY6BxQdWOZeUmiXoP4FsqbIxt6z03pBr9RBXWa7jFuBPKeZecz30modR1jUa5VsfvEbdjxPsOaY=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr51311676otm.297.1577366195614; 
 Thu, 26 Dec 2019 05:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20191223040020.109570-1-yuchao0@huawei.com>
 <CAMuHMdUDMv_mMw_ZU4BtuRKX1OvMhjLWw2owTcAP-0D4j5XROw@mail.gmail.com>
 <1cc2d2a093ebb15a1fc6eb96d683e918a8d5a7d4.camel@dubeyko.com>
 <CAMuHMdV5VtR+vgYKcZtvcz16GPp9YLG_ecAeDsiNCreP4rYKjw@mail.gmail.com>
 <61e43dcb781c9e880fac95b525830fd384de122a.camel@dubeyko.com>
In-Reply-To: <61e43dcb781c9e880fac95b525830fd384de122a.camel@dubeyko.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Dec 2019 14:16:24 +0100
Message-ID: <CAMuHMdU+_RCp6JWsFm7kw4ce2vBimr=4_oEug=R0Jyr9f0L9Tg@mail.gmail.com>
To: Vyacheslav Dubeyko <slava@dubeyko.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dubeyko.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (geert.uytterhoeven[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.65 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ikT0L-00FhoU-9h
Subject: Re: [f2fs-dev] [PATCH] f2fs: introduce DEFAULT_IO_TIMEOUT_JIFFIES
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Vyacheslav,

On Thu, Dec 26, 2019 at 2:08 PM Vyacheslav Dubeyko <slava@dubeyko.com> wrote:
> On Thu, 2019-12-26 at 11:43 +0100, Geert Uytterhoeven wrote:
> > On Wed, Dec 25, 2019 at 10:58 AM Vyacheslav Dubeyko <
> > slava@dubeyko.com> wrote:
> > > On Mon, 2019-12-23 at 09:41 +0100, Geert Uytterhoeven wrote:
> > > > On Mon, Dec 23, 2019 at 5:01 AM Chao Yu <yuchao0@huawei.com>
> > > > wrote:
> > > > > As Geert Uytterhoeven reported:
> > > > >
> > > > > for parameter HZ/50 in congestion_wait(BLK_RW_ASYNC, HZ/50);
> > > > >
> > > > > On some platforms, HZ can be less than 50, then unexpected 0
> > > > > timeout
> > > > > jiffies will be set in congestion_wait().
> > >
> > > It looks like that HZ could have various value on diferent
> > > platforms.
> > > So, why does it need to divide HZ on 50? Does it really necessary?
> > > Could it be used HZ only without the division operation?
> >
> > A timeout of HZ means 1 second.
> > HZ/50 means 20 ms, but has the risk of being zero, if HZ < 50.
> >
> > If you want to use a timeout of 20 ms, you best use
> > msecs_to_jiffies(20),
> > as that takes care of the special cases, and never returns 0.
> >
>
> The msecs_to_jiffies(20) looks much better for my taste. Maybe, we
> could use this as solution of the issue?

Thanks, sounds good to me.

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
