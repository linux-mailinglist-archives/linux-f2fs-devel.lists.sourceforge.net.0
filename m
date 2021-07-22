Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AC3D1B2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 03:04:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6N8q-0006Np-Dn; Thu, 22 Jul 2021 01:04:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m6N8p-0006Nj-4g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 01:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdVcgyFrt783lScdfhCI3lPMqTnUeK9ABSA/mH1ibjA=; b=adF79o5bg+fIm2JO9nvII0N6W/
 HY8Q9QstLSn3vVIoCYo8ewOMEb5eG7DP8WcaHVDRVN0ejAMJZxEbWpDv8vEmxN397OhVdkSIeypeF
 XxEWriI1wTExOdSPui+sZXxEhQZRHPJdYrLPhk7UkwJlOb7DZJ93G/ITJbY3ccihrd50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tdVcgyFrt783lScdfhCI3lPMqTnUeK9ABSA/mH1ibjA=; b=j0NozNCSKYC6X4JquE8rMoycsX
 ouIvL/3yoqYi0e/z0Dddm/aubGHjGUenEdYfO2DXZKVa3bHkhKVP7+WVd/j2aoywIOGKL0zbg65Wh
 ctQppdGwH9EIgq7nocv0pDqWzhY4xliYgYGDzxv5le4/TzxR5AJ4AXnVpagqA2zyIclE=;
Received: from mail-lj1-f180.google.com ([209.85.208.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6N8i-00GHB9-AE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 01:04:47 +0000
Received: by mail-lj1-f180.google.com with SMTP id t20so5344005ljd.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Jul 2021 18:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tdVcgyFrt783lScdfhCI3lPMqTnUeK9ABSA/mH1ibjA=;
 b=sDr7Rqiv2gHMiCoRQZiZO9pNAnwQF16sUvpKjdVJH0Bs24fQr9AU2Mv3v0hhZAlY6Z
 8GTMv3YdfjExVAEMDk8Zm9SCBDeFJM5oVhyfr4Iqrf0J/9mRQH7aHRJq3qEWgUf2SgVn
 jPy+0bTF5vfNU7DBfMulckGN7g7nV9Fl1NpGrfOnTWBUHDS+UWyodtJyltQAD2+i54oj
 rNgHcLz/XyfVnoe26X2cehEIwB7CGRmzhaF4EILnrYuSrtqWx/coCNJWNkHjkRvdI3aW
 dNeItESvKhgTI6HIgYTSRPvEg9BrHhIxj+Nd8+yIWgbRHSHrQ4XJCP9Wk3v9xsd/NqLC
 W4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tdVcgyFrt783lScdfhCI3lPMqTnUeK9ABSA/mH1ibjA=;
 b=SUB8VlQXubnQtabFWwjPsH5GoD9PRsUXiL44tjcfzfOVUmySaOpSb0h/qmzIhRmjzA
 ugm8Vk/YJ6AXTUY1gAJg+946Cis1WGadsTxc29yGF/82wL59xcU3pJN3yaFQI7fS3nuz
 y8WamTuZZ8DjGdMZujUJjRPJU2Acr+3IE8LHaCMpwZGHCDsTV6eys8LubMBHRBF726Pa
 LaviBLwLt21QtD/r5rIe5XVBytFwbJ4mb77P4v36kovJqJP/rwj0G9sHDnpMzmWnXJKt
 1tahsVEZRvP3cm5JqnR6/l9Bv3jJH6Fp2IcQKhd6/fR/eScmyOCr+6BLMK2FxNSDlGgp
 mQCQ==
X-Gm-Message-State: AOAM5334kOvoaLYlNkoqpcx8/kHpPTbQOR05GgcbxuORs5JTzk6ARqru
 EfekeXa6pM2o/htn0CY0lXJ6fe3dBIEu23xQ4y4=
X-Google-Smtp-Source: ABdhPJx6C1BNH+dXBtZGhfH7IpQO10Bys3xuxRePvkRl3kG+SS2EgsEpLMT1bFABsd4JrLjCtuYKWGMBZvd6/yXFCLI=
X-Received: by 2002:a2e:92c8:: with SMTP id k8mr15788610ljh.136.1626915873774; 
 Wed, 21 Jul 2021 18:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210721072048.3035928-1-daeho43@gmail.com>
 <YPiTLwB3d8BWSKje@gmail.com>
 <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
 <YPi4rRg2ZPFBWaTZ@sol.localdomain>
In-Reply-To: <YPi4rRg2ZPFBWaTZ@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 21 Jul 2021 18:04:22 -0700
Message-ID: <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.180 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6N8i-00GHB9-AE
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

On Wed, Jul 21, 2021 at 5:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jul 21, 2021 at 03:30:46PM -0700, Daeho Jeong wrote:
> > Hi Eric,
> >
> > On Wed, Jul 21, 2021 at 2:35 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Wed, Jul 21, 2021 at 12:20:48AM -0700, Daeho Jeong wrote:
> > > > From: Daeho Jeong <daehojeong@google.com>
> > > >
> > > > When we print out a discontinuous compression chunk, it shows like a
> > > > continuous chunk now. To show it more correctly, I've changed the way of
> > > > printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> > > > info, since it is not in fiemap user api manual.
> > > >
> > > > 0: 0000000000000000 0000000000000000 0000000000001000 1008 (M/E)
> > > > 1: 0000000000001000 0000000f15c0f000 0000000000001000 1008 (M/E)
> > > > 2: 0000000000002000 0000000000000000 0000000000002000 1808 (M/U/E)
> > > > 3: 0000000000004000 0000000000000000 0000000000001000 1008 (M/E)
> > > > 4: 0000000000005000 0000000f15c10000 0000000000001000 1008 (M/E)
> > > > 5: 0000000000006000 0000000000000000 0000000000002000 1808 (M/U/E)
> > > > 6: 0000000000008000 0000000000000000 0000000000001000 1008 (M/E)
> > >
> > > Please label these columns.
> > >
> > > Anyway, this doesn't appear to work quite in the way I had in mind.  With this
> > > patch, what I'm seeing is:
> > >
> > > $ head -c 16384 /dev/zero > file; xfs_io -c "fiemap -v" file
> > > file:
> > >  EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
> > >    0: [0..7]:          0..7                 8 0x1008
> > >    1: [8..15]:         2683128..2683135     8 0x1008
> > >    2: [16..31]:        0..15               16 0x1809
> > >
> > > So, working in 512-byte sectors, the logical sectors 0-31 are stored as one
> > > compressed cluster in the 8 physical sectors 2683128-2683135.
> > >
> > > The problem is, with this patch these physical sectors are reported at logical
> > > sectors 8-15 instead of 0-7.  Obviously, this isn't particularly well-defined,
> > > but I thought it was logical for the physical blocks to be associated with the
> > > first logical blocks.  That is what the tests I've written (xfstest f2fs/002,
> > > and the Android vts_kernel_encryption_test) assume.
> > >
> > > Is there any particular reason why you wouldn't report instead:
> > >
> > >    0: [0..7]:         2683128..2683135     8 0x1008
> > >    1: [8..31]:        0..23                8 0x1809
> > >
> > > - Eric
> >
> > The reason is related to how F2FS stores the mapping information in
> > the mapping table.
> > Actually, the mapping inside of the table is like this.
> > [0..7]:  COMPR_ADDR flag(0x1008) -> merged, encoded
> > [8..15]: 2683128..2683135 flag(0x1008) -> merged, encoded
> > [16..31]: NEW_ADDR flag(0x1809) -> merged, unwritten(!), last_extent
> >
> > I understand what you mean.
> > But, if we adapt to your way, how do you think we can print out when
> > we ask for f2fs to print out only the [8..15] area? Zero address? How
> > about flags?
> > I think the current way explains the layout of the f2fs metadata more exactly.
> >
>
> How f2fs stores the mapping information doesn't matter.  That's an
> implementation detail that shouldn't be exposed to userspace.  The only thing
> that should be exposed is the actual mapping, and for that it seems natural to
> report the physical blocks first.
>
> There is no perfect solution for how to handle the remaining logical blocks,
> given that the fiemap API was not designed for compressed files, but I think we
> should just go with extending the length of the last compressed extent in the
> cluster to cover the remaining logical blocks, i.e.:
>
>   [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
>
> That's what btrfs does on compressed files.
>
> - Eric

I also agree that that's an implementation detail that shouldn't be
exposed to userspace.

I want to make it more clear for better appearance.

Do you think we have to remove "unwritten" information below? I also
think it might be unnecessary information for the user.
[0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
(unwritten?)

Do you want f2fs to print out the info on a cluster basis, even when
the user asks for one block information?
Like
If the user asks for the info of [8..15], f2fs will return the info of [0..31]?

Thank you,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
