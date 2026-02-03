Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH2VLmiJgWnuGwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 06:36:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECAD4C36
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Feb 2026 06:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRfuBvNdLfukGlHn8gmvTJDyDRFUiUqT8QtUpBO9IG4=; b=JEYI56/lDYLvTozCsJ1eIjZmGn
	HKiXzk02Z8+R5nbhS9AyCeZWEgSBtk4nK6giBE6XKAUlCbPkxSvmY2ej0MuFjK1SMLfALfj/CUwiP
	9h1HIUhFiRQDdzjgrUa7wsbwZ9oYmiONOk8J6v5/i/fKVOfYZb6pYELJEzCxwJtCxd18=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vn95D-0000KT-Q0;
	Tue, 03 Feb 2026 05:36:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vn95B-0000KM-Vm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 05:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i3cS0RxCQXC0dY7JQebj+Ura73CZ/jIdduAvm+lk1K4=; b=Atyr5is+hqGmTPngA/ov1+/rBn
 ktLCReGaBCHQbVZTxNTpOORKntoz1wbQVL6cglW7Z47Z8m+8PcJgbhi5rYna3EpbrnC/mK6YP+fto
 1S/ubsb8xnQhqGkQCZjNoDsWn7b6zOrugeVFgHGcKu1L27UzNXzEaLES+WaxjtU9E15o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i3cS0RxCQXC0dY7JQebj+Ura73CZ/jIdduAvm+lk1K4=; b=ZQw468FJAuK12dMCFiFx9xu9yb
 RIxRkQoSymdSLOm7hjKanGIgrl6aeIo4OEWXC0Ej3VxIIDqN0p1IlwM5Cd87qtS1jhRotMXhpBxvb
 YDlyQTttfi05ioyAGml7xrwTD+4rbjaw92STsurRy7ItwHCIMTvahDo29auRnGHUNofc=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vn95B-0001zo-9p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Feb 2026 05:36:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E866E68AFE; Tue,  3 Feb 2026 06:36:04 +0100 (CET)
Date: Tue, 3 Feb 2026 06:36:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260203053604.GC15956@lst.de>
References: <20260202060754.270269-1-hch@lst.de> <20260202211423.GB4838@quark>
 <20260202223404.GA173552@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202223404.GA173552@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 02, 2026 at 02:34:04PM -0800, Eric Biggers wrote:
 > On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote: > > On Mon,
 Feb 02, 2026 at 07:06:29AM +0100, Christoph Hellwig wrote: > > [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vn95B-0001zo-9p
Subject: Re: [f2fs-dev] fsverity speedup and memory usage optimization v5
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
Cc: Theodore Ts'o <tytso@mit.edu>, fsverity@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:tytso@mit.edu,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 51ECAD4C36
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 02:34:04PM -0800, Eric Biggers wrote:
> On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote:
> > On Mon, Feb 02, 2026 at 07:06:29AM +0100, Christoph Hellwig wrote:
> > > Hi all,
> > > 
> > > this series has a hodge podge of fsverity enhances that I looked into as
> > > part of the review of the xfs fsverity support series.
> > > 
> > > The first part optimizes the fsverity read path by kicking off readahead
> > > for the fsverity hashes from the data read submission context, which in my
> > > simply testing showed huge benefits for sequential reads using dd.
> > > I haven't been able to get fio to run on a preallocated fio file, but
> > > I expect random read benefits would be significantly better than that
> > > still.
> > > 
> > > The second part avoids the need for a pointer in every inode for fsverity
> > > and instead uses a rhashtable lookup, which is done once per read_folio
> > > or ->readahead invocation plus for btrfs only for each bio completion.
> > > Right now this does not increse the number of inodes in
> > > each slab, but for ext4 we are getting very close to that (within
> > > 16 bytes by my count).
> > > 
> > > Changes since v5:
> > >  - drop already merged patches
> > >  - fix a bisection hazard for non-ENOENT error returns from
> > >    generic_read_merkle_tree_page
> > >  - don't recurse on invalidate_lock
> > >  - refactor page_cache_ra_unbounded locking to support the above
> > >  - refactor ext4 and f2fs fsverity readahead to remove the need for the
> > >    first_folio branch in the main readpages loop
> > 
> > Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next
> > 
> > (Though it's getting late for v6.20 / v7.0.  So if there are any
> > additional issues reported, I may have to drop it.)
> 
> Unfortunately this silently conflicts with changes in the f2fs tree.
> Resolution doesn't look too bad, but we'll need to handle this.
> Christoph, Jaegeuk, and Chao, let me know if this looks okay:

I ended up with the same merge, and it looks good to me.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
