Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C2AFB606
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jul 2025 16:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcl3KEV5usAfoSd9CcEgn6Ssef+8WggPVeFEkz1b13g=; b=Rv7wJ7Ybo3juKCK8WtBdJuDcYW
	jvGJvYZVClmOAx5AbZb8XBEELSl/GsAV+NDB2yvicEeKbn1C1QdEGwpgn2qdC22StGg5PIOA6TU0Z
	Ibe7Ao9ZUdBD9J0WXBPDatxm+M32KCHpCdC41mrdjGko8R/vxQsuWUTfqalGEYsgYY6A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYmpd-0004xV-N2;
	Mon, 07 Jul 2025 14:28:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1uYmpZ-0004xL-8t
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 14:28:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OI1L5YL5ipaEmWKqLKOkEhrGHjsWCxp6VA2Fygr0eUI=; b=jsLtWzvcgNXHlzqe/YRZvq0x5y
 494vf6X5mm7Sn/K3u2Bq8o7SvOdjb45xgU8t+V17NKGajvi26dExD1xJ32kIzlrMCJhuqeA1CSQxB
 REnWu8RXYQ+m3IGvICqpm5iHnDY51GSbkIzdtmoMlqgKqPoyZIl3ZwKI6UMlFr0az85Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OI1L5YL5ipaEmWKqLKOkEhrGHjsWCxp6VA2Fygr0eUI=; b=Kzrnaixf68eM+w8HrQRVov4c+9
 O6FvRy/nyavj/bRrVSXpTq+K9BuppnQ1l1V/8i9mDcbGkRaegrVkXaTJC0DcMGu9CFnrw/pXVk/Ex
 4iHdMNlaxNUgMDoxhQqsP3no0/xeXbwPR4Pj3I0qu49zXCDVbej/iyfmZskekxphYmX4=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYmpY-00008V-Kt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 14:28:29 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6B34E68C7B; Mon,  7 Jul 2025 16:28:09 +0200 (CEST)
Date: Mon, 7 Jul 2025 16:28:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundanthebest@gmail.com>
Message-ID: <20250707142809.GA31459@lst.de>
References: <CGME20250529113215epcas5p2edd67e7b129621f386be005fdba53378@epcas5p2.samsung.com>
 <20250529111504.89912-1-kundan.kumar@samsung.com>
 <20250529203708.9afe27783b218ad2d2babb0c@linux-foundation.org>
 <CALYkqXqs+mw3sqJg5X2K4wn8uo8dnr4uU0jcnnSTbKK9F4AiBA@mail.gmail.com>
 <20250702184312.GC9991@frogsfrogsfrogs> <20250703130500.GA23864@lst.de>
 <CALYkqXqE1dJj7Arqu_Zi4J5mTVhzJQt=kzwjS9QaY5VaFcV3Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALYkqXqE1dJj7Arqu_Zi4J5mTVhzJQt=kzwjS9QaY5VaFcV3Lg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 04, 2025 at 12:32:51PM +0530, Kundan Kumar wrote:
 > bdi is tied to the underlying block device, and helps for device > bandwidth
 specific throttling, dirty ratelimiting etc. Making it per [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1uYmpY-00008V-Kt
Subject: Re: [f2fs-dev] [PATCH 00/13] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, jack@suse.cz, "Darrick J. Wong" <djwong@kernel.org>,
 amir73il@gmail.com, david@fromorbit.com, gfs2@lists.linux.dev,
 linux-mm@kvack.org, clm@meta.com, Christoph Hellwig <hch@lst.de>,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 Kundan Kumar <kundan.kumar@samsung.com>, Matthew Wilcox <willy@infradead.org>,
 p.raghav@samsung.com, linux-nfs@vger.kernel.org, da.gomez@samsung.com,
 viro@zeniv.linux.org.uk, jaegeuk@kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, gost.dev@samsung.com,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 04, 2025 at 12:32:51PM +0530, Kundan Kumar wrote:
> bdi is tied to the underlying block device, and helps for device
> bandwidth specific throttling, dirty ratelimiting etc. Making it per
> superblock will need duplicating the device specific throttling, ratelimiting
> to superblock, which will be difficult.

Yes, but my point is that compared to actually having a high performing
writeback code that doesn't matter.  What is the use case for actually
having production workloads (vs just a root fs and EFI partition) on
a single SSD or hard disk?

> > If someone
> > uses partitions and multiple file systems on spinning rusts these
> > days reducing the number of writeback threads isn't really going to
> > save their day either.
> >
> 
> in this case with single wb thread multiple partitions/filesystems use the
> same bdi, we fall back to base case, will that not help ?

If you multiple file systems sharing a BDI, they can have different
and potentially very different requirements and they can trivially
get in the way.  Or in other words we can't do anything remotely
smart without fully having the file system in charge.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
