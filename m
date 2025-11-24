Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7813C82DCF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 00:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/TSe/0e8Tz1AJqe+4SD36kra2Ua0ogO4Zk7cQe7M0A=; b=a7T8QRhp6u/sgBO7pp8+5HA2Xp
	wjlSnz0y8q2XOx82jB2qhy1+XMpUwhNfxKB3gZPRlFCSu/BF17s9HyRu0yf1HHSw4Z+AG2zsUplWN
	al3N1WgV107h0ZdzydwdS87Xokwi+3c6YTd26BX4UaJcMz1OSxXKCNs1fbBPjFnhwFRA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNgIU-0003ab-CV;
	Mon, 24 Nov 2025 23:48:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNgIS-0003aO-LE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XG0OrcuNbwg29Sl2OBnaF07hgRH6+GSGFVprGloS+Vs=; b=gYB7NwO4pdVgXY5YEKclJ/iiNP
 xFuMJ64B3KTMG0lfe/CG3fsWNbg7GI3Hr/0tYlYb0dVsKBL49r2oO088REX4zvcKuN81t4PVKGTto
 RGUd4zlhhQffHJxqjA+jSKywjeqM9jxUUti72qDNsw5tlZKyqLuOkApZbZojAkFd5ojw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XG0OrcuNbwg29Sl2OBnaF07hgRH6+GSGFVprGloS+Vs=; b=aKIpUctH8RX3kbq8/0atSO6FbP
 yhAAubrE+hfLotBclu24r0MBSrBFYMECjmKGI/efO0AZfPAsQs7KP5UM6015dBuOZmrI/8JzM6ppq
 OTvogEJLLIiKDJc5j0jgE5+EJhbweyXPbpPgXMmOKiTGHYo6fq+EPYejJkhetJmUsOHQ=;
Received: from mail-pf1-f175.google.com ([209.85.210.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNgIS-0006LB-60 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 23:48:40 +0000
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7aae5f2633dso5650594b3a.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 15:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764028109; x=1764632909; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XG0OrcuNbwg29Sl2OBnaF07hgRH6+GSGFVprGloS+Vs=;
 b=i4lJ20TUNpc4Hri3eNfxoTOKkzHdTSSSjOblhfgtCZMG8PXqPkIJ4XMjU1sHj0stOT
 EK60L8MWVJGfapoaLjJtNTkJXhnCf80aHz2xFdT5CYDiLrI47ndtDRsEHVCRR4L6DjAu
 P1v+CHTtOkY0+IWXZIjTv0qmFEfCdN8X8xd+T9TdcYT0o8nkZH/MBRX252Hwnxsltv1s
 GsJpvtZVCvBMicGpgNUb/4bKt4i7bQizl6eoB4kwUIjRx8Gjw6nEwYI+yfBNEtUUeAa2
 fpkLqbaIWyOq2dxQ9pvPDCyUUHFmtzEIj2pvRA4jR0O64LVDYAN248FIa8aVvslnNjcL
 zWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764028109; x=1764632909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XG0OrcuNbwg29Sl2OBnaF07hgRH6+GSGFVprGloS+Vs=;
 b=Pqpx50gCOs7vk8VRqcGvkXQMY0yuP095S67Qyt0+xe/lwJkBzihNm+eNTHOAmo8rrY
 4ECueTNOZP8J2Hzp9H1W9fMlyMTzMRiZshi98nNrfbPLHLH4RKFgJHVwaINEpup8o7dr
 EEGjqTwfmUAUKQbQi8zSrvRHrSB3JxAoQmF1nBRjH+CVzMq3jkljDXVpbVQ1f8HWyYfW
 25krDr9GGlAF7K+/+vHhyuCa05yjstKCe5hVzK/mXBpvyTYGSI8eV2k2rlMyvV9HGHHh
 ssqYoDpL3TDynSwJgCYvNud1HxJ83bhBf8ZMSxSiiFlMK5oZzQEtJiD/vo00exQpM7EH
 PShQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUpYE7zhlKwFpM2HB7HAZAYYxqMYyQgsbkayz8fkfyj9qVas1uPxSVfPPm77yW3wp8JgQC8Yo9lN/ULLpasow+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwGtpY0OYrcA2bcLeuTTKsf2EuDpaqjGT9y5U8nVD4WnStPFgUU
 1bluWHTGEz7kEQm2HjJZnrBT6vHTP3fsS9SZ7qWhPCpoguF0FzY+x6UU
X-Gm-Gg: ASbGncuT4HpwmlLigz2r4P5FO7HfLNooTr3dVkNbGyi6f0gw/3URW5uYz83E+/g9Nsr
 Ht2OhUKDygqphLqAS7oPaOwF9XH/qzKubZwD+DYJEL8YtYXC9FR4lZhGAXlm4VAwW84HncMdp06
 +w2OqTvZwcguJMz9TgMlo4OWJslYtwFLDhqn/7cEiMUwPqEsSAz5ZWtfsoxSLs9PrVqbeMqyY6y
 kppAM8OIE9ZTVxKzD8Sh5gsz1mStyxoV3ACWiUs4oXyT+uZgIPq7pA79RrqOYQBbn9CZvJHxDd1
 1c+ozeA5wbSX0wsc21tNKNEGlmbuy6wFDWu7KhLyHzOLWnvfIp9zxWF2t5biQ3bbM/1m8OYtDXg
 yc62qFG0fVhukY7eBLrAULmxBfhdMZ54k/eVVIH2gxYj5NX6FL8VVseJ4GUEYupZuc959eMmpoI
 QPOzZvlM0K5b1wLMwxPJ7/WXZ1zB99oeAbBkocSEBepicNLJw=
X-Google-Smtp-Source: AGHT+IGsJc67nHzRSaGN7J/UxQrgH96kyTpeGXuRk0eYF4SOZV90nUCcoNrz1/tW/LtO3V9QCDnQOg==
X-Received: by 2002:a05:7022:e994:b0:11b:ade6:45bd with SMTP id
 a92af1059eb24-11c9d708d4amr8669000c88.8.1764028109428; 
 Mon, 24 Nov 2025 15:48:29 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93db4a23sm76988653c88.2.2025.11.24.15.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 15:48:29 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Mon, 24 Nov 2025 15:48:06 -0800
Message-Id: <20251124234806.75216-7-ckulkarnilinux@gmail.com>
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
 checking in XFS discard functions dead code. Change xfs_discard_extents()
 return type to void, remove error variable, error checking, and error logging
 for the __blkdev_issue_discard() call in same function. 
 Content analysis details:   (0.8 points, 5.0 required)
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.175 listed in wl.mailspike.net]
X-Headers-End: 1vNgIS-0006LB-60
Subject: [f2fs-dev] [PATCH V3 6/6] xfs: ignore discard return value
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
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() always returns 0, making all error checking
in XFS discard functions dead code.

Change xfs_discard_extents() return type to void, remove error variable,
error checking, and error logging for the __blkdev_issue_discard() call
in same function.

Update xfs_trim_perag_extents() and xfs_trim_rtgroup_extents() to
ignore the xfs_discard_extents() return value and error checking
code.

Update xfs_discard_rtdev_extents() to ignore __blkdev_issue_discard()
return value and error checking code.

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 fs/xfs/xfs_discard.c | 27 +++++----------------------
 fs/xfs/xfs_discard.h |  2 +-
 2 files changed, 6 insertions(+), 23 deletions(-)

diff --git a/fs/xfs/xfs_discard.c b/fs/xfs/xfs_discard.c
index 6917de832191..b6ffe4807a11 100644
--- a/fs/xfs/xfs_discard.c
+++ b/fs/xfs/xfs_discard.c
@@ -108,7 +108,7 @@ xfs_discard_endio(
  * list. We plug and chain the bios so that we only need a single completion
  * call to clear all the busy extents once the discards are complete.
  */
-int
+void
 xfs_discard_extents(
 	struct xfs_mount	*mp,
 	struct xfs_busy_extents	*extents)
@@ -116,7 +116,6 @@ xfs_discard_extents(
 	struct xfs_extent_busy	*busyp;
 	struct bio		*bio = NULL;
 	struct blk_plug		plug;
-	int			error = 0;
 
 	blk_start_plug(&plug);
 	list_for_each_entry(busyp, &extents->extent_list, list) {
@@ -126,18 +125,10 @@ xfs_discard_extents(
 
 		trace_xfs_discard_extent(xg, busyp->bno, busyp->length);
 
-		error = __blkdev_issue_discard(btp->bt_bdev,
+		__blkdev_issue_discard(btp->bt_bdev,
 				xfs_gbno_to_daddr(xg, busyp->bno),
 				XFS_FSB_TO_BB(mp, busyp->length),
 				GFP_KERNEL, &bio);
-		if (error && error != -EOPNOTSUPP) {
-			xfs_info(mp,
-	 "discard failed for extent [0x%llx,%u], error %d",
-				 (unsigned long long)busyp->bno,
-				 busyp->length,
-				 error);
-			break;
-		}
 	}
 
 	if (bio) {
@@ -148,8 +139,6 @@ xfs_discard_extents(
 		xfs_discard_endio_work(&extents->endio_work);
 	}
 	blk_finish_plug(&plug);
-
-	return error;
 }
 
 /*
@@ -385,9 +374,7 @@ xfs_trim_perag_extents(
 		 * list  after this function call, as it may have been freed by
 		 * the time control returns to us.
 		 */
-		error = xfs_discard_extents(pag_mount(pag), extents);
-		if (error)
-			break;
+		xfs_discard_extents(pag_mount(pag), extents);
 
 		if (xfs_trim_should_stop())
 			break;
@@ -496,12 +483,10 @@ xfs_discard_rtdev_extents(
 
 		trace_xfs_discard_rtextent(mp, busyp->bno, busyp->length);
 
-		error = __blkdev_issue_discard(bdev,
+		__blkdev_issue_discard(bdev,
 				xfs_rtb_to_daddr(mp, busyp->bno),
 				XFS_FSB_TO_BB(mp, busyp->length),
 				GFP_NOFS, &bio);
-		if (error)
-			break;
 	}
 	xfs_discard_free_rtdev_extents(tr);
 
@@ -741,9 +726,7 @@ xfs_trim_rtgroup_extents(
 		 * list  after this function call, as it may have been freed by
 		 * the time control returns to us.
 		 */
-		error = xfs_discard_extents(rtg_mount(rtg), tr.extents);
-		if (error)
-			break;
+		xfs_discard_extents(rtg_mount(rtg), tr.extents);
 
 		low = tr.restart_rtx;
 	} while (!xfs_trim_should_stop() && low <= high);
diff --git a/fs/xfs/xfs_discard.h b/fs/xfs/xfs_discard.h
index 2b1a85223a56..8c5cc4af6a07 100644
--- a/fs/xfs/xfs_discard.h
+++ b/fs/xfs/xfs_discard.h
@@ -6,7 +6,7 @@ struct fstrim_range;
 struct xfs_mount;
 struct xfs_busy_extents;
 
-int xfs_discard_extents(struct xfs_mount *mp, struct xfs_busy_extents *busy);
+void xfs_discard_extents(struct xfs_mount *mp, struct xfs_busy_extents *busy);
 int xfs_ioc_trim(struct xfs_mount *mp, struct fstrim_range __user *fstrim);
 
 #endif /* XFS_DISCARD_H */
-- 
2.40.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
