Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6A6763F1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 06:12:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJ6BH-0007yx-UT;
	Sat, 21 Jan 2023 05:12:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJ6BG-0007yj-0z
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=20mJGHcAaflykKc9Cso8rSKoQFvflxJOxP/wZgB0Hr0=; b=QyvI7+qPAjNnC/EGrHX+F/nGyx
 //khOt5FC1icrUsH+pcH+KpIMWF8dboTEQHJTfH/1HcGdDrgwey5uGK3yX/FrbkQA62+7JLLFFLEd
 WGv9HkUL9RpWnEvs6uCs67iyJ15DTySesW7JhHLz9EbLd0JGj3dcPD8oZy3rccO9esAg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=20mJGHcAaflykKc9Cso8rSKoQFvflxJOxP/wZgB0Hr0=; b=W36BkwUZZg/JWv11TacvAGt3pX
 Cgfv1TY4GDtr8nbhEzhRFs6nXnaY0cPaNeWWZTmGqNT+6LHBHPQkeOLFB8U8Hr5ESmZFi1+e8n1LB
 iZeDDP+gj9xAsX8rBKEFHP29tvCuIEGNX5XQOBmFIrNb9hDhob/bcsl7dm6CPEEeYKMY=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJ6BC-0004FR-P2 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOe/QxjMi3U54+yhGU2aLGRCz7Ousk10gxwbwRL0PVaCmHGhsXBOYKmhDOb6XSgem/nmLijnBmhhMjiwGxDLV7oOJGbwZJpGFzOdDqZtIfyrzAIicv5vd9DtPZlrur3FfrzBRQg8XnzIw4uhxorExq33/rNjKMhgPiIKoHyivWzSTIDyz6mv4kOHi/GbLIZWBKNcpRn156fkC6Ids9Fxwt5E9yag0lpIFjD2fO+gt7AVmOw8nnAgclvIVT4p3Gax+j88lYKoOMFl1mJKohnsXTEFz+lPNKGKXLw20FgpzQ/xiCwp5pDaHjYeNn0gQ/0nK3yN7NsIubqqYbqen3zUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20mJGHcAaflykKc9Cso8rSKoQFvflxJOxP/wZgB0Hr0=;
 b=BZF1fyKwRH1jHmcyecTUJseAnIJ+VEMazWcvOKvLZamVOXhBgVhgLBpyU/4bLNq4KftkktY3Eg+w4K/baIXw73eWV4I9gzzk1nXcSY758QXbl23Gx5fAxw4FJ50GzfuZO12GEVrP7NQmMkm+HUfDB8DcjIO7wr5bAoXtVhADKsP5luTVOjv8AbvbYOmztXuoFU3nbyk8aPpD7VWQIFfFrvEsAO5AKEkxrYIHC4bCfCUJA6TI9qioDSLdyhIcjReOIIakGrnp1CxnBT4eZp49o5TbTc6NVZsTHxuU0Rzrb4a5nKKDx9i4QtUVdgSV2bwZIJ3OoA34thmi9J1q13pmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20mJGHcAaflykKc9Cso8rSKoQFvflxJOxP/wZgB0Hr0=;
 b=CBwV7XVb3KMzNdnJH+qwOyqFZk3/Gt1txo/z6QlEGu1QYVy19NlssP3v9FW82a3saQJOtojrXsEMrUSk4R8MkZCwwq+pZOmVg0RJ1fxsLUjtQ0lehTrMIYAYzko6y+ddHQy2Kf2tORB7a5yudcALUG2VUZkVlNLUarh6dPefbKmqCvzvlWDkDFV7AyGiQRqfB0JDA0sXvgeN0ghLBO4tzZX+ugh8VLxMr1zBWvSBo8hSYSlSu/5am8Ue0+9b5wrY2Iv/kM42wGTAiSFF+5NMm/+3TXJx5iJI/lHjgzf71jFgVl4c9ZwKExAvuq6jx0GbXMOKr03wbosS4e4h9q3Tgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3885.apcprd06.prod.outlook.com (2603:1096:400:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Sat, 21 Jan
 2023 05:12:22 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Sat, 21 Jan 2023
 05:12:22 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Jan 2023 13:12:02 +0800
Message-Id: <20230121051204.81251-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230121051204.81251-1-frank.li@vivo.com>
References: <20230121051204.81251-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3885:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8ef59a-3920-46b8-e4f9-08dafb6e1409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYp96CzRx0yV6mMnxyeJLIFL4vComMyRF/DGpfuEQqzosLu05SXthFIoIv4wv6jHh49CbY0OR0usonSAkkm0QS5ixx6SGe0sn/NqpuifysykGpb5lgiy7wqmoR0GF+OsuAusKBevGxQSrEzpg/Cs7TTdfv2X2kkEtomN7GIQW97QhpGNcMOoFcgebdt01Jdn+28Js25bu8xiTyBfA11fvrMoScngETNPTkUkIrw6wM89B+NblL9Dy0tnLb3msW1UXnjhx0rJUqjGT19KOmtke1meT5Gsw7gjf7n4RF7RtKncR9khEj82WQ8x7JDfa5E4dE2oxiupD/JCrtxntk6zr8llApGCpXKF27S3JNB5ZXcb2g2NpYrOF5d5P+zAnRNtojw7ZaCK6nq1Y9yPgAWPCfAXno1md1lIkGvtVjbK1zo2CjMRgAuP59qpeEmbGdDTsmrpXCPSyUXroQxnkSbnYM4Q1a4swjT7yRi/0zeG7qmML3o4yXplb9rYSDsOqgMW5nvTY7fkOh/L4LHB9umssjMnYrDVRRTO7Oy+O3H6m1Wp8bj82Gg+Q1ehpxr9HApN1rGzEWsBr11+yMamk+ghi1Jiac/P0k/RJiIqt7vT4BQracDv4RVLx+izJ64Uh0/PGaMvqp79I9qQw4VgUTZl9X6txBFLwx0xhPXKoALZK7P7nsdvVus8gcrRwYPt+l1y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(451199015)(38350700002)(38100700002)(86362001)(6666004)(5660300002)(8936002)(2906002)(66556008)(66476007)(8676002)(4326008)(66946007)(41300700001)(1076003)(2616005)(6506007)(6512007)(186003)(26005)(83380400001)(316002)(107886003)(52116002)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2S2yCjDdkwfGEmmBWeDvhyDpCRVW3+oP5wIQkAj0HAudrHoL4BYxFVNt2Kax?=
 =?us-ascii?Q?SjPgNK4r2slZdA2f/IPnmLfxeBT/tk5e/pgXXN6Nu7twu+MBRVk9HPd29Cby?=
 =?us-ascii?Q?6dYaB17zZ1ONBse7m7KWkURlO6aYHGk3cl1YWvWy8DAQwed/xwXwAKpNwtMU?=
 =?us-ascii?Q?fhbyUHQhi3HsGdbjkVmQE6nIseaR/VXNDM33cqlgwk2qq9310GlFdzg7JLEd?=
 =?us-ascii?Q?YiLLr3E3EDrTI3jq90p9lpkF5wX9ZT6eUPKzyHwIpq0MuWw7Vi6+HJn9wFg2?=
 =?us-ascii?Q?/QwRQXR/5NMIa2X5Rhskow6uN0HXzVM/r0bS3NRWkGQffn8mDRwioEmYb0z7?=
 =?us-ascii?Q?HQCchxDI2CmlcyFYKnQZcncwX/25RiXZ2x5o6TeFqwXVb5MkLh5X2r99eHtM?=
 =?us-ascii?Q?nekaVQWXmWkOTY/fvwrTFxZsWMsdHUQjZUDwfOCU/0Xc2SgvNE1Fb+rp7Wj4?=
 =?us-ascii?Q?EUwbX9/37tdXqXLZiH7PE/T0MURP3dmfgoldzQ1vVaF4KlqwXf9wX20Js0P1?=
 =?us-ascii?Q?NxIP/fidipTcZytEER/ZPRIOshuLaHGIvuuFfCNoioMg2WyGeyZUzawJr0GV?=
 =?us-ascii?Q?mVTYOsLqhgRmKsZjn/S82PquYlswCavNgDkUeytdTZJGnOHeOh+vne/ht97j?=
 =?us-ascii?Q?O2rbmpDlDdG8il6HvZcfalKU/6T2r44W5G4uSj1F88PZEpeZav96QNDJKxGp?=
 =?us-ascii?Q?Y/hKGK8kw3SQ8w2fDX4N0IWWhi7uTW1InU9MH3lopSS/u4nBRU0uu39GipL9?=
 =?us-ascii?Q?Y9Xd8enW5e9fzN4v6saSgYrUpxFnQtBnCaLRFkZv9AWpoCyQVkPMMksvP992?=
 =?us-ascii?Q?qkq17YkkH6YkhVpFHAlf8NWA8EDrx+qAhX63e5wig0rR3KqqgVmsBtiyHra0?=
 =?us-ascii?Q?9s3b+vJJjJrq2A2cLa7MIvQBtu4OUPgm+8xSKA9Az5isuY5hl9A8D6kp/KWv?=
 =?us-ascii?Q?rwrIsEnB7mEfDwSKjy9xm4WllphYRSpRPeI/zK6CP5uKICeFFymQpjifV++M?=
 =?us-ascii?Q?gRozma073JRB/rvEne2rzBUHZLLQ7HZGI1S/S18WIAKQ1PPuxmAzjZSTRnad?=
 =?us-ascii?Q?EYgESyT4F2tYJYU/8biz1LrY4QD6hKw4m1BW45clu8OXFMbzV3P98teTa2Pu?=
 =?us-ascii?Q?A4IqMSrhzxa56Y1ylHBiz4Cp6HfXLHG9wVrYF8KiPj2TuQ+FRJ5lfcs2hIco?=
 =?us-ascii?Q?f4Vi2M/iCzgyte+gYwzC1Ew0eLcpSPdXgnzAMi8x8i5adjikXdHIuqT547zi?=
 =?us-ascii?Q?8fa9E16l3PyHEmBT0x6fljxytx2kvpgulPfP5XD4cS1xWni2uoceJcX9cDMf?=
 =?us-ascii?Q?En6tXVZ/8bZ2RRb/a5BZzoPFOvDzUbNO6qWz/FCnl6/JrZz4pAHnVpns/atI?=
 =?us-ascii?Q?PSSxGKQrVP18LthmhN6Oz3h8s8eXaWpJzNsG+PvwmCgEijJDMTT1LgDuI38r?=
 =?us-ascii?Q?k3AZUrqoxZa2m00oMQcz1PhMStQ+3iXdx1s0gutEJSXdMNEAgf36tY6gAEyz?=
 =?us-ascii?Q?vy3aYNOj4nOI8mA7X2IYdpbi5eWJ4BvkKojam/tMvPNQnEy3SI/NdsGRRFx+?=
 =?us-ascii?Q?1l7oj1BF8yaFqWNlxDwGqeSvvybUhZ/jmbxIyQAW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8ef59a-3920-46b8-e4f9-08dafb6e1409
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 05:12:22.8450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Zu9hAQoNwwOdznphn82wsURi/PE6Sbnh1iHj/Zx0SxgSzLiCxE2fbMkhkl5qyWRc3hzM7q/RL4HyB0u8QVzRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3885
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Disallow the value set beyond the range,
 and disallow to change
 the value in lfs mode. BTW, convert open code to use BIT(). Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/segment.h | 1 + fs/f2fs/sysfs.c
 | 11 ++++++++++- 2 files changed, 11 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJ6BC-0004FR-P2
Subject: [f2fs-dev] [PATCH v2 3/5] f2fs: add sanity check for ipu_policy
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

Disallow the value set beyond the range, and disallow to change
the value in lfs mode.

BTW, convert open code to use BIT().

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.h |  1 +
 fs/f2fs/sysfs.c   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 704d27ad682d..2cbc24f64a5f 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -681,6 +681,7 @@ enum {
 	F2FS_IPU_ASYNC,
 	F2FS_IPU_NOCACHE,
 	F2FS_IPU_HONOR_OPU_WRITE,
+	F2FS_IPU_MAX,
 };
 
 #define F2FS_IPU_POLICY(name)					\
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index bdc761f36310..576e6416ffb9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -452,7 +452,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (ret < 0)
 		return ret;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-	if (a->struct_type == FAULT_INFO_TYPE && t >= (1 << FAULT_MAX))
+	if (a->struct_type == FAULT_INFO_TYPE && t >= BIT(FAULT_MAX))
 		return -EINVAL;
 	if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
 		return -EINVAL;
@@ -706,6 +706,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "ipu_policy")) {
+		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
+			return -EINVAL;
+		if (t >= BIT(F2FS_IPU_MAX))
+			return -EINVAL;
+		SM_I(sbi)->ipu_policy = (unsigned int)t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
