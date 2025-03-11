Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7AA5BA68
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 09:05:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trubi-00053u-90;
	Tue, 11 Mar 2025 08:04:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trubg-00053f-AK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 08:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AAUXgMeZK3Q64IQewCw6DtTIcrEWB9DeMBtGwE2AadE=; b=TOiPaMhAjBUmfamOrvK3GYraw1
 KgNqhaIQH4EhN+atZgq41jAgcnZvdMgR7q0zjxxHYqo0aVceO7vdWzw2TDvZCxgK1kKf2aFkUU8Iz
 zXGB06teVXb1hipjfVMWmf2O1fbk4JqiwCHw/tnrGQSxN9jo1MDdsxAYS5xBtxi6vp70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AAUXgMeZK3Q64IQewCw6DtTIcrEWB9DeMBtGwE2AadE=; b=a4EuxhYWeo14/cvYJqzjFWA073
 WTH5/J+i2DSWH6IhJ87i1k+T4UsnFlMO4fbqaeTXRPRKD1pfceMxfQOrQB8BtezDn1n3LgF8yMqM7
 PO88sf3NSLN9m70LTch29ToC2gcT0S5+jLXJLDCOB5JJiwuv+Ax8I48s/mTaZLmrz1iY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trubb-00051w-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 08:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 536E55C4CE5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Mar 2025 08:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D5CC4CEEE;
 Tue, 11 Mar 2025 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741680280;
 bh=n74Q+Fo38Qqi4LLhMmspI7Gq5r0ceUnTLDVgnA8ssQs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hs60DmJUdPqFhpK0PlioTPj/kRvct5XGLFK5rKGlyBP2mpSXBXPd8MxGmVfUuRj3w
 mHMtTlLpcP9iu3sfs//x7WyoEsq/7MoX9ZgQXFKwJcppp2Xtg3v0XYo0oEnCu5mioR
 6vN5DQWqPV5wCagPf2oFpS102KNCKCrY4lL7a8J3N6JPAfHhAI1GItG1TyV+qhu3pa
 olQLAiti65YZauTYiKpbgu5vY5N3kfGcAfmw8HaUTn4GV2KPiDhUqP1FZ6jA1/pqMz
 VFfK05cNyZd0QDehV4L3wckTuEm8jkHRjzpRjr1hR6dO8ShkxxLjk1Gf757mSAHmI4
 9aYF+i2SGyXVg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue, 11 Mar 2025 16:04:28 +0800
Message-ID: <20250311080430.3696582-4-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250311080430.3696582-1-chao@kernel.org>
References: <20250311080430.3696582-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Otherwise,
 mkfs will fail due to there is an existing filesystem
 in the image. Cc: Jaegeuk Kim <jaegeuk@kernel.org> Signed-off-by: Chao Yu
 <chao@kernel.org> --- v3: - split change from f2fs/009,
 and cover both _scratch_mkfs()
 and _try_scratch_mkfs_sized() common/rc | 4 ++-- 1 fi [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trubb-00051w-Fw
Subject: [f2fs-dev] [PATCH v3 4/6] common/rc: use -f for mkfs.f2fs by default
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, mkfs will fail due to there is an existing filesystem
in the image.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v3:
- split change from f2fs/009, and cover both _scratch_mkfs() and
_try_scratch_mkfs_sized()
 common/rc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/common/rc b/common/rc
index ca755055..23b642f4 100644
--- a/common/rc
+++ b/common/rc
@@ -993,7 +993,7 @@ _scratch_mkfs()
 		mkfs_filter="grep -v -e ^Warning: -e \"^mke2fs \""
 		;;
 	f2fs)
-		mkfs_cmd="$MKFS_F2FS_PROG"
+		mkfs_cmd="$MKFS_F2FS_PROG -f"
 		mkfs_filter="cat"
 		;;
 	ocfs2)
@@ -1336,7 +1336,7 @@ _try_scratch_mkfs_sized()
 	f2fs)
 		# mkfs.f2fs requires # of sectors as an input for the size
 		local sector_size=`blockdev --getss $SCRATCH_DEV`
-		$MKFS_F2FS_PROG $MKFS_OPTIONS "$@" $SCRATCH_DEV `expr $fssize / $sector_size`
+		$MKFS_F2FS_PROG -f $MKFS_OPTIONS "$@" $SCRATCH_DEV `expr $fssize / $sector_size`
 		;;
 	tmpfs)
 		local free_mem=`_free_memory_bytes`
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
