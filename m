Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 564C61EE543
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jun 2020 15:24:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgpr7-0006Cl-Vd; Thu, 04 Jun 2020 13:24:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <glqinhongwei@gmail.com>) id 1jgpr6-0006CW-AQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 13:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=avKB5F3l/0YFqBpd8ezsQiMAyhMyoqBV8XA/5cPPjhA=; b=UDLmyYZRH0XcEVIzJprxiAZSjs
 lFPe62v0t3sAboWqmqdlapIMNsi53iyywrpUS36WTRtq3v9DezfMkGawgeyDxiIjoSPA7ELSjSKlF
 AULw7yjwwTPQZFyk6/QY5AmeaWl9jvNlOFKaA6PhFAQ6yMGoEFKhjELD6bjuehoytfxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=avKB5F3l/0YFqBpd8ezsQiMAyhMyoqBV8XA/5cPPjhA=; b=FmDAorZhP8BeO/Ofpk/eLLAeEM
 EtL83DTC5lRt0xlSIenWFB2UWqGUp1cIvyQhh5tvA0jNBn7leEjV0uHzTHxviOrDciGfOIYH2AB9X
 4MmRbOiO29dYa+aOHCTLDMfzMjAP+bwC+i+zgvZBJTNgiPm2wIPrVeQkWADW8MpTUbco=;
Received: from mail-il1-f194.google.com ([209.85.166.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgpr4-005Tpo-J0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 13:24:24 +0000
Received: by mail-il1-f194.google.com with SMTP id l6so6056474ilo.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 Jun 2020 06:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avKB5F3l/0YFqBpd8ezsQiMAyhMyoqBV8XA/5cPPjhA=;
 b=L/HhZpKbvleswVbsbPs1nSphl5zG/6qtlpb2mcC0qM1JbWHn7JtrLL2VAVp5u33LhZ
 FbTVKF8Lbv1SL8fH4vwO9blQbfADBh/7wO+uRz6ry13GhyFirc3sNF7R2RbXblO6rTKV
 xXSV7QyUIWxU680SkoC6MYFO5xO+4Fm1ZWEoFxH2ReDw5d/D/UmrsaSNjbMgjb4qQsTs
 C+ap0ZXpx4V5uMiAKZigMh8NqEX5MGJ9dZhasj2QpC0t2RtQGHKB0CuYmbE0//KDx06t
 Fr4rx3hcApIN2FB+vhndGgnD0bmiEAnwJTp0iB+4SPFRDCW6M7UF2K/8Nt0T4JJqjRhe
 gZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avKB5F3l/0YFqBpd8ezsQiMAyhMyoqBV8XA/5cPPjhA=;
 b=f5PRsBLLNj5z8mXTKadkd9a+zEOhEtlK6DM59JH/Y3DzGyEL5UNKzvIouoOX4NZHHr
 O0ISNpWIVrXloIwy0Y/SgTYkYKx8Ws5pT0lxLY4gDAPPfzjsO/McbLxKYeaZQvdMYu7c
 rDNhoefikbS5nl7B/LrHeO10L00Vl/GwUTVMEe52blY97pIyhhh4qrD2ei7VX3ki56vd
 nzTOPqpbAqcnNBeqidgBaaOq0BES68C2p7E0610GfQEX5BGAlux79wvmvpqSSb5iHXMb
 CJi2UEpTS/v1VhyXriPEkg7DW5q8UfTUq3SYTvtm2g6LoqujBUW1VABzOSGBlVs11wII
 WgqA==
X-Gm-Message-State: AOAM532qgCta+3EjVLjriBt3/ba3avIrNDQfVh6z9taMsFAKqRGeM69U
 /zZYLvmhW7xL4wLBgmHjLR9znwfwii42lvQwpTo=
X-Google-Smtp-Source: ABdhPJys5ZGJ6i7yeDHcSC0NA2JP1/2xsuXdr4FIco+04m26punAfW8s93XEsIF09R3fwq0K/YvRkP0EZC7fuUT+k10=
X-Received: by 2002:a92:bb45:: with SMTP id w66mr4043886ili.131.1591277056885; 
 Thu, 04 Jun 2020 06:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_DCCAEE9137D2150CB266BD2CF3EDF98A970A@qq.com>
 <20200528172606.GA153385@google.com>
 <tencent_2E2E902BD0A10D8A67C92DE7EC6D887BCB0A@qq.com>
 <20200603171816.GC85814@google.com>
In-Reply-To: <20200603171816.GC85814@google.com>
From: Hongwei Qin <glqinhongwei@gmail.com>
Date: Thu, 4 Jun 2020 21:24:05 +0800
Message-ID: <CAKvRR0RrM0C22ywJ81SRHHqUr2yvbQRSfw+Lg21mPKLZc0kM_A@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (glqinhongwei[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jgpr4-005Tpo-J0
Subject: Re: [f2fs-dev] Can F2FS roll forward after fdatasync()?
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
Cc: linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

On Thu, Jun 4, 2020 at 1:19 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
>
> Hi Hongwei,
>
> On 05/29, Hongwei wrote:
> > Hi,
> > >On 05/28, Hongwei wrote:
> > >> Hi F2FS experts,
> > >> As written in f2fs_do_sync_file():
> > >> "Both of fdatasync() and fsync() are able to be recovered from sudden-power-off."
> > >>
> > >> Please consider this workflow:
> > >> 1. Start atomic write
> > >> 2. Multiple file writes
> > >> 3. Commit atomic write
> > >> 4. fdatasync()
> > >> 5. Powerloss.
> > >>
> > >> In the 4th step, the fdatasync() doesn't wait for node writeback.
> > >> So we may loss node blocks after powerloss.
> > >>
> > >> If the data blocks are persisted but node blocks aren't, can the recovery program recover the transaction?
> > >
> > >#3 will guarantee the blocks written by #2. So, if there's no written between #3
> > >and #4, I think we have nothing to recover.
> > >Does this make sense to you?
> >
> > Thanks for your reply. Please consider this:
> > f2fs_do_sync_file() doesn't wait for node writeback if atomic==1. So it is possible that after #3, node is still writing back.
> > #4 fdatasync() doesn't wait for node write back either.
> > Considering node writeback BIO is flagged with PREFLUSH and FUA, it may take a long time to complete.
> > Therefore, when #5 power failure happens, it is possible that the node block is not persisted?
> > If I was correct about this, can the recovery program recover the transaction?
>
> I see. That can be the issue tho, is there a real usecase for this? I mean,
> given atomic writes by sqlite, next transaction will be also serialized with
> another atomic writes, which we could bypass waiting node writes.
>

Thanks for your reply. I think the use case is from SQLite.
I'm writing an SQLite test program and I need to decide whether to use
fdatasync() or fsync() after the F2FS transaction to ensure
durability.
E.g., if the SQLite receives an INSERT, it needs to ensure the data's
persistency before returning the SQL handler.
My guess is that in this case, the SQLite needs to use fsync().

This further drives me to think that whether we can optimize F2FS so
that in this case we can use fdatasync() instead of fsync().
My concern is that under current implementation, it is possible that
after #4, the data is still volatile (data BIOs are not flagged with
FUA so waiting for data page writeback can't guarantee its
persistency).
Therefore, if we add the FUA flag to data BIOs, maybe we can at lease
guarantee that the data blocks are durable after fdatasync()?

If all of my understandings are correct, can F2FS roll forward the
transaction if all its data blocks are persisted while missing node
blocks? (My guess is no because in such case we don't know the file
offset of the data blocks)

Or, maybe this just doesn't happen in reality?

> Thanks,
>
> >
> > >
> > >>
> > >> Thanks!
> > >>
> > >> Hongwei
> > >> _______________________________________________
> > >> Linux-f2fs-devel mailing list
> > >> Linux-f2fs-devel@lists.sourceforge.net
> > >> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
