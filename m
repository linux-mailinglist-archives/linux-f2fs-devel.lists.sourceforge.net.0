Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 07964298C08
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 12:23:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xn9iJH2Gi2wU8V2EpdHb3hDps1RbC8OoutgBt+xlxeI=; b=fxxMxNb2S7GYA77kZuxbDFQAvw
	Eo/rHPDvUxBJvqVwi58+XhPxlTi/r3YMl7Tkq/TwWyHcmBLD+j2UTtTpnvlkiYK7Fii4pBFR2dnPN
	+Axg7LVfheH1VZw85IrebJbc3Wyk3WgbZJdVhLifmCC4/sc/zjYXbCh2iXTecFDANnws=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX0ai-0007oy-6r; Mon, 26 Oct 2020 11:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3fpmWXwgKAA863qx2w79v33v0t.r31@flex--robinhsu.bounces.google.com>)
 id 1kX0ag-0007og-Gz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 11:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iuncRZU/n/qdgI7S//uwAQmqKe3LmFdZ5wVUdpPMh/w=; b=fSIjG68Yqx/KTFuzbw7hLXctFf
 uWESP1Yhp49NV2ceaTxcE7bzY2NFEXzZU8BEJH+YN8kXre3NfTc4nSX3Ot0Frea7RqsOsK5rh5ZN+
 Kdlu4KYRSmKBqGrbWvokX5iepZ/T1kOwa1LPMSJBvhD5B+oW3WqGpwkWNQqbVS0is5/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iuncRZU/n/qdgI7S//uwAQmqKe3LmFdZ5wVUdpPMh/w=; b=Y
 HEFwLXACS5btHE//JGLOTYGuAa9lK6FdCSiZo3FLuTg8FDNtni+uyXc3W1OewRtYBqKoNaxBqsE3E
 Ff1OsUn1dLRLJIWjcfUzWCWxba7qNlhz3OWUCJQaUkgNy3Jkaf1AYGzWY3q2FzvqNE6rPEeab5OML
 AiqaOco5FodLd1mQ=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kX0ab-00E6Cv-AE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 11:23:06 +0000
Received: by mail-pj1-f73.google.com with SMTP id bp7so2504086pjb.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Oct 2020 04:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=iuncRZU/n/qdgI7S//uwAQmqKe3LmFdZ5wVUdpPMh/w=;
 b=hmJWGdpqiRn4Qj3L1IygZpzGMSUe6R8DMaJrpkXSHQNw39KBa6RMIe5uzIiB6ALHx6
 7mf+S0RUDSiwwxcgUUs2g6tU+OdLYm1nKIqq5KDm6ufIwwB0GIU1jQKNY/1b7RjRCnxP
 5Y4ejCYnwj0alqRFXaHpjum/4p0iNzF2DB9ksst+SKHVKXZqfeJI5gWldJTvvAU/kl2X
 lkvCJ4do2DG/ivLaxOTCeXASrBgPukGqE1x6TWKC+Vm+f8ZGS54j9kCS/fF+YnD1VuPU
 yENvmvyMy1Tn74qP91YQFTRR4CPScRNkvVnq/ITJEE9/ncpgTc1eudPTKtluTEgNMexN
 LKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=iuncRZU/n/qdgI7S//uwAQmqKe3LmFdZ5wVUdpPMh/w=;
 b=d+OF2UU52Yn3tbfBEU6GynPcSgh3dYkBADc4Zfh4umR7HlBnQkgZt/IJYSD27ZuIjp
 Y5cdmfnqMVXhwrTHMuPGvHT3XDVYGeE8ytS39NdoxuzUijEqVi3gyawKcBh1inaT3W4W
 iDRc+jULSVKUUFQ45IiqQphyZBeE6xSSzP9ySRLx53iuN7uslZB7YDv30a5gwCyqRlRp
 usQa0L4t5NhqcJ4hBUwcXaGixsSQU+tNde/4kHUEVOvnVg7Zur+ODrrBNH5W5HJAPPIX
 h9xo9rhwyQ59S1WeOXdw5mS4c1aPsjuzCZhxopZj7CCOMJxISl5npcbeCHId32riz/zB
 nWfw==
X-Gm-Message-State: AOAM533vYQuHiIEy/Ly3aNGV/Z4S/8jKzLD4vfiuemRsxueKuKhg3CFv
 yBfgEsSoe4dzGrA4rxUMi69TdDvgoAf1y19jlLjUmh4pK4TLotu6FSQg9tjBahIcqBpdsfbmPTw
 jgeZLck2WzfDVRHlHFmGFoGnw/uv1eK03bdZGQRpy8McInklTsOMDbU4gcRHqrSfNR92ss9MHmO
 ZHnQWU27HnPDFS
X-Google-Smtp-Source: ABdhPJy+mI0vnmKylwtlFsmVxcnM1tY+7eaIo+ulq7WWs25n80yx/lSw9fa2rKak9PfsRXDP0qke3U9F+1cAUQ==
X-Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 (user=robinhsu job=sendgmr) by 2002:a0c:e054:: with SMTP id
 y20mr16670180qvk.30.1603705214218; Mon, 26 Oct 2020 02:40:14 -0700 (PDT)
Date: Mon, 26 Oct 2020 17:40:00 +0800
Message-Id: <20201026094000.1500425-1-robinhsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
 chao@kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kX0ab-00E6Cv-AE
Subject: [f2fs-dev] [PATCH 1/1] f2fs-toos:fsck.f2fs Fix bad return value
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
From: Robin Hsu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Robin Hsu <robinhsu@google.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

'ret' should not have been used here: otherwise, it would be wrongly used
as the error code and then be returned from main().

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 fsck/fsck.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index f97e9fb..66e4e3f 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3137,8 +3137,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 		char ans[255] = {0};
 
 		printf("\nDo you want to restore lost files into ./lost_found/? [Y/N] ");
-		ret = scanf("%s", ans);
-		ASSERT(ret >= 0);
+		ASSERT(scanf("%s", ans) >= 0);
 		if (!strcasecmp(ans, "y")) {
 			for (i = 0; i < fsck->nr_nat_entries; i++) {
 				if (f2fs_test_bit(i, fsck->nat_area_bitmap))
-- 
2.29.0.rc2.309.g374f81d7ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
