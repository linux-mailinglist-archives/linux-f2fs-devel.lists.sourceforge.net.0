Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RyNwOw2TImqmaQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 11:12:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FBB646BD8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 11:12:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=TC5gDU32;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=epxKh2av;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=IAvmPsgN;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=DJATh6kZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:In-Reply-To:To:From:Mime-Version:
	Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0bKKaSqz6so1vFb+ZAZCzF99dPMqu+mkpT4mjWIpq0=; b=TC5gDU3206WejCE8aZNBtn214l
	Y2tzm5g89Mc/m0MzoOco2EnhwqNRMbdTo834YBw6acG/N/HPILGumRGcTdg3QRtH3ktskK7eZbNE1
	Cq+moB2QtUZvsUEffuiMmcUmvjLaUM2gw4Cp2nI9Vwjbepm/j99j4R60TtTwqRBZXtb4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVQbX-0006uw-Px;
	Fri, 05 Jun 2026 09:12:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1wVQbW-0006ue-1y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 09:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BDvHwoLtYhiLI2grfHAnGjCJ51iQ0pMy2E6raFEdqL0=; b=epxKh2avuVn4ePktyPTbELpFNf
 1tyxGfwPEQsKGqy8D0GCb05ZRzWsIeNH51OUbV1eaUgQCiY4Qq8DEKPEAU73lrM7lnkNajA0YZH1F
 SfvfbtjPzPd+qjQ7cwj9su54/e7zlonDjU2sncRCvXyej7HWWjtFu7b17kkrpznewkg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BDvHwoLtYhiLI2grfHAnGjCJ51iQ0pMy2E6raFEdqL0=; b=IAvmPsgNbRHaQV1eenKzKk82Ua
 WOD6g1iTlnvnh4An8WUtMZNr+Il2n5xiWxjnBTHfRFAIqrwnUKlzrp3/aeIYwH2RhV74bg1uKaoi0
 552MBSGnus56JwHfdbfXfUoLpAvrOW4aw676Yap7R3UNSuDi5h5L1b8zTC04Sg5XueSY=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wVQbV-0000ag-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 09:12:38 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20260605091230epoutp01adc99da94325a812d144f0570365628e~2JGxtvMVT1359013590epoutp01Y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jun 2026 09:12:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20260605091230epoutp01adc99da94325a812d144f0570365628e~2JGxtvMVT1359013590epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1780650750;
 bh=BDvHwoLtYhiLI2grfHAnGjCJ51iQ0pMy2E6raFEdqL0=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=DJATh6kZqCZXqccDy6SRAvCiPDylWAZd0p/FeVYfH0CPgqxeEL5d24/hkF30FvGFV
 x2z3C9VLbajf4fpbS0dza96eKeu6nCnA6tnAoZsaJnaqJayaM0XOA9scjnVeDc1GAE
 u9OqGfCJMutS5suNaNGOSLHXebJRCZSavKP0NzkY=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
 20260605091230epcas2p44a708cec1e27397dd4d00c9cb26a2e14~2JGxXZcsl0157101571epcas2p48;
 Fri,  5 Jun 2026 09:12:30 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.204]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4gWwgf0Mdrz2SSKg; Fri,  5 Jun
 2026 09:12:30 +0000 (GMT)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p2>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260605091229epcms2p406d0a66d4fa12ba1d77bc668ebcfe352@epcms2p4>
Date: Fri, 05 Jun 2026 18:12:29 +0900
X-CMS-MailID: 20260605091229epcms2p406d0a66d4fa12ba1d77bc668ebcfe352
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba
References: <20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p2>
 <CGME20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p4>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Pull gc_data_segment()'s per-block migration body out into
 a static helper. The lock acquisition, move_data_{page,block}() dispatch,
 i_gc_rwsem release and stat_inc_data_blk_count() call are now share [...]
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wVQbV-0000ag-A6
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: extract do_migrate_one_data_block()
 helper for GC migration
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MV_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[daejun7.park@samsung.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,samsung.com:email,samsung.com:from_mime,samsung.com:replyto,epcms2p4:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 46FBB646BD8

Pull gc_data_segment()'s per-block migration body out into a static
helper.  The lock acquisition, move_data_{page,block}() dispatch,
i_gc_rwsem release and stat_inc_data_blk_count() call are now shared
through a single point so future migration paths (e.g. inode-local
packing) can reuse them instead of duplicating the sequence.

While here, change add_gc_inode() to return the inserted (or already
present) inode_entry pointer.  The caller still discards it for now;
upcoming work needs the pointer to attach per-inode state to the
entry without an extra radix-tree lookup.

No behavioral change.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
 fs/f2fs/gc.c | 109 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 64 insertions(+), 45 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 69e0a8672..e232dff72 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -991,13 +991,15 @@ static struct inode *find_gc_inode(struct gc_inode_list *gc_list, nid_t ino)
 	return NULL;
 }
 
-static void add_gc_inode(struct gc_inode_list *gc_list, struct inode *inode)
+static struct inode_entry *add_gc_inode(struct gc_inode_list *gc_list,
+					struct inode *inode)
 {
 	struct inode_entry *new_ie;
 
-	if (inode == find_gc_inode(gc_list, inode->i_ino)) {
+	new_ie = radix_tree_lookup(&gc_list->iroot, inode->i_ino);
+	if (new_ie && new_ie->inode == inode) {
 		iput(inode);
-		return;
+		return new_ie;
 	}
 	new_ie = f2fs_kmem_cache_alloc(f2fs_inode_entry_slab,
 					GFP_NOFS, true, NULL);
@@ -1005,6 +1007,7 @@ static void add_gc_inode(struct gc_inode_list *gc_list, struct inode *inode)
 
 	f2fs_radix_tree_insert(&gc_list->iroot, inode->i_ino, new_ie);
 	list_add_tail(&new_ie->list, &gc_list->ilist);
+	return new_ie;
 }
 
 static void put_gc_inode(struct gc_inode_list *gc_list)
@@ -1579,6 +1582,61 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 	return err;
 }
 
+/*
+ * do_migrate_one_data_block - migrate one valid data block at @segno+@off,
+ * identified by (@nofs, @ofs_in_node) on @inode, into the destination
+ * curseg via move_data_{page,block}().
+ *
+ * Takes i_gc_rwsem for regular files; on rwsem contention the block is
+ * skipped and sbi->skipped_gc_rwsem is incremented.  Returns the number
+ * of blocks submitted for write (0 or 1).
+ */
+static int do_migrate_one_data_block(struct f2fs_sb_info *sbi,
+				     struct inode *inode,
+				     unsigned int segno, int off,
+				     unsigned int nofs,
+				     unsigned int ofs_in_node, int gc_type)
+{
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	bool locked = false;
+	block_t start_bidx;
+	int err;
+	int submitted = 0;
+
+	if (S_ISREG(inode->i_mode)) {
+		if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[WRITE])) {
+			sbi->skipped_gc_rwsem++;
+			return 0;
+		}
+		if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[READ])) {
+			sbi->skipped_gc_rwsem++;
+			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			return 0;
+		}
+		locked = true;
+
+		/* wait for all inflight aio data */
+		inode_dio_wait(inode);
+	}
+
+	start_bidx = f2fs_start_bidx_of_node(nofs, inode) + ofs_in_node;
+	if (f2fs_meta_inode_gc_required(inode))
+		err = move_data_block(inode, start_bidx, gc_type, segno, off);
+	else
+		err = move_data_page(inode, start_bidx, gc_type, segno, off);
+
+	if (!err && (gc_type == FG_GC || f2fs_meta_inode_gc_required(inode)))
+		submitted = 1;
+
+	if (locked) {
+		f2fs_up_write(&fi->i_gc_rwsem[READ]);
+		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+	}
+
+	stat_inc_data_blk_count(sbi, 1, gc_type);
+	return submitted;
+}
+
 /*
  * This function tries to get parent node of victim data block, and identifies
  * data block validity. If the block is valid, copy that with cold status and
@@ -1712,48 +1770,9 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 		/* phase 4 */
 		inode = find_gc_inode(gc_list, dni.ino);
-		if (inode) {
-			struct f2fs_inode_info *fi = F2FS_I(inode);
-			bool locked = false;
-			int err;
-
-			if (S_ISREG(inode->i_mode)) {
-				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[WRITE])) {
-					sbi->skipped_gc_rwsem++;
-					continue;
-				}
-				if (!f2fs_down_write_trylock(
-						&fi->i_gc_rwsem[READ])) {
-					sbi->skipped_gc_rwsem++;
-					f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-					continue;
-				}
-				locked = true;
-
-				/* wait for all inflight aio data */
-				inode_dio_wait(inode);
-			}
-
-			start_bidx = f2fs_start_bidx_of_node(nofs, inode)
-								+ ofs_in_node;
-			if (f2fs_meta_inode_gc_required(inode))
-				err = move_data_block(inode, start_bidx,
-							gc_type, segno, off);
-			else
-				err = move_data_page(inode, start_bidx, gc_type,
-								segno, off);
-
-			if (!err && (gc_type == FG_GC ||
-					f2fs_meta_inode_gc_required(inode)))
-				submitted++;
-
-			if (locked) {
-				f2fs_up_write(&fi->i_gc_rwsem[READ]);
-				f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-			}
-
-			stat_inc_data_blk_count(sbi, 1, gc_type);
-		}
+		if (inode)
+			submitted += do_migrate_one_data_block(sbi, inode,
+					segno, off, nofs, ofs_in_node, gc_type);
 	}
 
 	if (++phase < 5) {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
