Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D316B4E64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Mar 2023 18:21:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pagQe-0006Ki-Te;
	Fri, 10 Mar 2023 17:21:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pagQd-0006Ka-9l
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 17:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VdeXT8cHX2yTegN6ekSmSq6od6qVpIw+eNsSPhU0duA=; b=OCvedijSkWBAsOYd7gtUAL3tPe
 PEE1LFXVLHNUV8HNR75W2SXtIve9SsAsrHUwXvbWnnsHgq3s1Y/I3Z8sTFhBVvsO7Hy20C6yUEerw
 mHJXuoWoG/XYfobz7+SUEjnW2SsbQlhrkZUVUnMRfN8biNUB3AxKBs3qQpHY0/V3VdD0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VdeXT8cHX2yTegN6ekSmSq6od6qVpIw+eNsSPhU0duA=; b=F
 hcqrm2xiCgQpiJXmnYv/SNEcMZ7AZl+op1fnuYMe8d3jbL0P6pQqGwPWDsO6yOwTrf+3rnPPFZNXI
 QX2aGCNOmR3lSvmoLL1ay8ASy4Sq6EF8hk+UX2J5bAKm34IGCBM9jT7yp1Q8vApjh0ijtKAYzflBj
 Sst72OzE/g1ntzOY=;
Received: from mail-tyzapc01on2092.outbound.protection.outlook.com
 ([40.107.117.92] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pagQY-0006nR-6y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Mar 2023 17:21:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmirOavs6rffXmMz3XqyNLdKf7Z4WtbP8NfVr+qyLNB51GB5olMMLEbm7Pjt5eKVdzzpZ4PY+Ui/DQIbLFoH4IC5l72b2xve6jS6vtFImCO510O3ojsrlpQGo2eNfaDsZ2RNsuP0gM3W8+VxiZ7fYPPPMBWQxf7MDpol0wOw1FoM67Gkkr1KnKt4qkGcaPqkrKkQq7WzgwhmTSCcmmM7H7Uvyx+IqE4fUZV6v8VqM9rrIHiD8P5YQfhwGY99huaRU27aci0u0xP/4RBO1W8FHBF8aS9kDt86ug0v9cofaMdlqseBU/xgKls3Ya6UVP1foq4KoPcIWte3xeejOiFO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdeXT8cHX2yTegN6ekSmSq6od6qVpIw+eNsSPhU0duA=;
 b=ipx7Ze7y5TKL9JNYsTx2xNjvIJuydUQoUHMVuUKgaEB/x138g63ej4c2JiDJSUgCmHomxr+qpcC4pQBE7viVr7noRWyX8iQ2AB15PUPzWtadtKoroU0c7NcNtdSkzFdSR4hKbG2NUVt2JD7xzbqt6/qHDyfYAuCNNK5HqzqvB8QNlsdWEliN9LLmt8gF1O01b6KFUqJSVQuVXeEd2WDRAzHEAAt51WtBss6h9e6N5JYUHepqvRleN5OxbjSWVwwBPq/Em0ydeCvxcG9eG4CZrrK/bVG7Yuf/EGC/r85K9qfzvkUqZi2RJjUjmf8rERW3aJnfviVULZlAMP3+l4KWew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdeXT8cHX2yTegN6ekSmSq6od6qVpIw+eNsSPhU0duA=;
 b=Ab39MdtizwnPIdX+oIQz7UUuzvLnWCkve0eK6DWiJOzYIxLDA0d8HSIz1hhpKkKXu239hPwI1wLwTsOYGdZxy6IYkCKDCQatwgIrFLHin20hKjFORXjPQ0a+ChOhHT94AMz081273ukNYNmWaFn8R1AgZ1A6HsVUxi0Xe3qztbFOqQPh32ZVhRjzGBQjMwZNsFUZrnK4YNEsDjJeMxO2caUlWlKFE3vxxaLS+OBJBBeh2kk8l/fB5rB5h2a66OGGxbKXAlDojS1rca31Fxg30AO0wbK9iV2tb1VowqRTuQYySqqKSnRKZdqYmdgUqoNJ7gvy1gcRWoSsEMR/ym6dCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5848.apcprd06.prod.outlook.com (2603:1096:400:275::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20; Fri, 10 Mar
 2023 17:21:00 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 17:21:00 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 11 Mar 2023 01:20:48 +0800
Message-Id: <20230310172048.27996-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 93292147-ab68-4da0-7f3c-08db218bd146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K2R/vhMk9r1z9t0+rAytICDRBO3mo54B22J/u/Oz726qs585pdwHGhl3+7K9+6gfXdZXfPqPcSOG939rUZX7NRxluAndt+ppoiRPdnxHFpmSriEfTS0wQ8vwcKt7JsiFT5Uz8KUrCqJlT2zTqdCE5pof+FQDTLLD6laGTy7KlQYn4YCynNJ0zVV+LhFkQqvwWk/+ORQwCoF8NWQKtorPPg6BPfRgHs9AIHTHpAZAtUMy5UN1CYXx/BVSTRXK1u+URH8gOeVret3jZhhWaE0pr3wA8MjpsN9bSuHmxXZngHUmdtB6/Js4gsCj2m98MctJJj6mGmzyWaAkPKNiXEWBHjxG3i57hQzP0cIVxV1PCop+jEp2ielHiyo9RjOMT8Ly2vxMHsC4U4mtN4T/R36hA7Qi+WhgFnw2GI4YXUldpy1l1/4Ezy97VS3l39oo8a8uz8XB3O4GddJkK7zgt1atfBUDzc2HL3UufIDWbozDFW+TrMXclVolY4IB1rD2yEWDtkTwf9arI7RqYlhHo/iNDjHKdVGNSNMkoa1BfGCjcn3O3s7GdxuSRjhgKyPvmq6zHjA4z+J+Q7/+YoYV0AAt13rPVz08YRmPjQcq9eHDNpW2MAPSieQz4HZViKCVEvDXi0lXbnCQhVXlm2/MGkdxDhqpThzNkIXC16gsdSk3f3fUDOdtoERQ8U6DkWbtjcqJT/ymJ2X4abKDdIqUH5tbHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199018)(38350700002)(41300700001)(186003)(26005)(1076003)(6506007)(38100700002)(316002)(6512007)(86362001)(2616005)(4744005)(83380400001)(8936002)(6666004)(107886003)(36756003)(4326008)(8676002)(2906002)(52116002)(478600001)(66556008)(66946007)(66476007)(5660300002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pGV3XxZuSTLri0gbh59qVz2u6fKwm/v2QYy/YQLqvozHPDXfVp9U1TJGYVzU?=
 =?us-ascii?Q?UVjoLY/DP+igBsw5sPrrofN96NfGwf9A2psSGI9jhre4wLFHPvNiMV+ih/II?=
 =?us-ascii?Q?s/ZjDAbjBFXUtbkUTTlxvZGHRlqG22REVBVVxDG4u+FbXjyBHbhPOchbQSYi?=
 =?us-ascii?Q?tMYFicsK7QtcWTyCrm+qX9mq7/JAMfC0L7HTMYVpUSMr2li1pPw8PEJecx+0?=
 =?us-ascii?Q?Hy2ER00/WMxDDg3ef6zXjjiZ9Orr/IVFS585Ol60yUkJy9PapTEkbpkhZpy1?=
 =?us-ascii?Q?Dh/Li0v63lZWT6yxwQCac7y9/O0sFUcXS6bLixR0wVzqs3Ig2mhLN/BmNqFU?=
 =?us-ascii?Q?5FqDrBEAau7iItK3MSFP3CcCfCwSwAqiVPr0EUPqDxFuL7leKPSMz96zRWSC?=
 =?us-ascii?Q?lh7RnJmV15lsfsXb8eeiyzRYpJJWkuZG8P8vvTWIQDGoSnAmVIJpqZ0DwedL?=
 =?us-ascii?Q?p8EbY9vK4LvFCJRNtkYatnAtF8RdilKlcVHq77G9QLGb9CvlfV17nbaeQjog?=
 =?us-ascii?Q?DqO5jGeJSIlrXdNfA++/smTQbzdj82tKzHyF3neLV6wyqguQpV0XbZPEi/+8?=
 =?us-ascii?Q?qaToOsgqKj3hoRqWMXicuLfkBLwLTQFHS7twMdDSDefKz5ZQsJ5mKAglLmvl?=
 =?us-ascii?Q?OWZOW8kDIZCm3gL4BHAnEwEIZ3vldaSNOw8MXJ2GW3avklIW9y/w0PTm9cBm?=
 =?us-ascii?Q?UIvCE82Fbs1UdGg6riwdRU14VF1yR1kZ9qCdRvVfZrebqt+gXATlRdpJXdtP?=
 =?us-ascii?Q?QjD0gzHW7ydm1hErpeSLEhh/84W9M+LnOn4Vs5QrxBpVgxM482hgU5rnE05C?=
 =?us-ascii?Q?lc2nn8XKadPfLuqCGDEtmHJRz/uORbAZlmU1Yo07VzYIvs68PS5LqrItaE3d?=
 =?us-ascii?Q?Tb7mYd7dRtOSSkF31JUCICci0lTzWjLYYLnVzFa/zvBG5wk69kFQY+qaCY0W?=
 =?us-ascii?Q?FE6KXdBq0YOnaCp8wkhdz5FFa2C3aTbCeF6pHKaO55uo7aQcaRCXa1P4Lhyv?=
 =?us-ascii?Q?1/LCxbxHKxAFWCenCKgvJ48OQi3LV7Y5L7EKMkv4PGFpKn3SGv6p91/6R1/R?=
 =?us-ascii?Q?hnqe+teQ8cOKn/H5CRVp0VUcWdFMBsBycZ7ouzeR02xjdh4TnFoK5KqTTwnD?=
 =?us-ascii?Q?cD033qV4h2tmKhYycvVqOeI8dydDhjJytnrtc/jz9suKSHKgvKUQ6eSoy4Ie?=
 =?us-ascii?Q?72zJVlw85d9vn5IoswDyM75mT9oRsmt6B2MiegatmOihmOWw4VV9ssUoK+cs?=
 =?us-ascii?Q?8j1Fq/pfKRNcS4UhOYHMe04eJbCXEkA5T5Ajwz0/68lNZyUmHPTw/at/UO49?=
 =?us-ascii?Q?PVA91BMzczPlKd/o+z5DunsV9zhEViYL98/KXgW+e93klIxVAX7GcIvM5nh0?=
 =?us-ascii?Q?ZKGKnTpHb+04f0UNJQnOEPFv+mZQNgDFNbrYSzjNuWC0MTgYp0f1i7RVAnCZ?=
 =?us-ascii?Q?5ZXpovrnLhKbeZdQ9S+FJxEk0kTuVJ2k1RedoRld+D74xaciC9cr2LLNUxLd?=
 =?us-ascii?Q?pf0bh+nWyIRxC/6zq8s3LBLZSpvAcjmP9GnxH4EBynhah3+bxNdDbEK4Zauq?=
 =?us-ascii?Q?vPw2wpLH3Q/RjzY+kwiX5ymh2L+vtpBBcfei8RXq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93292147-ab68-4da0-7f3c-08db218bd146
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 17:21:00.0473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDrr6X1SilQrVIc1jR7TMTjxABZ16Ic0gmH4bnuyFXE5l4eprSvrmd2hn0IEeZ+bHto0mRwd0kmGYgHgnLsk4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5848
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  s/not compatible/is not compatible Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/super.c | 4 ++-- 1 file changed,
 2 insertions(+), 
 2 deletions(-) diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
 9c87d91df61b..4c22f1b1da09
 100644 --- a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -1350,7 +1350,7 @@
 static int parse_options(struct super_block *sb [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.92 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.92 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pagQY-0006nR-6y
Subject: [f2fs-dev] [PATCH] f2fs: fix typo
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

s/not compatible/is not compatible

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 9c87d91df61b..4c22f1b1da09 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1350,7 +1350,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	}
 
 	if (f2fs_is_readonly(sbi) && test_opt(sbi, FLUSH_MERGE)) {
-		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
+		f2fs_err(sbi, "FLUSH_MERGE is not compatible with readonly mode");
 		return -EINVAL;
 	}
 
@@ -2342,7 +2342,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
-		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
+		f2fs_warn(sbi, "disabling checkpoint is not compatible with read-only");
 		goto restore_opts;
 	}
 
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
