Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1490C4EE3E9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Apr 2022 00:18:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1na37O-0001XE-7F; Thu, 31 Mar 2022 22:18:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>) id 1na37N-0001X8-NQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Mar 2022 22:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JGGgLAEg4vKemtCj1ntyLaCyd5rpT3euBf5HMUBa/kQ=; b=GyBX1Sxesa0wQ/i2UQ30Afpuob
 jmLNCYdCvCi7wMjg/KD46Xpt9AtDU1KhhQXiOgiyj7cW0sIhvZjDHVCv0mCe2QPlWWN8aRPnpk+rP
 t37OQueeJTrkhmpSpjy7cBaJUQDjobWvDDaB8RVhW+Yg/Jo6plE6hmGoNDzN4/3XRsbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JGGgLAEg4vKemtCj1ntyLaCyd5rpT3euBf5HMUBa/kQ=; b=Q
 HQRJAPc0L8ayAqK7dbtXmcmhH14V1gSQjUaoPMraA27oxYsHmPySwXDhQDoxDrlq210LrgXx0RA34
 ZDn+W1VjNdqWNBzyiLnTRlLCHZIXcvFm5ADeD4baN+oZovxb2BHfEJwB3BsBtiYew5vUmi/EfcIkb
 YiCTj8o29FT8udhU=;
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1na37I-0015BT-HA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 31 Mar 2022 22:18:12 +0000
Received: by mail-ej1-f53.google.com with SMTP id bg10so2162884ejb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Mar 2022 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGGgLAEg4vKemtCj1ntyLaCyd5rpT3euBf5HMUBa/kQ=;
 b=E4NYH+s4Okdqjh+xibJ5yjwAj29PreK5heggPOvUbxc/0XOdOKvGymtbtO1kdi0uqA
 UTEECTNqzjgKeolfmzwke5mOwqIs4wWuLfKL5uODd4rbA40wuiQ7ID2VG13DkbzrAgpm
 TibtqBacUFO/gCVs4fOChK+vTvTI0CMQ2RJNYJBtVfbP1mKzM2Nymvi9uxeV4JX/Y66J
 ttgp9L0VTaNGCIuMHFRPcefjynbEaH9zslYB+PWJU00tFU1NLZtNFjxPG4mLEpAoYTvF
 AzKoZFjMWec/izbllW5SeSyHP8sfsHDxbbixsGlw7ym9IhCFjvSBhGQaDwVJ/I72FwfP
 M5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGGgLAEg4vKemtCj1ntyLaCyd5rpT3euBf5HMUBa/kQ=;
 b=E1x2HYApAfCaZrkCthNefiSeLtLb1iKLzv30ySURFz36DEdqSNsej+4llYeni82Mrw
 GrJCUIfqxv+8/GNaNnnfEcS7e7goi8S5pavcJSeF0BsfYil1IlsDW6M9CofS9CIUh0he
 ku8rOgCh5YJzRkzX9aDVdCCMJldjmkXEeQFJU/NfPpYic+7TL417oqqQcCWvb0mpl/V8
 CWvfL40NWe2wje7QDwCJNcK+GIJyJ7h3ScAbkqh7t1Z2vYn90Ug3ES5iSKZAkfwe3dL8
 Z9UQaVGjgDUWdsA1DWYFYHKCpPuh1sJylc8AcSpIDFm6tXlsQ+X+uucrWyT/f+hfEpM4
 VBWA==
X-Gm-Message-State: AOAM533Q+7sH9UHjPtimeSreS7YYiNoSkaLlSHna0zBeLvtkcNEqoFp1
 5mlVW9xhDVFlHKKbqj9eOfM=
X-Google-Smtp-Source: ABdhPJwsPBXkMH3zqricdh6VqGP9lTF4os4T+dHyBkSiFt6jonLB2mmicd0A0DqTtqhS+Op9ohNBFw==
X-Received: by 2002:a17:907:a414:b0:6e0:68f3:d7a with SMTP id
 sg20-20020a170907a41400b006e068f30d7amr798723ejc.75.1648765082139; 
 Thu, 31 Mar 2022 15:18:02 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c4-20020a170906340400b006d077e850b5sm267295ejb.23.2022.03.31.15.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:18:01 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  1 Apr 2022 00:16:49 +0200
Message-Id: <20220331221650.891790-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In preparation to limit the scope of a list iterator to the
 list traversal loop, use a dedicated pointer to point to the found element
 [1]. If no break is hit or the list is empty,
 'next' will be NULL and list_move_tail()
 should be called explicitly on the head directly. 
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
X-Headers-End: 1na37I-0015BT-HA
Subject: [f2fs-dev] [PATCH 1/2] f2fs: use separate list iterator variable to
 call list_move_tail()
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

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element
[1].

If no break is hit or the list is empty, 'next' will be NULL and
list_move_tail() should be called explicitly on the head directly.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 fs/f2fs/segment.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb991529..81ef2c3d08e5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4175,16 +4175,20 @@ static void release_sit_entry_set(struct sit_entry_set *ses)
 static void adjust_sit_entry_set(struct sit_entry_set *ses,
 						struct list_head *head)
 {
-	struct sit_entry_set *next = ses;
+	struct sit_entry_set *next = NULL, *iter = ses;
 
 	if (list_is_last(&ses->set_list, head))
 		return;
 
-	list_for_each_entry_continue(next, head, set_list)
-		if (ses->entry_cnt <= next->entry_cnt)
+	list_for_each_entry_continue(iter, head, set_list)
+		if (ses->entry_cnt <= iter->entry_cnt) {
+			next = iter;
+			list_move_tail(&ses->set_list, &iter->set_list);
 			break;
+		}
 
-	list_move_tail(&ses->set_list, &next->set_list);
+	if (!next)
+		list_move_tail(&ses->set_list, head);
 }
 
 static void add_sit_entry(unsigned int segno, struct list_head *head)

base-commit: d888c83fcec75194a8a48ccd283953bdba7b2550
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
