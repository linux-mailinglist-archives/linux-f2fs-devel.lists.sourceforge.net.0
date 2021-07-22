Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 200D83D1AA2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 02:16:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6MNp-0000Tm-Ji; Thu, 22 Jul 2021 00:16:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1m6MNo-0000TP-0q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 00:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+boZSS/Dh8FB01Nr23pv4m5lmiYYpDOpL5ShWFlOwRs=; b=RIW8jBy4f3pM1bz+BfGNxKfxcz
 /S67Ezq1H4xJ1bHRLo/7eiTMCixVRiyuZC0U6nUnTfSyiS3cE0nA9CnUCvWo5WTtjmDUqwd3Ee7Ys
 gIgVLwJx0/H5VRrax24A2BgW92oIvZVhtByRHCmVDsEEDXDb66a3YiC9rpOsJevFFGj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+boZSS/Dh8FB01Nr23pv4m5lmiYYpDOpL5ShWFlOwRs=; b=mTEE7RL3Bz0HbLEEyWw58Xe6ne
 VYbGwEaMvkk2my31uJvqsM5G+k982FBsukA6d05vCTj1RbWwe3yLnC9ln03S2Asv6OMbeEs1sjCDr
 PFV/p9V+GxSXqc0E8TEm44BRSPx72CxNC5epRPDJ8N9mwptt+RJKePUpfSLUYOGV+CdI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6MNc-00GF1k-Pl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 00:16:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25C266124B;
 Thu, 22 Jul 2021 00:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626912943;
 bh=Qi3eR8xtzF26kiZ/SexfczHNUk8vNBP4CNqtBcnRUz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jlp3kMuyWwjBup3T8xmMDvY1XbcRSc4ahYSiLtUemz2qP5FPPS0dRsWqROxmMHp8D
 OuHZzX7MvrLVSNlc6m4xlfXnHbHdPThtquLrVG436+htzpsQkOcmMrnBe1RxPGh5cV
 tlTb3MfyGJp6AR+sHw+kv+A79fut394cWt1VtXM0WfDiTvPkPpdT7cSdSUpP7ftxms
 aWrJ3UtxjPRD0ZrBlbPLou5jRBm65vzpPo9YzP50pzcI+BJZ5M88yrMJjmLPqviRBX
 c733iBldFIWacFWvYdgKQm0gELYLyR9TDjFIWXY6+PXrXaBYN/WkV+NmJ6OPGXJ6XN
 WRIOxLZLS1VDQ==
Date: Wed, 21 Jul 2021 17:15:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPi4rRg2ZPFBWaTZ@sol.localdomain>
References: <20210721072048.3035928-1-daeho43@gmail.com>
 <YPiTLwB3d8BWSKje@gmail.com>
 <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6MNc-00GF1k-Pl
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

On Wed, Jul 21, 2021 at 03:30:46PM -0700, Daeho Jeong wrote:
> Hi Eric,
> 
> On Wed, Jul 21, 2021 at 2:35 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Wed, Jul 21, 2021 at 12:20:48AM -0700, Daeho Jeong wrote:
> > > From: Daeho Jeong <daehojeong@google.com>
> > >
> > > When we print out a discontinuous compression chunk, it shows like a
> > > continuous chunk now. To show it more correctly, I've changed the way of
> > > printing fiemap info like below. Plus, eliminated NEW_ADDR(-1) in fiemap
> > > info, since it is not in fiemap user api manual.
> > >
> > > 0: 0000000000000000 0000000000000000 0000000000001000 1008 (M/E)
> > > 1: 0000000000001000 0000000f15c0f000 0000000000001000 1008 (M/E)
> > > 2: 0000000000002000 0000000000000000 0000000000002000 1808 (M/U/E)
> > > 3: 0000000000004000 0000000000000000 0000000000001000 1008 (M/E)
> > > 4: 0000000000005000 0000000f15c10000 0000000000001000 1008 (M/E)
> > > 5: 0000000000006000 0000000000000000 0000000000002000 1808 (M/U/E)
> > > 6: 0000000000008000 0000000000000000 0000000000001000 1008 (M/E)
> >
> > Please label these columns.
> >
> > Anyway, this doesn't appear to work quite in the way I had in mind.  With this
> > patch, what I'm seeing is:
> >
> > $ head -c 16384 /dev/zero > file; xfs_io -c "fiemap -v" file
> > file:
> >  EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
> >    0: [0..7]:          0..7                 8 0x1008
> >    1: [8..15]:         2683128..2683135     8 0x1008
> >    2: [16..31]:        0..15               16 0x1809
> >
> > So, working in 512-byte sectors, the logical sectors 0-31 are stored as one
> > compressed cluster in the 8 physical sectors 2683128-2683135.
> >
> > The problem is, with this patch these physical sectors are reported at logical
> > sectors 8-15 instead of 0-7.  Obviously, this isn't particularly well-defined,
> > but I thought it was logical for the physical blocks to be associated with the
> > first logical blocks.  That is what the tests I've written (xfstest f2fs/002,
> > and the Android vts_kernel_encryption_test) assume.
> >
> > Is there any particular reason why you wouldn't report instead:
> >
> >    0: [0..7]:         2683128..2683135     8 0x1008
> >    1: [8..31]:        0..23                8 0x1809
> >
> > - Eric
> 
> The reason is related to how F2FS stores the mapping information in
> the mapping table.
> Actually, the mapping inside of the table is like this.
> [0..7]:  COMPR_ADDR flag(0x1008) -> merged, encoded
> [8..15]: 2683128..2683135 flag(0x1008) -> merged, encoded
> [16..31]: NEW_ADDR flag(0x1809) -> merged, unwritten(!), last_extent
> 
> I understand what you mean.
> But, if we adapt to your way, how do you think we can print out when
> we ask for f2fs to print out only the [8..15] area? Zero address? How
> about flags?
> I think the current way explains the layout of the f2fs metadata more exactly.
> 

How f2fs stores the mapping information doesn't matter.  That's an
implementation detail that shouldn't be exposed to userspace.  The only thing
that should be exposed is the actual mapping, and for that it seems natural to
report the physical blocks first.

There is no perfect solution for how to handle the remaining logical blocks,
given that the fiemap API was not designed for compressed files, but I think we
should just go with extending the length of the last compressed extent in the
cluster to cover the remaining logical blocks, i.e.:

  [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent

That's what btrfs does on compressed files.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
