Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD088C0A1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 12:29:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rp4zL-0003f6-DZ;
	Tue, 26 Mar 2024 11:29:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rp4zK-0003ek-AC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 11:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SH6HKYRPnSHWH9fd9ic6GzAQ0FRtRMwzXxpmmyOxglA=; b=Nt8i7+klO6W76A+qTCz2l/sgc0
 gsqcOPlLOo9pvpMySFDQxY5g8vuSLDHAL9sGWY8h9L/fwIrI75IrRC7+ePCIa5+VF3W2rb7L+lIaM
 qVFPTcXDcaG5g4WUPakFUlgX7LlkFnE8Iewoa2QgzmxDi2jj3POOLYuvnekglJY96O9E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SH6HKYRPnSHWH9fd9ic6GzAQ0FRtRMwzXxpmmyOxglA=; b=b
 /RkGSh0HTC2gALwgCm//dLy3HXiKJR7v4wkbP7u9A0igKGiyhK77VWrahbLmfjAZ5bRsLVzaGqTJC
 WMYk/cN6flN+hB6ucwWMIIWj2uTg5ZO+uVp42/2lnUr6nGoSnavhowO1aWG0k1D1bddjX/wiu6aGl
 0l8A6nNfdNrzysyE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rp4zG-0005jj-TP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 11:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CC4FE60DCA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Mar 2024 11:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132C0C433F1;
 Tue, 26 Mar 2024 11:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711452532;
 bh=z0+/Jl8NKB183NMMyQeNKTgaIJ6S9uSiw9hjXJ2acAc=;
 h=From:To:Cc:Subject:Date:From;
 b=Ie04r/wNhqrRkb12Z5yWvEIf4RJSHZ9itxikPcyOGWGKEqhpG2cn1ScKT0cwrlgDR
 m8AdWvR3DvOrEDBhzAw7aT1U4M8Qc5giqD6SFOJzt+6KZKdNJ98cbSVZTcuClxLgiG
 P+BQl1ZaMDApVhBK6Yt2Oz/Mz7Gs/R+omLmPqTdhPnm+1/u+Jw99L7BcUFUtFW1Vco
 pG2uhOfc/tHrHIeD0NVRF1cQNwGBoiqTsygqm0FdVu7qdjopsHv2v8ZVcoCumIJxCV
 /fl7HUBYLH8ccF+EBX+4ly7+gVuQG9VbWHMI7SzTu5otg3kDvkeFAXiWfHxmcvR1FQ
 5TwASqHmgKkrg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 26 Mar 2024 19:28:45 +0800
Message-Id: <20240326112845.1576111-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In below race condition, dst page may become writeback status
 in __clone_blkaddrs(), it needs to wait writeback before update, fix it.
 Thread A GC Thread - f2fs_move_file_range - filemap_write_and_wait_range(dst)
 - gc_data_segment - f2fs_down_write(dst) - move_data_page -
 set_page_writeback(dst_page)
 - f2fs_submit_page_write - f2fs_u [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rp4zG-0005jj-TP
Subject: [f2fs-dev] [PATCH] f2fs: fix to wait on page writeback in
 __clone_blkaddrs()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In below race condition, dst page may become writeback status
in __clone_blkaddrs(), it needs to wait writeback before update,
fix it.

Thread A				GC Thread
- f2fs_move_file_range
  - filemap_write_and_wait_range(dst)
					- gc_data_segment
					 - f2fs_down_write(dst)
					 - move_data_page
					  - set_page_writeback(dst_page)
					  - f2fs_submit_page_write
					 - f2fs_up_write(dst)
  - f2fs_down_write(dst)
  - __exchange_data_block
   - __clone_blkaddrs
    - f2fs_get_new_data_page
    - memcpy_page

Fixes: 0a2aa8fbb969 ("f2fs: refactor __exchange_data_block for speed up")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f6edc2fdaafe..911b074f808c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1328,6 +1328,9 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				f2fs_put_page(psrc, 1);
 				return PTR_ERR(pdst);
 			}
+
+			f2fs_wait_on_page_writeback(pdst, DATA, true, true);
+
 			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
 			set_page_dirty(pdst);
 			set_page_private_gcing(pdst);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
