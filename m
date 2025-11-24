Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA75C82DCC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 00:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wjzhm4KYZZApmeC0CbCWkVvN1k1W7qznBtMVfFRxfqo=; b=U4Wl0riUbUxyN3oif3gYcZSGVS
	20wphx6yty39yQM2qRhZWf/KW48F1oU5Kj8CLSWcWIEXVu5H1z9FEiUV1P2L54fbRYP0nrJKP+qiB
	biXMDEP6+ygxNOVSC6vQQgL5pGYWaFro5wV++2XvZTrPt9tenYjYmBJt+vUmYGpQBfvw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNgIQ-0003dm-Te;
	Mon, 24 Nov 2025 23:48:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNgIL-0003d7-Jg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=14mujLSQeTKxSJUy/um1pAgQzTbPorW1qBu/kH6klR8=; b=hLg9GwF+FQjWdENKCVQMA6QlYU
 d0MdE+AiZy0FQ+Suj63IpOEtyHroPm1GFhnOVNgYW6BdOYErLE+Ql44gh68MQuZRhCswZjNW6h962
 EqBP1CcsFdKS8SUIkHuhRkUzev+PD7uBQKtuxO0ESZqF8e5BHpAACd7+p2trSmXxxGUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=14mujLSQeTKxSJUy/um1pAgQzTbPorW1qBu/kH6klR8=; b=h6srCq3IcFYi4g4KuDApx4su50
 xcPoTWVuZx0SStHYZ69rGaVkBZJd+swFa1ynyEz55FL3Un0wW/SwWTv1k7e2hbXwsp2EHImSGEwrs
 4EvdTcZsH3QP482LlsXw87yDvn5dvcYVLFcKrDQ04ImrJ3PBzbzYVvmVmGHFpVnyxn6s=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNgIL-0006Kc-RY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:34 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2953ad5517dso60331495ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 15:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764028108; x=1764632908; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14mujLSQeTKxSJUy/um1pAgQzTbPorW1qBu/kH6klR8=;
 b=hsBLjat1kFyJG2S0/vMo6twOI1samn9PIZFdEz+csdCnwJvrTbp0mkht7q/SG8P7y3
 Fy5OyZ/4Mrhhsv21xuLG7uE3dRrkhYDQ5fwJ3ZwaZWwhLcWFFMHGKms659pWnF1o9++N
 tAYKZz2eavsx3NPPu0e/NyK9ZJLQ2ZDt0qdY3HiKcDItZ4iB7YZomjP8THDdFEUVJKXI
 B4Zg9geVpwnfjYyBTA/1I1T1W+uficZzJzLEHvX0VFJrkHYHGPre3Z5NLnb716mh99oJ
 b4LuEmPldspuQnk6Upt9rCUd26zGPrdJZLwCO5BgI4Ysi2aRZ+cxhiBQS7CUTVqA7J1Q
 gjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764028108; x=1764632908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=14mujLSQeTKxSJUy/um1pAgQzTbPorW1qBu/kH6klR8=;
 b=IaY8UzT01vIkvZfDScybjHNsR/ezArwRw8/mM8OCq30m714AL6FKSlVSm3cmbfkoyf
 nm0a78ZB5lJUP4ucIS7eWWvZOv8chxk1l8FynJdVuaaZVXtfU6LeBkO5nzJgFY+K4GgA
 THRXBcR/BdroGhE5URn/6ZPFPgRJLCAw9yVituiiLUJeVKDF7KK86uiJZwPBG5y6DgVo
 hNWes5quwpy/e4us1mu0VRsRuVzYIgNrSUCbzNU+nXOk4nWoejxKRBOwLAtXXcmyvkuB
 qH3/plI/lkCr3L2wPeeyylwAy0U1YIJ/AT+iTr4pQqyjyIVDSNYBy7Etnx5sKhG2FcRe
 dPzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXV+adAhU3QdVPRorcd/rmXL1EupA5VR2BzU1psbavTulgZRqGksLmzBpCurfmgLWkENAATqbVTMzkRcZXq5Ict@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy3ISYhfQD1xZTZzmdDjLZ/W6OVfT44tufbDlm2L2GFTtfoGIgl
 DVt5IzdbmQsg9w7ADgl/drCDTyKF0vJhxxOmQe7rvdHej1sFz6NWDVII
X-Gm-Gg: ASbGncupKs3QAvXKidmUwOnPgzGEaJHIc4m5gpej4m1PkObs5U56udCYIxeiliVc5sz
 ntTpKw8wslaQnRBhI+TkHIo+Pqun3mULvyPCAH+4EbUh3zX/nb9q9IoG1lTApjV75nVTcp0GRxR
 GDYXgQmzjWRyh+Qg0D1JjbtQnLwRwwolVb6DyskWlYqMJmAOvZIVhkXVjhS0NF/44ZCE7UlapyU
 BBpdErNhax4Zefm2G+fk4eMow+O8hP5NFlHPLAGU02MpKk3LL/yXWuikZBEWO+R5cgiOTUV7EoR
 t09Ju2DdfZ0fa7alJ4x+YjqTIT5yZEUW5ZL/8IAcOxnBtpbsCBB3ag0u103QefKz/dFd1HWd2E5
 uVT44ljk5bl5COUFCd3t5qjKgBxV1EULZ6oDBTf5LInsEsWfoL+S8FFoLeaMDfv2lH5efkMjxYC
 bOyJZdO/BRW7d8sYqoGDKs4aqaTG+U/VGbXpm7l0XoKKhYG7I=
X-Google-Smtp-Source: AGHT+IFryzmc/XiOW9LSO9isjtYB1LRYx6LJmKSX/rJnv82E/9f71NMvnHJMZsWalBLPhm0XU6n7Vg==
X-Received: by 2002:a05:7022:ec88:b0:119:e55a:9bf5 with SMTP id
 a92af1059eb24-11cb3ef2594mr558577c88.17.1764028108043; 
 Mon, 24 Nov 2025 15:48:28 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93de6d5csm50934844c88.4.2025.11.24.15.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 15:48:27 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Mon, 24 Nov 2025 15:48:05 -0800
Message-Id: <20251124234806.75216-6-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  __blkdev_issue_discard() always returns 0, making the error
 assignment in __submit_discard_cmd() dead code. Initialize err to 0 and remove
 the error assignment from the __blkdev_issue_discard() call to err. Move
 fault injection code into already present if branch where err is set to -EIO.
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [70.175.132.216 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNgIL-0006Kc-RY
Subject: [f2fs-dev] [PATCH V3 5/6] f2fs: ignore discard return value
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

__blkdev_issue_discard() always returns 0, making the error assignment
in __submit_discard_cmd() dead code.

Initialize err to 0 and remove the error assignment from the
__blkdev_issue_discard() call to err. Move fault injection code into
already present if branch where err is set to -EIO.

This preserves the fault injection behavior while removing dead error
handling.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 fs/f2fs/segment.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..22b736ec9c51 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1343,15 +1343,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		dc->di.len += len;
 
+		err = 0;
 		if (time_to_inject(sbi, FAULT_DISCARD)) {
 			err = -EIO;
-		} else {
-			err = __blkdev_issue_discard(bdev,
-					SECTOR_FROM_BLOCK(start),
-					SECTOR_FROM_BLOCK(len),
-					GFP_NOFS, &bio);
-		}
-		if (err) {
 			spin_lock_irqsave(&dc->lock, flags);
 			if (dc->state == D_PARTIAL)
 				dc->state = D_SUBMIT;
@@ -1360,6 +1354,8 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 			break;
 		}
 
+		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(start),
+				SECTOR_FROM_BLOCK(len), GFP_NOFS, &bio);
 		f2fs_bug_on(sbi, !bio);
 
 		/*
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
