Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE04E733363
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jun 2023 16:20:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qAAJJ-0002mK-Hr;
	Fri, 16 Jun 2023 14:20:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <colin.i.king@gmail.com>) id 1qAAJH-0002mD-F2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jun 2023 14:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6n+zCd171C8WV43Pb8fKtEBT7M8Z3ZhCd57gUNvYhvE=; b=BOhEzWtBJgyNorXABpNXvE+BQD
 MUHHOKL1IQ1koCImUmqOPUkQmrQsvTL2UztU0uu2N+WO+nix1UUc4vGBESsQrOnii7s/+ZCO7l7dT
 ZZVDqUmZ6gH5B7BWFLX9LH6BGDN1dLlrRfLn22pDecv2hGWjO+3U2q0hqFa0msnQpa4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6n+zCd171C8WV43Pb8fKtEBT7M8Z3ZhCd57gUNvYhvE=; b=R
 s4D0+JBLmnVnpsGhnM7EALdgAYwcT3gjSVALO0IvKlHaNqxEWyxp3pi5Qyg6js4QBf4FMGkyK9aX3
 Rk6hOoWi6cW9jN1Kdo48JuB9hvZjJBuiLWy//rC1xD7DAz800rdp4H3M40JFaMrKqj/IXGbw0A9ue
 BsCoNKCgKsoddBxw=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qAAJF-00063G-Sd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jun 2023 14:20:18 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-3f8d0d684f3so6357955e9.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jun 2023 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686925211; x=1689517211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6n+zCd171C8WV43Pb8fKtEBT7M8Z3ZhCd57gUNvYhvE=;
 b=eeXqpUVDzV+Mw7rLr2cyAx+rsaohyEDUCURUwby2so4enYHtlYBjTnDwSPfRk6/r8z
 v9teaBJ682YMiTwF1PuqjWDK0g+nBFdfJ5axDB/vFYsIk6Sn9kUyWJGuWyfRc/QNlFN9
 R1IdG5iWw46WB6Ca6+THP/kerTnH+3vyZDxZstxq+ISIBco63FXi1c5Y3q+9JCHiOWWw
 ReZWpTbFObecIA9wcdL9+TzghPhi5C0bADHF8TtUwkVtVRCHZaNGOIvWYICvAGE63SMh
 I+Y/bFEOHhuwvJNDd3Ht/ASiYnF3GZoAIqGNICeYLHHoW0IjvY6jSFKd7F1RYuviQNDN
 KLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686925211; x=1689517211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6n+zCd171C8WV43Pb8fKtEBT7M8Z3ZhCd57gUNvYhvE=;
 b=mD9O40q8kzVHSEsL5sqHvH9XSdT5dg5UcMvHzlEBXskz3LhZz1Sk2goRD2WOSwittg
 e6vG+/HdOz0pe1SSnqzLZ7kCX/PkfgcrLNRoX8IrXn8bZgtTyP3OJvVQhHE10eOgzLzi
 nrcyGCJsCQtC8j1rWqdHECjrRwywZa4deylzHtHspWBaNY8/7pCoRYd+jNBNn6rVNplT
 4cWMu3HI/7S9uJkkL1GZWPF/wou/EU43ypUjPxVzkfpb2ZbRuxCXxZmyJWqZZFvcnoEe
 hRbj5ZiJ72HYI+vgIBKzhidwrKadekVGkH8eSj6GJBleaqg1WxqTmGFzy7nn5I46x+bm
 5Vaw==
X-Gm-Message-State: AC+VfDwWk1e0biBS9xEYhM5ypjhSTk9UFXrjsG++zKjiEryd5SjaKbXL
 zd0Mu0IAHJMQbHv7T7rmrpQ=
X-Google-Smtp-Source: ACHHUZ76uljn5+k12odkTj+XuWoqO28oSLovWPZrDliLxUPuB2ilG33B0qBVNpEa9SmkG8qmYrEZow==
X-Received: by 2002:a7b:cd88:0:b0:3f8:fa2e:efc1 with SMTP id
 y8-20020a7bcd88000000b003f8fa2eefc1mr1009104wmj.15.1686925211164; 
 Fri, 16 Jun 2023 07:20:11 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 k15-20020a7bc40f000000b003f7eafe9d76sm2321608wmi.37.2023.06.16.07.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 07:20:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Jun 2023 15:20:09 +0100
Message-Id: <20230616142009.2332411-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The assignment to variable err is redundant since the code
 jumps to label next and err is then re-assigned a new value on the call to
 sanity_check_node_chain. Remove the assignment. Cleans up clang scan build
 warning: fs/f2fs/recovery.c:464:6: warning: Value stored to 'err' is never
 read [deadcode.DeadStores] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.44 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [colin.i.king[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qAAJF-00063G-Sd
Subject: [f2fs-dev] [PATCH][next] f2fs: remove redundant assignment to
 variable err
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The assignment to variable err is redundant since the code jumps to
label next and err is then re-assigned a new value on the call to
sanity_check_node_chain. Remove the assignment.

Cleans up clang scan build warning:
fs/f2fs/recovery.c:464:6: warning: Value stored to 'err' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/f2fs/recovery.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index f0cf1538389c..4e7d4ceeb084 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -460,10 +460,8 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 								quota_inode);
 			if (IS_ERR(entry)) {
 				err = PTR_ERR(entry);
-				if (err == -ENOENT) {
-					err = 0;
+				if (err == -ENOENT)
 					goto next;
-				}
 				f2fs_put_page(page, 1);
 				break;
 			}
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
