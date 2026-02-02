Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF8jFkLAgGl3AgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 16:18:26 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8768CE147
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 16:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWVhjeW0sv24rUkquA9b5JY1RGXZU9OhYbDEy2fXt6k=; b=L27z1WHo2dEhFDW0Ca/FYq1gsJ
	89X2KFl2s5IiKwZq/qEs1igOvI4OaVZ+h/JCKoUFg0Q045SYvpa90SmJ2p/k64VV9Ok4tOcDUKmFK
	dSWJrIc0xeO+/km4rclk5u20e0TcYLraziGAmRh0rTGjD5kkM2UwZs4XDxEkeTGFfjdM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmvgv-0003Fs-DB;
	Mon, 02 Feb 2026 15:18:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vmvgi-0003FW-Gw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 15:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+2PmaV8548U/iqnrwa5PEKWlaaw0Y0c16Jc6TNXPqGA=; b=gxGs/C1hAOzrX0jOtKmMem7aFX
 Sh5wLCKI5DURDF9TVScrjyC9WpdaSt8YLBqpjqRwraxz1T0pXydQXK7RWFVx+yYujKucNHnwtO1qf
 y+t/87Qg6R4S+qefPEuq+c/Y/+NPaThKKIyVBYxle8fgF939Vc+spOa/TOpohkyg1+gY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+2PmaV8548U/iqnrwa5PEKWlaaw0Y0c16Jc6TNXPqGA=; b=KWGG4ivT9kjkU928kHKUByYYO7
 LV6xX6OCiRubrGnR5cZHsqHeT7+EfFpX/stEaqvLCVnoz9wQKNcM0tUIohItlf0dymJ3fQg9W70cl
 5GEwWXYeYp2pXmIJm3SI34VUucstWaSQABzG78BvMVJongsZAhPklAdS0HPKDgKYlAy8=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmvgh-0000Ko-Qm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 15:18:04 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B67D168B05; Mon,  2 Feb 2026 16:17:55 +0100 (CET)
Date: Mon, 2 Feb 2026 16:17:55 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20260202151755.GA22756@lst.de>
References: <20260202060754.270269-1-hch@lst.de>
 <20260202060754.270269-3-hch@lst.de> <aYC-set6OAK9F9GE@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYC-set6OAK9F9GE@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Feb 02, 2026 at 03:11:45PM +0000,
 Matthew Wilcox wrote:
 > On Mon, Feb 02, 2026 at 07:06:31AM +0100, Christoph Hellwig wrote: > >
 +++ b/fs/f2fs/file.c > > @@ -4418,7 +4418,9 @@ static int redir [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vmvgh-0000Ko-Qm
Subject: Re: [f2fs-dev] [PATCH 02/11] readahead: push invalidate_lock out of
 page_cache_ra_unbounded
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
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
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
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:mid]
X-Rspamd-Queue-Id: E8768CE147
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 03:11:45PM +0000, Matthew Wilcox wrote:
> On Mon, Feb 02, 2026 at 07:06:31AM +0100, Christoph Hellwig wrote:
> > +++ b/fs/f2fs/file.c
> > @@ -4418,7 +4418,9 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
> >  	pgoff_t redirty_idx = page_idx;
> >  	int page_len = 0, ret = 0;
> >  
> > +	filemap_invalidate_lock_shared(mapping);
> >  	page_cache_ra_unbounded(&ractl, len, 0);
> > +	filemap_invalidate_unlock_shared(mapping);
> 
> Why is f2fs calling page_cache_ra_unbounded() here?

From tracing the callers is seems to be able to be called from the
garbage collector, which might have to move fsverity files.  Not sure if
that was the reason or is incidental.

(using the pagecache for GC is generally a very bad idea, and there is
at least one academic paper showing it is a huge performance problem in
f2fs, and my initial attempts at using the pagecache for GC in zoned XFS
also showed horrible results)

> >  	unsigned int nofs = memalloc_nofs_save();
> >  
> > +	lockdep_assert_held_read(&mapping->invalidate_lock);
> 
> Hm, why are we asserting that it's not write-locked?  For the
> purposes of this function, I'd think we want to just
> lockdep_assert_held()?

Fine with me.

> In the tree I'm looking at, there are also calls to
> page_cache_ra_unbounded() in fs/ext4/verity.c and fs/f2fs/verity.c
> which probably need the lock taken too?

I consolidated those into the single call in fs/verity/pagecache.c
in the previous iteration of this series, and Eric merged the
first few patches including that one into the fsverity tree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
