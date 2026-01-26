Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFKGHAHudmkHZAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:30:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 880A883E5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exlrJZNYaSgocpHy80bvsAZe+plyZEeiDth3vZVL9EQ=; b=b0l9wxhRRuG4w69zNmgUbOCdoS
	Ii44+cPuy2gVw4PCRZ9sL9kWHKYfi1D2jB4To5q2JGT9SQBXuYJ/fF8OMnQKeEFVguiaPLzvXSkhd
	L2QvZOv0Sdg3mLce5bFOX2oOHqLfMGupX3e860ITt5a+Q4VHfl/p3vnfr+jd1diE98E4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEFZ-0007vc-C4;
	Mon, 26 Jan 2026 04:30:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vkEFX-0007vU-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:30:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UyNjz/GVf1xR+LHQIwyvacgYJQ3IUlQsxNz+1GmaMGM=; b=Acmmt3js81Ir2lk2Kuytd46uC3
 BDxZCpaJKd3OFD2nko6U7RfkqCrEJ9lGDdxzkuCWR9UVmK14FPqeaaoAzhk3lZFYPfk0l5ybRquT1
 t6CiCBcAM/DG/O0E7t0aXGOFpDAjMAc3vpOD3zgYi5vj+dSTbnnSLbArZj3TbSvD8g7M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UyNjz/GVf1xR+LHQIwyvacgYJQ3IUlQsxNz+1GmaMGM=; b=ilxTlLkGM0ogqneHYrmIUeNPGM
 EpnAsPFcI/Dm/Ulu4bYBBqSg0NyDuRlf5EPxYofACEWqyLg3B0PSb1XMQx8UgV2OgB512AG/Ferpv
 PmkY94tyEuCFH4uOvUJ4ZyT5mnMB8gxBHRt59OLhpjEwKA7kchgJIpIQiKGiiXFqAg1s=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEFW-0000xO-Qw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:30:51 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6F6B0227A8E; Mon, 26 Jan 2026 05:30:43 +0100 (CET)
Date: Mon, 26 Jan 2026 05:30:42 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260126043042.GB30803@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-6-hch@lst.de> <20260124205329.GE2762@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124205329.GE2762@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jan 24, 2026 at 12:53:29PM -0800, Eric Biggers wrote:
 > > +void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 > > + unsigned long nr_pages) > > { > > struct folio *folio; > [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vkEFW-0000xO-Qw
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
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 880A883E5D
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 12:53:29PM -0800, Eric Biggers wrote:
> > +void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
> > +		unsigned long nr_pages)
> >  {
> >  	struct folio *folio;
> >  
> >  	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> > -	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
> > +	if (PTR_ERR(folio) == -ENOENT || !folio_test_uptodate(folio)) {
> 
> This dereferences an ERR_PTR() when __filemap_get_folio() returns an
> error other than -ENOENT.

Yes.  I've fixed that and split the change in error handling into a
separate well described prep patch while at it.
> I think the correct thing to do here would be the following:
> 
>         if (inode->i_sb->s_vop->readahead_merkle_tree)
> 		inode->i_sb->s_vop->readahead_merkle_tree(inode, index,
> 							  last_index - index + 1);
> 
> Then __fsverity_readahead() can be folded into fsverity_readahead().

I've done that, and also added a little comment.

> 
> > +void __fsverity_readahead(struct inode *inode, const struct fsverity_info *vi,
> > +		loff_t data_start_pos, unsigned long nr_pages)
> > +{
> > +	const struct merkle_tree_params *params = &vi->tree_params;
> > +	u64 start_hidx = data_start_pos >> params->log_blocksize;
> > +	u64 end_hidx = (data_start_pos + ((nr_pages - 1) << PAGE_SHIFT)) >>
> > +			params->log_blocksize;
> 
> (nr_pages - 1) << PAGE_SHIFT can overflow an 'unsigned long'.
> (nr_pages - 1) needs to be cast to u64 before doing the shift.
> 
> But also it would make more sense to pass
> (pgoff_t start_index, unsigned long nr_pages) instead of
> (loff_t data_start_pos, unsigned long nr_pages),
> so that the two numbers have the same units.
> 
> start_idx and end_hidx could then be computed as follows:
> 
>     u64 start_hidx = (u64)start_index << params->log_blocks_per_page;
>     u64 end_hidx = (((u64)start_index + nr_pages) << params->log_blocks_per_page) - 1;
> 
> Note that fsverity_readahead() derives the position from the index.  If
> it just used the index directly, that would be more direct.

Yes, I've updated that.  Having proper types and/or conversion helpers
for the fsverity specific addressing would be really nice as well,
but I've not touched that for now.

> > +	int level;
> > +
> > +	if (!inode->i_sb->s_vop->readahead_merkle_tree)
> > +		return;
> > +	if (unlikely(data_start_pos >= inode->i_size))
> > +		return;
> 
> The check against i_size shouldn't be necessary: the caller should just
> call this only for data it's actually going to read.

This check is based on / copied from the check in verify_data_block.
Now we only kick off readahead now and and don't actually do anything
with the read blocks, so I'll take your word that this can be removed.

> > +	for (level = 0; level < params->num_levels; level++) {
> > +		unsigned long level_start = params->level_start[level];
> > +		unsigned long next_start_hidx = start_hidx >> params->log_arity;
> > +		unsigned long next_end_hidx = end_hidx >> params->log_arity;
> > +		unsigned long start_idx = (level_start + next_start_hidx) >>
> > +				params->log_blocks_per_page;
> > +		unsigned long end_idx = (level_start + next_end_hidx) >>
> > +				params->log_blocks_per_page;
> 
> start_idx and end_idx should have type pgoff_t to make it clear that
> they're page indices.

Fixed.

> > +/**
> > + * fsverity_readahead() - kick off readahead on fsverity hashes
> > + * @folio:		first folio that is being read
> 
> folio => file data folio
> 
> Otherwise it can be confused with the Merkle tree.

I've incoroporate the various suggested documentation improvements.
Thanks!



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
