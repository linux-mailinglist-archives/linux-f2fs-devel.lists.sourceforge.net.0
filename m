Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C52C979E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Dec 2020 07:45:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjzPz-0005Zi-Ck; Tue, 01 Dec 2020 06:45:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kjzPx-0005ZQ-0G
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 06:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uMToet0znSRwfKo3OmJ7HGKn/8IUWvwxLeY76WSpyVc=; b=VydaAYMfevjgqcp2F577lXjSgE
 rvA23elMzG8gnncJEA+dqWaqCA5g5KoB+M2UYwg/flGyDCKc/7XMhmTnOOBo5xiUU6bHTiUstpdhq
 udqn+qgblud/prFXQqz2BYRLMm+2iyvqVxyr4YXdMJyyVNwmSEGHISWnr/EuLuMPpVLQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uMToet0znSRwfKo3OmJ7HGKn/8IUWvwxLeY76WSpyVc=; b=M
 /yhqmtaCVW1/PHhJ0fNR76M2zX6ejj5rpL3qR1i76oxKrunxvpbYV71hS/m5pPqYPfLzuMdaFN/SJ
 KhZXW2c0FsvOJYoq2wX9evvhxhezR/JWcttf70+RiPb/JNsPFBdkYmlmtrBQso0FQlB81LoWU6xvd
 3hKWTr7j8vOcoqFc=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kjzPq-00DXy0-NU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Dec 2020 06:45:40 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ClXds5lK9z15TpS;
 Tue,  1 Dec 2020 14:44:49 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 1 Dec 2020
 14:45:13 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 1 Dec 2020 15:45:47 +0800
Message-ID: <20201201074547.1872-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kjzPq-00DXy0-NU
Subject: [f2fs-dev] [PATCH] f2fs: init dirty_secmap incorrectly
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
Cc: stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

section is dirty, but dirty_secmap may not set

Reported-by: Jia Yang <jiayang5@huawei.com>
Fixes: da52f8ade40b ("f2fs: get the right gc victim section when section
has several segments")
Cc: <stable@vger.kernel.org>
Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1596502f7375..f2a4265318f5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4544,7 +4544,7 @@ static void init_dirty_segmap(struct f2fs_sb_info *sbi)
 		return;

 	mutex_lock(&dirty_i->seglist_lock);
-	for (segno = 0; segno < MAIN_SECS(sbi); segno += blks_per_sec) {
+	for (segno = 0; segno < MAIN_SEGS(sbi); segno += sbi->segs_per_sec) {
 		valid_blocks = get_valid_blocks(sbi, segno, true);
 		secno = GET_SEC_FROM_SEG(sbi, segno);

--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
