Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFW+Bk49DGqqawUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2026 12:37:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C89057C602
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 May 2026 12:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:In-Reply-To:To:From:Mime-Version:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwsnAb+/OmWi4pVj65CIcU5TgDbuBMlZ3bqeUc9NriE=; b=Njb02Dpvv9aieUUWvFHFPWFnpv
	VO57CgcwoL0svYo4wT6ao13CCUXcwZWkGSPRuSUZ9Y72qtxA6FR5clYciQQtmmukKwzjc4YHhCBna
	q8uC8q+d4MN77shtkcPK8NYrG2Fos5Dkt1jboj+VXUXbDZDMwo10ZE8lBcbQhZsbcSzM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPHoe-0008Qw-CT;
	Tue, 19 May 2026 10:36:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1wPHoJ-0008J9-TH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 May 2026 10:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=srNkHuSX5m8xAuZITkbRHIqBtno8rl0h32VJvwORiAo=; b=ZQAfF+oToTcMXqJAMRmImwgVbj
 3NeLLNjj3qqfQhbKRmN07bImK9gihb51U1HretlvrjRm9V6RGJSI7UMv8R1glRup2Gj4pmK+dnW/i
 hhySu7rjPelaprRMu+T+ck6+hAb2gb11WMlaCDUEcvYBfBEvqMl9CTqLBekkbfmVtDwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=srNkHuSX5m8xAuZITkbRHIqBtno8rl0h32VJvwORiAo=; b=YhuTH+yI/F1Z1L/mVQvKorhLDu
 W8yenyD6VE0E5QH/rMyVM6gNXdsR/dSXvSMYj92PyNDT0F3UUTnPl4l9c4yo6aDqKPIfKa6EvhhnI
 JytoujK1jotODase42gNeVKBq8KyN59upUfz8yNB4LprOkdR/Rzh1hiFpuTq55UnJY/U=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPHoC-0004JW-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 May 2026 10:36:24 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20260519102052epoutp018afae586dfc9ad422c1b3ef7e630e649~w8Em1b4Kp1404414044epoutp01S
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 May 2026 10:20:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20260519102052epoutp018afae586dfc9ad422c1b3ef7e630e649~w8Em1b4Kp1404414044epoutp01S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1779186052;
 bh=srNkHuSX5m8xAuZITkbRHIqBtno8rl0h32VJvwORiAo=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=Appvkr7JioaIX31CtHHEfhu6q9dbXgp/znXmouQ8pFUhzUhD8VFvzDStynsQLI+Vy
 ULa3fVVgDh8b7Psm8Nbo5qjnd4qqhG2KB2F20JHUDdeQUaH/yR3OViTcFMtzl1fzbg
 NcMoPg87hX7k5ALUUg1SNEb9aBd2oLB5RxzhyjvI=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20260519102051epcas2p27d7eb5c76cca1b58de521753c547ff13~w8Emb3CL31397113971epcas2p23;
 Tue, 19 May 2026 10:20:51 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.38.204]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4gKW0M358vz2SSKb; Tue, 19 May
 2026 10:20:51 +0000 (GMT)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260519101956epcms2p47a6225e24691bad1a88ca0d9e527d9dc@epcms2p4>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260519102050epcms2p1d97986f63e6ed985a47de22cf778e7b9@epcms2p1>
Date: Tue, 19 May 2026 19:20:50 +0900
X-CMS-MailID: 20260519102050epcms2p1d97986f63e6ed985a47de22cf778e7b9
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260519101956epcms2p47a6225e24691bad1a88ca0d9e527d9dc
References: <20260519101956epcms2p47a6225e24691bad1a88ca0d9e527d9dc@epcms2p4>
 <CGME20260519101956epcms2p47a6225e24691bad1a88ca0d9e527d9dc@epcms2p1>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
X-Headers-End: 1wPHoC-0004JW-Fv
Subject: [f2fs-dev] [PATCH 1/2] f2fs: extract do_migrate_one_data_block()
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	HAS_REPLYTO(0.00)[daejun7.park@samsung.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:replyto,samsung.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 4C89057C602
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 99bc59889..48412f9a5 100644
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
@@ -1545,6 +1548,61 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
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
@@ -1678,48 +1736,9 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
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
