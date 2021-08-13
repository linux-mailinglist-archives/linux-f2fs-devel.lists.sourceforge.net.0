Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C753EB596
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Aug 2021 14:32:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mEWMg-0008Ta-LU; Fri, 13 Aug 2021 12:32:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1mEWMb-0008TK-7D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 12:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n/lNs4xvjFHK5wMFvcniKI+Ksa/rL1l1VDcY2A8BADg=; b=CmSuDuuEGN7F1trJfCjy7rBme5
 gC4TclzKLiY/3X8KemVIQDC4I7bduzEmAevbCv9dx3XkinySrCg28D2spvPedVWNU95CFd0h5QcBz
 fu40K7mgvDyUA3fmD7hzUYRTujV+wZMWZkJH17NjWAeGe8OL0xr53LkajP+zMQT4a50E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n/lNs4xvjFHK5wMFvcniKI+Ksa/rL1l1VDcY2A8BADg=; b=H/Nw8FOqn/p79Ihcc+dbVNjmEo
 Q0Mpma2q3d+a46oZSKd0KV2x90YC40CdbY7mgLWixOYhe2KpvMkAOD+ssUu0cwaUrfSReZkPPao1h
 myLjCfNkaY9sHZwgTvWb9b3lctttmLqEImlvwownL0WGDnhDj8btr9ZUBfN7wldZwZBU=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mEWMW-0001rI-Hb
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Aug 2021 12:32:41 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id D9F70C4020F;
 Fri, 13 Aug 2021 20:32:28 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 13 Aug 2021 20:32:21 +0800
Message-Id: <20210813123221.185591-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813123221.185591-1-frank.li@vivo.com>
References: <20210813123221.185591-1-frank.li@vivo.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRoaSUhWSx9JH0xIQkIYQk
 oeVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxQ6IRw*PD9IFxgfCxYXMSEY
 DRUaChNVSlVKTUlDQ05MQk9CT0xNVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUlDTUo3Bg++
X-HM-Tid: 0a7b3f7fdb7ad996kuwsd9f70c4020f
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mEWMW-0001rI-Hb
Subject: [f2fs-dev] [PATCH v5 2/2] f2fs: convert S_IRUGO to 0444
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+               proc_create_single_data("fsck_stack", S_IRUGO, sbi->s_proc,

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c |  2 +-
 fs/f2fs/sysfs.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 473ad04d1891..401e5e34edd6 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -621,7 +621,7 @@ void __init f2fs_create_root_stats(void)
 #ifdef CONFIG_DEBUG_FS
 	f2fs_debugfs_root = debugfs_create_dir("f2fs", NULL);
 
-	debugfs_create_file("status", S_IRUGO, f2fs_debugfs_root, NULL,
+	debugfs_create_file("status", 0444, f2fs_debugfs_root, NULL,
 			    &stat_fops);
 #endif
 }
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c134bbb99c7b..09bf8c4be2b1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1276,15 +1276,15 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 		sbi->s_proc = proc_mkdir(sb->s_id, f2fs_proc_root);
 
 	if (sbi->s_proc) {
-		proc_create_single_data("segment_info", S_IRUGO, sbi->s_proc,
+		proc_create_single_data("segment_info", 0444, sbi->s_proc,
 				segment_info_seq_show, sb);
-		proc_create_single_data("segment_bits", S_IRUGO, sbi->s_proc,
+		proc_create_single_data("segment_bits", 0444, sbi->s_proc,
 				segment_bits_seq_show, sb);
-		proc_create_single_data("iostat_info", S_IRUGO, sbi->s_proc,
+		proc_create_single_data("iostat_info", 0444, sbi->s_proc,
 				iostat_info_seq_show, sb);
-		proc_create_single_data("victim_bits", S_IRUGO, sbi->s_proc,
+		proc_create_single_data("victim_bits", 0444, sbi->s_proc,
 				victim_bits_seq_show, sb);
-		proc_create_single_data("fsck_stack", S_IRUGO, sbi->s_proc,
+		proc_create_single_data("fsck_stack", 0444, sbi->s_proc,
 				fsck_stack_seq_show, sb);
 	}
 	return 0;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
