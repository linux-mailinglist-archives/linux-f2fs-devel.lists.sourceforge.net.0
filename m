Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680554EF71
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jun 2022 05:26:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o22ct-0003vt-St; Fri, 17 Jun 2022 03:26:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ben.chang@sonicsky.net>) id 1o22cm-0003vh-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 03:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wuU2v+oXoRm/hLHc0Cahp3SbDieJuAqCnaIOeBZOdvY=; b=B399470z3jui/VubNwasvroVyl
 zoQ+2G5x1ztiXsXA+dt/t8cs1MYPFlb7lNQot8chMT+bCYn8ANHFwRkjSbArqsfQv8rBMOf+VJH0N
 c9QANahlUJgp8hm+56F5NL3w/MxDVJnizSJiub+bjVKWwpVUPntyl9BTpMQWB8wPj7b4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wuU2v+oXoRm/hLHc0Cahp3SbDieJuAqCnaIOeBZOdvY=; b=d
 stoa2so6EB9cYR22oUMj5ZkbZx6wy6aUnfGGc0oH8oDNu+dyDuCJrLMxEYTf7VrV4ht3a17hDIVhH
 0sqJypQQvV5wONE65uGAhr5fhpNlbbMlUbfzHaFuwuc/1y5May39FjeoxljTPATxJy0vBc5vVmFSe
 UWW3LCIJsN9XDpmE=;
Received: from mail-tyzapc01on2077.outbound.protection.outlook.com
 ([40.107.117.77] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o22cg-004nxo-JU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jun 2022 03:26:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTv943DnAV6jHJcUABNX/jDOhaincCryTdeJOr7kGMXDE00mJN+39oG3FCnLIuoslSW1IslMQ9O4p6y6xM7IjKGCoZhBnxoegcdQfbwcRbZHu/AJh1hHm3bIue3XL4EkeO1SGiP9uEEfRKhWKZL5OYmI80ub1UNC5RWvT4tHIs/C4+CwSWpjQkrqrbbgUjPTAn5oAAJkJSFKBF4XwtBpto0tidgz4QdoFK4zBEe41pkuSvOhNkzR9gCTeIinFABW44hOhVtiBdO50AiYPv67Q6lG6PYA9qFXqAUrE7NhvNStP1rvpPumLQJHIF5yPwtlJpCJxIVBhLzZAxmkxismog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuU2v+oXoRm/hLHc0Cahp3SbDieJuAqCnaIOeBZOdvY=;
 b=JiGsuALS19ZKWjJMF1O47s7xihVmHirDRT8z4iy0NzfC8KnnTWr8hFHwHpi4xGUVmrn7SLcK5Et4SGZ2LR9V4MwTzfne//miNLxoW3+z/XZilm7UxGwE46niXT2E/L2M0y0xEnxtAMzsk1T4tZTMb+4nZLEKpe1140ab/sojLBTHJxKQ0ML9ldD4C0Wmnc5SUQ1JAYIiQ0iTmnGdKP28HXz1LxH9ACQlOwH1wu0FBEMQtNuq+VG5Vf6y9rEpf/xwS8rxwqpp775VAqD+E43xeyuY5NSduHvGzAkZfbTbQji+BYQ+reySCwEhFC/JleK0Yb/imMrib1LiO1w1PCAcyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sonicsky.net; dmarc=pass action=none header.from=sonicsky.net;
 dkim=pass header.d=sonicsky.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sonicsky.onmicrosoft.com; s=selector1-sonicsky-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuU2v+oXoRm/hLHc0Cahp3SbDieJuAqCnaIOeBZOdvY=;
 b=eJnZN9qLZIKNfObSRISUCRhmGNZLfgo3A/qMDdSQQctcZwNpUPjtStUN7W2p4OxQYgouJ6KTlkCrHq7cCO1QnV/13VPWYx8HW1ZbVj3uZuBKzWqjPVuuVNVMU5sOiFTHT9e8+S7yFd3HkprzbaoBrgMHHmZPM2lusq5QtMV7lFf3KV9S8exfNQ5sjwClUz0wSdJnPEQDoAN5sjmlhpX3ujlPCdS++ezLHu5Yt9yx6nNo7TWD4xKfNrkhhFGqGngbk1aPmN3J+2hwJp+hqfr6AbBQqUm59AzARPE0vTBrYeGBYRF52Tt+8le93Vn/29t1OW7sTYDfy1hr1+Bjrv9/DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sonicsky.net;
Received: from TY2PR06MB3294.apcprd06.prod.outlook.com (2603:1096:404:106::18)
 by HK0PR06MB2580.apcprd06.prod.outlook.com (2603:1096:203:67::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Fri, 17 Jun
 2022 02:52:01 +0000
Received: from TY2PR06MB3294.apcprd06.prod.outlook.com
 ([fe80::edcf:f10f:38c2:8779]) by TY2PR06MB3294.apcprd06.prod.outlook.com
 ([fe80::edcf:f10f:38c2:8779%6]) with mapi id 15.20.5332.019; Fri, 17 Jun 2022
 02:52:01 +0000
From: Ben Chang <ben.chang@sonicsky.net>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 17 Jun 2022 10:51:52 +0800
Message-Id: <20220617025152.50511-1-ben.chang@sonicsky.net>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYCPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:405:3::19) To TY2PR06MB3294.apcprd06.prod.outlook.com
 (2603:1096:404:106::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f87123a-284a-4627-e97d-08da500c5a6e
X-MS-TrafficTypeDiagnostic: HK0PR06MB2580:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB2580135A9838171ED56C100B96AF9@HK0PR06MB2580.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vb3F/gA5ddXNOJ2PsmYGMrlwAR2HOv7/RDUQiFbw6jp6W1ZXnle6n83E8Mmf88nXIx+sQITwztOYrOMSV5EF7XY5iMHdJoVGfm4xilS6FE6LSAx1d7ivLvvadxqw8kYHhxz6fNcLK2+Lbaxdhpr7bAXyqpcCQbnOy7jvANFZW1aIv56BPWevolhCP97FpJl43RbgzEjTeX89L8gJdYItwAdtZL0Z86XTDvVmjD387bapRuRIDsjQ2cQ7JmwnTEXPLjKqPtVY3vef4T1MU3qojYt44S7nQbfwpxw+RFE0ysoftLM4HbUbx/zJYOsq2K7nEpMXISOfcs6dGtrZG5mW+oJjjo0W8J0+znyzePC1lD/bFK6XUHO/DxEv9WbZesFIENPp5dDmENJ3Ijo8a4ERr/C4xtcB98VJxqRdFWORYqccevFJL4t6kE96tUWkmBfY5211TMx0qYqUXxnCLrgKYVVGOfRdKGbAiBs6sNZVkubHx1YC3X/Mhs7LvoQPDX0Fuveczjd9RQPF0kbCNOO8MOsgli7imIyu/qTBsFKTIXNmw+Cjwv8wo3bE6Kz25gpB4WU5enltBmKxPDrfnqDhhhYjTZDtsC/MU9EMCvWF4EyxFGdUd6RuaQIRyPfUWqZETLJQS9zRrWk4zLIZM/oigaRn5otpBl1gGo1/mcttaLoJDYAS9wB8DIXl1BprS/FArKdfC9b/tikA+F5hvmS+xQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3294.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(2616005)(6486002)(66946007)(83380400001)(1076003)(8936002)(86362001)(2906002)(6506007)(6666004)(38100700002)(186003)(38350700002)(66556008)(66476007)(8676002)(498600001)(4326008)(44832011)(107886003)(52116002)(4744005)(5660300002)(6916009)(36756003)(26005)(6512007)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GhpzkMHc3l3EvP9oKi+dIBE7UEuBpwTzzDVBqZDmCI5+tQaSKyPd9gJvZb7N?=
 =?us-ascii?Q?Gf9Q+X/nkT4fxv0J1JV5X6tMiN6rHe5yODSh7jZgFk7P3uK8crUm58kVIWZk?=
 =?us-ascii?Q?+gtRlPXBB7qVM2eyIXBbsQJgYx+t0CIM+IQvoxBeUlmCJ8PwkBgrQh/S7eQv?=
 =?us-ascii?Q?iQxAqmP2wofuPHPpeR0wQD+x9JcLZccu0n9cWfJ0EJzeqo8QXuGE+GkSYXeP?=
 =?us-ascii?Q?27ef8BgBgtN8A3UhigxA6qF0U/wZmiXxHmDtt9e7ZZnXHzGnpm1dp75NIfV9?=
 =?us-ascii?Q?1FCk9sOqjSa5/XROAMBYq7yIQPtOv7P764FRqyn1Uzo3PxpNhfBKcZdDxGOW?=
 =?us-ascii?Q?Lg0keC5XrNIartpCDqiVjQoUrjD4gVgjEZ8dXrEFQPaohHTkU0mx009MUhUR?=
 =?us-ascii?Q?TK1EmW8QUzBMg7zXFVpwmqsfWiKC3+Uv1bqzIicyTllg3tIxJ6fMcU1CR6ks?=
 =?us-ascii?Q?7pXilDEFCnAhZPJauIMacLD4TGw3TYAdN9bvVqMZTCrXr10ecFkCn+g9JUea?=
 =?us-ascii?Q?hFaiBowNzTibSnfF0ejXTtK8KOHRlGVAVznZyfeby5JWIZVWSm4DQbnmVs5A?=
 =?us-ascii?Q?cepyiCi9+HTAXN05/wPhcf/wIQzACo5rEa51j5Xqc4wXI3rhv6xbbBYFmXDo?=
 =?us-ascii?Q?dPCcp7nBwv5PhjYFZuDmETlmfs8nrfV7dfgy5wZKDqUKV7KJTPWq8APu3IsK?=
 =?us-ascii?Q?IWdH83GaJ4OZczQPvCt/ypJCa969T9T6mYAtsQmZn+FikcjsKPKu5MyM/TVo?=
 =?us-ascii?Q?ZMaYqBk3GVbAr3QxRKn/5ovLlc23wsM2LKsqwaiRrKCGjHCUD4O7Eut7ahpR?=
 =?us-ascii?Q?TZSnPdKvo8WfepB1x0qGkh9X4XxiMS9ma+GV7Y767TkdJgeJfXrj5LM+k9A6?=
 =?us-ascii?Q?Y9dF5zYYEsoxrBUtX/ArtLnVP7bkmo+Mo9ncrh9XYmvPHaWD54xbYCOIqwrS?=
 =?us-ascii?Q?/Eij4r3UwY/ZWx8DVwMGY/byerRlMsqv6PJP5WUz4g19pbQbvroulazLOho2?=
 =?us-ascii?Q?pXa/DEpT7ObJOm9HPzSQGIlXHYut5cZdFA92A4fGFpy93cexWJtf3f+QsZtQ?=
 =?us-ascii?Q?Nm4aB7TwEQ7j4MmlsvoepnsoQCWuE4AovJg9l4LtNX0bptHDUt7aFewxlYPA?=
 =?us-ascii?Q?Qy+Slg7KzKQ/eFKud/4ght/iTIJDQqw6ZTLah3Vl9ZSk3xeMM5Ds+75ZYaoW?=
 =?us-ascii?Q?PsKhdMohLNuecR5sDws3oKEwfFLFklt4OwklprCdf3wg7+Typ92skD/PnuTn?=
 =?us-ascii?Q?g3u92IRxGovz75nv747VifU7sI2gjMf+TTv2MgNicTgFZOwl533vt9k+7BM3?=
 =?us-ascii?Q?W6yigmJXFJxTeT+LfyUwCV+gdZzg4SKJ4tb0h6eTuNPMP5hYKDZ2A0sAztIP?=
 =?us-ascii?Q?ONZ8fPkbNBqq0geoOcp8ncR68h83gZSEGW/LySHTrVIVHtcZN4B1hhQ5hRJG?=
 =?us-ascii?Q?gD+4BjWhKCWE8T8p6ByJvYDHpgHAD4hCYn4TAkVW8qFJ2b9LKr6dTYuzk3lX?=
 =?us-ascii?Q?KEieXVDdmfzJO3/8lCWQOhnDfydyWl9MpdhJSS4rz0PM9njqfpcGoxHIC9+V?=
 =?us-ascii?Q?EEZSGARtACKEeXaa//8/P5Ir07qD8FVyXU/adUtJ48nv+4SFTl3iPPnWuSb6?=
 =?us-ascii?Q?qIxjb4VTY5cdJ7CqAoP2zhfEwdyLWjgWtUV3/f0x2bYKnznOsZwrIVAoWusj?=
 =?us-ascii?Q?A1Htq0z+1iuSfg4PRwOy1cu2m9X0YEywHrGWIrzdQPiT2B4h7cmW4AqaLUml?=
 =?us-ascii?Q?Hfx6EUdKYgvA9ZVQdaDfPudyG/j2cTE=3D?=
X-OriginatorOrg: sonicsky.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f87123a-284a-4627-e97d-08da500c5a6e
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3294.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 02:52:01.4644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87bb529d-40c8-4a61-bd69-bd7eb99dd916
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYp3E2uUcmMNbFtpN+c68/pF6I9mJC/5uFuYRhtKGUSPBOEWcoGH7WIFXlDUsdNgI1y3FZOCyOSP+gEgKKyxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2580
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some device like android phone doesn't show the dev number
 path in /dev/block/, but most of devices show in /sys/dev/block Signed-off-by:
 Ben Chang <ben.chang@sonicsky.net> --- tools/fibmap.c | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.77 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.77 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1o22cg-004nxo-JU
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix cannot get bdev information
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
Cc: Ben Chang <ben.chang@sonicsky.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some device like android phone doesn't show the dev number path in
/dev/block/, but most of devices show in /sys/dev/block

Signed-off-by: Ben Chang <ben.chang@sonicsky.net>
---
 tools/fibmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/fibmap.c b/tools/fibmap.c
index 3238f29..9f94b53 100644
--- a/tools/fibmap.c
+++ b/tools/fibmap.c
@@ -102,7 +102,7 @@ static void stat_bdev(struct stat *st, unsigned int *start_lba)
 	char linkname[32] = { 0, };
 	int fd;
 
-	sprintf(devname, "/dev/block/%d:%d", major(st->st_dev), minor(st->st_dev));
+	sprintf(devname, "/sys/dev/block/%d:%d", major(st->st_dev), minor(st->st_dev));
 
 	fd = open(devname, O_RDONLY);
 	if (fd < 0)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
