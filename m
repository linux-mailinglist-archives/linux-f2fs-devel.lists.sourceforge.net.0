Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EVeO24ic2mUsgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:25:34 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70871B0C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:25:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsF63yKmyd4LNxy5JczfZE7tYoKmih6DrjcIPR/T6eE=; b=KTUZEdbLlHB9lFIie+5DRpCWzy
	sLYdMFr5VJKlTITK01jqDJoF9++oNDeBxuQPqDXZZazDjOq9sDTC4me6iGN/1uIlZABYiPn56yQYj
	NDE2ExXRQOwqD6Hg8LKKmKKEIJf7qzwGq/JAqf+Ro2uqvCPgzWTeabZBbq35DPAmF4fk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjBXx-0005Ot-20;
	Fri, 23 Jan 2026 07:25:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vjBXv-0005Ol-Eu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VpqyAXgB+8m1PJhjQtDY+p+DIrZeXlPwfZPw7MBh6dc=; b=bcg3YVWDz/E14WDK4HqK9JajAw
 kqQiyWr51hLjVyN/grDI/e+YkxrmDm5sQvIsUYQd1KZJ4jVyC1OIZPzJqrot3BLtZREQHtW2edtA6
 MHEtllHKBWHyo18BFjZ2/VrB5Njw9wJisD+z7diccS0BBD3c0sENbCkrcrVt+yfMk36w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VpqyAXgB+8m1PJhjQtDY+p+DIrZeXlPwfZPw7MBh6dc=; b=ClXqpq/KiZmDTHmmd38KrOzH7z
 D1hkxTX9+Ok1563HMShkZ+RAeuqc8KfqKAgA8oQVrxeHaNtieRkr/Fm9gTlOEzDqYzsA3lLuCGGk+
 DN1yMZP5eerFycn3H+AXrDT6dLoHOR75XBHZm4KP5Z+jYvqygLCOXO2pZnUhDkxsKjT8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjBXv-0003Ax-30 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:25:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B58F640312;
 Fri, 23 Jan 2026 07:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3EDC4CEF1;
 Fri, 23 Jan 2026 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769153120;
 bh=2iQj3NVwRa1h1Br3tJlYAFXoIJ/SDM7T0y4t89MLmxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CanYp7RLVaLj52wNbtaMcyixECOzLmRczYmz6Pz3O4m44GBUI80gmjY3F1RJjJbC8
 xXIOT2/4gnzvIa0z3JoRZ6TMyRICwWGQMGQnIrl5vlAspDwIv7cxuosKN2iPhQJ5ws
 zF5GflLV/RPpkxcktkMryNxadoSfNZANui+/UaVN1JIvRP9anzihAn0HrC7QAeWa02
 1WWu53Izxqp0btpWC6SqblNX+T6GEww3out8ddiooEJO04jEUGhkgFJ4P7sbFOKTpU
 KEZG8tvO85aCe1TxgOuNRWnsHGku7oidNWFZeVlysEmWWV4MInW2dUytpDrf531mhB
 ZmMKy7F1W0mew==
Date: Thu, 22 Jan 2026 23:25:20 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260123072520.GM5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-9-hch@lst.de>
 <20260122215457.GH5910@frogsfrogsfrogs>
 <20260123051836.GD24123@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123051836.GD24123@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 23, 2026 at 06:18:36AM +0100, Christoph Hellwig
 wrote: > On Thu, Jan 22, 2026 at 01:54:57PM -0800, Darrick J. Wong wrote:
 > > > + if (folio->index < > > > + DIV_ROUND_UP(inode->i_size, PAG [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjBXv-0003Ax-30
Subject: Re: [f2fs-dev] [PATCH 08/11] ext4: consolidate fsverity_info lookup
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 5E70871B0C
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 06:18:36AM +0100, Christoph Hellwig wrote:
> On Thu, Jan 22, 2026 at 01:54:57PM -0800, Darrick J. Wong wrote:
> > > +			if (folio->index <
> > > +			    DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
> > 
> > I keep seeing this predicate, maybe it should go into fsverity.h as a
> > helper function with the comment about mmap that I was muttering about
> > in the previous patch?
> 
> Right now it is not generic.  Nothing in the generic fsverity code
> known about the offset, ext4 and f2fs just happened to chose the
> same constant (and the ext4 one leak to buffer.c), while btrfs stores
> the verity hashed totally differently.  I hope the xfs works ends up
> with a consolidated way of doing this, at which point such a helper
> would be useful.
> 
> > Or maybe a "get verity info for given folio index" helper?
> 
> How would that make sense?
> 
> > /*
> >  * Grab the fsverity context needed to verify the contents of the folio.
> >  *
> >  * <Big fat comment from before, about mmap and whatnot>
> >  */
> > static inline struct fsverity_info *vi
> > fsverity_folio_info(const struct folio *folio)
> > {
> > 	struct inode *inode = folio->mapping->host;
> > 
> > 	if (folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
> > 		return fsverity_get_info(inode);
> > 	return NULL;
> > }
> 
> Tthe offset right now is entirely file system specific,
> so we can't do this.  Maybe that'll change with further consolidation.

<nod> Ok, I think I'll defer all this talk of helpers until whichever
series cleans up all the post-eof pagecache stuff, and then we can make
all four filesystems pick the same offset for the cached merkle trees.

Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
