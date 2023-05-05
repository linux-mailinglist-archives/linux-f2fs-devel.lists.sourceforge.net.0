Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2ED6F8080
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 12:02:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pusGx-0004Ms-EX;
	Fri, 05 May 2023 10:02:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pusGv-0004Mk-Jz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qY34rgbDrGVCDbTKJ3zE1V+AxjZ8M1zbP7ilag6p89k=; b=j4CPALWKjAC+b38aVIBVNdfIML
 FRRp9CrxxQF8e3jrYGblQnjONYWWlWFhiL+q8FtIOwAl6YxYIJFhgeIJ7LuO6DSvgnb1br8VN3QzA
 znTe7lxdlowDsbinsRDx4X+uAhmghfyqzpZg2cisDcK/nlejyf1UpbA3PsNqrnD7qvrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qY34rgbDrGVCDbTKJ3zE1V+AxjZ8M1zbP7ilag6p89k=; b=e59n2YyzXPGfG6dd3BIsk8QVss
 tXy24P76jaK//PGyGWUnllVCMGg97Mrj8DlArjiw9CkPvva420hySOtYooS85/ngWlddOBYN6FyXf
 F2O7iaEVAMPnSmOqmScA030QQWs6pFYLW/6Tw70ua9MMxbVU1d9uXEZz0akW1JWD3jO8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pusGq-0007k9-BL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 10:02:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE8E763CFF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 10:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BAFC433D2;
 Fri,  5 May 2023 10:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683280950;
 bh=QFVk5Uiw/jMz9GfXgLtpnNnEncbAij3NbR0ptx866nU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s0/gC8MtMfGO/MdzsxK0xFfUiWiFYLivW/bQRYLnOLj22gPMxcxULZ5aiXUYCSTas
 INti+yjxHvzvCV791PJEDe1BWw6zkYuCAhKGAkwbYraRhbo7UTNDDFFPv0Za2uAZ4X
 TweIuiVres/91l1bNikX+xyl151+ubQ3YekEXKbmqW+A9xhCrcIW11aIS6yHxQ0Gts
 MchE3vbGzZrdjbvU6kBDaXkcvf8a97P24Da70sX6JuZAccSPRbd2QvZmJzv+fHjNvy
 85YS+D0YdCieUCh3mRdKB4MPhSusx4zftCtO5BBU8o9Y8kt4PiPhn8zpmtmBKlfqK7
 sQsp5LDbOCJFw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  5 May 2023 18:02:04 +0800
Message-Id: <20230505100205.1921708-5-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230505100205.1921708-1-chao@kernel.org>
References: <20230505100205.1921708-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Output is as below: magic [0xf2f52010 : 4076150800] major_ver
 [0x 1 : 1] minor_ver [0x 10 : 16] log_sectorsize [0x 9 : 9]
 log_sectors_per_block
 [0x 3 : 3] log_blocksize [0x c : 12] log_blocks_per_seg [0x 9 : 9] segs_per_
 [...] Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pusGq-0007k9-BL
Subject: [f2fs-dev] [PATCH 5/6] f2fs-tools: print more raw sb info
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

Output is as below:

magic                         		[0xf2f52010 : 4076150800]
major_ver                     		[0x       1 : 1]
minor_ver                     		[0x      10 : 16]
log_sectorsize                		[0x       9 : 9]
log_sectors_per_block         		[0x       3 : 3]
log_blocksize                 		[0x       c : 12]
log_blocks_per_seg            		[0x       9 : 9]
segs_per_sec                  		[0x       1 : 1]
secs_per_zone                 		[0x       1 : 1]
checksum_offset               		[0x       0 : 0]
block_count                   		[0x  300000 : 3145728]
section_count                 		[0x    17d3 : 6099]
segment_count                 		[0x    17ff : 6143]
segment_count_ckpt            		[0x       2 : 2]
segment_count_sit             		[0x       2 : 2]
segment_count_nat             		[0x      1c : 28]
segment_count_ssa             		[0x       c : 12]
segment_count_main            		[0x    17d3 : 6099]
segment0_blkaddr              		[0x     200 : 512]
cp_blkaddr                    		[0x     200 : 512]
sit_blkaddr                   		[0x     600 : 1536]
nat_blkaddr                   		[0x     a00 : 2560]
ssa_blkaddr                   		[0x    4200 : 16896]
main_blkaddr                  		[0x    5a00 : 23040]
root_ino                      		[0x       3 : 3]
node_ino                      		[0x       1 : 1]
meta_ino                      		[0x       2 : 2]
uuid                          		[f16856a6-8781-422b-adce-d51c0632c94e]
volum_name                    		[]
extension_count               		[0x      24 : 36]
cold file extentsions
                              		[mp      wm      og      jp      ]
                              		[avi     m4v     m4p     mkv     ]
                              		[mov     webm    wav     m4a     ]
                              		[3gp     opus    flac    gif     ]
                              		[png     svg     webp    jar     ]
                              		[deb     iso     gz      xz      ]
                              		[zst     pdf     pyc     ttc     ]
                              		[ttf     exe     apk     cnt     ]
                              		[exo     odex    vdex    so      ]
hot_ext_count                 		[0x       4 : 4]
hot file extentsions
                              		[db      vmdk    vdi     qcow2   ]
cp_payload                    		[0x       0 : 0]
version                       		[Linux version 6.3.0+ (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #143 SMP PREEMPT_DYNAMIC Thu May  4 09:50:08 HKT 2023]
init_version                  		[Linux version 6.3.0+ (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #143 SMP PREEMPT_DYNAMIC Thu May  4 09:50:08 HKT 2023]
feature                       		[0x    21f8 : 8696]
encryption_level              		[0x       0 : 0]
encrypt_pw_salt               		[00000000-0000-0000-0000-000000000000]
qf_ino[USRQUOTA]              		[0x       4 : 4]
qf_ino[GRPQUOTA]              		[0x       5 : 5]
qf_ino[PRJQUOTA]              		[0x       6 : 6]
s_encoding                    		[0x       0 : 0]
crc                           		[0x       0 : 0]

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c       | 105 +++++++++++++++++++++++++++++++++++++++++++--
 include/f2fs_fs.h  |  19 ++++++++
 mkfs/f2fs_format.c |   1 +
 3 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 5e475a3..93ad806 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -11,6 +11,7 @@
 #include "fsck.h"
 #include "node.h"
 #include "xattr.h"
+#include "quota.h"
 #include <locale.h>
 #include <stdbool.h>
 #include <time.h>
@@ -20,6 +21,9 @@
 #ifdef HAVE_SYS_ACL_H
 #include <sys/acl.h>
 #endif
+#ifdef HAVE_UUID_UUID_H
+#include <uuid/uuid.h>
+#endif
 
 #ifndef ACL_UNDEFINED_TAG
 #define ACL_UNDEFINED_TAG	(0x00)
@@ -365,6 +369,40 @@ void print_node_info(struct f2fs_sb_info *sbi,
 	}
 }
 
+void print_extention_list(struct f2fs_super_block *sb, int cold)
+{
+	int start, end, i;
+
+	if (cold) {
+		DISP_u32(sb, extension_count);
+
+		start = 0;
+		end = le32_to_cpu(sb->extension_count);
+	} else {
+		DISP_u8(sb, hot_ext_count);
+
+		start = le32_to_cpu(sb->extension_count);
+		end = start + sb->hot_ext_count;
+	}
+
+	printf("%s file extentsions\n", cold ? "cold" : "hot");
+
+	for (i = start; i < end; i++) {
+		if (c.layout) {
+			printf("%-30s %-8.8s\n", "extension_list",
+						sb->extension_list[i]);
+		} else {
+			if (i % 4 == 0)
+				printf("%-30s\t\t[", "");
+
+			printf("%-8.8s", sb->extension_list[i]);
+
+			if (i % 4 == 4 - 1 || i == end - start - 1)
+				printf("]\n");
+		}
+	}
+}
+
 static void DISP_label(uint16_t *name)
 {
 	char buffer[MAX_VOLUME_NAME];
@@ -376,8 +414,14 @@ static void DISP_label(uint16_t *name)
 		printf("%-30s" "\t\t[%s]\n", "volum_name", buffer);
 }
 
+void print_sb_debug_info(struct f2fs_super_block *sb);
 void print_raw_sb_info(struct f2fs_super_block *sb)
 {
+#ifdef HAVE_LIBUUID
+	char uuid[40];
+	char encrypt_pw_salt[40];
+#endif
+
 	if (c.layout)
 		goto printout;
 	if (!c.dbg_lv)
@@ -391,8 +435,6 @@ printout:
 	DISP_u32(sb, magic);
 	DISP_u32(sb, major_ver);
 
-	DISP_label(sb->volume_name);
-
 	DISP_u32(sb, minor_ver);
 	DISP_u32(sb, log_sectorsize);
 	DISP_u32(sb, log_sectors_per_block);
@@ -423,9 +465,39 @@ printout:
 	DISP_u32(sb, root_ino);
 	DISP_u32(sb, node_ino);
 	DISP_u32(sb, meta_ino);
+
+#ifdef HAVE_LIBUUID
+	uuid_unparse(sb->uuid, uuid);
+	DISP_raw_str("%-.36s", uuid);
+#endif
+
+	DISP_label(sb->volume_name);
+
+	print_extention_list(sb, 1);
+	print_extention_list(sb, 0);
+
 	DISP_u32(sb, cp_payload);
+
+	DISP_str("%-.252s", sb, version);
+	DISP_str("%-.252s", sb, init_version);
+
+	DISP_u32(sb, feature);
+	DISP_u8(sb, encryption_level);
+
+#ifdef HAVE_LIBUUID
+	uuid_unparse(sb->encrypt_pw_salt, encrypt_pw_salt);
+	DISP_raw_str("%-.36s", encrypt_pw_salt);
+#endif
+
+	DISP_u32(sb, qf_ino[USRQUOTA]);
+	DISP_u32(sb, qf_ino[GRPQUOTA]);
+	DISP_u32(sb, qf_ino[PRJQUOTA]);
+
+	DISP_u16(sb, s_encoding);
 	DISP_u32(sb, crc);
-	DISP("%-.252s", sb, version);
+
+	print_sb_debug_info(sb);
+
 	printf("\n");
 }
 
@@ -647,6 +719,33 @@ void print_sb_errors(struct f2fs_super_block *sb)
 	MSG(0, "\n");
 }
 
+void print_sb_debug_info(struct f2fs_super_block *sb)
+{
+	u8 *reason = sb->s_stop_reason;
+	u8 *errors = sb->s_errors;
+	int i;
+
+	for (i = 0; i < STOP_CP_REASON_MAX; i++) {
+		if (!reason[i])
+			continue;
+		if (c.layout)
+			printf("%-30s %s(%s, %d)\n", "", "stop_reason",
+				stop_reason_str[i], reason[i]);
+		else
+			printf("%-30s\t\t[%-20s : %u]\n", "",
+				stop_reason_str[i], reason[i]);
+	}
+
+	for (i = 0; i < ERROR_MAX; i++) {
+		if (!test_bit_le(i, errors))
+			continue;
+		if (c.layout)
+			printf("%-30s %s(%s)\n", "", "errors", errors_str[i]);
+		else
+			printf("%-30s\t\t[%-20s]\n", "", errors_str[i]);
+	}
+}
+
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index e5d5d13..4accade 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -282,6 +282,25 @@ static inline uint64_t bswap_64(uint64_t val)
 		printf("%-30s" fmt, #member, ((ptr)->member));	\
 	} while (0)
 
+#define DISP_raw_str(fmt, member)					\
+	do {								\
+		if (c.layout)						\
+			printf("%-30s " fmt "\n", #member":", member);	\
+		else							\
+			printf("%-30s" "\t\t[" fmt "]\n",		\
+			#member, member);				\
+	} while (0)
+
+#define DISP_str(fmt, ptr, member)					\
+	do {								\
+		if (c.layout)						\
+			printf("%-30s " fmt "\n",			\
+			#member":", ((ptr)->member));			\
+		else							\
+			printf("%-30s" "\t\t[" fmt "]\n",		\
+			#member, ((ptr)->member));			\
+	} while (0)
+
 #define DISP_u8(ptr, member)						\
 	do {								\
 		assert(sizeof((ptr)->member) == 1);			\
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index e8c9675..666af45 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -29,6 +29,7 @@
 #ifndef HAVE_LIBUUID
 #define uuid_parse(a, b) -1
 #define uuid_generate(a)
+#define uuid_unparse(a, b) -1
 #endif
 
 #include "quota.h"
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
