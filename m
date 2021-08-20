Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176E3F2F32
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Aug 2021 17:23:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mH6N8-0006bO-Ve; Fri, 20 Aug 2021 15:23:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1mH6N7-0006b6-La
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 15:23:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LmlIpUuRl+AQl6NHORx2uksaHk6e1Bkml3gkzzdbETU=; b=c8o275CUAp+5kCIdaHg7pWpHTs
 ZEkAYHnXzxPjl0hXa7AKi/KmdNeISOvsFAPHbraVnNxkPoT1Uotag02JhfPoLU5EfnSGxo5UlAurZ
 hbr+p0nfzvBbcHp1lE3xD0IBkTWXBrCpTHDNBhWcUnxNEwt7QIp7cBmeE5yhGDXEAeMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LmlIpUuRl+AQl6NHORx2uksaHk6e1Bkml3gkzzdbETU=; b=eaAP8eUzDsEvlo+qPEsaWjPzKr
 GGWUyCdcNe+INIU0ljMw3n1I5C2zgjYTJulJiUyJo84mb5CFH2LOs42LHJAQzUy1pelFT5XV7Ts3M
 r5wC40CFvz8YGGvR9P7WWZVumSyg2crA+HXudyXzmW3AIlmEVx3WNyrUjb2V96jfXUWw=;
Received: from mail-lf1-f51.google.com ([209.85.167.51])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mH6Me-00Csry-3Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Aug 2021 15:23:53 +0000
Received: by mail-lf1-f51.google.com with SMTP id i9so21314891lfg.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 20 Aug 2021 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LmlIpUuRl+AQl6NHORx2uksaHk6e1Bkml3gkzzdbETU=;
 b=lfsgunIBPvh1N2HMfHLuTu6bb4D3MC64EfdWNwsp5/I6e9+sfnYHnIciUn9iZmjfE0
 RpMGbkMBlb41YT2k/VuMPHP5HH0vI1ft3AxZAqjXqSV2D48lo2PyvBqf1WE8groFrbSz
 piCHKr+s5jQ3BOWinXhcxtVn97Y2iAAcvrQ+yyehKq2a2l3LGlvs/TU3UNUT3xIayr0A
 upenWwnnUkAajCqzvvSGk9T7fSjgoGzVxrO0LYkz2bj/FByEg0EKheI4pi9b07cRPfpH
 SnvrUc9FNOeQ6o8yxGKnMLHduaRcnUfRnEr9uicYa2qgy2arR6dkRInN0Y84ycx9HbD7
 Hczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LmlIpUuRl+AQl6NHORx2uksaHk6e1Bkml3gkzzdbETU=;
 b=dZboNhB2XkGpUwlSNGsZ2L4Wyu+L5Kmeqf0x5RsGnxzWIbqw+SMot3RC0y1Za/9CS0
 15G/euzu4ba6HXz4CL8+EcBdochXpAQiViz+AM6IWGQ7+8M0pwxncKdHb5++9lZr4BD3
 W0yLPzU6Wv80TkWPcNebldXN0vJxJ802timqsqnw1wWkgM03dqUyIsqXkuf+63W5xVXc
 un4vc4qB7Qa29GODGHFERmW6JxOvoQmAWgy4Rw4hiy4h/PNo4VakSHcGqr4iK28lVXOL
 gFDJ5h9EBiWl+UTAVNHY3+VrAzxHnUAo1eNRULVFYXZncqlzG4UrwlMn3qa6P8HfOQX1
 ydZw==
X-Gm-Message-State: AOAM532287MhXPAavqrbhKtxFwTQg2gWbo0AbObz2EcsUY3iHv8nb3gi
 yoqBn3aMPsPKGrbuVX3nG1RNc6E7mLfEwACZv48=
X-Google-Smtp-Source: ABdhPJyw8/e5A74C67qJGcTsZiZKzpB1smdk0k5v/GkqQliEF2YXs0kwLwrudgjmcfMsEXbeJCSQEaghgLDo4wm0808=
X-Received: by 2002:ac2:4573:: with SMTP id k19mr14978867lfm.622.1629472996150; 
 Fri, 20 Aug 2021 08:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210820035229.216975-1-daeho43@gmail.com>
 <20210820035229.216975-2-daeho43@gmail.com>
 <48725f58-1a48-73f3-80cf-a0c5efc3b470@kernel.org>
In-Reply-To: <48725f58-1a48-73f3-80cf-a0c5efc3b470@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 20 Aug 2021 08:23:05 -0700
Message-ID: <CACOAw_xcwZN_H7_zi7iMJh9HpzXnPd67fNAcxhu5UUSmJk7c1Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 20,
 2021 at 3:50 AM Chao Yu wrote: > > On 2021/8/20
 11:52, Daeho Jeong wrote: > > +void iostat_update_and_unbind_ctx(struct bio
 *bio, int rw) > > +{ > > + struct bio_iostat_ctx *iostat_c [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.51 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.51 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1mH6Me-00Csry-3Q
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: introduce periodic iostat io
 latency traces
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 20, 2021 at 3:50 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2021/8/20 11:52, Daeho Jeong wrote:
> > +void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
> > +{
> > +     struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
> > +     int sync_type = bio->bi_opf & REQ_SYNC ? 0 : 1;
>
> int sync_type = bio->bi_opf & REQ_SYNC ? 1 : 0;
>
> Right?

This means just type, not boolean number. So, I set type 0 is sync and
type 1 is async.

>
> >   int f2fs_init_iostat(struct f2fs_sb_info *sbi)
> >   {
> >       /* init iostat info */
> >       spin_lock_init(&sbi->iostat_lock);
> > +     spin_lock_init(&sbi->iostat_lat_lock);
> >       sbi->iostat_enable = false;
> >       sbi->iostat_period_ms = DEFAULT_IOSTAT_PERIOD_MS;
> > +     sbi->iostat_io_lat = f2fs_kzalloc(sbi, sizeof(struct iostat_lat_info),
> > +                                     GFP_KERNEL);
> > +     if (!sbi->iostat_io_lat)
> > +             return -ENOMEM;
>
> What do you think of just embedding iostat_io_lat structure into f2fs_sb_info
> structure? it's minor thing though.
>

I also wanted to do that, but if we embed this type, we need to define
that structure in f2fs.h file.
Is it okay with you?

> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
