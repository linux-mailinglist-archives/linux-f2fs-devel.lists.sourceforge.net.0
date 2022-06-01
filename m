Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AEB53ADB7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 22:45:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwVD9-0008QY-5m; Wed, 01 Jun 2022 20:45:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nwVD7-0008QS-Nq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JX+oao7dJXpQ+R4Cj9jGhp6mKaSKsAtFKWKTsEXLiak=; b=L0lnDKsTB9jiMJZJpcDdoNc/rS
 RDX71hnHMgpOwCnxry09EWBw98tDOYWDNjxaCvPy6dEj4jCSfXh561xwBxgl3SqVhmzYOmCdXO/q3
 lbVeqBOCmDdIAmLt9ugulUUBsxtVcQMphXgyAsqxgKmiPpHnFQIuI3w0b7KmB6M8HCM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JX+oao7dJXpQ+R4Cj9jGhp6mKaSKsAtFKWKTsEXLiak=; b=hc8Fh101xRwh6yFmcNf6pKDQT9
 Z9EUw8S2Yb9HaNR19DW8ohLzlUtjb7yHP+WXmjJ1fr7AiSy9C8zbHIJ7y+48KnuTsHhSjcJHcDabF
 R3nu//kYby/Mf1gkvFpugKVnTDCaplf4tHk+wOdWlyOWAyQDYOa2ZOPbcBB3bmbaeeAs=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwVD5-00027E-Cr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 20:44:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 5AE151F438B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654116289;
 bh=HAicmnDTWWajqPFt32opP8XSXWOdsqjYOr5lPMSjCC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AEfzqkgV4pfRkI2BW3V+gYVqFqJkkQBCA/afcP0F9zS4QF9LAqIz5Pc9cWro/qLKz
 /NJ8TNV7aVNX3x300o59tqR/+Y+7t3YWaO4nc6W4wvaiPEZwDCiTQ4Aw/Y8CzqB7VT
 12DA+usAfS0BjhquWtxeLIRH8rAJfA0cmprSxxJJC3IfULb40j3DUR9QsGuJYlAHAC
 j32pnjJluWp5VDwtgXPMqHdbzO77D7xHRjFEpSs0IV6b/Ce6wU8naGMGwh14ih4hIC
 /u2ynNLrqxmk+p8oa+8NMv7DBotW9pSQBZMrnbmlSSSY255bBD2QQ9P4CMCQhvx035
 yWQGp/Oau/Y8w==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: viro@zeniv.linux.org.uk,
	tytso@mit.edu,
	jaegeuk@kernel.org
Date: Wed,  1 Jun 2022 16:44:32 -0400
Message-Id: <20220601204437.676872-3-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601204437.676872-1-krisman@collabora.com>
References: <20220601204437.676872-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This flag marks a negative or positive dentry as being
 created
 after a case-insensitive lookup operation. It is useful to differentiate
 dentries this way to detect whether the negative dentry can be t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nwVD5-00027E-Cr
Subject: [f2fs-dev] [PATCH RFC 2/7] fs: Add DCACHE_CASEFOLD_LOOKUP flag
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
Cc: kernel@collabora.com, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This flag marks a negative or positive dentry as being created after a
case-insensitive lookup operation.  It is useful to differentiate
dentries this way to detect whether the negative dentry can be trusted
during a case-insensitive lookup.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/dcache.c            | 7 +++++++
 include/linux/dcache.h | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index a0fe9e3676fb..518ddb7fbe0c 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1958,6 +1958,13 @@ void d_set_fallthru(struct dentry *dentry)
 }
 EXPORT_SYMBOL(d_set_fallthru);
 
+void d_set_casefold_lookup(struct dentry *dentry)
+{
+	spin_lock(&dentry->d_lock);
+	dentry->d_flags |= DCACHE_CASEFOLD_LOOKUP;
+	spin_unlock(&dentry->d_lock);
+}
+
 static unsigned d_flags_for_inode(struct inode *inode)
 {
 	unsigned add_flags = DCACHE_REGULAR_TYPE;
diff --git a/include/linux/dcache.h b/include/linux/dcache.h
index 871f65c8ef7f..8b71c5e418c2 100644
--- a/include/linux/dcache.h
+++ b/include/linux/dcache.h
@@ -208,6 +208,7 @@ struct dentry_operations {
 #define DCACHE_FALLTHRU			0x01000000 /* Fall through to lower layer */
 #define DCACHE_NOKEY_NAME		0x02000000 /* Encrypted name encoded without key */
 #define DCACHE_OP_REAL			0x04000000
+#define DCACHE_CASEFOLD_LOOKUP		0x08000000 /* Dentry comes from a casefold directory */
 
 #define DCACHE_PAR_LOOKUP		0x10000000 /* being looked up (with parent locked shared) */
 #define DCACHE_DENTRY_CURSOR		0x20000000
@@ -497,6 +498,13 @@ static inline bool d_is_fallthru(const struct dentry *dentry)
 	return dentry->d_flags & DCACHE_FALLTHRU;
 }
 
+extern void d_set_casefold_lookup(struct dentry *dentry);
+
+static inline bool d_is_casefold_lookup(const struct dentry *dentry)
+{
+	return dentry->d_flags & DCACHE_CASEFOLD_LOOKUP;
+}
+
 
 extern int sysctl_vfs_cache_pressure;
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
