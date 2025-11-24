Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23360C7ED5C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 03:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFCZsPH5zXmgJnG9huWeHR76ZWO6/3fJCC4gnyigTVY=; b=Ev4CYvNa+zCBj2zyW+wErjyshO
	UUeQ8fTRYXFgrNGfxPL995ZndZXy+3f+4VsXRXm5Vd7vCYKC2TP1ukBHtQkIiPOzWD8ubRdNYaj4w
	rWvIopuKXj4bdgAhPJ1Pt7LDXci438AqMziGHvKIlvhUWGjJulJDW+mWgoy78zxcAf4g=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNMm5-0006n2-BQ;
	Mon, 24 Nov 2025 02:57:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNMm3-0006mr-UV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RkWhYF4f1lhsSHEbmYsrWUEDoM/XD4r0C+XpnxkiI8c=; b=WnSylbd9ZqU4SXRWldfxZ1j4lp
 Kd2dUsniUpBEkg3/j6ITcSa0cMwXip3rfCmtno441sxt1DoXuJwhy5AeHQtJrUs6jpca97xOzZCtM
 YyPhw/sHniPvRDiqyQMhPGFYBDN2EIJ71XIZ2CltYG5EDEtjF2l0sL1PauroXF7rYIzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RkWhYF4f1lhsSHEbmYsrWUEDoM/XD4r0C+XpnxkiI8c=; b=M7C8PGLeQG4cDwNl35FqHASZ91
 JQ6XGXgThtGHWrofAWMYWlnETjgkbcU1K3i7bssu0jittKhr6Fid32ZDagT/dAvJfC4vyUDJupl+0
 CFttJDGJ9mvgX4240a7nktpIABHCt4yUqsF5I45NcAL6QXceNoqRWQFJvcNPyyAifwE8=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNMm3-0002fF-9V for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:55 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7b22ffa2a88so3415847b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Nov 2025 18:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763953064; x=1764557864; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RkWhYF4f1lhsSHEbmYsrWUEDoM/XD4r0C+XpnxkiI8c=;
 b=dFK9qcW5forPo3p/jTQhJSYW5yVcvpMaEm0QbtC44WhyZuOYsf9oKThBddGU1avY1w
 3VdEstnley9qC2WGueozwDceRfvGOCbCqiQ/XppTmVAiGiXoutDLPyoxD5hWV4WAIZWp
 gxy/mNRBgGrUE+XmFmW1HQidDRzQjWZkcJzMVcYSOSHjKRJ6MHfkXrJ/QMVN8/0aXLT+
 htPAetVnzeabqJiH9ix/G3i/XJFH9xaaZIPQ5Yp2ixnEdmOxjiMWa83/Sl+YpRH5+I2z
 mnkBkwGGFdG3IBequ7XPvt0hrkuXb0TdUW+up7i1vEDa/ubMHVMxXx3oxFcIseCovGNv
 3usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763953064; x=1764557864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RkWhYF4f1lhsSHEbmYsrWUEDoM/XD4r0C+XpnxkiI8c=;
 b=WID8cHp6OIY7hdJUSEI8xzHsNCf5TsJ86KcMD5QOiG1CLgwth4wRyyyjSamyHaOVM7
 kGzZAMrrozsoxLMAiI6PXkGfP4SR642wGWJiKHTNuBtZGh9+ZlpuIjQrn4w+kYEG5Fb0
 Xdk59+HurKF/3fm7335YxvUEqVMznEGHvZRCGH2bWqCXXjMxMW+QBWHR6cbTO6Q2ETVl
 yO/yMTccg5Kr/XWtSeqPl2c/WFl5Mh7SkS0HIeAn0cCP2HrAbq8sGlSHkUzNGKmfUNUV
 YzY53mVXleknh5buD3/AIY+0M2y6a9aamNIiGfZSzlbwUJstlUpyZvvvA5UykqBOSIhS
 v87Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3KNxzJY/rYy9Y3WW6LLdCFZfYS3F2nmOGsJ1BS3ZlhRMsoI8Khdd8xdMyFYICrsgqcU8GjkB+Vpq9x2RtAaKC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwjuNMp4ir93gu3KyWqs1mlAD122XxwftAZv9B/HO88xTG5PROp
 hJ/z/o+wrVttlEOYPVxd25jWMf/3D7RwsTkQ1KfMUWZrsZGy4TtNWPmu
X-Gm-Gg: ASbGncuTSwOhCoXUKvWPl6dXMu/3sxGqD1UVf4HPbmavJfscUYL5PIOruJGJmhmj1O2
 282T+3LlLT3QdNuKlhtzHdEy9WmjLpetY1eLOywY5BwVot20G+5Hvvlzeso2Fm07VuopngE4h6M
 yhYewe8+0eZHDJdLJ5qcqfPw3Vif2dJsD7fnQdf8DUQiASMAbEjteEcnmOBpF9LYtbZvjmwTyAY
 tDhdyTfFEXgJYdKOxGFDN9Js88w9L3HJVpyJEXaxBDi37/wyX8fQr8+H8B0pfGOnA/i67gsnCGq
 Nrv9yFSVcXDZNXryb8SH3C/j3+8wADFJji+Ih6xKFuqWfTWMqH5R9FR9SyzILO1rfzMW7TUoU1l
 VXTxLNtCCigOljgDGkz7qj1XJjWk/TEYv9tqEQDF94cXci0M3+H8jIHY55gqqVk0olEK0xwecPH
 qZPfzcPHoFLRXmg+f8v2edb9Dk0xOU0Ua+ITpR85zhUJaXL0s=
X-Google-Smtp-Source: AGHT+IH2vl9a4qHa0wFFFsUNbzMzey1IZwx6tJlzdt+jREZgI3T8WYYR2vo3qAu15ZJ2v/Ev109wPg==
X-Received: by 2002:a05:701b:2803:b0:11b:2138:476a with SMTP id
 a92af1059eb24-11c9d8539eamr4726588c88.27.1763953064432; 
 Sun, 23 Nov 2025 18:57:44 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93e6dbc8sm65938624c88.10.2025.11.23.18.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 18:57:44 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Sun, 23 Nov 2025 18:57:33 -0800
Message-Id: <20251124025737.203571-2-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making the error
 check in blkdev_issue_discard() dead code. In function blkdev_issue_discard()
 initialize ret = 0, remove ret assignment from __blkdev_issue_discard(),
 rely on bio == NULL check to call submit_bio_wait(), preserve submit_bio_wait()
 error handli [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNMm3-0002fF-9V
Subject: [f2fs-dev] [PATCH V2 1/5] block: ignore discard return value
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
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, bpf@vger.kernel.org,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making the error check
in blkdev_issue_discard() dead code.

In function blkdev_issue_discard() initialize ret = 0, remove ret
assignment from __blkdev_issue_discard(), rely on bio == NULL check to
call submit_bio_wait(), preserve submit_bio_wait() error handling, and
preserve -EOPNOTSUPP to 0 mapping.

Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 block/blk-lib.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 3030a772d3aa..19e0203cc18a 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -87,11 +87,11 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 {
 	struct bio *bio = NULL;
 	struct blk_plug plug;
-	int ret;
+	int ret = 0;
 
 	blk_start_plug(&plug);
-	ret = __blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
-	if (!ret && bio) {
+	__blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
+	if (bio) {
 		ret = submit_bio_wait(bio);
 		if (ret == -EOPNOTSUPP)
 			ret = 0;
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
