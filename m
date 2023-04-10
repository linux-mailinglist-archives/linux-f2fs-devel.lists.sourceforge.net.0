Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9986DC290
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 04:12:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plh0f-0004XS-IM;
	Mon, 10 Apr 2023 02:11:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plh0f-0004XM-66
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WTjECS3+MEmvqP0P0eaewt9U+dBn58t16mLqbukmkrE=; b=E+RBlQbVbPvnLdOeTMyZMN/fKo
 XfWXutTy7tU/HEGa72zh2mE8ZULYfMUhXnso65nHZ7TdqYkJ5KQA3rnfxx1XpViBmq0tSm1MwRv7n
 tEUz5XfrD2wDWGIZ9oJ+8PxpRKr08JZs/Ts0F2HpRgLA9UjsglN8yhwsTBIPvb3cBk94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WTjECS3+MEmvqP0P0eaewt9U+dBn58t16mLqbukmkrE=; b=L
 gTmlaEaP13nQF16ysgfX/GI7G4wqWgE1Pd4QW4UyjmXnUid1JNaM9fZ2emLCNbQ34+ZSxak/3Kqof
 NQCk956RDC5ooSC/xhuxeJv6Qfqw6QWpHFpqnifW/nQW1qiCdyDtBCcS7Cwzu3xBSKfD3x+NyU0zs
 rT/hQcK0KGQIgsFc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plh0d-0007Ap-Pc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:11:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E35760C16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 02:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D6DC433EF;
 Mon, 10 Apr 2023 02:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681092709;
 bh=FCFxu4X+5woHhI20a2ADjfDUIjQHOiUKAW2OcY/taSU=;
 h=From:To:Cc:Subject:Date:From;
 b=GVo5eO0r5KNTpseagjx5UOIXexQSj7cY1aYA70unARObaF3Vy2Gg5RHgGBS7M8ykA
 ZkN7zgxHJo6XXjKz/WM67RpcFqVoXxuZ2GMVr8db0ktArAsCdmCsWcBi0kJ194aker
 qQMdTFlXNlzefSChOx47n0bOIsIm12vlB5VNyVKfrpPknMC6tHkDsFaP06rrTTsqQA
 3odseNBjD2flrUMYpaC5p0JWfPgQnE+aN7DovQjCjP8HLQL3yKy0t4i5s4A526G81k
 y++VA4kZ0VSgQB2Gx2SQWyCaZHLcXERiXWu9PjrDVfHLQD7pH4U+l/hYNj8+wxVVkT
 NSTFx2YqgLiCA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 10:11:40 +0800
Message-Id: <20230410021140.1825781-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: i_gc_rwsem[WRITE] and i_gc_rwsem[READ] lock order is reversed
 in gc_data_segment() and f2fs_dio_write_iter(), fix to keep consistent lock
 order as below: 1. lock i_gc_rwsem[WRITE] 2. lock i_gc_rwsem[R [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plh0d-0007Ap-Pc
Subject: [f2fs-dev] [PATCH] f2fs: fix to keep consistent i_gc_rwsem lock
 order
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

i_gc_rwsem[WRITE] and i_gc_rwsem[READ] lock order is reversed
in gc_data_segment() and f2fs_dio_write_iter(), fix to keep
consistent lock order as below:
1. lock i_gc_rwsem[WRITE]
2. lock i_gc_rwsem[READ]

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6dc2bc710ba8..91841b0057ba 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1616,14 +1616,14 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			int err;
 
 			if (S_ISREG(inode->i_mode)) {
-				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[READ])) {
+				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[WRITE])) {
 					sbi->skipped_gc_rwsem++;
 					continue;
 				}
 				if (!f2fs_down_write_trylock(
-						&fi->i_gc_rwsem[WRITE])) {
+						&fi->i_gc_rwsem[READ])) {
 					sbi->skipped_gc_rwsem++;
-					f2fs_up_write(&fi->i_gc_rwsem[READ]);
+					f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 					continue;
 				}
 				locked = true;
@@ -1646,8 +1646,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 				submitted++;
 
 			if (locked) {
-				f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 				f2fs_up_write(&fi->i_gc_rwsem[READ]);
+				f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 			}
 
 			stat_inc_data_blk_count(sbi, 1, gc_type);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
