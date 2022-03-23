Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 827484E4D63
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Mar 2022 08:34:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWvVF-00041N-FS; Wed, 23 Mar 2022 07:33:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+e62b50da79483f2da7a7+6786+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nWvVD-00041G-K0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 07:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IL1DTXQ5PLoYDtzOHs2rZCCbl2DebPhnoyDqu6ydMA8=; b=Vc2TfC2OAj4hDDuomRmFbqM7NN
 DsLxpTyJ+TReDbx6v3AUicEAcCzM+SSVCZLl17xX5PzcIlr2CwNemfrflLUgbSgCp8l+r7yKyna8A
 WKevspxe93GIOo9j51GjRPVaONRh3mLSMqe7k2lP7KhbnMcveCg7ufcPVzXWFzdRKjZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IL1DTXQ5PLoYDtzOHs2rZCCbl2DebPhnoyDqu6ydMA8=; b=BcHy/YRnWHy36+4iH8U9syxbxO
 1GTaJW3Yd/JOVRrorZq8wP7fLfNY/TNzhqcSD0Y+j/wX9J6iSVBpcOzxYoqSTbP8Z3pt3bd7JHeEW
 9j0xk5D1u39AiNqSgPC/Wo3v+y4hgP2YgtuIbJDl2ZQHXNUqu15YXgD+e/iZkmc+Kevg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWvV4-0004Oo-Ot
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Mar 2022 07:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IL1DTXQ5PLoYDtzOHs2rZCCbl2DebPhnoyDqu6ydMA8=; b=pvTTIq3vz9PCfsGVX4JxViANnB
 Y2YljE0qJSg5q7PdfzAsI6zEB1NELwqox4PWgEe4k3nyAFrGZ0XU+tWpyCsaWHhz4X2egueJxUbI/
 JD9EJSwKZYTBtdgbwK551Bz55MjQmXwcgYEQ2IgI55anLvcR1ESjk4gttuPZl9NbNAD5unn85kGPB
 o45UVIj5pBYktS2mbU5VGdKHgnnRYK1ztvZsRwxiZ80GciDqwMsICKUBoGjyCr/YaI8118csap9Wm
 ev8jYlgQDWtgKU/xdpyOmiZOUqzEN4FeI5r0P4CdW99nG+DQqzYCcRQDuyYctVEt9wXTfcwB3qUYy
 rKjbVFSQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nWvUk-00D0Ka-5z; Wed, 23 Mar 2022 07:33:26 +0000
Date: Wed, 23 Mar 2022 00:33:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YjrNRpbo/i3tgbAA@infradead.org>
References: <YjjihIZuvZpUjaSs@google.com>
 <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wgsmvoJFKFWxQ2orEVUOWH1agk9iUNZ=-DFh5OXZL=Ldw@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 22, 2022 at 10:22:50AM -0700,
 Linus Torvalds wrote:
 > On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
 > > > > In this cycle, f2fs has some performance improvements [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nWvV4-0004Oo-Ot
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.18
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
Cc: Peter Zijlstra <peterz@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Mar 22, 2022 at 10:22:50AM -0700, Linus Torvalds wrote:
> On Mon, Mar 21, 2022 at 1:39 PM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > In this cycle, f2fs has some performance improvements for Android workloads such
> > as using read-unfair rwsems [...]
> 
> I've pulled this, but that read-unfair rwsem code looks incredibly
> dodgy. Doing your own locking is always a bad sign, and it ahs
> traditionally come back to bite us pretty much every time. At least it
> uses real lock primitives, just in a really odd way.

FYI, Peter and I both pointed this out when the patches were posted
and NAKed the patch, but the feedback was ignored.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
