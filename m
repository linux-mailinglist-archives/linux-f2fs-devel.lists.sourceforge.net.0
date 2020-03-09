Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5217EB03
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Mar 2020 22:19:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBPoB-0005Jw-7u; Mon, 09 Mar 2020 21:19:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jBPo9-0005Jo-BE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Mar 2020 21:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8bJMYyi08bN48rTof4l30gDgzsPXe6U71jm+MXJ+bQ=; b=GO8hDC0NAEYV0Re5OhfhdW2nfo
 bswIJrMtvRAgE7Ho8eTzUxErZPJuQN6do56vMaxPCbh9vrFKAGHoFenrqgPqyH+p5JSTjuAiinlEj
 D39pIbhpUzqsItFHgUi3uhbAktbqQ/YCQNTYXRfM3GxQcZJDp601RYEQ5wzszQiSdRhI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f8bJMYyi08bN48rTof4l30gDgzsPXe6U71jm+MXJ+bQ=; b=l
 bF2IUXfja1soUJpLYBJ21swfa0VRFzdBTmGIE89hXYieHq9Dg+uxk+j0B5L/eHy7zb0DEBeW0i5s5
 uS7yYDVgFFTaRWrp0KaGE1ZpdGpBFi9WehR2VHnwKcDVSAuuZnSrchJQPt3v7UVFkmpIHiWi8/ieC
 djUd7K1oQrr3lp6k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBPo8-00DxGO-Aa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Mar 2020 21:19:29 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 785E32146E;
 Mon,  9 Mar 2020 21:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583788759;
 bh=r/0ddh1RpQ0Kb/e2Qr7Lpst8p3Ed85ZZkGCtZ+74m28=;
 h=From:To:Cc:Subject:Date:From;
 b=D2hf7h+wGgtGEZX5B95XlfwL3//1UoqILs+62AOX4Id5STA3IUQOpmCyeDdtOqk1q
 I7Crl0/dViJwvjn41e8I65Pxvns2eR66aG3LoKCWssrtTM4z69+gHZTgfIV9aaJpN/
 tUyJgsR/CQ6mkSCzR8bJh2A95QxDZq2RLPgrKo1U=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Mar 2020 14:19:18 -0700
Message-Id: <20200309211918.159991-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
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
X-Headers-End: 1jBPo8-00DxGO-Aa
Subject: [f2fs-dev] [PATCH] fsck.f2fs: report real wall time
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
Cc: Wei Wang <wvw@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wei Wang <wvw@google.com>

clock_t time is per-process time, which is not wall time. For example,
if the CPU is shared by other processes, clock_t time may advance slower
than wall clock. On the other hand, if the current process is
multithreaded and more than one execution core is available, clock_t
time may advance faster than wall clock.

this CL changes it to use CLOCK_BOOTTIME (Linux-specific)

Signed-off-by: Wei Wang <wvw@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index a6fd970..c481ce4 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -801,11 +801,18 @@ static int do_sload(struct f2fs_sb_info *sbi)
 	return f2fs_sload(sbi);
 }
 
+static u64 get_boottime_ns() {
+	struct timespec t;
+	t.tv_sec = t.tv_nsec = 0;
+	clock_gettime(CLOCK_BOOTTIME, &t);
+	return (u64)t.tv_sec * 1000000000LL + t.tv_nsec;
+}
+
 int main(int argc, char **argv)
 {
 	struct f2fs_sb_info *sbi;
 	int ret = 0;
-	clock_t start = clock();
+	u64 start = get_boottime_ns();
 
 	f2fs_init_configuration();
 
@@ -919,7 +926,7 @@ retry:
 	if (ret < 0)
 		return ret;
 
-	printf("\nDone: %lf secs\n", (clock() - start) / (double)CLOCKS_PER_SEC);
+	printf("\nDone: %lf secs\n", (get_boottime_ns() - start) / 1000000000.0);
 	return 0;
 
 out_err:
-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
