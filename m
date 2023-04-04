Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F76D6606
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4c-00029K-CE;
	Tue, 04 Apr 2023 14:55:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4b-000291-LV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=; b=IApNmQhkklKcZwnR3PZLR6ifLa
 P8mV8JCEkPTAydrpojEJ+qXxooPGMBOERMK3mmF+1efV0cPwnvf3PRebtWSvyMXlzYAAaNh0aDQSU
 P6HvIc2H7xjAyufedFtLWbGAHhzaKDMA/d/qgTMzp1fV+C/w0QEvMsfYq1T3FHyswh2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=; b=hzRZCNN08nsU/s45MbdBW/sm7Y
 jmEaggnGvM/SxRM5wCvb/nu3z5RRi1tNaJtE25FupIrEV4wtrrs6d0prNn7lqZBoydOw3P7zMeqgk
 QGUhP0ichmXhg8h6RqOAsBB1W8WMg3qiBJCid4ToLzILU7tFzpExzkwGBG0twgG0omY4=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4a-00Ez9t-3L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=;
 b=ASjGm2RDyGbubPTAHHbDZbHTqfxHTkos67yC8YDN7xyLU7Br5LRGJfRDBA1T1CSxUY4pe+
 zs4bIe/zUc6AA2DSVXak9ZTCoA8nSM6icEk9pTiu/+BNAPd52zBjZ0KfklrQ5Htw/Hf94j
 dK7zo9hGmGxLRIgeP5PNKt+4d9RFJMc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-6kiary2dOOaKaWKp4Xkspg-1; Tue, 04 Apr 2023 10:55:41 -0400
X-MC-Unique: 6kiary2dOOaKaWKp4Xkspg-1
Received: by mail-qk1-f197.google.com with SMTP id
 195-20020a3705cc000000b00746a3ab9426so14796677qkf.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=;
 b=b3Ef9J8R1IealEL82l1RdtoaimBT4mlYaMYOV3R0ekh0pOVQhPXLY2WgM1gZIZMDb7
 w+79q3FNqyi7pt1aLqHfMS8MY/cVL2endVXxoVQsU7a/KVhPSY+gD3/VKA/2QBiKk8+W
 IQ2YUef8ffSgCamF9bmgcYkiQ/+fx0wWknrH260w5zj2i+CwI8Ha5JOHqFQ6Zptf9qA8
 eO6Je+DvkfTe3d+vZXpXtIByKM1D1JbY9wrwHncPewTGdLXJbCX/3dJKWGqxLYILMnSt
 YlyZZ5zmBRlSNMHD1mOHXHPKmDVO3Ik9ouMdhL4HVqsf0UhPltVvPdJ+y6zQrMVHZIvh
 8fKA==
X-Gm-Message-State: AAQBX9eYnWuplHdiHa+MIRhl5Ue+6aW1G6jNW1csQk35NDwCZDyH87UQ
 X4+vQ7QDiNKfiUSpVZYz/cEAM0ThAMVo5TAvQXAvtdG104ZyeXfG95RL53bjLsyHJfQz3HyYCDt
 iFSndtR7C8nHZIDoLQEfTgll8zi2sh5k14eh/
X-Received: by 2002:a05:622a:199f:b0:3e3:913c:1ca8 with SMTP id
 u31-20020a05622a199f00b003e3913c1ca8mr4130747qtc.22.1680620140349; 
 Tue, 04 Apr 2023 07:55:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zzc10/1v2LcCE0zfPnbg3x+8dh54gKx1zJb5SpW17zpBOCvtCa2VKQbBuo0E40V5nvMeZ6aQ==
X-Received: by 2002:a05:622a:199f:b0:3e3:913c:1ca8 with SMTP id
 u31-20020a05622a199f00b003e3913c1ca8mr4130703qtc.22.1680620139945; 
 Tue, 04 Apr 2023 07:55:39 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:39 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:14 +0200
Message-Id: <20230404145319.2057051-19-aalbersh@redhat.com>
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
 Content preview:  fs-verity doesn't support DAX. Forbid filesystem to enable
 DAX on inodes which already have fs-verity enabled. The opposite is checked
 when fs-verity is enabled, it won't be enabled if DAX is. Signed-off-by:
 Andrey Albershteyn <aalbersh@redhat.com> --- fs/xfs/xfs_iops.c | 2 ++ 1 file
 changed, 2 insertions(+) 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
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
X-Headers-End: 1pji4a-00Ez9t-3L
Subject: [f2fs-dev] [PATCH v2 18/23] xfs: don't allow to enable DAX on
 fs-verity sealsed inode
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

fs-verity doesn't support DAX. Forbid filesystem to enable DAX on
inodes which already have fs-verity enabled. The opposite is checked
when fs-verity is enabled, it won't be enabled if DAX is.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_iops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 5398be75a76a..e0d7107a9ba1 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1204,6 +1204,8 @@ xfs_inode_should_enable_dax(
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
