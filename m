Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A13D19C1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 00:31:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6KkG-00054d-0t; Wed, 21 Jul 2021 22:31:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1m6KkE-00054V-R7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 22:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TU/KkduaSrurFShl837GHBlKY1G5viwl2DwVlMVRYRw=; b=jYuGYamMXt5aqb81r61dPP0l2L
 HV2eyU3/Qhk/rOEvQqhp/W+RipnDrlJ9iAArrnufYnHf1wrjZE1OiWUAcCWJw7c9DvrrZSPqPQqCO
 CrbH+xzhhlTB+MzxVmqNVy5/1YxFnAS/wlFOzRZfPMMmpiwJL7RV0eUIv/mBQBmhGuwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TU/KkduaSrurFShl837GHBlKY1G5viwl2DwVlMVRYRw=; b=lvucFdiKQ9KmrCU/nSMo5VsFlU
 I1y7X6rfSqs1SYJscaVawxm+FWoIR5bYsspIudxpaFPXLmBmkpNiayh99a1JDR8uJKwCqlmZJGc+P
 QBMmBolQqcvwQcFjBq377bgyxjXJqFpfLjr3YSLRjshCtdaYrtzECvbeIVKsicf7jahk=;
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6Kk3-00GAON-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Jul 2021 22:31:14 +0000
Received: by mail-lj1-f179.google.com with SMTP id x24so1250513ljm.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Jul 2021 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TU/KkduaSrurFShl837GHBlKY1G5viwl2DwVlMVRYRw=;
 b=l4dD20jhcB0ra/CjblbMC0qwO/H7BusoqZ7Eq0FzOKayOixc7r03ufBjhWvwl6DhwG
 5iETQYa6bbNa6tPt15XKmTjIP781paRAP1XWM7Rnz4s2bpKTtVUP+WwybGTOY5tk3lAW
 M8mzKnhwBZ1GmAWoabjgkw+SwZ1FRXrk/cFzXteP7v7oxJpNUrB+a8bQ7vhlUhhuVzT9
 +4bh+PbOjDKt5+pcgsKQtRS9Hnm64RE6KTMOvvvf5F66DC/MCCTxkC/Ylexhp7Mh6KWq
 9X6KAY2CXc2mY7S9sGZ8fed9qOveL4HOf42PPGk4Htx56saBtItEPnxQit0SpALb+Vjt
 hsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TU/KkduaSrurFShl837GHBlKY1G5viwl2DwVlMVRYRw=;
 b=TQRYs/CkhH/c0OXh9X3arwVFLrtEc4ygQDCI2AaNMYwYxrOcEtyuqZUhr3VM9vT5SP
 w8AxG1XgAx0hj6C3p91RpkBNmHqnaxrM/b+Uz02Nq+zd9z3YKTbzCrCuu2nK1yJaUw2z
 QhivOruC27CiMJB3vhut5/2Ns0TviOpcDcmx0MIYf0mCTG6V9I9J1G/Jhuy7N2DLRqbV
 QKkYltZERKcBKySz6vuqP9cA3GLoF2Cecd59CqGUTU/CPIiQQ3cmxwcKWPEJ9boy3D7y
 bosPMXcYFyESlfRUwVwoEkdng56hB/Wis5MpdlqynP3ZRXjK6tAvCKZCLf0AGvqhngYb
 Rn3g==
X-Gm-Message-State: AOAM530xHARc2DV9XY3+CpWL9amDQZuulsO0NuzJSW4943DAGRnaX8jT
 kFyQH5tSpdwF/3/iHEvc5UBzOs9OMn1sa5qtc9sZrvDaDK80Pw==
X-Google-Smtp-Source: ABdhPJzxAE1hlSvd2ajpDjbBz/1Yfz+4LI9qCBI+A/TBLOw3jZ74TptEiaagBCUqi1wMk7xqrudDnLBcQex5nUiQIyE=
X-Received: by 2002:a2e:8858:: with SMTP id z24mr7143087ljj.413.1626906656926; 
 Wed, 21 Jul 2021 15:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210721072048.3035928-1-daeho43@gmail.com>
 <YPiTLwB3d8BWSKje@gmail.com>
In-Reply-To: <YPiTLwB3d8BWSKje@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 21 Jul 2021 15:30:46 -0700
Message-ID: <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.179 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.179 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6Kk3-00GAON-Gg
Subject: Re: [f2fs-dev] [PATCH] f2fs: change fiemap way in printing
 compression chunk
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

Hi Eric,

On Wed, Jul 21, 2021 at 2:35 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jul 21, 2021 at 12:20:48AM -0700, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > When we print out a discontinuous compression chunk, it shows like a
> > continuous chunk now. To show it more correctly, I've changed the way of
> > printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> > info, since it is not in fiemap user api manual.
> >
> > 0: 0000000000000000 0000000000000000 0000000000001000 1008 (M/E)
> > 1: 0000000000001000 0000000f15c0f000 0000000000001000 1008 (M/E)
> > 2: 0000000000002000 0000000000000000 0000000000002000 1808 (M/U/E)
> > 3: 0000000000004000 0000000000000000 0000000000001000 1008 (M/E)
> > 4: 0000000000005000 0000000f15c10000 0000000000001000 1008 (M/E)
> > 5: 0000000000006000 0000000000000000 0000000000002000 1808 (M/U/E)
> > 6: 0000000000008000 0000000000000000 0000000000001000 1008 (M/E)
>
> Please label these columns.
>
> Anyway, this doesn't appear to work quite in the way I had in mind.  With this
> patch, what I'm seeing is:
>
> $ head -c 16384 /dev/zero > file; xfs_io -c "fiemap -v" file
> file:
>  EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
>    0: [0..7]:          0..7                 8 0x1008
>    1: [8..15]:         2683128..2683135     8 0x1008
>    2: [16..31]:        0..15               16 0x1809
>
> So, working in 512-byte sectors, the logical sectors 0-31 are stored as one
> compressed cluster in the 8 physical sectors 2683128-2683135.
>
> The problem is, with this patch these physical sectors are reported at logical
> sectors 8-15 instead of 0-7.  Obviously, this isn't particularly well-defined,
> but I thought it was logical for the physical blocks to be associated with the
> first logical blocks.  That is what the tests I've written (xfstest f2fs/002,
> and the Android vts_kernel_encryption_test) assume.
>
> Is there any particular reason why you wouldn't report instead:
>
>    0: [0..7]:         2683128..2683135     8 0x1008
>    1: [8..31]:        0..23                8 0x1809
>
> - Eric

The reason is related to how F2FS stores the mapping information in
the mapping table.
Actually, the mapping inside of the table is like this.
[0..7]:  COMPR_ADDR flag(0x1008) -> merged, encoded
[8..15]: 2683128..2683135 flag(0x1008) -> merged, encoded
[16..31]: NEW_ADDR flag(0x1809) -> merged, unwritten(!), last_extent

I understand what you mean.
But, if we adapt to your way, how do you think we can print out when
we ask for f2fs to print out only the [8..15] area? Zero address? How
about flags?
I think the current way explains the layout of the f2fs metadata more exactly.

Thank you,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
