Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBE6382A0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Nov 2022 04:09:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oyP5k-000220-Jt;
	Fri, 25 Nov 2022 03:09:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oyP5g-00021t-H7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 03:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CPNZE9b+iQ8PPwZ/CpVBRmLXI1AbiSKLXxkkK27QZ+E=; b=D58TRyJhYJArDVkORuM8pO4/wQ
 gaG1GJ34VHU6uDUMctvFtC7+Aexhmj9zrqTxqhzt7AVBhOvUKFKpT6RM/PFTD2AMiLa8XAiJh94U2
 H6NRXhpZcg9ToaKenn5yWjK+9PkXJ2J6eucrtiT7pl6iF+IhJ1i+avBnFdXq0wbbwHaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CPNZE9b+iQ8PPwZ/CpVBRmLXI1AbiSKLXxkkK27QZ+E=; b=AY/dBy2TYcGdBztZ0u7DPCGMl6
 SE4WiS6rKjuoQrnaTb8DKDVgSi7DWVz/zMCKe5dMNpKFHXBCy5h9BedOJ3bkrfXjp5V8Mwkz8L/LG
 CQtyyGQMoqKxQrTokSFJNIstxRpPr1rTQ9ywPCwcAabgoxnTf/QhnHptnLQNOF87BCyM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oyP5e-0005QM-Pw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 03:09:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78A0A62295;
 Fri, 25 Nov 2022 03:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBBBC433D6;
 Fri, 25 Nov 2022 03:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669345755;
 bh=H/DoDAoZstm85hh94iXdPnMrqUx4pgXwtXv19BtPK44=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UwA1bHcu7ETyDaY9YL+Umz67/lYViuBUNUljj1QqwUThaAK1S6n3gKJSyUnXwnrag
 scUO4fn0TSr0zLF24aTV0Lmg61K8CsXFT+0iAvwTxdaqpULfy8KHz3QFdeFleXgeRN
 RZ+SFaxoQmjM9cwey2wmvqIpYXaR5xpEEzqu5Ht2Brf8KyuWzsHn1pbSFQ8EQ9dm9/
 GKlJQwR7+82WVo+7MgZq/LxkarWtSF76WWz4R2fGt+7hnwSUZ+QdKQebREwcxBja+w
 DFjbuYFiE0dTV5at7RO7tv6My6Owqrm2zBaL3m/OQHFxE2oCXoRYjBO03DNbDSLabd
 Znu1g2CWsbjgg==
Date: Thu, 24 Nov 2022 19:09:13 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y4Ax2YqOY8wyhnE8@sol.localdomain>
References: <20221028175807.55495-1-ebiggers@kernel.org>
 <Y2y0cspSZG5dt6c+@sol.localdomain> <Y36ccbZq9gsnbmWw@gmail.com>
 <4b0a548a-5b04-24a6-944d-348d15605dd2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b0a548a-5b04-24a6-944d-348d15605dd2@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 25, 2022 at 11:06:43AM +0800, Chao Yu wrote: >
 On 2022/11/24 6:19, Eric Biggers wrote: > > On Thu, Nov 10, 2022 at 12:21:06AM
 -0800, Eric Biggers wrote: > > > On Fri, Oct 28, 2022 at 10:58 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oyP5e-0005QM-Pw
Subject: Re: [f2fs-dev] [PATCH v3] fsverity: stop using PG_error to track
 error status
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
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 25, 2022 at 11:06:43AM +0800, Chao Yu wrote:
> On 2022/11/24 6:19, Eric Biggers wrote:
> > On Thu, Nov 10, 2022 at 12:21:06AM -0800, Eric Biggers wrote:
> > > On Fri, Oct 28, 2022 at 10:58:07AM -0700, Eric Biggers wrote:
> > > > From: Eric Biggers <ebiggers@google.com>
> > > > 
> > > > As a step towards freeing the PG_error flag for other uses, change ext4
> > > > and f2fs to stop using PG_error to track verity errors.  Instead, if a
> > > > verity error occurs, just mark the whole bio as failed.  The coarser
> > > > granularity isn't really a problem since it isn't any worse than what
> > > > the block layer provides, and errors from a multi-page readahead aren't
> > > > reported to applications unless a single-page read fails too.
> > > > 
> > > > f2fs supports compression, which makes the f2fs changes a bit more
> > > > complicated than desired, but the basic premise still works.
> > > > 
> > > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > > > ---
> > > > 
> > > > In v3, I made a small simplification to the f2fs changes.  I'm also only
> > > > sending the fsverity patch now, since the fscrypt one is now upstream.
> > > > 
> > > >   fs/ext4/readpage.c |  8 ++----
> > > >   fs/f2fs/compress.c | 64 ++++++++++++++++++++++------------------------
> > > >   fs/f2fs/data.c     | 48 +++++++++++++++++++---------------
> 
> Hi Eric,
> 
> Result of "grep PageError fs/f2fs/* -n"
> 
> ...
> fs/f2fs/gc.c:1364:      ClearPageError(page);
> fs/f2fs/inline.c:177:   ClearPageError(page);
> fs/f2fs/node.c:1649:    ClearPageError(page);
> fs/f2fs/node.c:2078:            if (TestClearPageError(page))
> fs/f2fs/segment.c:3406: ClearPageError(page);
> 
> Any plan to remove above PG_error flag operations? Maybe in a separated patch?
> 

Those are all for writes, not reads.  So I didn't want to touch them in this
patch, which is only about reads.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
