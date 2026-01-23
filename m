Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAlpGdUic2mUsgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:27:17 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE371B50
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:27:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0YmW/tzd2yE+iHKKJ62l623tjTbLLg++YY848uOaxs=; b=XfrElsWaWqgMugpb86N9q8OZ+3
	heQqOSjRKSHUuPOru0M/De1LVIUO4o3cgCZufXe9eozhh0l1NwsqrTaQ+JUlXOESFl/RRW6hHa0X8
	Wvj8FV/LHN8sfhvZ8xA2t+sGdrMeect62WG+1i1oOpvugUw90mexLvJR0HvtB4oq2lT8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjBZZ-0005SX-H1;
	Fri, 23 Jan 2026 07:27:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vjBZY-0005SR-QG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8OJ7u4gt7fgrR887z0LAkepjC0ckrgsejHSsuIYEZbw=; b=WLZ1mcRGZi6SzmVQKzkcubTGi+
 p0Jg8TYyDb/86/guB98pMYL9C3MMFJCc48T0mYvZBiCOnvepDHFDHqPHSXJg6uHNu99lgQMRUIHvB
 GjWGihYF2jFDf2tuOOxl9zs4cElIHf76eUCSiZhdb8CIjPy8VuyFlfeDdiXhrn8yFzgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8OJ7u4gt7fgrR887z0LAkepjC0ckrgsejHSsuIYEZbw=; b=kkuGoY/MHa/3UlwxvC/8dya/ec
 X3EJsnyYQCscPnvWNG05mGAgomvoGgKB6nja73wkv5H95p8bwa3hcwJS/HS402DjnGNtBcIT5h2ZD
 e7uixTfE9kBwmBiOOWAmPW1Yyu/jWMigb5lUGk9WllXXq/almyqhHzZYUcH7mixl2Vko=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjBZY-0003H8-1e for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:27:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C28960054;
 Fri, 23 Jan 2026 07:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1EF3C19423;
 Fri, 23 Jan 2026 07:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769153221;
 bh=D6L6uggzwbERQGIcTWaQxpEbJ0bnMfxXzcyyOAv9mrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hcNePfvbE/VnwxQ8Hr96u1uN2SPFhTA1vMlXY9NutF8ZcMSv4IRzpjLzixxqy0vBV
 tkN6RMnW1rcFuWmrhK84a6KP8z8TNfxSqFOVV+QHEbfHMXpqAOKMKSISpj7XQQBKvC
 BYLXtqLBsk5Xu283pF7NNuDLqBwan43MIrH6iKdseuF5FI2Sb2HpFSImHgmBJOkFw5
 iWrfX+m8OdXdSRLSLsfAGswEGNAgB3vjQYVspg68O7IHj9bWt8gd6l53HGX9R+XblZ
 C+o9mcRJZ1AzxC6vYWU1a4kSs5Iz9qHH8lT7Qvb5JWbAt86XiWvWHqWtN8JrxzKsfw
 QL6ozPyMEnf3w==
Date: Thu, 22 Jan 2026 23:27:00 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260123072700.GN5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-12-hch@lst.de>
 <20260122220420.GI5910@frogsfrogsfrogs>
 <20260123052723.GE24123@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123052723.GE24123@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 23, 2026 at 06:27:23AM +0100, Christoph Hellwig
 wrote: > On Thu, Jan 22, 2026 at 02:04:20PM -0800, Darrick J. Wong wrote:
 > > On Thu, Jan 22, 2026 at 09:22:07AM +0100, Christoph Hellwig wr [...] 
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
X-Headers-End: 1vjBZY-0003H8-1e
Subject: Re: [f2fs-dev] [PATCH 11/11] fsverity: use a hashtable to find the
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 9BDE371B50
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 06:27:23AM +0100, Christoph Hellwig wrote:
> On Thu, Jan 22, 2026 at 02:04:20PM -0800, Darrick J. Wong wrote:
> > On Thu, Jan 22, 2026 at 09:22:07AM +0100, Christoph Hellwig wrote:
> > > Use the kernel's resizable hash table to find the fsverity_info.  This
> > 
> > Oh is that what the 'r' stands for?  I thought it was rcu.  Maybe it's
> > both. :P
> 
> From the lib/rhashtable.c:
> 
>  * Resizable, Scalable, Concurrent Hash Table
> 
> > > Because insertation into the hash table now happens before S_VERITY is
> > > set, fsverity just becomes a barrier and a flag check and doesn't have
> > > to look up the fsverity_info at all, so there is only one two two
> > 
> > "one two two" <confused>?
> 
> one or two, sorry.  The cover letter actually explains this in more
> detail, which this should be updated to.
> 
> > > +static const struct rhashtable_params fsverity_info_hash_params = {
> > > +	.key_len		= sizeof(struct inode *),
> > 
> > 	.key_len		= sizeof_field(struct fsverity_info, inode),
> > 
> > Perhaps?
> 
> That should work, yes.
> 
> > > -	kfree(vi->tree_params.hashstate);
> > > -	kvfree(vi->hash_block_verified);
> > > -	kmem_cache_free(fsverity_info_cachep, vi);
> > > +	return rhashtable_lookup_fast(&fsverity_info_hash, &inode,
> > > +			fsverity_info_hash_params);
> > 
> > Hrm.  The rhashtable stores a pointer to the rhash_head, but now we're
> > returning that as if it were a fsverity_info pointer.  Can I be pedantic
> > and ask for a proper container_of() to avoid leaving a landmine if the
> > struct layout ever changes?
> 
> rhashtable_lookup_fast returns the struct containing the rhash_head.
> The paramters store the rhead_offset for that purpose.  See rht_obj
> as used by rhashtable_lookup.

Ahah.  That's right, but (imo) a weird quirk of the rhashtable
interface.  Though I only say that because *I* keep tripping over that;
maybe everyone else is ok.

> > > @@ -323,9 +323,9 @@ fsverity_init_verification_context(struct fsverity_verification_context *ctx,
> > >  				   struct fsverity_info *vi)
> > >  {
> > >  	ctx->inode = inode;
> > > -	ctx->vi = vi;
> > 
> > Can this function drop its @vi argument?
> 
> No..
> 
> > 
> > > +	ctx->vi = fsverity_get_info(inode);
> 
> ... but this extra lookup should have been removed and got messed up by a
> rebase, causing a pointless extra lookup.  (Which still is completely
> in the noise in my runs).

Ah ok, I was mildly confused by all this.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
