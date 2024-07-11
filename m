Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B227B92E137
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 09:50:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRoYx-0008VX-9H;
	Thu, 11 Jul 2024 07:50:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youling.tang@linux.dev>) id 1sRoYv-0008VM-OW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 07:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XFljGRgWS+o+/FKeNHoSuAwsaBjm894r1O3P7vtGZus=; b=jPwt338jhoNVq4zljgX9nqM68j
 OEAj5csrliSRagSVwo+zjKmZnFLHYNBS3MN5kM8EzrF6xJ5uJw1fH4cREAsglMCw/n6EjTudkDRpC
 r0Fhr3GG7YgGIed+haR8rV6fI7z7BVcHZol7ZbApQQxPdDXjp8Lp0vYVQCE5nYrxUpxk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XFljGRgWS+o+/FKeNHoSuAwsaBjm894r1O3P7vtGZus=; b=j8eNnQYHSBpYYbKNST/5rWnopw
 1JMyCgK3hH3uvyEro13V6ZGv1oEwFALT+kuQS9odSN74Mb/a2XvaTAg4rQ1l/NRBUtnLpwqdp9ldL
 4EpgYDN355cClxIFsKJY2+dqJQuUUCQJ++2npVAB+ACwft4Eg2KJUrDa5XrJiWzIK66o=;
Received: from out-171.mta1.migadu.com ([95.215.58.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRoYs-0008VS-NX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 07:49:55 +0000
X-Envelope-To: viro@zeniv.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1720684182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFljGRgWS+o+/FKeNHoSuAwsaBjm894r1O3P7vtGZus=;
 b=jSvwbqw3JyuWV/rQ+ZE2imPoy05s3NrdV5LAgLTjuyX+UDtp/EV2WTfYpEP+Emd5kSmXF7
 7gAa6C0nAliSpduOxjQsD12PSVsToOrc5CnXNaemS/16UIWhsZIz0T2CwNZuE4mbd8j9XI
 HtdV9C6O9Qu2SOKnoEJC1WSdobq3lP0=
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
Date: Thu, 11 Jul 2024 15:48:58 +0800
Message-Id: <20240711074859.366088-3-youling.tang@linux.dev>
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
 Content preview: From: Youling Tang <tangyouling@kylinos.cn> Use init_sequence
 to ensure that modules init and exit are in sequence and to simplify the
 code. Signed-off-by: Youling Tang <tangyouling@kylinos.cn> --- fs/ext4/super.c
 | 175 +++++++++++++++++++++++++ 1 file changed, 93 insertions(+),
 82 deletions(-)
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
 [95.215.58.171 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [95.215.58.171 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [95.215.58.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sRoYs-0008VS-NX
Subject: [f2fs-dev] [PATCH 2/3] ext4: make ext4 init/exit match their
 sequence
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

Use init_sequence to ensure that modules init and exit are in sequence
and to simplify the code.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 fs/ext4/super.c | 175 +++++++++++++++++++++++++-----------------------
 1 file changed, 93 insertions(+), 82 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index c682fb927b64..ec1e63facb10 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -7314,103 +7314,114 @@ static struct file_system_type ext4_fs_type = {
 };
 MODULE_ALIAS_FS("ext4");
 
-/* Shared across all ext4 file systems */
-wait_queue_head_t ext4__ioend_wq[EXT4_WQ_HASH_SZ];
-
-static int __init ext4_init_fs(void)
+static int register_ext(void)
 {
-	int i, err;
-
-	ratelimit_state_init(&ext4_mount_msg_ratelimit, 30 * HZ, 64);
-	ext4_li_info = NULL;
+	register_as_ext3();
+	register_as_ext2();
+	return register_filesystem(&ext4_fs_type);
+}
 
-	/* Build-time check for flags consistency */
-	ext4_check_flag_values();
+static void unregister_ext(void)
+{
+	unregister_as_ext2();
+	unregister_as_ext3();
+	unregister_filesystem(&ext4_fs_type);
+}
 
-	for (i = 0; i < EXT4_WQ_HASH_SZ; i++)
-		init_waitqueue_head(&ext4__ioend_wq[i]);
+/* Helper structure for long init/exit functions. */
+struct init_sequence {
+	int (*init_func)(void);
+	/* Can be NULL if the init_func doesn't need cleanup. */
+	void (*exit_func)(void);
+};
 
-	err = ext4_init_es();
-	if (err)
-		return err;
+static const struct init_sequence mod_init_seq[] = {
+	{
+		.init_func = ext4_init_es,
+		.exit_func = ext4_exit_es,
+	}, {
+		.init_func = ext4_init_pending,
+		.exit_func = ext4_exit_pending,
+	}, {
+		.init_func = ext4_init_post_read_processing,
+		.exit_func = ext4_exit_post_read_processing,
+	}, {
+		.init_func = ext4_init_pageio,
+		.exit_func = ext4_exit_pageio,
+	}, {
+		.init_func = ext4_init_system_zone,
+		.exit_func = ext4_exit_system_zone,
+	}, {
+		.init_func = ext4_init_sysfs,
+		.exit_func = ext4_exit_sysfs,
+	}, {
+		.init_func = ext4_init_mballoc,
+		.exit_func = ext4_exit_mballoc,
+	}, {
+		.init_func = init_inodecache,
+		.exit_func = destroy_inodecache,
+	}, {
+		.init_func = ext4_fc_init_dentry_cache,
+		.exit_func = ext4_fc_destroy_dentry_cache,
+	}, {
+		.init_func = register_ext,
+		.exit_func = unregister_ext,
+	}
+};
 
-	err = ext4_init_pending();
-	if (err)
-		goto out7;
+static bool mod_init_result[ARRAY_SIZE(mod_init_seq)];
 
-	err = ext4_init_post_read_processing();
-	if (err)
-		goto out6;
+static __always_inline void ext4_exit_ext4_fs(void)
+{
+	int i;
 
-	err = ext4_init_pageio();
-	if (err)
-		goto out5;
+	for (i = ARRAY_SIZE(mod_init_seq) - 1; i >= 0; i--) {
+		if (!mod_init_result[i])
+			continue;
+		if (mod_init_seq[i].exit_func)
+			mod_init_seq[i].exit_func();
+		mod_init_result[i] = false;
+	}
+}
 
-	err = ext4_init_system_zone();
-	if (err)
-		goto out4;
+static void __exit ext4_exit_fs(void)
+{
+	ext4_destroy_lazyinit_thread();
+	ext4_exit_ext4_fs();
+}
 
-	err = ext4_init_sysfs();
-	if (err)
-		goto out3;
+static __always_inline int ext4_init_ext4_fs(void)
+{
+	int ret;
+	int i;
 
-	err = ext4_init_mballoc();
-	if (err)
-		goto out2;
-	err = init_inodecache();
-	if (err)
-		goto out1;
+	for (i = 0; i < ARRAY_SIZE(mod_init_seq); i++) {
+		ASSERT(!mod_init_result[i]);
+		ret = mod_init_seq[i].init_func();
+		if (ret < 0) {
+			ext4_exit_ext4_fs();
+			return ret;
+		}
+		mod_init_result[i] = true;
+	}
+	return 0;
+}
 
-	err = ext4_fc_init_dentry_cache();
-	if (err)
-		goto out05;
+/* Shared across all ext4 file systems */
+wait_queue_head_t ext4__ioend_wq[EXT4_WQ_HASH_SZ];
 
-	register_as_ext3();
-	register_as_ext2();
-	err = register_filesystem(&ext4_fs_type);
-	if (err)
-		goto out;
+static int __init ext4_init_fs(void)
+{
+	ratelimit_state_init(&ext4_mount_msg_ratelimit, 30 * HZ, 64);
+	ext4_li_info = NULL;
 
-	return 0;
-out:
-	unregister_as_ext2();
-	unregister_as_ext3();
-	ext4_fc_destroy_dentry_cache();
-out05:
-	destroy_inodecache();
-out1:
-	ext4_exit_mballoc();
-out2:
-	ext4_exit_sysfs();
-out3:
-	ext4_exit_system_zone();
-out4:
-	ext4_exit_pageio();
-out5:
-	ext4_exit_post_read_processing();
-out6:
-	ext4_exit_pending();
-out7:
-	ext4_exit_es();
+	/* Build-time check for flags consistency */
+	ext4_check_flag_values();
 
-	return err;
-}
+	for (int i = 0; i < EXT4_WQ_HASH_SZ; i++)
+		init_waitqueue_head(&ext4__ioend_wq[i]);
 
-static void __exit ext4_exit_fs(void)
-{
-	ext4_destroy_lazyinit_thread();
-	unregister_as_ext2();
-	unregister_as_ext3();
-	unregister_filesystem(&ext4_fs_type);
-	ext4_fc_destroy_dentry_cache();
-	destroy_inodecache();
-	ext4_exit_mballoc();
-	ext4_exit_sysfs();
-	ext4_exit_system_zone();
-	ext4_exit_pageio();
-	ext4_exit_post_read_processing();
-	ext4_exit_es();
-	ext4_exit_pending();
+	return ext4_init_ext4_fs();
 }
 
 MODULE_AUTHOR("Remy Card, Stephen Tweedie, Andrew Morton, Andreas Dilger, Theodore Ts'o and others");
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
