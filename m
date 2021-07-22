Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2D3D279E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jul 2021 18:34:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6beT-00058S-Rs; Thu, 22 Jul 2021 16:34:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1m6beN-00057W-FX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Al4KIImaO5I5AYqFnKrYcNGfsCsfEVprs2wKgsx/Bik=; b=Un7chBNCEPC8BNm9/mob3fvXsp
 m983QXMWf6ZNdQIEoLr/JJ7K4QD8eeYVfHnUIWHta4/ekE1lN858nzvWJLOCdy5joGaFFuAMvPxkR
 ehW6udy139uW1nZyPopFDkYY1O31cLAFH/Zi68dF89dRIPce0AlZGz4phd1IwharBmxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Al4KIImaO5I5AYqFnKrYcNGfsCsfEVprs2wKgsx/Bik=; b=ENLeAsR9F5VgDmts4IBEOZYaUO
 ZjkSYaVAX7JCAK3p7FATvzf4QedIY6GNIFl5uC2KZxwD2pxYMuYxjNed6fTdLg6/38KYaTprlxUAg
 ZWVh68wPWEwB0aJ6+TlunPnrD0Cn51GwzQgeIBDG2/uYJQySrzxHXsjwP1gCyGtS7S0Y=;
Received: from mail-lj1-f172.google.com ([209.85.208.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m6beL-00H0o5-GL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Jul 2021 16:34:19 +0000
Received: by mail-lj1-f172.google.com with SMTP id y7so8133188ljm.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jul 2021 09:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Al4KIImaO5I5AYqFnKrYcNGfsCsfEVprs2wKgsx/Bik=;
 b=t0YZF2Xxa4vp0xFgXetT+UaMyPXTNDGB7E4mOyfpKK1+VwdqxXnVIAGhMJ/DOh6QCo
 TDzENTWr+UzULTVg6XxgSxWOATMz/7ydyF0DdxAUgJNZ2gTlzwkOR6LLRuS0m5w6t9lb
 W3FPtfR2kFzIeI2ngBYhNQcQcT8KpQI9WWlbAE5uSTuiG/qV5Frv+hY1ZAdAOCKz7UDC
 cD0wRPS+mDtbDw+wWa4E58RyDlY5p9fIUDlycVXEBf/6nI8ToQFSEzF0/mIiUkU1CVNU
 BzbrkoHOYikoRND7N9njICha/NS1EXr9i+a5eoYB41ST4KG2RzoPgsVVYEY+x1RWooJR
 Ffqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Al4KIImaO5I5AYqFnKrYcNGfsCsfEVprs2wKgsx/Bik=;
 b=sF9uOd77pCzS914TRCalxrTIX4QOT/ooZQnZwKUMssiCXQNbfh911J+53iGW90ryxi
 i2vyyQPL53Mk0PTZOXRyvhcRpnj3YlaH4HJ+bgwqoTnke39HUbw5MNtdT/f+HxiMfuWu
 ACJWLsOHfogu+cPq8GopkL2FEeu9Ei+9tRrxuZ2V888049HNJdQOXFNSh8MkcTtHE7Ct
 ozvB9ksgWHAvfz+6iR/Qh0/SCq80Z90G5J1sKoeMFwy0ybzh/jiEaFUc2uN3MFRuRnXM
 cDQz4huPqqZSLGkC2DLnALO2N4Wplx2cZq5v+jlAmC1jWt/YJ52KxiV4MGGOt+szimcK
 gj4Q==
X-Gm-Message-State: AOAM530M4cQPPfZlSN1ErCDZud9fQwuzIGnp1epJstbEH+fUYCy/5fRG
 AXNQDlAu+aAgyrC2YJCtzpzoxlI7RawTi7fEAek=
X-Google-Smtp-Source: ABdhPJyAmZhmMCI6gvaHmJ4K4u1UAt8kUnGdZj/6BO/VGe4FPyzH1CErAG1J8MRq7TEGcQXZRs5Gf/M41Td2/H7ffLI=
X-Received: by 2002:a2e:89da:: with SMTP id c26mr585199ljk.17.1626971650881;
 Thu, 22 Jul 2021 09:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <CACOAw_xq3_ccqzh8dnomFXBOK_iN9LOTsOBYSBzDJHSSDrRxVw@mail.gmail.com>
 <YPi4rRg2ZPFBWaTZ@sol.localdomain>
 <CACOAw_xeTSa8J_9=+6thXvFT75u734D5asNRogUxt+DC-tPhxg@mail.gmail.com>
 <YPjGsSEdsoSsCJlB@sol.localdomain>
 <CACOAw_yWAUNiziiQuZgRDaVrOxceuEpO8QtoYGmhxxJV2s7wWQ@mail.gmail.com>
 <YPjQQTjJ6rO2sx/o@sol.localdomain>
 <CACOAw_yfG494AK=XH_xzeTDWn-a1mYF+537=VTT6oX6RgLGxnw@mail.gmail.com>
 <YPmB8etJZ+vN0fDT@gmail.com>
 <CACOAw_y7vabxw6Ena4FSuA2bfA_Unq2bEpQq1pSJ0-zi3YCa8w@mail.gmail.com>
 <YPmaMFlR6/tJTmpQ@gmail.com> <YPmcMpbv3kxSZOs8@gmail.com>
In-Reply-To: <YPmcMpbv3kxSZOs8@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 22 Jul 2021 09:33:59 -0700
Message-ID: <CACOAw_zTHM_aYdLLxoSn7SvXB99CgVMu8eMKQ=Poqb_p_gVoOg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m6beL-00H0o5-GL
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

On Thu, Jul 22, 2021 at 9:26 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Jul 22, 2021 at 09:17:54AM -0700, Eric Biggers wrote:
> > > I think it matches with FIEMAP_EXTENT_UNWRITTEN. Otherwise, we should
> > > shorten the last extent like below.
> > >
> > >         fe_logical=0    fe_physical=16384  length=4096
> > >         fe_logical=4096 fe_physical=81920  length=4096
> > >         fe_logical=8192 fe_physical=147456 length=4096
> > >
> > >
> > >   Unwritten extent - the extent is allocated but its data has not been
> > >   initialized.  This indicates the extent's data will be all zero if read
> > >   through the filesystem but the contents are undefined if read directly from
> > >   the device.
> >
> > Well, as I said before, using UNWRITTEN isn't appropriate because it indicates
> > that the data is all zeroes, which in this case it is not.  Similarly, reporting
> > a hole isn't appropriate because it also indicates that the data is all zeroes
> > and also that it has no space allocated on-disk at all.
> >
> > I think we should just over-report the physical length of the last extent in the
> > cluster, which is what btrfs does...
> >
>
> Also keep in mind that as far as fiemap is concerned, when FIEMAP_EXTENT_ENCODED
> is set (indicating that the data is compressed or encrypted), then reading the
> data from disk will have "undefined results"; see
> Documentation/filesystems/fiemap.rst.  As such, when someone decides to do so
> anyway (which is necessary for encryption testing), they really need to know
> *exactly* what they're doing.  So I think it's less bad to bend the rules on
> extents where FIEMAP_EXTENT_ENCODED is already set.
>
> In contrast, your suggestion would incorreectly report some parts of the file as
> standard extents (or holes) without FIEMAP_EXTENT_ENCODED, so it would be
> expected that the standard meaning would apply to those parts.
>
> - Eric

I also think it is okay with the FIEMAP_EXTENT_ENCODED flag.
It is actually all zero in a view of the filesystem internal and still
undefined if read directly from the device.
If we remove this extent, it might be confusing to understand the layout of it.

Plus, I think we need to remove the last extent, when we return back
the block to the free space pool to filesystem using releasing
reserved space ioctl.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
