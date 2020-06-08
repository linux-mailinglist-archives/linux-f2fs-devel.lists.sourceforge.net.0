Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5921F1184
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jun 2020 04:51:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ji7sx-0003vb-En; Mon, 08 Jun 2020 02:51:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ji7sw-0003vU-KL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 02:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MCxAhGH+R9CLDBywfF1JVY9qSXnroExRxnWyt+ikwLA=; b=Sh22PGlQy7udfOrMN/aZx3YWwV
 gpoAD/oD/X36D1KOZMMF0BawbGKZ7G5gE2fqkPukpY+0I3YUzEkDgcZihCuuGNEoJ6HS3MVtNVfUY
 u68DlSBuQCTYWBkFDdZxCkPXgwXwoonPvYdl8sOZg9O+y7cf45XdWymzlb0EdN2HmNYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCxAhGH+R9CLDBywfF1JVY9qSXnroExRxnWyt+ikwLA=; b=GxCN5BhJxgRK1US9V3J/uUpOeX
 wFpGjAAWGyNLINm+JEap63qeqLXbQdavDQMO3bpcrFhwavc/7r/lZEECktV3b7cXmrlJeaTScK0bq
 E7TFXLpYI5NYcOFO5s2hMFAGeI9BKAbHSmIHe/qrV+sBACdXecUhgAl+N7AUXVcUjmb4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ji7sp-00APWQ-TP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Jun 2020 02:51:38 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7067E2075A;
 Mon,  8 Jun 2020 02:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591584686;
 bh=aj/roIt7ILETlasumkcLsDLIyP/E4ZfrsyKhGIt46nQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=FcciYpdzrNEmWJLzvTQB//kGOWst28RMVfb1VYedjE/zlyqyUjDhzwALGAUDRgcbu
 hxfWcktywsG/RNcw09R4CqLN61b58BNzM76jWzKRoartKB5w2JkHSbLEOpC/nfzTyX
 Xi4Uu04a5L9uEksQT6GXZ40GGi2rNRuTgzyOfwHE=
Date: Sun, 7 Jun 2020 19:51:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20200608025125.GA127000@google.com>
References: <20200604235023.1954-1-jaegeuk@kernel.org>
 <20200604235023.1954-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604235023.1954-2-jaegeuk@kernel.org>
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
X-Headers-End: 1ji7sp-00APWQ-TP
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: attach IO flags to the missing
 cases
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

This patch adds another way to attach bio flags to node writes.

Description:   Give a way to attach REQ_META|FUA to node writes
               given temperature-based bits. Now the bits indicate:
               *      REQ_META     |      REQ_FUA      |
               *    5 |    4 |   3 |    2 |    1 |   0 |
               * Cold | Warm | Hot | Cold | Warm | Hot |

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

v2 log:
 - remove redundant code

 Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
 fs/f2fs/data.c                          | 24 +++++++++++++++---------
 fs/f2fs/f2fs.h                          |  1 +
 fs/f2fs/sysfs.c                         |  2 ++
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 427f5b45c67f1..4bb93a06d8abc 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -333,6 +333,15 @@ Description:	Give a way to attach REQ_META|FUA to data writes
 		*    5 |    4 |   3 |    2 |    1 |   0 |
 		* Cold | Warm | Hot | Cold | Warm | Hot |
 
+What:		/sys/fs/f2fs/<disk>/node_io_flag
+Date:		June 2020
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Give a way to attach REQ_META|FUA to node writes
+		given temperature-based bits. Now the bits indicate:
+		*      REQ_META     |      REQ_FUA      |
+		*    5 |    4 |   3 |    2 |    1 |   0 |
+		* Cold | Warm | Hot | Cold | Warm | Hot |
+
 What:		/sys/fs/f2fs/<disk>/iostat_period_ms
 Date:		April 2020
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 703fcb2433269..267b5e76a02b5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -514,22 +514,28 @@ void f2fs_submit_bio(struct f2fs_sb_info *sbi,
 	__submit_bio(sbi, bio, type);
 }
 
-static void __attach_data_io_flag(struct f2fs_io_info *fio)
+static void __attach_io_flag(struct f2fs_io_info *fio)
 {
 	struct f2fs_sb_info *sbi = fio->sbi;
 	unsigned int temp_mask = (1 << NR_TEMP_TYPE) - 1;
-	unsigned int fua_flag = sbi->data_io_flag & temp_mask;
-	unsigned int meta_flag = (sbi->data_io_flag >> NR_TEMP_TYPE) &
-								temp_mask;
+	unsigned int io_flag, fua_flag, meta_flag;
+
+	if (fio->type == DATA)
+		io_flag = sbi->data_io_flag;
+	else if (fio->type == NODE)
+		io_flag = sbi->node_io_flag;
+	else
+		return;
+
+	fua_flag = io_flag & temp_mask;
+	meta_flag = (io_flag >> NR_TEMP_TYPE) & temp_mask;
+
 	/*
-	 * data io flag bits per temp:
+	 * data/node io flag bits per temp:
 	 *      REQ_META     |      REQ_FUA      |
 	 *    5 |    4 |   3 |    2 |    1 |   0 |
 	 * Cold | Warm | Hot | Cold | Warm | Hot |
 	 */
-	if (fio->type != DATA)
-		return;
-
 	if ((1 << fio->temp) & meta_flag)
 		fio->op_flags |= REQ_META;
 	if ((1 << fio->temp) & fua_flag)
@@ -543,7 +549,7 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 	if (!io->bio)
 		return;
 
-	__attach_data_io_flag(fio);
+	__attach_io_flag(fio);
 	bio_set_op_attrs(io->bio, fio->op, fio->op_flags);
 
 	if (is_read_io(fio->op))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7794e2f0d6e8a..c812fb8e2d9c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1568,6 +1568,7 @@ struct f2fs_sb_info {
 
 	/* to attach REQ_META|REQ_FUA flags */
 	unsigned int data_io_flag;
+	unsigned int node_io_flag;
 
 	/* For sysfs suppport */
 	struct kobject s_kobj;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index a117ae1f9d5f1..fc4a46b689040 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -554,6 +554,7 @@ F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
 F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
@@ -635,6 +636,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(inject_type),
 #endif
 	ATTR_LIST(data_io_flag),
+	ATTR_LIST(node_io_flag),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
 	ATTR_LIST(unusable),
-- 
2.27.0.278.ge193c7cf3a9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
