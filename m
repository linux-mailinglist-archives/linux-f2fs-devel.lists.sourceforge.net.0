Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F905EB7E2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Sep 2022 04:45:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1od0al-0001wK-Aa;
	Tue, 27 Sep 2022 02:45:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1od0ak-0001wD-1x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Sep 2022 02:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UgwFTGMK/bSS9pQXMoXXA+KxIXlRrFHZChMxraYOr4E=; b=Q2iF4SW4Xaep8B/4FvtnlKtVkD
 nnM9jMh0b3d7muGfPycZyzqtYsfyQ98EQnUEHabNfHazUSBY7Fz7+m2o1u2W+AsCxA2RxSU82A2LM
 MZ3rWzfiQApD7VytEor6wZEzKMvKPjgrwnaGxOZWgtTbIEh0fC96TJHEH9S7vQuCpNis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UgwFTGMK/bSS9pQXMoXXA+KxIXlRrFHZChMxraYOr4E=; b=a
 7v9uB0a8hLbWfBcogVgDCMSdyxTaqq+8s4LFptM5Z1ReqUkFygqqPtonMnIlZ1bj3uNtJ6tjB7+b+
 1F5cc/ikfhCoGPlgoo49t4TmXCcLq7DFcjO8ieDwvsc/LKHRhf7452FZG85lidAyrFlbGvZEz4+3M
 DOUWb/IP9dYzFa8A=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1od0as-0041xL-AC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Sep 2022 02:45:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4987DB81902
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Sep 2022 02:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D85EC433C1;
 Tue, 27 Sep 2022 02:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664246698;
 bh=aPhM8cKTA6dQyU1256UxQ8auvOKzd7pI92C/A1V002w=;
 h=From:To:Cc:Subject:Date:From;
 b=gROzKsyyApUtzhal/gNoSsvkKuujY+kBdBam7IqAejbwerNBpTgYvEnrEDjUfmEoS
 CRMStTLNKnrCiV5Uj+wLtUhoHla+01DcXbX03OC+ZSIPzLT9J/AJuQc2y5vsqmeWq+
 nY5TC7CkhV+UWai7etPhigeXGJTBlAXhoFoSfcocgjfL/8nqstAXiz9KJz1ZMK0EY/
 omGgkLTQkcDdAL+jBTYFsqMwPuwmn9953vW1r9sxB0gv7Xs94a5nXvL6W0UTu222TE
 nhUy/bidsVYermqW9gwLxLyYuc4DaIS584R7P+zQLG1G/t3nCfnlNXQStK+DQPQnAM
 /fUhK/U28wMPQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 27 Sep 2022 10:44:47 +0800
Message-Id: <20220927024447.2547950-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds a new sysfs entry named cp_status, it can
 output checkpoint flags in real time. Signed-off-by: Chao Yu <chao@kernel.org>
 --- Documentation/ABI/testing/sysfs-fs-f2fs | 24 ++++++++++++++++++++++++
 fs/f2fs/sysfs.c | 8 ++++++++ 2 files changed, 32 insertions(+) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1od0as-0041xL-AC
Subject: [f2fs-dev] [PATCH] f2fs: introduce cp_status sysfs entry
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

This patch adds a new sysfs entry named cp_status, it can output
checkpoint flags in real time.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 24 ++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  8 ++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 083ac2d63eef..483639fb727b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -466,6 +466,30 @@ Description:	Show status of f2fs superblock in real time.
 		0x4000 SBI_IS_FREEZING       freefs is in process
 		====== ===================== =================================
 
+What:		/sys/fs/f2fs/<disk>/stat/cp_status
+Date:		September 2022
+Contact:	"Chao Yu" <chao.yu@oppo.com>
+Description:	Show status of f2fs checkpoint in real time.
+
+		=============================== ==============================
+		cp flag				value
+		CP_UMOUNT_FLAG			0x00000001
+		CP_ORPHAN_PRESENT_FLAG		0x00000002
+		CP_COMPACT_SUM_FLAG		0x00000004
+		CP_ERROR_FLAG			0x00000008
+		CP_FSCK_FLAG			0x00000010
+		CP_FASTBOOT_FLAG		0x00000020
+		CP_CRC_RECOVERY_FLAG		0x00000040
+		CP_NAT_BITS_FLAG		0x00000080
+		CP_TRIMMED_FLAG			0x00000100
+		CP_NOCRC_RECOVERY_FLAG		0x00000200
+		CP_LARGE_NAT_BITMAP_FLAG	0x00000400
+		CP_QUOTA_NEED_FSCK_FLAG		0x00000800
+		CP_DISABLED_FLAG		0x00001000
+		CP_DISABLED_QUICK_FLAG		0x00002000
+		CP_RESIZEFS_FLAG		0x00004000
+		=============================== ==============================
+
 What:		/sys/fs/f2fs/<disk>/ckpt_thread_ioprio
 Date:		January 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 39ebf0ad133a..df27afd71ef4 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -128,6 +128,12 @@ static ssize_t sb_status_show(struct f2fs_attr *a,
 	return sprintf(buf, "%lx\n", sbi->s_flag);
 }
 
+static ssize_t cp_status_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%x\n", le32_to_cpu(F2FS_CKPT(sbi)->ckpt_flags));
+}
+
 static ssize_t pending_discard_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1029,8 +1035,10 @@ static struct attribute *f2fs_feat_attrs[] = {
 ATTRIBUTE_GROUPS(f2fs_feat);
 
 F2FS_GENERAL_RO_ATTR(sb_status);
+F2FS_GENERAL_RO_ATTR(cp_status);
 static struct attribute *f2fs_stat_attrs[] = {
 	ATTR_LIST(sb_status),
+	ATTR_LIST(cp_status),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_stat);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
