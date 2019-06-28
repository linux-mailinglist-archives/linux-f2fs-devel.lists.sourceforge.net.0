Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C508559F04
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2019 17:36:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgsvE-0003aH-NH; Fri, 28 Jun 2019 15:36:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hgsvD-0003aB-Mv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 15:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZO0t80w6A1R/mX8epE11x2cvUuEgx0HyjIG6JTEgols=; b=LtAPpDP8lxt5AdiaDGkG0qnGNQ
 PaMJkTQ9yv50U3ug6LKRobcF7EM0x4FVJuXPgoJdO2zTOHviMiXs0RUtXQnT4uzVPSa6M5gVnN4HI
 djRiGncGRQr18U19LosyflAvtiktELbRMeycuocmBn9hE9f6yF5pvNIdyKseiWaDq1lw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZO0t80w6A1R/mX8epE11x2cvUuEgx0HyjIG6JTEgols=; b=GmolTrgzWUdIVvNy0S9QE1xYvx
 xA1bQ+5GymFNFBdSV4ezw/NdluJSHc5oRX76dL9feuA/By0TZuG+fNkrboprWwcQtI8RaW9qwA+vN
 j2HjuAkFAK2x4DTlxln8NyQG9XFsqomA1zFIBZNgqgRa2QjSHC0XTpnf523SsvYEPoZ4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hgsvH-000a3D-RB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 15:36:26 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB1382064A;
 Fri, 28 Jun 2019 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561736175;
 bh=P0q2UFfbUHYwfmb/JPMOVIIGnfRXLzPGQwS42qAp73E=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=oB4/J5uQ6yewdmYk+br86w41GP1WQTpsf2PaBQOoAi77xF3vRmADerGce75ZFraW0
 Mv5T+Mv2+7JvafZ9aUZR4H0ItKvrAuRPK03eM35tvB7q6YygbSvsxzFeCJN10n6F9X
 aitDnPmM6nF16a/1eFVrKJlpIYQGcfVmmZIoMAno=
Date: Fri, 28 Jun 2019 08:36:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190628153614.GA27114@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190627170504.71700-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627170504.71700-1-jaegeuk@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1hgsvH-000a3D-RB
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: allocate blocks for pinned file
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

This patch allows fallocate to allocate physical blocks for pinned file.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/f2fs.txt | 25 +++++++++++++++++++++++++
 fs/f2fs/file.c                     |  7 ++++++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index bebd1be3ba49..496fa28b2492 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -804,3 +804,28 @@ WRITE_LIFE_NOT_SET    WARM_DATA                WRITE_LIFE_NOT_SET
 WRITE_LIFE_NONE       "                        WRITE_LIFE_NONE
 WRITE_LIFE_MEDIUM     "                        WRITE_LIFE_MEDIUM
 WRITE_LIFE_LONG       "                        WRITE_LIFE_LONG
+
+Fallocate(2) Policy
+-------------------
+
+The default policy follows the below posix rule.
+
+Allocating disk space
+    The default operation (i.e., mode is zero) of fallocate() allocates
+    the disk space within the range specified by offset and len.  The
+    file size (as reported by stat(2)) will be changed if offset+len is
+    greater than the file size.  Any subregion within the range specified
+    by offset and len that did not contain data before the call will be
+    initialized to zero.  This default behavior closely resembles the
+    behavior of the posix_fallocate(3) library function, and is intended
+    as a method of optimally implementing that function.
+
+However, once F2FS receives ioctl(fd, F2FS_IOC_SET_PIN_FILE) in prior to
+fallocate(fd, DEFAULT_MODE), it allocates on-disk blocks addressess having
+zero or random data, which is useful to the below scenario where:
+ 1. create(fd)
+ 2. ioctl(fd, F2FS_IOC_SET_PIN_FILE)
+ 3. fallocate(fd, 0, 0, size)
+ 4. address = fibmap(fd, offset)
+ 5. open(blkdev)
+ 6. write(blkdev, address)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e7c368db8185..cdfd4338682d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1528,7 +1528,12 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 	if (off_end)
 		map.m_len++;
 
-	err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_AIO);
+	if (f2fs_is_pinned_file(inode))
+		map.m_seg_type = CURSEG_COLD_DATA;
+
+	err = f2fs_map_blocks(inode, &map, 1, (f2fs_is_pinned_file(inode) ?
+						F2FS_GET_BLOCK_PRE_DIO :
+						F2FS_GET_BLOCK_PRE_AIO));
 	if (err) {
 		pgoff_t last_off;
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
