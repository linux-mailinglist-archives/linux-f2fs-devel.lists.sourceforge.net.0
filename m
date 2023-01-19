Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B846731D9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 07:36:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIOXh-0001TQ-4m;
	Thu, 19 Jan 2023 06:36:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+d6c99cb0ec1a2cfa7d20+7088+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1pIOXg-0001TJ-DN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FU9XPk1Xy4Y2DchoDdUH6tbkVbpUG46KvCMnzRlLK94=; b=cUXY+STvbVZMVtG1efw4SolMCI
 Zhnt9kLU+xNW9yfPLBvmmw6ZcSPsUpbHM2FC/xXrj4r6UWo0JdrLQtrjRE+JPbGY0385PL7Dw2Ej7
 idHjSKpoKoVwXfo2v1ACSSfMFJxPNjHdrNbJ5R6CFpUIAG+VNOrX/MPbsUE0bL38bU8U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FU9XPk1Xy4Y2DchoDdUH6tbkVbpUG46KvCMnzRlLK94=; b=JKG7DKIOtGjlujVv6BDEfOA1a5
 niOlJCQIxwpG2/4o5+iDKBB+fbUvv7V3Pjc2p0p5a8RoV1CjlkZovsOh1gteRr/Hhvw7HkqogAHMV
 8PV1qPoxkNBxK9zRKtX6eIWE/C4NaB+/H73H5BqRAzAm/A1JTzcF1yk62cxtR1vOwXZo=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIOXd-008fSY-7Y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 06:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FU9XPk1Xy4Y2DchoDdUH6tbkVbpUG46KvCMnzRlLK94=; b=Lo47Kj4DaOA1rl4k1yX8SI/FKx
 QAQyrk6YK3B8t6oN5f9zpb++rOCTLEZZBkxWHVeHB7uYKbL8cG9MFDEnrRWKXDkd4yRW/S29X79dP
 sQy7iJRNs8x9FOlJiw/P7vSV28+m2IhyKPFGHgQrcwdCVpdOIi7UC3WhjenIQXPIk3Sm0V4cYbQve
 aodF5aw75aPlgTzSQdXNTMWPupH8eTMlRPOaYCE5HlhOUAnjYuCBDeMQOZN+z84kCoyasMT7fMiWB
 kY1K5CX1pZxCKeVZ+j/4mOMncmkScUhL9qw29VX8MKi3H53l+i465NbxUF2It4sVkeWF4AiGCXsEh
 aaPJcQlA==;
Received: from [2001:4bb8:19a:2039:96fe:c1ec:dda2:41a3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIOXX-003kcj-C6; Thu, 19 Jan 2023 06:36:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 19 Jan 2023 07:36:23 +0100
Message-Id: <20230119063625.466485-7-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119063625.466485-1-hch@lst.de>
References: <20230119063625.466485-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Just fold this trivial wrapper into the only caller.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/f2fs/segment.c | 8 +------- 1 file
 changed, 1 insertion(+),
 7 deletions(-) diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
 index b25ee37d0375e2..f889f623a59fd6 100644 --- a/fs/f2fs/segment.c +++
 b/fs/f2fs/segment.c
 @@ -2909,17 +2909,11 @@ static void __allocate_new_segmen [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIOXd-008fSY-7Y
Subject: [f2fs-dev] [PATCH 6/8] f2fs: remove __allocate_new_section
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just fold this trivial wrapper into the only caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/segment.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b25ee37d0375e2..f889f623a59fd6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2909,17 +2909,11 @@ static void __allocate_new_segment(struct f2fs_sb_info *sbi, int type,
 	locate_dirty_segment(sbi, old_segno);
 }
 
-static void __allocate_new_section(struct f2fs_sb_info *sbi,
-						int type, bool force)
-{
-	__allocate_new_segment(sbi, type, true, force);
-}
-
 void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force)
 {
 	f2fs_down_read(&SM_I(sbi)->curseg_lock);
 	down_write(&SIT_I(sbi)->sentry_lock);
-	__allocate_new_section(sbi, type, force);
+	__allocate_new_segment(sbi, type, true, force);
 	up_write(&SIT_I(sbi)->sentry_lock);
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
 }
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
