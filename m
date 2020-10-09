Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C83288105
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 06:08:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQjhg-0006ot-B4; Fri, 09 Oct 2020 04:08:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQjhe-0006od-IB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 04:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/qKNerLnrx84DvYPUW65ARGaurJAddD8JplGdm4T11I=; b=KBg+5SMvi5T1POc2pUtGTpkykr
 On0tqgllIITaybCbiSNAupwoWm/atYYbzlROrY9X8LHmeYL1M0yjpcy28tcARtRwr2ui3uw0jKjwA
 hqXUPtEwlL9lmKpLR2+v4bjruyJAoqRhWonH4TXW2tZUJkPYrJHFie3n4Mcz4nQ5QTUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
 Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/qKNerLnrx84DvYPUW65ARGaurJAddD8JplGdm4T11I=; b=X
 8j91o0362Lo3W8aDJA71CC+FWn9nYzJnzF8xjuyHhtIcpqbtYOWtbTQYAUsxeGigQLco2dRp027Ae
 matOJz0frQ0ykg+CLDQY5l1ywgWg5bAj1qiLZ/mo3rm2ZBdefUu5mm/Byifv43GygIFywXOWVOivG
 N/IrYNom5L22/AP0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQjha-003kAy-Gr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Oct 2020 04:08:22 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0352C22240;
 Fri,  9 Oct 2020 04:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602216481;
 bh=z28dpp/gyQPP0ZvAq9CRBFdvPobcL0L6dPlbYu+z7Ic=;
 h=From:To:Subject:Date:From;
 b=cgUh+qMYF7Ksnv56IecamAjoIUNgv7vMwS7PRucToKsJmpzh6MMlv0FRpWjjQDiVF
 0svs14/E38sIeISev2NFQCC4sCVqp3fPbz+rNTic/zEtzOrDEO2y1mmH6s17Hx5eFo
 aZb/zuiCw/XClkDp5BwP5WTDcOIKoSIqB9hIOJJM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Thu,  8 Oct 2020 21:07:45 -0700
Message-Id: <20201009040746.241970-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQjha-003kAy-Gr
Subject: [f2fs-dev] [f2fs-tools PATCH] fsck: clear unexpected casefold flags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Inodes aren't allowed to have the casefold flag set when they aren't
directories, or if the filesystem superblock doesn't have the casefold
feature enabled.  Clear any such unexpected casefold flags.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fsck/fsck.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index f97e9fb..6475233 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -790,6 +790,17 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	}
 	ofs = get_extra_isize(node_blk);
 
+	if ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
+	    (ftype != F2FS_FT_DIR ||
+	     !(c.feature & cpu_to_le32(F2FS_FEATURE_CASEFOLD)))) {
+		ASSERT_MSG("[0x%x] unexpected casefold flag", nid);
+		if (c.fix_on) {
+			FIX_MSG("ino[0x%x] clear casefold flag", nid);
+			node_blk->i.i_flags &= ~cpu_to_le32(F2FS_CASEFOLD_FL);
+			need_fix = 1;
+		}
+	}
+
 	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		unsigned int inline_size = MAX_INLINE_DATA(node_blk);
 		if (cur_qtype != -1)
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
