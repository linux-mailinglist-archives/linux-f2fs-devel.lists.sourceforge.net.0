Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E98B3FBB3A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Aug 2021 19:52:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mKlSL-0004Zc-Ks; Mon, 30 Aug 2021 17:52:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1mKlSJ-0004ZQ-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Aug 2021 17:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d5bnBdYfK8MREsdQ2ulPLtMZ7uZ5lPMgodPXfNRRTrY=; b=GAJ8bRZ1Mtd+KILYvClOBn84kN
 qnMrEVaSImxhtK3OUewIqaLCb/j0Kz79/uoPat5aTVovWx21nQNUvuOK9qv7VbUIPrSRztiBgFQMx
 C1QnFB2jwMBfcJhbsOb2OVgP/clYCLjna1x0OXvz5/0Ic0ElcnsUl8c2v5GAetPTErpc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d5bnBdYfK8MREsdQ2ulPLtMZ7uZ5lPMgodPXfNRRTrY=; b=EVT5Z2AE7TX/yhP9yxsDqVCqvh
 Zs/UIwwv0bEoabyZv+mJCpXtwxysL+XmWP9j3eYHb/nGXIMiPYHlOwG2Em4+7422F2PnBM7LtifUo
 tyEGRI/ZYKgcc0UpMkHBWBEGLH5cBm3NThWoGaQJmJPa0iuflPDxP6VWW7agQtcpiYyU=;
Received: from mail-lj1-f182.google.com ([209.85.208.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1mKlSI-0008SH-EO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Aug 2021 17:52:23 +0000
Received: by mail-lj1-f182.google.com with SMTP id j12so27265579ljg.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Aug 2021 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d5bnBdYfK8MREsdQ2ulPLtMZ7uZ5lPMgodPXfNRRTrY=;
 b=sVPP9eZBx+GLi2Ud3Dmd0T5Ee6ZUA8XOsanKSCCBp4laDJ0qalOCc2MlaEcf+TAaS+
 Xci3FDlJ58w8KdFsQedMH40QB056SizVkwBm1jPeq/UHbRYcIZFKZ8uGF139Tl4IWBtP
 z1mIqudvNvQsloBGfwfrQrn+QpaWs00T8br0O2ZCHW9gtJzd1q0k7KkvpscfwEFg4m4h
 /6i00rHCrNyWvNYh9NczrUWgPS8t3UOohlBI0aavjGjCdYeNfvt2fPKqIO0X2td0iCRS
 c2BqOrKsivcTV6NNkP3Bs85szaZXFqCLAq6eWn8Wb/j6Q/tVl0vGIvZ4Jzhu9yz7niaX
 +8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d5bnBdYfK8MREsdQ2ulPLtMZ7uZ5lPMgodPXfNRRTrY=;
 b=hm/p9cuIIz9eQX5I0ScU8o/pSUZ5yq32/yhtKQLpb+Ep4Xnm2H/A/dQU6ylXvZ8Rql
 7EXQnd56RVx8eKe70BNv5YqvDEz46JeN0ijGuJ/vTEJ4Ul0aJzjJBmtDYeudnkK+BcF4
 HaUBMw9O134ncqboIHTK0NAzIAQzJgRPEqshOVZXNj7/SlJCUOQ7b9KDwdww7r5F1KD8
 F0J+wCUhv+DMxlq41cfaG4B8EhKD7hpgQoMq23MXYDaGxFBRYbzhQkN7/Gx+sgeVMsH8
 GB6pUeagRsGj7Pob7619Bmjw/aGis1gasWL8te5+4fvFjEGeLPKBT+zu9cwEFk5CZsQ/
 NgBw==
X-Gm-Message-State: AOAM532vfYT4IZUTFh4x/PsB7Myg4Va5rmCOp6e45lc0wQRhWy0ddPip
 mfaUkTYcRpfW582R6GjaB+qisOXYJ8Nbi4XQARqv3cuOgT0=
X-Google-Smtp-Source: ABdhPJwf0g2OZ7nDm0+I1Aa9jrPZsxH7AMSUcGIVCyJH5WFvCc49EYJ6RYuPBN97ASiAJ3Tg9HSYwufvfqD+qMUYVG0=
X-Received: by 2002:a05:6512:a85:: with SMTP id
 m5mr10289356lfu.610.1630344474760; 
 Mon, 30 Aug 2021 10:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210825185747.1627497-1-daeho43@gmail.com>
 <1f1e6d38-6bd1-17ea-b8ca-a45d1244728f@kernel.org>
 <CACOAw_yhgo1_wrejKskSm=Rsw27ogx=TS_A=z=-NGLcecA-gYA@mail.gmail.com>
 <335d5bb5-7055-c934-33df-a03885382034@kernel.org>
In-Reply-To: <335d5bb5-7055-c934-33df-a03885382034@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 30 Aug 2021 10:27:43 -0700
Message-ID: <CACOAw_wbK8qZ7kNxNXkyZqAdb9XJ7EqC2_GxnkzUDBr1oSwxkA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.182 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1mKlSI-0008SH-EO
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce fragment allocation mode
 mount option
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

On Fri, Aug 27, 2021 at 5:43 PM Chao Yu <chao@kernel.org> wrote:
>
> On 2021/8/27 23:22, Daeho Jeong wrote:
> >> I'd like to add a fixed chunk/hole fragmentation mode in addition, then
> >> userspace can control the fragmented chunk/hole with fixed size.
> >>
> >> How do you think of renaming "fragment:block" to "fragment:rand_block", and
> >> then I can add "fragment:fixed_block" option and its logic in addition?
> >>
> >
> > The reason I added the randomness on these values is the segment
> > selection in SSR mode.
> > If all the segments have the same free block counts, f2fs will
> > allocate a new segment sequentially in SSR.
>
> I'm fine with this, since test program can customize different fragment
> degree on segments by setting different chunk/hole size.
>

Got it. Sounds good~

> > This was what I didn't want. Plus, in the real world, the size of hole
> > and chunk will be different in different segments.
> >
> > But, if you think we need this "fragment:fixed_block" mode, I am happy
> > to have it. :)
>
> Thanks a lot. :)
>
> As you said it needs to be aligned to real world fragmentation, I notice that:
> with this way, we can't simulate similar fragment in FTL, due to its page
> mapping architecture, all fragmented data/node in filesystem will be written
> sequentially into its blocks.
>
> In order to simulate fragment in FTL, we need to:
> - write data (chunk size) with dummy pages (hole size) to devices
> - issue discards on those holes
>
> I guess fragmenting device (erase blocks) at the same time wouldn't be
> original intention of this patch, right?
>
> Thanks,
>

Yes, I just meant filesystem fragmentation as I wrote in the comment.

> >
> >> Do we need to consider multiple thread scenario? in such case,
> >> .fragment_remained_chunk may update randomly.
> >>
> >> In addition, multiple log headers share one .fragment_remained_chunk,
> >> it may cause unexpected result, it means there may be continuous holes
> >> or chunks in locality due to swithing between different log headers.
> >>
> >> Thanks,
> >>
> >
> > Oh, I overlooked that point. I am going to add the variable for each
> > segment as you said before.
> >
> > Thanks,
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
