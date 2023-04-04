Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 444D46D65EB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji3w-0003jw-Mv;
	Tue, 04 Apr 2023 14:55:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji3v-0003jf-DR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=; b=E/QBjPku/W6TBccHU2Yc8WlgkH
 1neYBXrV2/Ueq6rqNo/AGuUBZ9Aw4vFwk6qlRV3MQvJCluIELCqGqUR0uakUAJmkyxoTYy13toZUd
 HdQgbDOzU6Ny4QHPmKrfzcBiu/A8oeswwFnMIESKh+ATL87ebXaqibeEDq+QcDB3JM60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=; b=fZAaOKW+XPteld5Bj4GExkq/X9
 FnZTjAAR9EbR2iunv018YSNWXxMI29XX7UeHp8/w2uGMPwoCa7Cg7ijNWIdX7yFsTH7uo9u79ywaR
 6nFxZCm0afReFBPtQol1Jxm65JNSm5xOXJ1jV57QIISdZKtSQixPSDTg1e7G6AZP/IAk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji3v-00023X-2r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=;
 b=SQb8yHWMvzMBsLVLdhaVAFt6X0ngmUjjMA4fgqYg0oNgREFBbCBgxR2rhpkL/BvwPWBJ4F
 qKVVJpUx+h+tHSlq6CQmA89n8q0y7Kb2b8+Ts/Cmxk96MvYVZ7RYlWm034Voso0RaT7eYB
 MjXbC3InscDJehUunC9xdLjsol2poL0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-t-RKigEbMpyr7ERCm_WPrA-1; Tue, 04 Apr 2023 10:54:59 -0400
X-MC-Unique: t-RKigEbMpyr7ERCm_WPrA-1
Received: by mail-qt1-f197.google.com with SMTP id
 u1-20020a05622a198100b003e12a0467easo22231231qtc.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=;
 b=X4PytjwtuOy42lsdC8ZYvxaRHwx5HUs1/mJRLIMlLVO9ohwv2GLeQO/87yQmifMq0K
 oO+BrTyByHhpSp+9rRsAjTPZ08vC8Wh7tcxm7A6lks+aw2Kumo4n/Qof5lB94huIUfLd
 cUllHyWlixsrmsZvTEqewQXS7Xi94UBVIdf7uTtrG8oVPW4FDhpZ7teKeNzrBCl7KXi7
 /zFQONa8XEQzJqyiexu82Rf4O0eUGR1JCuBxzm8WJFZxxFsHnLlzSMTPKa2yQrHbTbWd
 rha8g/8yt6B2jUkHGPtrjlO6WXBxMulkShB1JeiapHMyyFUY6m9QIyAnSPwKHfUD7nGm
 TTNg==
X-Gm-Message-State: AAQBX9e9uTGe4uT7e75tgya/m/ujeWPtnoGJZgof8SqHxOlKFQ8vWAq+
 V404oiAhH3EXzvsmHi0S3r+K4HJa+6taMSloDA3JN40uIiQEoM4FhjbjFDbWEoTSY5tsW9s1Xuw
 N9gztTAqqHTApH3pn6k221/eE6/ZdUPiGJPzp
X-Received: by 2002:a05:622a:189e:b0:3bc:dd21:4a0 with SMTP id
 v30-20020a05622a189e00b003bcdd2104a0mr3575664qtc.30.1680620099216; 
 Tue, 04 Apr 2023 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350ba/Mx2sYrhvQuuxEbUABini+6j6yzJy9T6p4OPPcKlZcS6dLVBbS/lM0x+VENbSuVT7xiskA==
X-Received: by 2002:a05:622a:189e:b0:3bc:dd21:4a0 with SMTP id
 v30-20020a05622a189e00b003bcdd2104a0mr3575618qtc.30.1680620098846; 
 Tue, 04 Apr 2023 07:54:58 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:54:58 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:01 +0200
Message-Id: <20230404145319.2057051-6-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Not the whole folio always need to be verified by fs-verity
 (e.g. with 1k blocks). Use passed folio's offset and size. Signed-off-by:
 Andrey Albershteyn <aalbersh@redhat.com> --- include/linux/fsverity.h | 5
 +++-- 1 file changed, 3 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji3v-00023X-2r
Subject: [f2fs-dev] [PATCH v2 05/23] fsverity: make fsverity_verify_folio()
 accept folio's offset and size
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
Cc: linux-ext4@vger.kernel.org, agruenba@redhat.com,
 damien.lemoal@opensource.wdc.com, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, rpeterso@redhat.com, xiang@kernel.org,
 jth@kernel.org, linux-erofs@lists.ozlabs.org,
 Andrey Albershteyn <aalbersh@redhat.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Not the whole folio always need to be verified by fs-verity (e.g.
with 1k blocks). Use passed folio's offset and size.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 include/linux/fsverity.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 119a3266791f..6d7a4b3ea626 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -249,9 +249,10 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 
 #endif	/* !CONFIG_FS_VERITY */
 
-static inline bool fsverity_verify_folio(struct folio *folio)
+static inline bool fsverity_verify_folio(struct folio *folio, size_t len,
+					 size_t offset)
 {
-	return fsverity_verify_blocks(folio, folio_size(folio), 0);
+	return fsverity_verify_blocks(folio, len, offset);
 }
 
 static inline bool fsverity_verify_page(struct page *page)
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
