Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D40535FB4E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Apr 2021 21:05:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWkot-0007vG-Ew; Wed, 14 Apr 2021 19:04:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>)
 id 1lWkor-0007v5-B3; Wed, 14 Apr 2021 19:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PeHkcpjjHdBDYZt42puHMbdatIMmB+FRbgrOjCDbfaU=; b=TE/93f/fC7TUlg7WRYtngCJ2xv
 RUztdEvx4CWhAda24yQ18xyg1W91192ZeRq8B6A0GJFPxuimkQRuVp+Jlc/B2ytdn6pOy3WlO5Kuv
 Q+uw6+5jvCALvXHcY3vSj/jp3MjNgOQT2KPz5d/bn/kEHDYlTRpuSkvmDxjOAkadVTu8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PeHkcpjjHdBDYZt42puHMbdatIMmB+FRbgrOjCDbfaU=; b=gGfzNem3YChpcSpPR3JHlozc30
 zWzioG/kam/+KeKo0g1Vbzrtn7DnTRymU5JuZukOFWKuqzoATWJrsKUq7YpM98O2V3bJVm1OCBXfT
 1SEh1l6DJDj+K+jmvq4C2qk2vWHuBkuErpd7OUFYfZ5wOsaQDBrzIA+IfM8pbRukWNso=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lWkol-00578X-TP; Wed, 14 Apr 2021 19:04:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2758F61042;
 Wed, 14 Apr 2021 19:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618427080;
 bh=gwzQcRwbOgaN2/pzYunq2zGc557r7YyWb4fDr1lKMWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e6qnGByFvXV9VYanDYyrfo3Op2Qw3WPOuIw6m4nBoRdH78TMm5J07FTuZb7xBN/F3
 +gmhwMhJW+bcamgtEbdcaQxHpg9EYvFJLvASLGuQXlzvqbswKpjQbTaDyeG3gVlUvo
 fsBoVvMtenSLfi306gn5/M2KhyjleNqmFqYxXTUpZjbJ4/cEGUhR0SqX54cegyrBPD
 QKooXGHCiNK4hWwFqLEQ0J0QAtNfNa+BDh4D28Bgw6qymymoHSh2yPGTOJbo/xz81b
 IomMV3BQNBcHs6FDUTvcyVs5B8ImydLV3N3qNEloL3KnBJOFSt98cjV6VSIpNvE3ab
 SZMgGVoShVL5w==
Date: Wed, 14 Apr 2021 12:04:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Nick Terrell <nickrterrell@gmail.com>
Message-ID: <YHc8xtmzKaazC6kP@gmail.com>
References: <20210330225112.496213-1-nickrterrell@gmail.com>
 <CANr2DbfL2B5Tx+k1AwVh-5dQZ+fNpucJKu9QVQat7QVvK-5AbQ@mail.gmail.com>
 <CANr2DbfZ+fV+GN7CfDi1AFmfsdnX+kGnTA6kayEchtGwfoAE-A@mail.gmail.com>
 <YHc16rz4Y/PkzNH1@gmail.com>
 <CANr2Dbc+2rS7seuXGtU6Y+x0Qv+hrtwz71r+akKeQUXECZaJZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANr2Dbc+2rS7seuXGtU6Y+x0Qv+hrtwz71r+akKeQUXECZaJZA@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lWkol-00578X-TP
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v9 0/3] Update to zstd-1.4.10
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>, Yann Collet <cyan@fb.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Petr Malat <oss@malat.biz>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>, linux-f2fs-devel@lists.sourceforge.net,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org,
 Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 14, 2021 at 11:53:51AM -0700, Nick Terrell wrote:
> On Wed, Apr 14, 2021 at 11:35 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Wed, Apr 14, 2021 at 11:01:29AM -0700, Nick Terrell wrote:
> > > Hi all,
> > >
> > > I would really like to make some progress on this and get it merged.
> > > This patchset offsers:
> > > * 15-30% better decompression speed
> > > * 3 years of zstd bug fixes and code improvements
> > > * Allows us to import zstd directly from upstream so we don't fall 3
> > > years out of date again
> > >
> > > Thanks,
> > > Nick
> > >
> >
> > I think it would help get it merged if someone actually volunteered to maintain
> > it.  As-is there is no entry in MAINTAINERS for this code.
> 
> I was discussing with Chris Mason about volunteering to maintain the
> code myself.
> We wanted to wait until this series got merged before going that
> route, because there
> was already a lot of comments about it, and I didn't want to appear to
> be trying to bypass
> any review or criticisms. But, please let me know what you think.
> 

I expect that most people would like to see a commitment to maintain this code
before merging.  The usual way to do that is to add a MAINTAINERS entry.

Otherwise it is 27000 lines of code dumped on other people to maintain.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
