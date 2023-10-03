Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0EC7B744B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Oct 2023 00:52:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qnoFj-0006y8-Af;
	Tue, 03 Oct 2023 22:52:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qnoFh-0006y2-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Oct 2023 22:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QFJHG4MApC2VrGBRfY0KV3r+q1koqCRwIvJ+1iywOvQ=; b=JTGI6g8AjRTiZIOoeCpHezLAeE
 nm9p8BKNixXCYlwvFl6arWyWwxNnR0HJcQ5H3QqyxHBiBdcGs0cIm0YaEGNBzc29WV+14Rq8yhdui
 4G/KdFJqJ5Rk6F2PcO2zUf0bslPCblRCP9yNqSaFF/MY5PVwQS/0/dcTg28V6txW23Mc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QFJHG4MApC2VrGBRfY0KV3r+q1koqCRwIvJ+1iywOvQ=; b=Q
 MgTwZNHIFZB9KyjbxnPwkvKOkShKiky55LLLFOURnE6HxnMPwfYfnuG3VsWL1s3MqOQSheqaAGnAw
 PYKFlB0mmbnNQfjMJn5cZvHuK6Jid6++6Rxb3lS3Y+2SHvpcoqftyFpnBurz2l1h+S/UsjG2n+PQr
 j+l4fsPtXftBkOc4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qnoFd-000L44-3G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Oct 2023 22:52:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CDE3AB81C89
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Oct 2023 22:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A47C433C7;
 Tue,  3 Oct 2023 22:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696373538;
 bh=DAv2AfX6INF2/9pEZJP+mKh8rXKAu51RSvWoW5djUnA=;
 h=From:To:Cc:Subject:Date:From;
 b=HF6nIf/t1kA+ZxoD3boKZynlbN/56xiURDRVeBwjZ9dyZGcm1B9CC0JAGfJiMZgc0
 8IPSPTEjMiSyXBHMkxRgkl2OEUlGrBfPJlHmxsDsODzuY5hF8A4E0C2z9Jeg8Aes4n
 DoGuxmHQPMvTDDdQroZu8T6cjxZCb6V29OvDZX5WG9hwikidufm62yGJJqGWqMt0hA
 rys+7LO8OG4/pmXsgwrS8C2ZzT1+zUkjz/f+m17zxQk86+3I8slTWIhrES9yR+TceW
 dJgwPjTPMkJ+Z7u4CKVvHHCX5WM5sbIscSmsiTUHJTFxlclvxjLpVibOWO3WXtFXrt
 XXk/0v+avs9XQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 Oct 2023 15:52:08 -0700
Message-ID: <20231003225208.1936359-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's avoid unnecessary f2fs_map_block calls to load extents.
 # f2fs_io fadvise willneed 0 4096 /data/local/tmp/test f2fs_map_blocks: dev
 = (254,51), ino = 85845, file offset = 386, start blkaddr = 0x34ac00, len
 = 0x1400, flags = 2, f2fs_map_blocks: dev = (254, 51), ino = 85845, file offset
 = 5506, start blkaddr = 0 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qnoFd-000L44-3G
Subject: [f2fs-dev] [PATCH] f2fs: stop iterating f2fs_map_block if hole
 exists
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's avoid unnecessary f2fs_map_block calls to load extents.

 # f2fs_io fadvise willneed 0 4096 /data/local/tmp/test

  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 386, start blkaddr = 0x34ac00, len = 0x1400, flags = 2,
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 5506, start blkaddr = 0x34c200, len = 0x1000, flags = 2,
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 9602, start blkaddr = 0x34d600, len = 0x1200, flags = 2,
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 14210, start blkaddr = 0x34ec00, len = 0x400, flags = 2,
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 15235, start blkaddr = 0x34f401, len = 0xbff, flags = 2,
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 18306, start blkaddr = 0x350200, len = 0x1200, flags = 2
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 22915, start blkaddr = 0x351601, len = 0xa7d, flags = 2
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25600, start blkaddr = 0x351601, len = 0x0, flags = 0
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25601, start blkaddr = 0x351601, len = 0x0, flags = 0
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 25602, start blkaddr = 0x351601, len = 0x0, flags = 0
  ...
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1037188, start blkaddr = 0x351601, len = 0x0, flags = 0
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1038206, start blkaddr = 0x351601, len = 0x0, flags = 0
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 1039224, start blkaddr = 0x351601, len = 0x0, flags = 0
  f2fs_map_blocks: dev = (254,51), ino = 85845, file offset = 2075548, start blkaddr = 0x351601, len = 0x0, flags = 0

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 161826c6e200..2403fd1de5a0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3270,7 +3270,7 @@ int f2fs_precache_extents(struct inode *inode)
 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		err = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRECACHE);
 		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-		if (err)
+		if (err || !map.m_len)
 			return err;
 
 		map.m_lblk = m_next_extent;
-- 
2.42.0.582.g8ccd20d70d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
