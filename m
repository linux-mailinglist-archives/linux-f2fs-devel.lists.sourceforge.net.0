Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDnKJQXv8mlevwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2026 07:56:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58849DC87
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2026 07:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cGiTuIZ5lG4CVpg2zHU6I8RGkF3jXxNg2EvsUYb0Trk=; b=KD8dxqqF1N1VFFIVVzhw9PyEIe
	X1bLqEMXLAZDV0tgZfE3czKQiGz00F9S12J8O1N9msBS8xXRt7X7Do0OWV025csPEo1KalbzKkO+/
	8sIpcuLxjjsWRU+GJavVV1akCNdt6TcAiRGcx5n8wVST/P22xdiHMdU9+FP3lRI5xW1M=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIKNf-0006o2-PJ;
	Thu, 30 Apr 2026 05:56:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rob_garcia@163.com>) id 1wIKNe-0006nu-LD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Apr 2026 05:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ynclYEHMnZKnDuIPo2n9BQiZ58N4eEpmcQRG0s/jhx4=; b=Dz8m4WGNMS5kiokjmv+4qiHstB
 ZA1qYa76seaM5ihezOI7vyJ0hJVui/fACd6wvnV/tfQL46f0c9CnIF1QyFa9MoKWlfWNwcc3jslkN
 4XGmersVsUR2p1r2kSWooiyjCJdnrYPq8XGjqFbrkhlk/5JBkQUbu6PYGG0vC0Xr/yOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ynclYEHMnZKnDuIPo2n9BQiZ58N4eEpmcQRG0s/jhx4=; b=U
 T9h+Ki2Y5j1HugodJ2+CVPudpvqDTtH451qBTuFOZdjQVlqzCLQHo3u8gasbE5eE7/8DbaK9E3XoK
 Giw7VHFy461QtFSFPgCzP1rLdjN145y3/n2dXfk/d4hTW+CLxebMhQXmX4v0qjfCoTm5jggDJVnY/
 QGf0YFSPKR96EFbU=;
Received: from m16.mail.163.com ([220.197.31.3])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wIKNd-0004Df-JB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Apr 2026 05:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yn
 clYEHMnZKnDuIPo2n9BQiZ58N4eEpmcQRG0s/jhx4=; b=Dekq4rQVv2ajPfh9s+
 a06+YRLsTf+LCPiMkzC7cv72sCqIllpmPkBedjJ3DwIhCDi1QGuTEg/ic/ibAZhi
 PlBaePZqJiSvoFx+8mQkgc75muCmAdB7pxwq0KVv7n7MagFtnPw841eLG/DpqfJ5
 Kzd6HqlKmhJh7F/P7K/JAA4nk=
Received: from pek-lpg-core5.wrs.com (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wD3n2na7vJpe9ZHCg--.9955S2; 
 Thu, 30 Apr 2026 13:55:38 +0800 (CST)
From: Robert Garcia <rob_garcia@163.com>
To: stable@vger.kernel.org,
	Chao Yu <chao@kernel.org>
Date: Thu, 30 Apr 2026 13:55:37 +0800
Message-Id: <20260430055537.2105721-1-rob_garcia@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3n2na7vJpe9ZHCg--.9955S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1rtF15Cw13GrWxAr4ruFg_yoW8KrW5pF
 13Jas8GrW8Wrn7W397GF4j9FyfJ3y8Wr17K393u3WIvw12vr1Fqr4kt34jqF1ftryDu3W3
 ZFn7C348Cw4DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zM1vaUUUUUU=
X-Originating-IP: [60.247.85.88]
X-CM-SenderInfo: 5uresw5dufxti6rwjhhfrp/xtbC5RoJdGny7tpdIAAA3Q
X-Spam-Score: 3.8 (+++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu [ Upstream commit
 8fc6056dcf79937c46c97fa4996cda65956437a9
 ] As reported, on-disk footer.ino and footer.nid is the same and out-of-range, 
 let's add sanity check on f2fs_alloc_nid() to detect any potential corruption
 in free_nid_list. 
 Content analysis details:   (3.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 4.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [220.197.31.3 listed in dnsbl-1.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [220.197.31.3 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [rob_garcia(at)163.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1wIKNd-0004Df-JB
Subject: [f2fs-dev] [PATCH 6.1.y] f2fs: fix to detect potential corrupted
 nid in free_nid_list
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
Cc: Robert Garcia <rob_garcia@163.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: DD58849DC87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:chao@kernel.org,m:rob_garcia@163.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rob_garcia@163.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[163.com,kernel.org,vger.kernel.org,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob_garcia@163.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,163.com:s=s110527];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,163.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

From: Chao Yu <chao@kernel.org>

[ Upstream commit 8fc6056dcf79937c46c97fa4996cda65956437a9 ]

As reported, on-disk footer.ino and footer.nid is the same and
out-of-range, let's add sanity check on f2fs_alloc_nid() to detect
any potential corruption in free_nid_list.

Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Robert Garcia <rob_garcia@163.com>
---
 fs/f2fs/node.c          | 17 ++++++++++++++++-
 include/linux/f2fs_fs.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2555787c79bb..06c94680ae4e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -27,12 +27,17 @@ static struct kmem_cache *free_nid_slab;
 static struct kmem_cache *nat_entry_set_slab;
 static struct kmem_cache *fsync_node_entry_slab;
 
+static inline bool is_invalid_nid(struct f2fs_sb_info *sbi, nid_t nid)
+{
+	return nid < F2FS_ROOT_INO(sbi) || nid >= NM_I(sbi)->max_nid;
+}
+
 /*
  * Check whether the given nid is within node id range.
  */
 int f2fs_check_nid_range(struct f2fs_sb_info *sbi, nid_t nid)
 {
-	if (unlikely(nid < F2FS_ROOT_INO(sbi) || nid >= NM_I(sbi)->max_nid)) {
+	if (unlikely(is_invalid_nid(sbi, nid))) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: out-of-range nid=%x, run fsck to fix.",
 			  __func__, nid);
@@ -2593,6 +2598,16 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
 		f2fs_bug_on(sbi, list_empty(&nm_i->free_nid_list));
 		i = list_first_entry(&nm_i->free_nid_list,
 					struct free_nid, list);
+
+		if (unlikely(is_invalid_nid(sbi, i->nid))) {
+			spin_unlock(&nm_i->nid_list_lock);
+			f2fs_err(sbi, "Corrupted nid %u in free_nid_list",
+								i->nid);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_CORRUPTED_NID);
+			return false;
+		}
+
 		*nid = i->nid;
 
 		__move_free_nid(sbi, i, FREE_NID, PREALLOC_NID);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index c61d8fc1deb3..26c7daca9959 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -81,6 +81,7 @@ enum stop_cp_reason {
 	STOP_CP_REASON_CORRUPTED_SUMMARY,
 	STOP_CP_REASON_UPDATE_INODE,
 	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_CORRUPTED_NID,
 	STOP_CP_REASON_MAX,
 };
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
