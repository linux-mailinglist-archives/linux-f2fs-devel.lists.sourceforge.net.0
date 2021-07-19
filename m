Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF0F3CCF6C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jul 2021 10:42:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5Oqk-0001B0-6r; Mon, 19 Jul 2021 08:42:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+9026cc9f21ac068c1222+6539+infradead.org+hch@casper.srs.infradead.org>)
 id 1m5Oqj-0001AR-7r
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QYefk0EIRtQClCJohzzeU0cyNgdqIPkL2m9McJxKjdk=; b=aM7n0kvlYTOKOUNeuaCfnAFRr2
 Sm88SmF3I3e02Q+Yn5ferd5wkpF74ai+QPtdSXL1gaa9Soy8YTotga1DiB4sIprnKPCpIS3/LbFXU
 cWW3fdqhquURf897fSQTYOMvJNKpiCBKprKTZuiYrwtK+hhGGCL41iDhfpj/lBxsoHzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QYefk0EIRtQClCJohzzeU0cyNgdqIPkL2m9McJxKjdk=; b=cwViZ+Z50PLKLskylLpZnLIcxV
 HDZ99+okbXLG6EWbU8QK/pqpDerLb4I4wdY+VH+sLhVez0JyPKfqrOl2GUzslvqn18E0Ji9ZRr67U
 A7tDz6SgM01W4Gy4tmMDalwzn8WAn69bBbiatyTYAhdW2bQlqrr8u3cRrp7oj/P+dki4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5Oqc-00DP5c-0G
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 19 Jul 2021 08:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=QYefk0EIRtQClCJohzzeU0cyNgdqIPkL2m9McJxKjdk=; b=DIgP8EBegSX1CZlm4ESRHIoEm9
 G1B1SaRCc7EtudC1Ogn69nVqqv9i1UtHr/PpD0EjqviFKkATTMgn1hBwHavVli99d2PzzN9bZEbxz
 WRlriu17UJXIvRe3vruoTVPUmdB8L8jaO4U+aTJprSnnNx9gsI6XqTNz30ui7GT/vHulCQNZSgHqn
 4p0oOOt58LE+hAS4h1dhk/T0Je69OndCX5i6gjB30TBWtznBSILSws38s/EAly8S/Q1CKI1HFrAXn
 tZy6+C+NwYhNYSMcp+UVYEBFG68fHbbLU/oBCZaLRC5ka8up50RqtVztBKdG6ihcgxFOMOl4YTh5l
 z5oAebGA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m5Opr-006fB4-7B; Mon, 19 Jul 2021 08:41:23 +0000
Date: Mon, 19 Jul 2021 09:41:11 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YPU6pz2WoYAW3iDJ@infradead.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716143919.44373-3-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m5Oqc-00DP5c-0G
Subject: Re: [f2fs-dev] [PATCH 2/9] f2fs: remove allow_outplace_dio()
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 16, 2021 at 09:39:12AM -0500, Eric Biggers wrote:
> +	do_opu = (rw == WRITE && f2fs_lfs_mode(sbi));

Nit: no need for the braces.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
