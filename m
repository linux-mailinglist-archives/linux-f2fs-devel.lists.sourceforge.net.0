Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6893D5B6CDD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 14:12:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oY4mN-0006gC-BE;
	Tue, 13 Sep 2022 12:12:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oY4mI-0006g5-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 12:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRGLJL0B/G1QabQDi4HK4ZJuxNg5J5YnnwX/wtyN+8U=; b=HN772BJlJSPsySq6hynk/emnqz
 pSvEHicgtyC2+Y426wziwqnTdOxWmOpbdGXCrYrOcLzz2CsxWmOHtY3HiDXIXRCoBRYzwKQYV4eQ3
 KDtlNekBy9KcGfKuLaJK3oEchcglzJdykfU64b49Ncxnnwil642DhZoNTpTRfrWXbtt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YRGLJL0B/G1QabQDi4HK4ZJuxNg5J5YnnwX/wtyN+8U=; b=N
 3gSc8xIkTIAx/g+Ii9gOx3Q9jtU15rhBY9JZ3BrQ2K4RyK+60Km0jOvNwxQm/V4t4kfonUKqBcUu7
 T+M7KmZhwrbiOf6WkiwOdeerDnuN+Oi0kzUctUbqAjjVCDLy5EFePObQ5ng9svcSrBccTX4HrZSj3
 g56gXUnq9qgXWqfA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oY4mM-0004Xx-KC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 12:12:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D18BB80E18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Sep 2022 12:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06338C433C1;
 Tue, 13 Sep 2022 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663071151;
 bh=qOgEeJ85bQIt7yWcEMo99EDgH4gTo+DnTJhTzW7i/bc=;
 h=From:To:Cc:Subject:Date:From;
 b=pHNlOAzXgBw8omj32SRiyVyA1TGkTJkcc8pliGHTvLO0H3ntIbQ2F4wbfaQOzgZqu
 iNoz4/FgIxzcDl6Ymc+q5ij0V/Rw/a0wlzdSjXlhaRqiBOUL7HveeNWuPTiz16LQOj
 x4KWCKQbPWdGLeRL4ahCQLKHYc106S8yhSVakmz9fOEAGxFKBw7BfkhyQTy4/w0J7q
 H5L1/nOfy/I3tTvPftwxXaQ0EcthtOeAll6xlRQFhfn4tDBY9YYXgEFMZJAhzsX1Q3
 wAyNxnWSTVADMmbDdQmbSfXTyc7LFcFfzaI/ccQoU2S47RMKx3KlmuFkn1vxfJbnTw
 IHiS9kLzZm8Lw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Sep 2022 20:12:22 +0800
Message-Id: <20220913121222.2409464-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  SB_NEED_FSCK can be set once image may be corrupted, detect
 this flag and try to check/repair the image in auto/preen mode. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fsck/fsck.c | 8 ++++++++ fsck/mount.c | 13
 +++++++++++++ include/f2fs_fs.h | 5 ++++- 3 files changed, 25 insertions(+),
 1 deletion(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oY4mM-0004Xx-KC
Subject: [f2fs-dev] [RFC PATCH] fsck.f2fs: trigger fix if SB_NEED_FSCK is
 set in auto/preen mode
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

SB_NEED_FSCK can be set once image may be corrupted, detect this flag
and try to check/repair the image in auto/preen mode.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c       |  8 ++++++++
 fsck/mount.c      | 13 +++++++++++++
 include/f2fs_fs.h |  5 ++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index b1b6722..70678c0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3344,6 +3344,8 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	/* fix global metadata */
 	if (force || (c.fix_on && f2fs_dev_is_writable())) {
 		struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
+		struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+		unsigned short s_flags;
 
 		if (force || c.bug_on || c.bug_nat_bits || c.quota_fixed) {
 			/* flush nats to write_nit_bits below */
@@ -3359,6 +3361,12 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			is_set_ckpt_flags(cp, CP_QUOTA_NEED_FSCK_FLAG)) {
 			write_checkpoints(sbi);
 		}
+
+		s_flags = le16_to_cpu(sb->s_flags);
+		if (s_flags & SB_NEED_FSCK) {
+			sb->s_flags = cpu_to_le16(s_flags & ~SB_NEED_FSCK);
+			update_superblock(sb, SB_MASK_ALL);
+		}
 		/* to return FSCK_ERROR_CORRECTED */
 		ret = 0;
 	}
diff --git a/fsck/mount.c b/fsck/mount.c
index af24484..234955a 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -424,6 +424,7 @@ printout:
 	DISP_u32(sb, node_ino);
 	DISP_u32(sb, meta_ino);
 	DISP_u32(sb, cp_payload);
+	DISP_u16(sb, s_flags);
 	DISP_u32(sb, crc);
 	DISP("%-.252s", sb, version);
 	printf("\n");
@@ -583,6 +584,16 @@ void print_sb_state(struct f2fs_super_block *sb)
 	MSG(0, "\n");
 }
 
+void print_sb_flags(struct f2fs_super_block *sb)
+{
+	unsigned short f = le16_to_cpu(sb->s_flags);
+
+	MSG(0, "Info: superblock flags = %x : ", f);
+	if (f & SB_NEED_FSCK)
+		MSG(0, "%s", " need_fsck");
+	MSG(0, "\n");
+}
+
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
@@ -970,6 +981,7 @@ int validate_super_block(struct f2fs_sb_info *sbi, enum SB_ADDR sb_addr)
 		MSG(0, "Info: FSCK version\n  from \"%s\"\n    to \"%s\"\n",
 					c.sb_version, c.version);
 		print_sb_state(sbi->raw_super);
+		print_sb_flags(sbi->raw_super);
 		return 0;
 	}
 
@@ -1210,6 +1222,7 @@ static int f2fs_should_proceed(struct f2fs_super_block *sb, u32 flag)
 	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
 		if (flag & CP_FSCK_FLAG ||
 			flag & CP_QUOTA_NEED_FSCK_FLAG ||
+			get_sb(s_flags) & SB_NEED_FSCK ||
 			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
 			c.fix_on = 1;
 		} else if (!c.preen_mode) {
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 509d75a..ed93f9c 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -758,6 +758,8 @@ struct f2fs_device {
 
 static_assert(sizeof(struct f2fs_device) == 68, "");
 
+#define SB_NEED_FSCK			0x00000001	/* need fsck */
+
 struct f2fs_super_block {
 	__le32 magic;			/* Magic Number */
 	__le16 major_ver;		/* Major Version */
@@ -802,7 +804,8 @@ struct f2fs_super_block {
 	__u8 hot_ext_count;		/* # of hot file extension */
 	__le16  s_encoding;		/* Filename charset encoding */
 	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__le16 s_flags; 		/* super block flags */
+	__u8 reserved[304];		/* valid reserved region */
 	__le32 crc;			/* checksum of superblock */
 };
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
