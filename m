Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJYyMjeaemms8QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jan 2026 00:22:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1561A9F3A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jan 2026 00:22:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OomDMg7E1X2NKlIW12mBL9oeurfQTMsdr8/doUYXcSM=; b=fJBSMQ1VZISg+ucSDRbwUfDqCp
	gRxqx1k8pIIYoL6mBhC5oTjb/lXWEa6zX5CKMgUyTwg2OWaDjYS3VRW0620+xx3qdA518/UzaThtr
	GVd9jJu4HJlV9FQQGT9wxco1x+DCyfwCnfp3pZ1kMW4UoD9F24oGIc7xGNquNIygiCdQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vlErf-000691-Qb;
	Wed, 28 Jan 2026 23:22:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vlErc-00068o-Oi
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 23:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dW1deNTu/q3D3zk2kLG4SQeiHuPmE109hr8KFZ0aRKU=; b=X5ZNMT/sMixgAvnSEUnIjz+h45
 UYn1qaFppMj1zQi/LLZV/rE/M8nTbNB22i9E+Xm1MRWAQQIc/NYOa/EdGuHGx3LqSyi84y/OXjCIl
 nXJxGMpSZTVWBgX6EXvOoo9IJ7KlIeKASOnxwPbSuiD56Ck7WPSjHJBVfz4bpNjHei6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dW1deNTu/q3D3zk2kLG4SQeiHuPmE109hr8KFZ0aRKU=; b=eFUip51ppDCcPjO7EXcuWQL2QF
 eQwaxiZs18yMGu5Sxz0mM7uET50thdO2Uj+hnVAR20AGKBD7IMOzRTDIKHlF2HgClonHs/4IDrLFo
 oj3ikqlP2RDd3csP4avmVubPbeTGoHXD4kbybRvPXMwPlP/pPBir4i1T7iLEw3sOgmI8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlErb-0000WZ-Lq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 23:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F1CF260125;
 Wed, 28 Jan 2026 23:22:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73AAC4CEF1;
 Wed, 28 Jan 2026 23:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769642533;
 bh=PCcLJ8ZQYUzBwXbifrnf83ejkOxhnQG5m0GulqTTU/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KGoAsOsTZwaYzH4faZ5PzIhY1LGu4UfB1SHrLbeL6tHwhWEa+g1XBOuiqAKgFXm+Q
 WN2haeAzZXdwdIUja0SEHLJLNKuf+rbaQPDNxtpq7dncTRnt7/2w/HC9MqjZa4O9Z6
 IrAJ4ch3IFiYIMCF/mVS1N/qV3jipvFbi29yYF5EhwjUj3v7TCSU/M7u9kl6+uLJ+F
 2DJMWTb2V+CGu8mpnrSLzg88cagxXkbwaFreqoP+9NHgKQDqKX5ego0zIehUkQRJUK
 WEQtcFTOisyO39D7zB1y5aoaj05vlUbIrBJAigAq7Mj/8lGIPRYb9bqmUu4j6pQLq5
 2MQA7t1p4cDsw==
Date: Wed, 28 Jan 2026 15:22:13 -0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260128232213.GJ5900@frogsfrogsfrogs>
References: <20260128152630.627409-1-hch@lst.de>
 <20260128152630.627409-9-hch@lst.de> <20260128225602.GB2024@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128225602.GB2024@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 02:56:02PM -0800, Eric Biggers wrote:
 > On Wed, Jan 28, 2026 at 04:26:20PM +0100, Christoph Hellwig wrote: > >
 Currently all reads of the fsverity hashes is kicked off from the [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 T_FUZZY_SPRM           BODY: No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vlErb-0000WZ-Lq
Subject: Re: [f2fs-dev] [PATCH 08/15] fsverity: kick off hash readahead at
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: F1561A9F3A
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 02:56:02PM -0800, Eric Biggers wrote:
> On Wed, Jan 28, 2026 at 04:26:20PM +0100, Christoph Hellwig wrote:
> > Currently all reads of the fsverity hashes is kicked off from the data
> > I/O completion handler, leading to needlessly dependent I/O.  This is
> > worked around a bit by performing readahead on the level 0 nodes, but
> > still fairly ineffective.
> > 
> > Switch to a model where the ->read_folio and ->readahead methods instead
> > kick off explicit readahead of the fsverity hashed so they are usually
> > available at I/O completion time.
> > 
> > For 64k sequential reads on my test VM this improves read performance
> > from 2.4GB/s - 2.6GB/s to 3.5GB/s - 3.9GB/s.  The improvements for
> > random reads are likely to be even bigger.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: David Sterba <dsterba@suse.com> [btrfs]
> 
> Unfortunately, this patch causes recursive down_read() of
> address_space::invalidate_lock.  How was this meant to work?

Usually the filesystem calls filemap_invalidate_lock{,_shared} if it
needs to coordinate truncate vs. page removal (i.e. fallocate hole
punch).  That said, there are a few places where the pagecache itself
will take that lock too...

> [   20.563185] ============================================
> [   20.564179] WARNING: possible recursive locking detected
> [   20.565170] 6.19.0-rc7-00041-g7bd72c6393ab #2 Not tainted
> [   20.566180] --------------------------------------------
> [   20.567169] cmp/2320 is trying to acquire lock:
> [   20.568019] ffff888108465030 (mapping.invalidate_lock#2){++++}-{4:4}, at: page_cache_ra_unbounded+0x6f/0x280
> [   20.569828] 
> [   20.569828] but task is already holding lock:
> [   20.570914] ffff888108465030 (mapping.invalidate_lock#2){++++}-{4:4}, at: page_cache_ra_unbounded+0x6f/0x280
> [   20.572739] 
> [   20.572739] other info that might help us debug this:
> [   20.573938]  Possible unsafe locking scenario:
> [   20.573938] 
> [   20.575042]        CPU0
> [   20.575522]        ----
> [   20.576003]   lock(mapping.invalidate_lock#2);
> [   20.576849]   lock(mapping.invalidate_lock#2);
> [   20.577698] 
> [   20.577698]  *** DEADLOCK ***
> [   20.577698] 
> [   20.578795]  May be due to missing lock nesting notation
> [   20.578795] 
> [   20.580045] 1 lock held by cmp/2320:
> [   20.580726]  #0: ffff888108465030 (mapping.invalidate_lock#2){++++}-{4:4}, at: page_cache_ra_unbounded+0x6f/0x20
> [   20.582596] 
> [   20.582596] stack backtrace:
> [   20.583428] CPU: 0 UID: 0 PID: 2320 Comm: cmp Not tainted 6.19.0-rc7-00041-g7bd72c6393ab #2 PREEMPT(none) 
> [   20.583433] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS Arch Linux 1.17.0-2-2 04/01/2014
> [   20.583435] Call Trace:
> [   20.583437]  <TASK>
> [   20.583438]  show_stack+0x48/0x60
> [   20.583446]  dump_stack_lvl+0x75/0xb0
> [   20.583451]  dump_stack+0x14/0x1a
> [   20.583452]  print_deadlock_bug.cold+0xc0/0xca
> [   20.583457]  validate_chain+0x4ca/0x970
> [   20.583463]  __lock_acquire+0x587/0xc40
> [   20.583465]  ? find_held_lock+0x31/0x90
> [   20.583470]  lock_acquire.part.0+0xaf/0x230
> [   20.583472]  ? page_cache_ra_unbounded+0x6f/0x280
> [   20.583474]  ? debug_smp_processor_id+0x1b/0x30
> [   20.583481]  lock_acquire+0x67/0x140
> [   20.583483]  ? page_cache_ra_unbounded+0x6f/0x280
> [   20.583484]  down_read+0x40/0x180
> [   20.583487]  ? page_cache_ra_unbounded+0x6f/0x280
> [   20.583489]  page_cache_ra_unbounded+0x6f/0x280

...and it looks like this is one of those places where the pagecache
takes it for us...

> [   20.583491]  ? lock_acquire.part.0+0xaf/0x230
> [   20.583492]  ? __this_cpu_preempt_check+0x17/0x20
> [   20.583495]  generic_readahead_merkle_tree+0x133/0x140
> [   20.583501]  ext4_readahead_merkle_tree+0x2a/0x30
> [   20.583507]  fsverity_readahead+0x9d/0xc0
> [   20.583510]  ext4_mpage_readpages+0x194/0x9b0
> [   20.583515]  ? __lock_release.isra.0+0x5e/0x160
> [   20.583517]  ext4_readahead+0x3a/0x40
> [   20.583521]  read_pages+0x84/0x370
> [   20.583523]  page_cache_ra_unbounded+0x16c/0x280

...except that pagecache_ra_unbounded is being called recursively from
an actual file data read.  My guess is that we'd need a flag or
something to ask for "unlocked" readahead if we still want readahead to
spur more readahead.

--D

> [   20.583525]  page_cache_ra_order+0x10c/0x170
> [   20.583527]  page_cache_sync_ra+0x1a1/0x360
> [   20.583528]  filemap_get_pages+0x141/0x4c0
> [   20.583532]  ? __this_cpu_preempt_check+0x17/0x20
> [   20.583534]  filemap_read+0x11f/0x540
> [   20.583536]  ? __folio_batch_add_and_move+0x7c/0x330
> [   20.583539]  ? __this_cpu_preempt_check+0x17/0x20
> [   20.583541]  generic_file_read_iter+0xc1/0x110
> [   20.583543]  ? do_pte_missing+0x13a/0x450
> [   20.583547]  ext4_file_read_iter+0x51/0x17
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
