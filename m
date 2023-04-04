Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 088976D661A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:56:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4w-0002DW-MU;
	Tue, 04 Apr 2023 14:56:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4v-0002DF-AJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=; b=RKt9dnkopCaU9hjJ/r/sptRjLL
 ZPHQS+ssefA4Ow7UcO+akaLYrn/qBlJvge1HszQfNWWlT4eiYDGRYmROXxJA7yDgvqkm43oSpYP6B
 aGeP6fPu2sG/i2J/2pjBYd3bvT4728Pa38eZ6OroefoXKshK2c9s6Uy4I3tCQX84K5i8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=; b=ihX0TT/4yHGMsCKyQ7Sp1I2opM
 FFv9l5bwcMZSet1ZRDh6EOsU0+TWt8qC7v4SeRfK5jLMQU5tx/plHy09gT0TQBIXupvpXtYyRqyDE
 LxvOH1mLagnc9JfxBu7E3cZ7J8K3dnIsQOAjPAio6kEr0rTlzw65aai5ZiWaH717gGg8=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4t-00EzCB-No for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=;
 b=hoGEFb8F/Tb1zk86ssumSD0UcSwqd6XcfRa8Xhq7LAUxycwFa2dBsojie/IaUlHCW74Ob4
 pGCw3A7UCUddTRGTgcyk1gDQKoadik5D5JG/nMmPDjC1aN4onDlJnPAWL9dc7HPrraeR56
 +Hxf7YDYYmE1LeILUZLAmgAx8tBuh+Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-H-P9_PRXOOuFDf5_O2yZBg-1; Tue, 04 Apr 2023 10:56:00 -0400
X-MC-Unique: H-P9_PRXOOuFDf5_O2yZBg-1
Received: by mail-qv1-f72.google.com with SMTP id
 f3-20020a0cc303000000b005c9966620daso14612001qvi.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=;
 b=pVHuTB6CWWDWRSsmvhpWgsxQzhDlQ8Nkam/QMNS7TbnidX3H7GqThOBWnedW6nb/9I
 BT3mfLB6Zdi0JJItkgAH9ts6SNv2nYYbI7QMpLOVjtnIr4vJOSkJ7oxqC+w1hFEE9mDc
 /fPQHJQlFjVb2gLfcfNwLvstHc7OhdZs/k8juBBHASAMAF22qt1hln7y0plSXHsZ3lAw
 FVl54UEaWkjK1/zhNc6MRrkRobPRmGg5DdymYcMd57n5YxEJt950CnPD5WYRjRsAykvp
 BXpJYWzGtmmbiPWT+eiQss7aQ1FD2sp9ZWXy1RZXqENYzf6pqymZMFPRGSwSTfYYIIIL
 UtQQ==
X-Gm-Message-State: AAQBX9dsG97fqozxiaJ4imooJKnAaMNAu8S2AAGhGHlEYXjyvHevVsI+
 psVH+MrTa1Q0TlEe79FPmPCjAWj3oP25MZBP9pFsC95GOntUUOIe0kLNJFpkmfravc09UqV61o0
 qfO0uqwfDEUI4ZlytEY1g1VtsTq92UpfDqBpN
X-Received: by 2002:ac8:5b8f:0:b0:3e3:9502:8dfc with SMTP id
 a15-20020ac85b8f000000b003e395028dfcmr4467466qta.9.1680620159966; 
 Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7eyzBLFAVwLtkZzZp5jojS6UQc2rD1+xfGSjK6d6WcBELJ7jmQgpE+gezZ7mdNPw1AFtdEg==
X-Received: by 2002:ac8:5b8f:0:b0:3e3:9502:8dfc with SMTP id
 a15-20020ac85b8f000000b003e395028dfcmr4467424qta.9.1680620159602; 
 Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:19 +0200
Message-Id: <20230404145319.2057051-24-aalbersh@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Finalize fs-verity integration in XFS by making kernel
 fs-verity
 aware with ro-compat flag. Signed-off-by: Andrey Albershteyn
 <aalbersh@redhat.com>
 --- fs/xfs/libxfs/xfs_format.h | 9 +++++---- 1 file changed, 5 insertions(+), 
 4 deletions(-) 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pji4t-00EzCB-No
Subject: [f2fs-dev] [PATCH v2 23/23] xfs: enable ro-compat fs-verity flag
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

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index ccb2ae5c2c93..a21612319765 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -355,10 +355,11 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
 #define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
-		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
-		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
-		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		(XFS_SB_FEAT_RO_COMPAT_FINOBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_RMAPBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT| \
+		 XFS_SB_FEAT_RO_COMPAT_VERITY)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
