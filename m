Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACB52273DF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 02:39:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxgJ9-0001xm-3Y; Tue, 21 Jul 2020 00:38:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jxgJ6-0001xU-Ub
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fHU7VA/wPSNoLmG5H7gikP92BMekn7GQDju2dXqxwiM=; b=OrLhn+ovUXTZB0tqNpu6Q7HawL
 0ncC5EZaNu9MezIJrH1G6ZsiJmbqAImnq8HtT2igMxceM43Q5kZcJEILDUEuQQ6ZzX/kx/eeMkOde
 y7BvHr5NjMcJWbgTpG8FIywgtfS5CYvdytYr09JRgK0aVJE2QBvqnU0qcrrdJcIllzCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fHU7VA/wPSNoLmG5H7gikP92BMekn7GQDju2dXqxwiM=; b=GxfV2AbWHUSBrH6Vwd+9aP8GUP
 uBCxOw+QNtWORWKXL/we72p+r/yEf2GvaRV2QA3wlme06JFro0EGM/9c42cbHNiZ8UGZ5JtVV0cfw
 jkoqcwyoACs19SKVliWmHxuZROTBctK0fAupi/3ZHQsdzroT+X+AVmoZSXHpoFTrhVzQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jxgJ5-002Hc7-SG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Jul 2020 00:38:56 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85F2422BF3;
 Tue, 21 Jul 2020 00:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595291917;
 bh=HF6DCjx8VaTCJvzrMIJoKhfL8ZtCe+CY/bxHsAIyt9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0o3eNHT2WXs9Fp4orlSRqzSTDb/rBokNmoxfJRUfJd6WxonODLCz8KX25Fa/wZVSk
 Aw3OFdZOWQ3jWCoMa8nufBhN1ij3OfGpc4n/aA6IDqzqanWoB1EXA/0dh+zvzXLAgA
 7Dp8h8G2O0nf7OEgNo82eOK/rKFObipIGKnsrWJ8=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 20 Jul 2020 17:38:34 -0700
Message-Id: <20200721003834.2754992-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
In-Reply-To: <20200721003834.2754992-1-jaegeuk@kernel.org>
References: <20200721003834.2754992-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jxgJ5-002Hc7-SG
Subject: [f2fs-dev] [PATCH 3/3] mkfs.f2fs: add casefolding and project quota
 config
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This can be used for Android build support.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h       |  1 +
 lib/libf2fs.c           | 11 +++++++++++
 mkfs/f2fs_format_main.c | 14 ++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index c38a60c..71d1c57 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1563,6 +1563,7 @@ extern const struct f2fs_nls_table *f2fs_load_nls_table(int encoding);
 #define F2FS_ENC_UTF8_12_0	1
 
 extern int f2fs_str2encoding(const char *string);
+extern char *f2fs_encoding2str(const int encoding);
 extern int f2fs_get_encoding_flags(int encoding);
 extern int f2fs_str2encoding_flags(char **param, __u16 *flags);
 
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 5937076..55fa391 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1306,6 +1306,17 @@ int f2fs_str2encoding(const char *string)
 	return -EINVAL;
 }
 
+char *f2fs_encoding2str(const int encoding)
+{
+	int i;
+
+	for (i = 0 ; i < ARRAY_SIZE(f2fs_encoding_map); i++)
+		if (f2fs_encoding_map[i].encoding_magic == encoding)
+			return f2fs_encoding_map[i].name;
+
+	return NULL;
+}
+
 int f2fs_get_encoding_flags(int encoding)
 {
 	int i;
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 7176db1..27c1f1d 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -90,6 +90,12 @@ static void f2fs_show_info()
 
 	if (c.defset == CONF_ANDROID)
 		MSG(0, "Info: Set conf for android\n");
+
+	if (c.feature & le32_to_cpu(F2FS_FEATURE_CASEFOLD))
+		MSG(0, "Info: Enable %s with casefolding\n",
+					f2fs_encoding2str(c.s_encoding));
+	if (c.feature & le32_to_cpu(F2FS_FEATURE_PRJQUOTA))
+		MSG(0, "Info: Enable Project quota\n");
 }
 
 static void add_default_options(void)
@@ -106,6 +112,14 @@ static void add_default_options(void)
 		c.root_uid = c.root_gid = 0;
 		break;
 	}
+#ifdef CONF_CASEFOLD
+	c.s_encoding = F2FS_ENC_UTF8_12_1;
+	c.feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
+#endif
+#ifdef CONF_PROJID
+	c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
+	c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
+#endif
 }
 
 static void f2fs_parse_options(int argc, char *argv[])
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
