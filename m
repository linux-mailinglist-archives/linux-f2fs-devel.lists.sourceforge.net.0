Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Mh1KfZHfGkSLwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 06:56:06 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E51D0B783B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jan 2026 06:56:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=injBlWUsZFjUM0//RYJ+uaBWM6Ibg17xrkWi1tYDJ0Y=; b=gVOSKl3QKBkD9qyxAhxpfxZ2vD
	b9+in26Seb1jPRDUhm/OTZ+/zjHVfT51ohAxZdWwcdsmnnzf58RV7xl14Ar+JBjXXpzX+MzSf9pOJ
	Fv1qm+s0o/fN+c+rvXF2hsy0wc1DonauuuQD/+yQdn6Dj9fGeh466dQaHNTQE5GEIyGU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vlhTx-0002mH-Oy;
	Fri, 30 Jan 2026 05:55:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vlhTw-0002m6-Tl
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 05:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xknPMXANQugp2pyenTKzz5Q4Vhpi6GMGorWnu0Wyrv4=; b=ZvVvlQ78l+Ur1rDOX+2tMTw8Yc
 3oMG4XSeczTX7wW99yJBkz9fLMHrnGPqJ2sseKzbi2yuC1X+LH4RrbIfgpld4ENoPiHWITtY2ogqx
 bn6wQOEAS7j/GN8YJ0nEJfu6EDfnBNTbKuxDVX+WHt6/754Ao4rmi3t4XPz4Shu4nDJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xknPMXANQugp2pyenTKzz5Q4Vhpi6GMGorWnu0Wyrv4=; b=lMSxb0Bo6eeLVr9NI9iNFGCjqk
 7JsTExIY5+LEzMiAFXiQlKJhvf/Aigwf9vZJfRH41BpAR2iZdhzbAEDFg0/uz3conTwwRsVN+9BOf
 DE63sWsLPqiQa9qrCYwcf1TBs8+BfeLqcMAbAqq5FXKJgnaUUDOCYQY9b3EDDmdfCPq4=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlhTx-00022h-2L for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 Jan 2026 05:55:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6D5F568AFE; Fri, 30 Jan 2026 06:55:41 +0100 (CET)
Date: Fri, 30 Jan 2026 06:55:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260130055541.GC622@lst.de>
References: <20260128152630.627409-1-hch@lst.de>
 <20260128152630.627409-9-hch@lst.de> <20260128225602.GB2024@quark>
 <20260128232213.GJ5900@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128232213.GJ5900@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 03:22:13PM -0800, Darrick J. Wong
 wrote: > > Unfortunately,
 this patch causes recursive down_read() of > > address_space::invalidate_lock.
 How was this meant to work? > > Usual [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_FUZZY_SPRM           BODY: No description available.
X-Headers-End: 1vlhTx-00022h-2L
Subject: Re: [f2fs-dev] [PATCH 08/15] fsverity: kick off hash readahead at
 data I/O submission time
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
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: E51D0B783B
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:22:13PM -0800, Darrick J. Wong wrote:
> > Unfortunately, this patch causes recursive down_read() of
> > address_space::invalidate_lock.  How was this meant to work?
> 
> Usually the filesystem calls filemap_invalidate_lock{,_shared} if it
> needs to coordinate truncate vs. page removal (i.e. fallocate hole
> punch).  That said, there are a few places where the pagecache itself
> will take that lock too...

> [...]

> ...except that pagecache_ra_unbounded is being called recursively from
> an actual file data read.  My guess is that we'd need a flag or
> something to ask for "unlocked" readahead if we still want readahead to
> spur more readahead.

Basically just move it out of page_cache_ra_unbounded.  With the
consolidation in the earlier patches there are just two callers
of page_cache_ra_unbounded left, this and the redirty_blocks() in f2fs.

I'd kinda wish to kill the latter, as the past-EOF reading is something
that should be restricted to core code, but I can't really think of
an easy way to do that.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
