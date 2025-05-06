Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF6AABDB6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 10:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4lK4qlovlFNwVrUFEhwHvJ1jLKm12MMohArxgflKRis=; b=CGsGKAeNV4QI7jTQ6Qiv6ktIis
	foJ7rx3CB57qjlCgrWzTzm/kxTCj8s9lEsMgsWVISTcWjBKZxZPJkzD0hakUNpuq30RUt+qnNbtLG
	NjXHRlxamj63q415A6wU3ASLsMCj/2Rs471xljAWc+TXt5kU/l0c0iGSuvvBcPiG4lQE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCDzb-0004NN-UQ;
	Tue, 06 May 2025 08:49:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCDza-0004NG-Qz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 08:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h8S7OL7swu2b6YJMO/1AnI512V1+Gw1Udr19u0i/vdQ=; b=LK16gcyxUxmUlAZWrNL7ycO8jT
 WQY9JdvSnJACfclHZGyvKsfpD8Ox2eG0lNeipHTVqEckGZ2Y89JFKuFMkUyNGgr2+/fKWXIoETShl
 um9SwpGfABLK0Pc028WdgGoC10jjpiQaRxvKvdwfhecJBGMzLVpeQg+AG1U7kS9Rfexc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h8S7OL7swu2b6YJMO/1AnI512V1+Gw1Udr19u0i/vdQ=; b=N
 wT0dQDfUf1ZmVpUIObPvqsFxn/KV0CzZl+TqnQHCwucu7e81fpRh+ooQPz9xENn3+MAXqJLZ6Tlbm
 qfGkstwPgJbyzzOkMuvzIA/JFeYuv/g6BOB2rztql5klmQ2Ip4I5XUOvymae6tKdiCEd3grHRwe6R
 jamiiQr7aq1lyfwU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCDzL-0004m6-A6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 08:49:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A0AA95C540F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 May 2025 08:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 899C7C4CEE4;
 Tue,  6 May 2025 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746521348;
 bh=sO3XYb3gf+ICEOeAQkWr8anDFJq9z5MkqR98xG0MSIQ=;
 h=From:To:Cc:Subject:Date:From;
 b=BbU/mhxlIgECerDtCHPYRzBs1dV8YYilW33RsWFedw5bO7aKVak1IAzWOMFgbNVw2
 PzRZJl3I+SUMGC0LjP1ukg7hNDxW5pNm9AT06C/kmGiTrLLPzgnpusn5XJPhf+lFIY
 52Q0ibu3nRHhjDu7tJnMaItEgtJYceT7hsw8DAqVmKd9H39A6U5LvxF2cQ+ODkUPpx
 OzySxsOuXzvJDeWuvVPZ33zSQlMKkrroKgakfKGy9XGDz5ZTkes9gnmHDCx8txJkWb
 fE9IST6CmTontFixXlLGfGioX7qvI1oZvu1u98Iqw5WZ6Ml/HywCnUsyiWVMJPTvzR
 Equ32FL5fV6RQ==
To: jaegeuk@kernel.org
Date: Tue,  6 May 2025 15:47:25 +0800
Message-Id: <20250506074725.12315-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a new sysfs entry
 /sys/fs/f2fs/<disk>/encoding_flags, 
 it is a read-only entry to show the value of sb.s_encoding_flags, the value
 is hexadecimal. ============================ ========== Flag_Name Flag_Value
 ============================ ========== SB_ENC_STRICT_MODE_FL 0x00000001
 SB_ENC_NO_COMPAT_FALLBACK_FL 0x00000002 ========================== [...] 
 Content analysis details:   (-5.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCDzL-0004m6-A6
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: sysfs: add encoding_flags entry
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

This patch adds a new sysfs entry /sys/fs/f2fs/<disk>/encoding_flags,
it is a read-only entry to show the value of sb.s_encoding_flags, the
value is hexadecimal.

============================     ==========
Flag_Name                        Flag_Value
============================     ==========
SB_ENC_STRICT_MODE_FL            0x00000001
SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
============================     ==========

case#1
mkfs.f2fs -f -O casefold -C utf8:strict /dev/vda
mount /dev/vda /mnt/f2fs
cat /sys/fs/f2fs/vda/encoding_flags
1

case#2
mkfs.f2fs -f -O casefold -C utf8 /dev/vda
fsck.f2fs --nolinear-lookup=1 /dev/vda
mount /dev/vda /mnt/f2fs
cat /sys/fs/f2fs/vda/encoding_flags
2

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix compile warning of htmldocs
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 59adb7dc6f9e..1fa140da5a1a 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -846,3 +846,16 @@ Description:	For several zoned storage devices, vendors will provide extra space
 		reserved_blocks. However, it is not enough, since this extra space should
 		not be shown to users. So, with this new sysfs node, we can hide the space
 		by substracting reserved_blocks from total bytes.
+
+What:		/sys/fs/f2fs/<disk>/encoding_flags
+Date:		April 2025
+Contact:	"Chao Yu" <chao@kernel.org>
+Description:	This is a read-only entry to show the value of sb.s_encoding_flags, the
+		value is hexadecimal.
+
+		============================     ==========
+		Flag_Name                        Flag_Value
+		============================     ==========
+		SB_ENC_STRICT_MODE_FL            0x00000001
+		SB_ENC_NO_COMPAT_FALLBACK_FL     0x00000002
+		============================     ==========
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 3a3485622691..cf98c5cbb98a 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -274,6 +274,13 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 	return sysfs_emit(buf, "(none)\n");
 }
 
+static ssize_t encoding_flags_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sysfs_emit(buf, "%x\n",
+		le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_encoding_flags));
+}
+
 static ssize_t mounted_time_sec_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -1158,6 +1165,7 @@ F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
 F2FS_GENERAL_RO_ATTR(unusable);
 F2FS_GENERAL_RO_ATTR(encoding);
+F2FS_GENERAL_RO_ATTR(encoding_flags);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
@@ -1270,6 +1278,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_blocks),
 	ATTR_LIST(current_reserved_blocks),
 	ATTR_LIST(encoding),
+	ATTR_LIST(encoding_flags),
 	ATTR_LIST(mounted_time_sec),
 #ifdef CONFIG_F2FS_STAT_FS
 	ATTR_LIST(cp_foreground_calls),
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
