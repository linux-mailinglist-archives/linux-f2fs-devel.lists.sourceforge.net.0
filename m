Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E05705E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 18:54:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpbZW-0002Zu-W8; Mon, 22 Jul 2019 16:53:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hpbZV-0002Z8-0t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:53:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GR5M2eZh4Y0ew0Z5rOMMwPuzl4j2d+QFn0zUHq2btVQ=; b=Qv4kZCRhuiXwl6eGZjU0PdBCLz
 ouc4TYdoR6zQQr7QLctBA3NTQh/lvd1CZTaPaj66BKiVBT+O1Zsi6tuJKgYI9xziGp2zuue7zBEhf
 eTjYabtdt1IJ0nXQK5zwvKhV31XBzWgq5Jdah9KkdPArryw/rlI4p0wUxj+tf2CPB6Yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GR5M2eZh4Y0ew0Z5rOMMwPuzl4j2d+QFn0zUHq2btVQ=; b=nD68sCT1w7Gy6NtWDzw4Hfoy0g
 b12ScUf2a1JNKX1PaAiYwm7ip3qwXoOTwxlmCxJAK3MQH1PnCyDmsZ/siDuRSl9gNc0GMUigkGpKX
 /PwcXvQVcQ4uZaSy6eP0Kv06wFoyDnXgG5miR5PwNu7kmZxt/lnuY/R3/7B10Zv4TfV4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpbZT-00AyRA-TU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:53:56 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E676E21E70;
 Mon, 22 Jul 2019 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563814430;
 bh=BHpcxxofGcH1e05aoGyix2mO9b9OUocga2ijXaORPMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KVCg3CwLXrt5ARuqRXBQfcxyFQIqk3aAI1fBw0xJ7W6rVRcmndohekJL8RJ7vOpom
 fL1kovMBE+dNiNylcXeYzjUviVflVNvhYcmenqVbocENEEYAku7JeUjFQTj0oZtYoY
 hWnUWaoqswQ5U9y7guPZvdU05gaYWR65PWYKArVg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Jul 2019 09:50:48 -0700
Message-Id: <20190722165101.12840-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722165101.12840-1-ebiggers@kernel.org>
References: <20190722165101.12840-1-ebiggers@kernel.org>
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
X-Headers-End: 1hpbZT-00AyRA-TU
Subject: [f2fs-dev] [PATCH v7 04/17] fs: uapi: define verity bit for
 FS_IOC_GETFLAGS
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add FS_VERITY_FL to the flags for FS_IOC_GETFLAGS, so that applications
can easily determine whether a file is a verity file at the same time as
they're checking other file flags.  This flag will be gettable only;
FS_IOC_SETFLAGS won't allow setting it, since an ioctl must be used
instead to provide more parameters.

This flag matches the on-disk bit that was already allocated for ext4.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/uapi/linux/fs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 59c71fa8c553a..df261b7e0587e 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -306,6 +306,7 @@ struct fscrypt_key {
 #define FS_TOPDIR_FL			0x00020000 /* Top of directory hierarchies*/
 #define FS_HUGE_FILE_FL			0x00040000 /* Reserved for ext4 */
 #define FS_EXTENT_FL			0x00080000 /* Extents */
+#define FS_VERITY_FL			0x00100000 /* Verity protected inode */
 #define FS_EA_INODE_FL			0x00200000 /* Inode used for large EA */
 #define FS_EOFBLOCKS_FL			0x00400000 /* Reserved for ext4 */
 #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
