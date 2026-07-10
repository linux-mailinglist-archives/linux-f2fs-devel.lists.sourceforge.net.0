Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z1DLIiCzUGqP3gIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 10:53:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 884D4738B04
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2026 10:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=KQYgEuJZ;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bSnHwjdt;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="I YHo1u+";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=M3EW2s2u;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wguSKCLHmoiPkLrLTw/tYjKpeVnuGWq/Q683pEPKK6E=; b=KQYgEuJZ/hoPH/N+M4woPXDiox
	WQHHuHq7cx747YMOwIQyPwj9u4HovJHEqzKYEamXxfV981Kd5NZFbI4WdtMi5fw1zTzlMZTguTuTN
	/131xlGrMFNh8QjmRA38ds6ObpEYN6Fows7nnmz8qrPwLfhJ8cH8udL05m3X566KxUHs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wi6zR-0001bj-L8;
	Fri, 10 Jul 2026 08:53:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wi6zO-0001bW-88
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 08:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jUEWqzNinCPM12OV3zUyhQvNPhZCs0c/Nd9c+XF8Q7Y=; b=bSnHwjdtuwrfzo9FO4JCcBKMaW
 2U3bafdUZ9b671KVULl/27MwI6RJ7reznX1kaMb0rCtXNVXQsDPTGG+ipyWg2WO7VvezVll7TNhUw
 GIEsf79fc5BMUkXJL+HlacIXFPKfyLwgmgrpreIh1MMryh23Z2ySVr4BxhJt2BAIKYRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jUEWqzNinCPM12OV3zUyhQvNPhZCs0c/Nd9c+XF8Q7Y=; b=I
 YHo1u+Xo1NXMZ2JeJOvF4fDbVyWLnhh5m+Y3JJk8VG8HjO/kY2LrxI0+T3SMcORN4ZcsHxqysU8hU
 cXOsT1gTIEOEHqv7wJdDnnDcrxTxakNfeRlXJ+uWCJ+ka4romWbuXU3lPkStSSIXnT0TFkoZHdFIA
 LgAyTAw4oxqXeVNU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wi6zH-0007T6-BC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 08:53:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E7E9241E75;
 Fri, 10 Jul 2026 08:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E011F000E9;
 Fri, 10 Jul 2026 08:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783673604;
 bh=jUEWqzNinCPM12OV3zUyhQvNPhZCs0c/Nd9c+XF8Q7Y=;
 h=From:To:Cc:Subject:Date;
 b=M3EW2s2u51NYK94z4WwpLO4GMIta7E3FTQJQdbOa/UyDecMAPJ8BxqU9r36o57sKv
 RTnlMn1EEJLqts1USTAiqLo9K6z2iivsnlHD5wIFoACStDyBBT/eMpHyzZ98TEFUON
 i30IVjcNj3gXpfdVfXUw0+3nSWo6IqQvtwMDsR5x3CQN7/fTGTW2jBeF/1RemHjsyz
 QII15A712UAFMt038Dli2eIi8+pAOWmd+d3mJyivjLJR68ifZop1qT5B/ssjfTpDQG
 77LXScutALT1uRpCTGt8+YVV2amT6GGYbXMbvWSqyUdAhkxKb+QVe49elBJbuwR/mU
 7wUnXs8LH5P5g==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Fri, 10 Jul 2026 10:52:28 +0200
Message-ID: <20260710085256.3464201-1-aalbersh@kernel.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all,
 This is v11 of fsverity for XFS. This revision includes
 fixes for issues found by sashiko.dev + rebase to the latest master. Below
 are my responses to the sashiko points. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: sashiko.dev]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wi6zH-0007T6-BC
Subject: [f2fs-dev] [PATCH v11 00/20] fs-verity support for XFS with post
 EOF merkle tree
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 david@fromorbit.com, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,sashiko.dev:url,lst.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 884D4738B04

Hi all,

This is v11 of fsverity for XFS. This revision includes fixes for issues
found by sashiko.dev + rebase to the latest master.

Below are my responses to the sashiko points.

Range-diff with v10 also below.

Patches 5, 6, and 10 are new.

Patches without review:
[PATCH v11 05/20] fsverity: improve flushing performance of
[PATCH v11 06/20] fsverity: don't allow setting DAX file attribute on
[PATCH v11 10/20] xfs: don't report dio_mem_align and
[PATCH v11 11/20] xfs: disable direct read path for fs-verity files
[PATCH v11 12/20] xfs: handle fsverity I/O in write/read path
[PATCH v11 14/20] xfs: add fs-verity support
[PATCH v11 15/20] xfs: remove unwritten extents after preallocations

This series based on v7.2-rc2.

kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/aalbersh/xfs-linux.git/log/?h=fsverity

xfsprogs:
https://git.kernel.org/pub/scm/linux/kernel/git/aalbersh/xfsprogs-dev.git/log/?h=fsverity

xfstests:
https://git.kernel.org/pub/scm/linux/kernel/git/aalbersh/xfstests-dev.git/log/?h=fsverity

sashiko review:
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org

v10:
https://lore.kernel.org/fsverity/20260520123722.405752-1-aalbersh@kernel.org/#r

v9:
https://lore.kernel.org/fsverity/20260428083332.768693-1-aalbersh@kernel.org/#r

Cc: fsverity@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-xfs@vger.kernel.org
Cc: linux-unionfs@vger.kernel.org

Cc: david@fromorbit.com
Cc: djwong@kernel.org
Cc: ebiggers@kernel.org
Cc: hch@lst.de


---
Changes in v11:
- Drop wrong overlayfs patch
- Drop already merged iomap and fsverity patches
- Update to I_INO() use instead of ip->i_ino
- Sashiko.dev fixes. See list of issues below.
Changes in v10:
- Rebase to v7.1-rc3 with relevant adjustments
- Initialize ioend->io_vi to NULL to not get write work onto verity wq
- Range diff below
Changes in v9:
- Fix fsverity_fill_zerohash() parameter names
- A few fixes found by sashiko.dev:
	- Replace ip->i_mount->m_attr_geo->blksize with m_sb.sb_blocksize
	- Don't call xfs_trans_cancel() after xfs_trans_commit() in
	  xfs_fsverity_end_enable()
	- Call xfs_fsverity_delete_metadata() if verity enable failed
	- Change start/end type from xfs_fileoff_t to loff_t
	- Return xfs_trans_commit() error from
	  xfs_fsverity_cancel_unwritten()
Changes in v8:
- Return fsverity_ensure_verity_info() errors from
  ovl_ensure_verity_loaded()
Changes in v7:
- Move kerneldoc to fsverity_ensure_verity_info() definition
- Drop patch adding XFS traces
- Fix overly long line in the comment
- Make order of fserror and fsverity_error consistent
- Add overlay patch converting to fsverity_ensure_verity_info()
Changes in v6:
- Removed stub for fsverity_ensure_verity_info() as it's optimized out
- Rename fsverity_folio_zero_hash() to fsverify_fill_zerohash()
- Merge patches 8 to 10 into one
- Merge patch gerating zero_hash and fsverity_fill_zerohash() into one
- Add kerneldoc to fsverity_ensure_verity_info()
- Add comments to iomap_block_needs_zeroing()
Changes in v5:
- Add fserror_report_data_lost() for data blocks in page spanning EOF
- Issue fsverity metadata readahead in data readahead
- iomap_fsverity_write() return type fix
- Use of S_ISREG(mode)
- Make 65536 #define instead of open-coded
- Use transaction per unwritten extent removal
- Fetch fsverity_info for all fsverity metadata
- Revert fsverity_folio_zero_hash() stub as used in iomap
- Extend cancel_unwritten to whole file range to remove cow leftovers
- Drop delayed allocation on the COW fork on fsverity completion
Changes in v4:
- Use fserror interface in fsverity instead of fs callback
- Hoist pagecache_read from f2fs/ext4 to fsverity
- Refactor iomap code
- Fetch fsverity_info only for file data and merkle tree holes
- Do not disable preallocation, remove unwritten extents instead
- Offload fsverity hash I/O to fsverity workqueue in read path
- Store merkle tree at round_up(i_size, 64k)
- Add a spacing between merkle tree and fsverity descriptor as next 64k
  aligned block
- Squash helpers into first user commits
- Squash on-disk format changes into single commit
- Drop different offset for pagecache/on-disk
- Don't zero out pages in higher order folios in write path
- Link to v3: https://lore.kernel.org/fsverity/20260217231937.1183679-1-aalbersh@kernel.org/T/#t
Changes in v3:
- Different on-disk and pagecache offset
- Use read path ioends
- Switch to hashtable fsverity info
- Synthesize merkle tree blocks full of zeroes
- Other minor refactors
- Link to v2: https://lore.kernel.org/fsverity/20260114164210.GO15583@frogsfrogsfrogs/T/#t
Changes in v2:
- Move to VFS interface for merkle tree block reading
- Drop patchset for per filesystem workqueues
- Change how offsets of the descriptor and tree metadata is calculated
- Store fs-verity descriptor in data fork side by side with merkle tree
- Simplify iomap changes, remove interface for post eof read/write
- Get rid of extended attribute implementation
- Link to v1: https://lore.kernel.org/r/20250728-fsverity-v1-0-9e5443af0e34@kernel.org

-- >8 --
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=3

> Could bypassing kernel_file_open() break fs-verity initialization for encrypted
> lower files?
> Previously, kernel_file_open() triggered the underlying filesystem's open
> routine (such as ext4_file_open()), which in turn called fscrypt_file_open()
> to initialize the file's encryption key (inode->i_crypt_info).
> By calling fsverity_ensure_verity_info() directly, the fscrypt initialization
> is skipped. If a lower file uses both fs-verity and fscrypt, reading the
> verity descriptor via pagecache_read() will trigger
> fscrypt_decrypt_pagecache_blocks() upon I/O completion.
> Since the encryption key was never initialized, it appears this could lead to
> a NULL pointer dereference on inode->i_crypt_info when accessed by
> fscrypt_decrypt_pagecache_blocks().
> Does this allow an unprivileged user to trigger a kernel panic simply by
> stat'ing the file during path lookup?

Dropped

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=4

> Does this loop cause excessive cache flushing overhead?
> Looking at memcpy_to_folio(), it maps the folio, copies the data, unmaps it,
> and then unconditionally calls flush_dcache_folio() on the entire folio:
> include/linux/highmem.h:memcpy_to_folio() {
> 	...
> 	do {
> 		char *to = kmap_local_folio(folio, offset);
> 		...
> 		memcpy(to, from, chunk);
> 		kunmap_local(to);
> 		...
> 	} while (len > 0);
> 	flush_dcache_folio(folio);
> }
> Because memcpy_to_folio() is called here once for every digest size
> (typically 32 bytes), a single 4KB folio will trigger 128 full folio cache
> flushes. For a 2MB large folio, this results in over 65,000 full folio cache
> flushes, creating O(N^2) cache flushing behavior.
> Could this function map the folio directly, perform all inner digest copies in
> a single pass, unmap it, and then flush the cache exactly once?

This is valid, open-coded the copying to modify folio once and then flush it.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=7

> Does this check wpc->iomap.flags before the current folio's mapping is
> initialized?

yes

> Looking at iomap_writeback_folio() below, iomap_writeback_handle_eof() is
> called early in the function to determine if the folio is past EOF. At this
> point, wpc->iomap has not yet been populated for the current folio; it is
> updated later when iomap_writeback_range() calls the map_blocks callback.
> This means iomap_writeback_handle_eof() appears to read stale state from the
> previously mapped folio, or zero if it is the first folio in the writepage
> context.
> If a regular file data block was processed previously, wpc->iomap.flags will
> lack IOMAP_F_FSVERITY, causing fs-verity metadata folios to be treated as
> invalid past-EOF data and incorrectly skipped.
> Conversely, if cyclic writeback wraps around to index 0 after processing an
> fs-verity folio, could the stale IOMAP_F_FSVERITY flag cause regular folios
> to incorrectly trigger the WARN_ON_ONCE() here?

The wpc->iomap is not initialized at this point for the first folio. The
XFS uses wpc->iomap.flags field to communicate to iomap that writeback is
happening for fsverity folios located beyond EOF. With XFS implementation data
folios are written back before merkle tree construction, so, we won't get any
data folios here.

That's true that flag is stale from a previous folio, however, all folios have
it set in the mapping at this point.

Or it could be done like this, without EOF check for fsverity writeback:
https://lore.kernel.org/fsverity/20250728-fsverity-v1-1-9e5443af0e34@kernel.org/

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=8

> Does this leave the folio range uninitialized if ctx->vi is NULL?

yes, intentional

> Page cache folios are not zeroed by default. If we skip calling
> folio_zero_range() but still mark the range as uptodate, could this
> expose uninitialized memory to the fs-verity core during descriptor parsing?

yes, intentional

> Additionally, does this unconditionally fill the hole with zero-hashes if
> ctx->vi is present, even if this is the padding hole past the fsverity
> descriptor?

No, it doesn't as ctx->vi will not be set

> If the padding hole length is not aligned to the digest size, could this
> trigger a warning in fsverity_fill_zerohash()?

It's aligned as it always starts on at a block.

> It seems an explicit fallback to folio_zero_range() might be needed for both
> the NULL ctx->vi case and the descriptor padding hole case.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=9

> Will this unconditionally convert short writes into -EIO?
> iomap_file_buffered_write() implements standard VFS write semantics: if an
> error (like -ENOSPC or -EDQUOT) occurs after successfully writing part of the
> data across multiple extents, it returns the positive number of bytes written
> so far.
> Because this code does not loop while length > 0, a short write results in
> ret > 0 but ret != length. Masking the true cause of the error and returning
> a hardware error to userspace might cause confusion.
> Should this code implement a retry loop to properly extract the underlying
> error code?

Yes this is true, but we can not get these error codes from iomap_iter.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=10

> Since XFS_SB_FEAT_RO_COMPAT_VERITY is intentionally omitted from
> XFS_SB_FEAT_RO_COMPAT_ALL to force read-only mounts, won't the superblock
> verifier explicitly treat it as an unknown feature?
> This could trigger a high-priority alert (Superblock has unknown read-only
> compatible features (0x10) enabled) every time such a filesystem is mounted,
> even though the kernel explicitly parses this bit.
> Will this misleading warning persist until the end of the series where
> commit "xfs: enable ro-compat fs-verity flag" fully enables it?

Yes, this is intentional, so that kernel without full fsverity implementation
doesn't mount these filesytems.

> Does exposing XFS_DIFLAG2_VERITY to userspace as FS_XFLAG_VERITY require
> an update to xfs_flags2diflags2() to preserve it?
> When a user modifies file attributes (e.g., running chattr +S), VFS masks
> out the read-only FS_XFLAG_VERITY bit. The xfs_flags2diflags2 function then
> reconstructs i_diflags2 using a hardcoded preservation mask
> (XFS_DIFLAG2_REFLINK | XFS_DIFLAG2_BIGTIME | XFS_DIFLAG2_NREXT64).
> Because the verity bit is neither in this preservation mask nor present in
> the VFS-provided xflags, could it be permanently and erroneously cleared
> from the disk inode, allowing any user with attribute-setting privileges to
> silently disable fs-verity protection on disk?

This is valid, added a fix

> Does mapping XFS_DIFLAG2_VERITY to FS_XFLAG_VERITY and setting S_VERITY on
> the VFS inode here prematurely advertise to VFS and LSMs that the file is
> verified?
> Since the XFS read verification path is not yet implemented (it is added
> later in commit "xfs: handle fsverity I/O in write/read path"), if someone
> were to git bisect to this intermediate commit, could an attacker mount an
> fs-verity image read-only and serve malicious modifications to userspace
> without triggering validation errors?

This is fine, kernel don't know about fsverity feature yet. Alert about unknown
feature bit from above will pop-up.

> Does the mask that clears inode->i_flags later in this function need to be
> updated to include S_VERITY?
> Later in xfs_diflags_to_iflags(), flags are synchronized to the VFS inode:
>     inode->i_flags &= ~(S_IMMUTABLE | S_APPEND | S_SYNC | S_NOATIME);
> If S_VERITY is omitted from this clearing mask, and the XFS inode loses the
> verity flag (e.g., due to the xfs_flags2diflags2 issue), S_VERITY is never
> cleared from the VFS inode.
> Could this create a desynchronization where LSMs like IPE continue to trust
> the file's contents based on the stale VFS state, while XFS skips data
> verification on read because the underlying disk flag is missing?

This is valid, fixed

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=12

> Does this change completely prevent DAX and verity from coexisting?
> While this prevents the in-memory DAX mapping from being enabled, could a
> user still set the persistent DAX flag (FS_XFLAG_DAX) via FS_IOC_FSSETXATTR
> on an inode that already has fs-verity enabled?
> It appears xfs_ioctl_setattr_xflags() might need a validation check to
> prevent creating a contradictory on-disk state where both XFS_DIFLAG2_DAX
> and XFS_DIFLAG2_VERITY are persistently set.

The file attribute fix applied. This check is not executed during setting file
attributes, only on inode creation. This will prevent fsverity inode to have DAX
with -o dax mount.

> This is a pre-existing issue, but does xfs_flags2diflags2() silently drop
> the XFS_DIFLAG2_VERITY flag?
> When modifying extended attributes via FS_IOC_FSSETXATTR, XFS recalculates
> the on-disk flags. Since xfs_flags2diflags2() only preserves a hardcoded
> whitelist of flags (REFLINK, BIGTIME, NREXT64) from ip->i_diflags2, it
> appears to ignore XFS_DIFLAG2_VERITY.
> Does this mean a valid xflags modification will permanently clear the
> verity flag from the on-disk inode?

This is true, addressed with a fix above.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=13

> Can a Time-of-Check to Time-of-Use (TOCTOU) race occur here?
> fsverity_active(inode) is checked without holding any locks. If a
> concurrent thread successfully enables fs-verity via FS_IOC_ENABLE_VERITY
> immediately after this lockless check evaluates to false, the IOCB_DIRECT
> flag will not be cleared.
> The reader thread then proceeds to xfs_file_dio_read() and blocks waiting
> for XFS_IOLOCK_SHARED. The thread enabling verity holds XFS_IOLOCK_EXCL
> while building the Merkle tree and setting S_VERITY. Once it completes
> and releases the lock, the file is fully verity-enabled.
> However, the blocked reader thread then acquires XFS_IOLOCK_SHARED and
> blindly passes the IOCB_DIRECT flag to iomap_dio_rw(), which does not
> re-check S_VERITY. Does this allow an attacker or a racing application to
> read unverified data from a file that has officially been sealed by
> fs-verity?

This is valid, addressed with a fix

> Does this change leave the statx STATX_DIOALIGN interface improperly
> advertising Direct I/O support for fs-verity files?
> This patch forces fs-verity files to fall back from Direct I/O to buffered
> I/O by clearing the IOCB_DIRECT flag. However, xfs_report_dioalign() appears
> to unconditionally populate stat->dio_mem_align and stat->dio_offset_align
> with non-zero values derived from the block device.
> Since Direct I/O is bypassed for these files, should these alignment fields
> be reported as 0 to avoid misleading applications into issuing DIO requests
> that silently degrade to buffered I/O performance?

This is valid, addressed with a fix to return statx->dio_*_align fields filled
with 0, meaning not supported

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=14

> Does this code silently clear the IOMAP_F_FSVERITY flag if it races with
> another thread?
> Earlier in xfs_bmapi_convert_one_delalloc(), if we race with another thread
> converting the extent:
>     if (!isnullstartblock(bma.got.br_startblock)) {
>         xfs_bmbt_to_iomap(ip, iomap, &bma.got, 0, flags, ...);
>         ...
>         goto out_trans_cancel;
>     }
> The flags variable will not have IOMAP_F_FSVERITY set.
> Because xfs_bmbt_to_iomap() unconditionally assigns iomap->flags = iomap_flags,
> this will overwrite the iomap's flags and erase IOMAP_F_FSVERITY if it was
> previously set by xfs_map_blocks(). This could cause subsequent fs-verity
> metadata folios mapped by this iomap to lack the flag, leading to them being
> zeroed and skipped since they reside beyond EOF.

This probably can not happen in the current implementation as the only thread
converting these extents is writeback on post EOF region, called from the
fsverity_operations->end_enable_verity(). As these extesnts/folios reside past
EOF they should be skipped by normal writeback. But let's set the flag anyway so
there's no issue if anything changes.

> Could this drop fs-verity metadata for zoned inodes?
> In xfs_vm_writepages(), the zoned inode branch uses a separate
> xfs_zoned_writepage_ctx structure and calls iomap_writepages() without setting
> the IOMAP_F_FSVERITY flag on its iomap:
>     if (xfs_is_zoned_inode(ip)) {
>         struct xfs_zoned_writepage_ctx xc = { ... };
>         error = iomap_writepages(&xc.ctx);
>         ...
> Without the flag, folios past EOF might be zeroed or skipped by the core iomap
> writeback code, potentially losing the Merkle tree metadata.

This is valid, moved to the helper for both cases

> Can fs-verity metadata be dropped when using extent size hints or zoned inodes?
> Earlier in xfs_buffered_write_iomap_begin(), the code delegates to other
> functions and returns early:
>     if (xfs_is_zoned_inode(ip))
>         return xfs_zoned_buffered_write_iomap_begin(...);
>     if (xfs_get_extsz_hint(ip))
>         return xfs_direct_write_iomap_begin(...);
> Because these functions do not check for XFS_VERITY_CONSTRUCTION or set
> IOMAP_F_FSVERITY, the iomap will lack the flag. Does this cause writeback of
> folios past EOF to skip the Merkle tree metadata for these inodes?

This is valid, moved up with a few other fixes in write path.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=15

> Can merged ioends bypass cryptographic validation here?
> In xfs_end_io(), contiguous ioends are merged via iomap_ioend_try_merge(),
> which chains subsequent ioends into the head ioend's io_list:
> 	list_del_init(&ioend->io_list);
> 	iomap_ioend_try_merge(ioend, &tmp);
> 	if (bio_op(&ioend->io_bio) == REQ_OP_READ)
> 		xfs_end_ioend_read(ioend);
> xfs_end_ioend_read() is then called only on the head ioend and
> unconditionally verifies only that single bio (&ioend->io_bio). It doesn't
> appear to iterate over the merged ioends present in ioend->io_list.
> Afterward, iomap_finish_ioends() processes the entire ioend->io_list chain,
> marking all folios as Uptodate and unlocking them. If a read is split into
> multiple bios that complete in the same batch, does this allow the trailing
> merged bios to bypass fsverity verification completely?

I don't think this is the case as iomap_ioend_try_merge() doesn't merge READ
ioends.

> Does sharing a single work_struct (i_ioend_work) and list (i_ioend_list)
> for both fsverity data reads and other I/O completions cause workqueue
> multiplexing or deadlocks?
> If list_empty(&ip->i_ioend_list) is true, the work is queued to either the
> fsverity workqueue or m_unwritten_workqueue based on the first ioend that
> completes. Subsequent completions simply append to ip->i_ioend_list. Could
> this result in writes being processed by the fsverity workqueue, or data
> reads being processed by the unwritten workqueue?
> Additionally, if bdev_has_integrity_csum() is true, all reads (including
> fsverity metadata) use xfs_iomap_read_ops, routing their completions to
> xfs_end_bio() and this same list.
> Because iomap_sort_ioends() sorts data reads before metadata reads, could
> this create a single-thread deadlock? When xfs_end_io() processes the data
> read first, it calls fsverity_verify_bio(). If the metadata is not yet
> Uptodate, fsverity_verify_bio() blocks waiting for the metadata folio to
> become unlocked. However, the metadata ioend that unlocks the folio might
> be queued later in the same tmp list being processed by the same worker
> thread.

This is not correct. No writes happens on the file at this point. However, what
can happen is if block device has integrity checksum and file is fsverity
enabled, then, integrity checksum verification could get onto fsverity workqueue
instead of m_unwritten_workqueue, and vice versa. I don't think it's critical as
it doesn't create deadlocks.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=16

> The VFS fs-verity core calls this function without holding XFS-specific locks.
> Does xfs_bmap_last_extent() (which calls xfs_iread_extents()) require the
> XFS_ILOCK_SHARED lock to prevent lockdep assertions and data races when
> accessing the extent tree?

Added a lock/unlock

> Should this bounds check be <= instead of <?
> If a file has exactly 0 bytes of metadata, last_block_offset could be exactly
> equal to the metadata offset. In that case, this check passes, and the
> subsequent subtraction of 4 bytes for desc_size_pos will read into user data
> instead of metadata.

yes, could be the case for zero-length file, fixed

> Does this leave stale unevictable folios in the page cache?
> Since xfs_itruncate_extents() removes the blocks but truncate_inode_pages()
> or truncate_pagecache() is not called here, the dirty pages might remain in
> memory past EOF and could be exposed as data if the file is later extended.

Yes this leaves stale folios, added truncate_inode_pages() to i_size.

> Is it safe to drop the inode lock before canceling the transaction?
> xfs_trans_cancel() processes log item release callbacks, and
> xfs_inode_item_release() requires XFS_ILOCK_EXCL to be held if the item
> was dirtied. This ordering might trigger lockdep assertions or create a
> use-after-free race.

Fixed.

> If xfs_qm_dqattach() or xfs_fsverity_delete_metadata() fails, the function
> returns the error but does not clear the XFS_VERITY_CONSTRUCTION flag.
> Since the VFS won't call end_enable_verity on failure, does this leak the
> flag and permanently block future attempts to enable fs-verity on this inode?

Added clearing.

> Can xfs_bmap_punch_delalloc_range() dereference a NULL cowfp here?
> xfs_is_cow_inode() only checks the reflink inode flag or the global always_cow
> state, but it does not guarantee that the in-memory COW fork tracking structure
> (ip->i_cowfp) has been allocated. If there are no active COW operations, this
> might cause a NULL pointer dereference.

yes, fixed

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=17

> Does this error path leak the XFS_ILOCK_EXCL inode lock?
> Since xfs_trans_ijoin() is called with a lock_flags of 0, the transaction
> framework will not automatically unlock the inode on commit. If
> xfs_trans_commit() returns an error, returning directly here will bypass
> the xfs_iunlock(ip, XFS_ILOCK_EXCL) call at the end of the loop.
> While a commit failure on a dirty transaction triggers a filesystem shutdown,
> the leaked lock can cause subsequent cleanup operations, such as inode
> eviction during unmount, to hang indefinitely.

Fixed, added XFS_ILOCK_EXCL to the ijoin.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=20

> Does this code risk marking healthy fs-verity files as incomplete?
> The setup function for the xattr scrubber, xchk_setup_xattr(), delegates
> to xchk_setup_inode_contents(), which does not seem to call
> xchk_inode_setup_verity().
> If fsverity_ensure_verity_info() is never called during the xattr scrub
> setup to instantiate the in-memory verity info, fsverity_get_info() might
> legitimately return NULL for valid verity files that haven't been accessed
> yet, causing xchk_inode_verity_broken() to incorrectly return true.

This is residue from the xattr implementation, removed

> This is a pre-existing issue, but could this call to
> fsverity_ensure_verity_info() lead to an assertion failure or data race?
> When fsverity_ensure_verity_info() invokes xfs_fsverity_get_descriptor(),
> it calls xfs_bmap_last_extent() without holding the XFS_ILOCK.
> Because xfs_bmap_last_extent() unconditionally calls xfs_iread_extents(),
> if extents are not yet loaded into memory, this can trigger the
> xfs_assert_ilocked(ip, XFS_ILOCK_EXCL) assertion or result in a data race.

Lock added.

> Will intercepting these validation errors cause xfs_scrub to permanently
> strip fs-verity protection from valid files?
> The fsverity core returns errors like -EINVAL for valid files if the kernel
> is missing specific crypto modules or if there is an unsupported
> configuration.
> If we treat these as corruption, xchk_inode_verity_broken() will return true,
> which then triggers xrep_inode_verity() to permanently strip the
> XFS_DIFLAG2_VERITY and S_VERITY flags from the inode, allowing the file to
> be modified without verification.

This is not true, fsverity select necessary hash algorithms and unsupported
configuration is valid reason to strip corrupted descriptor.

------------------------------------------------------------------------
https://sashiko.dev/#/patchset/20260520123722.405752-1-aalbersh%40kernel.org?part=21

> This isn't a bug introduced by this patch, but does xfs_fsverity_get_descriptor()
> call xfs_bmap_last_extent() earlier without holding the XFS inode lock
> (XFS_ILOCK_SHARED)?
> If the file's extents have not been loaded into memory,
> xfs_bmap_last_extent() will call xfs_iread_extents(), which asserts that the
> caller holds at least XFS_ILOCK_SHARED.
> Without this lock, could this lead to an assertion failure on debug kernels,
> or a data race causing memory corruption when multiple threads concurrently
> attempt to load the extent tree?

Lock added.

> This is a pre-existing issue, but is there a missing bounds check to ensure
> desc_pos does not overlap with the file's data area?
> While there is a check above to ensure desc_size <= desc_size_pos, there
> doesn't appear to be validation that desc_pos >=
> xfs_fsverity_metadata_offset(ip).
> If a corrupted on-disk desc_size causes desc_pos to underflow the metadata
> boundary, will fsverity_pagecache_read() silently read from the regular file
> data area instead of returning a corruption error?

Looks real for desc_size being more than blocksize. Added a check.

------------------------------------------------------------------------
 1:  0e3e25b9860e =  1:  ecbf883c933d fsverity: report validation errors through fserror to fsnotify
 2:  9b43d2de7e80 =  2:  e4e5f5c4683e fsverity: expose ensure_fsverity_info()
 3:  6ea25205e221 <  -:  ------------ ovl: use core fsverity ensure info interface
 4:  c4aa84d61400 <  -:  ------------ fsverity: generate and store zero-block hash
 5:  dcfa45d327f7 =  3:  5670f4a05e4c fsverity: pass digest size and hash of the all-zeroes block to ->write
 6:  f6b1188a881b =  4:  b3a09eb38d51 fsverity: hoist pagecache_read from f2fs/ext4 to fsverity
 7:  ab412480398b <  -:  ------------ iomap: introduce IOMAP_F_FSVERITY and teach writeback to handle fsverity
 8:  72088ee192b0 <  -:  ------------ iomap: teach iomap to read files with fsverity
 9:  537d02c9d883 <  -:  ------------ iomap: introduce iomap_fsverity_write() for writing fsverity metadata
 -:  ------------ >  5:  091d197d8917 fsverity: improve flushing performance of fsverity_fill_zerohash
 -:  ------------ >  6:  3a46d6bd9824 fsverity: don't allow setting DAX file attribute on fsverity files
10:  e455ab8d9daa !  7:  5aae11e26d11 xfs: introduce fsverity on-disk changes
    @@ fs/xfs/libxfs/xfs_inode_buf.c: xfs_dinode_verify(
      		if (be32_to_cpu(dip->di_used_blocks) > mp->m_sb.sb_rgextents)

      ## fs/xfs/libxfs/xfs_inode_util.c ##
    +@@ fs/xfs/libxfs/xfs_inode_util.c: xfs_flags2diflags2(
    + 	uint64_t		di_flags2 =
    + 		(ip->i_diflags2 & (XFS_DIFLAG2_REFLINK |
    + 				   XFS_DIFLAG2_BIGTIME |
    +-				   XFS_DIFLAG2_NREXT64));
    ++				   XFS_DIFLAG2_NREXT64 |
    ++				   XFS_DIFLAG2_VERITY));
    +
    + 	if (xflags & FS_XFLAG_DAX)
    + 		di_flags2 |= XFS_DIFLAG2_DAX;
     @@ fs/xfs/libxfs/xfs_inode_util.c: xfs_ip2xflags(
      			flags |= FS_XFLAG_DAX;
      		if (ip->i_diflags2 & XFS_DIFLAG2_COWEXTSIZE)
    @@ fs/xfs/xfs_iops.c: xfs_diflags_to_iflags(

      	/*
      	 * S_DAX can only be set during inode initialization and is never set by
    + 	 * the VFS, so we cannot mask off S_DAX in i_flags.
    + 	 */
    +-	inode->i_flags &= ~(S_IMMUTABLE | S_APPEND | S_SYNC | S_NOATIME);
    ++	inode->i_flags &=
    ++		~(S_IMMUTABLE | S_APPEND | S_SYNC | S_NOATIME | S_VERITY);
    + 	inode->i_flags |= flags;
    + }
    +

      ## fs/xfs/xfs_mount.h ##
     @@ fs/xfs/xfs_mount.h: typedef struct xfs_mount {
11:  03334565a9df =  8:  ff6d20a38acd xfs: initialize fs-verity on file open
12:  3e7c9e0021aa =  9:  2fbbe0b1239c xfs: don't allow to enable DAX on fs-verity sealed inode
13:  f689ba9f910b <  -:  ------------ xfs: disable direct read path for fs-verity files
 -:  ------------ > 10:  33f76d31f5db xfs: don't report dio_mem_align and dio_offset_align for fsverity files
 -:  ------------ > 11:  29b5121f6aad xfs: disable direct read path for fs-verity files
14:  ddab7d10f305 ! 12:  43198dc513b6 xfs: handle fsverity I/O in write/read path
    @@ Commit message
         Introduce a new inode flag meaning that merkle tree is being build on
         the inode.

    -    Reviewed-by: Darrick J. Wong <djwong@kernel.org>
    -    Reviewed-by: Christoph Hellwig <hch@lst.de>
         Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

      ## fs/xfs/Makefile ##
    @@ fs/xfs/libxfs/xfs_bmap.c

      struct kmem_cache		*xfs_bmap_intent_cache;

    +@@ fs/xfs/libxfs/xfs_bmap.c: xfs_bmapi_convert_one_delalloc(
    + 	 * the extent.  Just return the real extent at this offset.
    + 	 */
    + 	if (!isnullstartblock(bma.got.br_startblock)) {
    ++		if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION) &&
    ++		    XFS_FSB_TO_B(mp, bma.got.br_startoff) >=
    ++			    xfs_fsverity_metadata_offset(ip))
    ++			flags |= IOMAP_F_FSVERITY;
    + 		xfs_bmbt_to_iomap(ip, iomap, &bma.got, 0, flags,
    + 				xfs_iomap_inode_sequence(ip, flags));
    + 		if (seq)
     @@ fs/xfs/libxfs/xfs_bmap.c: xfs_bmapi_convert_one_delalloc(
      	XFS_STATS_ADD(mp, xs_xstrat_bytes, XFS_FSB_TO_B(mp, bma.length));
      	XFS_STATS_INC(mp, xs_xstrat_quick);
    @@ fs/xfs/xfs_aops.c: xfs_map_blocks(
      	trace_xfs_map_blocks_found(ip, offset, count, whichfork, &imap);
      	return 0;
      allocate_blocks:
    +@@ fs/xfs/xfs_aops.c: xfs_zoned_map_blocks(
    + 	xfs_filblks_t		count_fsb;
    + 	struct xfs_bmbt_irec	imap, del;
    + 	struct xfs_iext_cursor	icur;
    ++	u16			iomap_flags = 0;
    +
    + 	if (xfs_is_shutdown(mp))
    + 		return -EIO;
    +
    + 	XFS_ERRORTAG_DELAY(mp, XFS_ERRTAG_WB_DELAY_MS);
    +
    ++	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
    ++		iomap_flags |= IOMAP_F_FSVERITY;
    ++
    + 	/*
    + 	 * All dirty data must be covered by delalloc extents.  But truncate can
    + 	 * remove delalloc extents underneath us or reduce their size.
    +@@ fs/xfs/xfs_aops.c: xfs_zoned_map_blocks(
    + 		imap.br_startblock = HOLESTARTBLOCK;
    + 		imap.br_state = XFS_EXT_NORM;
    + 		xfs_iunlock(ip, XFS_ILOCK_EXCL);
    +-		xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, 0, 0);
    ++		xfs_bmbt_to_iomap(ip, &wpc->iomap, &imap, 0, iomap_flags, 0);
    + 		return 0;
    + 	}
    + 	end_fsb = min(end_fsb, imap.br_startoff + imap.br_blockcount);
    +@@ fs/xfs/xfs_aops.c: xfs_zoned_map_blocks(
    + 	xfs_iunlock(ip, XFS_ILOCK_EXCL);
    +
    + 	wpc->iomap.type = IOMAP_MAPPED;
    +-	wpc->iomap.flags = IOMAP_F_DIRTY;
    ++	wpc->iomap.flags = iomap_flags | IOMAP_F_DIRTY;
    + 	wpc->iomap.bdev = mp->m_rtdev_targp->bt_bdev;
    + 	wpc->iomap.offset = offset;
    + 	wpc->iomap.length = XFS_FSB_TO_B(mp, count_fsb);
    +@@ fs/xfs/xfs_aops.c: static const struct iomap_writeback_ops xfs_zoned_writeback_ops = {
    + 	.writeback_submit	= xfs_zoned_writeback_submit,
    + };
    +
    ++static int
    ++xfs_iomap_writepages(
    ++	struct xfs_inode		*ip,
    ++	struct iomap_writepage_ctx	*ctx)
    ++{
    ++	/*
    ++	 * Writeback does not work for folios past EOF, let it know that
    ++	 * I/O happens for fsverity metadata and this restriction need
    ++	 * to be skipped
    ++	 */
    ++	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
    ++		ctx->iomap.flags |= IOMAP_F_FSVERITY;
    ++
    ++	return iomap_writepages(ctx);
    ++}
    ++
    + STATIC int
    + xfs_vm_writepages(
    + 	struct address_space	*mapping,
    +@@ fs/xfs/xfs_aops.c: xfs_vm_writepages(
    + 		};
    + 		int				error;
    +
    +-		error = iomap_writepages(&xc.ctx);
    ++		error = xfs_iomap_writepages(ip, &xc.ctx);
    + 		if (xc.open_zone)
    + 			xfs_open_zone_put(xc.open_zone);
    + 		return error;
     @@ fs/xfs/xfs_aops.c: xfs_vm_writepages(
      			},
      		};

    -+		/*
    -+		 * Writeback does not work for folios past EOF, let it know that
    -+		 * I/O happens for fsverity metadata and this restriction need
    -+		 * to be skipped
    -+		 */
    -+		if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
    -+			wpc.ctx.iomap.flags |= IOMAP_F_FSVERITY;
    -+
    - 		return iomap_writepages(&wpc.ctx);
    +-		return iomap_writepages(&wpc.ctx);
    ++		return xfs_iomap_writepages(ip, &wpc.ctx);
      	}
      }
    +

      ## fs/xfs/xfs_fsverity.c (new) ##
     @@
    @@ fs/xfs/xfs_fsverity.c (new)
     +#include "xfs_trans_resv.h"
     +#include "xfs_mount.h"
     +#include "xfs_fsverity.h"
    -+#include "xfs_fsverity.h"
     +#include <linux/fsverity.h>
     +#include <linux/iomap.h>
     +
    @@ fs/xfs/xfs_iomap.c

      #define XFS_ALLOC_ALIGN(mp, off) \
      	(((off) >> mp->m_allocsize_log) << mp->m_allocsize_log)
    +@@ fs/xfs/xfs_iomap.c: xfs_zoned_buffered_write_iomap_begin(
    + 	loff_t			count,
    + 	unsigned		flags,
    + 	struct iomap		*iomap,
    +-	struct iomap		*srcmap)
    ++	struct iomap		*srcmap,
    ++	u16			iomap_flags)
    + {
    + 	struct iomap_iter	*iter =
    + 		container_of(iomap, struct iomap_iter, iomap);
    +@@ fs/xfs/xfs_iomap.c: xfs_zoned_buffered_write_iomap_begin(
    + 	struct xfs_mount	*mp = ip->i_mount;
    + 	xfs_fileoff_t		offset_fsb = XFS_B_TO_FSBT(mp, offset);
    + 	xfs_fileoff_t		end_fsb = xfs_iomap_end_fsb(mp, offset, count);
    +-	u16			iomap_flags = IOMAP_F_SHARED;
    + 	unsigned int		lockmode = XFS_ILOCK_EXCL;
    + 	xfs_filblks_t		count_fsb;
    + 	xfs_extlen_t		indlen;
    +@@ fs/xfs/xfs_iomap.c: xfs_zoned_buffered_write_iomap_begin(
    + 	struct xfs_iext_cursor	icur;
    + 	int			error = 0;
    +
    ++	iomap_flags = iomap_flags | IOMAP_F_SHARED;
    ++
    + 	ASSERT(!xfs_get_extsz_hint(ip));
    + 	ASSERT(!(flags & IOMAP_UNSHARE));
    + 	ASSERT(ac);
     @@ fs/xfs/xfs_iomap.c: xfs_buffered_write_iomap_begin(
    - 		return xfs_direct_write_iomap_begin(inode, offset, count,
    - 				flags, iomap, srcmap);
    + 	if (xfs_is_shutdown(mp))
    + 		return -EIO;

     +	if (xfs_iflags_test(ip, XFS_VERITY_CONSTRUCTION))
     +		iomap_flags |= IOMAP_F_FSVERITY;
     +
    - 	error = xfs_qm_dqattach(ip);
    - 	if (error)
    - 		return error;
    + 	if (xfs_is_zoned_inode(ip))
    + 		return xfs_zoned_buffered_write_iomap_begin(inode, offset,
    +-				count, flags, iomap, srcmap);
    ++				count, flags, iomap, srcmap, iomap_flags);
    +
    + 	/* we can't use delayed allocations when using extent size hints */
    + 	if (xfs_get_extsz_hint(ip))
     @@ fs/xfs/xfs_iomap.c: xfs_read_iomap_begin(
      	bool			shared = false;
      	unsigned int		lockmode = XFS_ILOCK_SHARED;
15:  c37286a92d9c ! 13:  9c8fcebdb6c7 xfs: use read ioend for fsverity data verification
    @@ fs/xfs/xfs_aops.c: xfs_bio_submit_read(
     +	ioend = iomap_init_ioend(iter->inode, bio, ctx->read_ctx_file_offset,
     +			0);
     +	ioend->io_vi = ctx->vi;
    -+
    - 	bio->bi_end_io = xfs_end_bio;
    - 	submit_bio(bio);
    + 	iomap_bio_submit_read_endio(iter, ctx, xfs_end_bio);
      }
    +
     @@ fs/xfs/xfs_aops.c: static const struct iomap_read_ops xfs_iomap_read_ops = {

      static inline const struct iomap_read_ops *
16:  4b2a9d2f58ba ! 14:  cab97a909ad0 xfs: add fs-verity support
    @@ Commit message
         Merkle tree block. The size of the descriptor is stored at the end of
         the last descriptor block (descriptor can be multiple blocks).

    -    Reviewed-by: Christoph Hellwig <hch@lst.de>
    -    Reviewed-by: Darrick J. Wong <djwong@kernel.org>
         Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

      ## fs/xfs/xfs_bmap_util.c ##
    @@ fs/xfs/xfs_fsverity.c
      #include "xfs_shared.h"
      #include "xfs_trans_resv.h"
      #include "xfs_mount.h"
    - #include "xfs_fsverity.h"
     +#include "xfs_da_format.h"
     +#include "xfs_da_btree.h"
     +#include "xfs_inode.h"
     +#include "xfs_log_format.h"
     +#include "xfs_bmap_util.h"
    -+#include "xfs_log_format.h"
     +#include "xfs_trans.h"
     +#include "xfs_trace.h"
     +#include "xfs_quota.h"
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +	xfs_fileoff_t		last_block_offset;
     +
     +	ASSERT(inode->i_flags & S_VERITY);
    ++	xfs_ilock(ip, XFS_ILOCK_SHARED);
     +	error = xfs_bmap_last_extent(NULL, ip, XFS_DATA_FORK, &rec, &is_empty);
    ++	xfs_iunlock(ip, XFS_ILOCK_SHARED);
     +	if (error)
     +		return error;
     +
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +
     +	last_block_offset =
     +		XFS_FSB_TO_B(mp, rec.br_startoff + rec.br_blockcount);
    -+	if (last_block_offset < xfs_fsverity_metadata_offset(ip))
    ++	if (last_block_offset <= xfs_fsverity_metadata_offset(ip))
     +		return -ENODATA;
     +
     +	desc_size_pos = last_block_offset - sizeof(__be32);
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +		return -ERANGE;
     +
     +	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
    ++	if (desc_pos < xfs_fsverity_metadata_offset(ip)) {
    ++		xfs_inode_mark_sick(XFS_I(inode), XFS_SICK_INO_FSVERITY);
    ++		return -ERANGE;
    ++	}
    ++
     +	error = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
     +	if (error)
     +		return error;
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +		goto err_cancel;
     +
     +	error = xfs_trans_commit(tp);
    ++	if (error)
    ++		goto out_unlock;
    ++out_unlock:
     +	xfs_iunlock(ip, XFS_ILOCK_EXCL);
    -+
     +	return error;
     +
     +err_cancel:
    -+	xfs_iunlock(ip, XFS_ILOCK_EXCL);
     +	xfs_trans_cancel(tp);
    ++	xfs_iunlock(ip, XFS_ILOCK_EXCL);
     +	return error;
     +}
     +
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +
     +	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);
     +
    -+	if (IS_DAX(inode))
    ++	if (IS_DAX(inode) || ip->i_diflags2 & XFS_DIFLAG2_DAX)
     +		return -EINVAL;
     +
     +	if (inode->i_size > XFS_FSVERITY_LARGEST_FILE)
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +
     +	error = xfs_qm_dqattach(ip);
     +	if (error)
    -+		return error;
    ++		goto out_clear;
     +
    -+	return xfs_fsverity_delete_metadata(ip);
    ++	error = xfs_fsverity_delete_metadata(ip);
    ++	if (error)
    ++		goto out_clear;
    ++	return error;
    ++out_clear:
    ++	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
    ++	return error;
     +}
     +
     +/*
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +	 * Proactively drop any delayed allocations in COW fork, the fsverity
     +	 * files are read-only
     +	 */
    -+	if (xfs_is_cow_inode(ip))
    ++	if (xfs_is_cow_inode(ip)) {
    ++		if (!ip->i_cowfp)
    ++			xfs_ifork_init_cow(ip);
     +		xfs_bmap_punch_delalloc_range(ip, XFS_COW_FORK, 0, LLONG_MAX,
     +				NULL);
    ++	}
     +
     +	/*
     +	 * Set fsverity inode flag
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_is_file_data(
     +		if (error2)
     +			xfs_alert(ip->i_mount,
     +"ino 0x%llx failed to clean up new fsverity metadata, err %d",
    -+					ip->i_ino, error2);
    ++					I_INO(ip), error2);
     +	}
     +
     +	xfs_iflags_clear(ip, XFS_VERITY_CONSTRUCTION);
    @@ fs/xfs/xfs_fsverity.h

      ## fs/xfs/xfs_message.c ##
     @@ fs/xfs/xfs_message.c: xfs_warn_experimental(
    - 			.opstate	= XFS_OPSTATE_WARNED_ZONED,
    - 			.name		= "zoned RT device",
    + 			.opstate	= XFS_OPSTATE_WARNED_LARP,
    + 			.name		= "logged extended attributes",
      		},
     +		[XFS_EXPERIMENTAL_FSVERITY] = {
     +			.opstate	= XFS_OPSTATE_WARNED_FSVERITY,
    @@ fs/xfs/xfs_message.c: xfs_warn_experimental(
      	BUILD_BUG_ON(ARRAY_SIZE(features) != XFS_EXPERIMENTAL_MAX);

      ## fs/xfs/xfs_message.h ##
    -@@ fs/xfs/xfs_message.h: enum xfs_experimental_feat {
    +@@ fs/xfs/xfs_message.h: void xfs_buf_alert_ratelimited(struct xfs_buf *bp, const char *rlmsg,
    + enum xfs_experimental_feat {
      	XFS_EXPERIMENTAL_SHRINK,
      	XFS_EXPERIMENTAL_LARP,
    - 	XFS_EXPERIMENTAL_ZONED,
     +	XFS_EXPERIMENTAL_FSVERITY,

      	XFS_EXPERIMENTAL_MAX,
    @@ fs/xfs/xfs_message.h: enum xfs_experimental_feat {

      ## fs/xfs/xfs_mount.h ##
     @@ fs/xfs/xfs_mount.h: __XFS_HAS_FEAT(nouuid, NOUUID)
    - #define XFS_OPSTATE_WARNED_ZONED	19
    + #define XFS_OPSTATE_RESUMING_QUOTAON	18
      /* (Zoned) GC is in progress */
      #define XFS_OPSTATE_ZONEGC_RUNNING	20
     +/* Kernel has logged a warning about fsverity support */
17:  5e3a2173dbdb ! 15:  b15dd18011a3 xfs: remove unwritten extents after preallocations in fsverity metadata
    @@ Commit message
         that region and remove any unwritten ones. These would be left overs in
         the holes in the merkle tree and past fsverity descriptor.

    -    Reviewed-by: Christoph Hellwig <hch@lst.de>
    -    Reviewed-by: Darrick J. Wong <djwong@kernel.org>
         Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

      ## fs/xfs/xfs_fsverity.c ##
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_delete_metadata(
     +			goto out_cancel;
     +
     +		if (imap.br_state == XFS_EXT_UNWRITTEN) {
    -+			xfs_trans_ijoin(tp, ip, 0);
    ++			xfs_trans_ijoin(tp, ip, XFS_ILOCK_EXCL);
     +
     +			error = xfs_bunmapi(tp, ip, imap.br_startoff,
     +					imap.br_blockcount, 0, 1, &done);
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_delete_metadata(
     +				return error;
     +		} else {
     +			xfs_trans_cancel(tp);
    ++			xfs_iunlock(ip, XFS_ILOCK_EXCL);
     +		}
    -+		xfs_iunlock(ip, XFS_ILOCK_EXCL);
     +
     +		offset_fsb = imap.br_startoff + imap.br_blockcount;
     +	}
18:  60f8807a7c21 = 16:  31e0b472282d xfs: add fs-verity ioctls
19:  2d0ec55b6936 = 17:  db2bdef8f620 xfs: advertise fs-verity being available on filesystem
20:  23a6c5e73f14 ! 18:  d80a609aace6 xfs: check and repair the verity inode flag state
    @@ Commit message
         Reviewed-by: Christoph Hellwig <hch@lst.de>
         Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>

    - ## fs/xfs/scrub/attr.c ##
    -@@ fs/xfs/scrub/attr.c: xchk_xattr(
    - 	if (!xfs_inode_hasattr(sc->ip))
    - 		return -ENOENT;
    -
    -+	/*
    -+	 * If this is a verity file that won't activate, we cannot check the
    -+	 * merkle tree geometry.
    -+	 */
    -+	if (xchk_inode_verity_broken(sc->ip))
    -+		xchk_set_incomplete(sc);
    -+
    - 	/* Allocate memory for xattr checking. */
    - 	error = xchk_setup_xattr_buf(sc, 0);
    - 	if (error == -ENOMEM)
    -
      ## fs/xfs/scrub/common.c ##
     @@
      #include "scrub/health.h"
    @@ fs/xfs/scrub/inode.c: xchk_prepare_iscrub(
      		return error;
     @@ fs/xfs/scrub/inode.c: xchk_inode(
      	if (S_ISREG(VFS_I(sc->ip)->i_mode))
    - 		xchk_inode_check_reflink_iflag(sc, sc->ip->i_ino);
    + 		xchk_inode_check_reflink_iflag(sc, I_INO(sc->ip));

     +	if (xchk_inode_verity_broken(sc->ip))
     +		xchk_ino_set_corrupt(sc, sc->sm->sm_ino);
     +
      	xchk_inode_check_unlinked(sc);

    - 	xchk_inode_xref(sc, sc->ip->i_ino, &di);
    + 	xchk_inode_xref(sc, I_INO(sc->ip), &di);

      ## fs/xfs/scrub/inode_repair.c ##
     @@ fs/xfs/scrub/inode_repair.c: xrep_dinode_flags(
21:  e69595560ea2 ! 19:  17f9793e4e68 xfs: introduce health state for corrupted fsverity metadata
    @@ fs/xfs/xfs_fsverity.c: xfs_fsverity_get_descriptor(
     +	}

      	desc_pos = round_down(desc_size_pos - desc_size, blocksize);
    - 	error = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
    + 	if (desc_pos < xfs_fsverity_metadata_offset(ip)) {

      ## fs/xfs/xfs_health.c ##
     @@ fs/xfs/xfs_health.c: static const struct ioctl_sick_map ino_map[] = {
22:  dae61fa276b0 = 20:  c5a3421e9c3b xfs: enable ro-compat fs-verity flag

Andrey Albershteyn (18):
  fsverity: report validation errors through fserror to fsnotify
  fsverity: expose ensure_fsverity_info()
  fsverity: pass digest size and hash of the all-zeroes block to ->write
  fsverity: hoist pagecache_read from f2fs/ext4 to fsverity
  fsverity: improve flushing performance of fsverity_fill_zerohash
  fsverity: don't allow setting DAX file attribute on fsverity files
  xfs: introduce fsverity on-disk changes
  xfs: initialize fs-verity on file open
  xfs: don't allow to enable DAX on fs-verity sealed inode
  xfs: don't report dio_mem_align and dio_offset_align for fsverity
    files
  xfs: disable direct read path for fs-verity files
  xfs: handle fsverity I/O in write/read path
  xfs: use read ioend for fsverity data verification
  xfs: add fs-verity support
  xfs: remove unwritten extents after preallocations in fsverity
    metadata
  xfs: add fs-verity ioctls
  xfs: introduce health state for corrupted fsverity metadata
  xfs: enable ro-compat fs-verity flag

Darrick J. Wong (2):
  xfs: advertise fs-verity being available on filesystem
  xfs: check and repair the verity inode flag state

 fs/btrfs/verity.c              |   6 +-
 fs/ext4/verity.c               |  36 +--
 fs/f2fs/verity.c               |  34 +--
 fs/file_attr.c                 |   5 +
 fs/verity/enable.c             |   4 +-
 fs/verity/open.c               |  22 +-
 fs/verity/pagecache.c          |  57 +++-
 fs/verity/verify.c             |   4 +
 fs/xfs/Makefile                |   1 +
 fs/xfs/libxfs/xfs_bmap.c       |  11 +
 fs/xfs/libxfs/xfs_format.h     |  35 ++-
 fs/xfs/libxfs/xfs_fs.h         |   2 +
 fs/xfs/libxfs/xfs_health.h     |   4 +-
 fs/xfs/libxfs/xfs_inode_buf.c  |   8 +
 fs/xfs/libxfs/xfs_inode_util.c |   5 +-
 fs/xfs/libxfs/xfs_sb.c         |   4 +
 fs/xfs/scrub/common.c          |  53 ++++
 fs/xfs/scrub/common.h          |   2 +
 fs/xfs/scrub/inode.c           |   7 +
 fs/xfs/scrub/inode_repair.c    |  36 +++
 fs/xfs/xfs_aops.c              |  81 +++++-
 fs/xfs/xfs_bmap_util.c         |   8 +
 fs/xfs/xfs_file.c              |  67 +++--
 fs/xfs/xfs_fsverity.c          | 473 +++++++++++++++++++++++++++++++++
 fs/xfs/xfs_fsverity.h          |  28 ++
 fs/xfs/xfs_health.c            |   1 +
 fs/xfs/xfs_inode.h             |   6 +
 fs/xfs/xfs_ioctl.c             |  14 +
 fs/xfs/xfs_iomap.c             |  23 +-
 fs/xfs/xfs_iops.c              |  12 +-
 fs/xfs/xfs_message.c           |   4 +
 fs/xfs/xfs_message.h           |   1 +
 fs/xfs/xfs_mount.h             |   4 +
 fs/xfs/xfs_super.c             |   7 +
 include/linux/fsverity.h       |  10 +-
 35 files changed, 962 insertions(+), 113 deletions(-)
 create mode 100644 fs/xfs/xfs_fsverity.c
 create mode 100644 fs/xfs/xfs_fsverity.h

-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
