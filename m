Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id u7PoOccDc2n5rgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 06:14:47 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9679E70623
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 06:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzm1/1o2U2IHw12zE54cn3jgcvexCgiWGYVeAT3x/xw=; b=hkC9AoHSNFCPsPD9PsSpHfwS/R
	gf2HCFtpRlTRmOUw7oAJ97NMZ5t47IqO8Kb0gSCoK4pmaChLvBrXCDmFOnHir9IOq8j5bIxvXbZAL
	4/eMcP/PAewWTlkAAsmw6Cghpp14yGLBTKFzTjvNpC53SG6SWSThssxijpzhHaEJbWd0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj9VL-0005Gq-RY;
	Fri, 23 Jan 2026 05:14:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vj9VK-0005Gc-FR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 05:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=shUfwYze5ogdHbMzSuufEqyP8sSL8Uwp7ESa56wFj/A=; b=OCSz70r4HqCKxIW3fW6BWsGC/a
 weEySJFIyYaZ47Fuj0qf+oSjZJCA1gMW00J7m6KeOTAuyYRQ8D3fLf27EuJIAh3b3xLpVDqewylMj
 AxPRu76ubpu3BCOodlt7WPcC9FhAad/nt60eL30YpanrF5+djBa75xnwLodXMcUqFEgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=shUfwYze5ogdHbMzSuufEqyP8sSL8Uwp7ESa56wFj/A=; b=kHEeHxXPiBhKUmtGVubI8yC4M9
 wRqZFRNOLVUaLH5uAFPvvB/VH2Ll+NQvQJlmb49PJBVo5QQ4F+J+GuIi8DxYteW2RCUekk7ozJnEm
 BUN1jv6mrBKgSEItHxSSR0WM61YTd4XYciPj2Ocsg8sOPEjPb1ZcEgGST9Zu4nfxc40c=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj9VK-0006Jm-OS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 05:14:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3175E227AAE; Fri, 23 Jan 2026 06:14:30 +0100 (CET)
Date: Fri, 23 Jan 2026 06:14:29 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260123051429.GB24123@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-6-hch@lst.de> <20260122214227.GE5910@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122214227.GE5910@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 01:42:27PM -0800, Darrick J. Wong
 wrote: > > + if (first_folio) { > > + if (ext4_need_verity(inode,
 folio->index))
 > > + fsverity_readahead(folio, nr_pages); > > Ok, so here ex [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vj9VK-0006Jm-OS
Subject: Re: [f2fs-dev] [PATCH 05/11] fsverity: kick off hash readahead at
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-0.906];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid]
X-Rspamd-Queue-Id: 9679E70623
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 01:42:27PM -0800, Darrick J. Wong wrote:
> > +		if (first_folio) {
> > +			if (ext4_need_verity(inode, folio->index))
> > +				fsverity_readahead(folio, nr_pages);
> 
> Ok, so here ext4 is trying to read a data page into memory, so we
> initiate readahead on the merkle tree block(s) for that data page.

Yes.

> > +	__fsverity_readahead(inode, vi, offset, last_index - index + 1);
> 
> I went "Huh??" here until I realized that this is the function that
> reads merkle tree content on behalf of some ioctl, so this is merely
> starting readahead for that.  Not sure anyone cares about throughput of
> FS_VERITY_METADATA_TYPE_MERKLE_TREE but sure why not. 

It is trivial to provide and will make the ioctl read much faster.

> > +	const struct merkle_tree_params *params = &vi->tree_params;
> > +	u64 start_hidx = data_start_pos >> params->log_blocksize;
> > +	u64 end_hidx = (data_start_pos + ((nr_pages - 1) << PAGE_SHIFT)) >>
> > +			params->log_blocksize;
> 
> I really wish these unit conversions had proper types and helpers
> instead of this multiline to read shifting stuff.  Oh well, you didn't
> write it this way, you're just slicing and dicing.

Agreed.  Just not feeling like turning everything totally upside down
right now :)

> So if I read this correctly, we're initiating readahead of merkle tree
> (leaf) data for the file data range starting at data_start_pos and
> running for (nr_pages<<SHIFT) bytes?  Then going another level up in the
> merkle tree and initiating readahead for the corresponding interior
> nodes until we get to the root?

Yes.  That's a difference to the old code that just did readahead
for the leaf nodes.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
