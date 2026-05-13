Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KVnIt6RBGoVLgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 16:59:42 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E85359D7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 16:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuzOG3wmMVe5bMcikLwyYPbOqq9ZuREKUY0aZ9tF3mc=; b=HD1O19tFT+UxgaDS3bJDy/i5Sw
	HbJCF2sAlhNwOob0ENGCfg/1Rtj5uE1HasFSu8KKzGcLXw/G6AuPkwl0p5akFQehWuKGuEfD+OdFt
	Q/BWi7noN6OBSx/10GQhg6N03zr+yUnAgUBcHRNn88MXxh6dCtPDov6BTQ5SNNhzXxNc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNB3b-0002v3-F2;
	Wed, 13 May 2026 14:59:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wNB3Z-0002uu-ND
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 14:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7C1ah9JccRCi6ntT71qsUZVG/Z79mw1kuhsp9RZIJi0=; b=IJfR+nguUZdmp6EnWs82pjEM0M
 HPWIYxpJ1lmd+dxcMJn7CqAdlblcoyVX/WNK6BaiYS5Ie3RE0zB3y+9q/lr6blrDmYfRlDG/YqE5t
 eZC2uZ7ORZYgKj7jg5aVMDrLCWJ2trzXrixhhiO0pguMbvOX0DEMrdlm3r9YuAo4sJgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7C1ah9JccRCi6ntT71qsUZVG/Z79mw1kuhsp9RZIJi0=; b=JnMfqTNOK0tT4N+hAIHV1C4rBv
 7/3iE2nZm9EA1rtk9PWlwm66zOhz/XBQlg23iO/CP/NdvMHbFweyaAGoaojojT4OXQMAKkgocOBIc
 OyWtVfG+kAQgT4nNXw6BVa6T0EjFknh00X9UHjSErR2prrETymRPQrnPZEXvYcG2xR0M=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wNB3V-00064V-5g for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 14:59:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 57C5F44179;
 Wed, 13 May 2026 14:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D47CC2BCB3;
 Wed, 13 May 2026 14:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778684360;
 bh=zbNHyyDRYAeGo6U86F5ea4LHa32zJh59lyteWOe4KGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iIhYEKx51XcVXCXizSytP4ZvhZtiBJmIPf+6O8Mktq3AJeEzUzkfq9zJFMxWWOQN/
 aoWFZ5To1myUEqEdw7VallkySu/iGPAldgKZg0gl6xnLSnuloIhSu3lBTLqysfs1I0
 Skg4f9BktAuE18yvvQRJ70VrpwY5SAV36hi26w0P9GMsQkbf7JD+SNU9HxSde3AnHu
 bo3a4ZV9/09phwV+AioQvcuqmfuB2eTSN/4uxVBmpiaTeWdd95EFcAzHk3DTbz/8je
 v+mVMmUJ6OM8tMNlaOTQXwFxTd7uJskcOql+wcSZWQ2REyC0QM0b5EqoBwpRfC7ETk
 FtuJsAzYKU1jA==
Date: Wed, 13 May 2026 07:59:19 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260513145919.GP9555@frogsfrogsfrogs>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-9-hch@lst.de>
 <20260512170204.GI9555@frogsfrogsfrogs>
 <20260513065608.GA2250@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260513065608.GA2250@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 13, 2026 at 08:56:08AM +0200, Christoph Hellwig
 wrote: > On Tue, May 12, 2026 at 10:02:04AM -0700, Darrick J. Wong wrote:
 > > OH. Now I remember why -- it's to handle contiguous mixed mapp [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wNB3V-00064V-5g
Subject: Re: [f2fs-dev] [PATCH 08/12] swap,
 iomap: simplify iomap_swapfile_iter
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 linux-mm@kvack.org, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Namjae Jeon <linkinjeon@kernel.org>, Chris Li <chrisl@kernel.org>,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-cifs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: A23E85359D7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:chrisl@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dlemoal@kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-cifs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 08:56:08AM +0200, Christoph Hellwig wrote:
> On Tue, May 12, 2026 at 10:02:04AM -0700, Darrick J. Wong wrote:
> > OH.  Now I remember why -- it's to handle contiguous mixed mappings
> > better.
> > 
> > Let's say that you have a 1k fsblock filesystem and 4k base pages.  You
> > fallocate an 8G swap file and then mkswap it.  The first mapping is a 1k
> > written mapping at offset 0 for the swap header, followed by an 8388607k
> > unwritten mapping at offset 3k.
> > 
> > The PAGE_SIZE rounding code in iomap_swapfile_add_extent will round the
> > end of that first mapping down to zero and ignore it.  The second
> > mapping will be treated as if it were a 8388604k mapping starting at
> > offset 4096.  Now the page counts are wrong and the swapon fails.
> 
> Do we care about this use case?  I guess you did as you implemented
> his, but still?

We do, because mkswap -F uses fallocate nowadays:

$ mkswap -s 4194304 -F a
Setting up swapspace version 1, size = 4 MiB (4190208 bytes)
no label, UUID=bc9746bf-e200-4944-927c-80d83872f1cb
$ filefrag -v a
Filesystem type is: 58465342
File size of a is 4194304 (1024 blocks of 4096 bytes)
 ext:     logical_offset:        physical_offset: length:   expected: flags:
   0:        0..       0:  411383552.. 411383552:      1:            
   1:        1..    1023:  411383553.. 411384575:   1023:             last,unwritten,eof
a: 1 extent found

> > A more generic solution to this would be to change add_swap_extent to
> > take sector_t addr and length values and use them to construct a bitmap
> > representing contiguous physical space on the bdev, accounting of course
> > for PAGE_SIZE alignment.  Except for the swap header page, every other
> > contiguously set page-aligned region in the bitmap gets added to the
> > swap extent map.
> 
> You don't even need a bitmap, just do basically the same checks as
> the iomap code when moving to a new swap extent after moving to use
> the sector_t.  And it really should anyway, as the current abuse of
> sector_t to store a disk offset in PAGE_SIZE units is pretty gross.

Oh, I meant this to handle the particularly gross case where the fsblock
size is smaller than a base page, but there are a very large number of
file mappings that point to a physically contiguous extent but are not
in logical order:

{.offset=0, .length=1k, .addr=7},
{.offset=1, .length=1k, .addr=6},
{.offset=2, .length=1k, .addr=5},
{.offset=3, .length=1k, .addr=4},
{.offset=4, .length=1k, .addr=3},
{.offset=5, .length=1k, .addr=2},
{.offset=6, .length=1k, .addr=1},
{.offset=7, .length=1k, .addr=0},

That's two pages of swapfile, but with the current layout accumulation
code we "cannot" find either.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
