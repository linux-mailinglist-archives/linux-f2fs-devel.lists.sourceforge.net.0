Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38277623D57
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 09:21:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot2oX-0002Uh-D4;
	Thu, 10 Nov 2022 08:21:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ot2oO-0002UL-8T
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 08:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KhfBPVNigsNYxucWq5bwhNOQ18tGyyrtcDQ6qhXlKS8=; b=ikfD5gkfXC9tXm8xS8xb2wJhXA
 BK+Awi49Bt8cK+v2UyzGbQA/fjkrxTdDrVTSgNBk858QrostgMk6D2Kvgtr+Nn4mywQktmzj/Vajr
 5xwDgCqTwzObQjNfVKdMT4/+CDMjgHCrBSAFgI52Mpehg1AGaFcJeVVMnXpVzCMaqAa8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KhfBPVNigsNYxucWq5bwhNOQ18tGyyrtcDQ6qhXlKS8=; b=BvusdsONWyGvxj66fip8RdXcol
 3DTCHYjeERa6rm/OAEQl6vkISKUdStXt0nf5VB7+gyAf5vZ/KmyHXFKHnGMVyE8VomOvAnZhDeyaG
 Ymp7WvL6o8hN6FHyYHQkRn2gMAaKSa3XvqFsEcJRovnAtmLP2UjIjtWs+GNdyJrTLQrw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot2oM-002sll-AZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 08:21:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B892B820FC;
 Thu, 10 Nov 2022 08:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C99C433D6;
 Thu, 10 Nov 2022 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668068468;
 bh=V4PksRxciyWcpEl1FdsFkRS1q41vAQbL5WxWCTxZ4R4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ATUHt+2OYi+BTLL9Rfxm4zhC247eXcHkpbBDYWoqk2gEP9R45S/C5ZMMpgvvfeNHU
 cCw5wY6Kd+ABxfmMZ6j1Z15h4eUDR3qTwej29NIYfbSkbHIrBY8m+lAIlr/QSev1Ju
 I2awfYbJ+HG+OO7LUcG7KW0oZZHmtahpxI8cOOg89EN/nTS1g97axe09YJ74/jmyT2
 Xxl/lesbwfM4GDXzdAlu9r+EWOVWakcbb/cwUdGOqT4Wh/PvRvKbJbGmv1JNwiqHHp
 8xcwbvEEZvbQGFRHk3FA4BnAn7lwgtQd2t8UTYS63n796Of1ee7CL7MO2kMmC5+xAu
 SRmskugnBGtmg==
Date: Thu, 10 Nov 2022 00:21:06 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <Y2y0cspSZG5dt6c+@sol.localdomain>
References: <20221028175807.55495-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028175807.55495-1-ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 28, 2022 at 10:58:07AM -0700, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > As a step towards freeing
 the PG_error flag for other uses, change ext4 > and f2fs to stop [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ot2oM-002sll-AZ
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 28, 2022 at 10:58:07AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> As a step towards freeing the PG_error flag for other uses, change ext4
> and f2fs to stop using PG_error to track verity errors.  Instead, if a
> verity error occurs, just mark the whole bio as failed.  The coarser
> granularity isn't really a problem since it isn't any worse than what
> the block layer provides, and errors from a multi-page readahead aren't
> reported to applications unless a single-page read fails too.
> 
> f2fs supports compression, which makes the f2fs changes a bit more
> complicated than desired, but the basic premise still works.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> In v3, I made a small simplification to the f2fs changes.  I'm also only
> sending the fsverity patch now, since the fscrypt one is now upstream.  
> 
>  fs/ext4/readpage.c |  8 ++----
>  fs/f2fs/compress.c | 64 ++++++++++++++++++++++------------------------
>  fs/f2fs/data.c     | 48 +++++++++++++++++++---------------
>  fs/verity/verify.c | 12 ++++-----
>  4 files changed, 67 insertions(+), 65 deletions(-)

I've applied this to the fsverity tree for 6.2.

Reviews would be greatly appreciated, of course.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
