Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6F26FC34E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 May 2023 11:57:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pwK69-0003V5-H0;
	Tue, 09 May 2023 09:57:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pwK67-0003Uu-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sii75NAAI9OpzP6lLy9C36XQIKc2FSlkNLV2KdQ2sOA=; b=hGnr+ecn9+WdQx0f2Bm50cKrnx
 oPFrXWbH/aoCnRVBVrOmAZKbaBAvnmDF2YhyKbPwRM92t267+ma+sQeNN78rct3RO3k6BLmmGmWaI
 VpF3v11k5aY0MmyTx3t3rPyAXxrQbsYJwyJ71nWL7BDmJf1hbTDkaNYzDW99YAn7igNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sii75NAAI9OpzP6lLy9C36XQIKc2FSlkNLV2KdQ2sOA=; b=e8aNUHNFljfevTRDzIUOud9eqc
 +lm5bfAo9QfIQs/JeCaXhra2HRAXdEm622QjMZtuMMI0uCnSNO+AweRjuy9+tLmmyg4qvyt+Tzsr3
 dX+UplslwJgMPhI9fGCkyvXrVmAMMBBPD7Mzx0MknuRp2WJVOFCzO9hfSDtGYUhJI2FQ=;
Received: from mail-sgaapc01on2107.outbound.protection.outlook.com
 ([40.107.215.107] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pwK67-0002HH-Dg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwQJXStuk+jtuo7JPCkMUO07P0BpLUNU0J83KtTj6M0SBoJRiIgbaKY5YXrCKB3noOITpSnHo9Byyt6alhHaUgBV20nhocokxd5tO3mpge3NdRtvAg6lh8TSthit3+zphwekwuLossJz8z0lRdTC7xM9ewgtK0tEnsoa4NT4SnJrU0R5B9qd0kXSjXX0EgLmElxIevvbJ4JPvPogM0tV8JGfY86wYCeqt9ixaj/AuSsaVy2BnIIrRHErMAnVwdyFGT3fldSOhBznj4AAJV7kJZEawgXidcIrftNKsJruLhAPjlDkChxXS25R0NRluzxTaTPS5RIL7hisBNFmE7YUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sii75NAAI9OpzP6lLy9C36XQIKc2FSlkNLV2KdQ2sOA=;
 b=Gp60yItnHS2wu8717wqtmGa5CW24cFBJglGjahSzkWclBYSTbg61q1asaVK4VR9Q3YcW9irm9cbqqIZTaK4z2vPjzBQTRNTlS0Xw8jstzumKV1V7F7NTF2vjJQVF/XaiDon1xFHtw78GCRAS4BfbzkCDuC1Cm6u0PPAQBa80nAAnysiMvG/IIu2m/0b6HcvUoMbcrhXiFpDxl4bq+sab3DtQhx+wDRsblklbhuqrhLUHSddGH6SWfrwqb3EGSBU2wl7z7GqABrXgd/FPCflz5W88uKGRK3zj+XRMG6wWI5j5S5GAkOJcE6jscaMLGmk5QUKcffgsNy7cFMr6Ak3K5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sii75NAAI9OpzP6lLy9C36XQIKc2FSlkNLV2KdQ2sOA=;
 b=EFypjI2EYmlMGbchgY0Tu24UfwDswmGXOMYEVXMzXrsx0zD7Cb40JUXtyEmiPSqK+Z4rUHxNmQ+tKJTxwLQzimoaE7JwwhAslL106cr3tG/Ngaccaw6gi6BSVhToG5SQ7l59k6yieSkg9haRF/l2PfX0GFK0CiqaIp/S7e8d9l7XmvJJbi3Q3gL1qyv4beLcamXsKQShodSRetbAlvIvCMC1UQZlxg+4QX1uz8+Xovl0D/enDB+7A9nrr/noaP+41/EQydNmOHw4cD+A0VuYIbSd5o9b6Gru9ynBnalCSpdmZnGB+FdcvEhcMxMEriYhDtiXzzOe54qLTzarhVTnaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6130.apcprd06.prod.outlook.com (2603:1096:101:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:57:22 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:57:22 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  9 May 2023 17:57:05 +0800
Message-Id: <20230509095706.17844-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230509095706.17844-1-frank.li@vivo.com>
References: <20230509095706.17844-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 14fc43ed-cf77-44ac-fac8-08db5073c8a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnQG86mKug7SC7Cu6NbQg9c2p/zrO56T3B7uDBSfAxAjtTWdyp70LycKLsY3Ju34/jP1DY3r3nmfyYS67h6pUGwL9cPP3egI3jDPBjZSHaJjPR314zNnElhwEImoNRRXSDs1hOxSjeK7nrG+eZflPi1QJ8rYqB6HcSWUHgKIUy0FPgHJ2Aju/8EnAJXVXVpNYdvG2AS6pgvVqF6QQVKvYkte5EB+DwJ9iX5lAISHLuee1YWASweFi1FIOk48/zBkWL3XjgUYzlnuIe2pBR4UdkmrCnGU7U8mAVD2/JTckhuLDwZeQeQdXKFF51ZfIkPgxMIeP57nqixGB4VPcvYGW2DF9YJsyrOx+xvnn/ScW34nnbffxaWJzVLL0dvm+WlkdpHVzg0z4c+Ud5rzCutE5sKMRla5WwbVguZjsJF0FXuVjagunsw0Rwh/v/hoXCAztW8T8si4ioI2vmeA63y7If6bmSDa6HqTL0gDUM959/kuebjBCXOH7+OtaNoPCiFp6FtQD8rExsDMGwf7ZcVHHbyVlpV8PPz8hCoPWUe1BzUR69v8SyXpanM5lPLKCKwL5ioAjxW/Nzi2eMClsCTeUCZOlRJTmsDyc3/YiNfNR5Uzj7g9C2G7qe9mrepyO1d/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(6486002)(83380400001)(316002)(66946007)(66476007)(66556008)(4326008)(478600001)(6666004)(52116002)(2616005)(6506007)(6512007)(1076003)(26005)(107886003)(186003)(2906002)(86362001)(4744005)(36756003)(41300700001)(5660300002)(8676002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f1rGVgq6gkOdQ0zi8zvvUZf7uXzt6gYkMi0SDej75U0tIugx0upy0jHfakeQ?=
 =?us-ascii?Q?dXG8Begza5miyxCepDb++OiVr0g4/7J+q2gR5Obpymzcpv+qwUu41hmKZ9jI?=
 =?us-ascii?Q?hF8CVn5D8jVaVgpJe0DQNMWRTgQZQGHxW+sJA7MHQM5JIlbhTOzmGsx1w/G5?=
 =?us-ascii?Q?JzF0pBOJq7x1utjKxbVKeQdG9uAMHZkZVjLLCKFZax54SKDKTVtxhmf/akFg?=
 =?us-ascii?Q?H82wexPzFB+yzrgQ2u/o9lO5wwrnAtn8WmbayDGOPBw5QjVJbty8PYCFrTa0?=
 =?us-ascii?Q?csmlVUFGbOw3MSG6jIjQRE4NaZxGShxNPXUepERVF4I/bpHiG6WZLEF9rwRw?=
 =?us-ascii?Q?SJwizhctv3cHjK9iAC52W5CtOpJumGu7CNkYT4dGwI1Rf94gHvKelg9lHzFd?=
 =?us-ascii?Q?/+w4Ipx51eO02hIqFEiaKSSlecVhSW7BIam8jzJhaWmhc2SK68TikqlFM4to?=
 =?us-ascii?Q?E/+zioQHW6x7gFzNiPm0YxQq4lyQSdM9/HspXrk1Utb22Hz6H3rhq8cR6BTL?=
 =?us-ascii?Q?Ij2aNRY7ReLIXzlq9X6C9Tw3DJ6bR1zZtATo/N1Gsr30zaGKqjq3ANDU2MqS?=
 =?us-ascii?Q?CnBjcitEWzyhjd0+Np8DfVE5fLvJlwshTQX48+IKK6TD2aWxwA+UjuPOczdW?=
 =?us-ascii?Q?mu5Zx2pCrbNsFZQyi3eZyagVtTgYf/VCuvhFAoSZZr4fZDvm7SUgQgNRutJx?=
 =?us-ascii?Q?aUTJ3I0NtN6cGmN4ZwohNpNiD8CoJsOsRHNOWStVG5yK3gW+qRMrjPU63Au4?=
 =?us-ascii?Q?pHQJim6SPejpP5DyNI81rzq6H7om4v1F6a/LB57wGtXaoBsqZ0/RK729JQGh?=
 =?us-ascii?Q?eHyyeMYZbwsbOl8Du6nMp1pgjvmeF11RO/998uXiKUtJBpfez8YJRCjRz0iM?=
 =?us-ascii?Q?UAMN/op4rPQkbDWRGU3873nBq+2QZWO8zROUr1Zroh9nbCAMiD4n/P5mB4+N?=
 =?us-ascii?Q?bkW3IbynJl40UDC3z2aPxuZImhwdqdD+ou8ASu6vAH9I237YQmEJk1QWvrau?=
 =?us-ascii?Q?Rdjf5cOxqkwIMZccU0IVjStAJBHBsypGDjSrsdfmkf7wnoXJmr3qirqHv2Zm?=
 =?us-ascii?Q?d1FAFIoKh11iCICBCnWOoXodU5x+gL2gByfFopyHsN9NAn4pfPGjff47i8mp?=
 =?us-ascii?Q?seJaudGWGNTH9DdlVOd4q5EvNdYOLyiXUxLhsJzpgZ71cdzEqP6/SbXpBoYe?=
 =?us-ascii?Q?bqLvJy5QIb+ZvvELkCgjglCWzufHpGZjusWAJls7AFj5EHlVt5zFX1qaakaI?=
 =?us-ascii?Q?4qKnS1mGhb+aTEwL5/mi+2aTNlYOZ5+PM2TOZMMerPTsHysoKlAOmSODlHD9?=
 =?us-ascii?Q?i84CcvlZIOKUT8oxCSJAdFQBGbl3LQ5BXZ+hR6wwEKtt9Y2CNJPMRgfL4XfM?=
 =?us-ascii?Q?HbE19GNHoFwkFoti91/B/IvAN+9mhp0aq75pureb/WZuDCyJlVr2UwO0qkuh?=
 =?us-ascii?Q?Ki13ptCPAea2PESEfa5y+V/m/TnNhQgqd9ZMISMX2fF9w324NPjOmjHrx2HG?=
 =?us-ascii?Q?JQloQsiW7XfyV+Fndc9cSdtQ7SgbLQxLPvejdPpi4jlSRl1Oln9gmoFVOMhl?=
 =?us-ascii?Q?7RjA/J+1rFe9uKMnAiD9pUDPakMUlTCub4zIGPCJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14fc43ed-cf77-44ac-fac8-08db5073c8a6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 09:57:22.2818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oun4Z8NKXNFUomNrHGbkA4vzV4piuMHbKTNq/mMvDiFN/jqPMCNONR3ZjOJQFo5kw36FsnL1EVftAgXT6lpOeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6130
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For judging the inode flag state,
 the inode lock must be held.
 Fixes: ef8d563f184e ("f2fs: introduce F2FS_IOC_RELEASE_COMPRESS_BLOCKS")
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.107 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.107 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pwK67-0002HH-Dg
Subject: [f2fs-dev] [PATCH 3/4] f2fs: move the conditional statement to hold
 the inode lock in f2fs_release_compress_blocks()
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For judging the inode flag state, the inode lock must be held.

Fixes: ef8d563f184e ("f2fs: introduce F2FS_IOC_RELEASE_COMPRESS_BLOCKS")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a6180d4d94cb..32dc9a250a36 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3469,9 +3469,6 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
-	if (!f2fs_compressed_file(inode))
-		return -EINVAL;
-
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
@@ -3483,6 +3480,11 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
+	if (!f2fs_compressed_file(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	writecount = atomic_read(&inode->i_writecount);
 	if ((filp->f_mode & FMODE_WRITE && writecount != 1) ||
 			(!(filp->f_mode & FMODE_WRITE) && writecount)) {
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
