Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E989D3D2B46
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 19:36:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6ccs-00011g-E7; Thu, 22 Jul 2021 17:36:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m6ccq-00011X-33
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 17:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lM51MEKLQm03GtKRhihGMXCZ70gqYMvs8DnRjb4VjtE=; b=KiEH7Mpc6zWgqIJIucS5i0UoVP
 105E4AUMJISpTRkS/fk2Y6YMTy1RCgb+hKDC5mD2ioopOSg30ODTd/Omtp9YKcJXDTxLw+RvNqZ9m
 QDKpzNJFtfwZqtk+r1aDFSYnSumX5qPxBPsy/6iuF3y/rVWX1OrKEd9ha5/4/ZdbE00M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lM51MEKLQm03GtKRhihGMXCZ70gqYMvs8DnRjb4VjtE=; b=FqBIdZhhcUM+1FHdTXYVqpkrjr
 bFgkviVM1wjwl7icO8HBEsgdeEpacd9furAoKL3fDTKeY3iN2OwmkUabM9NPEHQk5tpk3GtGbLQDK
 9yT0xDlafAIoVTeCr7Rq4pKPBLMPdJWRbtxPG+XUv8C5Vk6mqtx6WNwVESWNREHkfRe4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6ccj-00H3x7-OR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 17:36:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4980B611C1;
 Thu, 22 Jul 2021 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626975391;
 bh=JHEzmorgHIE3uvJSz7raB+MO1KUcxcyBX18Nk8l7ovk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aPpP8IaOgC+RO8+sjg+7wYCZ3Aolz/VqsSo+EWEclAaKsp0ywAK/tKTsuvkhV+Kvx
 ByKWF2CFfiuDsmDG5MHfoWvetG/e8z7qNftgxqLyFQ2vl95Ap1XW2/YqMoAzmJV5AM
 SnplNKCG3cAHtmF5BKr2G/lvADcXNjnoy3STV5mBLj9xbY/92t+z6Cz/pu8IuGQm8W
 7gtVZ1Obqus8iQ6+bfYmcbmnowkvIHiWnk5QOLVddSBxKW6B7BpZBtT8dK0rc4ZMtF
 FaCG3UZFRpGKksH3vKbz/nldTfznicYLRdiiJ0in1dXGDRQgCPay16X0CID1jaeyAc
 4AzbNmrLunt3Q==
Date: Thu, 22 Jul 2021 10:36:29 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YPmsnYBgu4T5g1xj@gmail.com>
References: <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
 <YPjGsSEdsoSsCJlB@sol.localdomain>
 <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
 <YPjQQTjJ6rO2sx/o@sol.localdomain>
 <CACOAw_yfG494AK=XH_xzeTDWn-a1mYF+537=VTT6oX6RgLGxnw@mail.gmail.com>
 <YPmB8etJZ+vN0fDT@gmail.com>
 <CACOAw_y7vabxw6Ena4FSuA2bfA_Unq2bEpQq1pSJ0-zi3YCa8w@mail.gmail.com>
 <YPmaMFlR6/tJTmpQ@gmail.com> <YPmcMpbv3kxSZOs8@gmail.com>
 <CACOAw_zTHM_aYdLLxoSn7SvXB99CgVMu8eMKQ=Poqb_p_gVoOg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zTHM_aYdLLxoSn7SvXB99CgVMu8eMKQ=Poqb_p_gVoOg@mail.gmail.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m6ccj-00H3x7-OR
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 22, 2021 at 09:33:59AM -0700, Daeho Jeong wrote:
> On Thu, Jul 22, 2021 at 9:26 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Thu, Jul 22, 2021 at 09:17:54AM -0700, Eric Biggers wrote:
> > > > I think it matches with FIEMAP_EXTENT_UNWRITTEN. Otherwise, we should
> > > > shorten the last extent like below.
> > > >
> > > >         fe_logical=0    fe_physical=16384  length=4096
> > > >         fe_logical=4096 fe_physical=81920  length=4096
> > > >         fe_logical=8192 fe_physical=147456 length=4096
> > > >
> > > >
> > > >   Unwritten extent - the extent is allocated but its data has not been
> > > >   initialized.  This indicates the extent's data will be all zero if read
> > > >   through the filesystem but the contents are undefined if read directly from
> > > >   the device.
> > >
> > > Well, as I said before, using UNWRITTEN isn't appropriate because it indicates
> > > that the data is all zeroes, which in this case it is not.  Similarly, reporting
> > > a hole isn't appropriate because it also indicates that the data is all zeroes
> > > and also that it has no space allocated on-disk at all.
> > >
> > > I think we should just over-report the physical length of the last extent in the
> > > cluster, which is what btrfs does...
> > >
> >
> > Also keep in mind that as far as fiemap is concerned, when FIEMAP_EXTENT_ENCODED
> > is set (indicating that the data is compressed or encrypted), then reading the
> > data from disk will have "undefined results"; see
> > Documentation/filesystems/fiemap.rst.  As such, when someone decides to do so
> > anyway (which is necessary for encryption testing), they really need to know
> > *exactly* what they're doing.  So I think it's less bad to bend the rules on
> > extents where FIEMAP_EXTENT_ENCODED is already set.
> >
> > In contrast, your suggestion would incorreectly report some parts of the file as
> > standard extents (or holes) without FIEMAP_EXTENT_ENCODED, so it would be
> > expected that the standard meaning would apply to those parts.
> >
> > - Eric
> 
> I also think it is okay with the FIEMAP_EXTENT_ENCODED flag.
> It is actually all zero in a view of the filesystem internal and still
> undefined if read directly from the device.
> If we remove this extent, it might be confusing to understand the layout of it.

FIEMAP_EXTENT_ENCODED | FIEMAP_EXTENT_UNWRITTEN is contradictory, so that
doesn't seem like a good option.  And no, the range is *not* zero when read from
the file by userspace, which is what UNWRITTEN is supposed to indicate.

Compressed data is terminated by an end-of-stream marker, so it is possible to
decompress even if extra data is appended to it.  So that's another reason why I
feel that my suggestion is not as bad as the other options.

> Plus, I think we need to remove the last extent, when we return back
> the block to the free space pool to filesystem using releasing
> reserved space ioctl.

This seems to be a filesystem implementation detail.  Again, FS_IOC_FIEMAP is
just about returning the actual extent mapping, not about other filesystem
implementation details.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
