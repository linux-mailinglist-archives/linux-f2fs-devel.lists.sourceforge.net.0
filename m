Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64FA2F47D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Feb 2025 18:00:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thX9U-0001b8-Ex;
	Mon, 10 Feb 2025 17:00:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1thX9T-0001b0-H8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 17:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1DJUXCvBPlZGvBeVh14Hd9ifovvF++10f7KNgGStebc=; b=TgUgHqY/yOacEZgSFEeYrxbOdz
 jckx4taaqhdV6It0L/zkieZbeoVEB/mLPpjCRxxnDrNkeZqOPfWczRdKCowf2w4ptVo6OtxnTj/rZ
 HZk0He/Tq3XiIwVqy26rh72m2uUzSD25keZRyu6Tpf0NgjmzUuku3cZV/oLJ7EIUAB3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1DJUXCvBPlZGvBeVh14Hd9ifovvF++10f7KNgGStebc=; b=ROIyXXu+uBpl9g4HXGN5RpC6gZ
 xCAZeGce2S+5uDp9701SXs5JXzV+WSwkC9/omyFpm1r0iTZ9dyrWMRp1OWWeQf6oIgBfSJh3DZ9Su
 jcrmP9S0blnQIPjYzuWZKeV1qDU5V1KkeH2vxPAVIt8jFbFIcySXIW9VuCa6Nv6lddKE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thX9T-00033S-BN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Feb 2025 17:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63FC55C5578;
 Mon, 10 Feb 2025 17:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70775C4CEE5;
 Mon, 10 Feb 2025 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739206849;
 bh=tpsTov6Qr/s5OOulL+UdOsWM2lAtGYCZxb/IGeVYfOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DLdwuFKfXyQYohVa5/G0tTRg6Koz6o8MJ0B3SPXOH3WjJTcE8wOX9ogcbysaONH6O
 NvIDNmOvJu+h7qhw7Shh/0hRivKcrP2ri4yhbXYEFLZHJlHmk5aRc9xmNNK6iD4UQv
 7SNBm27KcvwtFaVVePvTIx6eC7KX6c4QHKmIwRGRAU7sx4iXGdd5KD5ZvylYUkBbZ8
 K+M+5vmeXJeDuG/AdJAix0fhxM86Lga74z3pr4GmcGN0TH66qGwJdVm1WzwrvqF4ET
 gY6KtdW7Qm/jvO4kM7/0fI7HzYqigY+mHLyxheqOmz7uGXprnNyGtkQS2WCzl6jYis
 JpJKNhQaveRZw==
Date: Mon, 10 Feb 2025 17:00:47 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z6owv7koMsTWH1uM@google.com>
References: <20250117164350.2419840-1-jaegeuk@kernel.org>
 <Z4qb9Pv-mEQZrrXc@casper.infradead.org>
 <Z4qmF2n2pzuHqad_@google.com>
 <Z4qpurL9YeCHk5v2@casper.infradead.org>
 <Z4q_cd5qNRjqSG8i@google.com> <Z6JAcsAOCCWp-y66@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z6JAcsAOCCWp-y66@google.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/04, Jaegeuk Kim wrote: > On 01/17, Jaegeuk Kim wrote:
 > > On 01/17, Matthew Wilcox wrote: > > > On Fri, Jan 17, 2025 at 06:48:55PM
 +0000, Jaegeuk Kim wrote: > > > > > I don't understand how this [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thX9T-00033S-BN
Subject: Re: [f2fs-dev] [PATCH 0/2 v6] add ioctl/sysfs to donate file-backed
 pages
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/04, Jaegeuk Kim wrote:
> On 01/17, Jaegeuk Kim wrote:
> > On 01/17, Matthew Wilcox wrote:
> > > On Fri, Jan 17, 2025 at 06:48:55PM +0000, Jaegeuk Kim wrote:
> > > > > I don't understand how this is different from MADV_COLD.  Please
> > > > > explain.
> > > > 
> > > > MADV_COLD is a vma range, while this is a file range. So, it's more close to
> > > > fadvise(POSIX_FADV_DONTNEED) which tries to reclaim the file-backed pages
> > > > at the time when it's called. The idea is to keep the hints only, and try to
> > > > reclaim all later when admin expects system memory pressure soon.
> > > 
> > > So you're saying you want POSIX_FADV_COLD?
> > 
> > Yeah, the intention looks similar like marking it cold and paging out later.
> 
> Kindly ping, for the feedback on the direction. If there's demand for something
> generalized api, I'm happy to explore.

If there's no objection, let me push the change in f2fs and keep an eye on
who more will need this in general.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
