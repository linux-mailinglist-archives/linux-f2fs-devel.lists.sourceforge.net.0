Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8903A1CFA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jun 2021 20:43:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lr3B5-00010s-8O; Wed, 09 Jun 2021 18:43:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lr3B1-000109-Aw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 18:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dON7xF/idpASYpnfKuhXI4rlP9ab85ZunO4am1eHyf0=; b=VqXborISfn6rcB5CnqmqCNsrPV
 A3Qx+2Rsfk8Q41lKCE6FLGeFp0WK+FvdQVADpSPRd0GOC75DRb0GqCHSyYGxqU2ZM7nNPYI0KnURU
 4URVXInYVQByLmoeVgKHStclKdBfNvWfB0Nm37n9b02BgqcpX/KQgYmFFxHVqTQ8FXhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dON7xF/idpASYpnfKuhXI4rlP9ab85ZunO4am1eHyf0=; b=b29HXiWLk/ciCBrgaAN93pZCHQ
 GnMym096v7++S60HNuS5LysgWL7gbGAAvjVqDsHmtip4FB0lr+u10mHhLQqknslKKuHS9zcN/zKHf
 qopLiKGn+WBrCNDuUTmT1KL2voTYpFL+PFEErR52hGZRUk1q1sFh8r9cdMGJ4m0bJeWI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lr3Aw-002Trk-JJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Jun 2021 18:43:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BBE2613AC;
 Wed,  9 Jun 2021 18:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623264213;
 bh=vQ1SsFfCywlqRQRnaHRZ0AG6i982cLly1NBLPalQ438=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KNq0WJ0yN5xclxnJkMdACG3Nq7ICu17YRELK6TYkDFTbdsmlCv+C6JxITHWzlqi22
 ZKw1TUCA62EdnA12aBTi+YKko9SRWAy3wKyrLQ6tCw5EJicYpB5pks9D1qK1vOMn17
 FPKQ9mNwgC0IZA3FzV8Qw6Q368AlvIkeg65SFSHJim10xmlGe2URIopbZymCTEl3bm
 JGdcCCNIsR/LZcLmK+Lv8Cnr7aJZ8E9UDUJbCc0pr3NRvVZ40OZnN0rPS9TfziWNWg
 L/x90essw1KJFOjv4iCrSzKAJD1wP70/mdKFQmD10HuwiANoFbNbisicFaGDSf/Ocu
 LOSKgO+P8ufNw==
Date: Wed, 9 Jun 2021 11:43:31 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YMEL06gZC5n3J2bX@google.com>
References: <20210525204955.2512409-1-jaegeuk@kernel.org>
 <20210525204955.2512409-2-jaegeuk@kernel.org>
 <95b5669f-a521-5865-2089-320e2a2493de@kernel.org>
 <YL5P15nLsc/3GQOY@google.com>
 <3f2c2543-c8a4-3477-76af-5c7614b643e8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f2c2543-c8a4-3477-76af-5c7614b643e8@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lr3Aw-002Trk-JJ
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: introduce FI_COMPRESS_RELEASED
 instead of using IMMUTABLE bit
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/08, Chao Yu wrote:
> On 2021/6/8 0:56, Jaegeuk Kim wrote:
> > On 06/06, Chao Yu wrote:
> > > On 2021/5/26 4:49, Jaegeuk Kim wrote:
> > > > Once we release compressed blocks, we used to set IMMUTABLE bit. But it turned
> > > > out it disallows every fs operations which we don't need for compression.
> > > > 
> > > > Let's just prevent writing data only.
> > > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > 
> > > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > > 
> > > BTW, we need to expose .i_inline field to userspace since there is no
> > > way to check status of inode whether it has released blocks?
> > 
> > Need to add some in F2FS_IOC_GET_COMPRESS_OPTION?
> 
> We should not change this interface, in order to keep its compatibility for
> userspace usage. How about adding it in F2FS_IOC_GET_COMPRESS_OPTION_EX?

Hmm, or need to add it in getflags?

> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
