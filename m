Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8A264DB1F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 15 Dec 2022 13:20:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5nE7-0006n8-5c;
	Thu, 15 Dec 2022 12:20:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p5nE4-0006n1-N9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 12:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TYw13+swpZSgWT9NgSBmxA31KrXA+D366+FoqrGrXtU=; b=A9UB8ceZHC58DCUv0Ce1uMBZyE
 Pcc54uf71BX47R9TKeJ0/qHmJBOwvhMDLuCxloGRx+uGJQRpfM7MBF06zvho3nEFmpvvNHy9VJ33I
 ftnKinNxOSxdDaQh2fQi0JFsdlA5Pjw27X3jY6KTWiPLSx0cBVnbioC7+hYXnHbuL/BY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TYw13+swpZSgWT9NgSBmxA31KrXA+D366+FoqrGrXtU=; b=Z
 h2FGP7owGw49EJ6FZdI1wU9sPV3xc/a7etUwLeTcLoQXem8RFh2O7Wj+cCdARufRmBm3E8ZuY+Gi2
 n+4beheddtqkW2Irgj0DghSXM6zwISpY40pO0lQaekYW4NM+m7nB8ndJSYT9gp+gDa+GqWi7yH2l0
 1g3S2Dz+8Br0j+1A=;
Received: from mail-psaapc01on2118.outbound.protection.outlook.com
 ([40.107.255.118] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5nDx-000RfH-Oq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 15 Dec 2022 12:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRExOjYTxgwMz8kneNqshxgr/Idfh4x0hOydAduS3aRL2v4we4Z5uNe1QPkbEGioihn2OaTDlukPrpfJjS56pSnp5Z+l+4elrUUy5bliZTuS8UhSf9XN08U+ewXz6oUTUU9Cprui9f/9Tnt0WebqzrYm0KWhXS55/tdroXU+c5587/b5aElK49GlrkNEaN/YgyVmHY5oY7Vuit0Jv8iLfOKBP2/ZM+CjMO6u+72IyF6DhnlmHyaqPKfWHzKNuD9jFXtjZCN41itx9rCqgFB6odU+Zc6pr3Jfp83q/xrQR9lvHMCIkkXTsPEfD74IO1h7pXqcMPC70NjPOdpQKRQRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYw13+swpZSgWT9NgSBmxA31KrXA+D366+FoqrGrXtU=;
 b=bpbULkWCD5zTxwhjMzBhhP+HUwIRz/a9zt1vkVfR/zSpw7ZtN3oZSF7eWFrftORZ74sn0wGgVeYcYFSL/Ot8D5JPz4bei66uGtvqXPUw3orTKH0PgYcDirshY4XYQUIiNgjrxalxnB5+KgBFiPJBpEahD7XmBejXq924XmKMsUpaH38o0FA4lehB9uOiJNhfYjRjEutRyTxQypC3aHLkLeK+0YqawzdIegslOjWa2sUYKRnZxUIgpK46d0PkXuSb2rQmnkaelkNZ8b3LERpcbJMsWSYffYIBsYT7rcExn4aEvbhL010wejBCpf5nbNAkGTxYIIWOO7V1gmkQC9GTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYw13+swpZSgWT9NgSBmxA31KrXA+D366+FoqrGrXtU=;
 b=a6Nf1AO5VJkYsJBC/ITlLAgPSuc1iaWu4Ub28IlJPbFhUrpaWBa7Y045xxyjVCS9TnRrkElr//DBXXaXUxz+p3Lzi9jg/VrC8KtTrgzqFUTk+V0ZO+WsUrvzEtDL4Q91lezIcHRuw70AeqQxI3q4+5fAmqJXOZo2Zpc3SIQMcNhf/V//Wwmqy/A+p1HsGJvirnTfRIYNbtXH1DzzhZIFImnmtryZAusRkqmBToR/ATFBH5JpwgvwK6tjo6pdCs1icMqQFoi1CBV4pBfeGjnAsgjaaN0MwncKWLxXAAzX9VxW8cvkr6R1tdUSgLbfkJnn5Mmixp81L2j5/k0QfFmuUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5176.apcprd06.prod.outlook.com (2603:1096:101:73::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 12:20:21 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.011; Thu, 15 Dec 2022
 12:20:21 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 15 Dec 2022 20:20:12 +0800
Message-Id: <20221215122012.55832-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: c1977089-5720-4a36-b40e-08dade96bc68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvJfiZN8vUys6yQsBqvsCHPKQCL0FiL9OQSvLIdBLAmwmoyOOau8WdGDohhJ3MnBnZTqWl3O/1w1WpEbsepagw7KCNYw5BNGLC7cp+239Q0CzKWtV8tClp86b/IFSccjupyKFtdkdM7yco0cjjN2GbUYwb7m4fq8V7JOPG8eFhvN6dEbV27kmySKvEVnrM1m5eED+BNZvb5M9i0opRhSXDBLBmx7pWFbrEP5QjBnmp9wgqLmB22TL9XRxbw9bJQVKBeIwiNaMM7fgJOrMFtAL+q/qzXbS32OFlsmGirb+ValphY/5A2gGIvvLA99YafyQ6yykAfkAyVXmoCQ7IqMi5dEA84EhVKGxHKkzRXWKpusjGzNgYlb1VY+uIwELSHQ6gsvKnccqLIPiLAfRlWHURvpI10CI41rwdxNeO1+OMMtJDaXS9ZzLYwKdn2jTrH5Y3wFqLNd3sF94GMgYRfC6bySx7RFbYmEoaVL1IxcrxKlR+gZLLZxiM9U4BsJp2J6EBpljKqV+yx0dpCWzirJW0Ab/pJc6cbsvWXcPkf33Vta1KZKdbbFpAB7Xzmahj4M6KjSGjf91Qb9m6tBio5puY1NW/L3mFDf6twrJUbwpGZn7MgB9AL9K4GoFOabCG+pL91U7kXgC7kyLTq9g1DbyoPOYuo19aPBtLFlrTujVzOq6RrVbsMCN7EhSxdE5fp5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199015)(1076003)(6512007)(86362001)(186003)(36756003)(6486002)(38350700002)(83380400001)(2616005)(38100700002)(5660300002)(52116002)(6506007)(8936002)(26005)(478600001)(66946007)(66556008)(4326008)(107886003)(41300700001)(8676002)(30864003)(316002)(66476007)(2906002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/4tZVYxgivbGPgwP5PG2bFdz/B5/EVNttd1vd17CkeuWJf33YKoat1S3q9yL?=
 =?us-ascii?Q?9n+uo/gZ4UsB9sfdEkIBNUtWW68bPV2Y7chVLDfopgSn03V6lIAC/nZN2Z7P?=
 =?us-ascii?Q?ea0XKRnhZN/B3wcTFTiilS1uITU0+Z9fgjVmLnqH2FYYtHLw8hs2KDXJwXSu?=
 =?us-ascii?Q?QGO0iRGMUkHPTuwaRXkY9rv9J2fwhpwOsgUmqdij8qY99Zkv/jVzbKm931iQ?=
 =?us-ascii?Q?gDerSwaKn3TpLZXmpk+audXHzAnreh7SE21Eem2iHV1JMMVm7uo2UNWdjE4Z?=
 =?us-ascii?Q?imOyiVPaloHhXwtRaC/XITtnb5m1hGNntVTC/odgtoOXtCd2poeFARKEtmRp?=
 =?us-ascii?Q?ZBSUroKpk19GgS8EigPVLJ5qQAeJn7jMLR4jI3NyBtWV6GkUFMOlLZeuQ8x8?=
 =?us-ascii?Q?0SP7P4n+HhcZaPYJeRnbCIlbG1A32hGRT7trV/fhCUWC4q7kxE80bY0pfY3R?=
 =?us-ascii?Q?bocZcrBj4p9CJQIvG4qy715iAE7x/zTgZPXIwryucBWMXHT9nXcm4OciuhF2?=
 =?us-ascii?Q?wM5tby7h7LQSbqgDtJqGjNZXhuHt6U0sdodsKuCGDwAuRe2ZvzTmmyugEhsl?=
 =?us-ascii?Q?DoI+YXhnVNO260/46J5ouaDZ+H9d6CTDH8ksV4V/aInxJ3H4JNfYb0n4I1YC?=
 =?us-ascii?Q?921jtLBQthUpBCH78Xam+7S6yhDG465PeiXm4LhkjrafB8qnw238TPEY/RpF?=
 =?us-ascii?Q?WH66r6r91QY5oEtJtorcaheA2tFNmKWvigCatNgmnt3bIy34JupGQvY5oc3R?=
 =?us-ascii?Q?5eq/1lVWfBRHSHaP2Gi+Wwbg3gPlsUGzHrUBWiwopM0UOau3Bw3lun7X0dPh?=
 =?us-ascii?Q?oVFNRSJR/tKLKYdNM8JM4UTLC65QuFrpgeKIlVsElcRe1Xn8AT/TZXuI74GI?=
 =?us-ascii?Q?mZJRvwdDt2OP9HRLyQ4juaDMkbBKHCC/Eivx1SlzodU6YpZ2yXvBSobXlPy/?=
 =?us-ascii?Q?28PYeOc8aNcog120lEpihxnMSFNkYOU4ywrT4RFvV9kkWxwX7AE2l8MDyBmL?=
 =?us-ascii?Q?vOA0GSuKTtfAtIk6q5uiOzEjlOATldaP370OXuAxKww4MolW86lOYcWlFkut?=
 =?us-ascii?Q?GDZqB5Phpv0Sp09R86pA0jPw8tRlobxtzHde6ihoi56oQMGEvOSdBgBkBi0k?=
 =?us-ascii?Q?OAp5rj4QzpQQUpxaHLMOGSArQNm6zxiECy8VBP3Jc0Z8YzjWAsb5J5a0+ge9?=
 =?us-ascii?Q?opi49xH6fu1rkPRBL8yut0sD8D8KyCQxBN3HqB2IZpOOVNb3fQ3j4BnuUVEv?=
 =?us-ascii?Q?hXMP1tVAndCqpwvOkAtwapYYEWEtAlswltaA1yqloUwtGW9dWQv/SfY3mSv9?=
 =?us-ascii?Q?YXTE/iAAGS4Syf7GeA9c7xykRzYmN1ZZ1PrVH8o44ghjbbar32FE9OtMpVrP?=
 =?us-ascii?Q?RV6vRHrD1Uapl2Jh2dHXg1zryACmXIUK3uZGOWPvyXMkgDjG84ipWExIrnFV?=
 =?us-ascii?Q?MY65jg9B3QAUpUpgzzTG7UuvfWrMpFAPKluh/Ubx32aLiG2ktSlIyG1JM2WV?=
 =?us-ascii?Q?tAOAMPZNv6FhAcDNgHwRziTWMnifwgPydomqEf8/0qNbB/RSn3DcJFNZHWnq?=
 =?us-ascii?Q?qF7/5mexxA1M8T7Z5cBbR3PYHg88ouvM4I9tfkZi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1977089-5720-4a36-b40e-08dade96bc68
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 12:20:21.6610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9gky6GgsyvTZU88HC62Auy00ECjOYRZnA/YFCbavFvuDIEWJPtXSkE0UR9HMp8JcnJa6Pr0CO5IMPypDHbIbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5176
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is no need to additionally use
 f2fs_show_injection_info()
 to output information. Concatenate time_to_inject() and __time_to_inject()
 via a macro. In the new __time_to_inject() function, pass in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.118 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.118 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p5nDx-000RfH-Oq
Subject: [f2fs-dev] [PATCH] f2fs: merge f2fs_show_injection_info() into
 time_to_inject()
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

There is no need to additionally use f2fs_show_injection_info()
to output information. Concatenate time_to_inject() and
__time_to_inject() via a macro. In the new __time_to_inject() function,
pass in the caller function name.

In this way, we no longer need the f2fs_show_injection_info() function,
and let's remove it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/checkpoint.c |  5 +----
 fs/f2fs/data.c       |  8 ++------
 fs/f2fs/dir.c        |  4 +---
 fs/f2fs/f2fs.h       | 43 +++++++++++++------------------------------
 fs/f2fs/file.c       |  4 +---
 fs/f2fs/gc.c         |  4 +---
 fs/f2fs/inode.c      |  4 +---
 fs/f2fs/node.c       |  4 +---
 fs/f2fs/segment.c    |  5 +----
 fs/f2fs/super.c      |  8 ++------
 10 files changed, 24 insertions(+), 65 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 56f7d0d6a8b2..d68b3c991888 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -171,10 +171,8 @@ static bool __is_bitmap_valid(struct f2fs_sb_info *sbi, block_t blkaddr,
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (time_to_inject(sbi, FAULT_BLKADDR)) {
-		f2fs_show_injection_info(sbi, FAULT_BLKADDR);
+	if (time_to_inject(sbi, FAULT_BLKADDR))
 		return false;
-	}
 
 	switch (type) {
 	case META_NAT:
@@ -622,7 +620,6 @@ int f2fs_acquire_orphan_inode(struct f2fs_sb_info *sbi)
 
 	if (time_to_inject(sbi, FAULT_ORPHAN)) {
 		spin_unlock(&im->ino_lock);
-		f2fs_show_injection_info(sbi, FAULT_ORPHAN);
 		return -ENOSPC;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c77442a42f89..873908ed20f7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -295,10 +295,8 @@ static void f2fs_read_end_io(struct bio *bio)
 	iostat_update_and_unbind_ctx(bio, 0);
 	ctx = bio->bi_private;
 
-	if (time_to_inject(sbi, FAULT_READ_IO)) {
-		f2fs_show_injection_info(sbi, FAULT_READ_IO);
+	if (time_to_inject(sbi, FAULT_READ_IO))
 		bio->bi_status = BLK_STS_IOERR;
-	}
 
 	if (bio->bi_status) {
 		f2fs_finish_read_bio(bio, intask);
@@ -335,10 +333,8 @@ static void f2fs_write_end_io(struct bio *bio)
 	iostat_update_and_unbind_ctx(bio, 1);
 	sbi = bio->bi_private;
 
-	if (time_to_inject(sbi, FAULT_WRITE_IO)) {
-		f2fs_show_injection_info(sbi, FAULT_WRITE_IO);
+	if (time_to_inject(sbi, FAULT_WRITE_IO))
 		bio->bi_status = BLK_STS_IOERR;
-	}
 
 	bio_for_each_segment_all(bvec, bio, iter_all) {
 		struct page *page = bvec->bv_page;
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 8e025157f35c..9ccdbe120425 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -732,10 +732,8 @@ int f2fs_add_regular_entry(struct inode *dir, const struct f2fs_filename *fname,
 	}
 
 start:
-	if (time_to_inject(F2FS_I_SB(dir), FAULT_DIR_DEPTH)) {
-		f2fs_show_injection_info(F2FS_I_SB(dir), FAULT_DIR_DEPTH);
+	if (time_to_inject(F2FS_I_SB(dir), FAULT_DIR_DEPTH))
 		return -ENOSPC;
-	}
 
 	if (unlikely(current_depth == MAX_DIR_HASH_DEPTH))
 		return -ENOSPC;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4035dab1f570..d01817b11f61 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1875,12 +1875,9 @@ struct f2fs_sb_info {
 };
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-#define f2fs_show_injection_info(sbi, type)					\
-	printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",	\
-		KERN_INFO, sbi->sb->s_id,				\
-		f2fs_fault_name[type],					\
-		__func__, __builtin_return_address(0))
-static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
+#define time_to_inject(sbi, type) __time_to_inject(sbi, type, __func__)
+static inline bool __time_to_inject(struct f2fs_sb_info *sbi, int type,
+								    const char *func_name)
 {
 	struct f2fs_fault_info *ffi = &F2FS_OPTION(sbi).fault_info;
 
@@ -1893,12 +1890,14 @@ static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
 	atomic_inc(&ffi->inject_ops);
 	if (atomic_read(&ffi->inject_ops) >= ffi->inject_rate) {
 		atomic_set(&ffi->inject_ops, 0);
+		printk_ratelimited("%sF2FS-fs (%s) : inject %s in %s of %pS\n",
+			KERN_INFO, sbi->sb->s_id, f2fs_fault_name[type],
+			func_name, __builtin_return_address(0));
 		return true;
 	}
 	return false;
 }
 #else
-#define f2fs_show_injection_info(sbi, type) do { } while (0)
 static inline bool time_to_inject(struct f2fs_sb_info *sbi, int type)
 {
 	return false;
@@ -2231,10 +2230,8 @@ static inline void f2fs_lock_op(struct f2fs_sb_info *sbi)
 
 static inline int f2fs_trylock_op(struct f2fs_sb_info *sbi)
 {
-	if (time_to_inject(sbi, FAULT_LOCK_OP)) {
-		f2fs_show_injection_info(sbi, FAULT_LOCK_OP);
+	if (time_to_inject(sbi, FAULT_LOCK_OP))
 		return 0;
-	}
 	return f2fs_down_read_trylock(&sbi->cp_rwsem);
 }
 
@@ -2322,7 +2319,6 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 		return ret;
 
 	if (time_to_inject(sbi, FAULT_BLOCK)) {
-		f2fs_show_injection_info(sbi, FAULT_BLOCK);
 		release = *count;
 		goto release_quota;
 	}
@@ -2602,10 +2598,8 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 			return err;
 	}
 
-	if (time_to_inject(sbi, FAULT_BLOCK)) {
-		f2fs_show_injection_info(sbi, FAULT_BLOCK);
+	if (time_to_inject(sbi, FAULT_BLOCK))
 		goto enospc;
-	}
 
 	spin_lock(&sbi->stat_lock);
 
@@ -2729,11 +2723,8 @@ static inline struct page *f2fs_grab_cache_page(struct address_space *mapping,
 		if (page)
 			return page;
 
-		if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_ALLOC)) {
-			f2fs_show_injection_info(F2FS_M_SB(mapping),
-							FAULT_PAGE_ALLOC);
+		if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_ALLOC))
 			return NULL;
-		}
 	}
 
 	if (!for_write)
@@ -2750,10 +2741,8 @@ static inline struct page *f2fs_pagecache_get_page(
 				struct address_space *mapping, pgoff_t index,
 				int fgp_flags, gfp_t gfp_mask)
 {
-	if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_GET)) {
-		f2fs_show_injection_info(F2FS_M_SB(mapping), FAULT_PAGE_GET);
+	if (time_to_inject(F2FS_M_SB(mapping), FAULT_PAGE_GET))
 		return NULL;
-	}
 
 	return pagecache_get_page(mapping, index, fgp_flags, gfp_mask);
 }
@@ -2803,10 +2792,8 @@ static inline void *f2fs_kmem_cache_alloc(struct kmem_cache *cachep,
 	if (nofail)
 		return f2fs_kmem_cache_alloc_nofail(cachep, flags);
 
-	if (time_to_inject(sbi, FAULT_SLAB_ALLOC)) {
-		f2fs_show_injection_info(sbi, FAULT_SLAB_ALLOC);
+	if (time_to_inject(sbi, FAULT_SLAB_ALLOC))
 		return NULL;
-	}
 
 	return kmem_cache_alloc(cachep, flags);
 }
@@ -3380,10 +3367,8 @@ static inline bool is_dot_dotdot(const u8 *name, size_t len)
 static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
-	if (time_to_inject(sbi, FAULT_KMALLOC)) {
-		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
+	if (time_to_inject(sbi, FAULT_KMALLOC))
 		return NULL;
-	}
 
 	return kmalloc(size, flags);
 }
@@ -3397,10 +3382,8 @@ static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
 static inline void *f2fs_kvmalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
-	if (time_to_inject(sbi, FAULT_KVMALLOC)) {
-		f2fs_show_injection_info(sbi, FAULT_KVMALLOC);
+	if (time_to_inject(sbi, FAULT_KVMALLOC))
 		return NULL;
-	}
 
 	return kvmalloc(size, flags);
 }
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cad4bdd6f097..ef25b5b14b10 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -782,10 +782,8 @@ int f2fs_truncate(struct inode *inode)
 
 	trace_f2fs_truncate(inode);
 
-	if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE)) {
-		f2fs_show_injection_info(F2FS_I_SB(inode), FAULT_TRUNCATE);
+	if (time_to_inject(F2FS_I_SB(inode), FAULT_TRUNCATE))
 		return -EIO;
-	}
 
 	err = f2fs_dquot_initialize(inode);
 	if (err)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 83e68ec7763d..2b9891efcfee 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -72,11 +72,9 @@ static int gc_thread_func(void *data)
 			continue;
 		}
 
-		if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
-			f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
+		if (time_to_inject(sbi, FAULT_CHECKPOINT))
 			f2fs_stop_checkpoint(sbi, false,
 					STOP_CP_REASON_FAULT_INJECT);
-		}
 
 		if (!sb_start_write_trylock(sbi->sb)) {
 			stat_other_skip_bggc_count(sbi);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ff6cf66ed46b..01b9e6f85f6b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -809,10 +809,8 @@ void f2fs_evict_inode(struct inode *inode)
 	if (F2FS_HAS_BLOCKS(inode))
 		err = f2fs_truncate(inode);
 
-	if (time_to_inject(sbi, FAULT_EVICT_INODE)) {
-		f2fs_show_injection_info(sbi, FAULT_EVICT_INODE);
+	if (time_to_inject(sbi, FAULT_EVICT_INODE))
 		err = -EIO;
-	}
 
 	if (!err) {
 		f2fs_lock_op(sbi);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index dde4c0458704..8e87be0fa85e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2544,10 +2544,8 @@ bool f2fs_alloc_nid(struct f2fs_sb_info *sbi, nid_t *nid)
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	struct free_nid *i = NULL;
 retry:
-	if (time_to_inject(sbi, FAULT_ALLOC_NID)) {
-		f2fs_show_injection_info(sbi, FAULT_ALLOC_NID);
+	if (time_to_inject(sbi, FAULT_ALLOC_NID))
 		return false;
-	}
 
 	spin_lock(&nm_i->nid_list_lock);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 25ddea478fc1..573955d9aed7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -384,10 +384,8 @@ int f2fs_commit_atomic_write(struct inode *inode)
  */
 void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 {
-	if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
-		f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
+	if (time_to_inject(sbi, FAULT_CHECKPOINT))
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
-	}
 
 	/* balance_fs_bg is able to be pending */
 	if (need && excess_cached_nats(sbi))
@@ -1142,7 +1140,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		dc->len += len;
 
 		if (time_to_inject(sbi, FAULT_DISCARD)) {
-			f2fs_show_injection_info(sbi, FAULT_DISCARD);
 			err = -EIO;
 		} else {
 			err = __blkdev_issue_discard(bdev,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1f812b9ce985..73e779d3b2e7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1372,10 +1372,8 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 {
 	struct f2fs_inode_info *fi;
 
-	if (time_to_inject(F2FS_SB(sb), FAULT_SLAB_ALLOC)) {
-		f2fs_show_injection_info(F2FS_SB(sb), FAULT_SLAB_ALLOC);
+	if (time_to_inject(F2FS_SB(sb), FAULT_SLAB_ALLOC))
 		return NULL;
-	}
 
 	fi = alloc_inode_sb(sb, f2fs_inode_cachep, GFP_F2FS_ZERO);
 	if (!fi)
@@ -2595,10 +2593,8 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 
 int f2fs_dquot_initialize(struct inode *inode)
 {
-	if (time_to_inject(F2FS_I_SB(inode), FAULT_DQUOT_INIT)) {
-		f2fs_show_injection_info(F2FS_I_SB(inode), FAULT_DQUOT_INIT);
+	if (time_to_inject(F2FS_I_SB(inode), FAULT_DQUOT_INIT))
 		return -ESRCH;
-	}
 
 	return dquot_initialize(inode);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
