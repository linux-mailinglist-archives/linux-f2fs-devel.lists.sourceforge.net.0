Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31850508074
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 07:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nh2hZ-0004gy-38; Wed, 20 Apr 2022 05:16:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+4b42fcde86a6810335df+6814+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nh2hX-0004gs-97
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 05:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5aJ4VSTNBoJHIuxjXyVo/HWsgabQBZYBF70E4FQjBKc=; b=IIxjBo80dlrwqJeDlIj9FI49tW
 EYq1hJMjze0irAKUdlC62WolHDQagtgiV2Uw5/MH0amDqYdikDJmxedkTHt5EQm2A8+hBB2m2C9vL
 5RyCTIE1HfaeTaT60aTY++jkyQPkXCAGp2ed0mH8RSjDGcP1MU6AAduZD5otNvtQ0plo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5aJ4VSTNBoJHIuxjXyVo/HWsgabQBZYBF70E4FQjBKc=; b=fY3R6IX/oFjT6/yOvvXNZuWfDC
 yVEtu2W9pzh2pw2qBWGnsLhmysni+LKFrNVMB2fKej51LEsnS7SnWU0jPODQQGkSgbIRwfWgTpiE2
 5aDOfTAdCaa3hMM4FaEBjYzLoJSOPzTZbQMjiDKItO88VABKCuXYPglhCeHiGWitGL2I=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nh2hV-004Plo-F8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 05:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5aJ4VSTNBoJHIuxjXyVo/HWsgabQBZYBF70E4FQjBKc=; b=rVovb28sjZdzotdLqYBUmKrItl
 WevqnWzjnJMvjjRQIvo56X4FgNT6+V8fNsrT3T3UUHktBLgtAEClc+kOAnpbT8azgYeRu5JUL5yKo
 xj9wwoiPowGhi9QcEujijWcjSuWsTKE86zyT76rae29/0ms1FMP5xKQEWQhyfoAwJ6I94swvUwm3Q
 3oc7jwYrDqkN+0a/4fIcwHo8pmgHSfuotxg5HzpPsePMKFKXeog8VW2zsrh9LtC1DuKe762Hwpk4/
 l6H6rFvxjwdyFHRp7cQxO6m+bfDMoT+rz6IYVmhA6Gvc5HEwx+PufElk0s0vmg4SW/8zeh2zu2m4o
 SIhOTCZw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nh2hO-007NNZ-US; Wed, 20 Apr 2022 05:16:18 +0000
Date: Tue, 19 Apr 2022 22:16:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Yl+XIjiuFRN9Pzxv@infradead.org>
References: <20220419215703.1271395-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419215703.1271395-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19, 2022 at 02:57:03PM -0700, Jaegeuk Kim wrote:
 > The block layer for zoned disk can reorder the FUA'ed IOs. Let's use flush
 > command to keep the write order. The block layer can reorder all commands.
 Given that FUA only affects the command itself that should not matter. What
 is this trying to fix? 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nh2hV-004Plo-F8
Subject: Re: [f2fs-dev] [PATCH] f2fs: use flush command instead of FUA for
 zoned device
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

On Tue, Apr 19, 2022 at 02:57:03PM -0700, Jaegeuk Kim wrote:
> The block layer for zoned disk can reorder the FUA'ed IOs. Let's use flush
> command to keep the write order.

The block layer can reorder all commands.  Given that FUA only affects
the command itself that should not matter.  What is this trying to fix?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
