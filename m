Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMo2Js0qemmi3gEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:27:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A299A3C28
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:27:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ELvcxs8mXkDDxuQBn7/ewaepOPoHUII4HMoxHfAY/Qc=; b=Fzit73HR+BhxpZ0HBfxTLh81oT
	FBgJd5bHB+Aji98OwLmIqPTBxAxCB5ERQb7ib/N+SUHjFaY3584xDZ5OBFaW/Rr6id0ezeRBXqmyi
	svAvu9nSOsE6L8+YAXWu0JryMSKzXEIkjBuChutPdjtmpUBfM1X0JTNWHfhpJ61eSHxs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vl7RZ-00058w-KC;
	Wed, 28 Jan 2026 15:26:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+97ec6e74097c8d3e794e+8193+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vl7RX-00058m-Hi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V4gzpQ2cI1n1D9pDC+6TS0qJqy9O+aRgiUvOw1bVFC4=; b=AFivPy70GGY9KJDzIXFeBywWo4
 W6dapSZTuXYn8p83CTjdkkFXTE5SArNVYnNpQX8BwN3C2/vf2f9XaW5Fd0zrLLi48CyJQEWHlQ6V1
 Gve6Ixx9Bm2cn/IN8t0+KBK53Ao1rLVZueY4wdJeQsde16s9rw1viqtBZpUYhI8lMS/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V4gzpQ2cI1n1D9pDC+6TS0qJqy9O+aRgiUvOw1bVFC4=; b=A
 4Gmu9+Bh+rsvTnNccFBMaSNqGrqBOys37mR7R3GwpCnCk3eXh1rMwAnwBBWXEFJSSi00gMtYr/6SA
 ELunOcCtLr163tkdBowqEt+LaUoA6M1d5O1ylUshX/UoLZTkphPlf8UcL62WntzfDwQabKIS9nZ1B
 ZpVF0OVhHpKC+IJQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vl7RW-0002RU-2Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=V4gzpQ2cI1n1D9pDC+6TS0qJqy9O+aRgiUvOw1bVFC4=; b=pdSh+5NQiI2K3lcSaijooTJsfh
 6qzoCa3ADP9YMFgR3h/B1s/BIcAC9VGll1ImR7tDl1tKZ2ceSJ03Tp+ms0wIZFioZLoP68kMsm1YW
 p9qeWDjjsaIZgv4k5edvUcioQV3q9BGvlqub2/q/fKSQw/QSNRAPhizfs6rYTYrJ1qu8/kjlzsgdW
 ZtJXRGD3iTYRAXt1yGYBAcpg0JhlaEGNZRdaWEoA1zFU/thPhKD1hDpTycRzOMQgKyRX+8n6c//Cw
 JRMSmnSqB3JjtL89qPdrZw8R74BTCGGNdew1j0DtSrP1zgU72bMsSZto9/6zJcS0bUFGr+ISMGVN8
 Whn5rFvA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vl7RG-0000000GHDn-3mz7; Wed, 28 Jan 2026 15:26:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 28 Jan 2026 16:26:12 +0100
Message-ID: <20260128152630.627409-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, this series has a hodge podge of fsverity enhances
 that I looked into as part of the review of the xfs fsverity support series.
 The first part calls fsverity code from VFS code instead of requiring
 boilerplate in the file systems. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vl7RW-0002RU-2Z
Subject: [f2fs-dev] fsverity cleanups,
 speedup and memory usage optimization v4
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
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN_FAIL(0.00)[7.38.105.216.asn.rspamd.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-f2fs-devel.lists.sourceforge.net:server fail];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8A299A3C28
X-Rspamd-Action: no action

Hi all,

this series has a hodge podge of fsverity enhances that I looked into as
part of the review of the xfs fsverity support series.

The first part calls fsverity code from VFS code instead of requiring
boilerplate in the file systems.

The first patch fixes a bug in btrfs as part of that, as btrfs was missing
a check.  An xfstests test case for this was submitted already.
Can we expedite this fix?

The middle part optimizes the fsverity read path by kicking off readahead
for the fsverity hashes from the data read submission context, which in my
simply testing showed huge benefits for sequential reads using dd.
I haven't been able to get fio to run on a preallocated fio file, but
I expect random read benefits would be significantly better than that
still.

The last part avoids the need for a pointer in every inode for fsverity
and instead uses a rhashtable lookup, which is done once per read_folio
or ->readahead invocation plus for btrfs only for each bio completion.
Right now this does not increse the number of inodes in
each slab, but for ext4 we are getting very close to that (within
16 bytes by my count).

Changes since v4:
 - drop the constification of ctx->vi again
 - fix __filemap_get_folio error handling again
 - don't use "pgoff_t long"
 - improve documentation of the new pagecache helpers
 - reduce the number of fsverity_info lookups in btrfs
 - improve the documentation for fsverity_active

Changes since v2:
 - use sizeof_field for .key_len
 - fix a rebase error that caused an extra fsverity_get_info in
   fsverity_init_verification_context
 - add verify.o to the build in the correct patch
 - fix handling of non-ENOENT ERR_PTR folios in
   generic_readahead_merkle_tree
 - split fixing the __filemap_get_folio error handling into a
   separate patch
 - fix the readahead range in fsverity_read_merkle_tree
 - remove __fsverity_readahead as a result of the above
 - simplify the start/end_hidx calculation in fsverity_readahead
 - drop the > i_size check in fsverity_readahead
 - use pgoff_t where applicable
 - constify fsverity_info pointers in the verification path
 - use IS_ENABLED to disable code not used for non-fsverity builds in
   ext4 and f2fs
 - allow bisection for non-fsverity builds by provinding a stub
   fsverity_info_addr prototype
 - drop the now superflous inode argument to
   fsverity_init_verification_context
 - improve the kerneldoc for fsverity_readahead
 - improve various commit messages
 - fix the barrier placement in fsverity_active
 - mark fsverity_active to work around stupid compilers

Changes since v1:
 - reorder to keep the most controversial part last
 - drop moving the open handling to common code (for now)
 - factor the page cache read code into common code
 - reduce the number of hash lookups
 - add a barrier in the fsverity_active that pairs with the cmpxchg
   that sets the inode flag.

Diffstat:
 fs/attr.c                    |   12 ++
 fs/btrfs/btrfs_inode.h       |    4 
 fs/btrfs/extent_io.c         |   53 +++++++-----
 fs/btrfs/inode.c             |   13 --
 fs/btrfs/verity.c            |   11 --
 fs/buffer.c                  |   25 ++---
 fs/ext4/ext4.h               |    4 
 fs/ext4/inode.c              |    4 
 fs/ext4/readpage.c           |   34 ++++---
 fs/ext4/super.c              |    4 
 fs/ext4/verity.c             |   34 ++-----
 fs/f2fs/compress.c           |    7 -
 fs/f2fs/data.c               |   72 ++++++++++------
 fs/f2fs/f2fs.h               |   12 --
 fs/f2fs/file.c               |    4 
 fs/f2fs/inode.c              |    1 
 fs/f2fs/super.c              |    3 
 fs/f2fs/verity.c             |   34 ++-----
 fs/inode.c                   |    9 ++
 fs/verity/Makefile           |    1 
 fs/verity/enable.c           |   39 +++++---
 fs/verity/fsverity_private.h |   21 ++--
 fs/verity/open.c             |   82 ++++++++++--------
 fs/verity/pagecache.c        |   56 ++++++++++++
 fs/verity/read_metadata.c    |   17 ++-
 fs/verity/verify.c           |   94 +++++++++++++--------
 include/linux/fsverity.h     |  188 ++++++++++++++++---------------------------
 27 files changed, 451 insertions(+), 387 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
