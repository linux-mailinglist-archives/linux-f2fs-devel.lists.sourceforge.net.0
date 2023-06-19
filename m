Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81577735AE9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 17:14:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBGaM-00029x-Bk;
	Mon, 19 Jun 2023 15:14:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qBGaD-00029m-BJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 15:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ws3001Ha4KWJrKW9/L5KAtU5rvP3PzpR5tIGoWO/So8=; b=Kie7HiIE33G2m1mrxy57a5mP89
 ah/n+dlMi0fmbqSihIqXAglulrq3HtlDrDKb0oDDjIgkYzcoK/cwOzzJwJS1o0eqZoFycx6FBolTP
 yUZ8aIVej+VOGSW9J07JfF12MEOLfEzVsrwOfn9FFGqcW/xGdnehv6YuS30a9CoQ/iuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ws3001Ha4KWJrKW9/L5KAtU5rvP3PzpR5tIGoWO/So8=; b=V
 xRYP/N4N8Un6Iipf2HltWyl1XmUB8IAeQqWWx5rXNQ1dIduShB4/j/y86TAyZI4BCQbRuyRRdEQgc
 YRFScmHK6PGDTkZ+bzwfH09nlyU6Dbrckh/O1yILfvxauhsfADvSYHT6pCoAHfAhbQIe2gOdUQ/df
 sp/TkNPCZt6FGntw=;
Received: from mail-psaapc01on2052.outbound.protection.outlook.com
 ([40.107.255.52] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBGaB-008lhJ-EK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 15:14:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ1pR/nhzAy2/lYbnyH+yQUAX2yeOS9oHqruf1EVtCKZOzSbp6B7OM7Qvz9SX03Qe6gQhfOc/H4al4aZkaJ3LfqM2NKmOw+qT/gu4p36Ab3D62b5j+CvGeyiVNz9g5Q+a8oXFSK8zIHLv7EO+wEH4QOSL+XeZ82Bss5iU57rZBR4KIN8tGwnoIpHr4bHlzbtMZl9Bd90ZDXfZZEQoqKV+bsGcnPq728Vdddn1iYVTLPeCLpmnmQ97AdmZO/5YdDcl4NsGM31BFhUNyoIxJiM7SRMrVXv/M5akMaT0xSN6b10HiiL/du51zjAHlJhd7j5oAemEVBf93Tdrj54Ks6xew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ws3001Ha4KWJrKW9/L5KAtU5rvP3PzpR5tIGoWO/So8=;
 b=UnMNN4NgZGrFAsAiXBZrUwtNWZ1inXwLJmxZ5c/m2n2BKIYRyufw1awjWZeexyDYfmEJ0fiCLDS8DI9gBUF8i7xpo8iYGytAYLmyFw86bIP+hAx+2tirABrm4OrC8FUcsY6fhy8zy4prg2c9hKJ2ZUaRjcmDADnurvbZCmsJM4ItFxBGwCHvCFRpLHLSiV3KprWWZmIx9FoPHbbiAhy/I1ItO9xZ0Ln31/jp0CSyyOw59bRKBJuwzwTZkAMjf7GAI86PY20zwNa9Tvq4Mi65ibBi6jayw7DsP+IZF3l74syLaC5sR7TVy+qrU1cNfjOwAA4mnMXTIMPunSu+ZHmBIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws3001Ha4KWJrKW9/L5KAtU5rvP3PzpR5tIGoWO/So8=;
 b=GDnUqpn3wwK+lXC/jIs+yTM8Lu8A9Hh+cyp/s5mqVxHuS6lFyH+XprtauRElDSZixT8L8+3Q8J1s/6b5sUNEo+FU5j/kpvOfYxQrCdgGkMs/90PtIhgn2ueqm/b2U2PAce5EQDFUbzn6RIB5rG9Wb1ibQzk4abJBmp3K77kHXBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by PUZPR02MB6211.apcprd02.prod.outlook.com (2603:1096:301:f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.19; Mon, 19 Jun
 2023 15:14:08 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Mon, 19 Jun 2023
 15:14:08 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 19 Jun 2023 23:13:53 +0800
Message-Id: <20230619151353.2168306-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|PUZPR02MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2d0eea-f05d-43b5-4f82-08db70d7d413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HN38jcoy1nnAFZdvNVSrGq+WTwzx3sBm2FHnCSAaSuWz9I8DXHmAuuK6CrVUUDNpjikzXnG1WiYQWsfjlPOsGhP7OaOq0cY9ep6TdWWZc2MnFYtPTRsvpwaScE4kjLU2x/gOu52tyZgiD1h+sSPtxr0q++7B6t2QtguJriE5T+73E/qo1emh67Pjc/WxKs75U0BSpoahgJ1ZfQZX9+XWc54QQPxeS8A535ll8BmorPQ6QPTTuMy5hrVo3g8J9tpkd/AQ9lI5lQMEYZfXkM6RqXHR45Et4Etmz+i6O/XGnuRR/4JQhdfl9BBH9khPvAyeMNUVcIMz3Lg476U8Zpmv27lELKlO1zCI5Mokk0eyNabDmDFCBIfJ1S13PR1TWEXDzVnDpLRER26eDG+lOwcu3fMy40kG5+SMvfaSfn46d7Kc4DOsyaSaUf5b3NIBArHIrrXw7kHwcvODZa1xANywkn8BjXMOX2TjddHfu3FpypaNwHURoSAiNmKFOrwzQp55YwvAYTZt4tYj90Y3bok/PBq4xZxnZ+yqm4oG7nrvApQZwEQClkJ60JTiSL4KO0Ly4EJU7rBRQQe5IoonVfiDUhQSMkAdLtAoN4ZVPmW8D+9SsQQZCSN0PxNo9rYMylhg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(107886003)(2616005)(86362001)(4744005)(2906002)(83380400001)(5660300002)(66476007)(8936002)(186003)(66946007)(8676002)(66556008)(36756003)(26005)(478600001)(38100700002)(41300700001)(4326008)(6512007)(1076003)(6506007)(52116002)(6486002)(38350700002)(6666004)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SAmtBAhMmFkl8jricR2dhFpIo+yXgL1tRxkSn9rNZFXyJqvhATxlV+VzYubf?=
 =?us-ascii?Q?335vrUWXg4lgr4IhPBPDNbqBUQm54S7utWy2lkzwaYseuY3S5ugnYfkyGxwM?=
 =?us-ascii?Q?6il3fUFBjsiQ4zqUWzQ61nAPit4LeCXMO7n/yczrrk30CGDbDPkTWFFJlYBm?=
 =?us-ascii?Q?OSmZicSwYVnG2EzZp0tiSmx3xAMDp5fxevFBOn2jFyBvc/ALXNlSoIckfSBt?=
 =?us-ascii?Q?m8sGIEwvyYF8ajkk9RzuZOP4aMI3YLwiJBuKlh0F2seflDydyH6fLt5cIlQb?=
 =?us-ascii?Q?LdaXZ33R8lugc1paMPMbS7jLrigGOulLxaNt10Do79OzLwLe1ZL1iRCTDWfQ?=
 =?us-ascii?Q?PW4WOaWNeqTbnlbJlYAco6tzPotA+Hx4uzhj+cNP9pp5YIUsr7+l93LRm8G4?=
 =?us-ascii?Q?040DcWjwQnwifckwM1Gp/VUHMujhAgiAcHpQNz0qSBrhLEq6JTTSDW3mEk6k?=
 =?us-ascii?Q?3Iat0+R6bGplWsZge/jnxvUdqeSyZ5DttyEswzr6QV2pSohshWNIUOPxsvDu?=
 =?us-ascii?Q?CH8/OpgyitigQKcB16zSdeURaYqVdKjlO8VP63kdDCXnGAOa1Xt8ezeUnupN?=
 =?us-ascii?Q?z0HkJWwSMMAS3y7M264XOkwFJievyERN3h77CieRk9cO4xlFY3tZVkGYCSa9?=
 =?us-ascii?Q?LuqGd2LEU20pA5XFrYcNb6pD8zMUhRkcDKX9KC87QIhpVh7SoJHaseT6l2u7?=
 =?us-ascii?Q?9BKT6oemglO8BXRuv6Y6h48a3xJ5EkAwUjZxXY1Oph2aK+WKoMlzYR5noxCB?=
 =?us-ascii?Q?ugExL/0XKIkrewNSZmwnSjgF0skCYRs2/9i1I05NAbdnTyHb7qS3ddOJH5uD?=
 =?us-ascii?Q?tRToeM87C1PclW9+/T/wHrOLqgcUPkdB0V/rreXK+bMrAKA2ewZS6HHy0Pa9?=
 =?us-ascii?Q?B9McUuvmTSglynph0maAJdUxCB6Nb1CGZERHHoseMLLOtNVVTyi2BirAShfz?=
 =?us-ascii?Q?JNRxz0amfoHa3LbAXCoV2ZB4fpgbkldVNOcYnAZpiI1AhOXKXu5sS2CIb9cx?=
 =?us-ascii?Q?Y4oopkcpoU6zKeLoswuMRNTczspUEvZcSuiD8xRIi6q23snXxJ7g9Z9OVJVI?=
 =?us-ascii?Q?LJNE5vBOCalnJS5WPapMgr34kNBGBe3qYDLPwl5cenOPer2rrh7D3oxtOLpK?=
 =?us-ascii?Q?/NZLg0MNCV8tfXHpcwVt+CzdIcQTtTJvp47Q1ayp0fKFgf+FDVlcYecrXcfk?=
 =?us-ascii?Q?fbOQd9FHlf64jDhN1QLULv3GVU/W5ApS308KJrsdpibBRe4PUGdLcc//e5P6?=
 =?us-ascii?Q?2wtNqaHeqb3pjTChH+6sBpH6CGpih9QR7JBCShU142wZXj4Glhg7sOZP7r6S?=
 =?us-ascii?Q?48aV5BMVLb7xgoYVk7x3SsRRaTxmSUmXvuhd/TFqfD7xA2Jcz7raJ7ay8gQ9?=
 =?us-ascii?Q?yqXw+5fEece4pwzjXFWN6b8jL4gT31diB2pypOMaVGOpIN2d5xHYYURDlnIh?=
 =?us-ascii?Q?eIUoaiE3J8oXB3pI95Z+EQk1c5QDj7pt4WSF0znnXB1lUSl9SETR4bWjAn9E?=
 =?us-ascii?Q?lq8L7NlyscSDgGw6NXlzE36Egrqohi07tskWQGEEQrOrtG3JyZXjvWigOO0o?=
 =?us-ascii?Q?6ZzWSuTYHELrhaDKytZrI1kxKVdVpmNt+4T42HVW?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2d0eea-f05d-43b5-4f82-08db70d7d413
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:14:08.3625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /epqYKxDP1dGqyXfj/arKwb/r1luzDDYL+bW4ppZ/v2Hy6a8HO/EJg5xnDZIauTS53AUXmK7Q3w7LpS+RymuTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6211
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch remove unneeded page uptodate check/set in
 f2fs_vm_page_mkwrite, 
 which already done in set_page_dirty. Signed-off-by: Yunlei He
 <heyunlei@oppo.com>
 --- fs/f2fs/file.c | 2 -- 1 file changed, 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.52 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.52 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qBGaB-008lhJ-EK
Subject: [f2fs-dev] [PATCH] f2fs: remove unneeded page uptodate check/set
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch remove unneeded page uptodate check/set in
f2fs_vm_page_mkwrite, which already done in set_page_dirty.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
 fs/f2fs/file.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 147ab24ae579..b3e96bceaef2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -149,8 +149,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		zero_user_segment(page, offset, PAGE_SIZE);
 	}
 	set_page_dirty(page);
-	if (!PageUptodate(page))
-		SetPageUptodate(page);
 
 out_sem:
 	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
