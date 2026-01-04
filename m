Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B42FCF0825
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 04 Jan 2026 03:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EpYMuVSPQE8Ru34gAsmWWiq8ZYO5s+uc1klEXr9kwE=; b=fN+pkx9jLYqjM6ZFAPLl+AQ/AR
	cwNK/zAMMsrdTneMZqrJ8rrTU3BHv9FND5IzNR3aEBgypAdoQXQI/tmPfhHF9uFkjY7GpCxWJPe07
	uOgbBoreZauNOr0BlvkdQGdTruzqLwt3nnvGHQsFgIk7If4N1RPqMDPBL7NYdhXYfPNo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcDXb-0001oZ-9s;
	Sun, 04 Jan 2026 02:08:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vcDXZ-0001oT-Qg
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kF+rMkUmwyk6JLKU+jcq3unZupoXvD+Oj8/x6ng2aMQ=; b=h/jQnxe8m4uwX745dsnHe7/MQ0
 M/5XWv34Bfz+a1A+VzSycJcjigscrZ/T2c5nY213ECSgO7naRo4zLxXu93dEV8KCPMNe7eTnCDzks
 XjrgUttBuVAWmmGnzh2B6b+P1sJ4v9C6cNwFLDggUXBROYy9XeqcC/4cA1LykqwX62Jc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kF+rMkUmwyk6JLKU+jcq3unZupoXvD+Oj8/x6ng2aMQ=; b=b5hzRXJyUW9OtVm4xw8CDS9Cms
 NpYaXdsX1pPGHBQ9OFjbKrEKsj10GZmWmuvYMVC/pqbMjFcBSyTPlMTEAVnt/x5rWcu+cJniEU0zC
 Ttd2k829SOovrsv4X2jYnnTx4bfXtXWTOMw8X0ZysI9iAkR2+MzyRVMPsKNgt2BC4Zvw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcDXZ-0005no-Cy for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Jan 2026 02:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 23942440E1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  4 Jan 2026 02:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4111C19423;
 Sun,  4 Jan 2026 02:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767492496;
 bh=WFWTDOe5Mo4IfsILZHZfmp53EMemb/I14Nce94LbeZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E3w1SX5Erz++QpQ+bGHaL8s5H1GAVVORKQ413MMsLk4dIRh42aPP12BYg8lzrIq9Q
 oCiYeL2MwWnWYWXIovWw/Yb3E3ILIDc9mXX5BSn/STGxqY3PaojFJ47/TjqufcJFnc
 hzA9QBjmKRAm9mJMTl7kxMN/ywdVaoUUteqA4qTEaNdM7r6+TBcjKjwjqhRsam4Ph5
 hENW805NvOwco5USpCvCQONWwEGWThyyNVmkUf7798XpePGcVpi7/w6fTFElEgu4O1
 VJmxZW5GA225qciVwLIVmzcim+1TTXwRKSDQC/UuRp6h8iRe0EQjfAq6/1ePVK72Wc
 Byyk0j8s6jYwQ==
To: jaegeuk@kernel.org
Date: Sun,  4 Jan 2026 10:07:24 +0800
Message-ID: <20260104020729.1064529-9-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
In-Reply-To: <20260104020729.1064529-1-chao@kernel.org>
References: <20260104020729.1064529-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  No logic changes. Signed-off-by: Chao Yu <chao@kernel.org>
 --- fs/f2fs/f2fs.h | 3 +-- 1 file changed, 1 insertion(+), 2 deletions(-)
 diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index 59615f590d79..cb9e94904c6b
 100644 --- a/fs/f2fs/f2fs.h +++ b/fs/f2fs/f2fs.h @@ -4988, 8 +4988, 7 @@ static
 inline void f2fs_io_schedule_timeout_killabl [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vcDXZ-0005no-Cy
Subject: [f2fs-dev] [PATCH 09/14] f2fs: clean up w/ __f2fs_schedule_timeout()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No logic changes.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 59615f590d79..cb9e94904c6b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4988,8 +4988,7 @@ static inline void f2fs_io_schedule_timeout_killable(long timeout)
 	while (timeout) {
 		if (fatal_signal_pending(current))
 			return;
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+		__f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT, true);
 		if (timeout <= DEFAULT_SCHEDULE_TIMEOUT)
 			return;
 		timeout -= DEFAULT_SCHEDULE_TIMEOUT;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
