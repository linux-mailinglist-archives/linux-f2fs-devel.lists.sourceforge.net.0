Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA527CFBBE3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 03:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPU8cmdHXM06NWAs+zuT2ezuFEib+g+Hxq3jS2q9HLE=; b=f/p99ynFvR1gplWN4LSoYDBDVv
	8wnrMW9YBEHdz7ne94T7V4MUd4zwBRiBO7TrRXQKtS0iIl/PmS+/ixvLtSs/PKGtQ6sziJMcBAaB8
	/f3UYQZrXyo66EfJ8ExXJc744kcdM1HWtge0TuDEXUlaQAt9P2LZZvwX6NGnXuXOaBxM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdJNO-0000jQ-8Q;
	Wed, 07 Jan 2026 02:34:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vdJNN-0000jF-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+rn302ZVpDa3RgRMoJjNfjKeT76r6zFqXZuHYk4VSCE=; b=BsuN7SZbLyaLBgMwMLFcNtS4/g
 upIGuuiJwPFn3QIrYiqv/c9n60YOFz260GcQC09DQyvkmotqJx0/jbF7eeSvsaIPNxF9IxDqJKdvc
 hof9SzYl+n0vBEBkgrrxVHEuBU+X5x6Et5PsrCOfoZl3SYCiMMkBJUu6FYBlZDme19aA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+rn302ZVpDa3RgRMoJjNfjKeT76r6zFqXZuHYk4VSCE=; b=ZTiiS+RpkMyz3u5YEuPHbZoCbN
 4jnimy/UgPwK8TU/pYJ5RQ7/B/mYszdFu2Cqa3wQs02Fx8Ak8IkpjWt5jcWmnf/uFYd9PG9RA+D1i
 hFiSI+/eTz5ckVFjGucxZwjnI5fvHqr2jyo3eyUZlqioVYdHnqMgAQc45zWiGZpaf3eU=;
Received: from mail3-167.sinamail.sina.com.cn ([202.108.3.167])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdJNN-0002ZH-Kt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1767753261; bh=+rn302ZVpDa3RgRMoJjNfjKeT76r6zFqXZuHYk4VSCE=;
 h=From:Subject:Date:Message-ID;
 b=DV/0l8UygCBhL9wNEOX6rP5f491ywKwu/ifxTp1y9QCZu5KWjUD4vRgScdmShmUJY
 1DZjvZxktRlpn0Z5JmLbwMGUAQAMNPLaAcPs9jthHbv3oUqU5IhdNPszbhvoEAW1JN
 rcwAbCWsilZUrcUXYyd/0FrwfCEp7Wq/GZgor6R8=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 695DC61500004F1E; Wed, 7 Jan 2026 10:34:09 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 4855886684985
X-SMAIL-UIID: CA09391ED1F34E418701518718F051D1-20260107-103409-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed,  7 Jan 2026 10:33:47 +0800
Message-ID: <20260107023346.2507670-3-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107023346.2507670-2-monty_pavel@sina.com>
References: <20260107023346.2507670-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang {struct file_ra_state}->ra_pages and
 {struct
 bio}->bi_iter.bi_size is defined as unsigned int, so values of seq_file_ra_mul
 and max_io_bytes exceeding UINT_MAX are meaningless. Signed-off-by: Yongpeng
 Yang Reviewed-by: Chao Yu --- fs/f2fs/f2fs.h | 4 ++-- 1 file changed,
 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [114.247.175.249 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vdJNN-0002ZH-Kt
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: change seq_file_ra_mul and
 max_io_bytes to unsigned int
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

{struct file_ra_state}->ra_pages and {struct bio}->bi_iter.bi_size is
defined as unsigned int, so values of seq_file_ra_mul and max_io_bytes
exceeding UINT_MAX are meaningless.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53cbce96f126..027ff3080941 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1762,7 +1762,7 @@ struct f2fs_sb_info {
 	unsigned int total_valid_node_count;	/* valid node block count */
 	int dir_level;				/* directory level */
 	bool readdir_ra;			/* readahead inode in readdir */
-	u64 max_io_bytes;			/* max io bytes to merge IOs */
+	unsigned int max_io_bytes;		/* max io bytes to merge IOs */
 
 	block_t user_block_count;		/* # of user blocks */
 	block_t total_valid_block_count;	/* # of valid blocks */
@@ -1910,7 +1910,7 @@ struct f2fs_sb_info {
 	unsigned int gc_segment_mode;		/* GC state for reclaimed segments */
 	unsigned int gc_reclaimed_segs[MAX_GC_MODE];	/* Reclaimed segs for each mode */
 
-	unsigned long seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
+	unsigned int seq_file_ra_mul;		/* multiplier for ra_pages of seq. files in fadvise */
 
 	int max_fragment_chunk;			/* max chunk size for block fragmentation mode */
 	int max_fragment_hole;			/* max hole size for block fragmentation mode */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
