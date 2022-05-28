Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D055536995
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 May 2022 03:07:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nukvh-0001Vl-Vu; Sat, 28 May 2022 01:07:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nukvg-0001Vf-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 May 2022 01:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FB8m4BvKOtg+UxcQZLri3CS/fi5p62PT+SOjNtB0F3c=; b=NtbuCGZvSt4IOzLgsXH4Wxv2Bv
 5w6Ug+F34nja2rOek7+f34HiI0hSythmkanyWNeS1/TPTOu491s3uasHguhP+E7AvkHfV/Ru81uRA
 9L7gxIKqhP3tU9amfRolMd9f88m9u0uFUktEnWPY2PcZG1QK6QjaoBd7rqdvI2RX0kzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FB8m4BvKOtg+UxcQZLri3CS/fi5p62PT+SOjNtB0F3c=; b=Fxoyj80dWkccXga/8oSBRx+Apy
 i1caYXUil7jdoHYHiNJWjTMGXanJUX4pD7+5/WRTaNZg8Slz9DnkV7jKnVnsogVMiDfKa7Fge4V6J
 bpOgOs5VHpdJhGXbVdWdyHx2edcg+PQmE3HluYLBmems9BmWre2dKYlGB4ATg16EIIbw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nukvg-0069Bk-Lb
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 May 2022 01:07:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4F47D61BBC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 May 2022 01:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A94C385A9;
 Sat, 28 May 2022 01:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653700058;
 bh=fnuHYMuoxHN8RWWIoGtl2rQq4IIhNVlqax99ENyTxM0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=HtIyO3wWgST9IOfxQimTnG0ubPv2DdUGIeLUITzIRXTODUOOdPtTfp23XI9sZcQZH
 H1qBt3DWQ7uX2wCTY3Xu+T84FISkAmLxBydSrDZKD0E3Zi3VCBEzJKwvwSlKlhDbS4
 gXLMMet+BoR8/hRKYkZTQ5/VkXTMVNrsccna+9tYa5pgqQUWPjDwaSny9IYh38FeFe
 +hHoSDhrbh/7ghJPpSykp07nX6Yxbrb9zj8z91aB7IcyJi4YSDlygO+y2kWMLTheaX
 4og3rv5KHyAHNLj6LoC7v3MyUprEA1N2nWKeWbln5GY/KOUw0V3Ufnl7jcuwMIbHyC
 pJ0x12incsr8g==
Date: Fri, 27 May 2022 18:07:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <YpF12RCV6wn/BrwI@google.com>
References: <20220527205955.3251982-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527205955.3251982-1-jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Some UFS storage supporting FUA gives slower DIO write
 bandwidth
 with FUA than write+cache_flush. But, in some small chunk writes, there's
 no reason to avoid FUA for shorter latency. Let's give a way [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nukvg-0069Bk-Lb
Subject: Re: [f2fs-dev] [RFC PATCH v2] f2fs: add sysfs entry to avoid FUA
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

Some UFS storage supporting FUA gives slower DIO write bandwidth with FUA
than write+cache_flush. But, in some small chunk writes, there's no
reason to avoid FUA for shorter latency. Let's give a way to handle it
by user.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

 Note that, this is a RFC, waiting for a better/right solution.

 Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++++
 fs/f2fs/data.c                          | 2 ++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/sysfs.c                         | 9 +++++++++
 4 files changed, 19 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9b583dd0298b..8ca49f7d28ad 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -434,6 +434,7 @@ Date:		April 2020
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Give a way to change iostat_period time. 3secs by default.
 		The new iostat trace gives stats gap given the period.
+
 What:		/sys/fs/f2fs/<disk>/max_io_bytes
 Date:		December 2020
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
@@ -442,6 +443,12 @@ Description:	This gives a control to limit the bio size in f2fs.
 		whereas, if it has a certain bytes value, f2fs won't submit a
 		bio larger than that size.
 
+What:		/sys/fs/f2fs/<disk>/no_fua_dio
+Date:		May 2022
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	This contorls whether direct IOs attach FUA or not. Default is
+		using FUA.
+
 What:		/sys/fs/f2fs/<disk>/stat/sb_status
 Date:		December 2020
 Contact:	"Chao Yu" <yuchao0@huawei.com>
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f5f2b7233982..23486486eab2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4153,6 +4153,8 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
 	if ((inode->i_state & I_DIRTY_DATASYNC) ||
 	    offset + length > i_size_read(inode))
 		iomap->flags |= IOMAP_F_DIRTY;
+	if (F2FS_I_SB(inode)->no_fua_dio)
+		iomap->flags |= IOMAP_F_DIRTY;
 
 	return 0;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e10838879538..4897ada1929b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1671,6 +1671,7 @@ struct f2fs_sb_info {
 	int dir_level;				/* directory level */
 	int readdir_ra;				/* readahead inode in readdir */
 	u64 max_io_bytes;			/* max io bytes to merge IOs */
+	bool no_fua_dio;			/* don't add FUA in DIO write */
 
 	block_t user_block_count;		/* # of user blocks */
 	block_t total_valid_block_count;	/* # of valid blocks */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 4c50aedd5144..199ba3e20ab0 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -608,6 +608,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "no_fua_dio")) {
+		if (t != 0 && t != 1)
+			return -EINVAL;
+		sbi->no_fua_dio = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -771,6 +778,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
 #endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, no_fua_dio, no_fua_dio);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
@@ -890,6 +898,7 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 	ATTR_LIST(readdir_ra),
 	ATTR_LIST(max_io_bytes),
+	ATTR_LIST(no_fua_dio),
 	ATTR_LIST(gc_pin_file_thresh),
 	ATTR_LIST(extension_list),
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-- 
2.36.1.124.g0e6072fb45-goog




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
