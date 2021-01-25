Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8333024CE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Jan 2021 13:25:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l40vt-0000ic-MF; Mon, 25 Jan 2021 12:25:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <arnd@kernel.org>) id 1l40vr-0000iU-UI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jan 2021 12:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2Kv+/Y5P5gNLxZ+UZ/EsQcXxKB0Rrc+MUOwiQU8m5dM=; b=liKxOxBVPp5+XRwkRgdY1KRq5q
 ntGvYafzg6imNwFmqic+3hoGDTTcd741PkHREI6MlXIaG9ErdElaz6rbqoeKsjlcdoi+1NpiniY84
 zXy6Nmh1i2A+xZt22rXORoNIDNfpUInaMSOigXgIVWk0oZBwQGrMcmc20fTiYOVLkPYg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2Kv+/Y5P5gNLxZ+UZ/EsQcXxKB0Rrc+MUOwiQU8m5dM=; b=W
 QtK/EqOLt5sc2CWQbzTXcluDGOor/pQvcG5LRm30NiYLstOTijJt4z4xJMCq6QaGJcKZZdWxb3Sk1
 WRb3XKdyj1zU5M2HjMQV/mvwDECc062LqjV7i1EHNLHOFZ4Y8KPx9qirVsxTliDJ78ujQQaRw7Kr8
 l3rpGGw2tSgr546E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l40vi-006dfc-3u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jan 2021 12:25:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5EA3222F9;
 Mon, 25 Jan 2021 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611577501;
 bh=qtmXOqJxneNT6Fg5ZV7SMY5GLZOcH8Mz0dyQT4DG0Tk=;
 h=From:To:Cc:Subject:Date:From;
 b=NiTVNPuo1Guq4QKFfN6sfcBG1BFpJbOoC+mAt7uwcZTsHXJO5oWIuK5B31l0U7Cwr
 y5wZftk3pKXrbXGPW0cU4rBQLbUT7Yy1I0zfPHGMXVRb7tEAiJ0FPHLWJK3aU3HEZC
 QwtOI/4slqIowRXkyFHrjrS5OIT+0+QvVoepCZDVodpFC7/8Im/HaR/9X2QrDeqHct
 j6G3sgzqNo9lJ8sVSxrgrA1V9Hs60eieQsS5MD86mWB5CAXwNF7q9YgSWuyJfu8qah
 ssRlTP7G5WNsY8S4n20MqtLISdbtjbqEycUL0WSylAH4a7Y/nyVidP7wrl9RpoDP/q
 3g4CZdfwdI5lA==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 25 Jan 2021 13:24:45 +0100
Message-Id: <20210125122457.4119313-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l40vi-006dfc-3u
Subject: [f2fs-dev] [PATCH] f2fs: fix unused function warning
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
Cc: Jan Kara <jack@suse.cz>, Daeho Jeong <daehojeong@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Arnd Bergmann <arnd@arndb.de>

The f2fs_compress_set_level() function is only used for zstd and
lz4 compression modes, and otherwise causes a compile-time warning
for having no users.

Change the #ifdef check to match what calls it.

Fixes: c08e95fc6466 ("f2fs: compress: support compress level")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 178bbb79bbcc..c5a69b0543c1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -467,7 +467,7 @@ static int f2fs_set_test_dummy_encryption(struct super_block *sb,
 	return 0;
 }
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
+#if defined(CONFIG_F2FS_FS_LZ4) || defined(CONFIG_F2FS_FS_ZSTD)
 static int f2fs_compress_set_level(struct f2fs_sb_info *sbi, const char *str,
 						int type)
 {
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
