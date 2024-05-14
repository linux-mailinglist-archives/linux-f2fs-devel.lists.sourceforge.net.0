Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3A88C5139
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 May 2024 13:22:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s6qEi-0008Nh-OY;
	Tue, 14 May 2024 11:22:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1s6qEh-0008NZ-DB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 May 2024 11:22:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UKUeMqKhDmAJm6lCIEKlAHVC9sJOd9Q0r0e3I0j29uw=; b=Cj/cO+EsNreUpTVxpCVwPSiLF5
 TPyq+dzqTJxhq71Enmd/X28fJGlwtYcHYzVLdAffsgjmIoHysI05VnjBFZPlujKqZC9vqUOqTuPeW
 FSIFFte+8vkuk1M/0/g26hRZ+i3aKT1OqFRVUzjinI6w3uWeUmakfJe8xZjkzN6YYxyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UKUeMqKhDmAJm6lCIEKlAHVC9sJOd9Q0r0e3I0j29uw=; b=D
 Sntj4gZHubUtZR91dk3j/IL7Bmt59kcRK6RcCgoXQhGULpB49A4PNK3fwIaLxaPPaONrj1abu+53c
 pQ/7LlJCdHX2IMmY5j/5mOQrvGIon2j2dm4ppIUio0aDZYKjtHZGR8A3TlYgrY91NH+0hG169uIQH
 7PI43dI/eSe8dUnQ=;
Received: from mail-psaapc01on2061.outbound.protection.outlook.com
 ([40.107.255.61] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s6qEh-0002af-RD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 May 2024 11:22:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW72QvCPdg8kp4P+xjxSOYh9IQuvc0rceX9L5xQEZc+b1yTPcYP0crivuFOxFQ/7pH+o18xxmJNg7babzxXZYUwbI2VcGuS5NmGkwq95RqikwLDyvsdQ6L4Ew8hlSyvKHjnqSNlRFdKfsQM4Jk0UJB3PH+RYGBKoXxu0r0Xi2hhOnGcnkICJonvmnhHLDc3511fAtM8IbM9MrRSRLfmjnNVHGxyjwUNv4UShXbtxCjTjzDsyDiYPzMWsAZISOn4Xl2TZW+ruveZ5/Ab2thLg+YzAK/7Fy3PR0I4Tn675adgnAl33ZCieKEYAy29Mn0GeO4j5SdJnwEsmd/rpUSMVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKUeMqKhDmAJm6lCIEKlAHVC9sJOd9Q0r0e3I0j29uw=;
 b=TUP1MMmb6OOCoJ1qz2R7Z82cDdSBscLC0Pm+fYUwR039H10UBD+25r+KrXEl6TRsndN7w1A+Lu+xvFc/izhLskJGTtULfAeoP06jU9zVTj5MtblNyKY6a0BNwHZLHI37zaCsDIV/mlFbxWBB92SaKNMmgUfAqtWeNfwEDIz/MXA2jRCCktYAlC9G7LKQbSOO+cuLkJJ26wnSXcEX265Ehj0q2kseg1KQr/mPEDyFJjt/95yJmFDS6No0HZplpdirhKCXuI8ufOpdWmwxxjjPnAIZOleTpyZvlTk058M/w9zT6Cfl4FJkm1ZM4CkwVhVxAqCOGpi7/ZkQwiWdZpzsdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKUeMqKhDmAJm6lCIEKlAHVC9sJOd9Q0r0e3I0j29uw=;
 b=imI0bcqeABOZB7RW2VRGIuvolGVBDJmkaJqn3X1sS9gn6fJRDfitD08dAE2p7I6X1h8Zqz06sTT0TTxT8c3sv6+K04bktJXP6gCJI4gRd9zGtRwDX2C3SmchYf7aW1Ef63h1XguYQob+bgtwQU5db5BDO2ey9GllGZ2irym4opbiGmrXszo1ztFO1fAlJHRRAeWkKHOyTDXo8i3e2pufw46YqoqG8I41XKEASQSztdNPjWOeE4fUbboTurxImYdjcq7EiD6xsk03ROfFwLYZWyCTCAzfwPSzhoQOlA0HSSHdqSnlp6Ezex18YyEFmMrmz2/FsD3+5onPVUjaaAVvdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SEZPR06MB6040.apcprd06.prod.outlook.com (2603:1096:101:ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 11:22:10 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 11:22:10 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 14 May 2024 05:35:29 -0600
Message-Id: <20240514113529.1498545-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SEZPR06MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6887d7-a4a5-453f-44d1-08dc74081877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|1800799015|52116005|376005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lbiPq0KGuxsTWcUgviXqRUsSGhO4QzIBI6yFs82NYg34qrBrdP4nBm2lYEpB?=
 =?us-ascii?Q?/OARsslySMy8BGCz7i4wdG3PY7qYEVF4JvBcxXir6wSRWemNG9eLNheko2mi?=
 =?us-ascii?Q?xq98q6VR9BsY4U6lVzvfgYTBDSzxTmwuCzanWm0T8Yx8dRccMYmtQvleIVeP?=
 =?us-ascii?Q?FDFj3qvmNr53PwMS+JGVsjGaWjYC5AhK5iGib2sCajjbaBXowX9vbE13c7gh?=
 =?us-ascii?Q?j5XYDIpq5tx2z5H2X5EOKY5WdYjtj1Y9joE6/W/csvz1W7SCFXtmJOIp5RD4?=
 =?us-ascii?Q?5fRbkUrQSeHiAj3SkuB+gr9Mxm01Dsoz2yGqRhD4cknk8dy/8QCulivI0JZ8?=
 =?us-ascii?Q?EkY1thn1BUNFApdKYBJ4Tv8qbqKfL7+B4A0defaWdIIvy8n88Q1F7CF+xDMK?=
 =?us-ascii?Q?l8RUo4eA3NP5nVlMZZaAYKpLu4HdLOKqIPECAOWq9n82H+PyMtnVCYSdAEkx?=
 =?us-ascii?Q?yyYi6wo0D8tkxsZh5+NCq70uPa/tUfVzP88ExV2GUkrlLuIRLP7LPaOMmTRy?=
 =?us-ascii?Q?c+vS2VFzw2tt55g3mOp5w3rZwSctl01/9x03NAJkNuQWyOdoypwW+jA72q3W?=
 =?us-ascii?Q?WBezqDU9h8lAO5VVjQxPAiEzB0UCOXiAnOmvmDzDNIWHvi1Eem2OzlrWC0WD?=
 =?us-ascii?Q?0UTtmxMGSNZhDzrcR/6E3ZFvw9SliU9CRqE+kQHIgOjBGYAHUMCDTL6MuJm3?=
 =?us-ascii?Q?09QlHgbp2I4e9c5pGg3hQsDx2+S977pDmgZ8DpZ5vE+JvpzOnQZp78uCumKN?=
 =?us-ascii?Q?p8NdcJLSduTmjVJtGFd4LEu5W+xYgmgvaa/S4jOKzssEyom+oQDimPiKwlC4?=
 =?us-ascii?Q?ZhPek5Na7MkyTwBKhmPuKwlQlD+SSiC4PBJAFyk6zvIey0ZGlgvfn95fBD7z?=
 =?us-ascii?Q?dnRdQ/yAXxW6A88pT0Ng6p6Nd+JNDpUCA9LqdLLk82hPfb2Pre9PnpfxGXeu?=
 =?us-ascii?Q?v61q4C26VepFuVSsW+a63/H0LK1gJiuMkF8ucorn8ciuGjkDE4odsqLtugW1?=
 =?us-ascii?Q?dIgS0Qu1zpuMWpApoBafXYU0t+6l5mP36ZYjj0Je2uULswyLKWxlvOHwX0Dh?=
 =?us-ascii?Q?FTzAlRQ+XZ0HG6alrY6c65YfM3WiXaENnCUWratQCDpL/MZy/1oXkq21UAuc?=
 =?us-ascii?Q?nnAypwmb9HFRG3YxjVQXFDoyIoEpw+Jf3btZDSbiByXfdOI9qQWF0uKw7XPl?=
 =?us-ascii?Q?iDNn2L5s2+DdltoptiBJO5g/bXwqn5O1I1YDcOuBTEEWzJe6QfKxZt2FD3/B?=
 =?us-ascii?Q?Gd9KdPTEZuk4U4OxdtF4d9mmmwyMUnQUbfnXY4Ec8ykbfUavHzYnbqqPDBo9?=
 =?us-ascii?Q?JcJWYt5yi8mFhqWjQdciBXzufuNpngoXiQi2/dIBwTnEjA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+inaD99V/T484TZzLppljuKX6R/kbuJKP61Ajh5T+hngcVtBPeReJi2esJQ?=
 =?us-ascii?Q?ZWA3AcLZjdo7lRn/uuCbEbLY6U00wkaGkSnDbGJKh63IY/PlxkBntByR+Um6?=
 =?us-ascii?Q?VejhZtije9z1JYh5XFyMnnH40DxHNJddp8EmeVpbc1VX0Z/F/ast/Rj+Nwcz?=
 =?us-ascii?Q?04bY9UWBGEgP5p85g//lpEGOqQc903h2LCNmEysMTC/jT4+0ukaloeltV5Z3?=
 =?us-ascii?Q?xyZPUx6FoZhnV0qBZ6hsvJpW0qfhoCJaE2NBOjs9HzO2g4qmBygGHwQBwcb9?=
 =?us-ascii?Q?zAlMf9H1CmHAnbPx/zWA6mr2JZX6Y4I4s4GIMhEDMrqi5GOfx4tQz+a7uZ1n?=
 =?us-ascii?Q?6lPIplh8RnRVFICmkteAFeUwTuHkmcRlXa+HKQw/MzXgCN/KaYciZDoYj38/?=
 =?us-ascii?Q?vV/rtkKC2AUkTxUFXlNYzNcoWSujvOazn5AR6JlMQgt0h5EAJ9NitUelX+B5?=
 =?us-ascii?Q?7GV62cJ0WtFNOaMS3evL2w0dJwaTimx7kdc9yn4059CQuxJTAcVn7IntB+Yh?=
 =?us-ascii?Q?L4T8u+4PLvLGqS9JEPo2sD26rOh1ZK+7sNzTC1GAGNd+UoTDwXszJXyG01tC?=
 =?us-ascii?Q?fVbG5PgfivB/1Our5MYMOd8bqpv6/lkbJW7ZTizd1fjJidDyZBl9lwivU7jW?=
 =?us-ascii?Q?fbmZjSDinV9UbTWyw34Q4rH20b8NpLF15QDvs1h+DGfYKt+q9coGPOBpv2ow?=
 =?us-ascii?Q?dCbsDCc5bc2e6kI3zgv5a+n5yam4svxZh5mho7Zv19brZWuwgwXdsBKJq2Bq?=
 =?us-ascii?Q?nJb7ts0MA/ZvMwrjBq8jfmMlqZo6JNosEoo5jS7Nn6YTbxLqZRTJvxLELbk7?=
 =?us-ascii?Q?m6GLSDqlTG6Ynsh1n9C6fKveYtKuIA/foA6C5mdtlixUTt5ROD+Scl+joLZR?=
 =?us-ascii?Q?YOSV4Ese0hHHDD2g9l8ogSQTb1KCd7N6bT7kpEbwYYZKe94+Y0Tx7ALuIL3T?=
 =?us-ascii?Q?YVLoe/GMwS7rOIpQh+2XsmZISyBkjHIQx9bAT8vIgPoeOI+WGoHiEQ0ZeLFv?=
 =?us-ascii?Q?UJRxcOZy9AifI1dlLO3N4FA9jFI4Nap/R4sr+2DCHTPn2f6Xmh5yVHbc9R3G?=
 =?us-ascii?Q?a5ZIfso8JFfBEwmvi7IzirU7bENzYYrO4ZEdbk1MJrh2Ep7Ic4PVj/POm3nA?=
 =?us-ascii?Q?jNCSyxOZ35aFg+2ZWoKkRLBDHXQOwtNbPsVVictdEwsKc/hrFkbia0/ydzdP?=
 =?us-ascii?Q?H9Wkrc19nJVmgLiqIxj48KfH7lHif5JQhFQmn2hJCZt6+H/ni6HwyU6jJGmW?=
 =?us-ascii?Q?OnySgY0mxc2/EkremUkbTUGCzH+a2YOKZHPvU8JDVB7Yd4qHY81RDNmJjSHR?=
 =?us-ascii?Q?0gEWOd71GcboY21tixya5bMGx4PdgLFayCeAnIDO7BuA+GmXbZFVOyK41H5T?=
 =?us-ascii?Q?DESV4dlHRLOjNYn1SJNXeBXzZiMC//x0vMSzT8VujRw4noV1Vv2egSgv+p93?=
 =?us-ascii?Q?V3JF0p3UEFDLbmIHRDzUApKOqYfmMsx3KKzayYRqPPkzuY7w1EZQOScaM7Pv?=
 =?us-ascii?Q?BC4vP1PTvzkgMtDXlSgod5cQDw2NfHjyIV/gEQ+zsnO9ubCNCDwSjwmdiEEY?=
 =?us-ascii?Q?MC0EVmE9Cnuk5uP6E5tNajqdkvgn/XA7U3gmv+2x?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6887d7-a4a5-453f-44d1-08dc74081877
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 11:22:10.1047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EAck1yrUI0R2RYffWpvuNp2Nmpwn2+lEjrtY0wzGi3Ir92UmkuxtlsvK0njHQDDBKvzKCLX/B5f4Xu2gklLVTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6040
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Initialize last_block_in_bio of struct f2fs_bio_info and
 clean
 up code. Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 23
 +++++++++++++ 1 file changed, 13 insertions(+), 10 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.255.61 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.61 listed in wl.mailspike.net]
X-Headers-End: 1s6qEh-0002af-RD
Subject: [f2fs-dev] [PATCH] f2fs: initialize last_block_in_bio variable
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Initialize last_block_in_bio of struct f2fs_bio_info and clean up code.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bdbd4195cadc..50ceb25b341d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -595,17 +595,20 @@ int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi)
 			return -ENOMEM;
 
 		for (j = HOT; j < n; j++) {
-			init_f2fs_rwsem(&sbi->write_io[i][j].io_rwsem);
-			sbi->write_io[i][j].sbi = sbi;
-			sbi->write_io[i][j].bio = NULL;
-			spin_lock_init(&sbi->write_io[i][j].io_lock);
-			INIT_LIST_HEAD(&sbi->write_io[i][j].io_list);
-			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
-			init_f2fs_rwsem(&sbi->write_io[i][j].bio_list_lock);
+			struct f2fs_bio_info *io = &sbi->write_io[i][j];
+
+			init_f2fs_rwsem(&io->io_rwsem);
+			io->sbi = sbi;
+			io->bio = NULL;
+			io->last_block_in_bio = 0;
+			spin_lock_init(&io->io_lock);
+			INIT_LIST_HEAD(&io->io_list);
+			INIT_LIST_HEAD(&io->bio_list);
+			init_f2fs_rwsem(&io->bio_list_lock);
 #ifdef CONFIG_BLK_DEV_ZONED
-			init_completion(&sbi->write_io[i][j].zone_wait);
-			sbi->write_io[i][j].zone_pending_bio = NULL;
-			sbi->write_io[i][j].bi_private = NULL;
+			init_completion(&io->zone_wait);
+			io->zone_pending_bio = NULL;
+			io->bi_private = NULL;
 #endif
 		}
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
