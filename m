Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F966DA0DC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 21:17:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkV6T-00025B-1z;
	Thu, 06 Apr 2023 19:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pkV6Q-00024v-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 19:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kGKRuEfXxBnhxjicdg29Vd0+Y75IprFSbwIwScu9Asw=; b=csWLpuRWCNB6O8djPbUdvyq1BJ
 vYNs7+FkklSUPWNv5ACqdPRUK+3bq3daCnRsMVq6aPAx6oFu7z2y2ZIY4sFgwi2IoS3OWQX9a6TVS
 mxvorQGCBa/TL+NKBYHo6idAiVkUhTjRPqSYspm0EXbUL9n/htl8eSuGRsVSwRSOA3ys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kGKRuEfXxBnhxjicdg29Vd0+Y75IprFSbwIwScu9Asw=; b=m
 GFmM6EJHP8WacwPQmM9HzLHRvMM4zWHIAgPh2LcSkd38+h6dCEVejkeFEDSmpFTLyRskv+TMsIYsi
 90+IqRCH4LB/W8y5RNeJu8UvH0evyoWSDpLc27RpmBCsqtCEUuxLyDmWPjd7+acJd7vreikpdcVsA
 revf70XsGgkFKaT4=;
Received: from mail-psaapc01on2093.outbound.protection.outlook.com
 ([40.107.255.93] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkV6I-0000mE-6y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 19:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwndeTdFLYL/wa3tazqHElQil+0C1rMZGH+qrlVTCfIsLzNqxdyBPR2E9oSNYa+3/7j499ogBd7Oq6Viy08t8DXIA72bfNK00c7D2jhbtpPPq6LKsBZU7eNk7N2opJFciNaF3qOr1BPg8OlruOmaPiLFnWARf7qTShXVUbTsHotPc5hN07aIXxVXQ87GhaABFMEXyfXpJbJy0BAxlAdQ1Loh/hHesXzAzfIZLWh1YTWm0wKV6ZcAbRaaRNGLLTtnw//J+3h9FnPlQNbhUF3Lz8c/svc4dFwRzzL6nF+uVOk7I63onCDuOs7F6pXpfH/P6NHHks2fa9el0R/J/00T+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGKRuEfXxBnhxjicdg29Vd0+Y75IprFSbwIwScu9Asw=;
 b=FdayeYJ261q1LljUF2NKeSs/RJ1frEHdR3WHFUtdWSqQbO4iEWnCVUp1s5wH1Qjoj3Z7Emffh0rjaIZ1SlQ6a4OUE7nPMIIdFBIAJXJzgQzi+wQKG1RYmUAJB661vU4pn9gceAbKg1m7LtyW+h86qBa6N0uxf0it5x6PWTeI9EYHi9CbaVYlFByFpkWfWRdew1xs5x3hhrkiI7tb7fzAJNetfaibbJYWBNZHy3CfFvCKRPNzlJ9rfdGoXYYn23lbPtgdBr0XzuiiOjKt8q1iKGBeoKvxh5k7omryfDoVbYSmHN+nq96Lfx1ccfbW1tGLnxnayYZgkKSlrJYyh4NRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGKRuEfXxBnhxjicdg29Vd0+Y75IprFSbwIwScu9Asw=;
 b=Lv97awEk/6+EnuKbZvlSpfrskOxtjsoEx6BKDQHd1holiA8OSTSoH+bE60M/lNiWGuO6/uT8CWBZFVTntkdAKTjG9O+LvpkiBi3lDZiz+byguiNATTDbuyXjDY3Xgove7w2dVZeawCJV6DbBNK1xcwS3TG5oA+6Y5KOEOXpi5LE9OcDP0/x9YkusnDu+ayfEQ8ehZlig5resLkDGRbTCAmNwZLdQZmBGgmE0iyDvdbUleNdUKkJQHy5Rl+NQYSlOTFGxPQjdsgk2JGzYPS6cyqItBMI5Ha5caqxItCi25jjZjd8dq+YCxRz0WNDXIZtFrUo39PrNS4q+eo46oQaN4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4354.apcprd06.prod.outlook.com (2603:1096:820:79::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Thu, 6 Apr
 2023 19:16:41 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.031; Thu, 6 Apr 2023
 19:16:41 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  7 Apr 2023 03:16:29 +0800
Message-Id: <20230406191629.63024-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR04CA0189.apcprd04.prod.outlook.com
 (2603:1096:4:14::27) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4354:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c93997-bbbb-456b-eab0-08db36d373ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICHg43sJ9+LcWjsFORKnhFEYvD70Qv5m+KRFqSf3+fpIu7Xlyf57TV7jXWXvYBf/MHPA6wOizbN8PG90/birM/IAip1dq/20yxJmJB3l3kEM19XXetZLqaswdSCq4QBxZ835bwsC4xU7ynBZ7T+LkYh0JYjC3kIZDZTdRpCu++QlsLp5s02t+jjHdpnbMcDH5NgehXwR8uWtopjQ5O20+GDzYid3ZHxDuukQ+qrOpawcWEOTGBoilfq5sNAvJSQSlzzLEFhpKE+Tlf7osPxJBJuNMvpFwvd13uw6b4k5BDdKxLRupvO7B9ICbjghi9tieKyXHae2DDPX0nrlOVuOE8VZxZvLCU4GHAymzdNg8rME/aJjP+7nebbip7wpTRfZouKPf5qSF55M1gowuN8tGioZvqXruRFPp+xBMNnZ2lWBnNci9CXhi3odHhRE5XhDcDWeKhuFd5QPPdEznNmtrLL333Lm00f8PRvti3z57BMauwZC8pgqompTU2mmm9p1lFpG0xFHugOtTBtfhOqu1PuHbxksZqI6nN6bX8p3AT/pYIt8TltG5yHZoxtnezfJNs72n37Pnr8b5LvjNRQB982i5uKYIs9fs/YZRZXYEgF+47/nZuUGEpKXFPdiRY+F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(36756003)(86362001)(110136005)(316002)(41300700001)(66946007)(66556008)(66476007)(8676002)(4326008)(52116002)(6486002)(478600001)(5660300002)(8936002)(2906002)(38350700002)(38100700002)(186003)(6666004)(6512007)(6506007)(1076003)(26005)(2616005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VDLJC+tX6LIC9F938yiaWq6mIh36mb5oRD/c5v4i/ddFa6TIFnFTtZ0qEBUh?=
 =?us-ascii?Q?5tnwNTL5PLvjQE+I6F+KExP1TpueJn5sMZQfZ+76fdXl/JLNsf9wRDls4E1c?=
 =?us-ascii?Q?CZCrgT8DycV8ZzHJpm7/A37Y32InEa2iVyxV3XRFIv+ealdLWrVmj2knQGhF?=
 =?us-ascii?Q?WsV9SasPc13MSEgldfahAJ9oO6cax8HxBFc5dJFoiKXJBeHXN0KMtgH4W0yP?=
 =?us-ascii?Q?LyZFfahMzLxqLW8l4d341SvUI8AwuKEsBjfNxlsnkz/Ezdf13TCSMj9Ggl7Z?=
 =?us-ascii?Q?Q8gMtzkCqTZNo8857UXl8aIu1GVChqiEqo2AyVnTm0X6FfA0B4VCu03m9Uji?=
 =?us-ascii?Q?8s07umkCORFibDtji6Tu5yNCbh+B10QDDdPuMejyZz5WtOc2CNroqKGY4Zeq?=
 =?us-ascii?Q?jXwchC9uroPWTV3kuvd2NmgFM4rxCfBQHBL3nnUWWL9tDnM91yU/egNHo/iG?=
 =?us-ascii?Q?/pbwVCOVMSdB9UU2JD8MD/aadbk9O2q9cX3fEs8cY9G8wjE/YxqB6DCf6fKi?=
 =?us-ascii?Q?Tg6aFpxI4RIj6iMr1im64srtEEENGeJ1Zt30VOjR/LXmFIwY/dg3sTVn6zAd?=
 =?us-ascii?Q?+PFneQA4DPVIPnaaD0AkHlFhev6FvO6qZsiYhgLB6AEYwPYdGwAM/TMIJKla?=
 =?us-ascii?Q?ZyvvCLYyzUDgCCtDVw7MuFaqeGHSJ9/R3Ch9NV7DblpF/Ra5+QhmxwXaRv26?=
 =?us-ascii?Q?nL+IZ2S/5s2SHx932m4UV0oCTieMSsAjMm7HaciUqM0WDIoVk5T/dqlRBfq6?=
 =?us-ascii?Q?oI/ZA9RwmDroifiOJBQg1wer0jDWiaSo5PKj1t9s9IPlCpRHWVBplzANnEUj?=
 =?us-ascii?Q?OtMN5cr8HN/Yqqaf33I4bQwsxXBIBOWPSmIcJqiqB1GX4po8czwGY++7oNd1?=
 =?us-ascii?Q?FPpL/h25TIupgtEf0By5lxqd476p9HycQUNCX4Ngp+EtZ4VEJX6MMwBCzaCh?=
 =?us-ascii?Q?U1gF8yeLpHg51Lk5lR7BSN2xJAdvU6Y3pG5JQWjGfTvEBes18VpeWCvUwfPS?=
 =?us-ascii?Q?hjVJdAiqCJOw/AU929RKjUgIFAZw7YlLNxDUgAasLK0O52RAO6F0V6Kh0Ogr?=
 =?us-ascii?Q?ZVCpIyXbK5jEehYqfzOt8qZQC5+gbiNZIgSpCwMSIDZgDiesXXb3cYMYu/BS?=
 =?us-ascii?Q?F0aqZSgq1A5lS1YH8WlECUZaSd9GCRmhVAGsxZuFc1EODHX9LkQ7nopHKamJ?=
 =?us-ascii?Q?x/3hJJsEo4MvaBNyEdBLMFIO+14lLHZm3Pl/f0m+1bqsIJ/n1CJHX15aQul+?=
 =?us-ascii?Q?swGqw5VJH4NwVcQNH9DXXAq5piVVy4mHbBf84/DkvoQulLzd5I3aBZ+X10aV?=
 =?us-ascii?Q?crFnOyJkRbzLf39gYpBog7CtmtC46fPGKcfp0R0QNtlQlpLtSiFH39EUS61I?=
 =?us-ascii?Q?n3knAUagOLAvSBnTO2kSjb0kL3koAOVIiAlJhUsbbkOeaDh0ykDvi+t55waq?=
 =?us-ascii?Q?ppFS+twY2c2ASVmIxp72PIZFpuatvM5mQ615mKpXV9rvsp8phrwwgO19mT+Z?=
 =?us-ascii?Q?1v/Zeou67rx2Urydt2uf3VBPZpl5wAsB5DPcniff5vzEniviQcHFUN7Y9NO1?=
 =?us-ascii?Q?9a01lPwm0rORdfa4Sfk+0fpmq9FY7aVGGIiI0YH6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c93997-bbbb-456b-eab0-08db36d373ab
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 19:16:41.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTWjOcyGrTGu3bbgvu7uA96dO+fiRYD8MlMTkCvo37OwH+vqFla/yjpvu5G3n957mI3LEZxfdd9d11Eq9xP6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4354
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert to use remove_proc_subtree() and kill kobject_del()
 directly. kobject_put() actually covers kobject removal automatically, which
 is single stage removal. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/sysfs.c | 15 ++ 1 file changed, 2 insertions(+), 13 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.93 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.93 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pkV6I-0000mE-6y
Subject: [f2fs-dev] [PATCH] f2fs: remove bulk remove_proc_entry() and
 unnecessary kobject_del()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use remove_proc_subtree() and kill kobject_del() directly.
kobject_put() actually covers kobject removal automatically, which is
single stage removal.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index dfbd17802549..3aad3500a701 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1461,25 +1461,14 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 
 void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 {
-	if (sbi->s_proc) {
-#ifdef CONFIG_F2FS_IOSTAT
-		remove_proc_entry("iostat_info", sbi->s_proc);
-#endif
-		remove_proc_entry("segment_info", sbi->s_proc);
-		remove_proc_entry("segment_bits", sbi->s_proc);
-		remove_proc_entry("victim_bits", sbi->s_proc);
-		remove_proc_entry("discard_plist_info", sbi->s_proc);
-		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
-	}
+	if (sbi->s_proc)
+		remove_proc_subtree(sbi->sb->s_id, f2fs_proc_root);
 
-	kobject_del(&sbi->s_stat_kobj);
 	kobject_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
-	kobject_del(&sbi->s_feature_list_kobj);
 	kobject_put(&sbi->s_feature_list_kobj);
 	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
 
-	kobject_del(&sbi->s_kobj);
 	kobject_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
