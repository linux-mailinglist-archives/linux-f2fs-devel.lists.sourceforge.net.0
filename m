Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB833EF67A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 02:06:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mG96O-00061c-Lj; Wed, 18 Aug 2021 00:06:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1mG96G-00061J-P5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 00:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aKHjSMVDxfi5chv16jvBjit4gsF2/ps7wjHKPm+a980=; b=cre/MzOZyHqMUq4qPduXMicepB
 i30Aws4SOLzp66AUniuuZIrqq+kBjLM0Sc/9oVneBVtxFYmdegXROZKFWhTCcje2OwjKhrMOcm3TH
 sGtTkWbY/Bt8pYie1ak5t60svXFz9DyFSIsnpWb/qWqN0swzUjArytfIUOkROiBMytcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aKHjSMVDxfi5chv16jvBjit4gsF2/ps7wjHKPm+a980=; b=NT1JKcII2smO2eOo890bWBbJTg
 JPHy5XfwppoOxAVHs9uVDGGhTPOplBA3QMghZ3VZYCVcsMYrvPvpGQlQNHNYIowO3umA6wuaJSvs9
 jXPAjAkzF98rqyfEPx3MIdkuE8SXuDmJPhgR3VGYP+Ibqa5JH39KonJnqOwQstnX3UlU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mG96D-009qlr-GC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 00:06:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0D72601FA;
 Wed, 18 Aug 2021 00:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629245184;
 bh=gZg1UtCJiztDrJ25z8aSbakGUsVL/7mPg4qd/KxqXkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ogfKnf4KQ3JNLZVZESpD1EyBWo0GbhsrY8/MQkVTKYo65b3F8m5vrwe3YO2vZqcmx
 0pF0O+4P6l8CBkfop9inJXEUQdeo0CEF7Ihm5vM4mwCEftxm8+QKhyRg26aZg71wUX
 4wzrbNErM3S77UkY+9TMfeHmAVZ4G5GmmDfobGhIvFZLL83FZwO6bJK/4KZl2lDp1c
 /WNZJL8Gp4TMrWZKGZVCKFAehpnqH5UwAmC3TGl3EqYxyL1zzNC+GlB3Q1OSjmRrw/
 34ULnyfNmuEtNITqAVkAHD8oZVCyHVEMbqPYHBKOxy8TsGNm1ePd2H2pL9L4mZ2eHv
 O4N+2F2y5RFVA==
Date: Tue, 17 Aug 2021 17:06:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YRxO/tzo15OTfbaZ@gmail.com>
References: <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
 <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
 <YQidOD/zNB17fd9v@google.com> <YRsY6dyHyaChkQ6n@gmail.com>
 <YRtMOqzZU4c1Vjje@infradead.org> <YRwGqsLgyKqdbkGX@google.com>
 <YRwblEj2b/tIBh8b@gmail.com> <YRwrDdcryfTH4Vwi@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRwrDdcryfTH4Vwi@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Aug 17, 2021 at 02:33:01PM -0700, Jaegeuk Kim wrote:
 > On 08/17, Eric Biggers wrote: > > On Tue, Aug 17, 2021 at 11:57:46AM -0700, 
 Jaegeuk Kim wrote: > > > On 08/17, Christoph Hellwig wrote: > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mG96D-009qlr-GC
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

On Tue, Aug 17, 2021 at 02:33:01PM -0700, Jaegeuk Kim wrote:
> On 08/17, Eric Biggers wrote:
> > On Tue, Aug 17, 2021 at 11:57:46AM -0700, Jaegeuk Kim wrote:
> > > On 08/17, Christoph Hellwig wrote:
> > > > On Mon, Aug 16, 2021 at 07:03:21PM -0700, Eric Biggers wrote:
> > > > > Freeing preallocated blocks on error would be better than nothing, although note
> > > > > that the preallocated blocks may have filled an arbitrary sequence of holes --
> > > > > so simply truncating past EOF would *not* be sufficient.
> > > > > 
> > > > > But really filesystems need to be designed to never expose uninitialized data,
> > > > > even if I/O errors or a sudden power failure occurs.  It is unfortunate that
> > > > > f2fs apparently wasn't designed with that goal in mind.
> > > > > 
> > > > > In any case, I don't think we can proceed with any other f2fs direct I/O
> > > > > improvements until this data leakage bug can be solved one way or another.  If
> > > > > my patch to remove support for allocating writes isn't acceptable and the
> > > > > desired solution is going to require some more invasive f2fs surgery, are you or
> > > > > Chao going to work on it?  I'm not sure there's much I can do here.
> > > > 
> > > > Btw, this is generally a problem for buffered I/O as well, although the
> > > > window for exposing uninitialized blocks on a crash tends to be smaller.
> > > 
> > > How about adding a warning message when we meet an error with preallocated
> > > unwritten blocks? In the meantime, can we get the Eric's patches for iomap
> > > support? I feel that we only need to modify the preallocation and error
> > > handling parts?
> > 
> > A warning message would do nothing to prevent uninitialized blocks from being
> > leaked to userspace.
> 
> To give a signal that it's a known issue that we'll fix later.
> 

This bug is concerning mainly because it's a security vulnerability: anyone with
read+write access to just one file on an f2fs filesystem can effectively read
all other files on that filesystem.  A warning message wouldn't change that.

And even in the case of this bug breaking a non-malicious program, hardly anyone
reads kernel log messages anyway.  If something is broken, having a log message
that says "yeah, this is broken, sorry" isn't going to accomplish much...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
