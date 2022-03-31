Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 580F24EE419
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Apr 2022 00:34:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1na3NW-0002rg-7z; Thu, 31 Mar 2022 22:34:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>) id 1na3NV-0002rV-8J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Mar 2022 22:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=acES2We7h+b61Mo8+oMpTpwxU8V43KYhLkYyDhUPIro=; b=Sl5hc5ci1rc1F7sB7cIymD6ixm
 LYJ5lyqsruR3Owrjk7c+YD3ZBump+Sc87CWrjQf2cFAt28HqshwPkDvseEDzKc+hJppxirbnkSIFl
 YP1+UPvb9pFrCtU1NtZXa+cljxAxfjdsCNQKI3Rm8cqGHwRDCu1nvJG+29D5LbZl1iKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=acES2We7h+b61Mo8+oMpTpwxU8V43KYhLkYyDhUPIro=; b=n
 S4dBsuDl6lLg81h265y0YVBBksKhINTPQ+WlavLNWhGDd3QxXPLd3e1mtt0LywQioKhCFor7oZaUu
 dxQ0JeZff9Zc70vOpWV0IZqxuvNNYx/b9KmDMvrUGg4I0H+dG7T6Be6eK2nf4oV+h2TyBefuVFu4d
 DUlLQKSeiScZvhK0=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1na3NP-0016Ce-Cc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Mar 2022 22:34:51 +0000
Received: by mail-ej1-f53.google.com with SMTP id bq8so2160996ejb.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Mar 2022 15:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acES2We7h+b61Mo8+oMpTpwxU8V43KYhLkYyDhUPIro=;
 b=LaYaFxb4308Ra+8BjjJVsy1kSa2az3SVuCIrWBRxAdwHMtb/+VOVrzEaIBCha1ZCeo
 nJqROMozxayEBaxR7ZlTP5R9Y69YpLpIPao0v5fo+Bxo94EAkVGMSNrwxa8Pi6dGVM+y
 Eq7Xjbx7dHimCkNtsWvDyU0HHWO78PgW2flQULDz7Rbb8eweGlg6kdjzIsmDZ4/9r0V2
 UgDTxGdAbG7e4qOymXlueQxgdSazgglB5ivhKn/hzFxoikhFD0966apCjt2TOF7UI8XW
 FiWPMetAnbbhliZI+PxvIfzyZN2ZCcYtxEGL2Dr2JMUqDzxS4XeLBXH6DmivLNbJ6b3c
 tQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=acES2We7h+b61Mo8+oMpTpwxU8V43KYhLkYyDhUPIro=;
 b=WnkigjJt5ZvPYcWIRGbowS+nXnxC2Lw9TmfemDs12C/cTpFAPg1r9Py7QD6gtqg77u
 Pwfnn3U8Vt/a2erc10C0s6w6yFwtdBFsdh3F2ONFTP4xHArn2dro0mFOclpGheZqY+4I
 MlZEQsVFXa9izcH8bxWA2+QIJahV2Rl/wP2dBYjdlJgw8efMOL85Cd24qoTBuSXvr0HS
 yuOXSCxpz+lBCmBZvLKT2UbtddjtY3/03zU3jc1x95bff4n+kzVWMB2w0LHBsuZ02R0H
 FisaAHBXHfk/CX5m+7MMS7n+Z3sqagtQ/NljejytkiajKpAEUVhWQyo6j/Zq3J43CqC3
 NtnA==
X-Gm-Message-State: AOAM532lxzsTxw8yY7vWNsZcIRe0OcoUXSpJynDG+AxP5KM2FAzzqodu
 nLDHn0m+8RtgiyKC0X5UpuGqgwakU/FULRwt
X-Google-Smtp-Source: ABdhPJzu84nlagno7/B/iCTh45NIAtes3ADlYNLucnAQtD/vsIqDQRUwSN2TCW8BrJEBpEFPCzOewA==
X-Received: by 2002:a17:906:c04d:b0:6b9:252:c51c with SMTP id
 bm13-20020a170906c04d00b006b90252c51cmr6916234ejb.470.1648766081039; 
 Thu, 31 Mar 2022 15:34:41 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bm23-20020a170906c05700b006d597fd51c6sm279739ejb.145.2022.03.31.15.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:34:40 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  1 Apr 2022 00:34:14 +0200
Message-Id: <20220331223414.901960-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The list iterator variable will be a bogus pointer if no
 break
 was hit. Dereferencing it (cur->page in this case) could load an
 out-of-bounds/undefined
 value making it unsafe to use that in the compar [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.53 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1na3NP-0016Ce-Cc
Subject: [f2fs-dev] [PATCH] f2fs: fix dereference of stale list iterator
 after loop body
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
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Jakob Koschel <jakobkoschel@gmail.com>, linux-f2fs-devel@lists.sourceforge.net,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The list iterator variable will be a bogus pointer if no break was hit.
Dereferencing it (cur->page in this case) could load an out-of-bounds/undefined
value making it unsafe to use that in the comparision to determine if the
specific element was found.

Since 'cur->page' *can* be out-ouf-bounds it cannot be guaranteed that
by chance (or intention of an attacker) it matches the value of 'page'
even though the correct element was not found.

This is fixed by using a separate list iterator variable for the loop
and only setting the original variable if a suitable element was found.
Then determing if the element was found is simply checking if the
variable is set.

Fixes: 8c242db9b8c0 ("f2fs: fix stale ATOMIC_WRITTEN_PAGE private pointer")
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 fs/f2fs/segment.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb991529..58695997d42f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -355,16 +355,19 @@ void f2fs_drop_inmem_page(struct inode *inode, struct page *page)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct list_head *head = &fi->inmem_pages;
 	struct inmem_pages *cur = NULL;
+	struct inmem_pages *tmp;

 	f2fs_bug_on(sbi, !page_private_atomic(page));

 	mutex_lock(&fi->inmem_lock);
-	list_for_each_entry(cur, head, list) {
-		if (cur->page == page)
+	list_for_each_entry(tmp, head, list) {
+		if (tmp->page == page) {
+			cur = tmp;
 			break;
+		}
 	}

-	f2fs_bug_on(sbi, list_empty(head) || cur->page != page);
+	f2fs_bug_on(sbi, !cur);
 	list_del(&cur->list);
 	mutex_unlock(&fi->inmem_lock);


base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
--
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
