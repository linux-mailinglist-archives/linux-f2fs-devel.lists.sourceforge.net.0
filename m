Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED48F6DB49B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Apr 2023 21:57:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pksCe-0003LD-MP;
	Fri, 07 Apr 2023 19:57:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pksCT-0003L6-Ah
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 19:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L7nMWz4T8dPG2YqHE7NChcSp4hpglr9wYt0Ce31DYKY=; b=BW7qDTFvoFlK11XSRkTptMQ8K5
 LyIXS77wlqx/PNlTWvyGn72N955F0eAHyH+jaTHpfhtTYe58PRkns5tkdqRPtaffG9xss6IeOe+uO
 x2dsLb7gVurUyxl9kai6Kzn3evdk1lp/7t1h/lbbciYTPiBxJ8dYSt5Qaq6Xxf9RPvdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L7nMWz4T8dPG2YqHE7NChcSp4hpglr9wYt0Ce31DYKY=; b=kcKfIoaxRL29mA6HDy+mhp9yut
 EDjC8Xstg9BJv6HIxvie2bcnkbGXUn04OreGfqTyBdY9g7F6Zc2h2QXPXqKP2wXZ0H/f+Gna+phh8
 J57moV/mKIQkVIZk0BN7Eifm75yvHTZUMfw8X7/SCRibFkJQXEkSnOXig8QsJTrZTwk0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pksCR-000RMT-MK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 19:56:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B55B65160;
 Fri,  7 Apr 2023 19:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E35C433D2;
 Fri,  7 Apr 2023 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680897397;
 bh=/3ooAeWJ2heTTSe1+fowce2OJCbJkwMvCSSAiGy5dOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=clCdqAdSzIuv2Nh0psGWcWmbbwrVRtKcUMCziwd5jIFOLppq8+hvEMy6JY4RJLPMp
 x59uWAeV4ig4ih4U7jNLyVsnpfqrD7RpPe3yfp1MP72D2FoXdLnTk3xUAdXqNiTo76
 7873hQHGayV2JBek9f5U/Qb89gRu184TbrlBQn0ysEteLtxdwRM5mb1J34RmFP0nuB
 8OYIQ3NfXnHpi+fJ2/tbB2xh0PRWi+ynfmrw1NaYWHy7dBecQ4XC5MBSI2cP1pxqcR
 lMdFOAY4ytF24DuMMy3hoLnO4nDVkkibtBGuHd2D5IXcvpFkh35CRNw0rf+xT87I1L
 SBA+hcx/gQt+g==
Date: Fri, 7 Apr 2023 19:56:36 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZDB1dPVjon4Qthok@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
 <20230405222646.GR3223426@dread.disaster.area>
 <ZC38DkQVPZBuZCZN@gmail.com>
 <20230405233753.GU3223426@dread.disaster.area>
 <20230406004434.GA879@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230406004434.GA879@sol.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 05:44:36PM -0700, Eric Biggers wrote:
 > > Not vmalloc'ed, but vmapped. we allocate the pages individually, but
 > > then call vm_map_page() to present the higher level code with [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pksCR-000RMT-MK
Subject: Re: [f2fs-dev] [PATCH v2 21/23] xfs: handle merkle tree block size
 != fs blocksize != PAGE_SIZE
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com,
 "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 05:44:36PM -0700, Eric Biggers wrote:
> > Not vmalloc'ed, but vmapped. we allocate the pages individually, but
> > then call vm_map_page() to present the higher level code with a
> > single contiguous memory range if it is a multi-page buffer.
> > 
> > We do have the backing info held in the buffer, and that's what we
> > use for IO. If fsverity needs a page based scatter/gather list
> > for hardware offload, it could ask the filesystem to provide it
> > for that given buffer...
> > 
> > > BTW, converting fs/verity/ from ahash to shash is an option; I've really never
> > > been a fan of the scatterlist-based crypto APIs!  The disadvantage of doing
> > > this, though, would be that it would remove support for all the hardware crypto
> > > drivers.
> > >
> > > That *might* actually be okay, as that approach to crypto acceleration
> > > has mostly fallen out of favor, in favor of CPU-based acceleration.  But I do
> > > worry about e.g. someone coming out of the woodwork and saying they need to use
> > > fsverity on a low-powered ARM board that has a crypto accelerator like CAAM, and
> > > they MUST use their crypto accelerator to get acceptable performance.
> > 
> > True, but we are very unlikely to be using XFS on such small
> > systems and I don't think we really care about XFS performance on
> > android sized systems, either.
> > 
> 
> FYI, I've sent an RFC patch that converts fs/verity/ from ahash to shash:
> https://lore.kernel.org/r/20230406003714.94580-1-ebiggers@kernel.org
> 
> It would be great if we could do that.  But I need to get a better sense for
> whether anyone will complain...

FWIW, dm-verity went in the other direction.  It started with shash, and then in
2017 it was switched to ahash by https://git.kernel.org/linus/d1ac3ff008fb9a48
("dm verity: switch to using asynchronous hash crypto API").

I think that was part of my motivation for using ahash in fsverity from the
beginning.

Still, it does seem that ahash is more trouble than it's worth these days...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
