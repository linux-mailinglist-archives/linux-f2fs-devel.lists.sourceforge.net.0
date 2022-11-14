Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA908628C39
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 23:41:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oui8h-0002cZ-DN;
	Mon, 14 Nov 2022 22:41:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oui8f-0002cT-TJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 22:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u1TP1bOeJfW8ySSSERQbzKR9CoL27WPc3Zj79tsNiEI=; b=HADd98fOoRV5QwthUlAvshv5SG
 /14Ddxq/RxdzYKsKxYoqyLha0lTehmwghQfUosGp/N6biSC2+79EVPtm0XSH2R/d/vpLgpVSFIPre
 JvCV/Vzii8sfAvIiQy2cFlJ93Kchq86X+p01HuQ4OY8FxQMQdtRC4pWSTbc2cmHqf+M4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u1TP1bOeJfW8ySSSERQbzKR9CoL27WPc3Zj79tsNiEI=; b=DHugbIefmwurmT5OExf+lSse4/
 tzZIqXm+rkeWVX68hMpwTZs8GElLowGIlQUXxuaCl6D0175udoOyDzTh7R+5w0nOFjLVSSd/3K+hF
 okZKPeQAPXrcLYCzpIgCz47BKUdB1vySKqjleiRS5gJeHLqHPxAVCdalSw5r1bp0tvmA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oui8e-008KsY-Tc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 22:41:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EEB1CCE12DD;
 Mon, 14 Nov 2022 22:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA41C433D6;
 Mon, 14 Nov 2022 22:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668465660;
 bh=olfR9Am7e7LihSTC4XZw+WKMvzuScYsqDi3z4isZ8eE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RLgE6+P0xmjtpw0a01T8mUa1s1gKiHvhkPy5+O/pgiZzvLkkcR3qQAqko/mCnkMUj
 DFWYHYX6FDFy5pK6+B3V6NhGSNEPkvWpPKu6Spg/SakteC7HaC2bslkBuzYmXMBXeR
 GzaUwL9/vgcARqPFGvU++jbC5NUFkgLaxxXVNiHy2pqJpSeacAcpAolFsMSyzKEUXl
 ohYx1m3xA3690+kVnH7myJp6TIgfQ6VEivI1k8vBEiRlV6nShkeGBnXSjSOfK9QfP7
 ZsPUmUQ6kUbtJawwN+nzoen1qOpujpB9CtKG9PllzzJGHRKDf5289ndLPZdy9VbFUx
 V+3BrPELzZj1w==
Date: Mon, 14 Nov 2022 14:40:58 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <Y3LD+s0SOf3ka5if@google.com>
References: <20221111100830.953733-1-shengyong@oppo.com>
 <20221111100830.953733-2-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111100830.953733-2-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since the file name has already passed to f2fs_new_inode(), 
 let's move set_file_temperature() into f2fs_new_inode(). Signed-off-by: Sheng
 Yong <shengyong@oppo.com> Reviewed-by: Chao Yu <chao@kernel.org>
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/namei.c | 62
 +++++++++++++++++++++++ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oui8e-008KsY-Tc
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: move set_file_temperature into
 f2fs_new_inode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since the file name has already passed to f2fs_new_inode(), let's
move set_file_temperature() into f2fs_new_inode().

Signed-off-by: Sheng Yong <shengyong@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/namei.c | 62 +++++++++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 43b721d8e491..88e406bb6780 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -173,6 +173,32 @@ static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
 	}
 }
 
+/*
+ * Set file's temperature for hot/cold data separation
+ */
+static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
+		const unsigned char *name)
+{
+	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
+	int i, cold_count, hot_count;
+
+	f2fs_down_read(&sbi->sb_lock);
+	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
+	hot_count = sbi->raw_super->hot_ext_count;
+	for (i = 0; i < cold_count + hot_count; i++)
+		if (is_extension_exist(name, extlist[i], true))
+			break;
+	f2fs_up_read(&sbi->sb_lock);
+
+	if (i == cold_count + hot_count)
+		return;
+
+	if (i < cold_count)
+		file_set_cold(inode);
+	else
+		file_set_hot(inode);
+}
+
 static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 						struct inode *dir, umode_t mode,
 						const char *name)
@@ -273,6 +299,9 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
 		set_inode_flag(inode, FI_INLINE_DATA);
 
+	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
+		set_file_temperature(sbi, inode, name);
+
 	stat_inc_inline_xattr(inode);
 	stat_inc_inline_inode(inode);
 	stat_inc_inline_dir(inode);
@@ -301,36 +330,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 	return ERR_PTR(err);
 }
 
-/*
- * Set file's temperature for hot/cold data separation
- */
-static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
-		const unsigned char *name)
-{
-	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
-	int i, cold_count, hot_count;
-
-	f2fs_down_read(&sbi->sb_lock);
-
-	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
-	hot_count = sbi->raw_super->hot_ext_count;
-
-	for (i = 0; i < cold_count + hot_count; i++) {
-		if (is_extension_exist(name, extlist[i], true))
-			break;
-	}
-
-	f2fs_up_read(&sbi->sb_lock);
-
-	if (i == cold_count + hot_count)
-		return;
-
-	if (i < cold_count)
-		file_set_cold(inode);
-	else
-		file_set_hot(inode);
-}
-
 static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 		       struct dentry *dentry, umode_t mode, bool excl)
 {
@@ -352,9 +351,6 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
-	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
-		set_file_temperature(sbi, inode, dentry->d_name.name);
-
 	inode->i_op = &f2fs_file_inode_operations;
 	inode->i_fop = &f2fs_file_operations;
 	inode->i_mapping->a_ops = &f2fs_dblock_aops;
-- 
2.38.1.493.g58b659f92b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
