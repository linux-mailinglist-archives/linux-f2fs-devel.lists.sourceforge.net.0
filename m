Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 310EAAEACDC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Jun 2025 04:39:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7IvskDMKVGlqAE0HbAsN0THOvrs4gHZxD/XWjrVfn4=; b=BJzOenorWkyB3bQJlIetRjhoBH
	aWHg6NPDy4cyaWlwQQIys58U7w4W88Ngkun/72RL4zqa3NloaPuvcU7FKi3N3Wim3zHBWVbSNKBg6
	xEEc9eoGykXq6uEOWv/wzzxNzTS9eDRgLZHd1BXxI1OFqPVUfdMsa4y+BCEqLBT1GQ78=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uUyzI-00069Z-IX;
	Fri, 27 Jun 2025 02:38:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uUyzG-000685-In
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Jun 2025 02:38:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ViCc2+8lWQMG4h6wNVX60E3HkreaNQCgb9R9RkdMbm0=; b=hdK59D/637o7Cm+bxLNxLIYPNl
 NthBcCmX6qOXBE0ZJx0V/VE4ZL5UwgJjvx8T8th5hdguTnRJf9be9Yauj0ZzGYugj34ZBDuHX35Nb
 V0a54EZzvkPH4XajNsS8CG2LBz0/yh/5fMZjfyLhoqdKmJpeaIa0wkWsFth3HR2THrrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ViCc2+8lWQMG4h6wNVX60E3HkreaNQCgb9R9RkdMbm0=; b=P
 s2wjFwCIExNW5duxjWWlTKeJyleYHrG1JGwbvYAlFAXrpeF8rH9Y3W+CihRoSiP+ABKefI0UbJy0C
 VXo0uwk/8ZfHZw5ef5x6Ul0H1NjAq5+BAb2/l9IqTIp+UqYcjGqHNLTrspDFXDfew/3jQKCG1sHWU
 sCf1m9/ekuSthW6Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uUyzF-0007Ge-Uy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Jun 2025 02:38:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 95490443E5;
 Fri, 27 Jun 2025 02:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B03C4CEEB;
 Fri, 27 Jun 2025 02:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750991920;
 bh=oMsLvDUkqKgim7HwPwGvDv4iUc8AjPZwg/gdL6qiTaY=;
 h=From:To:Cc:Subject:Date:From;
 b=CUJZKxi7fIu66jBVxtJyVEK0n/7U/XDMJeZ2WWj2XtNqnPmMRbvSO2l3mJgEsBe1q
 NaISllSVG1/M381wZ4x9fWeNoZKVj8KdOn8hnC7ZIZ38BCurFZqpTcIVj+37p9k44y
 TmLgTuRnhGQoDn+QnElM67JFmoHHWgIPp/7X1rTyzeP1/fg6EXqJG4Iwz2gsSgGnd9
 foz5aRdRJ/Gq06Fk4lDFpHGdOnyaady6jqxCRrpKe7aj1KKYls2FDBCGVYF9kmr4oN
 Waob/Yng9EsRnWyq6+AnTxtF1OINVuLKyOprzhTOUm73J9lp+8ZB0Y/FUZGPJPTqKj
 T73mm4TdFvpFg==
To: jaegeuk@kernel.org
Date: Fri, 27 Jun 2025 10:38:17 +0800
Message-ID: <20250627023818.146534-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds missing upper boundary check while setting
 gc_valid_thresh_ratio via sysfs. Fixes: e791d00bd06c ("f2fs: add valid block
 ratio not to do excessive GC for one time GC") Cc: Daeho Jeong
 <daehojeong@google.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/sysfs.c | 7 ++++ [...]
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uUyzF-0007Ge-Uy
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to check upper boundary for
 gc_valid_thresh_ratio
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds missing upper boundary check while setting
gc_valid_thresh_ratio via sysfs.

Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2b5c35ce7b8c..d74472d96026 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -635,6 +635,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_valid_thresh_ratio")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = (unsigned int)t;
+		return count;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
