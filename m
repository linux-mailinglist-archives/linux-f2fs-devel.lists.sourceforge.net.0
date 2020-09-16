Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEBE26BFB7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 10:49:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIT7l-0003tn-AY; Wed, 16 Sep 2020 08:49:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ec02f9a336edee825c28+6233+infradead.org+hch@casper.srs.infradead.org>)
 id 1kIT7h-0003tO-5n; Wed, 16 Sep 2020 08:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zkDLxhq3ExbTfk+r0z7F7YPIpcLsGT2h6q/f53LrBqs=; b=MULXVS3enyn/VTLCK8qUqgth9E
 RcIGE0IcnXsHDNiOeBQOpXSzx56QKWWFg+KgLupcCK0X73hCMSSamlSYdiQAurPeWgUiOaxZHVljC
 Gi7+VNcVsAOz1fI3aphMKK3vZoV1ZvFbKzWZ1G3Cl4T94kpI73dnFLOK5IjlVdRxLmFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zkDLxhq3ExbTfk+r0z7F7YPIpcLsGT2h6q/f53LrBqs=; b=l3qsD2CoiNZXy/15mQTHkT+/SU
 uA6MRCuLorz3foj5r+AvkGmh8mLuv0NFjXVFzvjlLnkBvcAyulP71Ojmb6pjWISINtpW1Su3cCQVY
 o+1XW0NCEHxyRIDTmio70ACQsjzC/gfFiwFAlrlxQNrzv4MlVeL3r5S8iTSbE//ciWXk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIT7K-00C64c-G2; Wed, 16 Sep 2020 08:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zkDLxhq3ExbTfk+r0z7F7YPIpcLsGT2h6q/f53LrBqs=; b=VjiIW+S5mYOvePRcTHr4e0bMdB
 OLQbwGWcZtEdJnipfq7KzYukg8H9VIOSqJOzfugbyS0+zSsfVWbugK2CLBiWgsmC2eb4CdDjRdP0H
 qMvKcY3Ux9RDoB5mcDoTghSETFAa4XSGEQBsqeKY3nNBnbGrhvS2I9hAG7ixso0JLWasO4LTZ9vyj
 eZIr8JXKaiKifRCpYTOGMwPRbNnhyiPTvAYFd+nw/Om5lfitGBODfDQfCongaJYE82F0gWXbxIBm+
 x/vFfRA8jXtyjYexrp4cIpmwzL0igff2VQxwnT+3HuMg+RiHtmwozUfnR36iGMQawK2hicLsxqPSy
 0M/u3qjQ==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kIT77-0008Ib-JM; Wed, 16 Sep 2020 08:48:29 +0000
Date: Wed, 16 Sep 2020 09:48:29 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nick Terrell <nickrterrell@gmail.com>
Message-ID: <20200916084829.GA31608@infradead.org>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
 <20200916034307.2092020-2-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916034307.2092020-2-nickrterrell@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kIT7K-00C64c-G2
Subject: Re: [f2fs-dev] [PATCH 1/9] lib: zstd: Add zstd compatibility wrapper
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 15, 2020 at 08:42:54PM -0700, Nick Terrell wrote:
> From: Nick Terrell <terrelln@fb.com>
> 
> Adds zstd_compat.h which provides the necessary functions from the
> current zstd.h API. It is only active for zstd versions 1.4.6 and newer.
> That means it is disabled currently, but will become active when a later
> patch in this series updates the zstd library in the kernel to 1.4.6.
> 
> This header allows the zstd upgrade to 1.4.6 without changing any
> callers, since they all include zstd through the compatibility wrapper.
> Later patches in this series transition each caller away from the
> compatibility wrapper. After all the callers have been transitioned away
> from the compatibility wrapper, the final patch in this series deletes
> it.

Please just add wrappes to the main header instead of causing all
this churn.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
