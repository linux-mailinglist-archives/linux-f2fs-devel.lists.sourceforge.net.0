Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qK3aH0PUd2mFlwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 21:53:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E268D554
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 21:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K28ltsKgeM9SxcQ/0bXZFHT+MWkkDxxKaGPcJsHO7qE=; b=TRNMV+WS02E0hmPwUpxb8QCof2
	SBvunhuh1+5tmnbL2qessQh02z3sYi2xbyDBAOd2YKmVE4yDCVYz1kqaL/bHuenInhwPkH1qtS5p5
	bcdvVi+V9cSKC5sWc6I8boquPOh4lsStsC2BtN5PBdBlQpi/gidvfyrtvU2OptFb3cuQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkTaG-0004di-Un;
	Mon, 26 Jan 2026 20:53:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vkTaE-0004db-WE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 20:53:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GxlJ23j+INtLsh+c/5GhGWURDH+CkioGBkO2Tb+q940=; b=ktLNDIc9JdaPSiROY5wnPmvCSs
 Fj70GbxPETG2/CQBAlmedzM75WXEwF3cLBnFtvbVbujyqh0dVnnw3jIcCpQcp/tVBiKPI7i1DoJl9
 dYMeyK+coBMsq/Uo/kevkVrqhvNqz4pcpn1RPauM6dtJka38DQu15CW857XDIXid1+Pg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GxlJ23j+INtLsh+c/5GhGWURDH+CkioGBkO2Tb+q940=; b=DM7Nb2BsSKREL5DCF3r4k8PjCS
 xgqsm8AgWBKt+iRksJCo61slK65ApyOeCIEF3s3Cwv8xke8D0BrGvnvm5TEvUhelr9q3NNevBj7oD
 3vw+py7EISEqOCEfxYpKFPaWBAIS40P7EuIU/X/gfqD1EGZITh5uOwidrO1HIPfSDhaw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkTaE-0001vZ-Hx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 20:53:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E4A7401CA;
 Mon, 26 Jan 2026 20:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D16EC116C6;
 Mon, 26 Jan 2026 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769460784;
 bh=TkdZAEHLoZVW6dNs7U/9PTST8Ny56M8c0+/eFzOYBvk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qZWXMCWxHJ0tK1fvd3LwZN12C8TxdX8K7aUxfNiW2T8u22fQjivNmH4uEyABRVEoV
 GPlLUp4YhcrFMRNRU9DgYuMDpM9kkSGLvTQrIQfKDaVFMKcc1mceuyy83UERMGhTQx
 1mcedkcUNatj9dpAlswBq7c8gseKUbax/FBX5umcKjpk5NMkV6WHlGFOQWTyBAfQaf
 UsjcT4ChuK8ryu+wbC0HIuSb71aTT6dcdO9GFJC1Lyf5DCxaWcWOjE61A0QDL3T3Fb
 6zxB+40sjKUa92xpoHKbBTTTdg4Zcbqjpk60VVAq3lbBtCk4TKDtwLho9XKIJnvZOj
 oZJBc6ED8t7Fw==
Date: Mon, 26 Jan 2026 12:53:01 -0800
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260126205301.GD30838@quark>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-8-hch@lst.de>
 <20260126191102.GO5910@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126191102.GO5910@frogsfrogsfrogs>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 11:11:02AM -0800, Darrick J. Wong
 wrote: > On Mon, Jan 26, 2026 at 05:50:53AM +0100, Christoph Hellwig wrote:
 > > Issuing more reads on errors is not a good idea, especially wh [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkTaE-0001vZ-Hx
Subject: Re: [f2fs-dev] [PATCH 07/16] fsverity: don't issue readahead for
 non-ENOENT errors from __filemap_get_folio
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: C6E268D554
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:11:02AM -0800, Darrick J. Wong wrote:
> On Mon, Jan 26, 2026 at 05:50:53AM +0100, Christoph Hellwig wrote:
> > Issuing more reads on errors is not a good idea, especially when the
> > most common error here is -ENOMEM.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/verity/pagecache.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
> > index 1efcdde20b73..63393f0f5834 100644
> > --- a/fs/verity/pagecache.c
> > +++ b/fs/verity/pagecache.c
> > @@ -22,7 +22,8 @@ struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
> >  	struct folio *folio;
> >  
> >  	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
> > -	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
> > +	if (PTR_ERR(folio) == -ENOENT ||
> > +	    !(IS_ERR(folio) && !folio_test_uptodate(folio))) {
> 
> I don't understand this logic at all.  If @folio is actually an
> ERR_PTR, then we dereference the non-folio to see if it's not uptodate?
> 
> I think (given the previous revisions) that what you want is to initiate
> readahead if either there's no folio at all (ENOENT) or if there is a
> folio but it's not uptodate?  But not if there's some other error
> (ENOMEM, EL3HLT, EFSCORRUPTED, etc)?
> 
> So maybe you want:
> 
> 	folio = __filemap_get_folio(...);
> 	if (!IS_ERR(folio)) {
> 		if (folio_test_uptodate(folio))
> 			return folio_file_page(folio);
> 		folio_put(folio);
> 	} else if (PTR_ERR(folio) == -ENOENT) {
> 		return ERR_CAST(folio);
> 	}
> 
> 	if (num_ra_pages > 1)
> 		page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
> 	folio = read_mapping_folio(inode->i_mapping, index, NULL);
> 	if (IS_ERR(folio))
> 		return ERR_CAST(folio);
> 
> 	return folio_file_page(folio);
> 
> <confused>

That version is wrong too: the condition 'PTR_ERR(folio) == -ENOENT' is
backwards.

This code gets replaced later in the series anyway.  For this patch, we
could simply insert two lines:

	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
+	if (IS_ERR(folio) && folio != ERR_PTR(-ENOENT))
+		return folio;

Then for the final version in generic_readahead_merkle_tree(), one
option would be:

	struct folio *folio;

	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
	if (folio == ERR_PTR(-ENOENT) ||
	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);

		page_cache_ra_unbounded(&ractl, nr_pages, 0);
	}
	if (!IS_ERR(folio))
		folio_put(folio);

Or as a diff from this series:

-	if (PTR_ERR(folio) == -ENOENT ||
-	    !(IS_ERR(folio) && !folio_test_uptodate(folio))) {
+	if (folio == ERR_PTR(-ENOENT) ||
+	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {

(Note that PTR_ERR() shouldn't be used before it's known that the
pointer is an error pointer.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
