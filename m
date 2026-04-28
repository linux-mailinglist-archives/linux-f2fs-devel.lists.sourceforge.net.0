Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hst4JQZx8GldTgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2026 10:34:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D60984802D2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Apr 2026 10:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gxBwDOuVNezPEV7qHOl6YHbb0jQTnxpq7Dt4xAmd6y8=; b=Umdg9GZn7WFP+fzEtJnz/hm2Kq
	pNq6Nf755VYZtF6MaSjC2IT7HuphfG2bWgbKyR4Pb3t7t/4H8awpvU8OkC4KlYQv8Lfcaravskw5Y
	SLqqPVJEmoDQgDhy7OwOBIddJXg13v2knYBKX7CgUVYrUIldmB/gNUTWMIA933A3ikS0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHdtL-0000yx-3S;
	Tue, 28 Apr 2026 08:34:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wHdtK-0000yr-D2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Apr 2026 08:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=93EhE/VM5NFCGYhlHoO/wn5In82b3gvHfW05Xjuj1vE=; b=FHPdfN98gqG0N9zaocZU++Zg0b
 tKZkDc4a05AunkCi4uBWkpyWsWWOLwtIuBDxXwIujxRss2w1+2CKXSH9kPPvno7D4qxQXZCoygaTN
 EOOWcdowJoC03ky/7OxyGa2UfvRhZzg8EpF9FplAPrty/p3eyInSVVGhKeYpMvtr9hZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=93EhE/VM5NFCGYhlHoO/wn5In82b3gvHfW05Xjuj1vE=; b=d
 vEaNxzYVqv8t01gaBuBK7TnMxgx82lHAdrDufT6ZaZyNY6g7nkDXQx3gRBEiAwShYrqRaobeDtH7M
 ZvVSp4lSosItfD6o2vVP2rl+zCz5FLuBFdiqDojEGuZNQptsSsUQso7xrlFkBJ0OJmYMBlxl0lUFg
 DKFlIoagru7tMR6I=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHdtI-0004dg-VE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Apr 2026 08:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2BAA460141;
 Tue, 28 Apr 2026 08:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C662C2BCAF;
 Tue, 28 Apr 2026 08:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777365234;
 bh=I1UFcAoYPGscbLBDLHC78A2Zf+xSyTiiDK0UcAySV9Q=;
 h=From:To:Cc:Subject:Date:From;
 b=DNYcjbPzHmVQdZDUtktJ+m/39yVknK7pRSSqKQUEk97ss4zpD1X2RGr3OE+YQ+2/x
 YWJA9Y5UX6Da8PXXPMAid+G8aiRiObM+a72ymh/zLZozUL3qPX++Ity5wYkYd3QrBc
 lhTIH6t2wlTgf8ZbC0aPmTAE8BKQasicrfft19WMtka3QFSnXoZh7u7mJVwOqmCLhT
 87VFw6sWodHLru2yx72DPc0uAB+kV6DB+cEJOToWg/STM2WlvIZ6xnJEn11Q2ExUa0
 1DiwehTEb5vzEVPbqg/nJY+kcK5zhODi9KnxQanctVaQd42uGC0HMwurTSTQ24x+hR
 5kYMQMuzNL+jA==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Tue, 28 Apr 2026 10:33:06 +0200
Message-ID: <20260428083332.768693-1-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, This patch series adds fs-verity support for XFS.
 This version stores merkle tree beyond end of the file, the same way as ext4
 does it. The difference is that verity descriptor is stored at the next a
 [...] Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: sashiko.dev]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wHdtI-0004dg-VE
Subject: [f2fs-dev] [PATCH v9 00/22] fs-verity support for XFS with post EOF
 merkle tree
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
X-Rspamd-Queue-Id: D60984802D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,sashiko.dev:url,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,fromorbit.com:email]

Hi all,

This patch series adds fs-verity support for XFS. This version stores
merkle tree beyond end of the file, the same way as ext4 does it. The
difference is that verity descriptor is stored at the next aligned 64k
block after the merkle tree last block. This is done due to sparse
merkle tree which doesn't store hashes of zero data blocks.

The patchset starts with a few fs-verity preparation patches. Then, a
few patches to allow iomap to work in post EOF region. The XFS fs-verity
implementation follows.

The tree is read by iomap into page cache at offset of next largest
folio past end of file. The same offset is used for on-disk.

This patchsets also synthesizes merkle tree block full of hashes of
zeroed data blocks. This merkle blocks are not stored on disk, they are
holes in the tree.

Testing. The -g verity is passing for 1k, 8k and 4k with/without quota
on 4k and 64k page size systems. Tested -g quick for enabled/disabled
fsverity. Also, overlay/080 overlay/089 with XFS as base.

This series based on v7.0 with Christoph's read ioends patchset [1].

Darrick, Christoph, I left your Reviewed-by tags on the commits which
have fixes for issues found by sashiko.dev. I've attached diff of
the v8 vs v9 below. Let me know if this a problem or you have more
comments for these changes.

kernel:
https://git.kernel.org/pub/scm/linux/kernel/git/aalbersh/xfs-linux.git/log/?h=b4/fsverity

xfsprogs:
https://github.com/alberand/xfsprogs/tree/b4/fsverity

xfstests:
https://github.com/alberand/xfstests/tree/b4/fsverity

Cc: fsverity@lists.linux.dev
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-xfs@vger.kernel.org
Cc: linux-unionfs@vger.kernel.org

Cc: david@fromorbit.com
Cc: djwong@kernel.org
Cc: ebiggers@kernel.org
Cc: hch@lst.de

1: https://lore.kernel.org/linux-xfs/20260223132021.292832-1-hch@lst.de/

---
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

--- >8 ---
ss (cb5e0282a061) fsverity: generate and store zero-block hash
diff --git a/left/include/linux/fsverity.h b/right/include/linux/fsverity.h
index e4503312d114..3c3250f6f272 100644
--- a/left/include/linux/fsverity.h
+++ b/right/include/linux/fsverity.h
@@ -201,8 +201,8 @@ bool fsverity_verify_blocks(struct fsverity_info *vi, struct folio *folio,
 			    size_t len, size_t offset);
 void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio);
 void fsverity_enqueue_verify_work(struct work_struct *work);
-void fsverity_fill_zerohash(struct folio *folio, size_t poff, size_t plen,
-			      struct fsverity_info *vi);
+void fsverity_fill_zerohash(struct folio *folio, size_t offset, size_t len,
+			    struct fsverity_info *vi);

 #else /* !CONFIG_FS_VERITY */

@@ -283,8 +283,8 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 	WARN_ON_ONCE(1);
 }

-static inline void fsverity_fill_zerohash(struct folio *folio, size_t poff,
-		size_t plen, struct fsverity_info *vi)
+static inline void fsverity_fill_zerohash(struct folio *folio, size_t offset,
+		size_t len, struct fsverity_info *vi)
 {
 	WARN_ON_ONCE(1);
 }

wr (aebd19f490d9) xfs: add fs-verity support
diff --git a/left/fs/xfs/xfs_fsverity.c b/right/fs/xfs/xfs_fsverity.c
index 68d9736d19d9..a505616636f9 100644
--- a/left/fs/xfs/xfs_fsverity.c
+++ b/right/fs/xfs/xfs_fsverity.c
@@ -111,7 +111,7 @@ xfs_fsverity_write_descriptor(
 	int			error;
 	struct inode		*inode = file_inode(file);
 	struct xfs_inode	*ip = XFS_I(inode);
-	unsigned int		blksize = ip->i_mount->m_attr_geo->blksize;
+	unsigned int		blksize = ip->i_mount->m_bsize;
 	u64			tree_last_block =
 			xfs_fsverity_metadata_offset(ip) + merkle_tree_size;
 	u64			desc_pos =
@@ -161,8 +161,6 @@ xfs_fsverity_delete_metadata(
 		goto err_cancel;

 	error = xfs_trans_commit(tp);
-	if (error)
-		goto err_cancel;
 	xfs_iunlock(ip, XFS_ILOCK_EXCL);

 	return error;
@@ -231,8 +229,10 @@ xfs_fsverity_end_enable(
 	xfs_assert_ilocked(ip, XFS_IOLOCK_EXCL);

 	/* fs-verity failed, just cleanup */
-	if (desc == NULL)
+	if (desc == NULL) {
+		error = xfs_fsverity_delete_metadata(ip);
 		goto out;
+	}

 	error = xfs_fsverity_write_descriptor(file, desc, desc_size,
 			merkle_tree_size);

zv (191b86b3216b) xfs: remove unwritten extents after preallocations in fsverity metadata
diff --git a/left/fs/xfs/xfs_fsverity.c b/right/fs/xfs/xfs_fsverity.c
index 0def83aba712..1a5948d372b6 100644
--- a/left/fs/xfs/xfs_fsverity.c
+++ b/right/fs/xfs/xfs_fsverity.c
@@ -176,8 +176,8 @@ err_cancel:
 static int
 xfs_fsverity_cancel_unwritten(
 	struct xfs_inode	*ip,
-	xfs_fileoff_t		start,
-	xfs_fileoff_t		end)
+	loff_t			start,
+	loff_t			end)
 {
 	struct xfs_mount	*mp = ip->i_mount;
 	struct xfs_trans	*tp;
@@ -215,6 +215,8 @@ xfs_fsverity_cancel_unwritten(
 				goto out_cancel;

 			error = xfs_trans_commit(tp);
+			if (error)
+				return error;
 		} else {
 			xfs_trans_cancel(tp);
 		}

--- >8 ---

Andrey Albershteyn (20):
  fsverity: report validation errors through fserror to fsnotify
  fsverity: expose ensure_fsverity_info()
  ovl: use core fsverity ensure info interface
  fsverity: generate and store zero-block hash
  fsverity: pass digest size and hash of the all-zeroes block to ->write
  fsverity: hoist pagecache_read from f2fs/ext4 to fsverity
  iomap: introduce IOMAP_F_FSVERITY and teach writeback to handle
    fsverity
  iomap: teach iomap to read files with fsverity
  iomap: introduce iomap_fsverity_write() for writing fsverity metadata
  xfs: introduce fsverity on-disk changes
  xfs: initialize fs-verity on file open
  xfs: don't allow to enable DAX on fs-verity sealed inode
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
 fs/iomap/buffered-io.c         | 109 +++++++-
 fs/iomap/trace.h               |   3 +-
 fs/overlayfs/util.c            |  14 +-
 fs/verity/enable.c             |   4 +-
 fs/verity/fsverity_private.h   |   3 +
 fs/verity/measure.c            |   4 +-
 fs/verity/open.c               |  25 +-
 fs/verity/pagecache.c          |  55 ++++
 fs/verity/verify.c             |   4 +
 fs/xfs/Makefile                |   1 +
 fs/xfs/libxfs/xfs_bmap.c       |   7 +
 fs/xfs/libxfs/xfs_format.h     |  35 ++-
 fs/xfs/libxfs/xfs_fs.h         |   2 +
 fs/xfs/libxfs/xfs_health.h     |   4 +-
 fs/xfs/libxfs/xfs_inode_buf.c  |   8 +
 fs/xfs/libxfs/xfs_inode_util.c |   2 +
 fs/xfs/libxfs/xfs_sb.c         |   4 +
 fs/xfs/scrub/attr.c            |   7 +
 fs/xfs/scrub/common.c          |  53 ++++
 fs/xfs/scrub/common.h          |   2 +
 fs/xfs/scrub/inode.c           |   7 +
 fs/xfs/scrub/inode_repair.c    |  36 +++
 fs/xfs/xfs_aops.c              |  62 ++++-
 fs/xfs/xfs_bmap_util.c         |   8 +
 fs/xfs/xfs_file.c              |  19 +-
 fs/xfs/xfs_fsverity.c          | 457 +++++++++++++++++++++++++++++++++
 fs/xfs/xfs_fsverity.h          |  28 ++
 fs/xfs/xfs_health.c            |   1 +
 fs/xfs/xfs_inode.h             |   6 +
 fs/xfs/xfs_ioctl.c             |  14 +
 fs/xfs/xfs_iomap.c             |  15 +-
 fs/xfs/xfs_iops.c              |   4 +
 fs/xfs/xfs_message.c           |   4 +
 fs/xfs/xfs_message.h           |   1 +
 fs/xfs/xfs_mount.h             |   4 +
 fs/xfs/xfs_super.c             |   7 +
 include/linux/fsverity.h       |  18 +-
 include/linux/iomap.h          |  13 +
 41 files changed, 1019 insertions(+), 107 deletions(-)
 create mode 100644 fs/xfs/xfs_fsverity.c
 create mode 100644 fs/xfs/xfs_fsverity.h

-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
