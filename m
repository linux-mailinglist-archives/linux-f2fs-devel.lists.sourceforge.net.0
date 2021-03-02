Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275B32963E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 06:43:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGxo8-0008F9-1R; Tue, 02 Mar 2021 05:42:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lGxo7-0008F2-GM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 05:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pN0up/W3CpIAzHX9DnqKbEWmzUfhSNK6BYFqbg37hsQ=; b=QQwBpNMLZuJuj7AWU4ynMQaetn
 ACn1afVuPmT+gFcpyJUqrf32w8SC2RMKDazX8yGFsBTC4do12oPc9YCgsLJ5z7WZr8vaqAyR3rMB9
 heC40RJggCdjx5zZheQox56Rmuz+p+eMgD9Fs/ZB4JLAWuzbywjtNHvzruDYAzI/ejrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pN0up/W3CpIAzHX9DnqKbEWmzUfhSNK6BYFqbg37hsQ=; b=K
 aFzScCHrpwCSysCrwQJ3MKeyBJXBAZkF0+g3ROGN3H5lysCCAL5PUJ+d9PrEbKCxv9F5fxrJs01Gj
 dCdsvr1fOZyVWk5ZL3KwaD3EXZwTAMHkYAp0WjKVp0wQ32PZoCIP77x5OAXjCtGC7HOTD/6tCHkEg
 yzkRpptMqGoiZs3o=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lGxnz-0004G7-Or
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 05:42:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0A886146B;
 Tue,  2 Mar 2021 05:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614663755;
 bh=L/xAWAJDwAT+puMjWqJVBI895stEzEJP7zB19lOugg8=;
 h=From:To:Cc:Subject:Date:From;
 b=Vl/PqZSu+l9Incm849CFvZbxe0KngocrQNhV44bnpS/hW7HwmyMw1TScNTNjW/wOJ
 GGS4KBwj3Fq4ap8JhEVfVVGe6t8TAIIejbmtRXV9/8aRl9BPHuaiVu1puwwBic/Zmk
 9D5uGh/775rbSjetWtieVwrqCphQ1pb0V7xtIDhAFM4scS4+RZYXr0TAmNEIpNJjRk
 zOzceXGPY+WJjCQG544WZKnq/8TVDASBB5c3Pcta81OtQzB+/dPYyeyUpa9FOkTeRT
 vTrdBs0tVRT3RLqudoO15zioQXeoOcWLTEYFnrh7tsfM/TV58FAiIdfPaTKfw8ROAb
 6UMJpstpWpayQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  1 Mar 2021 21:42:33 -0800
Message-Id: <20210302054233.3886681-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGxnz-0004G7-Or
Subject: [f2fs-dev] [PATCH] f2fs: expose # of overprivision segments
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

This is useful when checking conditions during checkpoint=disable in Android.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e38a7f6921dd..254b6fa17406 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -91,6 +91,13 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
 			(unsigned long long)(free_segments(sbi)));
 }
 
+static ssize_t ovp_segments_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(overprovision_segments(sbi)));
+}
+
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -629,6 +636,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
+F2FS_GENERAL_RO_ATTR(ovp_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
-- 
2.30.1.766.gb4fecdf3b7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
