Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5449BCF5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jan 2022 21:23:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nCSLS-0001cX-1D; Tue, 25 Jan 2022 20:23:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nCSLQ-0001cQ-Tb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 20:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I5imAOA6gMJ2Voc7H/Ixwoqs0J+xlDSEyK/v+m4Mpao=; b=nQ2vjUUI3M2UhJK2ej3H1ROCPJ
 nHCG0GLzjQM0gXb+q5Cbl2VO916g3+7XtF+KGbxmytR/U9zZYlpF5PG7IyhrzrZsGsfgJIOCDPviw
 JPT6H2CVp95IJXVoCNQcunZtaM9OiHLZ7g2j76LzhbiXXtt5PsS13AUm6maco9zU/PFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I5imAOA6gMJ2Voc7H/Ixwoqs0J+xlDSEyK/v+m4Mpao=; b=Y3zzAkPv1PYJcgnAFxCu+yMjiR
 dQrClaBQi4PiYey9C6VtJeoy4riyQZrGItSOpZh1MbNmd/aEDk2wBJyjLby5CZ/7+gdKUutdbf0dG
 U2BidMv2bcaniOcrX8LV25iiBe19VY9ppQCK4FHMU15iEKY9x4Oh6IQOQ2VTPplTBBe0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nCSLO-00Cyb6-54
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jan 2022 20:23:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7ED2561768;
 Tue, 25 Jan 2022 20:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD945C340E6;
 Tue, 25 Jan 2022 20:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643142180;
 bh=ofAycFRhfggnQ8vC0SVr08d1Hq7S/JeroNDpfQa4dno=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=spiTYMZrR/hipoHCjyv2pboNqs5CtD0mXMXOqfK3MmXpZnjViOMQOS24FZrnqeX7V
 ogLwF0EA7iwCASRL+TbsGBuHoCmN37Ba/qL0OqiraktZkNjieZpDgRgV5GArMP4mPW
 HOxep14tpwnwQw3eJgpQKaC/0mI3H4EfVLVSk/R6DtrXQvRZE9Ik6R+OQDuPlcc5n5
 OpAdy6jM5NER+P1gEUzLkCWTKPogx4AOM+f9yUkce9fiklNzaYDDIl78aUMf+5lzDD
 57CAgJow841eOGaoGs6SVXtVt4j9B0OE5Lmv7/LQhxYhd1ZMQwkpGgVngDy45Z09Ps
 KlZHVY3HcXHlQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 25 Jan 2022 12:22:54 -0800
Message-Id: <20220125202254.3111474-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220125202254.3111474-1-jaegeuk@kernel.org>
References: <20220125202254.3111474-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Konstantin Vyshetsky <vkon@google.com> This patch
 exposes
 max_discard_request, min_discard_issue_time, mid_discard_issue_time, and
 max_discard_issue_time in sysfs. This will allow the user to fine tune discard
 operations. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nCSLO-00Cyb6-54
Subject: [f2fs-dev] [PATCH 2/2] f2fs: expose discard related parameters in
 sysfs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Konstantin Vyshetsky <vkon@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Konstantin Vyshetsky <vkon@google.com>

This patch exposes max_discard_request, min_discard_issue_time,
mid_discard_issue_time, and max_discard_issue_time in sysfs. This will
allow the user to fine tune discard operations.

Signed-off-by: Konstantin Vyshetsky <vkon@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 27 +++++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 2416b03ff283..87d3884c90ea 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -98,6 +98,33 @@ Description:	Controls the issue rate of discard commands that consist of small
 		checkpoint is triggered, and issued during the checkpoint.
 		By default, it is disabled with 0.
 
+What:		/sys/fs/f2fs/<disk>/max_discard_request
+Date:		December 2021
+Contact:	"Konstantin Vyshetsky" <vkon@google.com>
+Description:	Controls the number of discards a thread will issue at a time.
+		Higher number will allow the discard thread to finish its work
+		faster, at the cost of higher latency for incomming I/O.
+
+What:		/sys/fs/f2fs/<disk>/min_discard_issue_time
+Date:		December 2021
+Contact:	"Konstantin Vyshetsky" <vkon@google.com>
+Description:	Controls the interval the discard thread will wait between
+		issuing discard requests when there are discards to be issued and
+		no I/O aware interruptions occur.
+
+What:		/sys/fs/f2fs/<disk>/mid_discard_issue_time
+Date:		December 2021
+Contact:	"Konstantin Vyshetsky" <vkon@google.com>
+Description:	Controls the interval the discard thread will wait between
+		issuing discard requests when there are discards to be issued and
+		an I/O aware interruption occurs.
+
+What:		/sys/fs/f2fs/<disk>/max_discard_issue_time
+Date:		December 2021
+Contact:	"Konstantin Vyshetsky" <vkon@google.com>
+Description:	Controls the interval the discard thread will wait when there are
+		no discard operations to be issued.
+
 What:		/sys/fs/f2fs/<disk>/discard_granularity
 Date:		July 2017
 Contact:	"Chao Yu" <yuchao0@huawei.com>
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2bccdaedfb00..281bc0133ee6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -716,6 +716,10 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle, gc_mode);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent, gc_mode);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, reclaim_segments, rec_prefree_segments);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_small_discards, max_discards);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_request);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
@@ -832,6 +836,10 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reclaim_segments),
 	ATTR_LIST(main_blkaddr),
 	ATTR_LIST(max_small_discards),
+	ATTR_LIST(max_discard_request),
+	ATTR_LIST(min_discard_issue_time),
+	ATTR_LIST(mid_discard_issue_time),
+	ATTR_LIST(max_discard_issue_time),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(pending_discard),
 	ATTR_LIST(batched_trim_sections),
-- 
2.35.0.rc0.227.g00780c9af4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
