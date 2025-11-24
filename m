Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA38C7ED5B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 03:58:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCmBbKE9Aq+gDLAif1qnDLLkPZa36TSp0rHq5WxNCCA=; b=ac5ae2/dMgu9lG8qz1f6e6S7WY
	Bl3Tj6BZfMkmUpQil6LIpD+w9qTthRPhZI00KGgq+KIOnruvOnkyyjTaO5Y0nwH53KfirOMP2whkm
	9rUJJiYpF1XSyJ/H44Rl1eZ8z7yWWb5Y3WJ+ffXgbgRmweFcQthvnOm5jaXoVCkEeyWU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNMm2-00026q-DF;
	Mon, 24 Nov 2025 02:57:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNMm0-00026d-MA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sNwYZl+W2fvcXiK6f1dLRuPmVDUoM4hiP4tOVDl+CUs=; b=NAiH0JzTaUXP0qAZjgGlOTts39
 0vK1ujIVb48iLLt5Z3a+uPkA7ueZB+roSz95b62cCvDU7w+2QlMj2vGFIlZl0VJWZvUmE33rDp4Ec
 f0Y+xpGrrfz1CdYmkSi7n62NymtZuwP246fDQNsGVSNmhEZL1SWqELN6RsWUXebmSxCY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sNwYZl+W2fvcXiK6f1dLRuPmVDUoM4hiP4tOVDl+CUs=; b=JYqHN9bjXVLZYDOdWolxnWa7fN
 N129RHV1K4IwGgiHKfT1kh3t7ijzVOU7a6ggQimbmpitrsAVggUdV3tI7M4fkyIQliTpmMxMwdXKF
 84GhUUjbl6zcvxwiEQKmW43wlxZjeLYZ57kwfrgJKlU/vC2tBAh6XoBC9tSwbgkAnNr4=;
Received: from mail-pl1-f182.google.com ([209.85.214.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNMm1-0002f4-2K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:57:53 +0000
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-29568d93e87so34725405ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Nov 2025 18:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763953067; x=1764557867; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNwYZl+W2fvcXiK6f1dLRuPmVDUoM4hiP4tOVDl+CUs=;
 b=EEGq7vq7PiRSLsHGc22o7pkPoWdC8KBGQbszuHHKilj/KEcTp1mkUwwLxhz1ABL2So
 t0h0lFIOahH2wrHAJtBJ1UPCM7YotbgYxuxeWWE0irD30He1/U/XtgxhsjFcu5xXdWUW
 y1DInrUkgh9wGJ/KPNbjS0rrPoUgT3CgpoJtyRRDD3eaPRkvWkU6pnXF7WviWOxb1+qF
 d8j2S0Uyu+XSP9GcPp4/i2XJlLwPZKy532k7eAmwTi2CM9qq1dF8Tme8twC4sQg+kapP
 de5c/kaCwomw1ZV+CWipuOumG53aMgm0qI94hGMXk0q028Ff+Yb4ypwFIX2nvdTXK3QX
 PrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763953067; x=1764557867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sNwYZl+W2fvcXiK6f1dLRuPmVDUoM4hiP4tOVDl+CUs=;
 b=tI4Zr1Uj0uK9O6Bc0ZPyHpsUMWidPdzsj6K8dvTshsjuxdqas8PoKqQfQJc+ZfTAHB
 4fwP9Bjt+9sPvbtOrLKUuBqr0V29W5B6BVKh5cEWL9euFtGNCtR6zpDykWcoBrq8dCk5
 pb+Pka9JLLoK/DbqoIZYlLumL9yIJbQ3qe5fABqIDgkJmYkBsnZPBIzOPpCugiVsg+nq
 q20KaKdFabo1T87JgoWtyvmxm7sOtaNkAkNacqgoolQqkovZ4S+7Xh5aDYOPmsFCQVYe
 4KMgevof2V4oTEjob5DjWD7YtYJ51R61J2V7FU3fWbtTNrTTJ96dv0v8woki5xSF5Tic
 hpFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeAz/aTFlFr7TdQ6jDscah7rCQFkNFxroisMQBqCtYpQ5BLzWzgCwrkkusxav6V3cbCehOYo94f79ADLCMLxZV@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwfRrYtChg8Ya21ieOwrbinW0ncmagtPkW96Hn7XXsTMrLL31d+
 ZVi0N5sesqF966AStt2MjEyQKsGjoqtKTFtnI7Jth8zWuVPHmbXBX52/
X-Gm-Gg: ASbGncvSFQ2itJmBrunszDc88p+zEzD8SPVBYQlr6vDrhBXKp41ckCPEFsaMPjtcMMb
 5U05U3mtZ3NyZtQgJnQz9/CMk59iG2ufK4coG2tnn6D8/WgGPxQ6RxYj3BAPg2cdotvUBW/czG/
 oYZ/roLvEiVztzoLDOeqxRRx/RteuyUEo2eEzdhF8SC3kKUQ/aoTswvD2TNzcguR+/uvS2Eaci3
 KOTBRVerObzH7nx38EnHCXgVFcmaBo70nHW5zngj4ioFLxlyeu2JdWV5QhkL9qwgQS3EwlS94jz
 74cVlUyeuZfoknkXZv/b1TcNCGHXUXKd2dKd85uDwROHhlMT7MdALOhUXqcr+aMWSuknqJdzEi1
 bf6282ZnouOKYkQA4ls3j1EK2e8y0tUfzx0W1VRIeUxfTHTj2xuHoDsDrapD8xWvBIbrwbK+YeJ
 Jx86Sp+8uX8j6C7masPScb8ehNQCjaRFuxPbucULLXQfQlBWc=
X-Google-Smtp-Source: AGHT+IEZXRFduMWog8lY/WEBRyb3MZQs6kfaoxzTi2A/dpYZvd44wI5EVbBBu8fatXwqYTbLGqTaxw==
X-Received: by 2002:a05:7022:6285:b0:11b:923d:774c with SMTP id
 a92af1059eb24-11c9d613979mr6980540c88.4.1763953067290; 
 Sun, 23 Nov 2025 18:57:47 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93de82c1sm45441687c88.3.2025.11.23.18.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 18:57:47 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Sun, 23 Nov 2025 18:57:35 -0800
Message-Id: <20251124025737.203571-4-ckulkarnilinux@gmail.com>
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
 checking in nvmet_bdev_discard_range() dead code. Kill the function
 nvmet_bdev_discard_range()
 and call __blkdev_issue_discard() directly from nvmet_bdev_execute_discard(), 
 since no error handling is needed anymore for __blkdev_issue_discard() call.
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
 [209.85.214.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNMm1-0002f4-2K
Subject: [f2fs-dev] [PATCH V2 3/5] nvmet: ignore discard return value
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

__blkdev_issue_discard() always returns 0, making the error checking
in nvmet_bdev_discard_range() dead code.

Kill the function nvmet_bdev_discard_range() and call
__blkdev_issue_discard() directly from nvmet_bdev_execute_discard(),
since no error handling is needed anymore for __blkdev_issue_discard()
call.

Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 drivers/nvme/target/io-cmd-bdev.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 8d246b8ca604..97d868d6e01a 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -362,29 +362,14 @@ u16 nvmet_bdev_flush(struct nvmet_req *req)
 	return 0;
 }
 
-static u16 nvmet_bdev_discard_range(struct nvmet_req *req,
-		struct nvme_dsm_range *range, struct bio **bio)
-{
-	struct nvmet_ns *ns = req->ns;
-	int ret;
-
-	ret = __blkdev_issue_discard(ns->bdev,
-			nvmet_lba_to_sect(ns, range->slba),
-			le32_to_cpu(range->nlb) << (ns->blksize_shift - 9),
-			GFP_KERNEL, bio);
-	if (ret && ret != -EOPNOTSUPP) {
-		req->error_slba = le64_to_cpu(range->slba);
-		return errno_to_nvme_status(req, ret);
-	}
-	return NVME_SC_SUCCESS;
-}
-
 static void nvmet_bdev_execute_discard(struct nvmet_req *req)
 {
+	struct nvmet_ns *ns = req->ns;
 	struct nvme_dsm_range range;
 	struct bio *bio = NULL;
+	sector_t nr_sects;
 	int i;
-	u16 status;
+	u16 status = NVME_SC_SUCCESS;
 
 	for (i = 0; i <= le32_to_cpu(req->cmd->dsm.nr); i++) {
 		status = nvmet_copy_from_sgl(req, i * sizeof(range), &range,
@@ -392,9 +377,11 @@ static void nvmet_bdev_execute_discard(struct nvmet_req *req)
 		if (status)
 			break;
 
-		status = nvmet_bdev_discard_range(req, &range, &bio);
-		if (status)
-			break;
+		nr_sects = le32_to_cpu(range.nlb) << (ns->blksize_shift - 9);
+		__blkdev_issue_discard(ns->bdev,
+				nvmet_lba_to_sect(ns, range.slba),
+				nr_sects,
+				GFP_KERNEL, &bio);
 	}
 
 	if (bio) {
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
