Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3C31BFA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:19:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3uU-0003Q2-Si; Sat, 01 Jun 2019 13:18:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3uT-0003PU-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bj6GgIhv9NlFJ7znEhD8dZYh5vCKsZFZzeO+k9KVzWY=; b=dXcgUG8or9dZqZGdoFEZbW8Jn0
 Y99y44QWOIZDwngOaQetvoPhAyVClQlkB8RrGkpKYKwM25WVaSmsbwtZFmLwElzrN38YWMG0piCkD
 Xa93lBSOSGo8iNoOn+KPRaSPPHDtgoHnyW8TjmknxllqlQlFRNQlpar4+v/5s/qWLKJE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bj6GgIhv9NlFJ7znEhD8dZYh5vCKsZFZzeO+k9KVzWY=; b=gvvZCZd6imaWQI+yXX5q3qfR7h
 +vjT9DtCnFuhycdMj9dU1eKzoPQDlGb7ddfG21Xa1+TuNnYS19a4mWwIOJ/xrsRKBtuqjCSlPlnZc
 j2aCF87BSRyi6AYnMboTSYjw9Zx1Ys+7L15i5fddwojuOW5Snyj351By3CXmwdVPmayw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3uR-0057mI-UO
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:18:57 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9197F272C0;
 Sat,  1 Jun 2019 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395130;
 bh=DQFifoSnA4WTPRNM7L36Gt4t6w84wHh5lhn7kpd4ZEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TQ6zSbBINGpkEnnBZlgscZyr1+ScUJL0FtnEPD4bjrafmnVVWLrnNzfzlDyQ1CKLI
 NSfhGfO2QIgCLwWyjJRdh0HjTdWbgVkvA0DrGbrsEpqA3GjcvFY+WWLEYaaOeWQPh1
 rOpaOUz3f65myPG+clQLtKm9ef5HhXoJ/CN1mxGo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:14:29 -0400
Message-Id: <20190601131653.24205-53-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131653.24205-1-sashal@kernel.org>
References: <20190601131653.24205-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3uR-0057mI-UO
Subject: [f2fs-dev] [PATCH AUTOSEL 5.1 053/186] f2fs: fix to avoid deadloop
 in foreground GC
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 793ab1c8a792f8bccd7ae4c5be02bd275410b3af ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203211

- Overview
When mounting the attached crafted image and making a new file, I got this error and the error messages keep repeating.

The image is intentionally fuzzed from a normal f2fs image for testing and I run with option CONFIG_F2FS_CHECK_FS on.

- Reproduces
mkdir test
mount -t f2fs tmp.img test
cd test
touch t

- Messages
[   58.820451] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.821485] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.822530] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.823571] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.824616] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.825640] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.826663] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.827698] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.828719] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.829759] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.830783] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.831828] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.832869] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.833888] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.834945] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.835996] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.837028] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.838051] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.839072] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.840100] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.841147] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.842186] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.843214] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.844267] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.845282] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.846305] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
[   58.847341] F2FS-fs (sdb): Inconsistent segment (1) type [1, 0] in SSA and SIT
... (repeating)

During GC, if segment type stored in SSA and SIT is inconsistent, we just
skip migrating current segment directly, since we need to know the exact
type to decide the migration function we use.

So in foreground GC, we will easily run into a infinite loop as we may
select the same victim segment which has inconsistent type due to greedy
policy. In order to end up this, we choose to shutdown filesystem. For
backgrond GC, we need to do that as well, so that we can avoid latter
potential infinite looped foreground GC.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ab764bd106de1..a66a8752e5f65 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1175,6 +1175,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 				"type [%d, %d] in SSA and SIT",
 				segno, type, GET_SUM_TYPE((&sum->footer)));
 			set_sbi_flag(sbi, SBI_NEED_FSCK);
+			f2fs_stop_checkpoint(sbi, false);
 			goto skip;
 		}
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
