Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC1B3D274E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 18:11:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6bHZ-0006U7-0q; Thu, 22 Jul 2021 16:10:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daeho43@gmail.com>) id 1m6bHX-0006Tz-41
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6XtIU0K0EXnV9+wZ47OpBjvsPrSE/JHkzKXUb+5rhRY=; b=PtI+uHru57pX5t7OkyMGMWGXBA
 LQQnd3vv1sEVa9XRap3D7ZB4m2ryMusI2fcdwdk+goqhQopNCCpd10bziFRbPlEf+0mB7+J+UHPD3
 Cj6KdD34+R9c0TlZy6gXP8nCZmzaxPkmvADHkyWK+FkYDuJpkURgiaUE3uoNM9XVeIVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6XtIU0K0EXnV9+wZ47OpBjvsPrSE/JHkzKXUb+5rhRY=; b=WMnGNGSg7mcFJczwO/3Mb04uFH
 vrP+ol0g4sIjS6OGoF9x+JlKyBDGDUQMhpBNL4l0q03JO5POkQcCC/TYwYrFEo0zRDP+7il2Ir354
 hrXr7vcA6FQL/WVa8HHW0BfjUoeVV8PzDGYbesEf0CpsBz+upmR2vP5JGvuMzyqFB0aM=;
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6bHV-00080N-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:10:43 +0000
Received: by mail-lj1-f176.google.com with SMTP id y25so7227166ljy.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 09:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6XtIU0K0EXnV9+wZ47OpBjvsPrSE/JHkzKXUb+5rhRY=;
 b=rWVYzQLHhVlzli8lgIf06P/d3K6oLlxlr5K4FoZhG6DJPGMgLj8HEsBVlL8VYO0dpO
 pdLVl5hkMTw0yzalOcXe+TBTwh4xtBfM0I8S/nwAhtwwHI0/Ex9PetOWIBwLeZ1QJSh3
 UK6j0T7Qc4Yf02FypHdaMirAEA/g/pw0WKyfdoSmpeCSbDiRWuhcz/2VxrvQoCdniMv5
 EW7oe3pknhwsHlsQivwrB7uTxou6Og0yhXqdfTaoZK0QG3MYFFVzhRyHEzCoMp+TS/jZ
 AJqMkshLHA2SGNO1gSd4p8rQzwYRppgDis+f00sKCWDkRoMKx2rs3qb8p1PpX0PGolDa
 YURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6XtIU0K0EXnV9+wZ47OpBjvsPrSE/JHkzKXUb+5rhRY=;
 b=hsVJdk9SpHX1XSb2sIrAvN5XC92tjaemHXCwwKOsPej6k7Gg1ONCrln1DsM/CNcFzH
 byLWK+F+4fNmcfiH0ZH0/U3jp/o8eIdHcuxYmPSpBXgREiyRenOANWfQ5QHwZHynENdj
 tQzIEKpuSlUNdN31iLHmp2uZT5lFRmg/+q2D15NY7sLPmozR/qRAWQ0EnD//ERaeuLJk
 FQMkY1VkuJMHHXN50z1zgA7wZ0CO4Kui9RX8zRue8hQcUN5jPzrF0L3QkT2zycAZ37Ny
 530xFIgsWcIos7CD8Jj75UXvPuYTaubdNRdXrfwexXuShI3v3RwGT3n3FzMIcsIrap6k
 DYFQ==
X-Gm-Message-State: AOAM531ID34Tj2U7a7QQd5//Vk7YmcPQwyOh481WbNMvNcsWKo0E/kI7
 idAPCsyyPfxjMWxwxux8/ScA4bthgtzPdaYmmzw=
X-Google-Smtp-Source: ABdhPJwZXMoxt4JJsd44g9nWm9k/47z4r1FPOjNT4aCBzkhzeutW4vdXZp6xahkEZ08fOC5MryIqJmXkrNpbIV3QrUg=
X-Received: by 2002:a2e:a815:: with SMTP id l21mr525178ljq.400.1626970235009; 
 Thu, 22 Jul 2021 09:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210721072048.3035928-1-daeho43@gmail.com>
 <YPiTLwB3d8BWSKje@gmail.com>
 <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
 <YPi4rRg2ZPFBWaTZ@sol.localdomain>
 <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
 <YPjGsSEdsoSsCJlB@sol.localdomain>
 <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
 <YPjQQTjJ6rO2sx/o@sol.localdomain>
 <CACOAw_yfG494AK=XH_xzeTDWn-a1mYF+537=VTT6oX6RgLGxnw@mail.gmail.com>
 <YPmB8etJZ+vN0fDT@gmail.com>
In-Reply-To: <YPmB8etJZ+vN0fDT@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 22 Jul 2021 09:10:23 -0700
Message-ID: <CACOAw_y7vabxw6Ena4FSuA2bfA_Unq2bEpQq1pSJ0-zi3YCa8w@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.176 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6bHV-00080N-Ir
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

On Thu, Jul 22, 2021 at 7:34 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Jul 22, 2021 at 01:42:05AM -0700, Daeho Jeong wrote:
> > On Wed, Jul 21, 2021 at 6:56 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Wed, Jul 21, 2021 at 06:40:00PM -0700, Daeho Jeong wrote:
> > > > On Wed, Jul 21, 2021 at 6:15 PM Eric Biggers <ebiggers@kernel.org> wrote:
> > > > >
> > > > > On Wed, Jul 21, 2021 at 06:04:22PM -0700, Daeho Jeong wrote:
> > > > > > >
> > > > > > > How f2fs stores the mapping information doesn't matter.  That's an
> > > > > > > implementation detail that shouldn't be exposed to userspace.  The only thing
> > > > > > > that should be exposed is the actual mapping, and for that it seems natural to
> > > > > > > report the physical blocks first.
> > > > > > >
> > > > > > > There is no perfect solution for how to handle the remaining logical blocks,
> > > > > > > given that the fiemap API was not designed for compressed files, but I think we
> > > > > > > should just go with extending the length of the last compressed extent in the
> > > > > > > cluster to cover the remaining logical blocks, i.e.:
> > > > > > >
> > > > > > >   [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > > > > >
> > > > > > > That's what btrfs does on compressed files.
> > > > > > >
> > > > > > > - Eric
> > > > > >
> > > > > > I also agree that that's an implementation detail that shouldn't be
> > > > > > exposed to userspace.
> > > > > >
> > > > > > I want to make it more clear for better appearance.
> > > > > >
> > > > > > Do you think we have to remove "unwritten" information below? I also
> > > > > > think it might be unnecessary information for the user.
> > > > > > [0..31]: 2683128..2683159 flag(0x1009) -> merged, encoded, last_extent
> > > > > > (unwritten?)
> > > > >
> > > > > FIEMAP_EXTENT_UNWRITTEN already has a specific meaning; see
> > > > > Documentation/filesystems/fiemap.rst.  It means that the data is all zeroes, and
> > > > > the disk space is preallocated but the data hasn't been written to disk yet.
> > > > >
> > > > > In this case, the data is *not* necessarily all zeroes.  So I think
> > > > > FIEMAP_EXTENT_UNWRITTEN shouldn't be used here.
> > > > >
> > > > > > Do you want f2fs to print out the info on a cluster basis, even when
> > > > > > the user asks for one block information?
> > > > > > Like
> > > > > > If the user asks for the info of [8..15], f2fs will return the info of [0..31]?
> > > > >
> > > > > Yes, since that's how FS_IOC_FIEMAP is supposed to work; see
> > > > > Documentation/filesystems/fiemap.rst:
> > > > >
> > > > >         All offsets and lengths are in bytes and mirror those on disk.  It is
> > > > >         valid for an extents logical offset to start before the request or its
> > > > >         logical length to extend past the request.
> > > > >
> > > > > (That being said, the f2fs compression+encryption tests I've written don't
> > > > > exercise this case; they only map the whole file at once.)
> > > > >
> > > > > - Eric
> > > >
> > > > My last question is.
> > > > How about a discontinuous cluster like [0..31] maps to discontinuous
> > > > three blocks like physical address 0x4, 0x14 and 0x24.
> > > > I think we have to return three extents for the one logical region
> > > > like the below. What do you think?
> > > > [0..31] -> 0x4 (merged, encoded)
> > > > [0..31] -> 0x14 (merged, encoded)
> > > > [0..31] -> 0x24 (merged, encoded, last_extent)
> > >
> > > No, please don't do that.  struct fiemap_extent only has a single length field,
> > > not separate lengths for fe_logical and fe_physical, so with your proposal there
> > > would be no way to know how many physical blocks to take from each extent.  It
> > > would be reporting the same part of the file in contradictory ways.
> > >
> > > Like I suggested originally, I think this case should be reported like:
> > >
> > >        fe_logical=0    fe_physical=16384  length=4096
> > >        fe_logical=4096 fe_physical=81920  length=4096
> > >        fe_logical=8192 fe_physical=147456 length=8192
> > >
> >
> > Hi Eric,
> >
> > I think we need to separate one more extent in the example to figure
> > out that the 4 block cluster turned into 3 compressed blocks.
> >
> >        fe_logical=0    fe_physical=16384  length=4096
> >        fe_logical=4096 fe_physical=81920  length=4096
> >        fe_logical=8192 fe_physical=147456 length=4096
> >        fe_logical=12288 fe_physical=0 length=4096
> >
> > What do you think?
> >
>
> [+linux-f2fs-devel, not sure why the list was dropped...]
>
> I think that would work too, but what flags would you use in the last entry?
>
> - Eric

I think it matches with FIEMAP_EXTENT_UNWRITTEN. Otherwise, we should
shorten the last extent like below.

        fe_logical=0    fe_physical=16384  length=4096
        fe_logical=4096 fe_physical=81920  length=4096
        fe_logical=8192 fe_physical=147456 length=4096


  Unwritten extent - the extent is allocated but its data has not been
  initialized.  This indicates the extent's data will be all zero if read
  through the filesystem but the contents are undefined if read directly from
  the device.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
