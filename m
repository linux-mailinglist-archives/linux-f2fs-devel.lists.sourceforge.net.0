Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7176B16F4CC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Feb 2020 02:12:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6lFS-0005b4-Lc; Wed, 26 Feb 2020 01:12:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1j6lFR-0005av-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 01:12:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XrvzVlKEA2gNxgUdISfz2GWdsTaodYDrBAmAr0RulmE=; b=KNDsGQkkWUczZi/A1WDr4PzJ30
 3b/rjcglje2TSL7RLIuIjsq3f3zWL1nA/1R3kJntOdPaF4SeNEVEDPCGnzTBrDTBhKKUGIDq7szud
 tSrORwyflRhIWS4Ao9ANpPCI2QT6FxLeOlMtSM6Je/MHAcKt2U+jaWmFnqIwNPZ7jFtE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XrvzVlKEA2gNxgUdISfz2GWdsTaodYDrBAmAr0RulmE=; b=WvcV4+eInRJ5ZYY3379OiA/OkP
 kLcLQgmOpYh58jyisGcevAUzwk4szBeJFFWAjbdaCsbqBxQAQJ+1gFNuPESVfdsbfrhyg06Fv5NDM
 sZMNR0N1fXub43Fah3yWYoJrb3YN5AuT/G4n+2n5+80Uh4r6G1GeWj2xzepaN0HwxUSM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6lFF-009u05-Id
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Feb 2020 01:12:25 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 877AA20732;
 Wed, 26 Feb 2020 01:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582679528;
 bh=0pd2L0V39Irh1qfpzk47vY1wiZKCu530Z4tcoP6sR2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P4o0t5Q2Gvf1XVm3IJMpJ1c3Ex2gM86Q5S6WwXI30ghOQkr8vYWiOSgdos5lz3xCC
 C21NH2ik1z+wUtTahz4GwWJZGKKqJi0BDgszJz+gl26eL5OfQCP8N/vPJyxpOnTLAr
 GyErSh1DcqsYjcY6A7tig9yx1gAG2DSyidmA9z7I=
Date: Tue, 25 Feb 2020 17:12:06 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Message-ID: <20200226011206.GD114977@gmail.com>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
 <20200221172244.GC438@infradead.org>
 <20200221181109.GB925@sol.localdomain>
 <1582465656.26304.69.camel@mtksdccf07>
 <20200224233759.GC30288@infradead.org>
 <1582615285.26304.93.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582615285.26304.93.camel@mtksdccf07>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: 1.6 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j6lFF-009u05-Id
Subject: Re: [f2fs-dev] [PATCH v7 6/9] scsi: ufs: Add inline encryption
 support to UFS
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
Cc: linux-block@vger.kernel.org,
 Ladvine D Almeida <Ladvine.DAlmeida@synopsys.com>, linux-ext4@vger.kernel.org,
 linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Parshuram Raju Thombare <pthombar@cadence.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 Satya Tangirala <satyat@google.com>, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 25, 2020 at 03:21:25PM +0800, Stanley Chu wrote:
> Hi Christoph,
> 
> On Mon, 2020-02-24 at 15:37 -0800, Christoph Hellwig wrote:
> > On Sun, Feb 23, 2020 at 09:47:36PM +0800, Stanley Chu wrote:
> > > Yes, MediaTek is keeping work closely with inline encryption patch sets.
> > > Currently the v6 version can work well (without
> > > UFSHCD_QUIRK_BROKEN_CRYPTO quirk) at least in our MT6779 SoC platform
> > > which basic SoC support and some other peripheral drivers are under
> > > upstreaming as below link,
> > > 
> > > https://patchwork.kernel.org/project/linux-mediatek/list/?state=%
> > > 2A&q=6779&series=&submitter=&delegate=&archive=both
> > > 
> > > The integration with inline encryption patch set needs to patch
> > > ufs-mediatek and patches are ready in downstream. We plan to upstream
> > > them soon after inline encryption patch sets get merged.
> > 
> > What amount of support do you need in ufs-mediatek?  It seems like
> > pretty much every ufs low-level driver needs some kind of specific
> > support now, right?  I wonder if we should instead opt into the support
> > instead of all the quirking here.
> 
> The patch in ufs-mediatek is aimed to issue vendor-specific SMC calls
> for host initialization and configuration. This is because MediaTek UFS
> host has some "secure-protected" registers/features which need to be
> accessed/switched in secure world. 
> 
> Such protection is not mentioned by UFSHCI specifications thus inline
> encryption patch set assumes that every registers in UFSHCI can be
> accessed normally in kernel. This makes sense and surely the patchset
> can work fine in any "standard" UFS host. However if host has special
> design then it can work normally only if some vendor-specific treatment
> is applied.
> 
> I think one of the reason to apply UFSHCD_QUIRK_BROKEN_CRYPTO quirk in
> ufs-qcom host is similar to above case.

So, I had originally assumed that most kernel developers would prefer to make
the UFS crypto support opt-out rather than opt-in, since that matches the normal
Linux way of doing things.  I.e. normally the kernel's default assumption is
that devices implement the relevant standard, and only when a device is known to
deviate from the standard does the driver apply quirks.

But indeed, as we've investigated more vendors' UFS hardware, it seems that
everyone has some quirk that needs to be handled in the platform driver:

  - ufs-qcom (tested on DragonBoard 845c with upstream kernel) needs
    vendor-specific crypto initialization logic and SMC calls to set keys

  - ufs-mediatek needs the quirks that Stanley mentioned above

  - ufs-hisi (tested on Hikey960 with upstream kernel) needs to write a
    vendor-specific register to use high keyslots, but even then I still
    couldn't get the crypto support working correctly.

I'm not sure about the UFS controllers from Synopsys, Cadence, or Samsung, all
of which apparently have implemented some form of the crypto support too.  But I
wouldn't get my hopes up that everyone followed the UFS standard precisely.

So if there are no objections, IMO we should make the crypto support opt-in.

That makes it even more important to upstream the crypto support for specific
hardware like ufs-qcom and ufs-mediatek, since otherwise the ufshcd-crypto code
would be unusable even theoretically.  I'm volunteering to handle ufs-qcom with
https://lkml.kernel.org/linux-block/20200110061634.46742-1-ebiggers@kernel.org/.
Stanley, could you send out ufs-mediatek support as an RFC so people can see
better what it involves?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
