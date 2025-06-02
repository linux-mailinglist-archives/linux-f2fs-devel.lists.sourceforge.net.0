Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 797DFACA8B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 07:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrZuUrhRSdJCo7mSITt/V9wdT6s7FT+tTLloxbV6xzQ=; b=jQvGy1/dD27t3UZeG2eiSFstHq
	PQU2RUQnzbAH5QcHU/iXcO1tp4TWCTiJyqF5HYvOczp4f+Xk83EcAEoOXsJ/h1WBZm4zixEDRBOKm
	ufQthSNExdZ+H2cbnvWv5bCP+ZMUbbVJ2C0+Tq6ytwcodVoAGlwe7DwmgaRngOGB2jVA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uLxI5-0007fD-PQ;
	Mon, 02 Jun 2025 05:00:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uLxI4-0007f5-K1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 05:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lLEiW0T2qHCHUZjRLRubTtc7et929ZxcBizZQho0DTQ=; b=dyqKRUW/XC9NdEpwRf53pdZbFo
 xi1mH3X9DtSa6O3/43U8g3RqRGpC0b7pwG6+zTpNLFrEWzTJNLUOWkRH2mkTquN7J+7ys13+ujukQ
 6wi35PFj2JTq0K1gcvfHjL2XptIvh8r1KztMw+evnstvC84qRejB31eaYXP8Zn+GGPvc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lLEiW0T2qHCHUZjRLRubTtc7et929ZxcBizZQho0DTQ=; b=LR7lBipHjKg9eoJf3Kn/A6OlxZ
 0GbGYbbbFmr8Xa1Gf9R7fLSJhYgOMPRdIiDs6lCAj0+pCy9E98RgzwkzXTIWZu2gBA77Q6UTwKGEV
 qRY4SUsIiVWBV3NN+lTc2bENEpkfYanQqf4lH5JQvWvdKNBcCiEfFw2B7IGfxoGpeySU=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uLxHy-0004tP-6E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 05:00:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 577DB68CFE; Mon,  2 Jun 2025 07:00:31 +0200 (CEST)
Date: Mon, 2 Jun 2025 07:00:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Message-ID: <20250602050030.GA21716@lst.de>
References: <20250601002709.4094344-1-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250601002709.4094344-1-willy@infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jun 01, 2025 at 01:26:54AM +0100,
 Matthew Wilcox (Oracle)
 wrote: > This conversion moved the folio_unlock() to inside
 __write_node_folio(), 
 > but missed one caller so we had a double-unlock on [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [213.95.11.211 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1uLxHy-0004tP-6E
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix __write_node_folio() conversion
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
Cc: linux-f2fs-devel@lists.sourceforge.net,
 syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jun 01, 2025 at 01:26:54AM +0100, Matthew Wilcox (Oracle) wrote:
> This conversion moved the folio_unlock() to inside __write_node_folio(),
> but missed one caller so we had a double-unlock on this path.

Looks good, thanks!

Reviewed-by: Christoph Hellwig <hch@lst.de>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
