Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 76677297D02
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 24 Oct 2020 17:07:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kWL8a-000899-88; Sat, 24 Oct 2020 15:07:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kWL8W-00088N-H4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Oct 2020 15:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bt1eU264POIuNdrOdH9nSC8f6JGeCdN+uC7eB87s9AE=; b=LCM2O5Hf+keXnVAxdvFpgB8DFJ
 iZoU3S0cPl0Bnv/beMjBGcN4nhTsYRWBonFR+MR6ULlGGdKzKT/ohMpdHDTA+ZRrhyNRp9TquT2BN
 cnJCmZHXbcA+ohiT7UiO1rmHIvusQqbf6Abc4CPgLo2Yn/3piWeFqn3xdMIgkVJ2WBzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bt1eU264POIuNdrOdH9nSC8f6JGeCdN+uC7eB87s9AE=; b=Awp2oFTDbRxMhv3nrhaJmEbUcp
 pSW908CHOE6QDibMukPpolF0ppe4vSeqAvMtZm+BdjFLw513XpzAPWu/0TqLNBWCImh5M/vaKtvx0
 knrwxo8j34eF4Bwl/n0LBLnh2HJ/M4ycXbsDL6P1uh48Yucvm9CFANrHVTsQdryXYDcE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kWL8I-005R4P-6E
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 24 Oct 2020 15:07:16 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1948222203;
 Sat, 24 Oct 2020 15:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603552011;
 bh=VcDXgxS5R7QGGudNOBsdhU7KAtWrbQqRvSfyLXEfX/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YVoqSE6zIzneLSvE8qcJ1rGneE9wqFn8W/NTHthso3v8Jmv1+/UUciUzU6nOmkclg
 iHQOZmMcbzS5AYR1JW0fmtuLaLuMIs2M+pP0rFNdJjmIhJd1nFTcmMpzlugirii0HA
 JOu7TkRCPqDm19fuzGRp9Nr2/hmYHgQm9HDKNs4Q=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
Date: Sat, 24 Oct 2020 08:06:42 -0700
Message-Id: <20201024150646.1790529-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201024150646.1790529-1-jaegeuk@kernel.org>
References: <20201024150646.1790529-1-jaegeuk@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kWL8I-005R4P-6E
Subject: [f2fs-dev] [PATCH v3 1/5] scsi: ufs: atomic update for
 clkgating_enable
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
Cc: avri.altman@wdc.com, cang@codeaurora.org, bvanassche@acm.org,
 alim.akhtar@samsung.com, Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@google.com>

When giving a stress test which enables/disables clkgating, we hit device
timeout sometimes. This patch avoids subtle racy condition to address it.

If we use __ufshcd_release(), I've seen that gate_work can be called in parallel
with ungate_work, which results in UFS timeout when doing hibern8.
Should avoid it.

Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
---
 drivers/scsi/ufs/ufshcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index b8f573a02713..e0b479f9eb8a 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1807,19 +1807,19 @@ static ssize_t ufshcd_clkgate_enable_store(struct device *dev,
 		return -EINVAL;
 
 	value = !!value;
+
+	spin_lock_irqsave(hba->host->host_lock, flags);
 	if (value == hba->clk_gating.is_enabled)
 		goto out;
 
-	if (value) {
-		ufshcd_release(hba);
-	} else {
-		spin_lock_irqsave(hba->host->host_lock, flags);
+	if (value)
+		hba->clk_gating.active_reqs--;
+	else
 		hba->clk_gating.active_reqs++;
-		spin_unlock_irqrestore(hba->host->host_lock, flags);
-	}
 
 	hba->clk_gating.is_enabled = value;
 out:
+	spin_unlock_irqrestore(hba->host->host_lock, flags);
 	return count;
 }
 
-- 
2.29.0.rc1.297.gfa9743e501-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
