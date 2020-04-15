Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B341A9D0E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:43:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgRk-0000kP-8c; Wed, 15 Apr 2020 11:43:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgRj-0000kJ-Kj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LchKNXrbEj08UFDhwvJhiCeab/vP6C1pCzO+KknGDC0=; b=lC2/JEi2UJPd/zq5oAAG8vuGam
 qXtsU+0t9WS+qPGUKA6nqX7BH7GxfFsGfRoJAN6z7frCulvLYFi2vdbJApg0qWYk6XCcBKWR85z4e
 2aW3ds7/kHlxFzagSjl8w1lXGxvGiTuOtdBmnhIdnV4oI8JsYNhHuUDIDX3jJCTL1deg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LchKNXrbEj08UFDhwvJhiCeab/vP6C1pCzO+KknGDC0=; b=SovfBPhj6ESI0jqEjykm+liKSV
 /AgjTsLy/d+v03i9HxLKYDngX5oR9h8RyUx1BwjvVlaaRDQV0zwE0/c8GrNHKFPFC+DE5Ph3x0HLw
 CB5u0MgVKE3e//FndNtOpUdLvnF9B6xneqTDNZP0amD5UAvzHKks1lNG3hct8dD33QIQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgRi-00GTiI-Df
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:43:11 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35C6D20775;
 Wed, 15 Apr 2020 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586950984;
 bh=SLx+8Doplj29R1VJ6jV+nfPg3iJ+iqYQ9SdTzhFzqJ0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qJ9ysCC3jZV5gYmbcGWgo+Gc/PDOoyGN6xs9t9P3j5NyiYtL/2/Ry2byzOVXCFAZX
 hQudjNDI/W1Nz68VjyIAhct5WXTzMhIthWEycPAoD7e/5iqMPtfbjQYZOanX2hXpuk
 ioUWre9XwnRUUcrXTLUorE27aTTCd/fZoOlRzl54=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:41:12 -0400
Message-Id: <20200415114226.13103-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114226.13103-1-sashal@kernel.org>
References: <20200415114226.13103-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgRi-00GTiI-Df
Subject: [f2fs-dev] [PATCH AUTOSEL 5.5 032/106] f2fs: fix to show norecovery
 mount option
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit a9117eca1de6b738e713d2142126db2cfbf6fb36 ]

Previously, 'norecovery' mount option will be shown as
'disable_roll_forward', fix to show original option name correctly.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h  | 1 +
 fs/f2fs/super.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b0e0535f7f56a..647f8b31b268b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -100,6 +100,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
 #define F2FS_MOUNT_INLINE_XATTR_SIZE	0x00800000
 #define F2FS_MOUNT_RESERVE_ROOT		0x01000000
 #define F2FS_MOUNT_DISABLE_CHECKPOINT	0x02000000
+#define F2FS_MOUNT_NORECOVERY		0x04000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a0a2f46f450dc..b2f8b934d8fc5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -439,7 +439,7 @@ static int parse_options(struct super_block *sb, char *options)
 			break;
 		case Opt_norecovery:
 			/* this option mounts f2fs with ro */
-			set_opt(sbi, DISABLE_ROLL_FORWARD);
+			set_opt(sbi, NORECOVERY);
 			if (!f2fs_readonly(sb))
 				return -EINVAL;
 			break;
@@ -1348,6 +1348,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	}
 	if (test_opt(sbi, DISABLE_ROLL_FORWARD))
 		seq_puts(seq, ",disable_roll_forward");
+	if (test_opt(sbi, NORECOVERY))
+		seq_puts(seq, ",norecovery");
 	if (test_opt(sbi, DISCARD))
 		seq_puts(seq, ",discard");
 	else
@@ -3499,7 +3501,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto reset_checkpoint;
 
 	/* recover fsynced data */
-	if (!test_opt(sbi, DISABLE_ROLL_FORWARD)) {
+	if (!test_opt(sbi, DISABLE_ROLL_FORWARD) &&
+			!test_opt(sbi, NORECOVERY)) {
 		/*
 		 * mount should be failed, when device has readonly mode, and
 		 * previous checkpoint was not done by clean system shutdown.
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
