Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC2109330
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 18:59:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZIdw-0001AQ-81; Mon, 25 Nov 2019 17:59:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iZIdv-0001AE-96
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 17:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iR0/Hucdv3j8LqG791ml5ClhGVd1JTHq07IIeg38yoU=; b=WN7jP+Z2oeykP9mhVnRTkOTThC
 pxMpUl1jiWxLe5paN4UJEunDBTzk/OYamIeQ2uEthOe1WJjbzxgaP/mUwWGMthzI7YjDsLfCyjj7l
 sGp3lIHjQHEvuomHy/0KfE3rNHVZw5ARRb8+PlbT8AhwQA9ziUV3rj8cq0xDseh0O4zI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iR0/Hucdv3j8LqG791ml5ClhGVd1JTHq07IIeg38yoU=; b=E3bxqr8oMte3UGiHmEMygKKxe1
 ppL2B0IrTnWtJ7wwO1D0FKCU4f5iLtw89Qbt+Gm7X+PuOs8XhAi9/xSLpjXw2JvYFpER+5Otrx8eW
 29WXE2MPlDpC8+JKeKGigRAoIsc4ltU0Y+5h+tGpELNK9Yo/MRcrbY8WAA7P+GG4VGeI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iZIdr-00DWh8-Q5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 17:59:23 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1721720679;
 Mon, 25 Nov 2019 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574704754;
 bh=KeQcj2AKHVhcae5ILgNCmFk/tRvBlisVKhy3DFIZA1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yAhngtwOvHCL1fYdnEEbD3QRzDnSUoSdtwsxjwj6+a1i1oT56fZJhYAeDWOX9pYoJ
 xqaYgcyIFhuTi5dVMgwAvRXZ0wF5ScvW9P8jBQhJVFk86A8Oz0PT3jLdQXlMaD6ayz
 ORtsLGOdmTQelG61JjEYrNOPWeP55O76jyMrx3o4=
Date: Mon, 25 Nov 2019 09:59:13 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <20191125175913.GC71634@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190518004751.18962-1-jaegeuk@kernel.org>
 <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
 <1e1aae74-bd6b-dddb-0c88-660aac33872c@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e1aae74-bd6b-dddb-0c88-660aac33872c@acm.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iZIdr-00DWh8-Q5
Subject: Re: [f2fs-dev] [PATCH v2] loop: avoid EAGAIN,
 if offset or block_size are changed
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
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/19, Bart Van Assche wrote:
> On 5/17/19 5:53 PM, Jaegeuk Kim wrote:
> > This patch tries to avoid EAGAIN due to nrpages!=0 that was originally trying
> > to drop stale pages resulting in wrong data access.
> > 
> > Report: https://bugs.chromium.org/p/chromium/issues/detail?id=938958#c38
> 
> Please provide a more detailed commit description. What is wrong with the
> current implementation and why is the new behavior considered the correct
> behavior?

Some history would be:

Original bug fix is:
commit 5db470e229e2 ("loop: drop caches if offset or block_size are changed"),
which returns EAGAIN so that user land like Chrome would require enhancing their
error handling routines.

So, this patch tries to avoid EAGAIN while addressing the original bug.

> 
> This patch moves draining code from before the following comment to after
> that comment:
> 
> /* I/O need to be drained during transfer transition */
> 
> Is that comment still correct or should it perhaps be updated?

IMHO, it's still valid.

> 
> Thanks,
> 

> Bart.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
