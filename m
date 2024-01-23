Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9268390BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 15:01:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSHLQ-00041X-RE;
	Tue, 23 Jan 2024 14:01:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rSHLP-00041M-FE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 14:01:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I7T4zo5Bv7e1DOBYbxEVk9XV0uU26TzDrw3NisGIeBY=; b=cRQo0WHdI6hFikiDY/sw6qsv4k
 72VkM6/RV6ikNT8kfnnSrowLTwBnf/9HdbNnEYb47EtP9LKnLobpFRAJ0L7YrNPmYlMD9k1te9aj8
 lNG7ZBwTN8DwXUqkIlu2tmqpqB/PiGGx89wzm8qxKDpwmjSEFxmGxH0SIvMLzXhzlO94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=I7T4zo5Bv7e1DOBYbxEVk9XV0uU26TzDrw3NisGIeBY=; b=c
 PrU1KUw6Pws0qhaXRy1juY002WJx+8+fk3eeOB/lwt2AugOqi1zITrLyEnbYT/oJaOelccWxyOSEf
 l2ZD+/rriYOYueKSjEe+2Ui+BDX45UugOTYzdxnaGPaB/kFGBp+eEQtGA+JlYiFrQMaoyyw8Cvnhk
 2rjWivhMCmf9lf7M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSHLM-0005hT-J9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 14:01:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9950ECE2F00
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jan 2024 13:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082A0C43399;
 Tue, 23 Jan 2024 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706018037;
 bh=nlKqrohg9VQ/dpTWF3spocJjKS18rJmtbsQOe2818uA=;
 h=From:To:Cc:Subject:Date:From;
 b=UrTnfnZFVJhZQyKbXU3+8OmWP3tyR2BZGzFB+Rci81vLzJK4CGPM5Hp5Oc5+OMzwy
 cVId1V/QP5iJWebXH4QZfzw0xYUhlT/bF2Mo/0DkByO20AMFqm59Bm74zwZRazoxmy
 ytvjiMK05vZJms9xgqHAgTdovCi8tAyRUgwk5aAzukhTG0z7qQfZNZvfSCSaFV2A+T
 5FqH6Ys0uqUxfYibufupwGb4ZPq3W873e/Dedpq4K6rzWfPX9QoujgGzbAArLW/1Lv
 6UDNic3GyJdsVaYnKuCnTdboLgd0g48/BJjQfKeZzAIJkdXSioZwK037vSImgBX0fX
 8DYjo5PNzAczw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 23 Jan 2024 21:53:49 +0800
Message-Id: <20240123135349.3764866-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  generic/019 50s ... _check_generic_filesystem: filesystem
 on /dev/vdc is inconsistent (see /media/fstests/results//generic/019.full
 for details) [FSCK] Max image size: 16196 MB,
 Free space: 188 MB [FSCK] Unreachable
 nat entries [Ok..] [0x0] [FSCK] SIT valid block bitmap checking [Ok..] [FSCK]
 Hard link checking for regular file [Ok..] [0x166] [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rSHLM-0005hT-J9
Subject: [f2fs-dev] [PATCH] f2fs-tools: don't call fsync on a clean image
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

generic/019 50s ... _check_generic_filesystem: filesystem on /dev/vdc is inconsistent
(see /media/fstests/results//generic/019.full for details)

[FSCK] Max image size: 16196 MB, Free space: 188 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x166]
[FSCK] valid_block_count matching with CP             [Ok..] [0x3ecfe7]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x4c79]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x4c79]
[FSCK] valid_inode_count matched with CP              [Ok..] [0xb46]
[FSCK] free segment_count matched with CP             [Ok..] [0x9d]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]
        Error: Could not conduct fsync!!!

Generic/019 will trigger fsync() on a clean image, but it will fail
due to simulated failure on disk, result in testcase failure.

Let's add c.need_fsync to record dirty status of image, and only trigger
fsync() when there is dirty data in image.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 include/f2fs_fs.h |  1 +
 lib/libf2fs_io.c  | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 6df2e73..5e9dfad 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1514,6 +1514,7 @@ struct f2fs_configuration {
 	unsigned int quota_bits;	/* quota bits */
 	time_t fixed_time;
 	int roll_forward;
+	bool need_fsync;
 
 	/* mkfs parameters */
 	int fake_seed;
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index d76da83..18a1a3c 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -580,6 +580,7 @@ int dev_write(void *buf, __u64 offset, size_t len)
 		return -1;
 	if (write(fd, buf, len) < 0)
 		return -1;
+	c.need_fsync = true;
 	return 0;
 }
 
@@ -616,6 +617,7 @@ int dev_fill(void *buf, __u64 offset, size_t len)
 		return -1;
 	if (write(fd, buf, len) < 0)
 		return -1;
+	c.need_fsync = true;
 	return 0;
 }
 
@@ -639,6 +641,9 @@ int f2fs_fsync_device(void)
 #ifdef HAVE_FSYNC
 	int i;
 
+	if (!c.need_fsync)
+		return 0;
+
 	for (i = 0; i < c.ndevs; i++) {
 		if (fsync(c.devices[i].fd) < 0) {
 			MSG(0, "\tError: Could not conduct fsync!!!\n");
@@ -786,10 +791,12 @@ int f2fs_finalize_device(void)
 	 */
 	for (i = 0; i < c.ndevs; i++) {
 #ifdef HAVE_FSYNC
-		ret = fsync(c.devices[i].fd);
-		if (ret < 0) {
-			MSG(0, "\tError: Could not conduct fsync!!!\n");
-			break;
+		if (c.need_fsync) {
+			ret = fsync(c.devices[i].fd);
+			if (ret < 0) {
+				MSG(0, "\tError: Could not conduct fsync!!!\n");
+				break;
+			}
 		}
 #endif
 		ret = close(c.devices[i].fd);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
