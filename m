Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8925C6D2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 18:30:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDs8O-00049Z-Jc; Thu, 03 Sep 2020 16:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <corbet@lwn.net>) id 1kDs8N-00049S-9g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 16:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aJ18mFMmlVWjsvOhtkCF3X3vCFyITfRQyA41MgzPFW8=; b=ZIJC6UoaAqL1LiLFxFyKrx2pGw
 w0X+CI8bCM5bZ3/zwztVBweKfCuCGygnfdl1xNOTaoSSJFx8X9T9IQD9jWPE9MiTlpkCkq2W33x1P
 e1zEC2Hh26DRGl2c4vf4q7xJbsz8gQr8erxx2heP7kDX22Gk6bsM8CoyZa76IqgDfdmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aJ18mFMmlVWjsvOhtkCF3X3vCFyITfRQyA41MgzPFW8=; b=D63vZU351JqktwcTx9C6GuaPA7
 V0Cy3fKFi+17yXSAwayc9hbGViKIaQaI37gcgG7r61LBy8vZ6uvTAkMV/8Ju78cLx+t1ogfgYsNE8
 2mwJOx2DzyGxgR7FR7apFRN6yqNTLHtsaKBjBL82vVbnDtaCUNYWIP5cWLqivIdlbhO8=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDs8K-00AkL8-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 16:30:47 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 93B047DA;
 Thu,  3 Sep 2020 16:30:28 +0000 (UTC)
Date: Thu, 3 Sep 2020 10:30:27 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20200903103027.4c8d0b07@lwn.net>
In-Reply-To: <96f99afb-c54e-8f46-ebac-80a62f65b876@infradead.org>
References: <96f99afb-c54e-8f46-ebac-80a62f65b876@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [45.79.88.28 listed in list.dnswl.org]
X-Headers-End: 1kDs8K-00AkL8-Mc
Subject: Re: [f2fs-dev] [PATCH] f2fs: Documentation edits/fixes
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 2 Sep 2020 17:08:31 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Correct grammar and spelling.
> 
> Drop duplicate section for resize.f2fs.
> 
> Change one occurrence of F2fs to F2FS for consistency.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Chao Yu <yuchao0@huawei.com>
> Cc: linux-f2fs-devel@lists.sourceforge.net
> ---
>  Documentation/filesystems/f2fs.rst |   53 +++++++++++----------------
>  1 file changed, 23 insertions(+), 30 deletions(-)

So this, I guess, needs to go through the f2fs tree since it doesn't apply
to docs-next currently.

Thanks,

jon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
