Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F376D18A2F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 13:09:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZPCzVhXJ2GTmLZ1gcMx9kQv0PfxLIyhQZzVCDw0ARA=; b=axrFkafZ/Qf1SZ7Yv8h2Pj9+lY
	Xzo2Aj0D9EHvaLDYTFJoiNo+N4tTxXHrb/jcMWBjKfHM5ExdgxwKn7Ie8oWY9xZU+BiNiWrYDDps6
	cOUK2Sn6yLwZl0xdoMn12GvT2hOuiHBlltsBsTqmGD9CFHCCq71QbI3C/i1PneNsk61k=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfdDN-0005jL-8c;
	Tue, 13 Jan 2026 12:09:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vfdDL-0005jF-U2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ltaDQUlD2zD04LXkotxt83pAuGnUOA60O6Z1EE6pmLM=; b=L0oTVxlllKTEaJEFGV0P0SN2X0
 juPNOxjIlYMHIF4CrTfMT59llQcI0eL/UFfxreQhsAKivrqqIvZl16XTlqySOJ/2aTF6ntwSeLSYt
 HYmC/lsRiR7UX1S339lHiADs8LpeeH56vasSjEITUum481gE0v6NY7vgN3M730HUlrl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ltaDQUlD2zD04LXkotxt83pAuGnUOA60O6Z1EE6pmLM=; b=lJvYjdf7ZP+1amEHN4RFq4QaMs
 CgWXJSNa3tuWeDO+KlTzJge4PxSJ+sMiuBJyqwloWRT2Q3pg8VgcYhckqN89fToxI5wWWpS6XkeDg
 plnwSXBt4rA+ESeGeH1YPUrOJhf7Y0FoMNQyQ2iY+38B/gZN4j46l5ond0l5/hapYqec=;
Received: from mail3-162.sinamail.sina.com.cn ([202.108.3.162])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfdDL-0008Df-2n for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768306175; bh=ltaDQUlD2zD04LXkotxt83pAuGnUOA60O6Z1EE6pmLM=;
 h=From:Subject:Date:Message-ID;
 b=S7v5vS6Pj9owuOc5b1h4AbANn9mGvqTUqk3NRCpc38l3f2XNx1lsvgzSfl3PqCISw
 9tO6CG/Z4f54sOBGcsHAbCB+dx6LsJDKYJtVCuXO1L7YtTabnbjDAF/oJ9kpDEqhEh
 R3OGFCfdcbmZGMa/klzVKVIs0zd1esQOYThCY7mM=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 696635D90000401A; Tue, 13 Jan 2026 20:09:21 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9618826291843
X-SMAIL-UIID: 916F0772068C40038955A794C8446EB3-20260113-200921-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 13 Jan 2026 20:08:37 +0800
Message-ID: <20260113120837.215336-4-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113120837.215336-2-monty_pavel@sina.com>
References: <20260113120837.215336-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang This patch adds separate write latency
 accounting for NAT and SIT blocks in f2fs_write_checkpoint(). Signed-off-by:
 Yongpeng Yang --- fs/f2fs/checkpoint.c | 4 +++- fs/f2fs/f2fs.h | 4 +++- 2
 files changed, 6 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.162 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vfdDL-0008Df-2n
Subject: [f2fs-dev] [PATCH 1/3] f2fs: add write latency stats for NAT and
 SIT blocks in f2fs_write_checkpoint
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
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

This patch adds separate write latency accounting for NAT and SIT blocks
in f2fs_write_checkpoint().

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/checkpoint.c | 4 +++-
 fs/f2fs/f2fs.h       | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 3dfc83a0813e..7a67e23d0e33 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1840,6 +1840,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			goto out;
 		}
 	}
+	stat_cp_time(cpc, CP_TIME_MERGE_WRITE);
 
 	/*
 	 * update checkpoint pack index
@@ -1856,10 +1857,11 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		f2fs_bug_on(sbi, !f2fs_cp_error(sbi));
 		goto stop;
 	}
+	stat_cp_time(cpc, CP_TIME_FLUSH_NAT);
 
 	f2fs_flush_sit_entries(sbi, cpc);
 
-	stat_cp_time(cpc, CP_TIME_FLUSH_META);
+	stat_cp_time(cpc, CP_TIME_FLUSH_SIT);
 
 	/* save inmem log status */
 	f2fs_save_inmem_curseg(sbi);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ded41b416ed7..bc666cfa83d4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -319,7 +319,9 @@ enum cp_time {
 	CP_TIME_START,		/* begin */
 	CP_TIME_LOCK,		/* after cp_global_sem */
 	CP_TIME_OP_LOCK,	/* after block_operation */
-	CP_TIME_FLUSH_META,	/* after flush sit/nat */
+	CP_TIME_MERGE_WRITE,	/* after flush DATA/NODE/META */
+	CP_TIME_FLUSH_NAT,	/* after flush nat */
+	CP_TIME_FLUSH_SIT,	/* after flush sit */
 	CP_TIME_SYNC_META,	/* after sync_meta_pages */
 	CP_TIME_SYNC_CP_META,	/* after sync cp meta pages */
 	CP_TIME_WAIT_DIRTY_META,/* after wait on dirty meta */
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
