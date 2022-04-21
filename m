Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2A150AB58
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8r-0007xh-Qw; Thu, 21 Apr 2022 22:19:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8p-0007x8-P1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OaT6zCE4dp7MnUL4LCoGf06ofFrGt4oAQFn/LF2mxJA=; b=L+jU9KVuuMITb9gf3swYnbyYq/
 O6ux2i6S7uUf8w1I7asf3RHOGFukTuTn87iaKQkZDt4xwwp4U0B+toFFJziidHgicuIpNCKeaI4xE
 favghbmZchz49RVQOaflN2aGfoB0J7bnaWaG22UoOttqKlZM3x71ZR9HOnP3QaY90/II=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OaT6zCE4dp7MnUL4LCoGf06ofFrGt4oAQFn/LF2mxJA=; b=XUPjeGP/scii6Kt0olqg7WoXFo
 MsRWt/EHE74RLO6lzNJvYUn0MU+ZgGHDvoaHHxp8vzn/uiaLvAq7wAInKpkDGtOzy4Wd7xoBEmeUN
 fDZ5PM4J7GoLKQaDWG72XUd7CFG8lbTC32xqOHhGpgD9+xzEzKn+JDKPBWKWAhlFI920=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8l-005sPJ-SM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:09 +0000
Received: by mail-pl1-f171.google.com with SMTP id h12so3098584plf.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OaT6zCE4dp7MnUL4LCoGf06ofFrGt4oAQFn/LF2mxJA=;
 b=ckK9SN8kK+p1P8qaZ6jVVrYbkeOwz1Idp5Bra6VlTmcuB2h1SAO2o3L2NBi6Pj4LTf
 Awz4QfnTenR2bVkRkZ4Yabn//dog0XSPb154l62MmRtv7F3Y1NidePLaN77JCXY+HhL2
 aU1IsmZFN3HOcWxrvYtKZNbA+toyh12y8By+adG/BTN5u6MTgXq91CrHXxAGTclVaUHD
 WRSL0np1xBy4/Xy7iVfTTnyni4yKoA8O5sY4cywhU5FH6wo7K8Rd4omUv+itIouUT3Mv
 xMGUJfKzL1aGka+O3W3Qn3F6qui9YVQyBXxrRCR6JK+KWaFXt7Qptei2khVgpF7KaWsF
 DLSg==
X-Gm-Message-State: AOAM530RTSULC4hKmQfDN7E0EJS8ynuPSMkJ91sYqhemcDp6RBRwSU8g
 nFutgmphFpnp1wMsyWKNQ3c=
X-Google-Smtp-Source: ABdhPJxP4uX4VNCpcwLmes3muaupzAz83/yVR03y/uVo0uY207T8GsnkGP2C6BBDhGBSFOFaxauzTA==
X-Received: by 2002:a17:90a:6d96:b0:1c9:c1de:ef2f with SMTP id
 a22-20020a17090a6d9600b001c9c1deef2fmr12651555pjk.210.1650579542301; 
 Thu, 21 Apr 2022 15:19:02 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:01 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:14 -0700
Message-Id: <20220421221836.3935616-10-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Prepare for verifying structure sizes with static_assert().
 Signed-off-by: Bart Van Assche <bvanassche@acm.org> --- fsck/f2fs.h | 4 ++--
 include/f2fs_fs.h | 2 +- 2 files changed, 3 insertions(+), 3 deletions(-)
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.171 listed in list.dnswl.org]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8l-005sPJ-SM
Subject: [f2fs-dev] [PATCH 09/31] Change one array member into a flexible
 array member
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Prepare for verifying structure sizes with static_assert().

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/f2fs.h       | 4 ++--
 include/f2fs_fs.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 7fb328ff8861..eacfd42478b8 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -381,7 +381,7 @@ static inline void *__bitmap_ptr(struct f2fs_sb_info *sbi, int flag)
 					CP_MIN_CHKSUM_OFFSET)
 			chksum_size = sizeof(__le32);
 
-		return &ckpt->sit_nat_version_bitmap + offset + chksum_size;
+		return &ckpt->sit_nat_version_bitmap[offset + chksum_size];
 	}
 
 	if (le32_to_cpu(F2FS_RAW_SUPER(sbi)->cp_payload) > 0) {
@@ -392,7 +392,7 @@ static inline void *__bitmap_ptr(struct f2fs_sb_info *sbi, int flag)
 	} else {
 		offset = (flag == NAT_BITMAP) ?
 			le32_to_cpu(ckpt->sit_ver_bitmap_bytesize) : 0;
-		return &ckpt->sit_nat_version_bitmap + offset;
+		return &ckpt->sit_nat_version_bitmap[offset];
 	}
 }
 
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 1e38d93ff40d..e6fc8a0e08f6 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -832,7 +832,7 @@ struct f2fs_checkpoint {
 	unsigned char alloc_type[MAX_ACTIVE_LOGS];
 
 	/* SIT and NAT version bitmap */
-	unsigned char sit_nat_version_bitmap[1];
+	unsigned char sit_nat_version_bitmap[];
 } __attribute__((packed));
 
 #define CP_BITMAP_OFFSET	\


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
