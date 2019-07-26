Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FCD75D87
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2019 05:45:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqrAg-00070c-9e; Fri, 26 Jul 2019 03:45:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <baijiaju1990@gmail.com>) id 1hqrAf-00070U-5V
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YEUR6IT4rKzLiHfE3iSnA+a3aUhdaLkp75DC5jJ9iFE=; b=TzLeYbiCGzpmghC7DkSieXn/lz
 LzDqtMek/STaodS2a1AZFZ5yHQJvoRyfrhZBSMcn7GF/7UcNF7aK1raIcHVancId823f02eUOHMBC
 oTpuKbBjHF5T/EH7CkCwXI06iWbF9b29euKUJ1+DvQ8pO5qubtSUirghCcqmmiuV9HUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YEUR6IT4rKzLiHfE3iSnA+a3aUhdaLkp75DC5jJ9iFE=; b=O9fUJhohTuLBwP5S0Wqq8q7LO5
 94k0xK6IN5ARVtSFvomkn9J1Q9atX4jSQUDqUO3K3M0NJ/mT0kP0hNVLCSyNVJ9tkqPPgeyEYkQUD
 exL+vC/ZDDXo127OWtUzsyZt9OYlB2TI5jRmPAd3SOv8fR60ZmHs4bn4vIP+B/og7YEI=;
Received: from mail-pf1-f194.google.com ([209.85.210.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hqrAa-00GYcx-H7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 03:45:29 +0000
Received: by mail-pf1-f194.google.com with SMTP id r7so23794152pfl.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Jul 2019 20:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YEUR6IT4rKzLiHfE3iSnA+a3aUhdaLkp75DC5jJ9iFE=;
 b=j00M4OC8PCI2W3vPzRtVOnSDPCCvzDTcxlq4/I3ykR9QO7U9HQoARCPZwLTYj57IMR
 pESEkpWw+aZ3pl0j7yM0TuZgDnu+5C5cyBnjvmURhhvic0YztcSgmvWZZA+MUV83pdzj
 80nczhpBXjXna9OeLX9hoM8qUMSHABNlvR9PPWfPdWxH0SkhAeXYoPiasjd83GcHcXaU
 dUtEZ09LDnPesZK4OsnajvAHrnFjiMXbaDooJMdI/OSxVY4lFFhy9qsyd2yE+JXNHzPZ
 fG8lF5mPHWlwzoiCCrtoD1F5fr/zi8keUkyoR68ajaAmhDSNGDpwy/w88VKDzXvQ0Jo3
 pvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YEUR6IT4rKzLiHfE3iSnA+a3aUhdaLkp75DC5jJ9iFE=;
 b=WV8Dtx+cq3BT1C1mL+xTIVQH1uBUzNb4rglmwmIhTwXL/J5grAwNqYMYQvqXDATePO
 sE9RYz/EuRO85S6C1rlSotzQ1B1RFNrZvGv4tZ1uB9W4SGD4xEAnsw+A3aZO57EMXld/
 uYkhkSxXHu+nlWRY9i3+duwa331XXDbXXX/sZ0S3H6MPgCUVUmINdPNE+vxxcQJwP7Qq
 P5X5BHcHd7ocxsAQxeHNKhKuVDgpmByFBYeWU+43vN5vVoUCL2ARFTpngJja78LlqVxA
 hyQnbZGKfn5mtpyeTHZpUrEQWZt9RTGZWgezNd96mCfiXNcvElonCaYU0slQGimTET5O
 mQMg==
X-Gm-Message-State: APjAAAXOFNWURKl10ooCJxrRIfqo8i6B8v0Rg/aVSSKzRoTPoBFHtAn2
 hpXj9BMGTmuWkg/VfVtF4NI=
X-Google-Smtp-Source: APXvYqyaJNHvmFnHtNTPgSf190jGCxD+R5RowGCCh5Euoe7WJmX+F0fbeguiW+l6reIVXxiRujt4ug==
X-Received: by 2002:a17:90a:37ac:: with SMTP id
 v41mr91718590pjb.6.1564112718669; 
 Thu, 25 Jul 2019 20:45:18 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id h129sm48228710pfb.110.2019.07.25.20.45.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 20:45:18 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: jaegeuk@kernel.org,
	yuchao0@huawei.com
Date: Fri, 26 Jul 2019 11:45:12 +0800
Message-Id: <20190726034512.32478-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (baijiaju1990[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (baijiaju1990[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hqrAa-00GYcx-H7
Subject: [f2fs-dev] [PATCH] fs: f2fs: Remove unnecessary checks of SM_I(sbi)
 in update_general_status()
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
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In fill_super() and put_super(), f2fs_destroy_stats() is called 
in prior to f2fs_destroy_segment_manager(), so if current
sbi can still be visited in global stat list, SM_I(sbi) should be
released yet.
For this reason, SM_I(sbi) does not need to be checked in
update_general_status().
Thank Chao Yu for advice.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/f2fs/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 7706049d23bf..9b0bedd82581 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -67,7 +67,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->nr_rd_data = get_pages(sbi, F2FS_RD_DATA);
 	si->nr_rd_node = get_pages(sbi, F2FS_RD_NODE);
 	si->nr_rd_meta = get_pages(sbi, F2FS_RD_META);
-	if (SM_I(sbi) && SM_I(sbi)->fcc_info) {
+	if (SM_I(sbi)->fcc_info) {
 		si->nr_flushed =
 			atomic_read(&SM_I(sbi)->fcc_info->issued_flush);
 		si->nr_flushing =
@@ -75,7 +75,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		si->flush_list_empty =
 			llist_empty(&SM_I(sbi)->fcc_info->issue_list);
 	}
-	if (SM_I(sbi) && SM_I(sbi)->dcc_info) {
+	if (SM_I(sbi)->dcc_info) {
 		si->nr_discarded =
 			atomic_read(&SM_I(sbi)->dcc_info->issued_discard);
 		si->nr_discarding =
-- 
2.17.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
