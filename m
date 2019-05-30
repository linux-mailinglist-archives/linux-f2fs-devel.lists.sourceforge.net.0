Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED4A2E9F5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2019 03:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4hCr9y2CRXEFMD8HQeiBsg+4dUWpQejA41AH9Ct2qoQ=; b=T894JJtxyYxrvnuxwo2xKThrN
	oCzBKYGT33c4GMUay/YTL9leoNBK6ObBKf/fHZ/gUGSZG1WENbfnpBLUDehl+Do/U7kpBtJQxMNL5
	ceCHDW/jf0M1Itm+zTMONkMPei0HSUwtcOwtUvunO3h3QFAkiCyz96ihHVKiI46rlOPJQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hW9Rk-0000Me-Jr; Thu, 30 May 2019 01:01:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3hinvXAYKAIMkyvzlunvvnsl.jvt@flex--drosen.bounces.google.com>)
 id 1hW9Rj-0000MV-8G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pFDT61UYE6+362eUPJJuMi+49iBrHpoUZVksNkDJA2o=; b=PKflsc83haQscS1kz5CgZdoFo
 BzOxwuuQ8Wo7rOvnkYTiBLgkilMWRRm80D1X7klmQnqhB1imx4MRvsX4FadpGHFC9GDKMzG3C3hsj
 KN3SPm576jIGQS4z3G1QXXlYZ2tS6+jXWV5cJTjw0DAevezUOoAivZUfeDvvk7+KxL73I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pFDT61UYE6+362eUPJJuMi+49iBrHpoUZVksNkDJA2o=; b=LHdFtqehA38nboBmVs0Z3lGbE1
 T3VI+JqtHxHW/804yWBQvribtH+Jzk5x/L0ncrqhLbnQnJ7mXY9TDG4j2eQ49cjE7T64A1D3BQT6X
 R/5u/dWZdbyI3w4/7Ei4v6hMrgi7cvb5z6PZIR15BLdvNy43mT4WEFsSyNY1eXxA9IvU=;
Received: from mail-qt1-f202.google.com ([209.85.160.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hW9Rh-004ceD-VR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 May 2019 01:01:31 +0000
Received: by mail-qt1-f202.google.com with SMTP id r58so1116107qtb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2019 18:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pFDT61UYE6+362eUPJJuMi+49iBrHpoUZVksNkDJA2o=;
 b=tq0C+xLpxnScJrE7KGvLRNW1EvyW7w8fxZLYhMG38iqb6B65iu+pJNUwkSmSw9Wsl3
 /9PNywbClVW9JA9DR/Dh1tSwsF6mMdgLrRvRMdWic+A+8I5sxRkeLEB1Ob2MAWWJm9jL
 6ev53ORFgvokwK4cHk17Y7Ckh2RQmG74ba2tYgemlhSg7VkheKlADWDbsqwFIwOUSizD
 ZYBWe2VO+7gH+pPgHLcdOlhkOX4cS9lzTtfup83L3evOB0ATtVcM/T1mPq4hDcSUF5Uc
 u/Y86bsvfsu8KvdNmkA/2KSKxTBI0UsTGqIlC4MAGZr2YM/9PfAUtAnGcsXxF7iTVQkS
 YuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pFDT61UYE6+362eUPJJuMi+49iBrHpoUZVksNkDJA2o=;
 b=seaCLiXl2N1EtEvV19D6cEej9OsvV7efUUIBPCubi0lUsxCUrsa8AmCu6/dpvFxfKi
 sL5egO3F6y2uG7f8+RPmQJvFwUxNYI3bEKUj50DDkaLOJKTo2mBHHz79GzPwUHJq8mES
 gKs8bDsQXX9FgFMgAdlK7ZF8KlayWHX1qMqYsKqktMPEjKQlNE0rd1wbxSiDm6SYwXKm
 YuS6wCO/gn4QNRZci5RTsqiTxPUHzGSXnGzyxY70oIPebUGxbXhlC1JtRgn02uOWUVtu
 Mdcbuvtzsj9pr67W6Mp/yAHfsv2Vg9oDGKg9Nwq8qzK7wxEv4r5V7eaGxu7PQp8SWCnf
 S9GA==
X-Gm-Message-State: APjAAAUj+OhM84SVsxpVqXjYP28VqIxWXYZ7aValw/rEWvSkO6YjofOz
 1Ueur60F4+r7pmz+OebeEOE6/UdZe08=
X-Google-Smtp-Source: APXvYqzdUz6c4pIj7GBI7bppXtBGbR717H7HlhysYDM55NbncVD1VFEeIv2JijSIJKEof8AzW57Fcs/wZys=
X-Received: by 2002:a37:660b:: with SMTP id a11mr723548qkc.342.1559177606029; 
 Wed, 29 May 2019 17:53:26 -0700 (PDT)
Date: Wed, 29 May 2019 17:49:05 -0700
In-Reply-To: <20190530004906.261170-1-drosen@google.com>
Message-Id: <20190530004906.261170-4-drosen@google.com>
Mime-Version: 1.0
References: <20190530004906.261170-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_MED        DKIMwl.org - Medium sender
X-Headers-End: 1hW9Rh-004ceD-VR
Subject: [f2fs-dev] [PATCH v3 3/4] f2fs: Fix accounting for unusable blocks
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: linux-fsdevel@vger.kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Daniel Rosenberg <drosen@google.com>,
 linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fixes possible underflows when dealing with unusable blocks.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/f2fs.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9b3d9977cd1ef..a39cc4ffeb4b1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1769,8 +1769,12 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 
 	if (!__allow_reserved_blocks(sbi, inode, true))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
-	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		avail_user_block_count -= sbi->unusable_block_count;
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		if (avail_user_block_count > sbi->unusable_block_count)
+			avail_user_block_count = 0;
+		else
+			avail_user_block_count -= sbi->unusable_block_count;
+	}
 	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
 		diff = sbi->total_valid_block_count - avail_user_block_count;
 		if (diff > *count)
@@ -1970,7 +1974,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
 {
 	block_t	valid_block_count;
-	unsigned int valid_node_count;
+	unsigned int valid_node_count, user_block_count;
 	int err;
 
 	if (is_inode) {
@@ -1997,10 +2001,11 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 
 	if (!__allow_reserved_blocks(sbi, inode, false))
 		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
+	user_block_count = sbi->user_block_count;
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		valid_block_count += sbi->unusable_block_count;
+		user_block_count -= sbi->unusable_block_count;
 
-	if (unlikely(valid_block_count > sbi->user_block_count)) {
+	if (unlikely(valid_block_count > user_block_count)) {
 		spin_unlock(&sbi->stat_lock);
 		goto enospc;
 	}
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
