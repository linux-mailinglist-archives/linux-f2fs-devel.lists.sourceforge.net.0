Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBIKKZFg72mHAwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 15:11:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7DD47332F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 15:11:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r8WsvHbPAyymHe5vBoCcnPPr1V7/DGcrHTXqyLcHk1E=; b=cx+VQ0fVvMY8lZQDDQPAlEDcx7
	pOHzVq3gpCX9SD8bl++VKoliqKthcjjQ9QU9kJFCTI/AwX6MjyZ9mfAybraMiZRUliS8yHfDRKVZC
	5VxmWSIeJFZ6hFB8GDhS6hCQjhDPU90kpo3ctp7yIaBwjpLggGGDVz/cfRjC9oXq9+Q8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHLkS-00017r-O4;
	Mon, 27 Apr 2026 13:11:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wHLkQ-00017l-V1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 13:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WVuuF2jz56tmxYMe69EKoYQDXvB3b59uemRr8IPDXCI=; b=ESq4nHyBLHHN8AY9R9l5JDOG4u
 /fBWuKqfIIQrfsDQV0A/7ZSzMGhCqJbipcjAUQgbwFFFBow9yB8rLoDGTpbwKOAFHyPYVXdwa9lNE
 79yRgCSLFBDolYyDCkJ+XYshKmx1SrGPzAXf55ahbxc+9k6IM88hUcbR8gJuPN/UVqoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WVuuF2jz56tmxYMe69EKoYQDXvB3b59uemRr8IPDXCI=; b=i
 xHStszOeO3kbFzmJDqS9ZfjGVRApSP5uphwuWNKkOxUQ6aTfB1q33d+uAoIqKO40f1tTIyz/gPZRp
 3myTNfIFa2fbPPNOe6TsqyYX2kot5l+8kki1MRAYj7sjXrQvhFxgGbQXgtuJI474EV+ufnm846YJw
 KsWE6ObiCLLR0oCY=;
Received: from r3-19.sinamail.sina.com.cn ([202.108.3.19])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHLkP-0002Vk-Ng for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 13:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1777295497; bh=WVuuF2jz56tmxYMe69EKoYQDXvB3b59uemRr8IPDXCI=;
 h=From:Subject:Date:Message-ID;
 b=tokEvA9YDWghvHcnMHwfgKTZ3hZdoryrNh+BxwgKE0l0lHGz0ns6puJMBEVM8Anli
 vO1qJUmAscK40SX9iNkD/AlUceg+pb7O7GdaNoc0nHcFbCk1RyXtHW0dQeSLOrH8ZT
 piGaE0PApnEaBIcIjcydC5hQ+atkXpUGXwSllzec=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69EF607A000074C0; Mon, 27 Apr 2026 21:11:24 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 1614214456648
X-SMAIL-UIID: 216C67930993494A97DC2758639D7A0E-20260427-211124-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 27 Apr 2026 21:10:51 +0800
Message-ID: <20260427131050.1526593-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang When __destroy_extent_node() sets the
 inode flag FI_NO_EXTENT, it does not reset the length of the largest extent
 to 0 and update the inode folio. Since modifications to the extent tree are
 disallowed [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.19 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wHLkP-0002Vk-Ng
Subject: [f2fs-dev] [PATCH v2] f2fs: fix incorrect FI_NO_EXTENT handling in
 __destroy_extent_node()
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: EC7DD47332F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,vger.kernel.org,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[6];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid,xiaomi.com:email]

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

When __destroy_extent_node() sets the inode flag FI_NO_EXTENT, it does
not reset the length of the largest extent to 0 and update the inode
folio. Since modifications to the extent tree are disallowed afterward,
the cached largest extent may become stale. This can trigger the
following error in xfstests generic/388:

F2FS-fs (dm-0): sanity_check_extent_cache: inode (ino=1761) extent info [220057, 57, 6] is incorrect, run fsck to fix

In the f2fs_drop_inode path, __destroy_extent_node() does not need to
guarantee that et->node_cnt is 0, because concurrency with writeback
is expected in this path, and writeback may update the extent cache.

This patch reverts commit ed78aeebef05 ("f2fs: fix node_cnt race between
extent node destroy and writeback"), and remove the unnecessary zero
check of et->node_cnt.

Fixes: ed78aeebef05 ("f2fs: fix node_cnt race between extent node destroy and writeback")
Cc: stable@vger.kernel.org
Reported-by: Chao Yu <chao@kernel.org>
Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Revert all changes of previous commit ed78aeebef05 and fix xfstests bug.
---
 fs/f2fs/extent_cache.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 87169fd29d89..129eed892a66 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -119,10 +119,9 @@ static bool __may_extent_tree(struct inode *inode, enum extent_type type)
 	if (!__init_may_extent_tree(inode, type))
 		return false;
 
-	if (is_inode_flag_set(inode, FI_NO_EXTENT))
-		return false;
-
 	if (type == EX_READ) {
+		if (is_inode_flag_set(inode, FI_NO_EXTENT))
+			return false;
 		if (is_inode_flag_set(inode, FI_COMPRESSED_FILE) &&
 				 !f2fs_sb_has_readonly(F2FS_I_SB(inode)))
 			return false;
@@ -645,14 +644,10 @@ static unsigned int __destroy_extent_node(struct inode *inode,
 
 	while (atomic_read(&et->node_cnt)) {
 		write_lock(&et->lock);
-		if (!is_inode_flag_set(inode, FI_NO_EXTENT))
-			set_inode_flag(inode, FI_NO_EXTENT);
 		node_cnt += __free_extent_tree(sbi, et, nr_shrink);
 		write_unlock(&et->lock);
 	}
 
-	f2fs_bug_on(sbi, atomic_read(&et->node_cnt));
-
 	return node_cnt;
 }
 
@@ -691,12 +686,12 @@ static void __update_extent_tree_range(struct inode *inode,
 
 	write_lock(&et->lock);
 
-	if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
-		write_unlock(&et->lock);
-		return;
-	}
-
 	if (type == EX_READ) {
+		if (is_inode_flag_set(inode, FI_NO_EXTENT)) {
+			write_unlock(&et->lock);
+			return;
+		}
+
 		prev = et->largest;
 		dei.len = 0;
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
