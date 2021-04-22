Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA79368434
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 17:50:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZbac-00040m-Eb; Thu, 22 Apr 2021 15:50:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lZbab-000407-BU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 15:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1VnTNLS9EVdWhlRGs4kWqZzI6Aue2Iuvk9f2hTRdOqc=; b=T+7AEaHIQrOH8JC6uiejX+5W6Y
 s9/NZCWDOXgNFiFVCJWcSFL7sv/tl/V0P80w/dVujXDoKxksO7h76e2yiMBwqhEeau6gGgdPsn1AA
 lb1pjt57XkrZS9pFTaCS71dzMSXss/mMdiAtHAbsps3rsIjt4hjo8hh5t2EmXmDzh2pU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1VnTNLS9EVdWhlRGs4kWqZzI6Aue2Iuvk9f2hTRdOqc=; b=G
 Cvjt+xrRKYq1hM8dfrXa8a9R8YbBy5TtzSvbOwxAzMt6kY4YlDdl7+jcjtVlMX7NRtBB0emB9E6DM
 /ZkTJBbmKWyUFR9UK1kEyxhQjJK5RbVvYolHe2oGuqoEU6BY0hCFt4IOD+ZAdIADFg25a8gszH4hd
 fy/Fgg/91luYbwSk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lZbaR-00DIYc-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 15:50:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42571613CC;
 Thu, 22 Apr 2021 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619106580;
 bh=owpsSSv2dlZ1J2zznW/th04izdGetBVHrfEY0WIu2Wo=;
 h=From:To:Cc:Subject:Date:From;
 b=lTq4IbtM0JA8IHUv/pcs4hvbnFxhy+Eu0+TDCKFkRjCzclj1CgVggu3zo6LDDGeVl
 Bi7G7urCtsRFXWxNJil1RtEnN6XvB8p63HWVOlNciQTxd613+brHZQraHtYRqmI0RE
 IwFrRbG5o+v6e2Z9bNoyCK0SXkQRnLoVzGNiJnwttI11AJ/G93t8rpT1aI9diN59GU
 J7Bc6WSP29BZM23ZNEODMB2p0Pv61jOYVD2+Yo+TtaKRAGydN40apij3iwtP/kBTmd
 Ztew5Pc/bCstpSGOjjuM2iaY4xjx8KBSC6ObttCwNkBw9vJpIpFwuzF5sY3UFttTut
 tpzm4RxLwwVKw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 22 Apr 2021 08:49:31 -0700
Message-Id: <20210422154931.3947668-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lZbaR-00DIYc-Hk
Subject: [f2fs-dev] [PATCH] f2fs_io: Add get file name encryption mode
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
Cc: Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Robin Hsu <robinhsu@google.com>

This patch add an ioctl to get filename encryption mode.

Signed-off-by: Robin Hsu <robinhsu@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
 tools/f2fs_io/f2fs_io.c | 63 +++++++++++++++++++++++++++++++++++++++++
 tools/f2fs_io/f2fs_io.h | 36 +++++++++++++++++++++++
 2 files changed, 99 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 033c256d14d1..fa7d3f5e4b36 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -1096,6 +1096,68 @@ static void do_compress(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define get_filename_encrypt_mode_desc "get file name encrypt mode"
+#define get_filename_encrypt_mode_help					\
+"f2fs_io filename_encrypt_mode [file or directory path]\n\n"		\
+"Get the file name encription mode of the given file/directory.\n"	\
+
+static void do_get_filename_encrypt_mode (int argc, char **argv,
+						const struct cmd_desc *cmd)
+{
+	static const char *enc_name[] = {
+		"invalid", /* FS_ENCRYPTION_MODE_INVALID (0) */
+		"aes-256-xts", /* FS_ENCRYPTION_MODE_AES_256_XTS (1) */
+		"aes-256-gcm", /* FS_ENCRYPTION_MODE_AES_256_GCM (2) */
+		"aes-256-cbc", /* FS_ENCRYPTION_MODE_AES_256_CBC (3) */
+		"aes-256-cts", /* FS_ENCRYPTION_MODE_AES_256_CTS (4) */
+		"aes-128-cbc", /* FS_ENCRYPTION_MODE_AES_128_CBC (5) */
+		"aes-128-cts", /* FS_ENCRYPTION_MODE_AES_128_CTS (6) */
+		"speck128-256-xts", /* FS_ENCRYPTION_MODE_SPECK128_256_XTS (7) */
+		"speck128-256-cts", /* FS_ENCRYPTION_MODE_SPECK128_256_CTS (8) */
+		"adiantum", /* FS_ENCRYPTION_MODE_ADIANTUM (9) */
+	};
+	int fd, mode, ret;
+	struct fscrypt_get_policy_ex_arg arg;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_RDONLY, 0);
+	arg.policy_size = sizeof(arg.policy);
+	ret = ioctl(fd, FS_IOC_GET_ENCRYPTION_POLICY_EX, &arg);
+	if (ret != 0 && errno == ENOTTY)
+		ret = ioctl(fd, FS_IOC_GET_ENCRYPTION_POLICY, arg.policy.v1);
+	close(fd);
+
+	if (ret) {
+		perror("FS_IOC_GET_ENCRYPTION_POLICY|_EX");
+		exit(1);
+	}
+
+	switch (arg.policy.version) {
+	case FSCRYPT_POLICY_V1:
+		mode = arg.policy.v1.filenames_encryption_mode;
+		break;
+	case FSCRYPT_POLICY_V2:
+		mode = arg.policy.v2.filenames_encryption_mode;
+		break;
+	default:
+		printf("Do not support policy version: %d\n",
+							arg.policy.version);
+		exit(1);
+	}
+
+	if (mode >= sizeof(enc_name)/sizeof(enc_name[0])) {
+		printf("Do not support algorithm: %d\n", mode);
+		exit(1);
+	}
+	printf ("%s\n", enc_name[mode]);
+	exit(0);
+}
+
 #define CMD_HIDDEN 	0x0001
 #define CMD(name) { #name, do_##name, name##_desc, name##_help, 0 }
 #define _CMD(name) { #name, do_##name, NULL, NULL, CMD_HIDDEN }
@@ -1125,6 +1187,7 @@ const struct cmd_desc cmd_list[] = {
 	CMD(set_coption),
 	CMD(decompress),
 	CMD(compress),
+	CMD(get_filename_encrypt_mode),
 	{ NULL, NULL, NULL, NULL, 0 }
 };
 
diff --git a/tools/f2fs_io/f2fs_io.h b/tools/f2fs_io/f2fs_io.h
index d53e5765c538..3a0278fd6ddf 100644
--- a/tools/f2fs_io/f2fs_io.h
+++ b/tools/f2fs_io/f2fs_io.h
@@ -91,6 +91,42 @@ typedef u32	__be32;
 #define F2FS_IOC_DECOMPRESS_FILE        _IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE          _IO(F2FS_IOCTL_MAGIC, 24)
 
+#ifndef FS_IOC_GET_ENCRYPTION_POLICY
+#define FSCRYPT_POLICY_V1		0
+#define FSCRYPT_KEY_DESCRIPTOR_SIZE	8
+struct fscrypt_policy_v1 {
+	__u8 version;
+	__u8 contents_encryption_mode;
+	__u8 filenames_encryption_mode;
+	__u8 flags;
+	__u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
+};
+#define FS_IOC_GET_ENCRYPTION_POLICY		_IOW('f', 21, struct fscrypt_policy_v1)
+#endif
+
+#ifndef FS_IOC_GET_ENCRYPTION_POLICY_EX
+#define FSCRYPT_POLICY_V2		2
+#define FSCRYPT_KEY_IDENTIFIER_SIZE	16
+struct fscrypt_policy_v2 {
+	__u8 version;
+	__u8 contents_encryption_mode;
+	__u8 filenames_encryption_mode;
+	__u8 flags;
+	__u8 __reserved[4];
+	__u8 master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
+};
+/* Struct passed to FS_IOC_GET_ENCRYPTION_POLICY_EX */
+struct fscrypt_get_policy_ex_arg {
+	__u64 policy_size; /* input/output */
+	union {
+		__u8 version;
+		struct fscrypt_policy_v1 v1;
+		struct fscrypt_policy_v2 v2;
+	} policy; /* output */
+};
+#define FS_IOC_GET_ENCRYPTION_POLICY_EX		_IOWR('f', 22, __u8[9]) /* size + version */
+#endif
+
 #define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_PWSALT	FS_IOC_GET_ENCRYPTION_PWSALT
-- 
2.31.1.368.gbe11c130af-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
