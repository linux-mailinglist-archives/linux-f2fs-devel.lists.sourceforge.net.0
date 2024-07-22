Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3454493878D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2024 04:40:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sViyk-0001fI-JT;
	Mon, 22 Jul 2024 02:40:46 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1sViyj-0001fB-O0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 02:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XgoPaACOHdxYIeUc9eqLRX+KncIIzbG71ydHebrRo0k=; b=OhRDkLNg2Xh+VWpFD9BMD9mdUn
 7v3Uwi4HgeoNkBrZpHi9T0sThISiFZja472tuXFnA6h/fOw6Yd3ypDiwOGH+qrWwtmwAwZ1Tr60G7
 tabSUIeR9zJUz3yo6YGS2NVKBjxWKIVd2uunCuRqayEHGYuCUdkxoDBqtYfqiGqenu4o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XgoPaACOHdxYIeUc9eqLRX+KncIIzbG71ydHebrRo0k=; b=CHRfLWBBkcgpUVcBwCHHE2KHCF
 hpFTspwIGxGsJifNyWq8cPx9yTZzqujQFq6EIDGoD+uh0HuZT8RVWLQbH1gXeW1ZL2qSq+wG1LTg/
 fdPiWNN/66thYaOX/Vx6Al+H4W2yhU3+p9PtKQFv+5D0DHRtw+AjsNe2CFF4LLpyY3HM=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sViyi-0002Bb-JB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jul 2024 02:40:45 +0000
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-70d1cbbeeaeso298263b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 21 Jul 2024 19:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721616033; x=1722220833; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XgoPaACOHdxYIeUc9eqLRX+KncIIzbG71ydHebrRo0k=;
 b=UwKUnp5rMSzgN2bkmmmi6iQ0h5Yw3DrpZ5IMo81cP69q1qzh5i7n//kRzlzCI93HmK
 IlSpl824Imj7PpDTNqUgdA7psjAOW29fPpKKzGbhX/kuxLfn9EjpFEZpfDKeDwqKl/Ml
 xBNKyk2kCBP88EtdnLRHnU8oq+Sfb2LbtM+LhuXibvp90uCBuhYGzPvl2xHl0n1QO2nU
 KNSES7oewcj/IQA6OvyCrQ04LyP8nMe11Z/W0W8AysEla6+07HAlDYoGzsgPTOCijeVM
 UYzS+KSUTx9V1+dJm2a/gISljGDOTp5NtXeVa71Xw/ZL1CrKgEtKCYIqWyxrmFy7hvkd
 5mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721616033; x=1722220833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XgoPaACOHdxYIeUc9eqLRX+KncIIzbG71ydHebrRo0k=;
 b=oYQiu0I1TXIhTi56sVVxDiBD38vcop3ozI631aQw+AR8uzP49nmMcIxslThBr1d6nQ
 vjqQAit4OXREljX6iT5fkbGCio+sdlJdY+zGbt+MAQHf3X5unyqNVtu9qqw/mnYtob+M
 RoceoYS437HHJuHM94h9n3UkhNL6T7/nEsYwmV0/F5SAutFm3oFa/GsJYRkXr0iUT/x3
 E2DS4vAuiBu8MYZy+lhYCKwX6ym5przsMiTvUIaWoQrp/58Ygx/1jDsokhpVvijcbars
 OVWy2p3rJllXepXN+Wzd99IL1hoUdLMz97pnyOtkPkuJtEva9Io2r3Kx3gLece6ub/RV
 YkJw==
X-Gm-Message-State: AOJu0Yxb8sjXPFZOyAIJFqyMH/verxEQgb0me/f1Ky4WRvZfMDPVWlKa
 dsy4NUMq+wWjqxRwfgR1Ky6mOAwsIEsjzP3c+wAaSA+HCFouyEaq+MNJkY3lRQ8=
X-Google-Smtp-Source: AGHT+IGzd3X/sO8yD1jSaEHwiYF2YaLIio0eAVUGTerGz4kJk+9WFUaoXGIbfIcji5IOdnY9X01m6w==
X-Received: by 2002:a05:6a21:3a46:b0:1c0:e540:7336 with SMTP id
 adf61e73a8af0-1c42286b324mr4416607637.6.1721616033083; 
 Sun, 21 Jul 2024 19:40:33 -0700 (PDT)
Received: from localhost ([114.242.33.243]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f25adfasm43335655ad.36.2024.07.21.19.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 19:40:32 -0700 (PDT)
From: Julian Sun <sunjunchao2870@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 21 Jul 2024 22:39:13 -0400
Message-Id: <20240722023913.54788-2-sunjunchao2870@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240722023913.54788-1-sunjunchao2870@gmail.com>
References: <20240722023913.54788-1-sunjunchao2870@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The macro stat_inc_cp_count accepts a parameter si, but it
 was not used, rather the variable sbi was directly used, which may be a local
 variable inside a function that calls the macros. Signed-off-by: Julian Sun
 --- fs/f2fs/f2fs.h | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.170 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.170 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sViyi-0002Bb-JB
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: fix macro definition
 stat_inc_cp_count
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
Cc: Julian Sun <sunjunchao2870@gmail.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The macro stat_inc_cp_count accepts a parameter si,
but it was not used, rather the variable sbi was directly used,
which may be a local variable inside a function that calls the macros.

Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8a9d910aa552..bb407c3ebb4d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3987,7 +3987,7 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 
 #define stat_inc_cp_call_count(sbi, foreground)				\
 		atomic_inc(&sbi->cp_call_count[(foreground)])
-#define stat_inc_cp_count(si)		(F2FS_STAT(sbi)->cp_count++)
+#define stat_inc_cp_count(sbi)		(F2FS_STAT(sbi)->cp_count++)
 #define stat_io_skip_bggc_count(sbi)	((sbi)->io_skip_bggc++)
 #define stat_other_skip_bggc_count(sbi)	((sbi)->other_skip_bggc++)
 #define stat_inc_dirty_inode(sbi, type)	((sbi)->ndirty_inode[type]++)
-- 
2.39.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
