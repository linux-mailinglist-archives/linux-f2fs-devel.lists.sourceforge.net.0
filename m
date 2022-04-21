Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E21E550AB67
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Apr 2022 00:19:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nhf9E-00086R-AS; Thu, 21 Apr 2022 22:19:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bart.vanassche@gmail.com>) id 1nhf9C-00085T-C3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zOodaExA+VTVjvURkZ5AeE2/qBK0D9zKwiZrrYTt9+0=; b=g2oBNm3XZp5bWkvczXo8Rnco/D
 Xrt5/76K7/M0z1z/pirOm2mivAWx7TQYsjZM7r9ZNDiaoWLCnOUjV9oQzA+TVUlNvL9gSZA8yjWdq
 Mu9E+TT9I3BOuT4kwOG8YgGSEOEpYU1cmLqmeYzUTzVDVTnW3AKNI7kDw+l3p+ovkvyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zOodaExA+VTVjvURkZ5AeE2/qBK0D9zKwiZrrYTt9+0=; b=bdmu7xZT439KSeZxdk8YOsVe8H
 ozi7MG3KQUYatqgZm+UIwleuVeX+Dpy2RJ8m6o4apjm1NlQ1YiTXuDQ/+GTGkDrzcgGMQYYe9MSBX
 dMBJyEyQpDAFzaV7yC5XdhY0shZ9HBbBTMrHPejQPEgDryeFu50923j6x7X/urWqF3Rg=;
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nhf9A-0002xv-NX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Apr 2022 22:19:33 +0000
Received: by mail-pg1-f175.google.com with SMTP id k14so5832299pga.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Apr 2022 15:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOodaExA+VTVjvURkZ5AeE2/qBK0D9zKwiZrrYTt9+0=;
 b=2V7HSFMYN322xzwWtO/HdHsBTrx8wgUNs4Z5ad5Ck3o3c6Uypb3ksio648SN1yrxkL
 b9Y38QPdzJXOY+IzEKdnRX8AzQ4DZgxOFV6+8daAKY7/9Nfzp69iFpg/xpjp211Lx5z4
 38Y56nEo68YTanlRKEpl8n0vjZDAYtyFS9run0nES4zZa8oES0BOPA7wKzehNzFW6uX6
 nsyCH1GD0ACbeqvb3a9MsK+p/L2tBf9lyzsgNahczynHOEPO8orcRwkAjeLkDQw9jA+B
 sF6ywYNFW7QgOr4XwiEOAhoWg1kpawBJs+0T7O38WaIK2glUCoVhSAXS1vGGQTdFQ9zw
 /iJQ==
X-Gm-Message-State: AOAM530jZpcc2DJDvdsVsb4ROyRbLf8GCSqnnWUSMbGViyrJqZax7WrT
 Ycsq/RHVE8pdkODi+EwRF6UJa8Vw/TuPBQ==
X-Google-Smtp-Source: ABdhPJyi99FoN7EuZVL1S97QiPZSQRYCi6iENRFJ1RAdBQNOIBAQEGOWEODt8SFkjVleDc71h7MOFA==
X-Received: by 2002:a65:4185:0:b0:399:4c59:e3b1 with SMTP id
 a5-20020a654185000000b003994c59e3b1mr1322610pgq.154.1650579566855; 
 Thu, 21 Apr 2022 15:19:26 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:a034:31d8:ca4e:1f35])
 by smtp.gmail.com with ESMTPSA id
 hi21-20020a17090b30d500b001cd4989ff4csm3794876pjb.19.2022.04.21.15.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 15:19:26 -0700 (PDT)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu, 21 Apr 2022 15:18:30 -0700
Message-Id: <20220421221836.3935616-26-bvanassche@acm.org>
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
 Content preview:  Since 'remained_blkentries' is unsigned, the assert statement
 that verifies whether that variable is positive will never fail. Hence remove
 that assert statement. Signed-off-by: Bart Van Assche <bvanassche@acm.org>
 --- fsck/segment.c | 1 - 1 file changed, 1 deletion(-) 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.175 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [bart.vanassche[at]gmail.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.175 listed in wl.mailspike.net]
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
 EnvelopeFrom freemail headers are different
X-Headers-End: 1nhf9A-0002xv-NX
Subject: [f2fs-dev] [PATCH 25/31] fsck/segment.c: Remove dead code
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

Since 'remained_blkentries' is unsigned, the assert statement that
verifies whether that variable is positive will never fail. Hence
remove that assert statement.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fsck/segment.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fsck/segment.c b/fsck/segment.c
index 254a0d1425e9..401cbb69e0d7 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -537,7 +537,6 @@ static void update_largest_extent(struct f2fs_sb_info *sbi, nid_t ino)
 		cur_blk += count;
 		dn.ofs_in_node += count;
 		remained_blkentries -= count;
-		ASSERT(remained_blkentries >= 0);
 	}
 
 exit:


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
