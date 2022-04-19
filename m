Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC2450694D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 13:02:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nglct-0004nn-8I; Tue, 19 Apr 2022 11:02:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1nglcs-0004nh-AM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5OQ/Hq2ZgIjiCcAVb/a2oNQEva6kfuXLNoiXM0nDZ3Q=; b=MeSXNztEquKIK2nwnKG21+kvVl
 6RbV7O1Z/ASMeNpiL1q9T+3kQkIfa1lrqvwHRBbrzyoovNs/0iJ017S2iO7fXQ4EesbkBo2YEkE8a
 soQIO9km1mGGC37uREc3miyE3pZ6bLoxUajE2C5W8MRgTDWBCu3pPCO523M/Ljl8D1N4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5OQ/Hq2ZgIjiCcAVb/a2oNQEva6kfuXLNoiXM0nDZ3Q=; b=FlyWY/uAf365DMU7ozP5KXCVQu
 /sjmc4wVcEL4IHd1izgJBnDdRSklSizZS0Wj119WhTiK37txzVoP7cMqdnoBRWKBmFxOqYiZiAO/l
 0D+vUv6qqGES0iwsyW9NqbSwbKms2uA1TfiH/F4URMTUamK3E960xfExryilc2oSi61c=;
Received: from mail1.bemta32.messagelabs.com ([195.245.230.66])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nglcs-0006AL-DA
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 11:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1650365276; i=@fujitsu.com;
 bh=5OQ/Hq2ZgIjiCcAVb/a2oNQEva6kfuXLNoiXM0nDZ3Q=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=r5MwFFr2WWDUk61GLUsbh5JTCIZEpkXCpaJ0qL62tSpTmwYBZB3XSBbPLvbOAg1rb
 ekxsFqL3U5xO9+rhi+xB9/1RqcWvX+tWWGQlXYermRWYV9uNMspMm8HenLhwSVjosG
 GGnksgt32LTuoCdY9GLut+vKZ5dXMTIx+RaSvtB3/GygRywhno2b9myLkVGaXQFFS0
 bDU8Dgt14SkkVZsyuXPyVv3NeuyF5Ru9FURWhU9YIoh0XrzOxfzaWD58XJIpA50QGI
 1ZgoRicAz1G0WPtkwvL5eZi3nzzdAAcb1qhsJO95T+HcOVWKSW1aPxjCB6GFCsTYKL
 fpw4KTbmFgPrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRWlGSWpSXmKPExsViZ8MxSTdmcly
 SwZUjQhavD39itPhwcxKTxempZ5ksthy7x2hx+Qmfxc9lq9gtLi1yt9iz9ySLxYUDp1ktdv3Z
 wW6x8vFWJovzf4+zOvB4nFok4bFpVSebx4vNMxk9di/4zOTxeZOcx6Ynb5kC2KJYM/OS8isSW
 DMaLy9hLFjHVrHz1DvWBsYNrF2MXBxCAlsYJd62rGTqYuQEchYwSZx4zAmR2MMo0Xz8JCNIgk
 1AU+JZ5wJmEFtEQFliwY1jbCBFzAJnmCQuXVsCVMTBISwQJvHoRgJIDYuAqsT3ex/BenkFPCR
 eLj4ItkBCQEFiysP3YHM4BTwlNr59zwKx2EPi+uEtzBD1ghInZz4BizMLSEgcfPGCGaJXUeJS
 xzdGCLtCYtasNqiZahJXz21insAoOAtJ+ywk7QsYmVYxWiUVZaZnlOQmZuboGhoY6Boamuqa6
 RqaWeolVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgRGV0ox28odjCv7fuodYp
 TkYFIS5a2PiksS4kvKT6nMSCzOiC8qzUktPsQow8GhJMFbOgEoJ1iUmp5akZaZA4x0mLQEB4+
 SCO/kfqA0b3FBYm5xZjpE6hSjopQ4r1gLUEIAJJFRmgfXBksulxhlpYR5GRkYGIR4ClKLcjNL
 UOVfMYpzMCoJ8xZNAprCk5lXAjf9FdBiJqDF1VNiQRaXJCKkpBqYLFj3Llz8jqd68sIG94ZpM
 15fWW7Eou4xU1kpcq75wjB7Zfkks62rOiNWL9efYfNgjUNRh1dUpgZLaOO1a6334l/zv9Scuu
 e9XUmO1YpbooUHzdMiXymlznizc9nXgIRkYeuokKUtL/XEYi1XXmB0jCr5y/2Vfdud97dFF1b
 8vCp4fpWQoLf0ksV/RS7PT7PiK3TPqFgW56K3K7/8+IkaFuXLKzy4A+SX9T9Km3D0guD1OV92
 HnCLiOw6Imnr/W37r/BDlakXlyUvW6jy20omjW+hyS2vY3xTZYIvXz+zVf6t7U+jOLd3h7pdm
 GfVv5bck7RtpZCPC1MD50/jZsdNPLtNmJqXl+wunKo3u+63EktxRqKhFnNRcSIA4mPkI6kDAA
 A=
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1650365275!269614!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9211 invoked from network); 19 Apr 2022 10:47:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
 by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:47:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BABB7100460;
 Tue, 19 Apr 2022 11:47:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AB4B1100459;
 Tue, 19 Apr 2022 11:47:55 +0100 (BST)
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:47:35 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 19 Apr 2022 19:47:11 +0800
Message-ID: <1650368834-2420-5-git-send-email-xuyang2018.jy@fujitsu.com>
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
 Content preview: Like other use ${fs}_init_acl and posix_acl_create filesystem,
 we don't need to assign NULL for acl and default_acl pointer because
 f2fs_acl_create
 will do this job. So remove it. Signed-off-by: Yang Xu
 <xuyang2018.jy@fujitsu.com>
 --- fs/f2fs/acl.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [195.245.230.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [195.245.230.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nglcs-0006AL-DA
Subject: [f2fs-dev] [PATCH v4 5/8] f2fs: Remove useless NULL assign value
 for acl and default_acl
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

Like other use ${fs}_init_acl and posix_acl_create filesystem, we don't
need to assign NULL for acl and default_acl pointer because f2fs_acl_create
will do this job. So remove it.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 fs/f2fs/acl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index eaa240b21f07..9ae2d2fec58b 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -412,7 +412,7 @@ static int f2fs_acl_create(struct inode *dir, umode_t *mode,
 int f2fs_init_acl(struct inode *inode, struct inode *dir, struct page *ipage,
 							struct page *dpage)
 {
-	struct posix_acl *default_acl = NULL, *acl = NULL;
+	struct posix_acl *default_acl, *acl;
 	int error;
 
 	error = f2fs_acl_create(dir, &inode->i_mode, &default_acl, &acl, dpage);
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
