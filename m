Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJJ4L2ISEGryTAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 10:22:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA4A5B0781
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 10:22:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxdfbA9Pwfu6Lkt3pIlCPdXL0KcA+95/kDIURm35CWA=; b=O+gspSeVfbGmy5wWDe3a8EFvfk
	kXqRZmFi48HFFwa3iq5aoeW8OJM8kvj0jQMgyoQ/jJSYJ7haQ7Rs0rAdQQZKJ+SXiWceF1N2w15FL
	qo30ONJIdvQNfB0HB4ZmsTMQT1q1qVjDvOF4MIqrYrR1MKuWED0uWtv4TRBC6DvHggpk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQL9g-0002eS-Cj;
	Fri, 22 May 2026 08:22:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wQL9d-0002e6-VY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 08:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e8zOa/msy1iwHr4fejWbXdA/75oF3Mi164Ym8AXdPCw=; b=LCITOt/NTgobVVcKAQe5Ge5AOJ
 uI27Q+XJyziNXrvmeb4MIcJ02dAzwMcx+hKIc5voifDft3VQFhQ3j0zRpSvwzYXVL1EUgLDiBt4D+
 9Bhya3obhh/mnJWhboCyJD1ABND5nidxr+oGcea4Z7SKm/k1tdN5ZrV/1n+5XIfX6kyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e8zOa/msy1iwHr4fejWbXdA/75oF3Mi164Ym8AXdPCw=; b=a2r9H15WtUyG8cLfp0qldsU4nR
 wgm/B3y3YNsuUTXjvJ0SpIQlcq1XNPgx/lWM2qGQF2c9wylAYPZF5LDpxO+5/buEUqxDqkWNSFJHj
 tf+H3ZbbhFhqnzVMuIZCgwt59QJVVJVO8dlDTvt51ZBh+51q9rJWyIK1XvMhEQ+gccHs=;
Received: from r3-18.sinamail.sina.com.cn ([202.108.3.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQL9Z-0007Nx-Tr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 08:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1779438166; bh=e8zOa/msy1iwHr4fejWbXdA/75oF3Mi164Ym8AXdPCw=;
 h=From:Subject:Date:Message-ID;
 b=tlME9pTEY7E5ZU8gtx0SHkD8TRZEot+pujpsyT5/g9Jxl+rTE1A9+bpcm2sH9D41/
 GADZ1xuenq4bDs20GsfgveBAwItNClpzNXcyzu1UNB2TtzjW5b5GArWAVNmKEQr/z9
 iGdfsYpqBzHTt5ut0tXdZ1r3UIkwHeCKYSrwiKig=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 6A101246000002AE; Fri, 22 May 2026 16:22:32 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8752054456682
X-SMAIL-UIID: C2A0D1813B7345899F28ED80671B23C8-20260522-162232-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 22 May 2026 16:22:12 +0800
Message-ID: <20260522082013.3716237-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082013.3716237-2-monty_pavel@sina.com>
References: <20260522082013.3716237-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.43.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang The largest extent takes effect during
 both read mapping and write mapping lookups, while read mapping does not
 need to access the extent_node. For write mapping, the case where the largest
 extent is [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wQL9Z-0007Nx-Tr
Subject: [f2fs-dev] [PATCH 2/5] f2fs: only initialize largest extent without
 extent_node at inode init
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:email]
X-Rspamd-Queue-Id: 8EA4A5B0781
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

The largest extent takes effect during both read mapping and write
mapping lookups, while read mapping does not need to access the
extent_node. For write mapping, the case where the largest extent is
not in the extent tree can already be handled by the merge logic, and
cases that cannot be merged do not require the largest extent to
participate either.

Therefore, the largest extent does not need to initialize a
corresponding extent_node, reducing memory footprint.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/extent_cache.c | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index aa368a01b035..f8d94db60dc6 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -410,10 +410,8 @@ static void __drop_largest_extent(struct extent_tree *et,
 void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct extent_tree_info *eti = &sbi->extent_tree[EX_READ];
 	struct f2fs_extent *i_ext = &F2FS_INODE(ifolio)->i_ext;
 	struct extent_tree *et;
-	struct extent_node *en;
 	struct extent_info ei = {0};
 
 	if (!__may_extent_tree(inode, EX_READ)) {
@@ -435,21 +433,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 	if (atomic_read(&et->node_cnt) || !ei.len)
 		goto skip;
 
-	if (IS_DEVICE_ALIASING(inode)) {
-		et->largest = ei;
-		goto skip;
-	}
-
-	en = __attach_extent_node(sbi, et, &ei, NULL,
-				&et->root.rb_root.rb_node, true);
-	if (en) {
-		et->largest = en->ei;
-		et->cached_en = en;
-
-		spin_lock(&eti->extent_lock);
-		list_add_tail(&en->list, &eti->extent_list);
-		spin_unlock(&eti->extent_lock);
-	}
+	et->largest = ei;
 skip:
 	/* Let's drop, if checkpoint got corrupted. */
 	if (f2fs_cp_error(sbi)) {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
