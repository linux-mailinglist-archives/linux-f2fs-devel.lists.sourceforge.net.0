Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 967884FDF5D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 14:21:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neFWM-0005qn-Me; Tue, 12 Apr 2022 12:21:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jakobkoschel@gmail.com>) id 1neFWL-0005qh-Sn
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EPjj/sFnkjhGM2biUN3Tl6oPqdHpDSyFwE2ONZLcGJo=; b=T+8wtI1IuELUFB2J/LgnXMH7yJ
 tl5lTlt2q6V6SXSIdBkEPkr9CtS9r3y9NpyVks5i08VI5W2ex4unyNO3TSiAyoW4frh91E6SM+oSA
 KSHxyDQJJuzTZinbfyrNydlmjqN9veAR9IdeQCDTsBIwo/J6jQieoCh8RSW84XICE6uo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EPjj/sFnkjhGM2biUN3Tl6oPqdHpDSyFwE2ONZLcGJo=; b=Ee99r1xN+mvjGI36bYKXTENHZO
 vdgMHLocwfhV7/zqtd6Xgq71VUgY6y6nofXSgqLkfsQYHn/c2k0NdC7CA4GnFx8Z8jjH3BpF9mVnt
 AHmLMgOxD0V6NfPWzl3K5ass2E1fDE4Yy9Tb+yCL75v+SnUuEs1VItfz3bIOy48m3a30=;
Received: from mail-ed1-f49.google.com ([209.85.208.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1neFWF-00E0sm-KE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:21:20 +0000
Received: by mail-ed1-f49.google.com with SMTP id c6so6978518edn.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 05:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EPjj/sFnkjhGM2biUN3Tl6oPqdHpDSyFwE2ONZLcGJo=;
 b=nuTbpnQoPTPHlZCQtpdrFqrjjSokDH8oF8Eu2o2WLYoqmEHIkDhTOuF039KVucaFH6
 BiczPoEs5gfaNzxNJUdvjC2IH/rDt/I6cCOm+qjv8KzyPreJCl9C559kDfo0/21dJDXM
 TFPdoQvV1MQqCdHrnvCiug+M/3GKfTehLjVb7t30V6sY2sJ94MODDCJOe9tZzImjm2ZI
 +tfSeBh+JacFHvBsgFGH/ftHk5h1jgpa8sugL55YcszggbPTC8QMPTWtdCPyUC2/4F34
 noYFuNE7fhk+7gaSwdJCjUfHrJR78UOq4JcFJPiDaYcoqUm65Y9AsDwHtW16XGrwhKlw
 UZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EPjj/sFnkjhGM2biUN3Tl6oPqdHpDSyFwE2ONZLcGJo=;
 b=aVI7prKwNtlTODEnIAi5i4OZI0AA3ZrFrWBPOUEk8mnlzPf7P3cg5YoEjT7e6VCRyo
 Plwg0nLbKdturqXEzNTCuGp0IJPbacWQjc+VM5mTFv5f5RasgxnnhtjWm9NAFUSHMYoB
 dgod7WaIxFe5vV2BGA03UKfzVIsULRNkBek6w+uf5PRw1dMgsGNu+x3Yl7G1wnpX/yOK
 ZEvQ7oez2LDLB1RU90YT/YRthw+Nuq9c232ULnAt4i09WY1Bpf2YdJvH3pLDyCDIh9SG
 PlVddAdN+BP0aIuUrwDOthF5qKBH6sWJG0ZN1YbmLcfT7Jkq+nR4uTGZiN9jt8rELMjN
 V6Ww==
X-Gm-Message-State: AOAM532Cfaq4kQxBw3PebYc8itq/yDrNkDdFZc+aME9PgJzuI895OmWw
 KepfAkRpdcmMAobqZ3KdT9g=
X-Google-Smtp-Source: ABdhPJyCNnVdUgHBuoYZ5573qvtHmSJN7I9YwbEFcLdy45eTKGjB+NhKYFi8H5zsYU/qiEIyy4vzaw==
X-Received: by 2002:a05:6402:1753:b0:41d:7a22:3822 with SMTP id
 v19-20020a056402175300b0041d7a223822mr10867791edx.247.1649766068696; 
 Tue, 12 Apr 2022 05:21:08 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 op12-20020a170906bcec00b006e89b09a238sm1954081ejb.4.2022.04.12.05.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:21:08 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 12 Apr 2022 14:20:40 +0200
Message-Id: <20220412122040.3555423-2-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412122040.3555423-1-jakobkoschel@gmail.com>
References: <20220412122040.3555423-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: To move the list iterator variable into the
 list_for_each_entry_*()
 macro in the future it should be avoided to use the list iterator variable
 after the loop body. To *never* use the list iterator variable after the
 loop it was concluded to use a separate iterator variable instead of a found
 boolean [1]. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [jakobkoschel[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.49 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1neFWF-00E0sm-KE
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: replace usage of found with
 dedicated list iterator variable
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

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7ec1a2ef2167..7c52e352a356 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1666,33 +1666,32 @@ static unsigned int __wait_discard_cmd_range(struct f2fs_sb_info *sbi,
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
 					&(dcc->fstrim_list) : &(dcc->wait_list);
-	struct discard_cmd *dc, *tmp;
-	bool need_wait;
+	struct discard_cmd *dc = NULL, *iter, *tmp;
 	unsigned int trimmed = 0;

 next:
-	need_wait = false;
+	dc = NULL;

 	mutex_lock(&dcc->cmd_lock);
-	list_for_each_entry_safe(dc, tmp, wait_list, list) {
-		if (dc->lstart + dc->len <= start || end <= dc->lstart)
+	list_for_each_entry_safe(iter, tmp, wait_list, list) {
+		if (iter->lstart + iter->len <= start || end <= iter->lstart)
 			continue;
-		if (dc->len < dpolicy->granularity)
+		if (iter->len < dpolicy->granularity)
 			continue;
-		if (dc->state == D_DONE && !dc->ref) {
-			wait_for_completion_io(&dc->wait);
-			if (!dc->error)
-				trimmed += dc->len;
-			__remove_discard_cmd(sbi, dc);
+		if (iter->state == D_DONE && !iter->ref) {
+			wait_for_completion_io(&iter->wait);
+			if (!iter->error)
+				trimmed += iter->len;
+			__remove_discard_cmd(sbi, iter);
 		} else {
-			dc->ref++;
-			need_wait = true;
+			iter->ref++;
+			dc = iter;
 			break;
 		}
 	}
 	mutex_unlock(&dcc->cmd_lock);

-	if (need_wait) {
+	if (dc) {
 		trimmed += __wait_one_discard_bio(sbi, dc);
 		goto next;
 	}
--
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
