Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AB092E138
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 09:50:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRoYz-00077M-9Q;
	Thu, 11 Jul 2024 07:50:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sRoYx-00076c-RG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 07:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mvI9A8h/Y5bWS/0nnv7dns2BHflaYgKGDmzquHt/oQs=; b=DziKOiYjEl3nIE6URReqjXe6F4
 Phv6pxNt6Rk6hMcpWlLBCVl86RJxGG9//CiekPShTYWijCd5qzp2OP3ifefbsrN9+Ru0dILqYcE7l
 HP2Qw7dxmUvws4sDxptvM40HMv0KbjFjHcXj7TNdA7/L16/6uqX5IXrY116udK7OZVd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mvI9A8h/Y5bWS/0nnv7dns2BHflaYgKGDmzquHt/oQs=; b=SkysIv+dVVIPo0iPLzvlqO8Eyf
 nyfr0VheO/0lvMzzO2CnOODy8iTwkzScwJZZ3TFbdNlPFMhyFNvQZ3C307DrZTTyaH2WBMqO57C+N
 HzFuUde+t6Xs5oEF4/m+Yjp+aLWVDvsJc6CRTz3+fFYZikE4wzsvSygFprnXefmyHPso=;
Received: from out-187.mta1.migadu.com ([95.215.58.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRoYx-0008VY-Qf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 07:50:00 +0000
X-Envelope-To: viro@zeniv.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1720684187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvI9A8h/Y5bWS/0nnv7dns2BHflaYgKGDmzquHt/oQs=;
 b=U0rpWiAWEUzjZS2+HWWLA903HnIPzwMLBJvJWmYhEPS0mPj8TQrwz9ld5INtXG0BqBCWnh
 Bm7XYNoSGhKEh3/eZHW/CSN7dDFoUMD6y6afKhy7RPuu0QADwODeT9/CRKNdkWUJ7iiBoa
 m17x3Jq8dEX2SUUzarB0aP2nOxGRAH0=
X-Envelope-To: brauner@kernel.org
X-Envelope-To: jack@suse.cz
X-Envelope-To: clm@fb.com
X-Envelope-To: josef@toxicpanda.com
X-Envelope-To: dsterba@suse.com
X-Envelope-To: tytso@mit.edu
X-Envelope-To: adilger.kernel@dilger.ca
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: linux-fsdevel@vger.kernel.org
X-Envelope-To: linux-btrfs@vger.kernel.org
X-Envelope-To: linux-ext4@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: youling.tang@linux.dev
X-Envelope-To: tangyouling@kylinos.cn
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Thu, 11 Jul 2024 15:48:59 +0800
Message-Id: <20240711074859.366088-4-youling.tang@linux.dev>
In-Reply-To: <20240711074859.366088-1-youling.tang@linux.dev>
References: <20240711074859.366088-1-youling.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Youling Tang <tangyouling@kylinos.cn> In theory
 init_sequence_fs()
 and exit_sequence_fs() should match their sequence, thus normally they should
 look like this: init_sequence_fs() | exit_sequence_fs() + [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [95.215.58.187 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.187 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.187 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sRoYx-0008VY-Qf
Subject: [f2fs-dev] [PATCH 3/3] fs: Add {init,
 exit}_sequence_fs() helper functions
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
Cc: Youling Tang <tangyouling@kylinos.cn>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, youling.tang@linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Youling Tang <tangyouling@kylinos.cn>

In theory init_sequence_fs() and exit_sequence_fs() should match their
sequence, thus normally they should look like this:
    init_sequence_fs()   |   exit_sequence_fs()
-------------------------+------------------------
    init_A();            |
    init_B();            |
    init_C();            |
                         |   exit_C();
                         |   exit_B();
                         |   exit_A();

Providing {init, exit}_sequence_fs() helps functions ensure that modules
init/exit match their order, while also simplifying the code.

For more details see commit 5565b8e0adcd ("btrfs: make module init/exit
match their sequence").

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/btrfs/super.c   | 36 ++----------------------------------
 fs/ext4/super.c    | 41 ++---------------------------------------
 fs/f2fs/super.c    | 36 ++----------------------------------
 include/linux/fs.h | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 107 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index f05cce7c8b8d..1101991a9a63 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -2478,13 +2478,6 @@ static void unregister_btrfs(void)
 	unregister_filesystem(&btrfs_fs_type);
 }
 
-/* Helper structure for long init/exit functions. */
-struct init_sequence {
-	int (*init_func)(void);
-	/* Can be NULL if the init_func doesn't need cleanup. */
-	void (*exit_func)(void);
-};
-
 static const struct init_sequence mod_init_seq[] = {
 	{
 		.init_func = btrfs_props_init,
@@ -2551,40 +2544,15 @@ static const struct init_sequence mod_init_seq[] = {
 
 static bool mod_init_result[ARRAY_SIZE(mod_init_seq)];
 
-static __always_inline void btrfs_exit_btrfs_fs(void)
-{
-	int i;
-
-	for (i = ARRAY_SIZE(mod_init_seq) - 1; i >= 0; i--) {
-		if (!mod_init_result[i])
-			continue;
-		if (mod_init_seq[i].exit_func)
-			mod_init_seq[i].exit_func();
-		mod_init_result[i] = false;
-	}
-}
-
 static void __exit exit_btrfs_fs(void)
 {
-	btrfs_exit_btrfs_fs();
+	exit_sequence_fs(mod_init_seq, mod_init_result, ARRAY_SIZE(mod_init_seq));
 	btrfs_cleanup_fs_uuids();
 }
 
 static int __init init_btrfs_fs(void)
 {
-	int ret;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mod_init_seq); i++) {
-		ASSERT(!mod_init_result[i]);
-		ret = mod_init_seq[i].init_func();
-		if (ret < 0) {
-			btrfs_exit_btrfs_fs();
-			return ret;
-		}
-		mod_init_result[i] = true;
-	}
-	return 0;
+	return init_sequence_fs(mod_init_seq, mod_init_result, ARRAY_SIZE(mod_init_seq));
 }
 
 late_initcall(init_btrfs_fs);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index ec1e63facb10..cb5b7449c80b 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7328,13 +7328,6 @@ static void unregister_ext(void)
 	unregister_filesystem(&ext4_fs_type);
 }
 
-/* Helper structure for long init/exit functions. */
-struct init_sequence {
-	int (*init_func)(void);
-	/* Can be NULL if the init_func doesn't need cleanup. */
-	void (*exit_func)(void);
-};
-
 static const struct init_sequence mod_init_seq[] = {
 	{
 		.init_func = ext4_init_es,
@@ -7371,40 +7364,10 @@ static const struct init_sequence mod_init_seq[] = {
 
 static bool mod_init_result[ARRAY_SIZE(mod_init_seq)];
 
-static __always_inline void ext4_exit_ext4_fs(void)
-{
-	int i;
-
-	for (i = ARRAY_SIZE(mod_init_seq) - 1; i >= 0; i--) {
-		if (!mod_init_result[i])
-			continue;
-		if (mod_init_seq[i].exit_func)
-			mod_init_seq[i].exit_func();
-		mod_init_result[i] = false;
-	}
-}
-
 static void __exit ext4_exit_fs(void)
 {
 	ext4_destroy_lazyinit_thread();
-	ext4_exit_ext4_fs();
-}
-
-static __always_inline int ext4_init_ext4_fs(void)
-{
-	int ret;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mod_init_seq); i++) {
-		ASSERT(!mod_init_result[i]);
-		ret = mod_init_seq[i].init_func();
-		if (ret < 0) {
-			ext4_exit_ext4_fs();
-			return ret;
-		}
-		mod_init_result[i] = true;
-	}
-	return 0;
+	exit_sequence_fs(mod_init_seq, mod_init_result, ARRAY_SIZE(mod_init_seq));
 }
 
 /* Shared across all ext4 file systems */
@@ -7421,7 +7384,7 @@ static int __init ext4_init_fs(void)
 	for (int i = 0; i < EXT4_WQ_HASH_SZ; i++)
 		init_waitqueue_head(&ext4__ioend_wq[i]);
 
-	return ext4_init_ext4_fs();
+	return init_sequence_fs(mod_init_seq, mod_init_result, ARRAY_SIZE(mod_init_seq));
 }
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 19509942b837..b4be24865ab3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4950,13 +4950,6 @@ static void unregister_f2fs(void)
 	unregister_filesystem(&f2fs_fs_type);
 }
 
-/* Helper structure for long init/exit functions. */
-struct init_sequence {
-	int (*init_func)(void);
-	/* Can be NULL if the init_func doesn't need cleanup. */
-	void (*exit_func)(void);
-};
-
 static const struct init_sequence mod_init_seq[] = {
 	{
 		.init_func = init_inodecache,
@@ -5017,39 +5010,14 @@ static const struct init_sequence mod_init_seq[] = {
 
 static bool mod_init_result[ARRAY_SIZE(mod_init_seq)];
 
-static __always_inline void f2fs_exit_f2fs_fs(void)
-{
-	int i;
-
-	for (i = ARRAY_SIZE(mod_init_seq) - 1; i >= 0; i--) {
-		if (!mod_init_result[i])
-			continue;
-		if (mod_init_seq[i].exit_func)
-			mod_init_seq[i].exit_func();
-		mod_init_result[i] = false;
-	}
-}
-
 static void __exit exit_f2fs_fs(void)
 {
-	f2fs_exit_f2fs_fs();
+	exit_sequence_fs(mod_init_seq, mod_init_result, ARRAY_SIZE(mod_init_seq));
 }
 
 static int __init init_f2fs_fs(void)
 {
-	int ret;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mod_init_seq); i++) {
-		BUG_ON(mod_init_result[i]);
-		ret = mod_init_seq[i].init_func();
-		if (ret < 0) {
-			f2fs_exit_f2fs_fs();
-			return ret;
-		}
-		mod_init_result[i] = true;
-	}
-	return 0;
+	return init_sequence_fs(mod_init_seq, mod_init_result, ARRAY_SIZE(mod_init_seq));
 }
 
 module_init(init_f2fs_fs)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 0283cf366c2a..b173194b7f14 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2598,6 +2598,44 @@ extern void iput(struct inode *);
 int inode_update_timestamps(struct inode *inode, int flags);
 int generic_update_time(struct inode *, int);
 
+/* Helper structure for long init/exit functions. */
+struct init_sequence {
+	int (*init_func)(void);
+	/* Can be NULL if the init_func doesn't need cleanup. */
+	void (*exit_func)(void);
+};
+
+static __always_inline void exit_sequence_fs(const struct init_sequence *mod_init_seq,
+					     bool *mod_init_result, int num)
+{
+	int i;
+
+	for (i = num - 1; i >= 0; i--) {
+		if (!mod_init_result[i])
+			continue;
+		if (mod_init_seq[i].exit_func)
+			mod_init_seq[i].exit_func();
+		mod_init_result[i] = false;
+	}
+}
+
+static __always_inline int init_sequence_fs(const struct init_sequence *mod_init_seq,
+					    bool *mod_init_result, int num)
+{
+	int ret, i;
+
+	for (i = 0; i < num; i++) {
+		BUG_ON(mod_init_result[i]);
+		ret = mod_init_seq[i].init_func();
+		if (ret < 0) {
+			exit_sequence_fs(mod_init_seq, mod_init_result, num);
+			return ret;
+		}
+		mod_init_result[i] = true;
+	}
+	return 0;
+}
+
 /* /sys/fs */
 extern struct kobject *fs_kobj;
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
