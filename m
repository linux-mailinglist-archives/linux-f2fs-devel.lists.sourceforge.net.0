Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF82B0831F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jul 2025 04:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JXC7yXZXTmsIxQkVtfGFkMXK9veWRJ3D2G7pvO/gAY=; b=j7meLAUIGZBxHCc4OwsbXVd2oJ
	pyTOesz14uUbS8YBB5LxK9247D5+41Ty9m8AvUQBD1oZXkLAe3heEbAn/Qmx/33BOW120H2LcbaAS
	8aoodo3XO6xjE1ZvJOfWAGvJiR/NLBLN0ohflJndaP/WP8M/Q00EXJ4Tjn6x36RIrNBg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucEh9-0003j9-Kz;
	Thu, 17 Jul 2025 02:50:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ucEh8-0003iy-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 02:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n2mVmLfdEaLhFKe7KNMxfXRgw5ihLFB2hA1zHsFemk0=; b=gaRerct5KIU0Qisqb5GCxafLZF
 es5irlKvkiewiV1dJ/r9SkV+7M8XUuDNVgxrIuw2qe4Iga3ccQuGNFJw7r5N20XwRiuDLbU0SNvD5
 uNJaZUtrA898LFwGAr/mj8ukb1lUXf3ANTncLqPYQQDjYDPLyQ4Uet7A7D60v0DbN7qg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n2mVmLfdEaLhFKe7KNMxfXRgw5ihLFB2hA1zHsFemk0=; b=DClw6XjTbyihtlbWle/AYRgJod
 UD3vVfKHIXldtvvbDPOa5C+1uGjRdymiJTlz3888wDTu939nsqkL9mBOwb8hGDipBuj6egXYsV33S
 Qqqzwe97ZRrpX57p6q+0FrGN8Tai8lpmsS3KYfgNHrC8slNDDfB80vChJOYewbnIZOyE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ucEh8-0007iq-C5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 17 Jul 2025 02:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A53B2A576DD;
 Thu, 17 Jul 2025 02:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1B0C4CEE7;
 Thu, 17 Jul 2025 02:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752720591;
 bh=+3M7g91K1wbKWaHCHWCVlTkf6dVFqoCHka6+sKX8uc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dxj0Av8D5AZtIisXh2L9yJig4uXBQuxbS9ixY/JMlxvl70bIPu8iWlVqGEzCoOgUi
 +5jU7iXSPRY863B1eVwqkKI4XyGU8N1oiPiSPYP3NlYWjMsCzjY3/zNUSeI4PfvJj0
 n7GfspSMnUer51mMfjRjFN8s+TltBz1xAqzFf/4SamHGdauI6kCAc8//1mfU95Af06
 zzmzEaGEDSNSTgcJHuXYUJGBMCRzfTCgpsxnK/GcWE+60f/gZxYXyl9b+IaN0vufU4
 oIMmh0U1QCuDEp6Cvy24xlk5jGum/YFcnprJ1x7H5mudjZboZP0UCU72iFYOMe7L+u
 czU/b0esZtW6Q==
Date: Wed, 16 Jul 2025 19:49:03 -0700
To: Phillip Lougher <phillip@squashfs.org.uk>
Message-ID: <20250717024903.GA1288@sol>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <f4b9faf9-8efd-4396-b080-e712025825ab@squashfs.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4b9faf9-8efd-4396-b080-e712025825ab@squashfs.org.uk>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 16, 2025 at 11:37:28PM +0100, Phillip Lougher
 wrote: > > There also seems to be some discrepancy between filesystems whether
 the > > decompression involves vmap() of all the memory allocat [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [147.75.193.91 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ucEh8-0007iq-C5
Subject: Re: [f2fs-dev] Compressed files & the page cache
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
Cc: Jan Kara <jack@suse.cz>, Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Matthew Wilcox <willy@infradead.org>, Gao Xiang <xiang@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Howells <dhowells@redhat.com>,
 Nicolas Pitre <nico@fluxnic.net>, David Woodhouse <dwmw2@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 16, 2025 at 11:37:28PM +0100, Phillip Lougher wrote:
> > There also seems to be some discrepancy between filesystems whether the
> > decompression involves vmap() of all the memory allocated or whether the
> > decompression routines can handle doing kmap_local() on individual pages.
> > 
> 
> Squashfs does both, and this depends on whether the decompression
> algorithm implementation in the kernel is multi-shot or single-shot.
> 
> The zlib/xz/zstd decompressors are multi-shot, in that you can call them
> multiply, giving them an extra input or output buffer when it runs out.
> This means you can get them to output into a 4K page at a time, without
> requiring the pages to be contiguous.  kmap_local() can be called on each
> page before passing it to the decompressor.

While those compression libraries do provide streaming APIs, it's sort
of an illusion.  They still need the uncompressed data in a virtually
contiguous buffer for the LZ77 match finding and copying to work.  So,
internally they copy the uncompressed data into a virtually contiguous
buffer.  I suspect that vmap() (or vm_map_ram() which is what f2fs uses)
is actually more efficient than these streaming APIs, since it avoids
the internal copy.  But it would need to be measured.

> > So, my proposal is that filesystems tell the page cache that their minimum
> > folio size is the compression block size.  That seems to be around 64k,
> > so not an unreasonable minimum allocation size.  That removes all the
> > extra code in filesystems to allocate extra memory in the page cache.
> > It means we don't attempt to track dirtiness at a sub-folio granularity
> > (there's no point, we have to write back the entire compressed bock
> > at once).  We also get a single virtually contiguous block ... if you're
> > willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
> > vmap_file() which would give us a virtually contiguous chunk of memory
> > (and could be trivially turned into a noop for the case of trying to
> > vmap a single large folio).

... but of course, if we could get a virtually contiguous buffer
"for free" (at least in the !HIGHMEM case) as in the above proposal,
that would clearly be the best option.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
