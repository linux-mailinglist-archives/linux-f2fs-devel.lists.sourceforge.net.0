Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA81E636613
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Nov 2022 17:44:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxsrR-0003nN-1H;
	Wed, 23 Nov 2022 16:44:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oxsrP-0003n9-OW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 16:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5BuKWrKR5jYRhSucLIT5VYO4TKn8i0Ezryo9kyMfzno=; b=FFAdze+pHNFdtV7rYkcdILPlLX
 6xm7daxrhMlCVwObIJ1TiO36QVkf5I3OGCASZRyW/gKd0/4M7MbiLQPYX2g/ZMNmKl/enZTCDhf0m
 ngFuVbN8q1GMMakOa1ILqnLGX/AehSUQarcgYzb1aNsFSoC2/kQ2GMvgvNjKOHMD1oJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5BuKWrKR5jYRhSucLIT5VYO4TKn8i0Ezryo9kyMfzno=; b=He0gZ2maOIbdHiHGIliL6+Mza+
 0xucftGXX7rCcbl6bgmMBTsorIAYc9BSRIjMmD5BSNjVvwg9nZEWdZBjg4P9VmCjJyio6pKaIlBuu
 VhHrmRxqljZdpbVmW4hIBnzUWTnH3c8WN6F5WOaEqs1PEFAmE2nmEtVc8RCNlv72V14o=;
Received: from mail-psaapc01on2131.outbound.protection.outlook.com
 ([40.107.255.131] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxsrO-0005il-V6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Nov 2022 16:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyuXd/UGZCoPmLJK6f9mii2nNGoMipGuMBNz8hXN9841nDZYgwXNmRw27KqiDFzyedNoEzgTF4SDDzZOYpQ/DA/s7TRrLSg7g+nuXwo/B7V5VabVfLL4SGqN9Kd/VZp3i+MQNhgcoAxI+Dnhbbd0YTuHtBzhyllDhDO1Ur/YqvP2LrXmupZW9tKb9jZBXXPYRAW2wG4M5C6QbjtxUAkbpRvxTIi571yLOfpmNX64lab0Edvc/GvmoBrJCBDnCfpuZzJyeuOzTiW7w6Lq9m09dVKzxXQbI8TLJHWfWILHTBchjjelkqcN8k4z5rcWxHllxUCW22YL0xgq9ezqSyl4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BuKWrKR5jYRhSucLIT5VYO4TKn8i0Ezryo9kyMfzno=;
 b=anSh9Dtaui0pTtIkrnhiY+3M8MYFM3Nx1KCYmvziqXz++3papB1JdGJxjUL8Eulk/gVWSQGeIiOZM3HlEsooY+G9GhSKIM1Lv0EWsfaV1Qvsle6DlWUuoEe3x6MaHa6PnUCDNy8GGETw60r7q7rq/5SIjCjuKFGPmq8Y+1A+tuXEGliZnVazPJNwtTTctnx7Zncc1RO/1+GkKRt10W/4mDalFaJ4/RAfhcvr/AC6YYUN2LBosRwr46XeSvFNFsmky2nsfaVTJMjmZvbXUcoq+cLSfe+boXCQxrY7YorSQj9xRnHs79+2eNmebjI+yj6UlvndtLHkqMEebtyK4cESvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BuKWrKR5jYRhSucLIT5VYO4TKn8i0Ezryo9kyMfzno=;
 b=IwCs67mhZ8pfI003N3JY9/WRLShfG8rYVsMI8YE6AXQgX0dqYkE2LMgUFQrOh1b7wMkvL1dx+Hmc7PkmVgqnMrLoTMhPmm97NORANuyjh23BCmIGltODvre/wbvXqaJiyifA28/4ZklameZ75vp2dVIdNqTlDdfRYf2udCKTDAF56UG8NvakdBOF5hKH+QBftO9rHduG3udW2A+BSJ70RW05taSJVRkPoRv/sZ+AhF3Vj0ZFG86yflRMil10f4MbMiOdRdE0dmk/tWFlsVAgXC9+WZa0kst8HAc/dEEYyUkQem1EcFLuqcCrOB5oAxzGqNF81NUIYv6dTtbbwCTC3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5950.apcprd06.prod.outlook.com (2603:1096:400:333::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.8; Wed, 23 Nov
 2022 16:44:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%7]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 16:44:14 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 24 Nov 2022 00:44:02 +0800
Message-Id: <20221123164402.13849-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123164402.13849-1-frank.li@vivo.com>
References: <20221123164402.13849-1-frank.li@vivo.com>
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: eb6e2629-dcc9-406d-d275-08dacd71f46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AgazdcgZ7b5yaMhRPULo3JhmIsni17STqZjOHkEVCJ4hgiGPSkERjycAKsLOr7tZUzsuR/XudzRi0Xcmi7z71QlzzQK89wpFMp5JmVtpgM25V94GxKoc1aLwlA9PP4BvCGp/eDPVbJ8IUTLZCmj7LLgWcc1mIcNwOHL4FcC9fBryql6ObcWC2PTvfB/5+7024h+1QQVp16xPNQi0m5scaCUVlkYOvPPfuiJTHG7rCV1OqrvGu8ylZNu7F+7ltJyXE3o1pkhIDctAqW/Qis92bio5XFtourLLQpV4AEPCFDspiuUVQStEAyGR1melTdrQWfCDVx/hAlUZ83lOCLO+QrSnYY4k4OSKccQao8qiQ3knpZb1lghkQM4o/GQ4kUQvZu7UR8Z2Y8PeVT5tg37gC3AQrL/QGRAxjpqax3IvkgFbKkU95g7TbLwAiOI5KIYUPQPyCT+ehV+mo1pOq/u8Uj9icY2F8OidUAPWo7oX+97em4dBo3OvUHrD/YCFvFhGblodePkTzJQ/xkya09UsMutUcr58pJkKBR0JDVion1DBlMPw24aiL+DWSg9V5W/mXqRUcwje4Jga22OLAUsC1ZVL/c4K3nv0VkCSD/PnLBDsoKQ5MweWqVhR8bVzaJC3zZZU0J24L5CQL1aGUk7uBhAOKAZO+5i+F7x/zSgTDE5zI7Uw6My6fOOk3vn/cYLa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199015)(2906002)(83380400001)(6506007)(66476007)(36756003)(66946007)(41300700001)(66556008)(2616005)(1076003)(86362001)(38100700002)(6512007)(52116002)(38350700002)(5660300002)(4326008)(8676002)(186003)(316002)(8936002)(26005)(19627235002)(478600001)(6486002)(6666004)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RozpiDco9OGMnuz655u9toPxfYVtOKW6L/2IeW0e21dZZ7KPpnDMnWb3GaFy?=
 =?us-ascii?Q?GQJSh0InhApz2PGfdhB1VL0OP8jszaGMSHcHsdB+Omy8RQuoWeP4cqUb3Ny7?=
 =?us-ascii?Q?aoMz+Bdvdk0HvDTZ6JGeRgdQNX4tjWJK9hIE/TZ2H5pqynmj6X8tyB+HjSSD?=
 =?us-ascii?Q?y6OcK2yR4u/O0amWdgABabwayh32twWsSkCdmW5vq2EsnwJvk/j5oL7ICIJo?=
 =?us-ascii?Q?XhfvBZwIg0/zKaCAGXNzykt+ZjL5tMXj2TsOAFpxBDHMEMZ5UXTCGONjkrhn?=
 =?us-ascii?Q?1KfWQKkKlD/5lt+niVOiKaHdlZ2+mT7bh1BYq5MhizliQUX8ks0NYS31A55Y?=
 =?us-ascii?Q?K+y66MfOVIjKc3Pbx9RjtiEuPwOJW0YghNPd/Gg4Sgy9K5uam2nF55nvLWff?=
 =?us-ascii?Q?rYCYXuzO0IWk9kuTIgexM3/J54PNqgPoF3hPzwB4hMglFuJLBDJ6p1V2oBHn?=
 =?us-ascii?Q?KVL8ggT9JEFdmip5Ai12PKsIuyVxCGsvZO5IdA7ytQNjkebCX7LJCxtv6kwk?=
 =?us-ascii?Q?EhhwmkKmYK4tCEKdEz2EkrByl/GdN9M8QPnaMp8IbUEjrd9N8i4h+fj/Mm2w?=
 =?us-ascii?Q?FpT4IPkNGZbVP0krwBl4Gd2+BPyYVQFsX3/hzQzEy0Dqzeg7z2cYvIM4hwJX?=
 =?us-ascii?Q?3VBnPu8KkYL78yWhp3uHAd9uhqb1SRnQgeVaWg3XJ2QZOzKKR/mXDzTjL+Oa?=
 =?us-ascii?Q?Ed+BlJfg8L6mW0j4FCBuFJlpNb6RL8zBZQUTKTNgP/Hwoj0sZIkcezVzDuUg?=
 =?us-ascii?Q?Qsarh7A+m+6dabwF8WYKCfobAxOdaBd5AuNx91t2ocWlzdirS2rbf7YLeYSn?=
 =?us-ascii?Q?BG4Q/Lju8sRIs3QtQuZUtCyba5ZYevBodKJr06/xm+3PmiLB40L4KguiZXew?=
 =?us-ascii?Q?rgOo5J6d9ikU5upuU51sV4AgJgjUQYFWa3TZYrfRrRDKGxWt+yE9Xo0jjkXi?=
 =?us-ascii?Q?wuRrtPDwgjw4x3nN5IilVw0BThq/ZxvkfEH3pwAGlBvLAMRtuTuJ0+ARTjoN?=
 =?us-ascii?Q?qzWWCdcNHuex5grXmdnO5VibctcBlE7FML0lCoz2eInlNnceAPcMzM7x/Vgt?=
 =?us-ascii?Q?CO2fEhoLtmdqqBk0w1UB/WgShVomzC2WO8amYSYQ9hnuVGbTtfGiZ82L2FMW?=
 =?us-ascii?Q?MAPhqybXZ1Cnlj85eGp1qj0dG8K6IkTcgn9mtem59ee5vr6BV6rhtKst5kfZ?=
 =?us-ascii?Q?Egl+40geHkPFfGjSrKs2NyHDUtVaiPJ5hj+lOjSl31DcpAQWDfmM4d/QKA+V?=
 =?us-ascii?Q?DzoHyngcYQsnMOZgGP1/kDaSUVQcEvN4mLAB0KHWteE9ZpWzD47g6W0gbCe/?=
 =?us-ascii?Q?KsbOWWUTCddJl8sM2DVcMsCVayuXLgdin9UqZLMQOmGPYi85REASY7trS1Nd?=
 =?us-ascii?Q?FGwbnd0cdxLYn9DYBQjPgx5Wu/LO6WcqKPV2iOoMqkUMAOqfmKmuuw4QUoHc?=
 =?us-ascii?Q?knfYdHzVSxUeNGqLVuYz6EKMaG8mDpXtXcp84XuWnPsh7viwVHU5kIFz0qeo?=
 =?us-ascii?Q?ApNTmI0TRPbbUTmC5Dz6DK8LU1fw9B4Y8vt7PS1EMbpPRpgWz/0tByPR87H1?=
 =?us-ascii?Q?xC6PV+hTYe0hS5qCo6Ic2mSHPOQVl0Kzahoa3tvs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6e2629-dcc9-406d-d275-08dacd71f46a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 16:44:14.3548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nN3xly6AkNwxfH8FD/BimiCbsN56mrmKwzHrmQZXzFABH8iHfQfTibyOh5J9LFrljsAxj1er7OzOdWl1tNpNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5950
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Through this node, you can control the background discard
 to run more aggressively or not aggressively when reach the utilization rate
 of the space. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 8 ++++++++ fs/f2fs/f2fs.h | 1 + fs/f2fs/segment.c | 3 ++- fs/f2fs/sysfs.c
 | 9 +++++++++ 4 files changed, 20 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.131 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.131 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oxsrO-0005il-V6
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: introduce discard_urgent_util sysfs
 node
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

Through this node, you can control the background discard
to run more aggressively or not aggressively when reach the
utilization rate of the space.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/segment.c                       | 3 ++-
 fs/f2fs/sysfs.c                         | 9 +++++++++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 24e7cb77f265..c9cd9dbafdb1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -646,3 +646,11 @@ Date:		October 2022
 Contact:	"Yangtao Li" <frank.li@vivo.com>
 Description:	Show the current gc_mode as a string.
 		This is a read-only entry.
+
+What:		/sys/fs/f2fs/<disk>/discard_urgent_util
+Date:		November 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	When space utilization exceeds this, do background DISCARD aggressively.
+		Does DISCARD forcibly in a period of given min_discard_issue_time when the number
+		of discards is not 0 and set discard granularity to 1.
+		Default: 80
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4694b55b6df4..296683648d4f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -413,6 +413,7 @@ struct discard_cmd_control {
 	unsigned int min_discard_issue_time;	/* min. interval between discard issue */
 	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
 	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
+	unsigned int discard_urgent_util;	/* utilization which issue discard proactively */
 	unsigned int discard_granularity;	/* discard granularity */
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a993211ded1d..3029b6b08d02 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1069,7 +1069,7 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 		dpolicy->io_aware = true;
 		dpolicy->sync = false;
 		dpolicy->ordered = true;
-		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL) {
+		if (utilization(sbi) > dcc->discard_urgent_util) {
 			dpolicy->granularity = MIN_DISCARD_GRANULARITY;
 			if (atomic_read(&dcc->discard_cmd_cnt))
 				dpolicy->max_interval =
@@ -2085,6 +2085,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
 	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
 	dcc->max_discard_issue_time = DEF_MAX_DISCARD_ISSUE_TIME;
+	dcc->discard_urgent_util = DEF_DISCARD_URGENT_UTIL;
 	dcc->undiscard_blks = 0;
 	dcc->next_pos = 0;
 	dcc->root = RB_ROOT_CACHED;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 33ec467b3772..a4745d596310 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -493,6 +493,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "discard_urgent_util")) {
+		if (t > 100)
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "migration_granularity")) {
 		if (t == 0 || t > sbi->segs_per_sec)
 			return -EINVAL;
@@ -800,6 +807,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_req
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
@@ -930,6 +938,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(min_discard_issue_time),
 	ATTR_LIST(mid_discard_issue_time),
 	ATTR_LIST(max_discard_issue_time),
+	ATTR_LIST(discard_urgent_util),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
