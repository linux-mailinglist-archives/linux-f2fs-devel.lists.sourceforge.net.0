Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6608506942
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 13:00:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nglb1-0004Qc-Gg; Tue, 19 Apr 2022 11:00:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1nglb0-0004QL-Ku
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ThqRNMVwN/gYuY+yP+qvGKhzoByHtom9pEJS+r8beCs=; b=Le0N1R0rER7E5+AN2JiqO3VR5o
 q8E69fYg+/aNRWtSHNgLZN3BQ7umoV/zLL6tKgH7Ib4f7hiFKXoeslYxaFIMzSpR8cl2+4yUUIRIi
 c58iRKPfPhntskbXYT/ACG+0V6tpzujxfCQKHEqdc+n+bRgyY28MX56UZb8TczMPOwsk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ThqRNMVwN/gYuY+yP+qvGKhzoByHtom9pEJS+r8beCs=; b=IuBF6F9m2MBYvyeh34TGVmK8/z
 E4stwoWBvn/oM86hvyU9WwioA5Peoq6gd4rnBPaQQhYarWMPTSmeOwHfl0buD/nDvWkSOARXHl9aN
 czfWI3nFVqJen1rJgy2t/ZRabZ/O1J+2J7q8/rZAea5nxJNir8oGaGh3iefjxuV1llaY=;
Received: from mail1.bemta32.messagelabs.com ([195.245.230.1])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nglaw-00064c-Df
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1650365198; i=@fujitsu.com;
 bh=ThqRNMVwN/gYuY+yP+qvGKhzoByHtom9pEJS+r8beCs=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=vq8WP8thCOyj7/cit9HcuzsuLaT7Dp6E5Mv4/k+4VpBVKwZ+PCFbO1n22gGwIZRic
 3EAXsuarx08FUb0aINwGjz+22QYqoIuaUmw1QiPfti+TAXN1G6iFNAfIyJFCkigljO
 xn7l4T/en7G07NbJi02RIWMWCjQIRzzS6bOpdqvKAyF+fUO0zthclHY/BOOVDw1QSX
 ybR9WRgQSa8SiryYEkeITq5n1nx+qwApuRusn2WBc32fhodUWClDYP1QWLKM4F14uD
 BKL5+xsiaO+2hwE4bEmtk1PvBs8RdxvEk/W3kbPBiNZHqhiCO3vXptGirx8uSz8omq
 G/P5MzBSVyhnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRWlGSWpSXmKPExsViZ8MxSZd3cly
 Swd+txhavD39itPhwcxKTxempZ5ksthy7x2hx+Qmfxc9lq9gtLi1yt9iz9ySLxYUDp1ktdv3Z
 wW6x8vFWJovzf4+zOvB4nFok4bFpVSebx4vNMxk9di/4zOTxeZOcx6Ynb5kC2KJYM/OS8isSW
 DMe7lnLWPCRveLv/ZVsDYz32boYuTiEBLYwSuxa84gdwlnAJNE2eyeUs4dRYsnLt6xdjJwcbA
 KaEs86FzCD2CICyhILbhwDa2cWOMMkcenaEkaQhLCAk8SeBz3sIDaLgKrE0vcvWUBsXgEPiYl
 t28FqJAQUJKY8fA82iFPAU2Lj2/dgNUJANdcPb2GGqBeUODnzCVicWUBC4uCLF8wQvYoSlzq+
 Qc2pkJg1q40JwlaTuHpuE/MERsFZSNpnIWlfwMi0itEqqSgzPaMkNzEzR9fQwEDX0NBU10DXy
 NBUL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMMJSihmu72Cc2PdT7xCjJA
 eTkihvfVRckhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3tIJQDnBotT01Iq0zBxgtMOkJTh4lER
 4J/cDpXmLCxJzizPTIVKnGBWlxHnFWoASAiCJjNI8uDZYgrnEKCslzMvIwMAgxFOQWpSbWYIq
 /4pRnINRSZi3aSLQFJ7MvBK46a+AFjMBLa6eEguyuCQRISXVwHTiO/fzlm8l4Ve61jFftdvQL
 H6qR4J1SlY+g3qsSveUrUb6gWJtiVaWcadEZHY839Z2wldx++X+5U/EHKymHs6ryzBNMPnH9r
 z8mDDT+vnaX0Vm92wNiOnU+i/+at70zEPhD+daG9it+T3tjAqHa5fwXhX2HXkOwvlHyuYffLV
 TsCrITLfmYWH5uS0Xll7uUH0/I70gL2vbVOVaK3v3RxzWPf/3JMTHrOiLbF7/TSHf4J7QRscj
 uRKdG9qCz6+9l1jRc4pDUuPYhQ7nS8I7q76wCU++GuX1Mlr+3sVfPxZaMTzwFU7XO60uZKyar
 PI2VORSXzGTeFzI38YX3RuTNDfmRx2NXny/p1bLmX+tEktxRqKhFnNRcSIA0R2Z56sDAAA=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-16.tower-591.messagelabs.com!1650365197!273701!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13109 invoked from network); 19 Apr 2022 10:46:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
 by server-16.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:46:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4DBA01000F5;
 Tue, 19 Apr 2022 11:46:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 21AF3100459;
 Tue, 19 Apr 2022 11:46:37 +0100 (BST)
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:46:25 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 19 Apr 2022 19:47:08 +0800
Message-ID: <1650368834-2420-2-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All creation paths except for O_TMPFILE handle umask in the
 vfs directly if the filesystem doesn't support or enable POSIX ACLs. If the
 filesystem does then umask handling is deferred until posix_acl_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [195.245.230.1 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [195.245.230.1 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nglaw-00064c-Df
Subject: [f2fs-dev] [PATCH v4 2/8] fs: Add missing umask strip in vfs_tmpfile
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
Cc: linux-nfs@vger.kernel.org, Yang Xu <xuyang2018.jy@fujitsu.com>,
 djwong@kernel.org, david@fromorbit.com, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, jlayton@kernel.org, ceph-devel@vger.kernel.org,
 ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All creation paths except for O_TMPFILE handle umask in the vfs directly
if the filesystem doesn't support or enable POSIX ACLs. If the filesystem
does then umask handling is deferred until posix_acl_create().
Because, O_TMPFILE misses umask handling in the vfs it will not honor
umask settings. Fix this by adding the missing umask handling.

Reported-by: Christian Brauner (Microsoft) <brauner@kernel.org>
Acked-by: Christian Brauner (Microsoft) <brauner@kernel.org>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 fs/namei.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/namei.c b/fs/namei.c
index 509657fdf4f5..73646e28fae0 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -3521,6 +3521,8 @@ struct dentry *vfs_tmpfile(struct user_namespace *mnt_userns,
 	child = d_alloc(dentry, &slash_name);
 	if (unlikely(!child))
 		goto out_err;
+	if (!IS_POSIXACL(dir))
+		mode &= ~current_umask();
 	error = dir->i_op->tmpfile(mnt_userns, dir, child, mode);
 	if (error)
 		goto out_err;
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
