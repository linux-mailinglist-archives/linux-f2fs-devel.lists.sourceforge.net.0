Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4986D65FC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 16:55:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pji4P-0000jB-UN;
	Tue, 04 Apr 2023 14:55:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1pji4L-0000iV-LV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g1NG2DlOPhECSBoFyURsYJB7f5VQnxxV8rEkg1d1tQc=; b=f7nUotqTAQy6fGbxigzuVn/b/B
 knBdoCqrc9roK6TZJLjPCpu1F4MXUiuAB6XCpGMzJzdeLU+/O96mFhi7QFTIsQhYxIMVoD5/UAukG
 ZCIG9ZMaw/fWTLA1Avkqbg8gGJzCXn69IDK4XEJzVDZmbnJTxAG3WY4Xw3wSpw6i6RDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g1NG2DlOPhECSBoFyURsYJB7f5VQnxxV8rEkg1d1tQc=; b=HQD7BbJTo+efWh4L11HBXsLSCz
 anrF7UAmDE++iLnUlzjPCSdQf05IvnHV+GusGvsNlFOXHsvjjRD20Nu+7SGtUHrFsfKmcyUqpWysY
 Lv9dF4MhiAkCRLNoi7qkDRKsne/t7lV/tq9uQi7wZj+r8CqWxu4qx7MdfCwogndqwr5Y=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pji4K-00025F-4L for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 14:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680620126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g1NG2DlOPhECSBoFyURsYJB7f5VQnxxV8rEkg1d1tQc=;
 b=JcVIpQAJvDrdUuqyNsVYLoncjglB0MOHWb63z5op0+StlMVRhPam+GFVYw4LAKTPNbaHrv
 D9hinTozxWlq9yUYQuiZmmLVrCHg9cuuwwYfbCQ+6SQQq1vL/gWV1zMDfldmzVzf1QfaVN
 vWSv/7YYON5GFQA1Qogi4AUMEcj/66s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-p8jdI2vOND283DWsl4MxWg-1; Tue, 04 Apr 2023 10:55:24 -0400
X-MC-Unique: p8jdI2vOND283DWsl4MxWg-1
Received: by mail-qk1-f198.google.com with SMTP id
 s21-20020a05620a0bd500b0074234f33f24so14661693qki.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 07:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g1NG2DlOPhECSBoFyURsYJB7f5VQnxxV8rEkg1d1tQc=;
 b=dewwA8fKLrVQCZe0TSrGFOcn6GJ6U6TaSDS1AEqjnvhAQ8NiO24UgZJrBGjdcfCD9j
 IAPmAb4CPSP8Z7TDK72LyM+TQQusaDvlC4ID8NmLiiXJS+1Ep88x9uEBmz1YOZvybsCu
 7v1Lmxd1n5OsfouEURnHZ1oO+rK074v2Hq2b/fIewCgKNBBODaLDKiaPqkL+bseoFLGW
 aj3ZCVMSrikZXE5LTbYyIXFKsYel5fVsbQ7uRPErFxGpOk/QLhAj8hhGa6s8lRwY7Idk
 YWvZhw69tnRfBsJ6M7DeUaKOKZ5zC/qYyuynbGlSYL6JfFaz8OdfFrOULMaT6kCrY+BH
 8Pxw==
X-Gm-Message-State: AAQBX9f5ye4k/Vgh8laCELIfEZ7vgB+cSH1auA3vzUPgQANEAfZiINsh
 7uuYK6jSZS98Cr6DUiT3Bi+hNtIXtdlUQa6cX0aLQ4YKHF6LBqe8Qed6w11ClOJUuMBb/ruuuGl
 oxQiXbbvaX54oY+24GaHxel0X4Wsn/9Gh4psS
X-Received: by 2002:ac8:5754:0:b0:3d7:960e:5387 with SMTP id
 20-20020ac85754000000b003d7960e5387mr3872051qtx.35.1680620121260; 
 Tue, 04 Apr 2023 07:55:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bjyktKoJdi6D9KFFirgwb83MTSe30Fparym5df9UxsVGpZNZWXy1G6A3UC/2iyEvUKlSZpbw==
X-Received: by 2002:ac8:5754:0:b0:3d7:960e:5387 with SMTP id
 20-20020ac85754000000b003d7960e5387mr3871997qtx.35.1680620120899; 
 Tue, 04 Apr 2023 07:55:20 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:20 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:08 +0200
Message-Id: <20230404145319.2057051-13-aalbersh@redhat.com>
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
 Content preview: As noted by Dave there are two problems with using
 fs-verity's
 workqueue in XFS: 1. High priority workqueues are used within XFS to ensure
 that data IO completion cannot stall processing of journal IO completions.
 Hence using a WQ_HIGHPRI workqueue directly in the user data IO pat [...]
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
X-Headers-End: 1pji4K-00025F-4L
Subject: [f2fs-dev] [PATCH v2 12/23] xfs: introduce workqueue for post read
 IO work
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

As noted by Dave there are two problems with using fs-verity's
workqueue in XFS:

1. High priority workqueues are used within XFS to ensure that data
   IO completion cannot stall processing of journal IO completions.
   Hence using a WQ_HIGHPRI workqueue directly in the user data IO
   path is a potential filesystem livelock/deadlock vector.

2. The fsverity workqueue is global - it creates a cross-filesystem
   contention point.

This patch adds per-filesystem, per-cpu workqueue for fsverity
work.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_mount.h | 1 +
 fs/xfs/xfs_super.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index f3269c0626f0..53a4a9304937 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -107,6 +107,7 @@ typedef struct xfs_mount {
 	struct xfs_mru_cache	*m_filestream;  /* per-mount filestream data */
 	struct workqueue_struct *m_buf_workqueue;
 	struct workqueue_struct	*m_unwritten_workqueue;
+	struct workqueue_struct	*m_postread_workqueue;
 	struct workqueue_struct	*m_reclaim_workqueue;
 	struct workqueue_struct	*m_sync_workqueue;
 	struct workqueue_struct *m_blockgc_wq;
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 4f814f9e12ab..d6f22cb94ee2 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -548,6 +548,12 @@ xfs_init_mount_workqueues(
 	if (!mp->m_unwritten_workqueue)
 		goto out_destroy_buf;
 
+	mp->m_postread_workqueue = alloc_workqueue("xfs-pread/%s",
+			XFS_WQFLAGS(WQ_FREEZABLE | WQ_MEM_RECLAIM),
+			0, mp->m_super->s_id);
+	if (!mp->m_postread_workqueue)
+		goto out_destroy_postread;
+
 	mp->m_reclaim_workqueue = alloc_workqueue("xfs-reclaim/%s",
 			XFS_WQFLAGS(WQ_FREEZABLE | WQ_MEM_RECLAIM),
 			0, mp->m_super->s_id);
@@ -581,6 +587,8 @@ xfs_init_mount_workqueues(
 	destroy_workqueue(mp->m_reclaim_workqueue);
 out_destroy_unwritten:
 	destroy_workqueue(mp->m_unwritten_workqueue);
+out_destroy_postread:
+	destroy_workqueue(mp->m_postread_workqueue);
 out_destroy_buf:
 	destroy_workqueue(mp->m_buf_workqueue);
 out:
@@ -596,6 +604,7 @@ xfs_destroy_mount_workqueues(
 	destroy_workqueue(mp->m_inodegc_wq);
 	destroy_workqueue(mp->m_reclaim_workqueue);
 	destroy_workqueue(mp->m_unwritten_workqueue);
+	destroy_workqueue(mp->m_postread_workqueue);
 	destroy_workqueue(mp->m_buf_workqueue);
 }
 
-- 
2.38.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
