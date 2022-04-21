Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A850AB5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf8w-0007zR-VI; Thu, 21 Apr 2022 22:19:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf8v-0007yt-EG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ViK/jyYj7BGICqoKhyvVxGf2Lj3oARNk5B6vJyIQh24=; b=CEWgcSd4TQEJr7N7gybYM56fRf
 3Mrba9rrF4vbt11gGJ68jI2RR62QL/7q6Hq7JVNabyE8jbWs8vgTg5/fU1GQvs9/WGeVGgiyAPywR
 lLPvvo8X9rFQ+rPGTT85wDbYGN/9+988QWgIt4x9hI/NSleMXLsQpZn8HoHRHe2FjcNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ViK/jyYj7BGICqoKhyvVxGf2Lj3oARNk5B6vJyIQh24=; b=WckzPpO6E+HifzWxSjDhT92TuU
 AdlxNntz5syNDjD+V1vm1dcBswSAym72wqb/pPcFMRW5hIRd5fTlKlwtMXz0r/rSPDWnx3GFWX79T
 T+WE9aklBJt8Zs+SOLr05/Kd/wunS+UisZMVajmPooMvHUBfRq16geiFFiEG7WbsaBvw=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf8t-005sQ9-Iy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:16 +0000
Received: by mail-pl1-f170.google.com with SMTP id q1so5595866plx.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ViK/jyYj7BGICqoKhyvVxGf2Lj3oARNk5B6vJyIQh24=;
 b=EIK7ZLuDk6jbEqVKsQlC8XTPMTXuVax8Oc9XvEMHMWzjrBbZJhh6b9z2ob5d5DSCuK
 65GQeNWHbjgfed1JMZu60sU3i0YptqQAeGRD9KFiXckEZLDy6rDx9wxsjBhSPlYsg5ep
 1PZylUHQEzZdGPOdArtwk11NeuH0MoCIDhyihNUKxmP9SQtN68ANOkSGlPGWygQYeNt+
 loJKicdvGLQrBKbAjQF0WaqBnr6oBPfaWHzIcAtZvXal7u/tYU7dWgvf1uLbBcyY8vEu
 Dclz7zDTy56bvL7/1nqmluFrfWNP9BlzXKIuSPKYTIRcg+wARvDFmKKhufuqAh7Ppnvl
 ainw==
X-Gm-Message-State: AOAM530KWPGgbyXG/v9bW3OIjn9Ch9zotAqRBMFDgAPKF6NmpXduCzfN
 TugBuL+B9hIWzVCoZQyr/Qk=
X-Google-Smtp-Source: ABdhPJwSnoWSlx2i73QwSdHysc3jk398fcByorXf7oHKnIFzEJ8YvIsQISP+hRTkf82eytmf7dkAiQ==
X-Received: by 2002:a17:90a:4203:b0:1cb:6ba1:fcba with SMTP id
 o3-20020a17090a420300b001cb6ba1fcbamr12577896pjg.20.1650579549892; 
 Thu, 21 Apr 2022 15:19:09 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:09 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:19 -0700
Message-Id: <20220421221836.3935616-15-bvanassche@acm.org>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
In-Reply-To: <20220421221836.3935616-1-bvanassche@acm.org>
References: <20220421221836.3935616-1-bvanassche@acm.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Move the be32_to_cpu() definition next to the little endian
 conversion functions. This patch improves portability since the MinGW ntohl()
 function exists in another library than the C library. Signed-off-by: Bart
 Van Assche <bvanassche@acm.org> --- fsck/quotaio.h | 2 -- include/f2fs_fs.h
 | 2 ++ 2 files changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf8t-005sQ9-Iy
Subject: [f2fs-dev] [PATCH 14/31] Move the be32_to_cpu() definition
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

Move the be32_to_cpu() definition next to the little endian conversion
functions. This patch improves portability since the MinGW ntohl()
function exists in another library than the C library.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/quotaio.h    | 2 --
 include/f2fs_fs.h | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fsck/quotaio.h b/fsck/quotaio.h
index 999e800f82c7..0024fe570727 100644
--- a/fsck/quotaio.h
+++ b/fsck/quotaio.h
@@ -197,8 +197,6 @@ struct quotafile_ops {
 #define __force
 #endif
 
-#define be32_to_cpu(n) ntohl(n)
-
 /* Open existing quotafile of given type (and verify its format) on given
  * filesystem. */
 errcode_t quota_file_open(struct f2fs_sb_info *sbi, struct quota_handle *h,
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 49438eb2e6f2..60b6dfced74b 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -194,6 +194,7 @@ static inline uint64_t bswap_64(uint64_t val)
 #define cpu_to_le16(x)	((uint16_t)(x))
 #define cpu_to_le32(x)	((uint32_t)(x))
 #define cpu_to_le64(x)	((uint64_t)(x))
+#define be32_to_cpu(x)	__builtin_bswap64(x)
 #elif __BYTE_ORDER == __BIG_ENDIAN
 #define le16_to_cpu(x)	bswap_16(x)
 #define le32_to_cpu(x)	bswap_32(x)
@@ -201,6 +202,7 @@ static inline uint64_t bswap_64(uint64_t val)
 #define cpu_to_le16(x)	bswap_16(x)
 #define cpu_to_le32(x)	bswap_32(x)
 #define cpu_to_le64(x)	bswap_64(x)
+#define be32_to_cpu(x)	((uint64_t)(x))
 #endif
 
 #define typecheck(type,x) \


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
