Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B314CD3C090
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 08:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTJA2YFmVg0Jk6L3LTmHuyQwz/l15rrcPTyKZbH1Q5Q=; b=X30ynsmdKOo9bIZ0j9a3uMGORq
	pTn4DEv3Gk/E9hDsc0khA98fOwWcJd4ClgPMJulBir8evgr3cJ0IaxUTpaIVAlAj6X5QDO9mPtEiT
	MoM4o7VqFcKnHg7xS2j9iVY+AUd3+BRROcCwaSn9OXGrVsG2+rveYJZkhB1SUa6IJXzs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vi6HJ-00084t-A0;
	Tue, 20 Jan 2026 07:35:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vi6HI-00084l-Ca
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 07:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qujE1lOQ/jcNmX3qKnt9ptIV5Nw0gyj2cNV3EDymq40=; b=SIyUAEAgZxkoh93Kl2yTI3BG4e
 QavP8mgt3Kzc+XWxeMrx96wQpianGBGblrhVXqnuDNzK4v6M87mItSEAg8elCKU4OpjVDrszzZ4cH
 RJpDUQdtcFz4oaTa5p/Q7HGWy8vwtOKRvVja7BQ6uDBk9UbfOlKqQbyTSq3zQWSZgDUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qujE1lOQ/jcNmX3qKnt9ptIV5Nw0gyj2cNV3EDymq40=; b=NxEWcgsyfLUShD3rCbdEBUk/LQ
 8NI+DGiB81Ht3vFX3qXw2VdizKm46A+lYoOZyrt8VXL1NsgaUVXOfvIRfDDiufuEoySHY/vI7zXxF
 m1AfkSmSJGYL3J+t6Vj9Hq9UPMf/8WCcCe+8ppvh0a2nrLqPxGtiPqkBps1fPqoueeOk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vi6HH-0007wn-Ov for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 07:35:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 64B75227AA8; Tue, 20 Jan 2026 08:35:38 +0100 (CET)
Date: Tue, 20 Jan 2026 08:35:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260120073538.GA6956@lst.de>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-5-hch@lst.de> <20260119190536.GA13800@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119190536.GA13800@sol>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 11:05:36AM -0800, Eric Biggers wrote:
 > On Mon, Jan 19, 2026 at 07:22:45AM +0100, Christoph Hellwig wrote: > >
 Use the kernel's resizable hash table to find the fsverity_info. [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vi6HH-0007wn-Ov
Subject: Re: [f2fs-dev] [PATCH 4/6] fsverity: use a hashtable to find the
 fsverity_info
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 11:05:36AM -0800, Eric Biggers wrote:
> On Mon, Jan 19, 2026 at 07:22:45AM +0100, Christoph Hellwig wrote:
> > Use the kernel's resizable hash table to find the fsverity_info.  This
> > way file systems that want to support fsverity don't have to bloat
> > every inode in the system with an extra pointer.  The tradeoff is that
> > looking up the fsverity_info is a bit more expensive now, but the main
> > operations are still dominated by I/O and hashing overhead.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Has anything changed from my last feedback at
> https://lore.kernel.org/linux-fsdevel/20250810170311.GA16624@sol/ ?
> 
> Any additional data on the cycles and icache footprint added to data
> verification?  The preliminary results didn't look all that good to me.

Nothing has changed, as as expected by then and now the lookup overhead
is completely dwarfed by other parts of the read, even when the
data and hashes are already cached.  Of course if you look into the lookup
in itself, any kind of data structure will be significantly more expensive
than a pointer dereference and nothing will change that.

> It also seems odd to put this in an "fsverity optimzations and speedups"
> patchset, given that it's the opposite.

It optimizes the memory usage and doesn't require bloating the inode
for new file systems adding fsverity support.  size of the inode is
a major concern, and is even more so for a feature that is not
commonly used and then not for most files.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
