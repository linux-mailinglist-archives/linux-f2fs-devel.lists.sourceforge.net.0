Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E810D41D0C5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Sep 2021 03:00:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mVkRB-0004un-RX; Thu, 30 Sep 2021 01:00:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <keosung.park@samsung.com>) id 1mVkRA-0004uc-Kb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Sep 2021 01:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hmrht/E5BxEbIYYeu0hx6z1MushbCu0sIpLHFV6KIxs=; b=AjSs7AFpnHcij/z8prABT5I5FI
 EvAO/HdT8N2I2WDplHxDtT+oYgRdxuCtgstRkjA9jcwUovBs5vjJN2OXnCTNL07qXliws01+ikLcw
 vGm1PotR8xgS3LCI/TFTPxWwjBAELNVVZj2YJkeOKBJDKQu3h4g++FmGoSDBuRC8LvlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hmrht/E5BxEbIYYeu0hx6z1MushbCu0sIpLHFV6KIxs=; b=Y
 cTCI8rzihMUrZqDnic2DYZUOzuh2p6YyW6kI3utI3bntri7M7sN0OuivH2+aT/Ia3KRy+C7oV2xLc
 abH7ObrjsS707pyeWcIFazoD2yGHHKz0i5UeAKjoDqCTB+8b16Xln2rJaIAYa1eF/zTvUv/pPvddE
 hPuQDQnTfjP1QdSo=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mVkR0-0005Tw-N5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Sep 2021 01:00:36 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210930005953epoutp02c30432758a767bd7831429b04c8265f2~pc7x3OnfV0159401594epoutp02u
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Sep 2021 00:59:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210930005953epoutp02c30432758a767bd7831429b04c8265f2~pc7x3OnfV0159401594epoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632963593;
 bh=Hmrht/E5BxEbIYYeu0hx6z1MushbCu0sIpLHFV6KIxs=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=sj/EyOF413SUbtyW8oXYSaEm/v/EFETwVOfRA4CkrYvcbN6mZ1HZzvAiorp2Z+UAX
 +AXesCl5L4kGbN0LnU63mm46x4TcXK2GfM/UGtzMbYRwWJ1U4SMDSwOLHD6G8VaREk
 v6Lge5+1kdmD1ikb3qn1y+b4ofkBiMW1pM2RKvzA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTP id
 20210930005952epcas2p48cd1057fa3b2260997dbc75f1db6b174~pc7xcC_KZ1553315533epcas2p4I;
 Thu, 30 Sep 2021 00:59:52 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.97]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4HKZdp4N6nz4x9QZ; Thu, 30 Sep
 2021 00:59:42 +0000 (GMT)
X-AuditID: b6c32a48-d75ff70000002500-58-61550bfb2484
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 25.30.09472.BFB05516; Thu, 30 Sep 2021 09:59:39 +0900 (KST)
Mime-Version: 1.0
From: Keoseong Park <keosung.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20210930005939epcms2p7303bf6f96c824720f824989746491cba@epcms2p7>
Date: Thu, 30 Sep 2021 09:59:39 +0900
X-CMS-MailID: 20210930005939epcms2p7303bf6f96c824720f824989746491cba
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmue5v7tBEg90/ZCzW9O1isjg99SyT
 xctDmharHoRb9PZvZbN4sn4Ws8WlRe4Wl3fNYbPonL6GxWLO0U52By6PTas62Tx2L/jM5NG3
 ZRWjx+dNch4bPnUwB7BGZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam
 2iq5+AToumXmAJ2kpFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwL9ArTswtLs1L
 18tLLbEyNDAwMgUqTMjO6Nl9ga1gOmfFm/VLmRsYb7B3MXJySAiYSGx69oypi5GLQ0hgB6PE
 4tebWLoYOTh4BQQl/u4QBqkRFtCX2D7xPFi9kICSRNfCrcwQcQOJddP3gNlsAnoSU37fYQSx
 RQRCJF5PbgGbySzwjUni29OHbBDLeCVmtD9lgbClJbYv38oIYWtI/FjWywxhi0rcXP2WHcZ+
 f2w+VI2IROu9s1A1ghIPfu5mBLlTQkBS4sxhV4hwucTC88vYQfZKCHQwSrz+vgBqjr7EtY6N
 YHt5BXwlbu9uB+tlEVCVWHVKFaLERWLekktgJcwC8hLb385hBilhFtCUWL9LH2KTssSRWyww
 jzRs/M2OzmYW4JPoOPwXLr5j3hMmCFtN4tGCLawQtozExTnnmCcwKs1ChPMsJHtnIexdwMi8
 ilEstaA4Nz212KjABB61yfm5mxjBaVPLYwfj7Lcf9A4xMnEwHmKU4GBWEuH9IR6cKMSbklhZ
 lVqUH19UmpNafIjRFOjhicxSosn5wMSdVxJvaGJpYGJmZmhuZGpgriTOO/efU6KQQHpiSWp2
 ampBahFMHxMHp1QD016HFI3WdzX7rF27QzUvtTZ8Y+er3u+qNE3o4ssH9/2lUx3f17vnmiy7
 E8Clp+ckbf7Mg989YEX9WvN77qZzP1h0t3EGatyMjxBwYFk0P8jyvIpMWUjW23LxnUsM8mIe
 KET7KX4MuZKjuHyb3/kXy3dP4pyWbRUzLXBC9fUlEjfiHFVs9c9X3tQQmtA7P0DueHp8VcHC
 2Rwdd+xNFpx0ZRJK6F00447ikkOLuI9l1fOff35z2sKOg+9vdW4rqrn78+Lbi8IacTEl6nzq
 D8UWKqqmLi9J0zkZtyr4V/ephYuuat2O8tfjn89Zzflm4bYV8yNybtU1aDjN9j4Wy2GzqtCS
 Pdz59DqZEvO+KauUWIozEg21mIuKEwE6XthxJAQAAA==
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210930005939epcms2p7303bf6f96c824720f824989746491cba
References: <CGME20210930005939epcms2p7303bf6f96c824720f824989746491cba@epcms2p7>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since active_logs can be set to 2 or 4 or
 NR_CURSEG_PERSIST_TYPE(6), 
 it cannot be set to NR_CURSEG_TYPE(8). That is, whint_mode is always off.
 Therefore,
 the condition is changed from NR_CURSEG_TYPE to NR_CURSEG_PERSIST_TYPE.
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [203.254.224.25 listed in wl.mailspike.net]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mVkR0-0005Tw-N5
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to use WHINT_MODE
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
Reply-To: keosung.park@samsung.com
Cc: "changfengnan@vivo.com" <changfengnan@vivo.com>,
 Sung-Jun Park <sungjun07.park@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tanghuan@vivo.com" <tanghuan@vivo.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since active_logs can be set to 2 or 4 or NR_CURSEG_PERSIST_TYPE(6),
it cannot be set to NR_CURSEG_TYPE(8).
That is, whint_mode is always off.

Therefore, the condition is changed from NR_CURSEG_TYPE to NR_CURSEG_PERSIST_TYPE.

Cc: Chao Yu <chao@kernel.org>
Reported-by: Huan Tang <tanghuan@vivo.com>
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
Signed-off-by: Keoseong Park <keosung.park@samsung.com>
---
v1 -> v2:
	* Merge Signed-off and Reported tags for the same fix patch.

 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78ebc306ee2b..86eeb019cc52 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1292,7 +1292,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	/* Not pass down write hints if the number of active logs is lesser
 	 * than NR_CURSEG_PERSIST_TYPE.
 	 */
-	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_TYPE)
+	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_PERSIST_TYPE)
 		F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
 
 	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
-- 
2.17.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
