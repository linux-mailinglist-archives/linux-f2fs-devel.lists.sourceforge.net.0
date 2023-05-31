Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C677180E0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 May 2023 14:59:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4LQb-0005fe-0b;
	Wed, 31 May 2023 12:59:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1q4LQZ-0005fX-SF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 12:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j7q57klvHFJRDrzTnNGmdwk7vQue9EwP2A/Vk/4n4dA=; b=QELcFeQwt3D5BXI1Qm+RzJj5Oj
 ZMseYLTPJnIPk53rdXfWpoNfRsG8X5thlcGMXLbsQ9QwwvG//gJP0yq3fNbiJ+cjuUbEu8fy+wFmt
 TLAl3oQYMcSQtDCNC/cFcwFpjA9SRJyaYhPdlXBD/V+18tmOtfpBIWf8dLj12Y1Zp8bk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=j7q57klvHFJRDrzTnNGmdwk7vQue9EwP2A/Vk/4n4dA=; b=R
 LKR9C9yWuHxirRJfj19J51Bsu5/w1WDcoJ8bXrfSM69aS7kWd0lndSHIDbAyuJIbBO6IDRVS/aluB
 BETgsoDZkfPm+x6XQ+/sUAkzwh4gz3CwneqnHXalPT4M0NkdJdsDqQtSdQfFjO3yfgw5n3bu41X6O
 bURXLQBXpNf8IZmc=;
Received: from mail-tyzapc01on2099.outbound.protection.outlook.com
 ([40.107.117.99] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4LQY-0001A1-Qc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 May 2023 12:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q60DqQZjlb1yGOEoDvbmlEWpkE+fvpw0KytrO4heqLSCcGe7ynGhs2cUttyOyJ+27ZTcpdBecWIksRRmM+xu0fCEheHev4riNB1VQwrWTSVxeyVmi/VqEzB0mAjq7TLo9AKOuPmfHemsfwS+dTxTr+breP3UBXzPz2nJO+PNY6auUa12Q+Vvj2m+NIGhDqLkYFd4TFnG0zWQ9dzw3V7Gc1wWnVSLt8oGTzeHJWtkTPOsRKGKOW1OYTe4Ku6471//VVYOEyCq28gam8MiwMB4UsZg8Oogp1MNDrKXmiTJZnCm85wRhB2OAm5lrVyJrB68eyGiqUxKz6VsaC63jPriTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7q57klvHFJRDrzTnNGmdwk7vQue9EwP2A/Vk/4n4dA=;
 b=kKPuGr1OD8sPjGHap9CV5uj07v6SZtWb3UkjQ5YJoT64W0t5J4OLZNAx2KIpyKUZnV14Us+xM0JeFl7zxBXBRoA1pvxEmdRpYRrZp657MYYVbq2vRkCxdXtUTboaUyLGYn3UpbVi6lIwx4Wf5SvFS2szuh4PgbXwUFE96kuI+upD2u/f5OybgniLqvuEp6+utvMfDvS6Yk0hY/U3t16lpcaLFEhAr7nvEvCS2UajrJEQLNSDcEWfAWT2LUyOyoYLXmg7aCQB7jvez/NXGeERGaXxFy6q5JFDzT6RhinLcQzJLxbIV4u7qxHbTikvX7CWFaPALtD+2lpMSTgHkOoQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7q57klvHFJRDrzTnNGmdwk7vQue9EwP2A/Vk/4n4dA=;
 b=YMYoW4n7ZDX+ad6HPJcmOmY+4wt8oiXQNgKHxLpHjMiymZ0LRZe1+ijghGGT/Ftzfg65Z8Jtvy+FBUPJUh+ya3TsKarjvqCyKVwfv2CG1r7ohGoq+pQ/Qo3F7y6/Xwp4LEKOi3UwwwSSmaPcbZ9lPCPPhnEJYr1gMEql4le/LtVVLVFATDw+tZcsxK+e48YL7abZa8eoUnsx7WbqLVG/4doNUR2qNpanQP+S881B83ydQ5Wd81hOmRHBNb+PpM4OJUZzAPnx3ORh5vF8rYchaj2TizFUIBDdpy435mZ35tgOg7GVApDzhnolOMfwoSKm5cgj5g/nHIunR5bajwvySw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4344.apcprd06.prod.outlook.com (2603:1096:301:79::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 12:59:37 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 12:59:36 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 31 May 2023 20:59:18 +0800
Message-Id: <20230531125918.55609-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c4e5929-f951-4cff-473e-08db61d6e2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G7mCZ/VWH0REZh9DMT4xLkYOEEQBNmQDEeBYb3sXqADIQil3wSpuLiF/2iWVxZDy9SPRBBgU0zr4442SfYk+FQzyxXidATd3ofVfqHeZlHB2Gg/Llr/8feY47tjGcETPiGc1Y/N7xLOhzQZHP/4d62TLOeik7zcsJ9Z+hkUtwei+8aNhdS6lmV6Jgpuebw1JFS8JIEjsPk89a41KhHbAIm4vnG2keNKfoAL+bTqOazvI9o+KJa6m/+bTDl7oWSSTsu5FMsaxATAhFcc6Ba+WXVOgGycKpU4mczlLRxufjN5+EPW/HkxglKMSAzscQvwtX9gt/HnlFDJHagejphpobIqcFwt7vMO3iX2XL/1jzUxkB1XuXnNxdjTxDpG1Pdy0i0pgyo8lMxYjN3XKafSmQ/yR2BQxi7ltAwBw+xp/6sV4f/+ZhFxaBIuuNvpV46+UfnQooRQpjLHCCgiJbHPsq4ZYPe7wPdCZRebzD4rBl7LvMWIuWayL/D3w9zvmOn2g47Nzh/3KXXuGiO+qlxjcS8J3dsgeQZ0cbff28v1qJ9YJHX/7Z5s4vzK3ddvPJsG4MEercZD8Z9LPlKdoWPnLuMMrI3303lH9WFooXjVen75u4r9hIfSAEx2/2sfHot6x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(66946007)(38100700002)(316002)(5660300002)(6512007)(1076003)(26005)(6506007)(41300700001)(8676002)(8936002)(186003)(6666004)(38350700002)(478600001)(36756003)(4326008)(66476007)(52116002)(54906003)(110136005)(2906002)(4744005)(83380400001)(6486002)(86362001)(66556008)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8ylf+aBw1Qeko2LC8Dz2AbJh9dKZ2QpWxgvOXdm6vaVa97o9uX8nRzVEfX2v?=
 =?us-ascii?Q?BQpC8N9JwX2Qgs3+58F5B6sLRZRMA4jVKUX+AI7vcu015lguQGseJBaK7S19?=
 =?us-ascii?Q?ZAdjL4G6fqIi6QBLBR3lgf2n+1gzIOLobQXAMEqisIILHZCQyf5iUINRHOBj?=
 =?us-ascii?Q?mc/dDvk6fbInxVceAQ50+ZYMAM+i7bdV+AJ5z2q39jCAN51vVewAEpWjmmHT?=
 =?us-ascii?Q?ZMcWHBA8+EABsLv8kxNS3R5q1T8ej3V5mMSz/ZFTnds/DY3l+uN1FCLghq6R?=
 =?us-ascii?Q?U57wFwkZ9tyTe+2NSTv9OCniHVHIqXjdogdd26tySU4Imw5kR0+URQEZFfat?=
 =?us-ascii?Q?6LPv9dP7cUdLRkbiFoKmrGYx7kZZ7TZZ+09JcX+521CqpYL135E1lX9lWLCq?=
 =?us-ascii?Q?n8nfJv+7r5Zgoyt72VZiwR2c/gQoVqIbGwjD+FW6HUqw4f+VZp9Pb5x9sgVz?=
 =?us-ascii?Q?LR9yWDK+luIstFCLR+4+2YtcpODDAcERWo7njqvkuqGz87I/XOdW0tXbEkSj?=
 =?us-ascii?Q?qnLA98DiCYSMTD1v/XvfTyqp99hTtnyitzne+eKv31Rg6UyTg+640c8Lvw2W?=
 =?us-ascii?Q?9yHDr0lolKCXHb6fQFh+/qTfbMxRbaF7ZWMksC/V6XgFhJam72uCyRloBkOx?=
 =?us-ascii?Q?5CejwOYvSlb460Q0zekEdxIlx6U6/BrdKV5fRmx0buWcxHKWFOBDFSOeWWXb?=
 =?us-ascii?Q?q/Qcco7Qim5iaiSJ1w3VBU2864etXf1ZvIg2QLMpoWU0ghujF38Fve7eVRKw?=
 =?us-ascii?Q?9px9KFC0kSrBgAF7aJDDG8KKgC+8nWNXa/SZb8XXBSC+Q/YopUqgwnUwrmm/?=
 =?us-ascii?Q?1dq8k5MPibHa7yZiZFD14KEeOjd6Rfz8gBu/Q1I+wmRrEecizte1QM3KfKoE?=
 =?us-ascii?Q?NOLPupeFRk5Xnot1lIxUbjTtu8/1xzbU9iajSDwUGGtqV2sFIszU3iCmect1?=
 =?us-ascii?Q?LBREKaQYcBYzKHR0G6vlkgm5wq23FY3zFHTq/VEeW0JcnQaWS7BmwG7s1kfV?=
 =?us-ascii?Q?Q3zb59UkoilRHGaJNeddJ2JvnwW4ZKslAaAM04Mfqt05TIa192ofDcry7gux?=
 =?us-ascii?Q?sMo7txC8nvKM7szlNdONFTtHsmMWp1BPS81uEzRCFsB+gGGFS5VlWDDU6gJX?=
 =?us-ascii?Q?Jgw06R4Xrh0potnF5wPXitteEPh9gGOJWHV8LaVB4y9lBhVtYxOpTeo+A9C7?=
 =?us-ascii?Q?/wtP9hUYZANAI7JGCyj+UiEldrQJTpMRMi1HCEMVPHjrHSQZrUgGkkUG3MEw?=
 =?us-ascii?Q?USIRTqTmW8U+V5+BXXcN0EYQMJgLr8OEMsJgz97XNghU1wGMaC8CUoiIv+Q2?=
 =?us-ascii?Q?Cbw19byqUSDEUotBvQtHyVa6mAUG73l0wlp7M62EZ1gECbOlATDZ7/Mn9JB4?=
 =?us-ascii?Q?n0pe3bO19MvhqQloJR3Oq5qO7zqBvDxAH+M8YEreDuIgvT4OeowsJh6WngwU?=
 =?us-ascii?Q?bWlFwommxPhQLk/kTnEYBP3YCfuvrgK9rWRKTgz+VH3DHTZtgbR6kzWYRFxe?=
 =?us-ascii?Q?VLYcP5DL88KlTmTW3KSXakdgyWLSuY38VuMSwnmwK3niOv2GyKfa1yNvpIzx?=
 =?us-ascii?Q?VhofB/KXjCj72rtF59libcGBb4LjeT2Up+zPGV7m?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4e5929-f951-4cff-473e-08db61d6e2d2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2023 12:59:36.2129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: laIUUAUxyzepBxhQgCElptKy62w4T7L6okzbpZUkdxDQ6SVVHeNXji0rZbk+FgHZkkQKH0HlZSco2pEn0q92KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4344
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After enabling this feature, the read performance has been
 greatly improved: 167M/s -> 234M/s, Increase ratio by 40% Test w/: ./fio
 --name=onessd --filename=/data/test/local/io_uring_test --size=256M
 --rw=randread
 --bs=4k --direct=0 --overwrite=0 --numjobs=1 --iodepth=1 --time_based=0
 --runtime=10 --ioengine=io_urin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.99 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q4LQY-0001A1-Qc
Subject: [f2fs-dev] [PATCH] f2fs: flag as supporting buffered async reads
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
 Lu Hongfei <luhongfei@vivo.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After enabling this feature, the read performance has been greatly
improved:

    167M/s -> 234M/s, Increase ratio by 40%

Test w/:
    ./fio --name=onessd --filename=/data/test/local/io_uring_test
    --size=256M --rw=randread --bs=4k --direct=0 --overwrite=0
    --numjobs=1 --iodepth=1 --time_based=0 --runtime=10
    --ioengine=io_uring --registerfiles --fixedbufs
    --gtod_reduce=1 --group_reporting --sqthread_poll=1

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 015ed274dc31..23c68ee946e5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -546,7 +546,7 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (err)
 		return err;
 
-	filp->f_mode |= FMODE_NOWAIT;
+	filp->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC;
 
 	return dquot_file_open(inode, filp);
 }
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
