Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D394FED4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 09:33:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdm1a-0006nl-1B;
	Tue, 13 Aug 2024 07:32:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <youngjin.gil@samsung.com>) id 1sdm1Y-0006nb-CG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 07:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zG6ilKTn8eNmcV9EFzJK5daAN5h+HI6Gemb8abNBuJk=; b=NZ8JCdyegWS5oD68YO3q8LQDJW
 bO6mQCLPjc1s4ZXHD/iaKquUbjAkb4vA3S41T+NyAcIdhUKBQcjDWmOQ/W+TFS1DqtRCQEm8xPNz3
 SoritgRYodqq2Xip+4YX0lUo2y8PFyz/yXopsw6g0ExJgXp6BvyBJ+tY78NacqJSRdNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zG6ilKTn8eNmcV9EFzJK5daAN5h+HI6Gemb8abNBuJk=; b=V
 5ltJP4N6471CQBXcFAJh8hOBW5ajr/7r0iwZo7UN/SzouvDdNVwesn74Akac743lJH1pNf3fPwd4g
 2LO2Sgv2FwAmfgm8+z7buI4mZp5wTalPXobrUWFAQHC08LpN7EX0YhgKVftJcCbsRL3dH2diwJEIS
 bP1fb09b2u6vbptI=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdm1W-0005Ns-Kl for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 07:32:56 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20240813073247epoutp04405a0e35e55160f3f058f216a75222e9~rOWAwA87F1979119791epoutp04L
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Aug 2024 07:32:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20240813073247epoutp04405a0e35e55160f3f058f216a75222e9~rOWAwA87F1979119791epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1723534367;
 bh=zG6ilKTn8eNmcV9EFzJK5daAN5h+HI6Gemb8abNBuJk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=n02JOwwmyaTY93Qq4+reruPpXRnDlSWMOvq638x33EcOj4dRZycrbNw91+/24Ojld
 J4VkgoHoucNvR2FsXCoD7T0rvQicMYvOnNovT6phmOmeOOMoUEgaUD9kNr7/kdxioE
 Csb8ijO1nU4hetpQzCD6e/Dw3nGCdFyyVLcKqe+Q=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20240813073247epcas1p1a5986fdba4af931962a07b631f37ce71~rOWAeSXVh2396423964epcas1p1M;
 Tue, 13 Aug 2024 07:32:47 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.242]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4Wjjlf6cx2z4x9Q7; Tue, 13 Aug
 2024 07:32:46 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 A6.C5.08992.E1C0BB66; Tue, 13 Aug 2024 16:32:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20240813073246epcas1p4085b32d2b008b77119b811dc328b964e~rOV-i0cGo0063700637epcas1p4c;
 Tue, 13 Aug 2024 07:32:46 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240813073246epsmtrp2b542b92e37c497f1ac776c80eff6a660~rOV-hnS5V0250902509epsmtrp2Y;
 Tue, 13 Aug 2024 07:32:46 +0000 (GMT)
X-AuditID: b6c32a33-70bff70000002320-aa-66bb0c1ec355
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3F.82.08964.E1C0BB66; Tue, 13 Aug 2024 16:32:46 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.99.41]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20240813073246epsmtip2a802335dba448035f5e87d2e088c0d4d~rOV-R5H9l1326513265epsmtip2W;
 Tue, 13 Aug 2024 07:32:46 +0000 (GMT)
From: Yeongjin Gil <youngjin.gil@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, daehojeong@google.com
Date: Tue, 13 Aug 2024 16:32:44 +0900
Message-Id: <20240813073244.9052-1-youngjin.gil@samsung.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmnq4cz+40g+mn9S1OTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bxYLW3ywWW/4dYbWYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijGhhtEouSMzLLUhVS85LzUzLz0m2VQkPcdC2UFDLyi0tslaINDY30DA3M9YyMjPRM
 jWKtjEyVFPISc1NtlSp0oXqVFIqSC4BqcyuLgQbkpOpBxfWKU/NSHLLyS0HO1ytOzC0uzUvX
 S87PVVIoS8wpBRqhpJ/wjTFjX/81xoIJfBXvDu1jaWA8w93FyMkhIWAisWDZMpYuRi4OIYEd
 jBI9K5rYIZxPjBLrJvxkgnC+MUqcuL6TCaZlzrUGqMReRoldb1YxwrU0rHzCCFLFJqArMfXl
 U1YQW0TATuLWzUWsIEXMAkcYJX7v2g5WJCzgLbFt+ydmEJtFQFXi96XrYHFeARuJPzfOs0Gs
 k5e42bWfGSIuKHFy5hMWEJsZKN68dTYzyFAJgWvsEp9XLmeEaHCRePPoIFSzsMSr41vYIWwp
 ic/v9rJBNKxilHjT+okJwtnOKDH9cQ9Uh71Ec2szkM0BtEJTYv0ufYhtfBLvvvawQpQISpy+
 1s0MUiIhwCvR0SYEEVaTuDLpF1SJjETfg1lQez0kPu8/BzZdSCBW4mTnBPYJjPKzkPwzC8k/
 sxAWL2BkXsUollpQnJuemmxYYIgct5sYwelUy3gH4+X5//QOMTJxMB5ilOBgVhLhDTTZlSbE
 m5JYWZValB9fVJqTWnyIMRkYwhOZpUST84EJPa8k3tDMzNLC0sjE0NjM0JCwsImlgYmZkYmF
 saWxmZI475krZalCAumJJanZqakFqUUwW5g4OKUamDKca1m+vr5uOGH2zES+4O/rdpu2vw2/
 55nzzDRMVc9vDe8S7Uz2t4sORVr095+6t0r7w26NPo+lD/KbuNeqnera335VPL/C8cgqJY98
 t78vvwfVvGgInf+3Y+YGidafCq2mNesWTnp+/wHjxI2L47LP3pSyMv3RmJF4qW/Cga02U2wD
 Lp7MKMlL6fz1s3hWbSRz8jxTqbmNZwNvcbkEpLllb5n9d/FLLu9LGuL/MvZbXYqbdG0e0+qt
 oTGBORPDvz2ZuK3q3TrZWwezVvzgKHm5Yxq7euSTf9837l5x+drV+THPO8y3Ra5jdeYW0jP5
 6jLLs+zTBq91W061LN8nJjHtkKXsr8sqs1YuOB8r9ChGiaU4I9FQi7moOBEAnAwO3V4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWy7bCSvK4cz+40g+mXeCxOTz3LZDG1fS+j
 xZP1s5gtLi1yt7i8aw6bxYLW3ywWW/4dYbWYsf8puwOHx4JNpR6bVnWyeexe8JnJo2/LKkaP
 z5vkAlijuGxSUnMyy1KL9O0SuDL29V9jLJjAV/Hu0D6WBsYz3F2MnBwSAiYSc641MHUxcnEI
 CexmlOhtusYKkZCR+DPxPVsXIweQLSxx+HAxRM0HRolVrYvZQGrYBHQlpr58ClYvIuAk8f9G
 OztIEbPACUaJr4u/MoEkhAW8JbZt/8QMYrMIqEr8vnSdEcTmFbCR+HPjPBvEMnmJm137mSHi
 ghInZz5hAbGZgeLNW2czT2Dkm4UkNQtJagEj0ypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k
 /NxNjOBg1dLcwbh91Qe9Q4xMHIyHGCU4mJVEeANNdqUJ8aYkVlalFuXHF5XmpBYfYpTmYFES
 5xV/0ZsiJJCeWJKanZpakFoEk2Xi4JRqYDLVr+0/Ze7kySJs5TFPXWl3R9X5zUY7n8VfSj69
 rEpIIPrUynV2JQxvuk46yb87HmH53t7PPptnUdjDD63hPl4mP1pFORcdSRSvdI3N6+/WuiG1
 VXih//OWb8JqWVkxRpN5Nv3Xmso292/4hS3ThOtMbPZd3aufXHPT6M2etBeZR64n2f/p/a7v
 IaT5ZVnCTsfqWPbH+dtm8DfFflF7ym87Jzt57zI/E8f+ZieTd0EPFqT9D+LasG2Dqn7XR7NT
 QkfdzyecCNrP0rNoQtrlXJnYGys5pun0PNm5Sz92ltDlhE0rTBZNZ2oOyV77/26IbZqvyJLp
 L6osbsyZ/vrim1ihhD1J0ZOVp0Q7S7hOUGIpzkg01GIuKk4EAMP3DqvFAgAA
X-CMS-MailID: 20240813073246epcas1p4085b32d2b008b77119b811dc328b964e
X-Msg-Generator: CA
CMS-TYPE: 101P
X-ArchiveUser: EV
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20240813073246epcas1p4085b32d2b008b77119b811dc328b964e
References: <CGME20240813073246epcas1p4085b32d2b008b77119b811dc328b964e@epcas1p4.samsung.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The i_pino in f2fs_inode_info has the previous parent's i_ino
 when inode was renamed, which may cause f2fs_ioc_start_atomic_write to fail.
 If file_wrong_pino is true and i_nlink is 1, then to find a v [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [203.254.224.34 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdm1W-0005Ns-Kl
Subject: [f2fs-dev] [PATCH] f2fs: Create COW inode from parent dentry for
 atomic write
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
Cc: Sungjong Seo <sj1557.seo@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The i_pino in f2fs_inode_info has the previous parent's i_ino when inode
was renamed, which may cause f2fs_ioc_start_atomic_write to fail.
If file_wrong_pino is true and i_nlink is 1, then to find a valid pino,
we should refer to the dentry from inode.

To resolve this issue, let's get parent inode using parent dentry
directly.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
Reviewed-by: Sunmin Jeong <s_min.jeong@samsung.com>
Signed-off-by: Yeongjin Gil <youngjin.gil@samsung.com>
---
 fs/f2fs/file.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index fba8b5f216f9..1eae123f0315 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2127,7 +2127,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	struct mnt_idmap *idmap = file_mnt_idmap(filp);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct inode *pinode;
 	loff_t isize;
 	int ret;
 
@@ -2178,15 +2177,10 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	/* Check if the inode already has a COW inode */
 	if (fi->cow_inode == NULL) {
 		/* Create a COW inode for atomic write */
-		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
-		if (IS_ERR(pinode)) {
-			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-			ret = PTR_ERR(pinode);
-			goto out;
-		}
+		struct dentry *dentry = file_dentry(filp);
+		struct inode *dir = d_inode(dentry->d_parent);
 
-		ret = f2fs_get_tmpfile(idmap, pinode, &fi->cow_inode);
-		iput(pinode);
+		ret = f2fs_get_tmpfile(idmap, dir, &fi->cow_inode);
 		if (ret) {
 			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 			goto out;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
