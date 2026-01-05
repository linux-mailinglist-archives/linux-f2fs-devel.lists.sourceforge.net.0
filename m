Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB003CF468F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 05 Jan 2026 16:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoIi6yqOMr3Sj3TXvtWetvLc5XrxhepxaRAnWjrcJg8=; b=ixUlzCDsbL7E0Z0Oqy4TPl/tL8
	2/z/5ZkAoJXbaqd/mARnQTQRM4zbTLvGM9buonLevpyatNlQ/e9uu5P1HcCOxCvh+CwvHXvZr1nfK
	t91ZTAZeQDc2yNabpQ6s4VJDnIIdZNNWPf85fVVfjJali0s47nZYU6v5z9WhxfKrkQAQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcmYX-00034z-4y;
	Mon, 05 Jan 2026 15:31:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vcmYS-00034p-L3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUOdomIt1y482dWB7e2fCoPWGq+lDcWVjtOVItf7/Ew=; b=URI8OuZZqr4iINFBTeQSBgvnPD
 MpHTgJ/JDTiCxVO9MeUrAYGJp/+FBDK5y+vlwJzpRmXMfYMDEwrzEVWFsjN5n1pGsVHeVY72kLobA
 pKKNUZ2JN5BUBwWe88OCnellFRWPImxhCS6Rv4T36rYgo6KML5cJO1O8GVjttMFKEMO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SUOdomIt1y482dWB7e2fCoPWGq+lDcWVjtOVItf7/Ew=; b=F8A0rnGUWoAS90SsB5iq3ZvUZl
 6Q0kJS0ikDQR/4G3l/Pt+7qQ6E/s9+rSl+GJ2NQkn2bKwZoJfXrqPj9J72AJlAn4wlZKyXWPi1GN1
 vOb4ZvJBSc56xwcHDIZoDkeX1gKEqeoF4XJP+wVbuIBFWiWppLI+3rQlQI4FGJktk3W4=;
Received: from m16.mail.126.com ([117.135.210.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcmYR-0006E6-PT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=SU
 OdomIt1y482dWB7e2fCoPWGq+lDcWVjtOVItf7/Ew=; b=TDW6e2XD7tk2LvpNvr
 paQJrAkOL8fTafefUczNNMaFbvfBG7IP2GPHeK/W/+S1vemhnEumtIuaCYopqH9s
 VuTpquDLUCF4bghpxyuyAETlLjSbBE3qSJ/p6IyyfW18Ir8W8anrYdn5qq5XFbH3
 hQxgWUgyNg/ZfUzGHDT4ejIUM=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t6092Vtp4nHABA--.665S4;
 Mon, 05 Jan 2026 23:31:11 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Kim Jaegeuk <jaegeuk@kernel.org>
Date: Mon,  5 Jan 2026 23:30:58 +0800
Message-Id: <20260105153101.152892-3-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105153101.152892-1-nzzhao@126.com>
References: <20260105153101.152892-1-nzzhao@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3t6092Vtp4nHABA--.665S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy8tFW8Cry3Cw4xXFW8Zwb_yoW8Zr1fpF
 95KF1FkFs5Xay09rnaq3Z8Xr1rt348Wa1UCFZ7Gw4fJ3Waqr9akr4ktryFvF1UtFZ7AF13
 Xw4rtrn5u3WUXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U2g4fUUUUU=
X-Originating-IP: [2409:8a20:4df7:2871:d124:26e2:5013:1aa3]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsR+2hmlb2T9IxAAA3G
X-Spam-Score: 4.8 (++++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_read_data_large_folio(),
 read_pages_pending is incremented
 only after the subpage has been added to the BIO. With a heavily fragmented
 file, each new subpage can force submission of the previo [...] 
 Content analysis details:   (4.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 4.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [117.135.210.8 listed in dnsbl-1.uceprotect.net]
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [117.135.210.8 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.8 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vcmYR-0006E6-PT
Subject: [f2fs-dev] [PATCH v1 2/5] f2fs: Accounting large folio subpages
 before bio submission
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
Cc: Nanzhe Zhao <nzzhao@126.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_read_data_large_folio(), read_pages_pending is incremented only
after the subpage has been added to the BIO.  With a heavily fragmented
file, each new subpage can force submission of the previous BIO.

If the BIO completes quickly, f2fs_finish_read_bio() may decrement
read_pages_pending to zero and call folio_end_read() while the read loop
is still processing other subpages of the same large folio.

Fix the ordering by incrementing read_pages_pending before any possible
BIO submission for the current subpage, matching the iomap ordering and
preventing premature folio_end_read().

Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
---
 fs/f2fs/data.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ab091b294fa7..4bef04560924 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2486,6 +2486,18 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			continue;
 		}

+		/* We must increment read_pages_pending before possible BIOs submitting
+		 * to prevent from premature folio_end_read() call on folio
+		 */
+		if (folio_test_large(folio)) {
+			ffs = ffs_find_or_alloc(folio);
+
+			/* set the bitmap to wait */
+			spin_lock_irq(&ffs->state_lock);
+			ffs->read_pages_pending++;
+			spin_unlock_irq(&ffs->state_lock);
+		}
+
 		/*
 		 * This page will go to BIO.  Do we need to send this
 		 * BIO off first?
@@ -2513,15 +2525,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 					offset << PAGE_SHIFT))
 			goto submit_and_realloc;

-		if (folio_test_large(folio)) {
-			ffs = ffs_find_or_alloc(folio);
-
-			/* set the bitmap to wait */
-			spin_lock_irq(&ffs->state_lock);
-			ffs->read_pages_pending++;
-			spin_unlock_irq(&ffs->state_lock);
-		}
-
 		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
 		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
 				F2FS_BLKSIZE);
--
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
