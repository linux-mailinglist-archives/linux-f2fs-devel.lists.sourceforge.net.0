Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AA536466
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 May 2022 16:57:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nubPT-0001OW-S3; Fri, 27 May 2022 14:57:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nubPS-0001OO-Q4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 14:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=78Ksa+8QbLDGcn2BdB7KCF7NFTAfdN1U8V+FsjVU5k8=; b=UpKhzMO55yCMcCV88oZiGwSII3
 9pZvEDr9qKpO0QCM/zjiX3ZFt2hc6K8Tcly8yZdRAWrA39m97K8dFFf5q06y/nzWtMfks5cV46xCN
 mqmXrdzPNY/IBWvYFYqEkxmMf282WfeYzyQz5Iw0IcVJqN4cgyI+CzIyKEpC82S2kOb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=78Ksa+8QbLDGcn2BdB7KCF7NFTAfdN1U8V+FsjVU5k8=; b=M
 afmsqXX5203OnErFTd/AoJ6vWMsvBUzMKG7oHQ8pGxaWvzqK6d9FqdWXlGowjT2M0SccrnmKMMJ+S
 GNUJjgONfT3z3JvCWrL6/Qf+XbO6Bn10E3YFl05FQs9V64wVCRfyXRcxKUYtxsrb4bedcokBYY7XD
 zckY2Ma7N/AYvFNw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nubPP-004PGX-VN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 14:57:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D884EB8252D;
 Fri, 27 May 2022 14:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB63C385A9;
 Fri, 27 May 2022 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653663455;
 bh=tpEtjd4nbyNCejM6AtwsnItS+PD48F89/FUa062YJUI=;
 h=From:To:Cc:Subject:Date:From;
 b=iPBtkL6xdM/Z60+U7iPOu+FD9LGBe209M7wbOabX3NhUNr6aqDdif0CFhQGh3xHi0
 sytLxpuV82gBilWI9NucufMGvcNR4Rm260e2Po/Lzb7JWmwJcSUvyBXQUjx9BWijLF
 LGwHIGxgHj5SbwCA9d7FYtc67qK1YUQKhXpTAKCudqL4RZzIeiyjTrEcd+ktP7Wt/T
 5NorrMBpQruxf0NNTVlzJYbKFzrn58FjFtRS9u++b4HMJvy5uUP4VD6O+xYhCh95dR
 0uETkItq9qqAwE9+i4H3bIlnfMM89dEclAqPZSrt8/sa8jfLt7OKw3YdIBwceFWjbZ
 Ik68wOvD9ZtrA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri, 27 May 2022 12:13:30 +0800
Message-Id: <20220527041330.19951-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In order to garantee migrated data be persisted during
 checkpoint, 
 otherwise out-of-order persistency between data and node may cause data
 corruption
 after SPOR. Signed-off-by: Chao Yu <chao.yu@oppo.com> --- fs/f2fs/file.c
 | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nubPP-004PGX-VN
Subject: [f2fs-dev] [PATCH] f2fs: fix to tag gcing flag on page during file
 defragment
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

In order to garantee migrated data be persisted during checkpoint,
otherwise out-of-order persistency between data and node may cause
data corruption after SPOR.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a05d842a7e72..e2310c91183c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2602,6 +2602,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 			}
 
 			set_page_dirty(page);
+			set_page_private_gcing(page);
 			f2fs_put_page(page, 1);
 
 			idx++;
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
