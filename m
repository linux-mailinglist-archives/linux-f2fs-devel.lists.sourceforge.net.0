Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461561679A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqGLJ-0007fG-VT;
	Wed, 02 Nov 2022 16:11:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vishal.moola@gmail.com>) id 1oqGL6-0007dU-CE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FlCTXZScWdlX0aVFB5ZBh3WOEeZ8Gy5thYVDo4sECVo=; b=OV1Bi4E49mBKtbMpBDmbFBsIjS
 dyUog4XQXZSxBzdtZ2uqNV8zzpssYUCOiFGrlERjACeR0pF4KqXNM0hiaehNHY3zn0k2M5VK6HeMI
 +Hl4CsCDXR4P1HhNS4o+aMZfNCbr8devlvc191YA/nmIe30g4KSo9pxXyyGDO3PM9O34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FlCTXZScWdlX0aVFB5ZBh3WOEeZ8Gy5thYVDo4sECVo=; b=Rf4jIkjr2ZaOzAxHUd8NQKORQp
 s473CtbRLH9aCEa/sREXU1UOWAUrkoJWzhFhsnFYaPtLFYn1x9137nUHcV2UfZ1Jyey2BERCiMS+P
 St5D+hZrHSClybj630dX5TNCvMjAulHsminQXMASwejcddcVZNvKIUBHd2eH/AbalxfI=;
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oqGKy-00059S-Hp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 16:11:36 +0000
Received: by mail-pg1-f174.google.com with SMTP id e129so16628099pgc.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Nov 2022 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FlCTXZScWdlX0aVFB5ZBh3WOEeZ8Gy5thYVDo4sECVo=;
 b=Poe9rdZUsWmbLff7Q1y+73uQ67NvWbfBoZzK/+dTQlX7qeN0LjEz/N/rBuja3dj4uQ
 V58XNqhmnAdXT/u5YYVAqWdQcM7IpZGzdPiS7WJ/SuI2UpsvG2jJQJ+QAjUVQ7//El8f
 fQS1kK8H9mty21sekVYBC67x1RIEUTD3q3zpcHhzYIZ7P8X4Gbv+aZIdKeXKk4H9Em2r
 Lzi0RsgndfKDM+rr+KiKcBf1rF+xpOLsZp5o+CS+hW7qQC1gAlW/yAz9e7GEL5+HY1Ox
 2g2BT9bK3F21AxzoWn7zFoPz5OORdwHo0wvIqeyqfrg05E/t6JECV9fE6vKrC2SiNIWT
 MocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FlCTXZScWdlX0aVFB5ZBh3WOEeZ8Gy5thYVDo4sECVo=;
 b=WF0Ac4TVbYBd91gBjsa8/HhZCJheBKY0chxsxDq4u0GRuYBPjJFehR5DWgohuiq5yf
 5u+iL2MMpi9KUupMHgwNEshNJb5OwpbJfJyoHoqu8MQr/qswlqQgfmO0/7MarmGyt0v6
 Ag/vLEJBdfwfUM5B/ZLwTvxp3bmbGwoMNxatVue0SqDJmq8RIuxeNdnFRCNt0vht8ZeU
 aZA9UP0UelATrG/AqRV/7oP7t1zbfwr84V/keGI0XAN0aiHpuRzew0d0/0Tf4OVnPg/c
 aiDnO+eX5ShKuYWJphmmOEUy6X2eP6xN8YmnaEdCEHKoscHJmJCFzguaOMd9TEWmY6lZ
 difg==
X-Gm-Message-State: ACrzQf1kwv5CkGqa2JVtDHOKtqxthP5rlVDZufs0ath3AVASuIPjVF4Z
 CXYgob4x0gekn7NfF3655xY=
X-Google-Smtp-Source: AMsMyM7qibMFP4MyzDtzWi/W3QQD3NnJO1ppwFeeVWeabtq6FG43QL7qxxbpoZrNHocmvogYaW3TuQ==
X-Received: by 2002:a05:6a00:b47:b0:56d:5266:464c with SMTP id
 p7-20020a056a000b4700b0056d5266464cmr18973688pfo.2.1667405486894; 
 Wed, 02 Nov 2022 09:11:26 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::8080])
 by smtp.googlemail.com with ESMTPSA id
 ms4-20020a17090b234400b00210c84b8ae5sm1632101pjb.35.2022.11.02.09.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:26 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  2 Nov 2022 09:10:21 -0700
Message-Id: <20221102161031.5820-14-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102161031.5820-1-vishal.moola@gmail.com>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert function to use a folio_batch instead of pagevec.
 This is in preparation for the removal of find_get_pages_range_tag().
 Signed-off-by:
 Vishal Moola (Oracle) Acked-by: Chao Yu --- fs/f2fs/node.c | 17
 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [vishal.moola[at]gmail.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oqGKy-00059S-Hp
Subject: [f2fs-dev] [PATCH v4 13/23] f2fs: Convert f2fs_sync_node_pages() to
 use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert function to use a folio_batch instead of pagevec. This is in
preparation for the removal of find_get_pages_range_tag().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index a2f477cc48c7..38f32b4d61dc 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1935,23 +1935,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				bool do_balance, enum iostat_type io_type)
 {
 	pgoff_t index;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	int step = 0;
 	int nwritten = 0;
 	int ret = 0;
-	int nr_pages, done = 0;
+	int nr_folios, done = 0;
 
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 next_step:
 	index = 0;
 
-	while (!done && (nr_pages = pagevec_lookup_tag(&pvec,
-			NODE_MAPPING(sbi), &index, PAGECACHE_TAG_DIRTY))) {
+	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
+				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
+				&fbatch))) {
 		int i;
 
-		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+		for (i = 0; i < nr_folios; i++) {
+			struct page *page = &fbatch.folios[i]->page;
 			bool submitted = false;
 
 			/* give a priority to WB_SYNC threads */
@@ -2026,7 +2027,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			if (--wbc->nr_to_write == 0)
 				break;
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 
 		if (wbc->nr_to_write == 0) {
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
