Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0BBC7A249
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 15:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0bXnHMAJyPBTCOeY7MtH6lyywrSG36a8tjKvAUeauI=; b=fwldVdC9WQSFApyVqwdvctbtql
	aZ/KpISnlnfCiGUaQxbMeOQnsKW5L2lQ2ghYRTzIGQm0S9pUEosbYoAt7oajWQpOghsBOuSrUCm+/
	tgtTdBqGl+W+EwV+UD6k/mHdZJLriqKVH3yP1blHLcChb+CfoZ5MR7RG2XZ9Jq3pLme0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMS7G-0000ao-Rk;
	Fri, 21 Nov 2025 14:28:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vMS7E-0000aV-R9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 14:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ad7rnzLxQ0vJwkKU0eMNiSZLB27i6Dfxa7xXgaavUMQ=; b=Lt1yl9lffa8CXzNnVnLrPsj1cm
 4ypPteUq+8tZ+xqYkpczcH9Efce/Ebqm9uLR/+daKf9CiR6gVib5gRTpAotNPhwIgG3215spmnrQA
 gSn0gTME+ktszw4jnFtJHHPw8Sryizur+9ExNuImk4SZru/Aysri6ciTTYWykpgOTB00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ad7rnzLxQ0vJwkKU0eMNiSZLB27i6Dfxa7xXgaavUMQ=; b=ZSv0C7zETFTB2rRSoKXYV+Zsq1
 joVkOJMVwG+qshl0fDGzXmggLVmjzEbYyyoUctjjKajEbp0eQZYSX88NCPR8+FBlQ4VcfaKReIg9f
 dV7M9luK0DmGIcQ92whNg9G6Y9ytB81ULES36PKysCRQC0ZufVMUYJD4y/Xc6McUVRTE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMS7E-0007xB-Tb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 14:28:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ad7rnzLxQ0vJwkKU0eMNiSZLB27i6Dfxa7xXgaavUMQ=; b=FJWmv5tVIrnBnyTdiO4ltNKUxY
 +ixbn+iOIsLBX2DKsZQwmRZW7qMmU4HKIBjGNBIK2Gw2SuMUl915aMCuzk2+lkelQ4VNfX/Va4iHZ
 QIHZqMFtUHg3uHHCUSypd2e9uiLzyVfPocUPIU+6XKoYzX8FObjf4+766Jvamv6xeHirZGN2Obu44
 Ph4jboO2U5SeK6fPbg2oItZ1EPc3PCR+m+1b2T7WlqHOJyfL4CsdtdVSLQL12RVf10R5+sk7Qm+UF
 hTS2PsCiBh24JDXeINDtfBMjZWv192CGuhgW08r6w5ZLtARY9/oIfULqwDkfP9MLdEZ7UjRFYQmcC
 uxB0DowQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vMS72-00000002zKD-2Kna;
 Fri, 21 Nov 2025 14:27:48 +0000
Date: Fri, 21 Nov 2025 14:27:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aSB25FFkLaJkbVfT@casper.infradead.org>
References: <20251121032718.1993528-1-jaegeuk@kernel.org>
 <aR_pCGtcc7ASeA77@casper.infradead.org>
 <aR_ultJzXh1rmOKs@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aR_ultJzXh1rmOKs@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 21, 2025 at 04:46:14AM +0000, Jaegeuk Kim wrote:
 > On 11/21, Matthew Wilcox wrote: > > On Fri, Nov 21, 2025 at 03:27:18AM
 +0000, Jaegeuk Kim wrote: > > > This patch introduces a new POSIX_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [90.155.50.34 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vMS7E-0007xB-Tb
Subject: Re: [f2fs-dev] [PATCH] [RFC] mm/fadvise: introduce POSIX_FADV_MLOCK
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
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 21, 2025 at 04:46:14AM +0000, Jaegeuk Kim wrote:
> On 11/21, Matthew Wilcox wrote:
> > On Fri, Nov 21, 2025 at 03:27:18AM +0000, Jaegeuk Kim wrote:
> > > This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range of
> > > cached pages, 2) sets the mapping as inaccessible, 3) POSIX_FADV_WILLNEED loads
> > > pages directly to the inaccessible mapping.
> > 
> > ... what?
> > 
> > This seems like something which is completely different from mlock().
> > So it needs a different name.
> > 
> > But I don't understand the point of this, whatever it's called.  Need
> > more information.
> 
> So, the sequence that I'd like to optimize is mmap(MAP_POPULATE) followed
> by  mlock(). For example, mmap() takes 1 second to load 4GB data, and mlock()
> takes 330ms additionally in order to migrate all the pages into inaccessible
> map, IIUC.

Oh, so the MLOCK part is right, but the inaccessible() part is wrong.
Inaccessible is special weird guest_memfd crap that has all kinds of
side-effects that you don't want.

Wouldn't you get the same effect by calling mlock2(MLOCK_ONFAULT) and
then calling readahead() for the desired range?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
