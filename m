Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C86NsoGc2knrwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 06:27:38 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F27706DA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 06:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLl6fPxbLs219ErbtG8mPRxZpkdGQbQ4aaznTSAt56Y=; b=Z7qDslBsbUVCP8DZXL/WwpF0nB
	T0MoHddyQHy6CLr8SjhQ2xD/wVKlpdA3MmUL7kLwpPXME0R15mMsF7sOwLiKrikWpFWZVj8ClmLR5
	Oc/HXwiszpn170w7TBbufwWsaAYcBUen0BfEDdVCi+km0LJBWVMJmO6F/sWYp4gQDjGc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj9hk-0001Js-Dc;
	Fri, 23 Jan 2026 05:27:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vj9hj-0001Jm-Rp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 05:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UjPYkCUjpcCnAOlJdfW4X7sXxvmwUceE1HsNR3y+OyY=; b=R7rDuhmliJgCpW4Gyqjg3pfyhr
 xtFnofIVqsvZpiSbrBqhREkSFyNMvMX30YoJZIL6eWAx62d9yPXOkz3zVUSmtOyQP/vyYI9DDCH7F
 af6/0UaIks5qepmvIA28epFE/LyC+r6xlHrSHJoNazk01xoiAtIw/tZFqkrt27/6BvUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UjPYkCUjpcCnAOlJdfW4X7sXxvmwUceE1HsNR3y+OyY=; b=hq/N5l3EuBvZqlgAbjfCxgo8ND
 sGUi5ah4Xu5ZcI5QoCwB4a044ehKCKzfFLZEQd3AD+xvWQeTAV6hUVnDhtsHMFOtKXY24jRNGIp3k
 EK0dxA238M9d+vJ+xRGrTGc4bIVAUurZwmJUTXw0guIVL97yimFrVppp1Q2KD0hBLBIE=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj9hj-0006it-9A for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 05:27:31 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id BF760227AAE; Fri, 23 Jan 2026 06:27:23 +0100 (CET)
Date: Fri, 23 Jan 2026 06:27:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260123052723.GE24123@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-12-hch@lst.de> <20260122220420.GI5910@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260122220420.GI5910@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 02:04:20PM -0800, Darrick J. Wong
 wrote: > On Thu, Jan 22, 2026 at 09:22:07AM +0100, Christoph Hellwig wrote:
 > > Use the kernel's resizable hash table to find the fsverity_inf [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vj9hj-0006it-9A
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	NEURAL_HAM(-0.00)[-0.918];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 82F27706DA
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 02:04:20PM -0800, Darrick J. Wong wrote:
> On Thu, Jan 22, 2026 at 09:22:07AM +0100, Christoph Hellwig wrote:
> > Use the kernel's resizable hash table to find the fsverity_info.  This
> 
> Oh is that what the 'r' stands for?  I thought it was rcu.  Maybe it's
> both. :P

From the lib/rhashtable.c:

 * Resizable, Scalable, Concurrent Hash Table

> > Because insertation into the hash table now happens before S_VERITY is
> > set, fsverity just becomes a barrier and a flag check and doesn't have
> > to look up the fsverity_info at all, so there is only one two two
> 
> "one two two" <confused>?

one or two, sorry.  The cover letter actually explains this in more
detail, which this should be updated to.

> > +static const struct rhashtable_params fsverity_info_hash_params = {
> > +	.key_len		= sizeof(struct inode *),
> 
> 	.key_len		= sizeof_field(struct fsverity_info, inode),
> 
> Perhaps?

That should work, yes.

> > -	kfree(vi->tree_params.hashstate);
> > -	kvfree(vi->hash_block_verified);
> > -	kmem_cache_free(fsverity_info_cachep, vi);
> > +	return rhashtable_lookup_fast(&fsverity_info_hash, &inode,
> > +			fsverity_info_hash_params);
> 
> Hrm.  The rhashtable stores a pointer to the rhash_head, but now we're
> returning that as if it were a fsverity_info pointer.  Can I be pedantic
> and ask for a proper container_of() to avoid leaving a landmine if the
> struct layout ever changes?

rhashtable_lookup_fast returns the struct containing the rhash_head.
The paramters store the rhead_offset for that purpose.  See rht_obj
as used by rhashtable_lookup.

> > @@ -323,9 +323,9 @@ fsverity_init_verification_context(struct fsverity_verification_context *ctx,
> >  				   struct fsverity_info *vi)
> >  {
> >  	ctx->inode = inode;
> > -	ctx->vi = vi;
> 
> Can this function drop its @vi argument?

No..

> 
> > +	ctx->vi = fsverity_get_info(inode);

... but this extra lookup should have been removed and got messed up by a
rebase, causing a pointless extra lookup.  (Which still is completely
in the noise in my runs).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
