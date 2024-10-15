Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76999DD5E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 07:05:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0ZkN-0005D4-HV;
	Tue, 15 Oct 2024 05:05:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9a7a7393fdffe154be76+7723+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1t0ZkL-0005Cu-Ex for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 05:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DqxxBECG3Qf88WApnQ1vcQdv3I7w3KQjljwDOi/y3Xs=; b=jyReDgaRKWBCQ4RI1ButgQ/EnW
 7INzqkcDxubFV1pDD4+BkQl5uT3/WMvamjFXBeVoPQFwwuvSP41xc8TiGKn+d3JLMnmom5J8SA1Rk
 mXw6QBuz/Jq8GiHJA2tijlyz2clLjj5Hm6pK5A+MO/auUbHNxejJFqHHE5Hq24Q94XaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DqxxBECG3Qf88WApnQ1vcQdv3I7w3KQjljwDOi/y3Xs=; b=ENqK9ZY3u/tmtLiXjPTlkbnycr
 RGmEqrhEoJ7RGC6pjHyWsuJQzrCKG04JPx0iR8HAaW75kbEiqpm3HYAvT4xL+8wtP37P2Fe0JIe+k
 X8GHgKuKnlZJBH8xhg/jOE+L7EsIyFeKn0NQB33FiNhPuxuBCzhhczfvixZsD9p2OhUs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0ZkJ-0001XD-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 05:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DqxxBECG3Qf88WApnQ1vcQdv3I7w3KQjljwDOi/y3Xs=; b=XF9TDcO6Za8S1oiBOylCVyR5V5
 nHW+XZdzQdT7KB9UgNT5KET1gb9E7iQsbIXNCrjn49afBnB0BBshKoQ8JhGzffvuULJVxcljKU/RF
 Gvc8YnLkvG+wv4pyV5W9/NO0CbwGP7diZi3uRppbWYHAI46HMFbekx3bKFbakfbBWx2Cu2rKAtrj7
 z9BMulMkudBQnqDx5eOXp18jgKAy7cwW5LPN+avqj7cjiZfizZ6XdI5plCKZvG2hhZR26PWISFZOn
 9ZBGE1kP7wjfQu7LtS6BUafyJ544RPFVnIjL5068yRdndEjJ8NiNOHK4PZL9S3o3MWaASi7mHaVDz
 nvBCH+rw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t0Zk8-0000000752W-3q98; Tue, 15 Oct 2024 05:05:12 +0000
Date: Mon, 14 Oct 2024 22:05:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Zw34CMxJB-THlGW0@infradead.org>
References: <20241010192626.1597226-1-daeho43@gmail.com>
 <ZwyyiG0pqXoBFIW5@infradead.org>
 <CACOAw_yvb=jacbXVr76bSbCEcud=D1vw5rJVDO+TjZbMLYzdZQ@mail.gmail.com>
 <Zw1J30Fn48uYCwK7@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zw1J30Fn48uYCwK7@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 14, 2024 at 04:42:07PM +0000, Jaegeuk Kim wrote:
 > > > > Plz,
 refer to this patch and the description there. > > > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1t0ZkJ-0001XD-U7
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: introduce device aliasing file
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 14, 2024 at 04:42:07PM +0000, Jaegeuk Kim wrote:
> > 
> > Plz, refer to this patch and the description there.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev-test&id=8cc4e257ec20bee207bb034d5ac406e1ab31eaea
> 
> Also, I added this in the description.
> 
> ---
>     For example,
>     "mkfs.f2fs -c /dev/block/test@test_alias /dev/block/main" gives
>     a file $root/test_alias which carves out /dev/block/test partition.

What partition?

So mkfs.f2fs adds additional devices based on the man page.

So the above creates a file system with two devices, but the second
device is not added to the general space pool, but mapped to a specific
file?  How does this file work.  I guess it can't be unlinked and
renamed.  It probably also can't be truncated and hole punched,
or use insert/collapse range.  How does the user find out about this
magic file?  What is the use case?  Are the exact semantics documented
somewhere?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
