Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B63CC0E1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jul 2021 05:50:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4bLE-00043w-3y; Sat, 17 Jul 2021 03:50:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1m4bLC-00043o-G3
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 03:50:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=upSSh/KOwILS29K5sdGT0T+g8OnbUotq6IY7mSmY6H4=; b=khztggWOTDRuUI7xpzMvC6LP5t
 akO1/e/EbqS0T5CDDsXmnfCdHw68346FuVYFxDhls36psG0rj4VJNE4N1IiLCHF58HKL6xByguSD7
 MqXJi4d/uJ4+yfIK+KlIQlGn9mhbrP7k5UAIdiP3EUHXLGqb+jAgSS9+26wmK+YhUQDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=upSSh/KOwILS29K5sdGT0T+g8OnbUotq6IY7mSmY6H4=; b=Y
 jpK2j05APlB7iHIaRENiIUMhBYCSLdHkzSMnPQ6jgLvQsp7TCAEmPMc6jaoXB6iqb2Eahpa3vCQyW
 A1Za28Ko2iwEXrfiUNp+maW3v4CqFNlWvXkjnENPO39ds7QxUKS+JNhIVBR3giP3Q7JX4ioCz3rHR
 GJwmPHsG20tpygSs=;
Received: from mail-m121143.qiye.163.com ([115.236.121.143])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4bL2-00037M-Ee
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 03:50:14 +0000
DKIM-Signature: a=rsa-sha256;
 b=iH/OZ3HHXC/mBIn+vvby/MRMx0JtGS6/KxC+ikd63TTmeMUlCAoufXG7cuFZSrhFlQg7dHrWEzXYkBm/2FHl7smn7PvBC1vOgTrKhIrhpGZYp2ZD3m14U4wHj8JYe5PuO2x4fScHnrN+7ZOr8b0nJAWws74qTM8+qsL4kr6zZmE=;
 s=default; c=relaxed/relaxed; d=vivo.com; v=1;
 bh=upSSh/KOwILS29K5sdGT0T+g8OnbUotq6IY7mSmY6H4=;
 h=date:mime-version:subject:message-id:from;
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m121143.qiye.163.com (Hmail) with ESMTPA id 7B1F2540208;
 Sat, 17 Jul 2021 11:49:56 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 17 Jul 2021 11:49:55 +0800
Message-Id: <20210717034955.344408-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlNGhpWS04fGkJJTU4YSE
 0fVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6FTo6FT8CFA4zSRIhE0JN
 DRoKFB5VSlVKTUlNT0JITEJNQk5OVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUlOTUg3Bg++
X-HM-Tid: 0a7ab295c12ab038kuuu7b1f2540208
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.236.121.143 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.236.121.143 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1m4bL2-00037M-Ee
Subject: [f2fs-dev] [PATCH] f2fs: fix ctx->pos in f2fs_read_inline_dir()
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

I recently found a case where de->name_len is 0 in f2fs_fill_dentries() easily reproduced,
and finally set the fsck flag.

Thread A					Thread B

f2fs_readdir
	f2fs_read_inline_dir
		ctx->pos = d.max
						f2fs_add_dentry
							f2fs_add_inline_entry
								do_convert_inline_dir
							f2fs_add_regular_entry
f2fs_readdir
	f2fs_fill_dentries
		set_sbi_flag(sbi, SBI_NEED_FSCK)

Process A opens the folder, and has been reading without closing it. During this period,
Process B created a file under the folder (occupying multiple f2fs_dir_entry, exceeding
the d.max of the inline dir). After creation, process A uses the d.max of inline dir to
read it again, and it will read that de->name_len is 0.

And returning early in f2fs_read_inline_dir will cause the process to be unable to see
the changes before reopening the file.

So don't return early and remove the modification of ctx->pos in f2fs_read_inline_dir().

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/inline.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 56a20d5c15da..fc6551139a3d 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -729,9 +729,6 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 
 	make_dentry_ptr_inline(inode, &d, inline_dentry);
 
-	if (ctx->pos == d.max)
-		return 0;
-
 	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ipage))
 		return PTR_ERR(ipage);
@@ -747,8 +744,6 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 	make_dentry_ptr_inline(inode, &d, inline_dentry);
 
 	err = f2fs_fill_dentries(ctx, &d, 0, fstr);
-	if (!err)
-		ctx->pos = d.max;
 
 	f2fs_put_page(ipage, 0);
 	return err < 0 ? err : 0;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
