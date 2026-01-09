Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26981D0AB89
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 09 Jan 2026 15:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PsIHWRFKs7RYNo3Fket4GmM0TFNjwvrxZuQyJrrmnKQ=; b=ltAD2I03hOJgf4Gilr1+TLxXGW
	ziycWty4vC7Nuv7SbrCoQFX+0z+a6joeqSY9pNFE1+J/o++YTomhSUZrg0N0QFcbEbklxzuRWAFwJ
	As7WlAkNj5mW6yXbzG005E6ljSj8nMnm5XLVUPfy5PBuk2ryLx1t1rFQSn4TsRfAakJ4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1veDlj-0004Pr-MR;
	Fri, 09 Jan 2026 14:47:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1veDld-0004PR-Jv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 14:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aExsmTgyUicbj6vzhKqDSM7XY5TfLvITbHEVWzjQ9nQ=; b=geFia5KL7V99ixY8aqDlV2iMHE
 LokclRX5H7G4qszfZmDo17uHuIyo+1DapIyefYZeLTDoE/7qn5Bud+ilpCDM2EtbdyiPUJ04iy6xC
 wcgOphrfvVvDy7iPChz4IiBpP2kslFaeqj9fUMNuB17Lx/jRKAcd19bXoOb+jmdv/LnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aExsmTgyUicbj6vzhKqDSM7XY5TfLvITbHEVWzjQ9nQ=; b=A
 EFXhKRb40n/W5fuFwf6KfpfipaPonhbUgViG27+Vx/MyUhnO6P2ao+TZdn8wRXsBlVrEVB1TUnV8o
 pF6hNQBTOtL/tRNc8B0TuiUX0y5tE+a2tNlQvDcdWBMZjKJfrglTG/Q0IkQVxybGUvbXy5CW2v0Ku
 UIqGLh9idY1sWgNY=;
Received: from smtp153-168.sina.com.cn ([61.135.153.168])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1veDld-00054e-Di for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 09 Jan 2026 14:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1767970029; bh=aExsmTgyUicbj6vzhKqDSM7XY5TfLvITbHEVWzjQ9nQ=;
 h=From:Subject:Date:Message-ID;
 b=niwdng3g6r+smdPxNTbcWJ5SbNmx3D6zD5Vm6rPoQnNCZ0rdo9Yqur4FGS/l5hRam
 N59v/YOEkS11jh0HDLvGvZEERa7oMuFPgROsvOqvlbxyIJdGjDaSXDEhuBuJQ7m0SE
 AL71HyEbObzxugwLbXVGZ6FwloixE1xuvJiJ+qN8=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 696114DC0000519B; Fri, 9 Jan 2026 22:46:54 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8944976684985
X-SMAIL-UIID: 9E09CAE5ED2E4106A6ABE899D2E8E844-20260109-224654-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  9 Jan 2026 22:46:18 +0800
Message-ID: <20260109144617.3282553-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang In the second call to f2fs_map_blocks
 within f2fs_read_data_large_folio, map.m_len exceeds the logical address space
 to be read. This patch ensures map.m_len does not exceed the required address
 space [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1veDld-00054e-Di
Subject: [f2fs-dev] [PATCH 1/1] f2fs: avoid unnecessary block mapping
 lookups in f2fs_read_data_large_folio
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

In the second call to f2fs_map_blocks within f2fs_read_data_large_folio,
map.m_len exceeds the logical address space to be read. This patch
ensures map.m_len does not exceed the required address space.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f32eb51ccee4..40c32267ead9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2456,7 +2456,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	ffs = NULL;
 	nrpages = folio_nr_pages(folio);
 
-	for (; nrpages; nrpages--) {
+	for (; nrpages; nrpages--, max_nr_pages--) {
 		sector_t block_nr;
 		/*
 		 * Map blocks using the previous result first.
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
