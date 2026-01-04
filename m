Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68627CF081F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RZKOnaS9BP8cikFVNmdOExf4b4jcEes3l3Y/roaAH0=; b=ea2XyAMtF1GlLAZjrE58Wl/UqB
	X+ZfhyCbobS1VVVbRf7oQL+IA5aOR7nHdebtYegk5cmQ7pD75smZiRPzpv0V2xv4yEfe76xmtjyWs
	UVvf41wHVXa2Tj+F/sLlMfL/9fI+LY+gnAkH7ySuaJtlkRIMF0bOMXTtF8F05pfAEWiE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXa-0000gE-3E;
	Sun, 04 Jan 2026 02:08:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXX-0000g6-Uh
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GCtwMZPCIuHwYXV1QlFGo7TQumwb+CRMxnj5cuc99z0=; b=bCO9bkdb1yE4E+BpDiiqqVKAK2
 //9YO1tRQ6Q2F3vQqGr/MKrHLbuGKeaTr4YrFSLELQFFr3LieuadvyHxCVAjRr9IQwlXMy/2fQgQM
 SW4s9SdmvmUeX9FyC6XndH1+c1GCq5/g/uH2FegdOhKgv3ATHMvd+um9iL9QOH88Vbkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GCtwMZPCIuHwYXV1QlFGo7TQumwb+CRMxnj5cuc99z0=; b=LiwolfDxa6m1jraZJx6q9VfWwq
 JcBFsYNKhqgFjRJMwMskDkE7VLiGx7J8YY53rYIQ5cdxEfwbV13MHjUyWYQ1uiXOD6DsOmlLGXF+N
 /AeYYL6lgL5jBLOIILlwXfjnzilWuN6GG3rWL4ZOBDSb1PeEUO4rEZGbt45w/yRPZ0GQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXX-0005nh-7D for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EC0724427A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED15C19423;
 Sun,  4 Jan 2026 02:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492488;
 bh=FjxPDkPb0b6ALOwmCLq6MsIiEbneVQ9Q1d4PppU8+tA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AWYRXeih4MO46MPjN3tbVqoxA2sd5j22OppBIBq+AzszC9hYySubS4DQqkybxblC1
 HPqf2+L1joIJsijRio2y6QzWSBtV6yzEj4LZL1Cb1mqXH/FNMgCZmw7izV98rwRdhl
 dpuaE1XLOVvDcwyoH0M95wLXXtGV4uGatT8kqBnzktwUXcKRiXaU98MHkbYHnLN3hR
 91UWAxdbvJeEnt2BKYvoIKjHFqnKvJyJQY6s2PW8GWHVrX+W8RlZg76cpTfu7Nv9vN
 99buHy8MTNwVEsqhjhDXX1XZwioQzxSErhCEJFi+m4hBuUNcT6wyFza9JhtGPtrWlg
 SyilBMKlXuyiQ==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:19 +0800
Message-ID: <20260104020729.1064529-4-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use f2fs_{down, up}_read_trace for node_change to trace lock
 elapsed time. Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/data.c
 | 4 ++-- fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 2 +-
 include/trace/events/f2fs.h
 | 3 ++- 4 files changed, 6 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXX-0005nh-7D
Subject: [f2fs-dev] [PATCH 04/14] f2fs: trace elapsed time for node_change
 lock
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use f2fs_{down,up}_read_trace for node_change to trace lock elapsed time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c              | 4 ++--
 fs/f2fs/f2fs.h              | 1 +
 fs/f2fs/super.c             | 2 +-
 include/trace/events/f2fs.h | 3 ++-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 73fcafbc8191..5469547142e7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1472,7 +1472,7 @@ static void f2fs_map_lock(struct f2fs_sb_info *sbi,
 {
 	f2fs_down_read(&sbi->cp_enable_rwsem);
 	if (flag == F2FS_GET_BLOCK_PRE_AIO)
-		f2fs_down_read(&sbi->node_change);
+		f2fs_down_read_trace(&sbi->node_change, lc);
 	else
 		f2fs_lock_op(sbi, lc);
 }
@@ -1482,7 +1482,7 @@ static void f2fs_map_unlock(struct f2fs_sb_info *sbi,
 				int flag)
 {
 	if (flag == F2FS_GET_BLOCK_PRE_AIO)
-		f2fs_up_read(&sbi->node_change);
+		f2fs_up_read_trace(&sbi->node_change, lc);
 	else
 		f2fs_unlock_op(sbi, lc);
 	f2fs_up_read(&sbi->cp_enable_rwsem);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 03f5eb7549a6..972cff745e63 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -176,6 +176,7 @@ enum device_allocation_policy {
 enum f2fs_lock_name {
 	LOCK_NAME_NONE,
 	LOCK_NAME_CP_RWSEM,
+	LOCK_NAME_NODE_CHANGE,
 };
 
 /*
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d60b91292c23..0d406fc8bc22 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4897,7 +4897,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	mutex_init(&sbi->writepages);
 	init_f2fs_rwsem(&sbi->cp_global_sem);
 	init_f2fs_rwsem(&sbi->node_write);
-	init_f2fs_rwsem(&sbi->node_change);
+	init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
 	spin_lock_init(&sbi->stat_lock);
 	init_f2fs_rwsem_trace(&sbi->cp_rwsem, sbi, LOCK_NAME_CP_RWSEM);
 	init_f2fs_rwsem(&sbi->cp_enable_rwsem);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index f4f13ddbe104..d472f47eedec 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -186,7 +186,8 @@ TRACE_DEFINE_ENUM(CP_PHASE_FINISH_CHECKPOINT);
 
 #define show_lock_name(lock)						\
 	__print_symbolic(lock,						\
-		{ LOCK_NAME_CP_RWSEM,		"cp_rwsem" })
+		{ LOCK_NAME_CP_RWSEM,		"cp_rwsem" },		\
+		{ LOCK_NAME_NODE_CHANGE,	"node_change" })
 
 struct f2fs_sb_info;
 struct f2fs_io_info;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
