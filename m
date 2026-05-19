Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLYtGIQ/DGqqawUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2026 12:46:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C757CBB4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2026 12:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:In-Reply-To:To:From:Mime-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhERpsZ2OxGeunANBDQA7A9eWNPea90pswawS/LHMTs=; b=SlmihpIN8S+/QOG80CU/+ubiRp
	HuZRUoSQa7O2WIs+GHkaBMZwUfXTri/IwdHwa4s3MoX+Zgk6pDwxAwKjaUuI7arbgYQeM8kWogvHK
	T5EOdMRPSKBqtmRHxmXf8E/FQ00qWAb/dM93vO1FU4nwjRIusiEKddoQZ5BzN7l6UxDg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPHxt-0001Nz-9I;
	Tue, 19 May 2026 10:46:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1wPHxq-0001Nt-TV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 May 2026 10:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PIr/e347w4SjeF6I+7cWYNkN9Yzj5qtutZFEldD9aIE=; b=VrHl206p4Cq88VcrnJ4n8co8eX
 7WQj8qMi9a+UAeWPARmUmEzA/O4lfGyn9i/1yaQaT7AMVYuDDu7y5lay/UZ8I95ecLj6hbsetIMcT
 XvHB8i3At2J7PGLFIeV5JTfR3rF3z4QbMo4HSU4p/fRFqPsn5CWUbHy1t+lUBZcgGx+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PIr/e347w4SjeF6I+7cWYNkN9Yzj5qtutZFEldD9aIE=; b=AGtCwvAlRzoxV0VFtIUnGnU66O
 wj7BMyQyD/1K4NIJhEMD1tqZBpMIyv/bvgM95viGrKApgS1+Oh9D3bGvz4DTVIGuanhwAS00cA8nV
 YF3K4gXMEwHpIAqWnvI04JVufxWzecc1Mx2xnuZaPEMjDs/edvWmgauwLSLq47TGlHqY=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPHxo-0004hG-HN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 May 2026 10:46:18 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20260519102131epoutp0126682c1263320eac40d531f0ffd3e765~w8FLm5W871317613176epoutp01J
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 May 2026 10:21:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20260519102131epoutp0126682c1263320eac40d531f0ffd3e765~w8FLm5W871317613176epoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1779186091;
 bh=PIr/e347w4SjeF6I+7cWYNkN9Yzj5qtutZFEldD9aIE=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=ISSMuTWYRq9OzPCdpBCZA/u6NxYS/2h0rCb5t7DwDopHIMTvnVqtcrALyDfl14mQx
 XpkJyD8/yUZwzgDznqf1/CvZYbtzIvWqhh14k1fNfUq1PRRnTcPDxvuBikBErRJtnj
 l6PIBUsy00MMDRBSCQTZF0+YvU0mrWnk40r+M2wA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20260519102131epcas2p2b342bb7d22c89c1a2a908593bd76eea7~w8FLX1dcs0637306373epcas2p2A;
 Tue, 19 May 2026 10:21:31 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.211]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4gKW170Nd8z6B9m6; Tue, 19 May
 2026 10:21:31 +0000 (GMT)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Daejun Park <daejun7.park@samsung.com>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>, "chao@kernel.org" <chao@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260519102050epcms2p1d97986f63e6ed985a47de22cf778e7b9@epcms2p1>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260519102130epcms2p72db84d1240508208010db7304ea52814@epcms2p7>
Date: Tue, 19 May 2026 19:21:30 +0900
X-CMS-MailID: 20260519102130epcms2p72db84d1240508208010db7304ea52814
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260519101956epcms2p47a6225e24691bad1a88ca0d9e527d9dc
References: <20260519102050epcms2p1d97986f63e6ed985a47de22cf778e7b9@epcms2p1>
 <20260519101956epcms2p47a6225e24691bad1a88ca0d9e527d9dc@epcms2p4>
 <CGME20260519101956epcms2p47a6225e24691bad1a88ca0d9e527d9dc@epcms2p7>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The legacy FG_GC path migrates a victim section's valid
 blocks
 in source segment-offset order: blocks of several inodes that were interleaved
 in each source segment are migrated to the destination cur [...] 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wPHxo-0004hG-HN
Subject: [f2fs-dev] [PATCH 2/2] f2fs: pack same-inode blocks by inode during
 FG_GC
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
Reply-To: daejun7.park@samsung.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MV_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daejun7.park@samsung.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[daejun7.park@samsung.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:replyto,samsung.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 642C757CBB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The legacy FG_GC path migrates a victim section's valid blocks in
source segment-offset order: blocks of several inodes that were
interleaved in each source segment are migrated to the destination
curseg in the same interleaved order, carrying source-side
fragmentation forward into the post-GC layout regardless of section
size.

Pack the migration order by inode for every victim section:

  * gc_data_segment()'s phase 3 records each valid block on a
    per-inode gc_blocks list hanging off the inode_entry that
    add_gc_inode() already creates in gc_list.  Each gc_block
    carries the source segno, nofs, ofs_in_node and per-segment off
    so the deferred migration can rebuild start_bidx and pass the
    correct segno to check_valid_map() inside the existing
    do_migrate_one_data_block() helper.

  * Phase 4 of gc_data_segment() is gated by nr_phases: in packing
    mode nr_phases caps the loop at 4 (phases 0..3), so the summary
    block is not re-scanned just to hit a per-slot 'continue'.  The
    phase 4 migration body is reached only via the new 'goto
    do_migrate' fallback path described below, in which case the
    inode_entry just returned by add_gc_inode() is reused instead of
    repeating find_gc_inode().

  * do_garbage_collect() invokes pack_gc_section() once, after every
    source segment of the victim section has been parsed.  Walking
    gc_list->ilist in inode order emits all of one inode's blocks
    contiguously to the destination curseg.  On large sections this
    lets an inode's blocks span the full SEGS_PER_SEC *
    usable_blks_in_seg destination range.

  * i_gc_rwsem is taken and released per block inside the packing
    pass (via do_migrate_one_data_block), matching the legacy
    phase 4 lock-holding window so concurrent user IO sees no
    additional latency.

Activation conditions:
  * sbi->gc_inode_local_packing == true (sysfs writable, accepts
    only 0 or 1; default derived from __is_large_section(sbi) since
    the gain on a single-segment section is marginal and adds memory
    pressure with little return)
  * gc_type == FG_GC; BG_GC's move_data_page() path defers
    destination allocation to the writeback flusher, so any
    reordering applied during GC is lost.

Race against the sysfs knob: gc_inode_local_packing is unsynchronised.
Re-reading it from phase 3 (enqueue), phase 4 (skip) and the pack
pass independently would let a concurrent toggle queue blocks via
gc_blocks and then bypass pack_gc_section().  do_garbage_collect()
snapshots the value into a local 'pack_by_inode' bool and threads it
through gc_data_segment() and the packing call so all three sites
remain consistent for the entire section.

Per-block records are allocated from a dedicated f2fs_gc_block slab
(SLAB_RECLAIM_ACCOUNT via f2fs_kmem_cache_create) rather than
kmalloc(GFP_NOFS); on a fully valid 64 MiB section (SEGS_PER_SEC=32)
one section can queue up to SEGS_PER_SEC * BLKS_PER_SEG records
(~512 KiB at 32 B per gc_block), so a per-cache slabinfo line and
FAULT_SLAB_ALLOC coverage of the fallback path are useful for
diagnostics.

Allocation failure falls through to 'goto do_migrate', the same
phase 4 body the !pack_by_inode path uses, so the block is migrated
immediately rather than dropped.  This costs the packing benefit
for the one block but preserves FG_GC progress under memory
pressure, which matters more when FG_GC is called precisely
because the system is short on free sections.

Measurements (QEMU virtio guest, 4-cycle fragmentation, gc_urgent
40s, filefrag total extents before/after GC; structural counters
only since QEMU virtio BW/lat is unreliable):

  Large section (mkfs.f2fs -s 32 = 64 MiB section,
                 64 files x 4 MiB):
    legacy   65536 -> 65536    0 %  reduction
    packed   65536 -> 49170   24 %  reduction (-16366 extents)

  Default section (mkfs.f2fs -s 1 = 2 MiB section,
                   128 files x 256 KiB):
    legacy    8192 ->  8192    0 %  reduction
    packed    8192 ->  7690    6 %  reduction
    GC work (move_blks, cp_blks, gc_calls) identical between modes;
    the packing only reorders dest curseg writes.

  Natural FG_GC under tight cold migration
  (mkfs.f2fs -s 32, 2 GiB disk 90 % fill,
   6 hot x 200 MiB + 6 cold x 100 MiB interleaved fill,
   background_gc=sync, 300 s hot rewrite):
    legacy   cold extents 350 -> 357 (delta +7,  no improvement)
    packed   cold extents 350 -> 132 (delta -218, -63 %  reduction)
    per user iter:
      move_blks         legacy 42344  packed 34822  (-18 %)
      cp_blocks         legacy 23.90  packed 22.95  (-4  %)
      skipped_gc_rwsem  legacy 108    packed   44   (-59 %)
    hot rewrite iters in fixed 300 s window:  +45 %

Sanity verified in QEMU guest (mkfs.f2fs -s 8, 16 x 4 MiB files,
gc_urgent + remount): data sha256 matches before and after GC; no
WARN/BUG in dmesg; gc_inode_local_packing knob exposed under
/sys/fs/f2fs/<disk>/.  An additional stress run on mkfs.f2fs -s 32
with FAULT_SLAB_ALLOC at inject_rate=4 triggered 7689 slab alloc
failures during FG_GC, exercising the 'goto do_migrate' fallback;
sha256 was preserved and dmesg stayed clean.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  10 +++
 fs/f2fs/f2fs.h                          |   7 +-
 fs/f2fs/gc.c                            | 109 ++++++++++++++++++++++--
 fs/f2fs/super.c                         |   1 +
 fs/f2fs/sysfs.c                         |   7 ++
 5 files changed, 123 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 1b58c029a..1085af8f6 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1002,3 +1002,13 @@ Description:	It can be used to tune priority of f2fs critical task, e.g. f2fs_ck
 		threads, limitation as below:
 		- it requires user has CAP_SYS_NICE capability.
 		- the range is [100, 139], by default the value is 120.
+
+What:		/sys/fs/f2fs/<disk>/gc_inode_local_packing
+Date:		May 2026
+Contact:	Daejun Park <daejun7.park@samsung.com>
+Description:	When set to 1, foreground GC packs valid blocks of the same
+		inode contiguously into the destination curseg, in addition to
+		(rather than within) source segment-offset order.  Effective
+		only under FG_GC; BG_GC's writeback-deferred destination
+		allocation is unaffected.  Default is 1 on large sections
+		(SEGS_PER_SEC > 1), 0 otherwise.  Set to 0 to disable.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f0a54883b..8cd0ec5b5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -405,8 +405,9 @@ struct ino_entry {
 
 /* for the list of inodes to be GCed */
 struct inode_entry {
-	struct list_head list;	/* list head */
-	struct inode *inode;	/* vfs inode pointer */
+	struct list_head list;		/* list head */
+	struct inode *inode;		/* vfs inode pointer */
+	struct list_head gc_blocks;	/* per-inode block list for GC packing */
 };
 
 struct fsync_node_entry {
@@ -1908,6 +1909,8 @@ struct f2fs_sb_info {
 	unsigned int migration_granularity;
 	/* migration window granularity of garbage collection, unit: segment */
 	unsigned int migration_window_granularity;
+	/* pack same-inode blocks together during FG_GC migration */
+	bool gc_inode_local_packing;
 
 	/*
 	 * for stat information.
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 48412f9a5..1d598b188 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -24,6 +24,16 @@
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *victim_entry_slab;
+static struct kmem_cache *gc_block_slab;
+
+/* Per-block migration record for inode-local packing under FG_GC. */
+struct gc_block {
+	struct list_head list;
+	unsigned int segno;		/* source segment for check_valid_map() */
+	unsigned int nofs;
+	unsigned int ofs_in_node;
+	int off;
+};
 
 static unsigned int count_bits(const unsigned long *addr,
 				unsigned int offset, unsigned int len);
@@ -1004,6 +1014,7 @@ static struct inode_entry *add_gc_inode(struct gc_inode_list *gc_list,
 	new_ie = f2fs_kmem_cache_alloc(f2fs_inode_entry_slab,
 					GFP_NOFS, true, NULL);
 	new_ie->inode = inode;
+	INIT_LIST_HEAD(&new_ie->gc_blocks);
 
 	f2fs_radix_tree_insert(&gc_list->iroot, inode->i_ino, new_ie);
 	list_add_tail(&new_ie->list, &gc_list->ilist);
@@ -1013,8 +1024,13 @@ static struct inode_entry *add_gc_inode(struct gc_inode_list *gc_list,
 static void put_gc_inode(struct gc_inode_list *gc_list)
 {
 	struct inode_entry *ie, *next_ie;
+	struct gc_block *e, *tmp_e;
 
 	list_for_each_entry_safe(ie, next_ie, &gc_list->ilist, list) {
+		list_for_each_entry_safe(e, tmp_e, &ie->gc_blocks, list) {
+			list_del(&e->list);
+			kmem_cache_free(gc_block_slab, e);
+		}
 		radix_tree_delete(&gc_list->iroot, ie->inode->i_ino);
 		iput(ie->inode);
 		list_del(&ie->list);
@@ -1612,7 +1628,7 @@ static int do_migrate_one_data_block(struct f2fs_sb_info *sbi,
  */
 static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		struct gc_inode_list *gc_list, unsigned int segno, int gc_type,
-		bool force_migrate, struct blk_plug *plug)
+		bool force_migrate, bool pack_by_inode, struct blk_plug *plug)
 {
 	struct super_block *sb = sbi->sb;
 	struct f2fs_summary *entry;
@@ -1621,6 +1637,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	int phase = 0;
 	int submitted = 0;
 	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
+	/* packing path skips phase 4; pack_gc_section() handles migration */
+	int nr_phases = pack_by_inode ? 4 : 5;
 
 	start_addr = START_BLOCK(sbi, segno);
 
@@ -1629,6 +1647,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
 		struct inode *inode;
+		struct inode_entry *ie = NULL;
 		struct node_info dni; /* dnode info for the data */
 		unsigned int ofs_in_node, nofs;
 		block_t start_bidx;
@@ -1671,6 +1690,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 		if (phase == 3) {
 			struct folio *data_folio;
+			struct gc_block *e;
 			int err;
 
 			inode = f2fs_iget(sb, dni.ino);
@@ -1717,8 +1737,10 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 					iput(inode);
 					continue;
 				}
-				add_gc_inode(gc_list, inode);
-				continue;
+				ie = add_gc_inode(gc_list, inode);
+				if (!pack_by_inode)
+					continue;
+				goto queue;
 			}
 
 			data_folio = f2fs_get_read_data_folio(inode, start_bidx,
@@ -1730,18 +1752,37 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			}
 
 			f2fs_folio_put(data_folio, false);
-			add_gc_inode(gc_list, inode);
+			ie = add_gc_inode(gc_list, inode);
+			if (!pack_by_inode)
+				continue;
+queue:
+			e = f2fs_kmem_cache_alloc(gc_block_slab, GFP_NOFS,
+						  false, sbi);
+			if (!e)
+				goto do_migrate;	/* alloc fail: migrate now */
+			e->segno = segno;
+			e->nofs = nofs;
+			e->ofs_in_node = ofs_in_node;
+			e->off = off;
+			list_add_tail(&e->list, &ie->gc_blocks);
 			continue;
 		}
 
-		/* phase 4 */
-		inode = find_gc_inode(gc_list, dni.ino);
+		/*
+		 * phase 4: legacy per-segment migration.  Capped out by
+		 * nr_phases when packing is on; reached only via the
+		 * 'goto do_migrate' fallback above, in which case @ie is
+		 * the entry add_gc_inode() just returned and we reuse it
+		 * instead of repeating the radix-tree lookup.
+		 */
+do_migrate:
+		inode = ie ? ie->inode : find_gc_inode(gc_list, dni.ino);
 		if (inode)
 			submitted += do_migrate_one_data_block(sbi, inode,
 					segno, off, nofs, ofs_in_node, gc_type);
 	}
 
-	if (++phase < 5) {
+	if (++phase < nr_phases) {
 		blk_finish_plug(plug);
 		blk_start_plug(plug);
 		goto next_step;
@@ -1750,6 +1791,31 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	return submitted;
 }
 
+/*
+ * pack_gc_section - migrate all gc_blocks queued for this victim section,
+ * grouped by inode.  gc_list->ilist is walked in insertion order so
+ * destination curseg writes form inode-contiguous runs that span every
+ * source segment of the section.
+ */
+static int pack_gc_section(struct f2fs_sb_info *sbi,
+			   struct gc_inode_list *gc_list, int gc_type)
+{
+	struct inode_entry *ie;
+	struct gc_block *e, *tmp;
+	int submitted = 0;
+
+	list_for_each_entry(ie, &gc_list->ilist, list) {
+		list_for_each_entry_safe(e, tmp, &ie->gc_blocks, list) {
+			submitted += do_migrate_one_data_block(sbi, ie->inode,
+					e->segno, e->off, e->nofs,
+					e->ofs_in_node, gc_type);
+			list_del(&e->list);
+			kmem_cache_free(gc_block_slab, e);
+		}
+	}
+	return submitted;
+}
+
 static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
 			int gc_type, bool one_time)
 {
@@ -1776,6 +1842,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	unsigned char type;
 	unsigned char data_type;
 	int submitted = 0, sum_blk_cnt;
+	/*
+	 * Snapshot the packing knob once for this section.  Re-reading the
+	 * sysfs-writable bool from phase 3, phase 4 and the pack pass would
+	 * let a concurrent toggle queue blocks via add_gc_block() and then
+	 * bypass pack_gc_section(), losing this cycle of migration.
+	 */
+	bool pack_by_inode = sbi->gc_inode_local_packing && gc_type == FG_GC;
 
 	if (__is_large_section(sbi)) {
 		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
@@ -1904,7 +1977,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			else
 				submitted += gc_data_segment(sbi, sum->entries,
 						gc_list, cur_segno,
-						gc_type, force_migrate, &plug);
+						gc_type, force_migrate,
+						pack_by_inode, &plug);
 
 			stat_inc_gc_seg_count(sbi, data_type, gc_type);
 			sbi->gc_reclaimed_segs[sbi->gc_mode]++;
@@ -1930,6 +2004,14 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		segno = block_end_segno;
 	}
 
+	/*
+	 * Drain the per-inode gc_blocks queue.  Skipped on freezing
+	 * (goto stop above): leftover entries are freed by put_gc_inode()
+	 * in f2fs_gc().
+	 */
+	if (pack_by_inode)
+		submitted += pack_gc_section(sbi, gc_list, gc_type);
+
 stop:
 	if (submitted)
 		f2fs_submit_merged_write(sbi, data_type);
@@ -2105,11 +2187,20 @@ int __init f2fs_create_garbage_collection_cache(void)
 {
 	victim_entry_slab = f2fs_kmem_cache_create("f2fs_victim_entry",
 					sizeof(struct victim_entry));
-	return victim_entry_slab ? 0 : -ENOMEM;
+	if (!victim_entry_slab)
+		return -ENOMEM;
+	gc_block_slab = f2fs_kmem_cache_create("f2fs_gc_block",
+					sizeof(struct gc_block));
+	if (!gc_block_slab) {
+		kmem_cache_destroy(victim_entry_slab);
+		return -ENOMEM;
+	}
+	return 0;
 }
 
 void f2fs_destroy_garbage_collection_cache(void)
 {
+	kmem_cache_destroy(gc_block_slab);
 	kmem_cache_destroy(victim_entry_slab);
 }
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ada8098f8..f1bee7f3d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4353,6 +4353,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->migration_granularity = SEGS_PER_SEC(sbi);
 	sbi->migration_window_granularity = f2fs_sb_has_blkzoned(sbi) ?
 		DEF_MIGRATION_WINDOW_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
+	sbi->gc_inode_local_packing = __is_large_section(sbi);
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 665687244..30a3beb60 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -659,6 +659,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
+	if (!strcmp(a->attr.name, "gc_inode_local_packing")) {
+		if (t > 1)
+			return -EINVAL;
+	}
+
 	if (!strcmp(a->attr.name, "gc_urgent")) {
 		if (t == 0) {
 			sbi->gc_mode = GC_NORMAL;
@@ -1269,6 +1274,7 @@ F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
+F2FS_SBI_GENERAL_RW_ATTR(gc_inode_local_packing);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
@@ -1438,6 +1444,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_victim_search),
 	ATTR_LIST(migration_granularity),
 	ATTR_LIST(migration_window_granularity),
+	ATTR_LIST(gc_inode_local_packing),
 	ATTR_LIST(dir_level),
 	ATTR_LIST(ram_thresh),
 	ATTR_LIST(ra_nid_pages),
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
