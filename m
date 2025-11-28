Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37694C90C45
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Nov 2025 04:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc6b8yIKkEvAFNt3RXrUpcOp93XvfnamDaC1K96539U=; b=MiGYrNWFKDaFYS+gLtS+f6jEb4
	m+RNDYbOFF2pl6Wu77RevI0d+7+l3sFhTtbJ3wOpECKtGAKZ191uM96qdZ4jgt+d3xg2CrCut65YP
	nEpIeedu+2Mot/1mc5POCimolsHtGPZEpwJmHpBjcML84wPTBVPWFzWzscYx99+ZYF2A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOpFk-0008Lg-Rc;
	Fri, 28 Nov 2025 03:34:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vOpFj-0008La-EI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 03:34:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S2tWEmUExidGd3GPYxN5Tuv/4VFNcNNoXm7ZsTopx1o=; b=BWhjw2bGJrQJUBBNWlODUN8kFJ
 Xrlr+v5oItzfghD2pRCThnaP9C8o+34LtOkWr8aXWU+POPnbdfd2USD492Pm5Kr5iCnHmyN1yo6K4
 6Hewb6SSP81kvK5DKL2tHmyV9vNWAzPKK2FdXWM5JlIPaJ8QAr695VAq29DgulSpLbdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S2tWEmUExidGd3GPYxN5Tuv/4VFNcNNoXm7ZsTopx1o=; b=UHv8lAnwQDiWlWjGGwhJ+C1dDL
 5c1GYIWkfK5eyIizeS/yRTpaNZtmtJHK65efAi640eKekC/rv9a7T9nwFF7ZqEWA4hXghYOSzkk7k
 UnuIGe/lQRoxsgZ0Th+Do74oEXhI2kKng5iCAfpLej76UfB37sfsVV2ScoADj/FXuDbc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOpFj-000894-2W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Nov 2025 03:34:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AB96E43B6D;
 Fri, 28 Nov 2025 03:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61461C116B1;
 Fri, 28 Nov 2025 03:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764300869;
 bh=yAAwbLdNBs4YIvLQRMeyqSnLX/Fe4ol7FBJAHqTjRq0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=P7qkuRAxl1PzCoqJ2K+ATE/Dtivso7yl/BqICRso5hJGwcxfppKBKo0kZAo2THtFL
 jkl+J/jka/8nT5wHQ2ZhcVCMEhL+G+cQtlwWYEPzv47xEYe6GDYYQYR3I17wXbrLLl
 0KKM4DzuJfqYyRLVoiKRs5M7ZLA40nx1clucPqX5qV4cAz1sg7cUYnpzONa4Mqtn0c
 fsFx9IssAPQKE6bWRvdHpvGeyMjceWGXvEIFcd72LzvAdTdNAzxhEANB4SCldqoMI9
 Sm/E7f8s7GxWXVkD8LU+c8CGxgfS6b4x8ZTjLNPnQl3mUsAf4bfNrTDmVqCA//mKE9
 tsQpsxQXRfsgg==
Message-ID: <25a50204-73c0-4426-8680-f7f87599ac05@kernel.org>
Date: Fri, 28 Nov 2025 11:34:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@infradead.org>
References: <20251126061437.658896-1-chao@kernel.org>
 <aSahEs04brIrBcue@infradead.org>
Content-Language: en-US
In-Reply-To: <aSahEs04brIrBcue@infradead.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/26/25 14:41, Christoph Hellwig wrote: > It can only
 return blk_alloc_discard_bio if the the gfp_mask doesn't > allow sleeping
 (which isn't the case here), or nr_sect is zero, > which I hope is a [...]
 Content analysis details:   (-0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vOpFj-000894-2W
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check bio after
 __blkdev_issue_discard()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/26/25 14:41, Christoph Hellwig wrote:
> It can only return blk_alloc_discard_bio if the the gfp_mask doesn't
> allow sleeping (which isn't the case here), or nr_sect is zero,
> which I hope is also not the case as __submit_discard_cmd would
> run into various other problems.  So no, I don't think this is
> patch makes any sense.

Oh, I checked details in bio_alloc_bioset() again, it seems I missed
something for mempool_alloc(), as you mentioned, it may only fail due
to caller is in non-sleep context passing gfp w/ GFP_ATOMIC or
GFP_NOWAIT, which is not the case for f2fs discard.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
