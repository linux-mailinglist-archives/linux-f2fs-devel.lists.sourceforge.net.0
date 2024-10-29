Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 864A09B47CC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 12:06:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5k2q-0002WZ-Gq;
	Tue, 29 Oct 2024 11:05:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1t5k2o-0002WQ-Sb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 11:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rNVNp/DosLxcuNx8/itDOOkPuU8AKs9/dXRIwSJVrCw=; b=iyC/d/mlkklnLX1JaF2Lvkqv5M
 3HVzj6CxNcIsO5KKWT08d+HxVXoblhYVTlm8GBZLSLkrJx4eHOvM6i44CAetFnE45jo/o1PVZrebf
 hZrDK4cRAAMgsSCGEmmysgp/8d6zW8YR1IbD4Xwil2CsN77NYXnsRQVA3i9nzhOj/B/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rNVNp/DosLxcuNx8/itDOOkPuU8AKs9/dXRIwSJVrCw=; b=f
 xl6XiHKcEkDYYMAoxAjbvHrQ2uyRT5CkKDyY+USsEhGXcpyUWy0ymxjoiybb2P+5QB16bWJkE0SIu
 5W36xSg8gtjYp9U+kcO302lRAvHNTL/aFaqGWnGtkpdu5Vo7C84OuFR4iF4r0l+0O1xO1xG8+dLlX
 v5B5HvMFZCtJLd5o=;
Received: from mail-koreacentralazon11013002.outbound.protection.outlook.com
 ([40.107.44.2] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5k2o-0001dY-1x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 11:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQxFeSrJA0dhYl703kk2f81ezKROWAd5rF8Cf3g8Qx79Q/13jIEWUT8pC+uS8MhEOe+3PJ1DjOLHnKTAgFtINplj1IQvqmBgj//a3jlTMUDhhNTSVeh5+doZja+Eu0BrgBfDpk3T2aGhsd2YBMfaajHAPwuVVoLb9CSFlZTciUu082NMc/IlF9JmooULUfeHmmDzVUl+zslHolI1cJ7OhRHHHgJt8yn0TUTmWL/Oa5q6mCl6QfBNWrvNnBcR0m0jwFRJXaQZ8+WO+O9sToYsrfkGBAaKVVfZR7z0EQTYjOLWDQbCyeDoej+dD3by/chc1ISjtH3hUtqUgqOdD0ALYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNVNp/DosLxcuNx8/itDOOkPuU8AKs9/dXRIwSJVrCw=;
 b=vE09NFpjNv4dSqqaaKyko7dC0vupQUSiVBd3/VQOOkfDV1FwS+cs+qePVzd6mLgGdqHUa8gM4LxQvKy0pCg1U75U6HPGCGzZnkpxMdz+YHZDKdlRgLxNb/5wscTf1siUumV9TlmytcYxLw+0/qCr+QHrzEquVzStcLL3UUuXect5jxhpMiIolMz41WP4xPdUgJG6dWXk0Ll5w6w6J4olTR+ruK3hOQRR8BOlIm6fveNXixjabUFlq4YFU5RRNvn7kBJpFu8byTgwMomE2nCarGkiMHHPFNtycfrm6df/rN3C0nvEXkWpWrul1PsuK71QPtvGoTE+Zh5bbacBxnuo0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNVNp/DosLxcuNx8/itDOOkPuU8AKs9/dXRIwSJVrCw=;
 b=UwM5ZbbQ/lAt31mWq1GiATYKYui9Pine73hTXyTE02nrtDgIXUF/6KVRARYInuNoEHV056iq0HMaZQzN1OsCvqzJEWOd6MsiLagKr5bbTz1nuCzLIKbwDT7lt2K98rxqlsriDYp6Pe8pQYDdB2ZWdhUeIwGm0MOCeS28nugmt+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by SEYPR02MB6386.apcprd02.prod.outlook.com (2603:1096:101:13f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 10:49:26 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%5]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 10:49:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 18:49:07 +0800
Message-Id: <20241029104907.310781-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|SEYPR02MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3b32a1-dc90-44fb-3012-08dcf8075b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jvx6d7Q3Cg3nn5pjNMr96G8qaOiosm71Ed7zix8Yc95oQNtYq94OTpmDiSrQ?=
 =?us-ascii?Q?9QPVcEILZba5uufV9iZmrBbHur5uCGkhYzoWooCENYeCWTBCgCJbKrXeVC0L?=
 =?us-ascii?Q?r8d7uHiOOjBIkAducEqN92J7BodP7TafOn85Ql9xpPRqWDnh6Zj16N9hkz0N?=
 =?us-ascii?Q?4tnnE3cW6lJHCtC3O8az//HtxyScIE3aMSaJE4fIuNKn07gKTdD2TojP6ijN?=
 =?us-ascii?Q?2cR+4pFqhR7SrPOIzP483E2AGyTX8QhWfCRsMnWsdYzdPz/HUc3ddncpWWDv?=
 =?us-ascii?Q?sKLiEuZvHEa4+7CLOMmVp44JUh2u2ryHqPFBjTLkSiU0+yNfscJlzbqNN4R0?=
 =?us-ascii?Q?9nVXybL+zpLsXPREqLoyl3A2kI3iETVEqIP4JoK9wNC/wiMYeqPaO+ckR7xB?=
 =?us-ascii?Q?LoF1vyxRSmMUAb9gyVTsoFSnnOEkXRpQFEZvw1LYgyevAiLwMSM2QWO3EHDG?=
 =?us-ascii?Q?LkZBCh2xfTOtMkZpHXY5oN/jzhQUTHyq5ilY/62eLNn56BOXa27UpDpZElJE?=
 =?us-ascii?Q?JlbyG12gueGjkdXkNC+9xYb4LR8qxaFcZdO8eyxFs9N7QgY9Mp7QZxm6JVNA?=
 =?us-ascii?Q?D9BqZtLO0cznYLwsWHsIwcuwXDKzdhNuF7DQgGjcZ0ZVpI3rhL4Q68J6dfPb?=
 =?us-ascii?Q?Xg+70swzNn6oJIafqN4X1psWiUaBYld5mPngfpHjxS8FakqtitcfRlnIUeQA?=
 =?us-ascii?Q?mJfwCOK4ewwWaa/RLW4zjsOzmqnhgbMQwsmUtw/uiqplQKkC/WAWA2KmvNI+?=
 =?us-ascii?Q?/iBZho/QuPsO3O8Kd3YY1klD6eVkBbY1zkDk1QA5foQaMyEZFKyugsOFyeYQ?=
 =?us-ascii?Q?QFwwROgQdyH5b1+X9KFCrEkSEnRn/CUQ/roMrzJ5QlM7pr5CXvte1YtF0TdI?=
 =?us-ascii?Q?AXf1BqsQMT0xtnIuO5zEwKcMwKSk6GnPauWHYcGMEx5/Nha+AyuryEkRKhjU?=
 =?us-ascii?Q?5OY+NJYgxKrmFai2zklXce7lPR8la6mxhXLqhR8EV4QEa2itWmXYoI6jcKoB?=
 =?us-ascii?Q?MMc4Ej7W2PU9wkSywcqOVMuoxZclkFljhznIRRQLKAfKvJ0Js/4EkTWiRpOu?=
 =?us-ascii?Q?fj5LpGMocd7qnxA0HC4cCrhvShsoB52ySMNnuFKoVgruRJCf13655TBq3qgo?=
 =?us-ascii?Q?qnL7yTSoF7Bu7s2UEzn0Xx1Gm7qnI8p+zd8Lvc/sjdEEHZxKwcQDUhvnwlEE?=
 =?us-ascii?Q?74eQHJsDKY2CbSLho0kKR1SnQPPz5ZK++KMYexZispIERabzwxZMOZazAZro?=
 =?us-ascii?Q?zukVV+2praeu++H6/JolXwPuYxeiXoqZbffRD6jsjSt8nQwzU2gbK9Ff3Ywg?=
 =?us-ascii?Q?BouEkWV1iS5idMP9+oOcxkwJNiZ1ZDhYbNY156ZFZzImH/K+fOa1cruEs3pO?=
 =?us-ascii?Q?o8O2leA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tWJQAO+VFCnlHIOhdGOKjnRdHO0b6CSp1T1t2KvV9Ypdge7ILWGqbAEEpJx9?=
 =?us-ascii?Q?FPUQJIrekSKykXpIpVS4CU2nFuECjmX6IB1iTbJxgf2LS4zk+xwZ7ZwJtpuC?=
 =?us-ascii?Q?umA9HzSteXaEuXXpdhj/+Tj+ek+7taIKhQptPs0NZeUASOqnSwl/CErpvto4?=
 =?us-ascii?Q?6wljjRoYtp35Aj0Aexq1kqNt4vhrYl3+uUbRHUf6zJEllAP9+GbT0WU66RLD?=
 =?us-ascii?Q?JcZz9L4RYuEonJT9+/PM84pQR3CcB6GfKKFuRaiuqVnsaBdYs6PzX4xR1KUY?=
 =?us-ascii?Q?4YATMOdDBn/nPlCDj4CFc9W49fo6/PPsc2iipQEnm3Bv5GvokTxTXH6bsHOX?=
 =?us-ascii?Q?cd6wryklvi5TYSVOm5Sx32hCOMmVVbJ2yplICHDx/hdnvVy+clP/FM46YTui?=
 =?us-ascii?Q?4Q/nOWeyZux7s3WdAnBDuf9mF6IqsMBtx9cCMDFrSsM7d1WtC95PPAabhZj+?=
 =?us-ascii?Q?Bb9SAH3Kv0i1QC4ROszCetLVJktJKbwy9v3AiIV2NDPyyB67K41mA39JsbbI?=
 =?us-ascii?Q?MgSklgw/sf7BTf7aV8D9keHXDVfGNuV8xXeFW2gIlUvyjrY1ruoCjlQ4ehfS?=
 =?us-ascii?Q?spHmUJMJXgCZXaRah1Pmqj3DygaI8neMP/AqfO2Q3vbPcMqekNfMZPUgBv4J?=
 =?us-ascii?Q?zuAFhak/k9GINLAhoLRVasmHx+RZcU21s+c/b+FrhEMdlG0YSI/LJT3ASsX+?=
 =?us-ascii?Q?cIWpB5TQLPhkTQBmIvVkZkF9VwT0O0GbRG2Q38OXp8LVY5p2kZUyqYghaxit?=
 =?us-ascii?Q?Gdts6K+joX+o83nN0VCnmilGQsb3jvv2eal4YsbD2r/vLqIwgEhHQPJK5NF6?=
 =?us-ascii?Q?jrmTkNvgRWFNgxn1ht+yU157Xvf3NQJyxKsxLRNsAGb2uy9ubP7+4f3ip3Yn?=
 =?us-ascii?Q?BWxNK4cKshWj2y2MQfwUxAWRd3WrqT3UEgAkZosamu5WKqs2Mwh+gi/rQCda?=
 =?us-ascii?Q?kQY8CJv1zVl5EG8shwdmLME8fvpzHhN5bSL+ngNEGVahJO4ZmCnPXszVOLNg?=
 =?us-ascii?Q?g+UhWDbRxgMzq+iE0oWNBxeqEoGh17J1i550f6jDFZyX7oRXTm/pdX6B79i9?=
 =?us-ascii?Q?JqLq04OS7FoV8GSv1wlh/mdUmfbQpsqonzRzH/r1Yo58zfFGD5G2kUuQJwqP?=
 =?us-ascii?Q?kcRph6kz8MlFE6MQs1C+ZLAIlisii5REGAEYSupwceah8ClrVdIleyujVrXw?=
 =?us-ascii?Q?L0l644GxxcFnnk6mBtF5nteO+nR2/Mmr07F/Bglx+a4jWpoQDozjPQKnmTL8?=
 =?us-ascii?Q?39xtb1aKJ53ehpzRfRyTdivCNRUebSNNsko3yXuTaeVSE3JDdMMUcihZYMxR?=
 =?us-ascii?Q?5UnWRBpHjq/EG6A4555PHh6ERNpWHVrOVNS2Sm1cvqMZaaZQRNVOXYIyWpKC?=
 =?us-ascii?Q?1mQaed7Y92cIb5rAwWbS2aKqN2UB7AyQBJdAjBM6KjsNZ17fUPhF+4KuqeCX?=
 =?us-ascii?Q?vz7leViKmaCTyJAyAC1RjQOsm5iUREMiaxpxbVjGdXCzepf52Cb6gnB7XvXb?=
 =?us-ascii?Q?8NSv5rNmLw8C0WNU2U2bN3Fwdqv5PqfwCGRbY+ejvzB1aU01Ih8NdYqDiE1m?=
 =?us-ascii?Q?KfJc69Iw9Hc/+wcfd1XhvXlIW1BAbDjJbLCqfqLw?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3b32a1-dc90-44fb-3012-08dcf8075b45
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 10:49:26.1914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFrtXmlM37XF6RnHicZvGKm62kVYxbhFAg9dVIciSCphV5wp31YeyybaaOs3zDrjoYeppwFm1hECuonuEtO2lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB6386
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: additional_reserved_segments was introduced by commit
 300a842937fb
 ("f2fs: fix to reserve space for IO align feature"), and its initialization
 was deleted by commit 87161a2b0aed ("f2fs: deprecate io_b [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.2 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5k2o-0001dY-1x
Subject: [f2fs-dev] [PATCH] f2fs: clean up the unused variable
 additional_reserved_segments
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: LongPing Wei <weilongping@oppo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

additional_reserved_segments was introduced by
commit 300a842937fb ("f2fs: fix to reserve space for IO align feature"),
and its initialization was deleted by
commit 87161a2b0aed ("f2fs: deprecate io_bits").

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 fs/f2fs/f2fs.h    | 1 -
 fs/f2fs/segment.h | 3 +--
 fs/f2fs/sysfs.c   | 4 +---
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c13812dc7d3b..119706dbaefa 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1064,7 +1064,6 @@ struct f2fs_sm_info {
 	unsigned int segment_count;	/* total # of segments */
 	unsigned int main_segments;	/* # of segments in main area */
 	unsigned int reserved_segments;	/* # of reserved segments */
-	unsigned int additional_reserved_segments;/* reserved segs for IO align feature */
 	unsigned int ovp_segments;	/* # of overprovision segments */
 
 	/* a threshold to reclaim prefree segments */
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index d440fdb83ca4..943be4f1d6d2 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -522,8 +522,7 @@ static inline unsigned int free_segments(struct f2fs_sb_info *sbi)
 
 static inline unsigned int reserved_segments(struct f2fs_sb_info *sbi)
 {
-	return SM_I(sbi)->reserved_segments +
-			SM_I(sbi)->additional_reserved_segments;
+	return SM_I(sbi)->reserved_segments;
 }
 
 static inline unsigned int free_sections(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e51304bc65ea..bdbf24db667b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -501,9 +501,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (a->struct_type == RESERVED_BLOCKS) {
 		spin_lock(&sbi->stat_lock);
 		if (t > (unsigned long)(sbi->user_block_count -
-				F2FS_OPTION(sbi).root_reserved_blocks -
-				SEGS_TO_BLKS(sbi,
-				SM_I(sbi)->additional_reserved_segments))) {
+				F2FS_OPTION(sbi).root_reserved_blocks)) {
 			spin_unlock(&sbi->stat_lock);
 			return -EINVAL;
 		}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
