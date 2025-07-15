Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC64B067DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 22:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7G0sAighjmCKuSGWXUOdWE5fil/ateaZv6QbPhj8TKU=; b=hTaTvbCdgPoQA2IMAXHwcekfAv
	x5Qy0eCC4Lx98ENRlyvMnoWB3epBPK6sCBvw4BLUCgAAhmanLAvjywbXPKIG+zURUY75ljnj0ZVeJ
	qUklowBztLYrRg46j2grAPcbjqZ+TACqt6cijEEuwahG+oAdqLvNMxx0C9rMEC3ZlVQU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubmSX-0005l9-SQ;
	Tue, 15 Jul 2025 20:41:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1ubmSW-0005kv-3m
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 20:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SYy7+JhvSNYS+NgaNxt53BfDsD6DTcsBMQgVgtXAnMw=; b=EzB/5taxFZyu9ikZA7P2bb8YlD
 DjtFmv99+iLoyXZdY1VLCqU+2rkwBhbrHRqVth84FAf6jeDSXAzMrv7teARIUKqAxvgzaL8dMUQnw
 Y3f/H/M5vAzMC9ahBgq0cSnT5QhDrykK3M5u/f8Cn7H1ILcD3lAxGjg3DmRhwGQ1oc5E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SYy7+JhvSNYS+NgaNxt53BfDsD6DTcsBMQgVgtXAnMw=; b=A
 viB9oC5uD6lABrVI6v18RtMDnjtJa6gJdBr3/s6lp7KEq8DMrQXjJrOT3VUQwM/rZLVUkO6b7EmHH
 vxkBadbUICVJzZoV7S3OgWNNQkNNognjlx81LX/exc/7kjlHaO5k2Cgi+lCR2TChK9zrqNHkMd0F8
 7XrS+VcD/hdfmZLE=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ubmSV-00012u-2b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 20:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=SYy7+JhvSNYS+NgaNxt53BfDsD6DTcsBMQgVgtXAnMw=; b=rkI+4BNOMXmHOlYzssTyZGMoyL
 aI4+mtJLryNxKiCc4W+ld08C0+bphxREcY/dxe5wfC8vq1Jm/gkORw00fkrVN1wN9ZebXvUZdsASi
 zm/TWcijb+f/QGxCr7JAj8hN/eD1ZF8y8US+BmVKcsXKcioWHpvbobjpz6cJAgAK7CUS1qNhk4uFL
 tjWrM8+Ywd756Z75jpjjjhA98m3aZFKJrVLHToG44C24SvMEzbGkUiMb11sHEeqIF4vneMyjl5vwU
 TzrTkImLRsy3P+dQk+EBbDZjxoBwbifTvRQpCJk58iDMe6EFuJx0uQ/0H2pK8Hk2W4Z21ZbGxiHf4
 6wuu3xaA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1ubmSA-0000000DkmQ-22ck;
 Tue, 15 Jul 2025 20:40:42 +0000
Date: Tue, 15 Jul 2025 21:40:42 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 Nicolas Pitre <nico@fluxnic.net>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Howells <dhowells@redhat.com>, netfs@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>,
 linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>
Message-ID: <aHa8ylTh0DGEQklt@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I've started looking at how the page cache can help
 filesystems
 handle compressed data better. Feedback would be appreciated! I'll probably
 say a few things which are obvious to anyone who knows how c [...] 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1ubmSV-00012u-2b
Subject: [f2fs-dev] Compressed files & the page cache
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I've started looking at how the page cache can help filesystems handle
compressed data better.  Feedback would be appreciated!  I'll probably
say a few things which are obvious to anyone who knows how compressed
files work, but I'm trying to be explicit about my assumptions.

First, I believe that all filesystems work by compressing fixed-size
plaintext into variable-sized compressed blocks.  This would be a good
point to stop reading and tell me about counterexamples.

From what I've been reading in all your filesystems is that you want to
allocate extra pages in the page cache in order to store the excess data
retrieved along with the page that you're actually trying to read.  That's
because compressing in larger chunks leads to better compression.

There's some discrepancy between filesystems whether you need scratch
space for decompression.  Some filesystems read the compressed data into
the pagecache and decompress in-place, while other filesystems read the
compressed data into scratch pages and decompress into the page cache.

There also seems to be some discrepancy between filesystems whether the
decompression involves vmap() of all the memory allocated or whether the
decompression routines can handle doing kmap_local() on individual pages.

So, my proposal is that filesystems tell the page cache that their minimum
folio size is the compression block size.  That seems to be around 64k,
so not an unreasonable minimum allocation size.  That removes all the
extra code in filesystems to allocate extra memory in the page cache.
It means we don't attempt to track dirtiness at a sub-folio granularity
(there's no point, we have to write back the entire compressed bock
at once).  We also get a single virtually contiguous block ... if you're
willing to ditch HIGHMEM support.  Or there's a proposal to introduce a
vmap_file() which would give us a virtually contiguous chunk of memory
(and could be trivially turned into a noop for the case of trying to
vmap a single large folio).



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
