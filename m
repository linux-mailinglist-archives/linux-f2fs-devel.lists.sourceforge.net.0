Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA7939CBB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2024 10:33:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWAxU-0002cF-Hc;
	Tue, 23 Jul 2024 08:33:19 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sWAxT-0002c6-EQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OxA91QkgOX+0VUDnwCt0xfORmuQFDgxjT+SW/I9SKQs=; b=h8aNySBS9uq6QNqKjP5/DSt0aN
 iZVqtIQ0CQukhF4b2fF+rJHgBSMlT/yczRFe4o7c8UCg0wPoNRtCdwb/Ah8mDaX0mGU5xrGy7pSRz
 ATnEQElVLsWSrJUmWRHVnMtt9N4RjJtIApjWqvqa7vL7MVVz30yLwESvKU1EJuOkLz3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OxA91QkgOX+0VUDnwCt0xfORmuQFDgxjT+SW/I9SKQs=; b=bdU4+1YUx0BhjWfzouodQVzX5h
 2L+gR4gEIEY3U2l/tIdui5tsbLEiP4GHteDqTqn+6jPUu0m9ejQwlQMx/duJefl+oAkei4fB6tw0p
 LGLEwEfACj0bV+g3e7t1MLoYUSpSG4QFrea3c7g00rIo5BV8A4h4U27+hT3Ewivoax6g=;
Received: from out-174.mta0.migadu.com ([91.218.175.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWAxR-0003rp-FX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jul 2024 08:33:18 +0000
X-Envelope-To: arnd@arndb.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1721723591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OxA91QkgOX+0VUDnwCt0xfORmuQFDgxjT+SW/I9SKQs=;
 b=obXgWZddWdqx+zVOxSS8TJb8HANTxzSQNfsDVMfOVZnMmH1e7jW+1BRdsrBuqvRXHSoZJf
 1UPvBvOVTl8nd0O9wFzheyPT6A0hV9oinYwkFSkY1Mw54TOjhHHnOcfIqBO5NSyKXy9cyH
 GbznrE8Sg3iLW2RTf6CypTVG1MEHpyU=
X-Envelope-To: mcgrof@kernel.org
X-Envelope-To: clm@fb.com
X-Envelope-To: josef@toxicpanda.com
X-Envelope-To: dsterba@suse.com
X-Envelope-To: tytso@mit.edu
X-Envelope-To: adilger.kernel@dilger.ca
X-Envelope-To: jaegeuk@kernel.org
X-Envelope-To: chao@kernel.org
X-Envelope-To: hch@infradead.org
X-Envelope-To: linux-arch@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-modules@vger.kernel.org
X-Envelope-To: linux-btrfs@vger.kernel.org
X-Envelope-To: linux-ext4@vger.kernel.org
X-Envelope-To: linux-f2fs-devel@lists.sourceforge.net
X-Envelope-To: youling.tang@linux.dev
X-Envelope-To: tangyouling@kylinos.cn
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Youling Tang <youling.tang@linux.dev>
To: Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
 David Sterba <dsterba@suse.com>, tytso@mit.edu,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Date: Tue, 23 Jul 2024 16:32:37 +0800
Message-Id: <20240723083239.41533-3-youling.tang@linux.dev>
In-Reply-To: <20240723083239.41533-1-youling.tang@linux.dev>
References: <20240723083239.41533-1-youling.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Youling Tang <tangyouling@kylinos.cn> Use
 module_{subinit, 
 subinit} to ensure that modules init and exit are in sequence and to simplify
 the code. Signed-off-by: Youling Tang <tangyouling@kylinos.cn> ---
 fs/btrfs/super.c
 | 123 +++++++++ 1 file changed, 23 insertions(+), 100 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux.dev]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.174 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [91.218.175.174 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWAxR-0003rp-FX
Subject: [f2fs-dev] [PATCH 2/4] btrfs: Use module_subinit{_noexit} and
 module_subeixt helper macros
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
Cc: linux-arch@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-modules@vger.kernel.org, youling.tang@linux.dev,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Youling Tang <tangyouling@kylinos.cn>

Use module_{subinit, subinit} to ensure that modules init and exit
are in sequence and to simplify the code.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/btrfs/super.c | 123 +++++++++--------------------------------------
 1 file changed, 23 insertions(+), 100 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 08d33cb372fb..620493b3f319 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -2490,115 +2490,38 @@ static void unregister_btrfs(void)
 	unregister_filesystem(&btrfs_fs_type);
 }
 
-/* Helper structure for long init/exit functions. */
-struct init_sequence {
-	int (*init_func)(void);
-	/* Can be NULL if the init_func doesn't need cleanup. */
-	void (*exit_func)(void);
-};
-
-static const struct init_sequence mod_init_seq[] = {
-	{
-		.init_func = btrfs_props_init,
-		.exit_func = NULL,
-	}, {
-		.init_func = btrfs_init_sysfs,
-		.exit_func = btrfs_exit_sysfs,
-	}, {
-		.init_func = btrfs_init_compress,
-		.exit_func = btrfs_exit_compress,
-	}, {
-		.init_func = btrfs_init_cachep,
-		.exit_func = btrfs_destroy_cachep,
-	}, {
-		.init_func = btrfs_init_dio,
-		.exit_func = btrfs_destroy_dio,
-	}, {
-		.init_func = btrfs_transaction_init,
-		.exit_func = btrfs_transaction_exit,
-	}, {
-		.init_func = btrfs_ctree_init,
-		.exit_func = btrfs_ctree_exit,
-	}, {
-		.init_func = btrfs_free_space_init,
-		.exit_func = btrfs_free_space_exit,
-	}, {
-		.init_func = extent_state_init_cachep,
-		.exit_func = extent_state_free_cachep,
-	}, {
-		.init_func = extent_buffer_init_cachep,
-		.exit_func = extent_buffer_free_cachep,
-	}, {
-		.init_func = btrfs_bioset_init,
-		.exit_func = btrfs_bioset_exit,
-	}, {
-		.init_func = extent_map_init,
-		.exit_func = extent_map_exit,
-	}, {
-		.init_func = ordered_data_init,
-		.exit_func = ordered_data_exit,
-	}, {
-		.init_func = btrfs_delayed_inode_init,
-		.exit_func = btrfs_delayed_inode_exit,
-	}, {
-		.init_func = btrfs_auto_defrag_init,
-		.exit_func = btrfs_auto_defrag_exit,
-	}, {
-		.init_func = btrfs_delayed_ref_init,
-		.exit_func = btrfs_delayed_ref_exit,
-	}, {
-		.init_func = btrfs_prelim_ref_init,
-		.exit_func = btrfs_prelim_ref_exit,
-	}, {
-		.init_func = btrfs_interface_init,
-		.exit_func = btrfs_interface_exit,
-	}, {
-		.init_func = btrfs_print_mod_info,
-		.exit_func = NULL,
-	}, {
-		.init_func = btrfs_run_sanity_tests,
-		.exit_func = NULL,
-	}, {
-		.init_func = register_btrfs,
-		.exit_func = unregister_btrfs,
-	}
-};
-
-static bool mod_init_result[ARRAY_SIZE(mod_init_seq)];
-
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
+static struct subexitcall_rollback rollback;
 
 static void __exit exit_btrfs_fs(void)
 {
-	btrfs_exit_btrfs_fs();
+	module_subexit(&rollback);
 	btrfs_cleanup_fs_uuids();
 }
 
 static int __init init_btrfs_fs(void)
 {
-	int ret;
-	int i;
+	module_subinit_noexit(btrfs_props_init, &rollback);
+	module_subinit(btrfs_init_sysfs, btrfs_exit_sysfs, &rollback);
+	module_subinit(btrfs_init_compress, btrfs_exit_compress, &rollback);
+	module_subinit(btrfs_init_cachep, btrfs_destroy_cachep, &rollback);
+	module_subinit(btrfs_init_dio, btrfs_destroy_dio, &rollback);
+	module_subinit(btrfs_transaction_init, btrfs_transaction_exit, &rollback);
+	module_subinit(btrfs_ctree_init, btrfs_ctree_exit, &rollback);
+	module_subinit(btrfs_free_space_init, btrfs_free_space_exit, &rollback);
+	module_subinit(extent_state_init_cachep, extent_state_free_cachep, &rollback);
+	module_subinit(extent_buffer_init_cachep, extent_buffer_free_cachep, &rollback);
+	module_subinit(btrfs_bioset_init, btrfs_bioset_exit, &rollback);
+	module_subinit(extent_map_init, extent_map_exit, &rollback);
+	module_subinit(ordered_data_init, ordered_data_exit, &rollback);
+	module_subinit(btrfs_delayed_inode_init, btrfs_delayed_inode_exit, &rollback);
+	module_subinit(btrfs_auto_defrag_init, btrfs_auto_defrag_exit, &rollback);
+	module_subinit(btrfs_delayed_ref_init, btrfs_delayed_ref_exit, &rollback);
+	module_subinit(btrfs_prelim_ref_init, btrfs_prelim_ref_exit, &rollback);
+	module_subinit(btrfs_interface_init, btrfs_interface_exit, &rollback);
+	module_subinit_noexit(btrfs_print_mod_info, &rollback);
+	module_subinit_noexit(btrfs_run_sanity_tests, &rollback);
+	module_subinit(register_btrfs, unregister_btrfs, &rollback);
 
-	for (i = 0; i < ARRAY_SIZE(mod_init_seq); i++) {
-		ASSERT(!mod_init_result[i]);
-		ret = mod_init_seq[i].init_func();
-		if (ret < 0) {
-			btrfs_exit_btrfs_fs();
-			return ret;
-		}
-		mod_init_result[i] = true;
-	}
 	return 0;
 }
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
