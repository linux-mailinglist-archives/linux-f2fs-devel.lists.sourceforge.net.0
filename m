Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF176763F4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 06:12:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJ6BK-0004nI-UI;
	Sat, 21 Jan 2023 05:12:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJ6BI-0004nA-5l
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Re6VwMN0RWL3pDrBsb3XEkXWS2NBdN/1YA9ZEpvi8F4=; b=NrAjP2Q6IGxiFkvQqd2V98UD7o
 XvIjvI6UhuucKKfiN+dI5Sd7Zamiava0RNO7YVY8unjJ1muu6bA+HrIs62pZjEFS21VqRTtddqGg4
 LKyiHqY/CAnLMhWxnKAcl2ZTEh6fUZEt2D2tBauPTjqDYCL0lQLqB65IkXnnhx3aBpGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Re6VwMN0RWL3pDrBsb3XEkXWS2NBdN/1YA9ZEpvi8F4=; b=GCitzp1+0LH9yHiuBBrpoHEmYY
 xFAV7o1GkHA7TzOp2QXXYL12MCkRtDiRYXRlD5TVCWjTUDM9WkCIAAPzU+ZoYTaH9atWTQtV4VBoK
 x7rpjERBhGLXQt7LKUfoT7QCd8ROy+ZkuEOPlXBTqPYrDvVzF7CtcZu3zBtx9v+frHQQ=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJ6BG-0004FR-EK for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9qJnZq3uXl7I7/gMFaWqFfqyKP9o7R8PZdv/vU9+3xOJ+helXXtartZAhawFp3XgIbAR3NuZX9NIb5a4iRqyOw0uOPuziQMnLkvOJuFIiX6VRrzf2WTj/Gv9mUtkk9cQCv58niJkrx7GtBJVwlUc55rqoVQesrx72ITNb5ZD6FZrCouS5ZgMtiqBdUCYI+Er9lTE12zYpFJ5mU7U+Gd8G6g09FDuITBD9UcrCUnwuUv5DWgKhgh7TQjFjsgX0o8s+asmC2vDHHhXXgh1ShNyVX1qVwAK4mqD3nfzvlGR9xzQe8yjXzSn9ci8fNr+rhwEeeJvdhDX+bCJ8vbRwA8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Re6VwMN0RWL3pDrBsb3XEkXWS2NBdN/1YA9ZEpvi8F4=;
 b=nIJF3U59k/xCI6/iOrtz7PexWO4RB1Zxysayn+M09FIZhYb5H40C1DQSXiaFKnlvkD+eOqYLd6FsiJ+Z6A/6Oeo/lb6ihfxzC11WLiFYu6dy5L43OFZYUO69CgrFmsAGNZwDYt9yy/uZ0vkXxj4ICStmX5TRQZubFB3RC3JP2XU9Y1ziHyRmHnsZuClzX5J/T8OOhxmQwqcmVr4G5WssLXJauVpl/S9WMZGEZkDK2IuliYCL/O+iZD0HdhXVEw+tsbKZ7R8UIx5pNOAReeToF5zbmIBsOVJLzeIAeL3CeNh8XFgCDyqJ1OeJ3mmOw8sG3TyZKbAwRrbBK+1BDWusEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re6VwMN0RWL3pDrBsb3XEkXWS2NBdN/1YA9ZEpvi8F4=;
 b=Nh/J7AAqOCbUEFLbKxZiq9zOqMJkLBy+NQxM8P4orOA8eX3FnovYep2DoduTkXa5A37VeWE6hzT9PrUBuiA3uDH/hTU9eJN2cpX8NPmQU7EnhEfnNI+JsBngLnIzZ2w2gSa4PxUS324xy1gvWubagnhaYdXa6ZmD9Y+vZ3irSRXjkrgx2ZlPWlNM7a8uTxiOUQDACpd1LhSbolvI5AF0PEviANmWBdRagEr4ODZf8QEIQz8DKVbiBLCMgMCsknvUMms/FaL8ZmtWAY6FTHX/Up9h4cKsJE2a0lH1dKbSndYyu2JA+a/XyO9ECOPmtFJcC/daEzjq8tixYB2CjQB+IQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3885.apcprd06.prod.outlook.com (2603:1096:400:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Sat, 21 Jan
 2023 05:12:27 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Sat, 21 Jan 2023
 05:12:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Jan 2023 13:12:04 +0800
Message-Id: <20230121051204.81251-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230121051204.81251-1-frank.li@vivo.com>
References: <20230121051204.81251-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3885:EE_
X-MS-Office365-Filtering-Correlation-Id: e9648a97-96cd-4a1a-674a-08dafb6e1667
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+FnAFwArb4bhfMuhuHPR/LXRT4gifBuuen5MLolEUWCdyCesS6JCHULlgl0980LR9VeG7H0BaqzIHD4pqxUkKdNQeduBpHEGczG3y+eXdfdTIKPU7Lw2BXHv5q82F/rUikAtypP3ydMu762tJLwpA6+WcWa5BEXOuJjoNETLN5Ju9/sSU4TDlKhqE3p+QolngUd1gNycUXOsVVwKtaquBlkFEkNc0X2AQl4/BUZMZ4uNrMN7LVJ2ItjZopwY9mY3coR2zF7bLR3Gnr1Uz36Sp4LdWM7uL0ny5BUllhKKnOOt5xhhR+SnZrN9wQE+9xkIUy/DfoAn4wADOfsbvFzBKG8n7KtT7z1shGdThFNMPmco1JtqfKfJN/QUkcQR5R/wT4J0JZlHG9/T6htXloJ4lRymhOU3CuL/GxmNwuV6lt4BOq0hKXZ6+XKs3Wo03kWIxi1LxHRa2CFJWh7yucLFjpgpyfWr6iBWQNI9Eh2QgA+Nh4mVcIlGxzEhZsZ4QxUopU8AXJzRlOq1mBDJ+1zNu895ObngKusq1HCTKoNB3PCjpbEOb43NXxuooW0W8onbXD2EYYx28OUP1ez3idvEOfvslzf+h+mA3Uk8OltC7UQIK3zJOtCRUcqu1wr87LgNJG066KAU+9WqYHptVvff50XnbofOX1l69v0AhNjFsyvwjjDVTQjzdQXioIjGu7fb926yh8UYgCfyEMfaRePxg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(451199015)(38350700002)(38100700002)(86362001)(6666004)(5660300002)(8936002)(2906002)(66556008)(66476007)(8676002)(4326008)(66946007)(41300700001)(1076003)(2616005)(6506007)(6512007)(186003)(26005)(83380400001)(19627235002)(316002)(107886003)(52116002)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gg8CNCMA3NVwhgCdIPm02X5921yVn7a3Rxr4fKy5USlACx7fW/whF3oF9jso?=
 =?us-ascii?Q?/aOBirSss/YHjFjATEoRY+cNeNPhF8lPtFjp4Hz60hlPFgThbAuSaG2rnNut?=
 =?us-ascii?Q?FU0b8rHhIv0yBbQXVDlq6guFtX3vXceUc2YBTGYbAZk2fgLIGjGU6Uot2NWe?=
 =?us-ascii?Q?b0QaiJKrs7Us4pVz/AkyFCKzN8UEx2yqFXPOshxfnj4HkOqjdR1Ev0uTOj7z?=
 =?us-ascii?Q?uU7Lpq0wR7OCqDjFeoaRwnyHELeZeI18eAzNsXkn8ALBWSGHqIoD0Xet4Hs8?=
 =?us-ascii?Q?k42Tj+PPEwCLqlYTzAerbSkXHdb6p3xtILpR+1kWtMIGDmuRgvCeaMFyGpZ2?=
 =?us-ascii?Q?qHsnpRekgpsTkjf6ydhB1ConZI1QzmsE/9VF56aL1bvgGKjrD0d5Z3mAnTRe?=
 =?us-ascii?Q?AYvwaI/Jqd/GRbRPER/NaKq+k5fLPMVDVnWwW8E0YzD8yzReA7oUQey2+qsD?=
 =?us-ascii?Q?WTEmDkSUlx0LphhcEbIvvJu5cZMWaAMfHuQLkF9xBnijyQ+Gv4DJj6W3SASK?=
 =?us-ascii?Q?K3sjNiNi18YH/pn+WPYt9ZDYZC5+Xp2c6TXoDc7TZwoJplA2NnhnzKpfuA7F?=
 =?us-ascii?Q?1wGfG3pdhVnd7Y4vD/ACi0XtuwPj/yISK9o+3+N8hFvIDiuVYzSl0t4mje/t?=
 =?us-ascii?Q?Zn9LRlL97DPkZbo6k67LYcCXaG7WDV9Gl4wmscTsBkbEDbrkPRXRYH4Hq6WM?=
 =?us-ascii?Q?NZ0pJHDPYl9pc84asWEhDbmnkksIHUHPGs1/rYYmEhZiPfxzLTdnVL/N8Z41?=
 =?us-ascii?Q?tFttuo8uSQhIAzKRPub5IwSMpW4eRIVoSumxgdH9G6+8NKRTSo0ftpx3PXMh?=
 =?us-ascii?Q?PYkpV0XorSnVq4Dw4hBrcH2flMKELYUS+tK3xKgePyr5+UiTrFLr/us9UFpR?=
 =?us-ascii?Q?u1HbN9nIDSI/8/9IZ0VwN5cPmuYyJ8m62hz1kuh+n2czfm7PR0ojfIz0aFrm?=
 =?us-ascii?Q?PrIhUOc+IPQ7Z+vPiDhKZQEpfvb4+R4BpcwAP/kiMMX/o1NxfSB0kioRCiiT?=
 =?us-ascii?Q?WycR34NJlgFyWFQqFIhrjV9VrQZsQHWp9rxCazcgTrdQjlxCc10EhE7GPZDR?=
 =?us-ascii?Q?n7q7YTrmIuOKBP599MMoKXR3deW+kI3LRjF7toC+fxxr44tcX1PuNU4EmGVY?=
 =?us-ascii?Q?XwEZEhqjM9joO+KBnGmxohdY4FwWk0aVVwuXFqyOaUvSczIVoCmnzFKxp0bt?=
 =?us-ascii?Q?MOfCWsAllo9jm/BH5xreaLghvN4OIWeXAnxHTlaIvsc1nN2oWOHk7CEo4UnW?=
 =?us-ascii?Q?C4k1KXOWNCyc1pYvNoefnH5lQXebd/W2u3iLbyeYicfTN1jkcO2kZJmapxgl?=
 =?us-ascii?Q?mPxpH8FMFWRqjqdFStcFIieCnJeScWMy3CHBcqvRAk1nr+6R4A5WN726prUC?=
 =?us-ascii?Q?wM5N4ZxoczNeElNTfTxIaWi7jnIA4bMEDYAOTK9+6o0wuEASDHE8QoUr2RHM?=
 =?us-ascii?Q?COg4js2zUYREaG/r6fMASMYHniwSAb5MyKVmAOc6g8nvd9pC0OdamaELpQHM?=
 =?us-ascii?Q?tsGKPRM1YUnGfcbfzoNu2Bs+bbqAS1N7L4Wu1h3iTdKsCKTWGKZmNx6rGvP0?=
 =?us-ascii?Q?QZpiafRuOZp07vJjNiKUtfNA1xAaZNnKrHETc0tE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9648a97-96cd-4a1a-674a-08dafb6e1667
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 05:12:26.8758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlIcwEE8kLzmIMNKzYYrufq+VWv9guG/KklvnPTMxulPrMtdOrZuCEP7BgaZ4NWhfkEKik0SgzteoUk9eO+eSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3885
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: User can control f2fs ipu policy through
 /sys/fs/f2fs/<disk>/ipu_policy, 
 export related definitions and introduce new macro to make it more convenient
 for users to use. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v2:
 -convert
 to SET_F2FS_IPU_DISABLE Documentation/ABI/testing/sysfs-fs-f2fs | 25
 ++++++------
 fs/f2fs/segment.c | 2 +- fs/f2fs/segment.h | 37 ++----- [...] 
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
X-Headers-End: 1pJ6BG-0004FR-EK
Subject: [f2fs-dev] [PATCH v2 5/5] f2fs: move ipu_policy definitions to uapi
 header file
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

User can control f2fs ipu policy through /sys/fs/f2fs/<disk>/ipu_policy,
export related definitions and introduce new macro to make it more
convenient for users to use.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-convert to SET_F2FS_IPU_DISABLE
 Documentation/ABI/testing/sysfs-fs-f2fs | 25 ++++++------
 fs/f2fs/segment.c                       |  2 +-
 fs/f2fs/segment.h                       | 37 ++---------------
 fs/f2fs/super.c                         |  4 +-
 fs/f2fs/sysfs.c                         |  2 +-
 include/uapi/linux/f2fs.h               | 54 +++++++++++++++++++++++++
 6 files changed, 74 insertions(+), 50 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 64b15a28fe30..d05ad2bc56d1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -49,18 +49,19 @@ Contact:	"Jaegeuk Kim" <jaegeuk.kim@samsung.com>
 Description:	Controls the in-place-update policy.
 		updates in f2fs. User can set:
 
-		====  =================
-		0x01  F2FS_IPU_FORCE
-		0x02  F2FS_IPU_SSR
-		0x04  F2FS_IPU_UTIL
-		0x08  F2FS_IPU_SSR_UTIL
-		0x10  F2FS_IPU_FSYNC
-		0x20  F2FS_IPU_ASYNC
-		0x40  F2FS_IPU_NOCACHE
-		0x80  F2FS_IPU_HONOR_OPU_WRITE
-		====  =================
-
-		Refer segment.h for details.
+		====  ============================
+		0x00  SET_F2FS_IPU_DISABLE
+		0x01  SET_F2FS_IPU_FORCE
+		0x02  SET_F2FS_IPU_SSR
+		0x04  SET_F2FS_IPU_UTIL
+		0x08  SET_F2FS_IPU_SSR_UTIL
+		0x10  SET_F2FS_IPU_FSYNC
+		0x20  SET_F2FS_IPU_ASYNC
+		0x40  SET_F2FS_IPU_NOCACHE
+		0x80  SET_F2FS_IPU_HONOR_OPU_WRITE
+		====  ============================
+
+		Refer include/uapi/linux/f2fs.h for details.
 
 What:		/sys/fs/f2fs/<disk>/min_ipu_util
 Date:		November 2013
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a007f5084e84..c56f5a80d3a6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5138,7 +5138,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
 		sm_info->rec_prefree_segments = DEF_MAX_RECLAIM_PREFREE_SEGMENTS;
 
 	if (!f2fs_lfs_mode(sbi))
-		sm_info->ipu_policy = BIT(F2FS_IPU_FSYNC);
+		sm_info->ipu_policy = SET_F2FS_IPU_FSYNC;
 	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
 	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
 	sm_info->min_seq_blocks = sbi->blocks_per_seg;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 7d98ba537241..c064ddffe91b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -7,6 +7,7 @@
  */
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
+#include <uapi/linux/f2fs.h>
 
 /* constant macro */
 #define NULL_SEGNO			((unsigned int)(~0))
@@ -646,51 +647,19 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 					sbi->user_block_count);
 }
 
-/*
- * Sometimes f2fs may be better to drop out-of-place update policy.
- * And, users can control the policy through sysfs entries.
- * There are five policies with triggering conditions as follows.
- * F2FS_IPU_FORCE - all the time,
- * F2FS_IPU_SSR - if SSR mode is activated,
- * F2FS_IPU_UTIL - if FS utilization is over threashold,
- * F2FS_IPU_SSR_UTIL - if SSR mode is activated and FS utilization is over
- *                     threashold,
- * F2FS_IPU_FSYNC - activated in fsync path only for high performance flash
- *                     storages. IPU will be triggered only if the # of dirty
- *                     pages over min_fsync_blocks. (=default option)
- * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
- * F2FS_IPU_NOCACHE - disable IPU bio cache.
- * F2FS_IPU_HONOR_OPU_WRITE - use OPU write prior to IPU write if inode has
- *                            FI_OPU_WRITE flag.
- * F2FS_IPU_DISABLE - disable IPU. (=default option in LFS mode)
- */
 #define DEF_MIN_IPU_UTIL	70
 #define DEF_MIN_FSYNC_BLOCKS	8
 #define DEF_MIN_HOT_BLOCKS	16
 
 #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
 
-#define F2FS_IPU_DISABLE 0
-
-/* Modification on enum should be synchronized with ipu_mode_names array */
-enum {
-	F2FS_IPU_FORCE,
-	F2FS_IPU_SSR,
-	F2FS_IPU_UTIL,
-	F2FS_IPU_SSR_UTIL,
-	F2FS_IPU_FSYNC,
-	F2FS_IPU_ASYNC,
-	F2FS_IPU_NOCACHE,
-	F2FS_IPU_HONOR_OPU_WRITE,
-	F2FS_IPU_MAX,
-};
-
 #define F2FS_IPU_POLICY(name)					\
 static inline int IS_##name(struct f2fs_sb_info *sbi)		\
 {								\
-	return SM_I(sbi)->ipu_policy & BIT(name);		\
+	return TEST_##name(SM_I(sbi)->ipu_policy);		\
 }
 
+F2FS_IPU_POLICY(F2FS_IPU_DISABLE);
 F2FS_IPU_POLICY(F2FS_IPU_FORCE);
 F2FS_IPU_POLICY(F2FS_IPU_SSR);
 F2FS_IPU_POLICY(F2FS_IPU_UTIL);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ed4a0a721116..236f82675ba0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2214,7 +2214,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 
 	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
-		SM_I(sbi)->ipu_policy = F2FS_IPU_DISABLE;
+		SM_I(sbi)->ipu_policy = SET_F2FS_IPU_DISABLE;
 
 	/*
 	 * Previous and new state of filesystem is RO,
@@ -3950,7 +3950,7 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 		if (f2fs_block_unit_discard(sbi))
 			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
 		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS)
-			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
+			SM_I(sbi)->ipu_policy = SET_F2FS_IPU_FORCE | SET_F2FS_IPU_HONOR_OPU_WRITE;
 	}
 
 	sbi->readdir_ra = true;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 15e9921dcb01..285a1e78fc03 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -165,7 +165,7 @@ static ssize_t ipu_mode_show(struct f2fs_attr *a,
 {
 	int len = 0, i = 0;
 
-	if (SM_I(sbi)->ipu_policy == F2FS_IPU_DISABLE)
+	if (IS_F2FS_IPU_DISABLE(sbi))
 		return sysfs_emit(buf, "DISABLE\n");
 
 	for_each_set_bit(i, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be104..0ca19d1c9acf 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -5,6 +5,60 @@
 #include <linux/types.h>
 #include <linux/ioctl.h>
 
+/*
+ * For /sys/fs/f2fs/<disk>/ipu_policy entry
+ *
+ * Sometimes f2fs may be better to drop out-of-place update policy.
+ * And, users can control the policy through sysfs entries.
+ * There are five policies with triggering conditions as follows.
+ * F2FS_IPU_FORCE - all the time,
+ * F2FS_IPU_SSR - if SSR mode is activated,
+ * F2FS_IPU_UTIL - if FS utilization is over threashold,
+ * F2FS_IPU_SSR_UTIL - if SSR mode is activated and FS utilization is over
+ *                     threashold,
+ * F2FS_IPU_FSYNC - activated in fsync path only for high performance flash
+ *                     storages. IPU will be triggered only if the # of dirty
+ *                     pages over min_fsync_blocks. (=default option)
+ * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
+ * F2FS_IPU_NOCACHE - disable IPU bio cache.
+ * F2FS_IPU_HONOR_OPU_WRITE - use OPU write prior to IPU write if inode has
+ *                            FI_OPU_WRITE flag.
+ * F2FS_IPU_DISABLE - disable IPU. (=default option in LFS mode)
+ */
+#define F2FS_IPU_DISABLE	0
+/* Modification on enum should be synchronized with ipu_mode_names array */
+enum {
+	F2FS_IPU_FORCE,
+	F2FS_IPU_SSR,
+	F2FS_IPU_UTIL,
+	F2FS_IPU_SSR_UTIL,
+	F2FS_IPU_FSYNC,
+	F2FS_IPU_ASYNC,
+	F2FS_IPU_NOCACHE,
+	F2FS_IPU_HONOR_OPU_WRITE,
+	F2FS_IPU_MAX,
+};
+
+#define SET_F2FS_IPU_DISABLE			F2FS_IPU_DISABLE
+#define SET_F2FS_IPU_FORCE			BIT(F2FS_IPU_FORCE)
+#define SET_F2FS_IPU_SSR			BIT(F2FS_IPU_SSR)
+#define SET_F2FS_IPU_UTIL			BIT(F2FS_IPU_UTIL)
+#define SET_F2FS_IPU_SSR_UTIL			BIT(F2FS_IPU_SSR_UTIL)
+#define SET_F2FS_IPU_FSYNC			BIT(F2FS_IPU_FSYNC)
+#define SET_F2FS_IPU_ASYNC			BIT(F2FS_IPU_ASYNC)
+#define SET_F2FS_IPU_NOCACHE			BIT(F2FS_IPU_NOCACHE)
+#define SET_F2FS_IPU_HONOR_OPU_WRITE		BIT(F2FS_IPU_HONOR_OPU_WRITE)
+
+#define TEST_F2FS_IPU_DISABLE(val)		((val) == F2FS_IPU_DISABLE)
+#define TEST_F2FS_IPU_FORCE(val)		((val) & BIT(F2FS_IPU_FORCE))
+#define TEST_F2FS_IPU_SSR(val)			((val) & BIT(F2FS_IPU_SSR))
+#define TEST_F2FS_IPU_UTIL(val)		((val) & BIT(F2FS_IPU_UTIL))
+#define TEST_F2FS_IPU_SSR_UTIL(val)		((val) & BIT(F2FS_IPU_SSR_UTIL))
+#define TEST_F2FS_IPU_FSYNC(val)		((val) & BIT(F2FS_IPU_FSYNC))
+#define TEST_F2FS_IPU_ASYNC(val)		((val) & BIT(F2FS_IPU_ASYNC))
+#define TEST_F2FS_IPU_NOCACHE(val)		((val) & BIT(F2FS_IPU_NOCACHE))
+#define TEST_F2FS_IPU_HONOR_OPU_WRITE(val)	((val) & BIT(F2FS_IPU_HONOR_OPU_WRITE))
+
 /*
  * f2fs-specific ioctl commands
  */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
