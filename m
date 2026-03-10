Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LDXHkHmr2nkdAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:37:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4FD24893C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:37:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCY/IIwwbaWIQHGLTP61tXKFbZ5dVZVSj9XZpWpGXvs=; b=GUF3nwj5F4APBEXKxvvZ7bdM73
	I1yArwAUZHDsqHwOfgItOzcPStRf9mw/Cs7WpWww8juBDEpJx05i0nOZxU2vl4yWRqOFUVW2ROSB0
	NuAJnc6ZK6yQn6cL9lJx/KCADjBdQU3iWr0USeZH5TX8sHGBWkUVQE1/0Qf//Xa9tLeY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vztWL-0006h6-TG;
	Tue, 10 Mar 2026 09:36:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vztWJ-0006gu-Qo
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YYMNM7oUoOBK/i/+QmQ0KvX6qfFiqGn8eLmQ/vrLiZU=; b=fQ3Qoq+k9q5I6QR76PVvdgnEPI
 jOzxGuOn57shl4yXtjVDzxTm4rbrchG9a+I3NLVqBuZuuRQjdh0RbK2IytP2CfaH2JLRmqjMjDF7e
 iPEjdRTlkybm2oOCHFlai9l4B5qUQ8cd+kb9BGwFEHZQ98scLKtLgwB5LccfLE7ulU9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YYMNM7oUoOBK/i/+QmQ0KvX6qfFiqGn8eLmQ/vrLiZU=; b=kSJ+2sowuigasCEB9Vt1lONmjh
 2N0jQAgyETtd00tIctrxPjAeW6UtVUwNXYYySUXe0c7SWMlyEMR+wjqi02gc8NO0jA4UYiUuk+1o0
 nXHg2dty7wH6MrcK+nMuBtBb8OhpggyDmBn2h21qWm2jVLM4UDtDM37HZhV2puJE6+YY=;
Received: from r3-21.sinamail.sina.com.cn ([202.108.3.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vztWJ-0002hU-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:36:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773135415; bh=YYMNM7oUoOBK/i/+QmQ0KvX6qfFiqGn8eLmQ/vrLiZU=;
 h=From:Subject:Date:Message-ID;
 b=nXSn+Ddx0h5udLaOWreLNvnpCIE/Y7mAmHino2FfprDpUTH2qgsfp66KtWl1g5laY
 JCLBH9nZlvjNoLK7KsNV74cT/4neRxWgf0dZxQIX1dzdREE8E/jH1aBzsjFVNpq7XJ
 KHokAEcj7Aun6jKfNi5Up2D1maCVxLIMOI2IuCa8=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 69AFE614000071F2; Tue, 10 Mar 2026 17:36:43 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 2834436685145
X-SMAIL-UIID: 2A942723609D4B1F827C60F885EB5413-20260310-173643-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 10 Mar 2026 17:36:14 +0800
Message-ID: <20260310093611.2865092-6-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310093611.2865092-2-monty_pavel@sina.com>
References: <20260310093611.2865092-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Data loss can occur when fsync is
 performed
 on a newly created file (before any checkpoint has been written) concurrently
 with a checkpoint operation. The scenario is as follows: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.21 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vztWJ-0002hU-5Y
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix data loss caused by incorrect use
 of nat_entry flag
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
X-Rspamd-Queue-Id: DA4FD24893C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[sina.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,sina.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Data loss can occur when fsync is performed on a newly created file
(before any checkpoint has been written) concurrently with a checkpoint
operation. The scenario is as follows:

create & write & fsync 'file A'                 write checkpoint
- f2fs_do_sync_file // inline inode
 - f2fs_write_inode // inode folio is dirty
                                                - f2fs_write_checkpoint
                                                 - f2fs_flush_merged_writes
                                                 - f2fs_sync_node_pages
                                                 - f2fs_flush_nat_entries
 - f2fs_fsync_node_pages // no dirty node
 - f2fs_need_inode_block_update // return false
 SPO and lost 'file A'

f2fs_flush_nat_entries() sets the IS_CHECKPOINTED and HAS_LAST_FSYNC
flags for the nat_entry, but this does not mean that the checkpoint has
actually completed successfully. However, f2fs_need_inode_block_update()
checks these flags and incorrectly assumes that the checkpoint has
finished.

The root cause is that the semantics of IS_CHECKPOINTED and
HAS_LAST_FSYNC are only guaranteed after the checkpoint write fully
completes.

This patch modifies f2fs_need_inode_block_update() to acquire the
sbi->node_write lock before reading the nat_entry flags, ensuring that
once IS_CHECKPOINTED and HAS_LAST_FSYNC are observed to be set, the
checkpoint operation has already completed.

Fixes: e05df3b115e7 ("f2fs: add node operations")
Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/node.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7d3b377cbc17..7153d780293b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -427,7 +427,9 @@ bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino)
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct nat_entry *e;
 	bool need_update = true;
+	struct f2fs_lock_context lc;
 
+	f2fs_down_read_trace(&sbi->node_write, &lc);
 	f2fs_down_read(&nm_i->nat_tree_lock);
 	e = __lookup_nat_cache(nm_i, ino, false);
 	if (e && get_nat_flag(e, HAS_LAST_FSYNC) &&
@@ -435,6 +437,7 @@ bool f2fs_need_inode_block_update(struct f2fs_sb_info *sbi, nid_t ino)
 			 get_nat_flag(e, HAS_FSYNCED_INODE)))
 		need_update = false;
 	f2fs_up_read(&nm_i->nat_tree_lock);
+	f2fs_up_read_trace(&sbi->node_write, &lc);
 	return need_update;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
