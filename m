Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85778C7ED6A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 03:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ahfaTG3hsUqCIH3pJyukCYt8YeRMaSMUJfgiuccAWoM=; b=hFNK6N6n6/bPJjUUdmY/Afn+YD
	FD183FPMR0SuB9OswD+G1TtfJ1n3XB9GVbAFJRQSa94R/ludw8ygDLe0HezKn7IXOtof1kxa6X0Nq
	GdHjvLTtP40XOQZkVzObcfDQBGwUHhxQiams2IFRu20OZA3/Z6xHCNxJvnxLSB0yLhio=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNMmA-0006nh-Q9;
	Mon, 24 Nov 2025 02:58:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ckulkarnilinux@gmail.com>) id 1vNMm9-0006nQ-Av
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7wt4l3Vmobq4GuuMyFPJBgrWPvgmrjYhaZwLaOIoKCQ=; b=lmuA9o9SpXSPby7Zel4AseTCuh
 Zwn4v0OrIznmJeyOg6omnvuaGbvSRzdXSJylp05RM8bsaLZ9eXICA+V5byMcfnlgnpHFJQTw3I7om
 cMvd+usmo+A9N+V936df74DNJVtL7lhHyZiL74CKYdzxxzvA5jIMbccFYfuC7El6eUCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7wt4l3Vmobq4GuuMyFPJBgrWPvgmrjYhaZwLaOIoKCQ=; b=mOR6VxinafgfV3nvQFkF2shzyc
 0AEpx7fEHYist29MfAKwDxqbJj7/uyzMLk4EMAX3fF5dZrzvpoUavJEh+EAWt4nEl1eb9Fv356Ft5
 kaSbhj9+b1BejATu68lfqqtET/zpST7yPe5/ES9UJenKB3zHFkNIrI9UI9fVscve2/Xc=;
Received: from mail-dl1-f47.google.com ([74.125.82.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNMm8-0002fh-Qu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 02:58:01 +0000
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-11b6bc976d6so4809643c88.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Nov 2025 18:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763953070; x=1764557870; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7wt4l3Vmobq4GuuMyFPJBgrWPvgmrjYhaZwLaOIoKCQ=;
 b=MA5s2Fawct+woTUdLFV01FUA/AdCDjLL7xLNitIdn1Vx8Az91icLwH+MpGyfUJBQsv
 0OtwF4BssycEnS02G03wmFoNjo+xwzG2TALmrCUt5Gjg1Wf09E6aHPSKK03Amksjpn8e
 As1jUe5/L3JkXfyD/5OwLh+vb7oFLx7DK82hsUvRDKslJ+oDaMKemjU+LK6z44Jqg0NT
 40ADg/Gi1UNXyo4Gc/yhT5UUMdehLHx8NskJNBd7LnOImEQ68gmpuZdBuIu/rwuW2fbW
 RcTNWu7Mjwoc9fn33P0tWTSwUlfnG5YIuREC0U5/ieeWLkPcxKZSeu+LN8VDLNVlDcQf
 dA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763953070; x=1764557870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7wt4l3Vmobq4GuuMyFPJBgrWPvgmrjYhaZwLaOIoKCQ=;
 b=w2TDZY5G92/XuA4creKpWFxLXS5yGlRSVGeJApywA7Et6mjanrR4UAI/C2OVwKXVg0
 zWTV3pvVA2komRVyeqMMRN2IkXQpkAwB+lK9UnsnDl2BXt3+7GCVrP3nOdCdUzeFpgOU
 RKUZkXwg0osQUY0p8/lvNAHchYP4u7mx0JM50qvQpATjLUdbEMC0N6HcSj+UrLyGZhX7
 yityimykmLf8Mp3Es3srdiK95Qfp4+rVcUgdUMl8chK1KVTZy1mQ1NA9I9P2C47Kyt57
 cJ+jqTVGzPzSPFPYIDfORhlNCM6o/UetOkTGnJCm2jx6V+NYWJ5MSN2SawC6OV3xxxmV
 IC+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8QLENngTc9NPNXOucdRLHJ0XZaQFiF+QL0/mRa7Pa/6ABOOXgu2LMKDAJ8KN2R+qB/xIa+vcjYW7qpDRzd0ic@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyPpvHd+2XQErS02HBmdV2L7tFxCMzaq4p74FmjCYWS8EB4WqCQ
 5MYAE0GXL+e0+FKpBC9tnOhlrwVzBU5NJ7FxK02oF4eEyqqd6nh6zY+a
X-Gm-Gg: ASbGnctA96YugxjUhKXL8gRIwhS4Bj/Kouyda/kdisf3dIco5WUS6A7cn23XyvKzhL5
 IfON9Btk9e5JknQ3EPuJmBf048EuQprCJIejHY6bEanhs3DGBzO9VMInS5d7Y07Mlz/CmDcn79W
 H7/Z6HQivy6Z6KPwBDX8+B+PQwQ+EpeAJ4ypCHPYetfPAe6GAlHkh2qd7wJUEJwKBLXK7/5Jwkk
 hqaGUMqaBM+Gz4ndmzdl8TsA+zN/tv7C4gl3UiMFWopKHZetUid8C9zkesaVtmtSpmibXtfs5eH
 /63OfaoV528SAFZL/MEQhR/wqCmjuXN/z3pbSZ5Ek0QqWyM+PO6Ai5WQns2Dbz58WfW2+Yi+wn+
 dO8Myx2LaYepU6tDqgC3Ig+c36nAllWDg58bonPdSiRR3Va2tdpnndRknOccnLRNgn2kOr4vbr+
 5VA1MRcajnoS5gsFNoXibpnYltpTV/N/Imw97z7qmlMFWn/0vsduQFe41Mqg==
X-Google-Smtp-Source: AGHT+IFpsDs+kXmQXVU6E1/nGle2v7URUru8XFd/49TW2BQ+0epIeeb7LYLuuNciA5YRvlLXxX79hA==
X-Received: by 2002:a05:7022:3d0e:b0:11b:3eb7:f9d7 with SMTP id
 a92af1059eb24-11c94b601c2mr7020409c88.14.1763953070114; 
 Sun, 23 Nov 2025 18:57:50 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11c93e6da4dsm58917652c88.9.2025.11.23.18.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Nov 2025 18:57:49 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org, mpatocka@redhat.com,
 song@kernel.org, yukuai@fnnas.com, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, jaegeuk@kernel.org, chao@kernel.org, cem@kernel.org
Date: Sun, 23 Nov 2025 18:57:37 -0800
Message-Id: <20251124025737.203571-6-ckulkarnilinux@gmail.com>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ckulkarnilinux(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.47 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNMm8-0002fh-Qu
Subject: [f2fs-dev] [PATCH V2 5/5] xfs: ignore discard return value
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
