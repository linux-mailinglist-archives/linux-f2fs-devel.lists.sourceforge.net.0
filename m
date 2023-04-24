Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A12A6ED570
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Apr 2023 21:37:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pr20A-0006LS-Se;
	Mon, 24 Apr 2023 19:37:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1pr209-0006LL-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 19:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DknphQW7x+0bWNmQfJrKAi+J0Jdik1T8XR/fg0Woug8=; b=UK7MjiURY/K96Y0AKBaio2rAs+
 uhvtERLGG/gJ8fAnBUkCBHSKyLQYsy+E6Oofwcb7+KEkn17rIyDVuv4Tv89ccwM3g1+mL0xmere63
 6ZR6dEvN+0/6efPGzXi4n44cJ5D3Z2c1dWSkyk7Q+mHT/17JE5p04soFEDU0xDgG1nX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DknphQW7x+0bWNmQfJrKAi+J0Jdik1T8XR/fg0Woug8=; b=Idh8/kbA1oarY5fnEZp5hL0J74
 K03xJlda3iAr8ObnqOZkgbzY8b5/dvNlEEifALZnOohwGcVMZBGOEP9OoweT/hYppQr4p05yJFy0d
 7rtUQwjLpv7eSNk98InY+w+wtsYuKKn1ql+qYaN0ITzWC2pt5WzauXhb/vVWWrnzO7C0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pr207-000IGg-Hn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Apr 2023 19:37:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E6F961EAB;
 Mon, 24 Apr 2023 19:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566D4C433B3;
 Mon, 24 Apr 2023 19:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682365041;
 bh=YWbSyHY7pUE5AOb/3VWzPWd3sWsQ69Y7x41HE1Dt2f8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kDBWBxcRX36vIRCPQdN4ZUSdbSHX1O4Pd+ZO4nc3vupupBHzNk5Dk91nuDsIQ1rOH
 TqW+/Qd/EiK0dYyV1/5FLrIBnUSpq7xs31OE+7UwRsA5LpC1j9OwF7djbzyJxgWSHk
 cTzUpSzsdO3OotdRptYWv3/TZvD6lEfUf01ojwlUPWNODt2ILOz0Uec1W97Nv2KpIK
 2MP4gf/Xry+1mHMPMV0NAd9hTZgWH4WczEdoc62VroOonVWQQs1erBn2kICiokJEP7
 PLFzocQ/KEmEsnnhZ4aDYS/btGy3oYDzDHqf6NvUrV/g4vv33mYH1BCgXtB4Gbp2FJ
 D0frIKzhrqALw==
Date: Mon, 24 Apr 2023 13:37:18 -0600
From: Keith Busch <kbusch@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ZEbabjCZhl6j1Pk+@kbusch-mbp.dhcp.thefacebook.com>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-3-hch@lst.de>
 <5f30b56e-b46b-1d3f-75fb-7f30ff6ca3e9@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f30b56e-b46b-1d3f-75fb-7f30ff6ca3e9@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 24, 2023 at 12:22:30PM -0700, Randy Dunlap wrote:
 > On 4/23/23 22:49,
 Christoph Hellwig wrote: > > + if (IS_ENABLED(CONFIG_BLOCK))
 > > + inode->i_fop = &def_blk_fops; > > It looks like def [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pr207-000IGg-Hn
Subject: Re: [f2fs-dev] [PATCH 02/17] fs: remove the special !CONFIG_BLOCK
 def_blk_fops
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 24, 2023 at 12:22:30PM -0700, Randy Dunlap wrote:
> On 4/23/23 22:49, Christoph Hellwig wrote:
> > +		if (IS_ENABLED(CONFIG_BLOCK))
> > +			inode->i_fop = &def_blk_fops;
> 
> It looks like def_blk_fops is being removed (commit message and patch
> fragment below), but here (above line) it is being used.
> 
> Am I just confused?

The def_blk_fops is removed only for the !CONFIG_BLOCK case. Its usage is under
a branch known at compile time, so it's optimized out for that case before
trying to resolve the symbol.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
