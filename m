Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I0WEsAhc2mUsgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:22:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A060C71A5F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:22:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtBgvxZUrHi9WRSE1oh3cf5mOrcoWK87Mhq0GwqtOTU=; b=iG91gpqz/9UQKTB93wvaUao6Zb
	KXskOr1s0jxecOJ8Y0fixXgzbkpFoy7sPxZ7N3BKTWoftpsfMI+0mQDatjZDEkmIGqIv5mlCUgCi4
	+SU65YxlFV67DYOOPQyv/njZPvxvC40iPFKFnaixSCrAnfwT5aeFZwO9JcejQ1AB5gUQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjBV6-0003D3-O9;
	Fri, 23 Jan 2026 07:22:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vjBV5-0003Cs-H9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hYORL+ulDQU1A0yZS6mdoF/USDIkZvUZDTcV50rz5/8=; b=h719z2Nov5cEShuw1v/KA3XFPW
 zzsiF/hRPgb0U7SeRuCWiyLjSuaI7MxKyK37HKojErAqU9scLE+HxXyd1Z8Mxwz2AR3lODlKVK4AA
 t6uRvNdtCCH9wOxCQXMOdjCzOEMSyMz/R/cuCpsCS3Crx8ERU8LlNVkfFMG/Lz4/qWoQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hYORL+ulDQU1A0yZS6mdoF/USDIkZvUZDTcV50rz5/8=; b=ho4u7WlgxKLDW60qQE8DJI37PU
 UXeZDAaKQ7XXzPcztgey+XVEXaBje+rXyct3Ti4+jxf1B9sN/7RAgFSosPdd7cx5CvV17LDA7n2X7
 yKwyZgiU/mItKhu5npYKk5/m49UAUFShvgMG8M8EmeXs5w+LNJCHPt1N4QsbmHfqoDh4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjBUy-00032v-Si for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B790419AA;
 Fri, 23 Jan 2026 07:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631EBC4CEF1;
 Fri, 23 Jan 2026 07:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769152938;
 bh=xv7Ciia1o4TzkfhiJeMNZ7afzQQkd0wZmCmSkOnW3D8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ag+3xAAMAiEobo8tr0xQ+pzcrO/vVQSUK1Ag76ICSV8GT7q49niWT+pofKmzKsG8d
 Jw39Di1WR6hLI1vHcojDjdN67CQ0NZ4hT6qBh6VKNpuT+NwwIGeFCoVzI/Cw7PFD8H
 iDuF0Gf2+DPUBr/9WjkqNurr6hBOvGEbVBDUSzw/q/xGgutFraBC7WtwpfTz4uSSV3
 05dE5Th7Oj5wPPLqdrF+TxQtBTjE8Jpq8Hgi5LkNg9Eac+189i5VZfNF/Sxr89VkxQ
 HkR9HEZf+DjnbaULQQHgzisWBIN1hfRryZZ7oPJMvM5Tg+TZjXUU7ROBmPVPkNk1aQ
 DE5y1rbi3NWNg==
Date: Thu, 22 Jan 2026 23:22:17 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260123072217.GK5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-6-hch@lst.de>
 <20260122214227.GE5910@frogsfrogsfrogs>
 <20260123051429.GB24123@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123051429.GB24123@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 23, 2026 at 06:14:29AM +0100, Christoph Hellwig
 wrote: > On Thu, Jan 22, 2026 at 01:42:27PM -0800, Darrick J. Wong wrote:
 > > > + if (first_folio) { > > > + if (ext4_need_verity(inode, fol [...] 
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
X-Headers-End: 1vjBUy-00032v-Si
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.950];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Queue-Id: A060C71A5F
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 06:14:29AM +0100, Christoph Hellwig wrote:
> On Thu, Jan 22, 2026 at 01:42:27PM -0800, Darrick J. Wong wrote:
> > > +		if (first_folio) {
> > > +			if (ext4_need_verity(inode, folio->index))
> > > +				fsverity_readahead(folio, nr_pages);
> > 
> > Ok, so here ext4 is trying to read a data page into memory, so we
> > initiate readahead on the merkle tree block(s) for that data page.
> 
> Yes.
> 
> > > +	__fsverity_readahead(inode, vi, offset, last_index - index + 1);
> > 
> > I went "Huh??" here until I realized that this is the function that
> > reads merkle tree content on behalf of some ioctl, so this is merely
> > starting readahead for that.  Not sure anyone cares about throughput of
> > FS_VERITY_METADATA_TYPE_MERKLE_TREE but sure why not. 
> 
> It is trivial to provide and will make the ioctl read much faster.
> 
> > > +	const struct merkle_tree_params *params = &vi->tree_params;
> > > +	u64 start_hidx = data_start_pos >> params->log_blocksize;
> > > +	u64 end_hidx = (data_start_pos + ((nr_pages - 1) << PAGE_SHIFT)) >>
> > > +			params->log_blocksize;
> > 
> > I really wish these unit conversions had proper types and helpers
> > instead of this multiline to read shifting stuff.  Oh well, you didn't
> > write it this way, you're just slicing and dicing.
> 
> Agreed.  Just not feeling like turning everything totally upside down
> right now :)
> 
> > So if I read this correctly, we're initiating readahead of merkle tree
> > (leaf) data for the file data range starting at data_start_pos and
> > running for (nr_pages<<SHIFT) bytes?  Then going another level up in the
> > merkle tree and initiating readahead for the corresponding interior
> > nodes until we get to the root?
> 
> Yes.  That's a difference to the old code that just did readahead
> for the leaf nodes.

Cool!  In that case I think I understand what's going on here well
enough to say:
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
