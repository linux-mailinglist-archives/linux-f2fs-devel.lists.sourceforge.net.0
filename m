Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C091FF243
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 14:48:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:Message-Id:Date:To:Sender:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H7pAszog/p8u+H8UEYeFXe+694/wy38RTlyIlVSUxvc=; b=cdakJz5h3R7HtRDijzeCuCqhvn
	exCFIhewh/igvd1QiOKeLyDz7pgfb+bw3ybQetSFcVR5ECnKYr1C/GzSSTfp/YBIbx/Q7hi5FA0Ni
	DIVOyRZIhPX3RWWR8AySQu3+hiGFsKUkdARpCKqRZy3/AfNhM8p9o+qxoWAZqFGu5CNQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlty0-00030L-UG; Thu, 18 Jun 2020 12:48:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhaowuyun@wingtech.com>) id 1jltxy-0002zt-Sf
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OmmcRGiv+h3aLFaBNBrDiKm614IHDwJKeaZDKi/He0Y=; b=ZA6U3uNBp2NH/ADx/LMwd67qfn
 xt2i3spOyc+DeXR3E3fND602szoJ3Rw/ECcm8KmZRZw6WDuo5Ye6l3uQAy7/FxwmGlG+zBypEfDZv
 JSCd4XKKwv/V4m4757FgF2uVomFTaV3QfCgDs3W1RA1v7qbovnWA5NsIWizB+rTL5mFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OmmcRGiv+h3aLFaBNBrDiKm614IHDwJKeaZDKi/He0Y=; b=hNQMpBc1Un214Zt3AdrbqYGjWS
 /B/iUt+HpMxtjYAl7/vLfKVlzT0uGudTlOEEWuK8G8iy/m30uHVmDmRAYXF43dOXV0ewocp1vvtjT
 EOScBymhI5JOz+wBicmi3CoF3zqEmqWnqVHCvaKKuE7Lc2nb1lAz8sfxWJSACmQ9q47o=;
Received: from mx.wingtech.com ([180.166.216.14] helo=mail.wingtech.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1jltxw-00AdjC-01
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 12:48:26 +0000
Received: from mx.wingtech.com ([192.168.2.43])
 by mail.wingtech.com  with SMTP id 05ICmH97002865-05ICmH98002865
 for <linux-f2fs-devel@lists.sourceforge.net>; Thu, 18 Jun 2020 20:48:17 +0800
Received: from 192.168.51.143 (HELO ZHAOWUYUN.WINGTECH.COM);
 Thu, 18 Jun 2020 20:48:14 +0800
To: yuchao0@huawei.com, jaegeuk@kernel.org
Date: Thu, 18 Jun 2020 20:48:07 +0800
Message-Id: <1592484487-12072-1-git-send-email-zhaowuyun@wingtech.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wingtech.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1jltxw-00AdjC-01
Subject: [f2fs-dev] [PATCH] f2fs-tools: set cold flag for non-dir node
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
From: zhaowuyun--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhaowuyun@wingtech.com
Cc: zhaowuyun@wingtech.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wuyun Zhao <zhaowuyun@wingtech.com>

Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>
---
 fsck/dir.c  |  1 +
 fsck/node.c |  1 +
 fsck/node.h | 11 +++++++++++
 3 files changed, 13 insertions(+)

diff --git a/fsck/dir.c b/fsck/dir.c
index 5f4f75e..dc03c98 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -522,6 +522,7 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 	node_blk->footer.nid = cpu_to_le32(de->ino);
 	node_blk->footer.flag = 0;
 	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	set_cold_node(node_blk, S_ISDIR(mode));
 
 	if (S_ISDIR(mode)) {
 		make_empty_dir(sbi, node_blk);
diff --git a/fsck/node.c b/fsck/node.c
index 229a99c..1d291ca 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -79,6 +79,7 @@ block_t new_node_block(struct f2fs_sb_info *sbi,
 	node_blk->footer.ino = f2fs_inode->footer.ino;
 	node_blk->footer.flag = cpu_to_le32(ofs << OFFSET_BIT_SHIFT);
 	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
+	set_cold_node(node_blk, S_ISDIR(le16_to_cpu(f2fs_inode->i.i_mode)));
 
 	type = CURSEG_COLD_NODE;
 	if (IS_DNODE(node_blk)) {
diff --git a/fsck/node.h b/fsck/node.h
index 6bce1fb..99139b1 100644
--- a/fsck/node.h
+++ b/fsck/node.h
@@ -161,6 +161,17 @@ static inline int is_node(struct f2fs_node *node_blk, int type)
 	return le32_to_cpu(node_blk->footer.flag) & (1 << type);
 }
 
+static inline void set_cold_node(struct f2fs_node *rn, bool is_dir)
+{
+	unsigned int flag = le32_to_cpu(rn->footer.flag);
+
+	if (is_dir)
+		flag &= ~(0x1 << COLD_BIT_SHIFT);
+	else
+		flag |= (0x1 << COLD_BIT_SHIFT);
+	rn->footer.flag = cpu_to_le32(flag);
+}
+
 #define is_fsync_dnode(node_blk)	is_node(node_blk, FSYNC_BIT_SHIFT)
 #define is_dent_dnode(node_blk)		is_node(node_blk, DENT_BIT_SHIFT)
 
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
