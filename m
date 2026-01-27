Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yB9GIjJYeGkNpgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:16:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E7390522
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:16:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3duc7hbOXLpMGDxmQXzYI5OdlGW3ZG9eaGssv/svXQ=; b=Iw1hh7MY036FaYXKameP3I3C09
	htBaGJF2HBhqnmpd05lcKY5rYF2/4EYjLfAFWwSLgmoaAIxEGvZ4lPoo5h72Xez1kLxABhsn2U3Cf
	PRaQyqBaAXDXdxRTUrHGBhEFwmmaxXYPf62EZAj1xfnT/I+eryszyHREYx+h6ChvQoOo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkcN1-0007o2-H9;
	Tue, 27 Jan 2026 06:16:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vkcMw-0007ns-FQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJN1laCjfRD0eNeMidqh3OTLLU/QBKHms3bDZYOjD/E=; b=GCXn7W8qg45R9+9bd9NBRHw9pE
 ShyrqTt8lHNTDOKoiOu1pQDWyCrYeSXyyCKg41cMPfgrAGgOCASNyizyYa3oM00dcXMyZj0A3akLy
 arqrCT0SPtSc5dfaOIonbUwX4Trxhm2pg7OTcaYp6Hwv9SvFTlfEjE9BCh+D7oHqK3kk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NJN1laCjfRD0eNeMidqh3OTLLU/QBKHms3bDZYOjD/E=; b=GaVXFPYbMTr9xKGU2sihfLyZn2
 1Gjfvk1hlTwhkDShkWaejRGl613RT+ThBh7A0twhnNclIUAmBlh16v/eT2HyFx7xQ0pVT+J+H1NgW
 a0CGXWX0ludyexdtOgn6Vhr+m5o15HasPZHiCGYOIBwTrmc5/sQ7LLjvuidySJBF1pBM=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkcMv-0001hd-Ug for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:16:06 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2F41D227AAE; Tue, 27 Jan 2026 07:15:52 +0100 (CET)
Date: Tue, 27 Jan 2026 07:15:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260127061551.GA25522@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-17-hch@lst.de> <20260126204030.GC30838@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126204030.GC30838@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 12:40:30PM -0800, Eric Biggers wrote:
 > On Mon, Jan 26, 2026 at 05:51:02AM +0100, Christoph Hellwig wrote: > >
 The file open path uses rhashtable_lookup_get_insert_fast, > > wh [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vkcMv-0001hd-Ug
Subject: Re: [f2fs-dev] [PATCH 16/16] fsverity: use a hashtable to find the
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[216.105.38.7:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 37E7390522
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 12:40:30PM -0800, Eric Biggers wrote:
> On Mon, Jan 26, 2026 at 05:51:02AM +0100, Christoph Hellwig wrote:
> > The file open path uses rhashtable_lookup_get_insert_fast,
> > which can either find an existing object for the hash key or insert a
> > new one in a single atomic operation, so that concurrent opens never
> > allocate duplicate fsverity_info structure.
> 
> They still do, though.  But that's unchanged from before.
> ensure_verity_info() frees the one it allocated if it finds that one got
> set concurrently.

You're right.  We allocate them, but never register them.  I'll fix
that up.

> 
> > Because insertion into the hash table now happens before S_VERITY is set,
> > fsverity just becomes a barrier and a flag check and doesn't have to look
> > up the fsverity_info at all, so there is only a single lookup per
> > ->read_folio or ->readahead invocation.  For btrfs there is an additional
> > one for each bio completion, while for ext4 and f2fs the fsverity_info
> > is stored in the per-I/O context and reused for the completion workqueue.
> 
> btrfs actually still looks up the verity info once per folio.  See:
> 
>     btrfs_readahead()
>         -> btrfs_do_readpage()
>             -> fsverity_get_info()

True.  I've fixed up btrfs to avoid extra lookups.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
