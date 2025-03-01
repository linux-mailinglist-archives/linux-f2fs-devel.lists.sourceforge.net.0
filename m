Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF0A4A7CD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Mar 2025 03:02:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1toCAy-0005S1-Tg;
	Sat, 01 Mar 2025 02:02:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1toCAq-0005Rm-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 02:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xo19L7w+lw8PFKKTrx0paOs9dT4WS4dg25huzJ6jJdE=; b=jM2jRAi0fhs6CEpbgpslWJXYpg
 LVkZZz9t+fAXJGAyf4LBZt8J2KpIrY1TbH/41jFtMZrOBFZZ4GuXMT9KoLJKIFowSdw86POyw9zyv
 PzdUkP2uxEqoEIAFcrzczswCw6znfSO2o399gyyGmeffyiHSQvCYSW4TJ6OGOUYk11ns=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xo19L7w+lw8PFKKTrx0paOs9dT4WS4dg25huzJ6jJdE=; b=nDJ5Y01V/kf6JhUXB4G0x+fpFt
 OI8Lprr0XiIS6jKnI9nrT1CurIdBFSL1GSx3Sda8RvQR7mRKIBSCOafqz1kXJB7dlAO1GTO7qMCZA
 g+Y9bBtXAjlh04SPqZbXD/w1zNz8csmqLYiBHaSbLMnqvMosBk3da9EKPieKtQaLOzNs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1toCAd-00006H-8k for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 02:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xo19L7w+lw8PFKKTrx0paOs9dT4WS4dg25huzJ6jJdE=; b=qEWhBr6m4hrTfJ0D46CoZfaw3c
 stU3yin8yI4savDw9jhiJGpPm1pnUN9JTk4LOIt9gU4UmZgsUEsuUtgAzqC4EOEE8IG1YQ3k6Ldei
 ZxniKt77YPWtpSdStAqQzQepIwYPTqhi5m76zVGqFL3/U6rzNT1CwWTbjjyUQhRU+TN0sqvgt34m3
 tD2xSKQZNZlPCy+rAn9mFTeC3zs7S5hYJPmEZoKJm4k9szsgtnplYLziYKj8yDH4Tt9aftwUi4qXA
 NebRu/qtinF90tub+hJ+tI7zL9xHX5M0qVlDNjd8TBXwL3yms5Qm6K5WzW+OqxJrszxuEjIv46uCh
 aM1+Ovrw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1toC8a-0000000Cinm-433i; Sat, 01 Mar 2025 02:00:15 +0000
Date: Sat, 1 Mar 2025 01:59:32 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Z8JqBAxLr6bWQ1xT@casper.infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-18-willy@infradead.org>
 <39268c84-f514-48b7-92f6-b298d55dfc62@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39268c84-f514-48b7-92f6-b298d55dfc62@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Mar 01, 2025 at 09:15:53AM +0800, Chao Yu wrote: >
 > struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
 > > { > > - return __get_node_page(sbi, nid, NULL, 0); > > + struct [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1toCAd-00006H-8k
Subject: Re: [f2fs-dev] [PATCH 17/27] f2fs: Add f2fs_get_node_folio()
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Mar 01, 2025 at 09:15:53AM +0800, Chao Yu wrote:
> >   struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
> >   {
> > -	return __get_node_page(sbi, nid, NULL, 0);
> > +	struct folio *folio = __get_node_folio(sbi, nid, NULL, 0);
> > +
> 
> 	if (IS_ERR(folio))
> 		return ERR_CAST(folio));

No need.  It's the same result, we use this pattern extensively, and
this is a temporary wrapper that has to go away in the next six to nine
months anyway.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
