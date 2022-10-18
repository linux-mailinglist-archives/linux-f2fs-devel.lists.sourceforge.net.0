Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D18A7602508
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 09:08:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okghs-00035N-FN;
	Tue, 18 Oct 2022 07:08:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1okghr-00035H-9M
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 07:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FmHH6j3GReoHi/aYqYsEJlSZeZNHdbNlNcSRvN58v7M=; b=KiZVwPTqVuwUJRK2td8GaZYCJ/
 uP11NL8CqimApBb+yQwOQZzKeYjY0dHC50IDFHyqEwSY92201SQLBlCyKEhSFEedhFPUhdg2hdt1a
 hv+SHy2Ow8XwkVth7f6yTGImsokeS8rh9AL4X6sGqDp8cJ3yRq4IC3sS/LLIlYZZCp1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FmHH6j3GReoHi/aYqYsEJlSZeZNHdbNlNcSRvN58v7M=; b=frf5zJQ9iqfrjMOGBF23xOg+Tl
 lgfjNBt+ny/G9OgC1L1fAcXqebxvsgo7NbtFskPQQ3hljgLKw9cBDuBK2NKIMK03uXDkz7CXfdd86
 jhA+I8z+c0kVZy2zCP7p8EFG83f04dtd18cjh9oja3klDuNip6noBQksLdvTo/z1u22s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okghq-0006Mc-K1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 07:08:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C5DEB81D55;
 Tue, 18 Oct 2022 07:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA899C433C1;
 Tue, 18 Oct 2022 07:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666076879;
 bh=Fj9VdPapWV4U5Y1IbjLNZkEft7nk+xSTK0xPlMf5QSE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uqiiypT/X4Mi6+oIg09YWnzQ1pcaPbHl6AtT7QUP0efAmdx4C87r8NdT83fk3rk24
 7bhbddb7xXglJZbhIRye0aeEQA1B3zTiEXb8shIkDsb9dgPF9QfJagb4uKzlbn2X/1
 jmLH4Kl4MQp3+ThgwiSTe+NkLViqj5d0DlvKmnEEeSHxJjcDMAG5HyZRVoOFRXhTdG
 GC54LvENZti2NWaPoQ+rQJB9o7ZIBVD6mtNZwm6Xe/7D644PscfKsxdBBwLhf+ovk7
 dNDVuNxvRRFFEn51EOVnjJRh4uu+6SmuV+fUKqILHpF1eJKH6sfMfWpqIDijKPZncb
 e6FkMYGLds4hw==
Date: Tue, 18 Oct 2022 00:07:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <Y05QzQM2ed8sOJxC@sol.localdomain>
References: <20220827065851.135710-1-ebiggers@kernel.org>
 <YxfE8zjqkT6Zn+Vn@quark> <Yx6DNIorJ86IWk5q@quark>
 <20220913063025.4815466c@canb.auug.org.au>
 <20221018155524.5fc4e421@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221018155524.5fc4e421@canb.auug.org.au>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 18, 2022 at 03:55:24PM +1100, Stephen Rothwell
 wrote: > Hi Eric, > > On Tue, 13 Sep 2022 06:30:25 +1000 Stephen Rothwell
 <sfr@canb.auug.org.au> wrote: > > > > On Sun, 11 Sep 2022 19:54:12 [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1okghq-0006Mc-K1
Subject: Re: [f2fs-dev] [PATCH v5 0/8] make statx() return DIO alignment
 information
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
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-next@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, Keith Busch <kbusch@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 18, 2022 at 03:55:24PM +1100, Stephen Rothwell wrote:
> Hi Eric,
> 
> On Tue, 13 Sep 2022 06:30:25 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > On Sun, 11 Sep 2022 19:54:12 -0500 Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > Stephen, can you add my git branch for this patchset to linux-next?
> > > 
> > > URL: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
> > > Branch: statx-dioalign
> > > 
> > > This is targeting the 6.1 merge window with a pull request to Linus.  
> > 
> > Added from today.
> 
> I notice that this branch has been removed.  Are you finished with it
> (i.e. should I remove it from linux-next)?
> 

Yes, I think so.  This patchset has been merged upstream.  Any more patches
related to STATX_DIOALIGN should go in through the VFS or filesystem-specific
trees.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
