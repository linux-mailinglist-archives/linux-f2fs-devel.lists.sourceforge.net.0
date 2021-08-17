Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644A3EF387
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 22:27:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mG5g9-0002kJ-MH; Tue, 17 Aug 2021 20:27:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1mG5g8-0002k6-Hy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 20:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BWUxSw6XqeyJauHipz09i4ioHfFZNkgzXnJBpfp12SU=; b=V07QXDyKzNcrwoZNu9iuYiPGJj
 2ttWt98U0BkZuRv2wPkEHSNSyIpJ4352NzLKLaEMT9JFAmH0zk7unw8zurw+EqC6w3F3jSjJINge8
 bJnNYymfavvmFH3n/3t8rClLjNDFsbleOK9UstS2qdnwnFYq22py7PIVkeUOd14CWEcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BWUxSw6XqeyJauHipz09i4ioHfFZNkgzXnJBpfp12SU=; b=GvDon59ePAw5GlPSR0N4Mp5RiJ
 nDgVgf+rIPBt96MOddIx3GO48dmPufUbT8mTvtfI9OlMD18BOt0bfVR5O2N9zCjc17mQC8nEeDVqD
 asDNoGJptpdbnRUY5yrRGJcF2dZfv+iwwquq/MCky33MWrKq9SLsRwcXCZqbUt4EImY0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mG5g1-009gjV-NC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 20:27:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A15986023E;
 Tue, 17 Aug 2021 20:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629232021;
 bh=7uXwMUE6nCVLGwC/jf/GBBmqfuoSPzQ5my11HXxJJ+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XDVt4BIw8TZ4dDwPOYDNZ/G2MStCyFFOrVF8PKDzwzYf5nzchnVIan7DsQQFZTMyw
 /pKEAn4QeBsUxi5xf1lm/n79gqavsC2qCXa+XlN4DvCCjFFS072Wh1VBjL0U78Gy19
 frL/rs06eFjKxkzUQlv+77vJv/VAH1GfNu8Or52MXcLl51OQkoMKdVAdhb73d+b/R/
 L/ZbqvAzPueK/JiwfyPkooo4BcGXkRwCS8BEWlYbSlQq9/z72QkJOeprhsne5ZekPo
 uLpARkcYqMiThu886GNZg5/bKH0rvHUg2aYI1ja2foEfELKrOhlJMwkbWTpiCEej2O
 Hrtd2cL8QOdig==
Date: Tue, 17 Aug 2021 13:27:00 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YRwblEj2b/tIBh8b@gmail.com>
References: <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
 <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
 <YQidOD/zNB17fd9v@google.com> <YRsY6dyHyaChkQ6n@gmail.com>
 <YRtMOqzZU4c1Vjje@infradead.org> <YRwGqsLgyKqdbkGX@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRwGqsLgyKqdbkGX@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 17, 2021 at 11:57:46AM -0700, Jaegeuk Kim wrote:
 > On 08/17, Christoph Hellwig wrote: > > On Mon, Aug 16, 2021 at 07:03:21PM
 -0700, Eric Biggers wrote: > > > Freeing preallocated blocks on [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mG5g1-009gjV-NC
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 17, 2021 at 11:57:46AM -0700, Jaegeuk Kim wrote:
> On 08/17, Christoph Hellwig wrote:
> > On Mon, Aug 16, 2021 at 07:03:21PM -0700, Eric Biggers wrote:
> > > Freeing preallocated blocks on error would be better than nothing, although note
> > > that the preallocated blocks may have filled an arbitrary sequence of holes --
> > > so simply truncating past EOF would *not* be sufficient.
> > > 
> > > But really filesystems need to be designed to never expose uninitialized data,
> > > even if I/O errors or a sudden power failure occurs.  It is unfortunate that
> > > f2fs apparently wasn't designed with that goal in mind.
> > > 
> > > In any case, I don't think we can proceed with any other f2fs direct I/O
> > > improvements until this data leakage bug can be solved one way or another.  If
> > > my patch to remove support for allocating writes isn't acceptable and the
> > > desired solution is going to require some more invasive f2fs surgery, are you or
> > > Chao going to work on it?  I'm not sure there's much I can do here.
> > 
> > Btw, this is generally a problem for buffered I/O as well, although the
> > window for exposing uninitialized blocks on a crash tends to be smaller.
> 
> How about adding a warning message when we meet an error with preallocated
> unwritten blocks? In the meantime, can we get the Eric's patches for iomap
> support? I feel that we only need to modify the preallocation and error
> handling parts?

A warning message would do nothing to prevent uninitialized blocks from being
leaked to userspace.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
