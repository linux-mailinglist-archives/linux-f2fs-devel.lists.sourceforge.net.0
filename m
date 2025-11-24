Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75977C82DC6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 00:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZWiHzfM3jKAcBpWpqK+vUNLkp7UQ7h5eGWEr3dQnPY=; b=g3G+HipCpY9Mcu1iE0b/OLLXOo
	7TRY/Dr88Sxj8TCJ3VaaM98QlngEOgTq0Gpj25Er1pqDtGHZqbeWoaU7345l0IxxXvGW8aoYgvWIX
	7h48QFXtX0mlHdgVXB1cV+6us/l6vNsuO/93ARrIycxznTcPfL7ApFjVvsIUiwFF78CQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNgIR-0007v2-3b;
	Mon, 24 Nov 2025 23:48:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNgIM-0007uf-Uy
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9hEyetpjb5QpX08wjji0bcnEJUxus+pp0XTDG4Zkk6c=; b=M3PmzcEsgMcRiUB/K7U6lSftYN
 F71yx6SbmsK0YMjLeoaiH472BhTl98TTho9cYfoOkEBONBz7AQpyaCSvhlsXk0InO2Pw2IFARdr3V
 +RFMV5g3N9GInK0lR0sE1XNKSUuWQCn0ClrIak0NpdpcvIBzfdtXrSnvYdkKSP047xCI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9hEyetpjb5QpX08wjji0bcnEJUxus+pp0XTDG4Zkk6c=; b=AcX2w7+Dh4Y4Lmm1sStZBvhsO2
 NjGPcy2XV5+wn4fZVRJWCs/EkFL3zVltn/Rwvwtt+7eXQ1MPIRYL56ywmzBGti8FTkboKwjdqdvub
 66A0fUhfDtFHos743FV+lr0/EdjVS10uQqOClJa0ewHbUgkbXTnoGa9Tz/mPeyj2AUS8=;
Received: from mail-dl1-f41.google.com ([74.125.82.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNgIM-0006Ki-Jl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:34 +0000
Received: by mail-dl1-f41.google.com with SMTP id
 a92af1059eb24-11b6bc976d6so6067023c88.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 15:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764028104; x=1764632904; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hEyetpjb5QpX08wjji0bcnEJUxus+pp0XTDG4Zkk6c=;
 b=Am75wVhM7SfblW7os21H/RMsaU6s/iDV32Cs+Jr77m15jUfxXkONVJP+tpsttXxHcJ
 th6+47eTRdb0jiJ+WdgZKB8r/nyjGlipw3Jl/BNQBD6vxf5EpvWnfKWG6AkpYIr0eeLx
 kFttP7Q4JAhLZRyI8vjfRi8TP7U3cdRocJfx6GsL9DQ27mwhyZslJHUypX0Dr678wkkg
 0q6EPCRiwOcA6U3D/9V2b/7JBkghLg2MWFc3VcBC63tXG6L64EaugRWKr2tc1yDyeMo4
 QR6RLCNiX1ZQbegieao5Y4Jnvw0ryOGvE7IcVbwEXlpLtFtxAZJQEIEJ+dVKWfUDpmuh
 2lNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764028104; x=1764632904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9hEyetpjb5QpX08wjji0bcnEJUxus+pp0XTDG4Zkk6c=;
 b=wjvsbZAVfKTBU/vqOObm6J/174uqfQ8l5lJe8f55YOkI1cKMorfvygIfztETj/S2tL
 kI/qFVUSB0jLzxZpBBz76qJIcvGxC1PWHIUwRPjOHe+3bY0BOAs2bJYdoWY33KM+HxEs
 B7+G0bnVJwHh00DnOu2KlL+O1x3N2tlGV4M+ju4GEhnZgX5AQwYRwJQVBUcRCjIehfmJ
 DuijZY4PLY5d3YHMDdYvZcbT1Jl3VZumqU8H15ZYYmj2DsOcsqPkx2wJhG97Ew2+pTSQ
 tBFkpu276FNx9IiF4PPluOV4ao8JHw66Zn6j/dbqTy49FznXAxncOzB0l2FvK4BDQq/O
 xn0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxZti4c6Yso1L0ZGvUWCytoUJznWmMxw4ZyMZeRA4z7mLLBaJOLoLe1yckz+qdz+Y3Tb6filDZGh+fcsipC7no@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw7LvZuaw1yU3BARivm8PmMpXA4bBap/utmpLFz+dJgfzPCc6QN
 TTbxrEDXHSnPcbILKDrHUrBNaE+yh4q8kfTu0JxEJI29IyLzzpskXJnT
X-Gm-Gg: ASbGncvRUuz9o8p5xrrX6QfKo4gkCeh/jhCMxLp3lyES+ML4NAk/Og4UFqxd4GPM7Z3
 WfOdMOjHqit1EyfNq2oMlDiYlKg0NEDppXojdZ/Lljf8I5razb2FevBDM2mzWs57DqS7LINVIyB
 li0o3EoOhwdjMp8YX7VJk0ONDzOkaESbv9DvMQoa6tjwV6/hDhUwjDuaz7M+H530KqtAWVQJhrE
 JsARyOb/UvBF9ZPr+bxox+9lVQDJtvDfWOF0TvoCnirkK5CffTkCx8zHTvXDQbooRXMJxbNN7zg
 KMe7mfXIQMeYmaU0bCYW6V5iIkiy2It/37GoeM7DLBCDjVbIRu6D3GgHzc85IRd52udWYlofnsa
 bXzY4/nmTPPtexOcKVDtq+yXVvtraIEqpuk/nxjxpuK/bdxFTeT3qrsG3G5LhO/CnuF1wHIEPxP
 pZ85zOE9J2sIVryT0taHQClmJL0NLBZKZyTrvdwLiwhGzUFwM=
X-Google-Smtp-Source: AGHT+IG0os1yUTB1U8y0wFQR2JhU9wfG8RKwx2eS9+a2sORTH4Ie8rtwmUzrvPIYkCFTBjjRJcm4Ew==
X-Received: by 2002:a05:7022:ec17:b0:11b:9386:a382 with SMTP id
 a92af1059eb24-11c9cabc4f0mr8878128c88.21.1764028103912; 
 Mon, 24 Nov 2025 15:48:23 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93cd457dsm72215229c88.0.2025.11.24.15.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 15:48:23 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Mon, 24 Nov 2025 15:48:02 -0800
Message-Id: <20251124234806.75216-3-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making all error
 checking at call sites dead code. Simplify md to only check !discard_bio
 by ignoring the __blkdev_issue_discard() value. Reviewed-by: Martin K.
 Petersen
 Reviewed-by: Johannes Thumshirn Reviewed-by: Christoph Hellwig Signed-off-by:
 Chaitanya Kulkarni --- drivers/md/md.c | 4 ++-- 1 file changed, 2 insertions(+),
 2 [...] Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.41 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNgIM-0006Ki-Jl
Subject: [f2fs-dev] [PATCH V3 2/6] md: ignore discard return value
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
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making all error checking at
call sites dead code.

Simplify md to only check !discard_bio by ignoring the
__blkdev_issue_discard() value.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 drivers/md/md.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 7b5c5967568f..aeb62df39828 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -9132,8 +9132,8 @@ void md_submit_discard_bio(struct mddev *mddev, struct md_rdev *rdev,
 {
 	struct bio *discard_bio = NULL;
 
-	if (__blkdev_issue_discard(rdev->bdev, start, size, GFP_NOIO,
-			&discard_bio) || !discard_bio)
+	__blkdev_issue_discard(rdev->bdev, start, size, GFP_NOIO, &discard_bio);
+	if (!discard_bio)
 		return;
 
 	bio_chain(discard_bio, bio);
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
