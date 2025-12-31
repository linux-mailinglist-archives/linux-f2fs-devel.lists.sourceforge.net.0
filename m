Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4CCEC512
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Dec 2025 18:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYhXAKLag8RAR5fiefbx60b8M3OvirKGV6Padd488PU=; b=HXpn0WU5DYiOkVCD3QNrQi0kzX
	BGpyuIXGSNgyHRw6K5BIgLsPvqSRSiwQO+SCxRrqQQY13gJTx1ZVWvHTmT53yaZ8xKnP10QZ/gjK8
	RghXhKZHngxpTw0MUGjITmIP9mEMlXffha4AaCXriFvvXLJJctCxb2JLv024ZfCI4BBU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vazfc-0000nL-Tn;
	Wed, 31 Dec 2025 17:07:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vazfa-0000nD-Uh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 17:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4AmQQX03WA6/6f+W0c1JTMlc9WwXMvgnygTY6yMXc34=; b=MCzbtNhMBrMmXxLY5G16zlpDgz
 RnwMuM3qp1zfP4F26+ubs5/hqJfDhHwQr4mNVIqXNDTVFrlmNcmXdMjb+yL2Kxkk38uk0x4d1BVV0
 R2OPhpoYcUNNrxAVrBgS2Gs5pbBUOtdNofIgETSqGKcQYgMO+TjV5ZL+6HmCPBj5hwwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4AmQQX03WA6/6f+W0c1JTMlc9WwXMvgnygTY6yMXc34=; b=cuzgg3Qb0viWVkfTTdJKJS6Mk+
 DD3w/QtED5Xd6os/U7VJSvH1lM4EoS5wG8MLc5gWzXOESMusNyJWS0TXtR877hg8z8ROzH9odSs/S
 mGVVndJLDfVgUiqpdcZ7qrbViNwQUtrOVRKjJsdjjSXZ5H/JAiMU1vj7lULDdzTQ2mqA=;
Received: from smtp153-165.sina.com.cn ([61.135.153.165])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vazfX-0000wb-UG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Dec 2025 17:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1767200852; bh=4AmQQX03WA6/6f+W0c1JTMlc9WwXMvgnygTY6yMXc34=;
 h=From:Subject:Date:Message-ID;
 b=QyHMcjlBRf+3Eh2hiZGFXzMvOlKuZomseic6KHUNDeuM5lHnlSvJb2Kk4LmXXmfj6
 31UwEMDa5xjOsCOBGUahNAkOVQz+65HxruciIPj9cNUxHqBgPOj90fs2U5qEEPxu13
 p0TlkJzzYkQv3p+gd/hgd11vBPqdZGI4cGfWrrJE=
X-SMAIL-HELO: anonymous
Received: from unknown (HELO anonymous)([120.245.114.32])
 by sina.com (10.54.253.32) with ESMTP
 id 695554C2000056FC; Wed, 1 Jan 2026 00:52:19 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8173354456951
X-SMAIL-UIID: B80183DA5D1A4BFB87FF0109DF1B2272-20260101-005219-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  1 Jan 2026 00:52:01 +0800
Message-ID: <20251231165200.6028-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
References: <20251231135433.1069590-2-monty.pavel.devel@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang {struct file_ra_state}->ra_pages and
 {struct
 bio}->bi_iter.bi_size is defined as unsigned int, so values of seq_file_ra_mul
 and max_io_bytes exceeding UINT_MAX are meaningless. Signed-off-by: Yongpeng
 Yang --- fs/f2fs/f2fs.h | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-)
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.114.32 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vazfX-0000wb-UG
Subject: [f2fs-dev] [PATCH RESEND 2/2] f2fs: change seq_file_ra_mul and
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

{struct file_ra_state}->ra_pages and {struct bio}->bi_iter.bi_size is
defined as unsigned int, so values of seq_file_ra_mul and max_io_bytes
exceeding UINT_MAX are meaningless.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/f2fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6c5b901a5d27..042344359991 100644
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
