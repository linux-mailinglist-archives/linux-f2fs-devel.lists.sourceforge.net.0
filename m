Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7301A9D49
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgTj-0005La-Qb; Wed, 15 Apr 2020 11:45:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgTi-0005LJ-W1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=27Q4LfdW+YSoR1h6rv3oRp9sDU2NJ3hvvtE3jINfWvQ=; b=QnBa/62YVnb7i0U5UL6HPOBzpH
 1fMhS391BR8Tk4Q/KTeyNLKS8y2jLfB1DmwGWgWDwOGlQF3RfS6R6kHxkVpDi63h+m9wFfx55lwYQ
 EwsjdGpwESFr1DJc7nz5iI6J8HwpiUoF+jQYvgD8Ux1TzCdWKqfjA5lbJJYDEXYVQW7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=27Q4LfdW+YSoR1h6rv3oRp9sDU2NJ3hvvtE3jINfWvQ=; b=RrMIYDkyVd6uK4FhpkMkkWMfmt
 1ZUNY46oGN62br2nKh7Q+PAjYMq5OCdS1xPM7Vin/VjEsynEiLNscC3e+NyMO+JkATvHIADPr453e
 OxjLyi+VFKJz7R1ApFB/Re+QiujMSRgspZ8XPW/rmLFuTwg9eavRY5FA5ayd0QLXFv3k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgTh-00GU3m-2W
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:45:14 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8E7A20737;
 Wed, 15 Apr 2020 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951107;
 bh=5SeT3hiRI9bcQ3mKwLYKdi/OeOWo9IX8PWvS3M83jsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=18n1J5QIVm3A+nB7H+heFmNlJj4qgwaNIgV2JOJvvPv+K6/rA5ZQXnq4IUtdZft7r
 xZ5PvQEIvraUu1RzQy0CuHb5/DsRByt69YdalwfmWf2wJWfw19IQH4l6CuF7gazZGS
 qheSZ32Vat5LsVH7VZACS9QFtW1N/r/w6aqmob6A=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:43:39 -0400
Message-Id: <20200415114442.14166-22-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114442.14166-1-sashal@kernel.org>
References: <20200415114442.14166-1-sashal@kernel.org>
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
X-Headers-End: 1jOgTh-00GU3m-2W
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 22/84] f2fs: fix to show norecovery
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
index 1a8b68ceaa62f..3edde3d6d089d 100644
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
index 28441f4971b8d..94caf26901e0b 100644
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
@@ -3488,7 +3490,8 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
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
