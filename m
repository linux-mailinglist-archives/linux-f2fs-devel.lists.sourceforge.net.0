Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF80C6D65FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4L-00025K-KG;
	Tue, 04 Apr 2023 14:55:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4I-00024r-EE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1DCV/M5yyrM1g1B6cxt9ZQ7HQFDQ1socxlG7tzRHhCM=; b=E7Z3RPAMFyxh3kSgzTpzTk9FHh
 0/hi/jAHLapp88PoFIDGfE1BGJHcedZ75fdkmkd+Nmwu/qzcNL7Vr0P4Kx9xAH4eh7Gxtcc/MOcER
 fIUV0AhsfgkzSqmkreWlGaVzD5BDgTE5Y/i2t7GNEIhs/oQe9aQC7RtDIdaly0n9vm40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1DCV/M5yyrM1g1B6cxt9ZQ7HQFDQ1socxlG7tzRHhCM=; b=DuiOwkntyXrOGeqcliRG/FvSs/
 8ESV6E9m9vrH03kLaxnEjPebTqvs3FVjbThvkUsOf4qKnFQw0zZBt+sRo61Adn4PVDNXt7Rs/0V7d
 t1Z/7y7OX6692lvOYxW3+oQs7xOgQeO80Gni1gX4UEVr2kwvZgCazcsYRmrUuwKzfdJ4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4D-00024n-AZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:29 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-VGspT3VVPauQQQBsmoD7Gw-1; Tue, 04 Apr 2023 10:55:16 -0400
X-MC-Unique: VGspT3VVPauQQQBsmoD7Gw-1
Received: by mail-qt1-f199.google.com with SMTP id
 y10-20020a05622a164a00b003e38e0a3cc3so22188043qtj.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DCV/M5yyrM1g1B6cxt9ZQ7HQFDQ1socxlG7tzRHhCM=;
 b=rs3p8X9XhyPSOSOLFwYHfm3RHjRkS12550LdB6GpHEb+Ct92uCpFHlvl2sTmRMBJEY
 3o+CrmFeF9oWavnTT+zUVSpQiTg6yD3DGvBaUxOnib4NW6SW5pBQ7zgvO2FV2UejcQfE
 95uG3lTSuoX0nlG9DyOfThYdaaOMJ3VG0Nc5AqCJX/h7enly4X5HW+GLCT2L3EMBgdmk
 nE/JBFGJZ2mXdaHwtECitKKRNHIgjkGwhHl85KsO8pbfH4n7F8P/1L8IewiyDk3H3RNb
 8+Abkq8uIOaBMRtlB5cwVV/pxA6bJtL6Fxq26uji9KNE1/2pZs8lyTWgJasQXYacsEsP
 YPKg==
X-Gm-Message-State: AAQBX9eVvkomp/g6dFyOEv7UU0qr/yFDTViDyNMcPX/DJaWiYa65/Mca
 0ocxjjRxyS6GPbsc3fpLN1+onvAKQ8Ba7PXGicYoq+yYEyDu1xaC/9rwFzKHxN8LI/wjO8lSgb9
 Wg2e2wC9F8uvAxL5y8juAKSlEZWWFmWTDbPOA
X-Received: by 2002:a05:622a:1002:b0:3e3:8ebe:ce17 with SMTP id
 d2-20020a05622a100200b003e38ebece17mr3401482qte.43.1680620115384; 
 Tue, 04 Apr 2023 07:55:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZeTsqSdwXkQooxtkxa5UspUTLXqFsUhIKZ9BZk1HmO99VPevTQAHz0NwCmfjyQvtO6XB3OTQ==
X-Received: by 2002:a05:622a:1002:b0:3e3:8ebe:ce17 with SMTP id
 d2-20020a05622a100200b003e38ebece17mr3401445qte.43.1680620115062; 
 Tue, 04 Apr 2023 07:55:15 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:14 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:06 +0200
Message-Id: <20230404145319.2057051-11-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The meaning of the flag is that value of the extended
 attribute
 in the buffer was verified. The underlying pages have PageChecked() == false
 (the way fs-verity identifies verified pages), as page cont [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
X-Headers-End: 1pji4D-00024n-AZ
Subject: [f2fs-dev] [PATCH v2 10/23] xfs: add XBF_VERITY_CHECKED xfs_buf flag
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

The meaning of the flag is that value of the extended attribute in
the buffer was verified. The underlying pages have PageChecked() ==
false (the way fs-verity identifies verified pages), as page content
will be copied out to newly allocated pages in further patches.

The flag is being used later to SetPageChecked() on pages handed to
the fs-verity.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_buf.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 549c60942208..8cc86fed962b 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -24,14 +24,15 @@ struct xfs_buf;
 
 #define XFS_BUF_DADDR_NULL	((xfs_daddr_t) (-1LL))
 
-#define XBF_READ	 (1u << 0) /* buffer intended for reading from device */
-#define XBF_WRITE	 (1u << 1) /* buffer intended for writing to device */
-#define XBF_READ_AHEAD	 (1u << 2) /* asynchronous read-ahead */
-#define XBF_NO_IOACCT	 (1u << 3) /* bypass I/O accounting (non-LRU bufs) */
-#define XBF_ASYNC	 (1u << 4) /* initiator will not wait for completion */
-#define XBF_DONE	 (1u << 5) /* all pages in the buffer uptodate */
-#define XBF_STALE	 (1u << 6) /* buffer has been staled, do not find it */
-#define XBF_WRITE_FAIL	 (1u << 7) /* async writes have failed on this buffer */
+#define XBF_READ		(1u << 0) /* buffer intended for reading from device */
+#define XBF_WRITE		(1u << 1) /* buffer intended for writing to device */
+#define XBF_READ_AHEAD		(1u << 2) /* asynchronous read-ahead */
+#define XBF_NO_IOACCT		(1u << 3) /* bypass I/O accounting (non-LRU bufs) */
+#define XBF_ASYNC		(1u << 4) /* initiator will not wait for completion */
+#define XBF_DONE		(1u << 5) /* all pages in the buffer uptodate */
+#define XBF_STALE		(1u << 6) /* buffer has been staled, do not find it */
+#define XBF_WRITE_FAIL		(1u << 7) /* async writes have failed on this buffer */
+#define XBF_VERITY_CHECKED	(1u << 8) /* buffer was verified by fs-verity*/
 
 /* buffer type flags for write callbacks */
 #define _XBF_INODES	 (1u << 16)/* inode buffer */
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
