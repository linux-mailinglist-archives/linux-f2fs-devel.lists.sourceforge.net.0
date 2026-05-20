Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHF/ADWrDWqP1QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:38:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A99558DD8D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F9UZatAt8ANRR5gIjBOAW8/pJzXOWE8zxw1l6bvMZSw=; b=HAzRQJVwNRqLtSAPVvm+imk5YR
	fKXjgRVToLQuYhiwK7CFI5vr5RyxP9zTH3XHwpJvsLbHmhxKemoXnAfGYLQWNnbBVa+DNFcMMJ9M2
	sEsqHiUSXgewR650EC59yGoYWNEpNzJCXXlNC34xTO94MV2ZkNjSZ63WuORDpNOyT0gI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPgBb-0001Nw-4x;
	Wed, 20 May 2026 12:38:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wPgB9-0001My-JC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3GEIHKF35JluvQOpy9exSQmpcaZLR5m4pwZg7r97tXw=; b=ZRY0QhyKJnIzG5rm+f1NxDKTFw
 E8USpSuuLHZn1K9Qb2W1CWrAmPFW1/RsnsiKpSwN/F0abURxIE4CSveKmzuHc73pN3+4D4fYnqb8l
 +sO+h8AvraN/zM10e25t6Gh4XeWHA52wNImg/eDoJXObdhZpuhi0NFmOsPaXWSFQwVGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3GEIHKF35JluvQOpy9exSQmpcaZLR5m4pwZg7r97tXw=; b=i
 nodUMwldplbbr+8/T1YLFP+8Ffhf3i+fEQomi+fpJ/qQrmiPlim9jrIuGMy8chG5ca84uX36tn8Oq
 C+GDyUGk2OOKrKVGwHl+Yl6lIADPUPPq8aN2zraQVVeFa6MQEYQDQu8tncylwotQz0r6wovbjuYUI
 udMusfm0ph13BPwk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPgB8-0006Xt-FQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:37:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E733406FC;
 Wed, 20 May 2026 12:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A7D1F00893;
 Wed, 20 May 2026 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779280648;
 bh=3GEIHKF35JluvQOpy9exSQmpcaZLR5m4pwZg7r97tXw=;
 h=From:To:Cc:Subject:Date;
 b=IAxExD7+7FxSjfV/43Ze9wsfKzGC2J00jnfaPFNhvksvf60HxSPEvBVZy7v4z8F4D
 hyjZ/MxSj1r3/NEL0C9ZIQHyZqTheRKcDeeFcyrMQNq6+07Rwc+c64j0rFRkQHPXn7
 MI1ECaQyjx942yP2MJyN2qiKMtQvhplsyzkbbTAK69DLyId1Fej2zj7aE6TcHofPv1
 JdMulII63ee6if39G4Od/cSdmB/BxJ7xIHmL7yN+k2fGV/Al85Y4atLmHofN073zt1
 BRfBgCWpmdyRiFAqPxpbOJYLb64EKe+7zgu+s7XpSiXnrXNqg1NwXq7YvNZF8ZLxkY
 4I7D+hCwRb5Aw==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Wed, 20 May 2026 14:36:58 +0200
Message-ID: <20260520123722.405752-1-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, This patch series adds fs-verity support for XFS.
 This version stores merkle tree beyond end of the file, the same way as ext4
 does it. The difference is that verity descriptor is stored at the next a
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wPgB8-0006Xt-FQ
Subject: [f2fs-dev] [PATCH v10 00/22] fs-verity support for XFS with post
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
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[fromorbit.com:email,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,linux.dev:email]
X-Rspamd-Queue-Id: 5A99558DD8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
fsverity. Also, overlay/080 overlay/089 with XFS as base. Compile test
for FSVERITY=no/yes.

This series based on v7.1-rc4.

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

 1:  aabd8b112385 <  -:  ------------ fs-verity support for XFS with post EOF merkle tree
 -:  ------------ >  1:  ec15fda2f683 fs-verity support for XFS with post EOF merkle tree
 2:  f3a3cc5b6ab2 =  2:  97d22944e17f fsverity: report validation errors through fserror to fsnotify
 3:  c8155669bdff =  3:  f717e55c313c fsverity: expose ensure_fsverity_info()
 4:  83262640936a !  4:  38381b5ec63e ovl: use core fsverity ensure info interface
    @@ fs/overlayfs/util.c: char *ovl_get_redirect_xattr(struct ovl_fs *ofs, const stru
        struct inode *inode = d_inode(datapath->dentry);
     -  struct file *filp;

    --  if (IS_VERITY(inode) && fsverity_get_info(inode) == NULL) {
    +-  if (!fsverity_active(inode) && IS_VERITY(inode)) {
     -          /*
     -           * If this inode was not yet opened, the verity info hasn't been
     -           * loaded yet, so we need to do that here to force it into memory.
 5:  6d63f3ee7604 =  5:  b4b86f757eaa fsverity: generate and store zero-block hash
 6:  800753879b5c =  6:  f9d2eaf0fdcd fsverity: pass digest size and hash of the all-zeroes block to ->write
 7:  c4e06f9d9c08 =  7:  87d8f4495aa5 fsverity: hoist pagecache_read from f2fs/ext4 to fsverity
 8:  34be1a25ffd2 =  8:  2da572c7a3bf iomap: introduce IOMAP_F_FSVERITY and teach writeback to handle fsverity
 9:  728df1f13e31 !  9:  3669ecfb610e iomap: teach iomap to read files with fsverity
    @@ fs/iomap/buffered-io.c: void iomap_readahead(const struct iomap_ops *ops,
                iter.status = iomap_readahead_iter(&iter, ctx,
                                        &cur_bytes_submitted);

    - ## fs/iomap/ioend.c ##
    -@@ fs/iomap/ioend.c: struct iomap_ioend *iomap_init_ioend(struct inode *inode,
    -   ioend->io_offset = file_offset;
    -   ioend->io_size = bio->bi_iter.bi_size;
    -   ioend->io_sector = bio->bi_iter.bi_sector;
    -+  ioend->io_vi = NULL;
    -   ioend->io_private = NULL;
    -   return ioend;
    - }
    -
      ## include/linux/iomap.h ##
     @@ include/linux/iomap.h: struct iomap_ioend {
        loff_t                  io_offset;      /* offset in the file */
10:  9eb9dd92b762 = 10:  a8989fbd29f1 iomap: introduce iomap_fsverity_write() for writing fsverity metadata
11:  27602df28674 = 11:  04b23426b5cf xfs: introduce fsverity on-disk changes
12:  544c81d26e7c = 12:  ba69a8817d13 xfs: initialize fs-verity on file open
13:  6158f03b2ad4 = 13:  e2b59e6cd4da xfs: don't allow to enable DAX on fs-verity sealed inode
14:  03b1f44c53b2 = 14:  9e2628f17346 xfs: disable direct read path for fs-verity files
15:  96c9f90ade98 = 15:  3dea5f7e5481 xfs: handle fsverity I/O in write/read path
16:  e864ce49e5b3 = 16:  ff837a33e8f5 xfs: use read ioend for fsverity data verification
17:  b06bb3eefa38 = 17:  5c79a1e5f6ff xfs: add fs-verity support
18:  567d5190bfd9 = 18:  af3c36498d1c xfs: remove unwritten extents after preallocations in fsverity metadata
19:  b952307f139d = 19:  744cf7ec0842 xfs: add fs-verity ioctls
20:  3f5382888801 = 20:  d47aac1643a7 xfs: advertise fs-verity being available on filesystem
21:  b87668403694 = 21:  48e83ac7e6c2 xfs: check and repair the verity inode flag state
22:  eec854161680 = 22:  2a9f58d29909 xfs: introduce health state for corrupted fsverity metadata
23:  9ddc2cf10f52 = 23:  b5bf49f2e750 xfs: enable ro-compat fs-verity flag

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
 fs/iomap/ioend.c               |   1 +
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
 42 files changed, 1020 insertions(+), 107 deletions(-)
 create mode 100644 fs/xfs/xfs_fsverity.c
 create mode 100644 fs/xfs/xfs_fsverity.h

-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
