Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DB506918
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 12:49:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nglPq-0002UZ-TK; Tue, 19 Apr 2022 10:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <xuyang2018.jy@fujitsu.com>) id 1nglPh-0002Sr-Rx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 10:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L0gnk54iyGfM60Qjlex0JGvplvmF+grDZIqDPCSoCAQ=; b=i7Xhg41w/hOolyhqjMcmzx/g5h
 zKiGQ4pWYyGs4LuK120OBZNVwm3pNSGvgdKwNCS5Ln+H5oeY0xDaCFSursZfuciEEdYBNd0pSInuM
 K2pqmNaao90zyNKvoAHwPkckwyL/3STZ/4uw4XHshh/znVgbcHO2Qnx652MS/ehLciKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L0gnk54iyGfM60Qjlex0JGvplvmF+grDZIqDPCSoCAQ=; b=C2wHvM9oiFbWgkCZt5Iy9521db
 u2TXbUZNU0MhrkgHrYGJhQcQmYzdMND2GgP9dgxhF3rzsB4Q/vk9q0niVpRIBt0i2wlqhsMqvai6A
 eADxvztQ3qkOA3E9v8rpzKpC0HlwM8wZxrvfAvmgj8au3gfWAFGcEG1dmNssl6YbrTqU=;
Received: from mail1.bemta36.messagelabs.com ([85.158.142.2])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nglPb-003kU5-UI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 10:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1650365319; i=@fujitsu.com;
 bh=L0gnk54iyGfM60Qjlex0JGvplvmF+grDZIqDPCSoCAQ=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=Vbslnnvp7hIfI/TZE7tXKJR3U/OhVVDHi8Nw9ysK8O4YO+PvAYCM18PJZ8HA6Kdn+
 If51cY2Pw67flEgu2vdqdfOuq6cIybAAHtJkSAYZuBAPQMHMOLGGnlngMMZpsJqLMG
 gXrHPgh5XGU7xDzAlXBS8nwzW8RQ0zedJ/9gvroDF2o2StoYVv7u1NE3nb/MXgDyW7
 CO+qyFNdGjE0n4e4zXgA7jAOK/gxO7FifSPWONtuauFRyD3sIRbm+vn4YcuBc/zJUy
 DMOdO/0dLYpCdr8Yk9zIFp1GMZoC4qjqMAKA2xW34Ynwc22w2a54Ki68f5Tc61RVmg
 KnM9N9407wX5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleJIrShJLcpLzFFi42Kxs+GYots2OS7
 JYN4MVYvXhz8xWny4OYnJ4vTUs0wWW47dY7S4/ITP4ueyVewWlxa5W+zZe5LF4sKB06wWu/7s
 YLdY+Xgrk8X5v8dZHXg8Ti2S8Ni0qpPN48XmmYweuxd8ZvL4vEnOY9OTt0wBbFGsmXlJ+RUJr
 BlzfxUXvOCuODJlLmsDYytHFyMXh5DAa0aJaTNvMkE4exglun52MXcxcnKwCWhKPOtcAGaLCC
 hLLLhxjA3EZhb4wCQx8WAViC0sECFx/dkpsBoWAVWJN91P2EFsXgEPiTVbnjOB2BICChJTHr4
 Hq+EU8JTY+PY9C4gtBFRz/fAWZoh6QYmTM5+wQMyXkDj44gUzRK+ixKWOb4wQdoXErFltTBMY
 +WchaZmFpGUBI9MqRtukosz0jJLcxMwcXUMDA11DQ1NdMwtdIxO9xCrdRL3UUt3k1LySokSgr
 F5iebFeanGxXnFlbnJOil5easkmRmDEpBS7SOxgvNn3U+8QoyQHk5Iob31UXJIQX1J+SmVGYn
 FGfFFpTmrxIUYZDg4lCd7SCUA5waLU9NSKtMwcYPTCpCU4eJREeCf3A6V5iwsSc4sz0yFSpxh
 1OSb9ubaXWYglLz8vVUqcV6wFqEgApCijNA9uBCyRXGKUlRLmZWRgYBDiKUgtys0sQZV/xSjO
 wagkzLtxEtAUnsy8ErhNr4COYAI6onpKLMgRJYkIKakGpk06k238rWeF92iIH7bWTr1z9T+Lg
 b5E30Pf04c5889ZvDvQ4VFQ2H2jf/Oca5u8kh3F0zoW/QzM2Z+woPW276IZV0pnRu942+2fnM
 itYzh17m2Twgbjk6nCpj2h5mdE76lsX+jA+lP5d9aL/UXsjIfaeCcpqF+OEHwZwrp9+03OLes
 mnZl8gn/Ppb9vo68/mHqp+PKZtSzKiuWKvkL1JcJOSV82dL0TPbCdb+P8Dzxcgh72suKNThlu
 G5Zrs60236H6M8vy1aW4jqWuq+dusG/pm7J91Uv5nsSJPFsFlQ1+2XOIf79SNyHU+oLqro2PX
 Nie986TfyMys/buTfnrj73dzF5xtVZa7zhdGaH5RImlOCPRUIu5qDgRAJF7efCfAwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-25.tower-545.messagelabs.com!1650365318!270565!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14526 invoked from network); 19 Apr 2022 10:48:38 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
 by server-25.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Apr 2022 10:48:38 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 23JAmcLA004855
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 19 Apr 2022 11:48:38 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Apr 2022 11:48:32 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <linux-fsdevel@vger.kernel.org>
Date: Tue, 19 Apr 2022 19:47:12 +0800
Message-ID: <1650368834-2420-6-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Like ext4 and other use ${fs}_init_acl filesystem, they all
 used the following style error = posix_acl_create(dir, &inode->i_mode,
 &default_acl, &acl); if (error) return error;
 if (default_acl) { error = __ext4_set_acl(handle,
 inode, ACL_TYPE_DEFAULT, default_acl, XATTR_CREATE);
 posix_acl_release(default_acl); 
 } else { inode->i_default_acl = NULL; } if (acl) { if (!error) e [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [85.158.142.2 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [85.158.142.2 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nglPb-003kU5-UI
Subject: [f2fs-dev] [PATCH v4 6/8] ntfs3: Use the same order for acl pointer
 check in ntfs_init_acl
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

Like ext4 and other use ${fs}_init_acl filesystem, they all used the following
style

       error = posix_acl_create(dir, &inode->i_mode, &default_acl, &acl);
       if (error)
                return error;

        if (default_acl) {
                error = __ext4_set_acl(handle, inode, ACL_TYPE_DEFAULT,
                                       default_acl, XATTR_CREATE);
                posix_acl_release(default_acl);
        } else {
                inode->i_default_acl = NULL;
        }
        if (acl) {
                if (!error)
                        error = __ext4_set_acl(handle, inode, ACL_TYPE_ACCESS,
                                               acl, XATTR_CREATE);
                posix_acl_release(acl);
        } else {
                inode->i_acl = NULL;
        }
	...

So for the readability and unity of the code, adjust this order.

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 fs/ntfs3/xattr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/xattr.c b/fs/ntfs3/xattr.c
index afd0ddad826f..64cefa869a61 100644
--- a/fs/ntfs3/xattr.c
+++ b/fs/ntfs3/xattr.c
@@ -642,13 +642,13 @@ int ntfs_init_acl(struct user_namespace *mnt_userns, struct inode *inode,
 		inode->i_default_acl = NULL;
 	}
 
-	if (!acl)
-		inode->i_acl = NULL;
-	else {
+	if (acl) {
 		if (!err)
 			err = ntfs_set_acl_ex(mnt_userns, inode, acl,
 					      ACL_TYPE_ACCESS);
 		posix_acl_release(acl);
+	} else {
+		inode->i_acl = NULL;
 	}
 
 	return err;
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
