Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63769118E16
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2019 17:47:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ieifa-0000MR-JY; Tue, 10 Dec 2019 16:47:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ieifY-0000MK-VY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 16:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M4lcrc5DrweqodnFAHSuBTS76E1iYDR4q7crma5mCsA=; b=Ac/zwPYsjsVIre4vnXgLie2539
 kcO3JUTPjrAhxyi4KGNGtA2fAINsFPJUuB+wgfCb5bkqTvaI1z2R04RVJYFu64XkHjs5FhxyanvS/
 eAJ605D4afxolUEHAKIVtkv99T0D3MXq6If2ptGdPjG9/tSyzi9OLsvDL+/s8BTvgSFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M4lcrc5DrweqodnFAHSuBTS76E1iYDR4q7crma5mCsA=; b=h
 l6U7w3FKQCZvddbSFH3EbJMH7wQEvyjDmU3J+GBickJNFjX25pbyOGb/Y0LPV1TS+okMmIYa5rQyA
 85dPFFgVXRgRcK38vzG9kPJA6r0GXjyT+VCNonb3JLuTJZYqFo7F7VnX+nHFblzNAbMIcwXcJTZ77
 5NqkhPJoENCgLpOU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ieifX-00H4a8-1n
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Dec 2019 16:47:28 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7BF5F2073D;
 Tue, 10 Dec 2019 16:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575996436;
 bh=yia4s4T4uFLZ4+ZsPwBrkJa7O/oPqeS0+xN3aZuOJ88=;
 h=From:To:Cc:Subject:Date:From;
 b=S5JrzyK8Pd1kO9a0OCW29ruC1DaTAqZ5szpbp7lgjakm8yRU1RpewJF4o7zk4tE0G
 pquINkboXV7bDL9zwijRV7gQKsLVT+PHgWP/Yuxjxg/IBoPiDfA3Lv+Wy1ssDluSMt
 uowrPbW7OvFrnu+NpgmoWT/k91ZVqRMUJXh31GDY=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 10 Dec 2019 08:47:15 -0800
Message-Id: <20191210164715.28281-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ieifX-00H4a8-1n
Subject: [f2fs-dev] [PATCH] fsck.f2fs: do not access nat etnries in ckpt
 before initialization
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

ckpt->entries is initialized by fsck_init(), but we tried to access it during
f2fs_do_mount().

The call sequence is:
 - f2fs_do_mount
  - record_fsync_data
    - traverse_dnodes
     - do_record_fsync_data
      - ADDRS_PER_PAGE
       - get_node_info
        - node_info_from_raw_nat(fsck->entries[nid])
 - do_fsck
  - fsck_init
   - build_nat_area_bitmap
    - fsck->entries = calloc(fsck->nr_nat_entries);

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/mount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 47fe488..475ef67 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2139,7 +2139,7 @@ void get_node_info(struct f2fs_sb_info *sbi, nid_t nid, struct node_info *ni)
 	struct f2fs_nat_entry raw_nat;
 
 	ni->nid = nid;
-	if (c.func == FSCK) {
+	if (c.func == FSCK && F2FS_FSCK(sbi)->nr_nat_entries) {
 		node_info_from_raw_nat(ni, &(F2FS_FSCK(sbi)->entries[nid]));
 		if (ni->blk_addr)
 			return;
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
