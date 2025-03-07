Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863EA57315
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 21:49:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqed5-0000LM-9h;
	Fri, 07 Mar 2025 20:49:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tqed1-0000Kr-8w
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 20:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DzIhgr18pG7inFFCWSj6rwK5m9SNmaNVTpsZcfEKO54=; b=eKLRvkdDhpKZ8y8P3VE+8Llkfr
 bsKXcH2rNQr/AQdjwQB8ogMnoL9j0Hhg4j99UBTD8qKWSmMjzkFUz/xsz5a/shAZXL/G47UfUJWHa
 Z2f8EpqjewCiBjzjHNqioBzZLX5M46vQ3yYg8+g/NMhm9NHMZ4pN1zLy0R/3F4hfx8hA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DzIhgr18pG7inFFCWSj6rwK5m9SNmaNVTpsZcfEKO54=; b=QTbdsvX/9oF1cKNzBi8XOkDSxc
 MSdyfGyLo4Urm4UHNB3Em47b1SmJ4gDyP+aGGqGPDK1U3fEB/Cd6gWPZZPEtJC4fmEEXxNksAfl5k
 sB9YsYJyjMS+8i4lomcjKjXdXJokNklOEdQmGWyZZmDsEU6Y5D/iZlKlV6cNiFY550fI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqecp-0007hg-UT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 20:49:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DzIhgr18pG7inFFCWSj6rwK5m9SNmaNVTpsZcfEKO54=; b=vDGHzYNIxhx6SKCaNWWWlzymC9
 wJyDVgZR7JDqttPhUiGii1N62V1GYmNewjYtvECa0SDIQBn4NfmpjIKx2LraBfPxeJT/4u+0pgxwQ
 xyArswHyBbYAosFs82jKkKfJ/r0BQOzxA9xxqBCwexybJJZezwkn1pWlPFZyfGyfJ43PwYuvpA/bo
 ZwniM2oVPFspHBaJWLLEzI6dpEu/XTGdcf/CxvdsWZhiTUzo1n/pUjAMH6CGDIYWBJU9Mg0H3Mi8m
 OWxAc1Fc8ubMX8GXYGzMLmOOWnwMhU+dVQW4YZt0gz11MiBcfX99/jYzNrxLOWMsTwT8Rf0RdwQzP
 FTXli0PQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tqece-0000000EOs1-1bNF; Fri, 07 Mar 2025 20:48:44 +0000
Date: Fri, 7 Mar 2025 20:48:44 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Z8tbrL1OKN8pqhNe@casper.infradead.org>
References: <20250307182151.3397003-1-willy@infradead.org>
 <Z8tZnN-CAS20Dpi7@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8tZnN-CAS20Dpi7@google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Mar 07, 2025 at 08:39:56PM +0000, Jaegeuk Kim wrote:
 > On 03/07, Matthew Wilcox (Oracle) wrote: > > I was planning on sending
 this next cycle, but maybe there's time to > > squeeze these patch [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tqecp-0007hg-UT
Subject: Re: [f2fs-dev] [PATCH 0/4] f2fs: Remove uses of writepage
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 07, 2025 at 08:39:56PM +0000, Jaegeuk Kim wrote:
> On 03/07, Matthew Wilcox (Oracle) wrote:
> > I was planning on sending this next cycle, but maybe there's time to
> > squeeze these patches into the upcoming merge window?
> > 
> > f2fs already implements writepages and migrate_folio for all three
> > address_space_operations, so either ->writepage will never be called (by
> > migration) or it will only be harmful (if called from pageout()).
> 
> My tree sitting on [1] doesn't have mm-next, which looks difficult to test this
> series for test alone. Matthew, can you point which patches I need to apply
> in mm along with this for test?
> 
> [1] f286757b644c "Merge tag 'timers-urgent-2025-02-03' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip"

Oh, you don't need any extra patches.  The ->writepage removal has been
going on since mid-2021 (commit 21b4ee7029c9 was the first removal, I
believe).


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
