Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 642177062C8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 10:27:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzCV6-0003fs-RN;
	Wed, 17 May 2023 08:27:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pzCV0-0003fl-SO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 08:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nZRmxI1AVmtsviVxaSVAXCPMxw+5Ch/7OmwEtYKL5Zo=; b=fhUyjvt1CLP9qBHXbUN0/dQad2
 k+k2NyfkcuYhONmYpjvMqg9stowMZXXX8cJlzWGWYaKN3SgetNumZIHqhbHNpz+1xzzUmkFGiq6Tq
 OGhBHt7hawMfELc3yq/CNAhST2OHMjriDRUnY3d5yKfB1lLj8inC1U0LSS8U0w7S6Bqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nZRmxI1AVmtsviVxaSVAXCPMxw+5Ch/7OmwEtYKL5Zo=; b=m
 KqVrk3udH3PLs1cEsV25yV88vS3wPeoWQoxHBmdTT8qhSATA74Lgq6UVdGA5sjv/sJZQtDxADmPwy
 nrL1EuhCMJrAcgi9S5YDNr0zgf4WnHCeyYBKCxRp7Hpj6Xmmh19bMU8BcH6MYj+yvpYY/V2N1pFL9
 Cr4OStG9jU49U0Cw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzCUu-0000y7-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 08:27:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8F68C64392
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 May 2023 08:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1694EC433D2;
 Wed, 17 May 2023 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684312015;
 bh=nhs9XZt9TE1JZayFKciVfCHV26Yeb2iIfKqqNkCp2+g=;
 h=From:To:Cc:Subject:Date:From;
 b=fGWOqAVvQ8SsfZOZ8ak97rQCASkAFoCh6Tspd5YiJrW/D3CWidb+vLyObeWc+dBqn
 653lbCOBgOj2mxCK5V5f/+NVn26eXQfwkTzE7VfiVtErQ8LCOCR3Bd1l4fC18KpsEx
 TY5h6KrItQv+9UgrRspRuNwp3sumg8UuDnT2b70VtsQ3pfJ7Lq7LFglSezb+N8hooM
 bI+oNQlAYuxoNStU1FUuSUWVdbEeQJewhvd8sLDtOY+WrhlQCgp6vMRAf9LdVu/HlN
 dwanLfYo2JrU46j//iOAKAQNg4qRQrtPzcxkbS9Hv0rEPKuI8+yp0op2X0sx7ogTrv
 AKXfAce8yzd0g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 17 May 2023 16:26:29 +0800
Message-Id: <20230517082632.748914-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Disk quota file is controlled by filesystem quota subsystem, 
 access time of quota file is almost random, and should be meanless to user,
 so let's add noatime to quota file. Meanwhile,
 set quota file w/ F2FS_IMMUTABLE_FL
 instead of FS_IMMUTABLE_FL, since F2FS_IMMUTABLE_FL is on-disk flag, however
 FS_IMMUTABLE_FL is in-memory one. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzCUu-0000y7-Uj
Subject: [f2fs-dev] [PATCH 1/4] f2fs-tools: add noatime for quota file
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Disk quota file is controlled by filesystem quota subsystem, access time
of quota file is almost random, and should be meanless to user, so let's
add noatime to quota file.

Meanwhile, set quota file w/ F2FS_IMMUTABLE_FL instead of FS_IMMUTABLE_FL,
since F2FS_IMMUTABLE_FL is on-disk flag, however FS_IMMUTABLE_FL is in-memory
one.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/node.c             | 2 +-
 include/f2fs_fs.h       | 7 ++++++-
 mkfs/f2fs_format.c      | 2 +-
 tools/f2fs_io/f2fs_io.h | 4 ++++
 4 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/fsck/node.c b/fsck/node.c
index 9ce8a72..4dc7890 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -62,7 +62,7 @@ int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype)
 
 	raw_node->i.i_size = cpu_to_le64(1024 * 6);
 	raw_node->i.i_blocks = cpu_to_le64(1);
-	raw_node->i.i_flags = FS_IMMUTABLE_FL;
+	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
 
 	if (is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
 		cp_ver |= (cur_cp_crc(ckpt) << 32);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 936a5d8..8475645 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -750,7 +750,12 @@ enum {
 #define QUOTA_DATA(i)		(2)
 #define QUOTA_INO(sb,t)	(le32_to_cpu((sb)->qf_ino[t]))
 
-#define FS_IMMUTABLE_FL		0x00000010 /* Immutable file */
+/*
+ * On-disk inode flags (f2fs_inode::i_flags)
+ */
+#define F2FS_IMMUTABLE_FL		0x00000010 /* Immutable file */
+#define F2FS_NOATIME_FL			0x00000080 /* do not update atime */
+
 
 #define F2FS_ENC_UTF8_12_1	1
 #define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index ef5d9a6..df6bde2 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1364,7 +1364,7 @@ static int f2fs_write_qf_inode(int qtype, int offset)
 
 	raw_node->i.i_size = cpu_to_le64(1024 * 6);
 	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
-	raw_node->i.i_flags = FS_IMMUTABLE_FL;
+	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
 
 	raw_node->footer.next_blkaddr = cpu_to_le32(
 			get_sb(main_blkaddr) +
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index 58be8f8..b4aa9cf 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -167,6 +167,10 @@ struct fscrypt_get_policy_ex_arg {
 #define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
 #define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
 
+#ifndef FS_IMMUTABLE_FL
+#define FS_IMMUTABLE_FL			0x00000010 /* Immutable file */
+#endif
+
 #ifndef FS_ENCRYPT_FL
 #define FS_ENCRYPT_FL			0x00000800 /* Encrypted file */
 #endif
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
