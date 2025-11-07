Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C9C4026B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 07 Nov 2025 14:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0uZD1n9e1GFXzeByPspxND8ngT59Bu/ZMEhXH+YrOQ=; b=HrDaZw1sdm83a71G3gK0oaxdNG
	c9kNSrGf0i4f9nBDg7U7E6/EygdAsXKfWqMcoQoeXyBCpy9qW7ds5QipfzoIUMNdemUlzPftRd9TO
	BoHfZBgMtJw60SZg1NupDvbPF7RLR3PtiAsOoQeQqAM/hdLZOHp9v3NfLFYS5W//7MOk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vHMf5-0005Qw-Sp;
	Fri, 07 Nov 2025 13:37:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vHMf4-0005Qp-84
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 13:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4fW4ByonwXrt8CCQV5evrDbXfC526l8bUSvhPi4LoTk=; b=gS7hvXIm0WtXSXInLoMEnAkayi
 Bmu6m5r6sWHg05URmHhZld950kDmYhJymqVgBavyJ+C8oe9Ya/NIItJsXu99sX88fIe3RF8JHpfUs
 liF16i0bfkQmgxyThcOVB7qUl1j9MJflgQ9LISkQygRs7XKUsbU4AyP3FgnSLC2yNFe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4fW4ByonwXrt8CCQV5evrDbXfC526l8bUSvhPi4LoTk=; b=HrY2xosL9XNTFsGSMXVIBnZSNB
 g0cheWEtLnhzAkmYqWand8O+7w4Gl451Hb6sJoBufBQcsZhRKZagsqR8WpzEvdV1Gsh+x869EO1Xi
 c5D4fN2CIQT+4voLg/x/FuA+Nf1cfM1JOyUGextkKyYHMSxNSRN/RR57oMqQJVhd8fXQ=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vHMf3-00074n-JG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Nov 2025 13:37:54 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6E374227AAE; Fri,  7 Nov 2025 14:37:42 +0100 (CET)
Date: Fri, 7 Nov 2025 14:37:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20251107133742.GA5596@lst.de>
References: <CGME20251014120958epcas5p267c3c9f9dbe6ffc53c25755327de89f9@epcas5p2.samsung.com>
 <20251014120845.2361-1-kundan.kumar@samsung.com>
 <aPa7xozr7YbZX0W4@dread.disaster.area> <20251022043930.GC2371@lst.de>
 <e51e4fb9-01f7-4273-a363-fc1c2c61954b@samsung.com>
 <20251029060932.GS4015566@frogsfrogsfrogs> <20251029085526.GA32407@lst.de>
 <91367b76-e48b-46b4-b10b-43dfdd8472fa@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91367b76-e48b-46b4-b10b-43dfdd8472fa@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 07, 2025 at 02:54:42PM +0530, Kundan Kumar wrote:
 > Predicting the Allocation Group (AG) for aged filesystems and passing >
 this information to per-AG writeback threads appears to be a com [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vHMf3-00074n-JG
Subject: Re: [f2fs-dev] [PATCH v2 00/16] Parallelizing filesystem writeback
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
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, jack@suse.cz,
 "Darrick J. Wong" <djwong@kernel.org>, amir73il@gmail.com,
 Dave Chinner <david@fromorbit.com>, gfs2@lists.linux.dev, linux-mm@kvack.org,
 clm@meta.com, Christoph Hellwig <hch@lst.de>, dave@stgolabs.net,
 agruenba@redhat.com, miklos@szeredi.hu, gost.dev@samsung.com,
 willy@infradead.org, anuj20.g@samsung.com, linux-nfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, jaegeuk@kernel.org, axboe@kernel.dk,
 brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net, mcgrof@kernel.org,
 anna@kernel.org, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 07, 2025 at 02:54:42PM +0530, Kundan Kumar wrote:
> Predicting the Allocation Group (AG) for aged filesystems and passing
> this information to per-AG writeback threads appears to be a complex
> task.

Yes.  But in the end aged file systems are what will see most usage.
Fresh file systems look nice in benchmarks, but they aren't what
users will mostly deal with.

> To segregate these I/O requests by AG, it is necessary to associate
> AG-specific information with the pages/folios in the page cache. Two
> possible approaches are:
> (1) storing AG information in the folio->private field, or
> (2) introducing new markers in the xarray to track AG-specific data.
> 
> The AG-affined writeback thread processes specific pages from the page 
> cache marked for its AG. Is this a viable approach, or are there 
> alternative solutions that could be more effective?

Or maybe the per-AG scheme isn't that great after all and we just
need some other simple sharding scheme?  Of course lock contention
will be nicer on a per-AG basis, but as you found out actually
mapping high-level writeback to AGs is pretty hard.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
