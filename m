Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BCB62EC72
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Nov 2022 04:46:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ovsKr-00012Q-7v;
	Fri, 18 Nov 2022 03:46:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ovsKq-00012J-4A
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Nov 2022 03:46:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P27gUcgchWI1EXxuOHqcAXjYBvqOWIRc4rP22mKFu2Y=; b=Wbt8mnzDv+r00KpTlHvvtddIoy
 miUSe11AJ2DzqX2Rg94OT59WssiZaBk1OEfrEUAGR8BJ1t1lw6yBWZSJyjIcl6GejE4JnZIZwoELg
 K6Z1wT38sjmf4OFw0vSLS17tZu4wPC6H67x0QIy7vaWQ/F7eDU+pNONewBMXLWBJe0LY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P27gUcgchWI1EXxuOHqcAXjYBvqOWIRc4rP22mKFu2Y=; b=E
 8Hz8bGdhNJovyh/g6lu9POUHTgVWxysxtWlb7t6wwMWagr8d0zEgeBtLuDuuNN6c3ApxlfPNeq91L
 BKRzdDXNZj2m9QhkJ7LlPNQdg45gfSE8Wz3iRcWl6DFIs+aOuBlHVmZ81BPnwjlWS3Pmfw9aOupLV
 ILl1BhmYjlZnX30I=;
Received: from mail-tyzapc01on2127.outbound.protection.outlook.com
 ([40.107.117.127] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ovsKd-00062m-Sd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Nov 2022 03:46:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6bs6scWFolJjK2d3u+ijT8NrYaDNYsUTlWrp8A/0wUfHqu8RreEGnHSnzlDY2nJDH19wvpW/DHKoiA7FXQ52kKr6L5ecoX+MBgDz2dgyF6wO2wi72h6zVlvsz8BNf0fJwlrqnCaHogSw633ls8ypY46lcXkuY0wZ3VBE5T4UF+uJ6fUnOsgzulmUzV6LL54ESQOTC2+NKtPx2e8p5zpFFjhOK+RD/ubp1w2vOKwvK9rRFhlyMqubVX38Aa51sgAkvkhv5QYc3D1yTPI1MTEwTvutJIRjUHdvs4EHEXmFR7wfsVcJlWQoJ1H7JSXcvnbMpaN/Z3FSK9EeGbuuRFy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P27gUcgchWI1EXxuOHqcAXjYBvqOWIRc4rP22mKFu2Y=;
 b=UcMu4kl/JUnvCzzNnyt/qCpa2/BH1JnEZPZfTmkCF7FMbhCp9w4txg3qbtKdnbk4CC9EYm5iDkPwhxVwbfcq17hNiFrHt7jhqiDs2uLkQnhnAtAIa3oAp6g+lzjwKmwiVGHHuaCmmk6IxpFy7/f0UDJZ7eteTsNyzCAyfq6kDiq8BZQTiQ/vU1BZowxndD58M+CE3MZMtXX7nKyZE+cdFVXlUO25+Wma/L2+hFAjMPXjUGOUiWBPdRM3LqYfj9n/b7RW2nLMeqSgq8hV9T3PJR8JMmiNIZiK9dLKGAlUG3YekpxDqArICcbAvBjLS1L83wneEtxchiVpw0BxR4rkrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P27gUcgchWI1EXxuOHqcAXjYBvqOWIRc4rP22mKFu2Y=;
 b=AQ+FpNOtU69H1yU1Om5kN4w+yqKpVxnpTbu+ExvaGGrGLKLpu7FLmppP+sRl27mmwy3uSCcuA0v1dj6XgmYQQnLSZtyvXAGnkq74xHRIYi48Hgcvgu/S4zD3zXadL5o1U+nW1d1Gu83jXSec8CN/3LCVbinPmH40p92yYdS9pkF+EdNMXdNr/3tFvAT9Zi2Li/2vZ9cVxPxujKXF1HaOjrLn6dr4R8DVCLxZWwwlpZbN3xWdELca8mF9fHuaJOA48Ey8GxyPqLsXrtjdE0ZkFKXYGByym0OlTdKpYxP2758zy+ZiqzpUJM7SEcSb7L9CBfTWN8xDJDC3KITWNiCdzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5204.apcprd06.prod.outlook.com (2603:1096:400:1fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 03:46:12 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%9]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 03:46:11 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 18 Nov 2022 11:46:00 +0800
Message-Id: <20221118034600.59489-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: fcebb4ab-c966-4e40-9cdd-08dac9176e2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvA9t40Yp5XeQwSCDvWQvuF3LDJIC0JBjkKhhhFz3c/V/J6p4W7I9dCXkTvU26crQc5LmOZVWLcBdYv/weP/himiopo0F/CEaOukfdTs2g51NgGWOtQMaix16EZ/V10aRt93prU1LI8muxOZKWkdmmgATW61/TG9Y4ezPrgTbrTW0wQso0FqqpfEbqag5l2JR4QnQmR96NScxa5i8yYx52DEJ4gWdPNmKIEAEp8l2qBXw/hc9s7BNs9ap9GxFsdq6b9fOVCxM+U6jl3UkOVMgOiWRXjLIICZCHFMHKBTa0EaIpSm+eEgJM6fM4BZt8BGH30c6FDQmaKwHjnawsH556biT8iPXIhWlo/Buc2fNGoFPiCAcTVRnjaUeXJxc7ibKMAH5CY/8paub6tPNj1u1VONweYl7W1PYKAGt1J/XggNczR7A6XRSGh03I9Qh3UFvg5z3szrFJWdnrkXfWu3MH2zJTCFyft5o4X4S9MDVyUj6pxsG2kbhSaKVqrsbs2/g6sdY3JcZhwlf8rypAPNqywCGPYW0M2NDai7Uso6F2V3pC6h+KtodFWhdtw0doCUPEU2qKrA0t9lZfGjk8jhkD1chkFue2QyEqwbqL91BPscc3EYytwVJCbLsmk5CTqJTuJV2Z0mRjRujv9KjJLPJGY2cunpeNm3hxu8dIett7W+zm21AMUbizqG881tb0aX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199015)(26005)(6666004)(478600001)(107886003)(5660300002)(6512007)(186003)(66476007)(41300700001)(1076003)(86362001)(66556008)(38350700002)(6486002)(4326008)(2616005)(316002)(38100700002)(66946007)(36756003)(8676002)(52116002)(6506007)(2906002)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Wvet8/UTZAKNB+n0e0mPo0ooJPkhGjwTZt674hQyG+n8yJJ4omZJRgYxo0G?=
 =?us-ascii?Q?Q60wFbqXsONsHEi7FPMp5aLaSmLHPCuoWvsa0XxHwqz0+fIW51+DcI8dx8GW?=
 =?us-ascii?Q?QGb5gih2r0kKBwQQNW3qBNZqtZGreeuwBXq6X08QE3mprAGUcHE3PZpXyR40?=
 =?us-ascii?Q?J3DKp1roAQTIhGMtw4RNpVe6TRA1Yt0yyj34TY9iY1vcUBPKfUUZN40IrALQ?=
 =?us-ascii?Q?saNpPlm/KuRLIUqYGt3LAlOo2bPr6ogCj3lcvf7nXgGL/tuMcLBsNFlsnCaF?=
 =?us-ascii?Q?+AiDyKbb/oxC/j95YBaNwCRhLhykgviqFUoTVpF6iJYfcQtFFPLui65oV96p?=
 =?us-ascii?Q?Vgl9XGa4zFXAdtiVU0F1KCnu5T+4QM/tQKVeHVDxz2fM4ZJ+0SlUnf0MquCZ?=
 =?us-ascii?Q?OsgxKS7AdAPVN3hioQ3mtYNE55GV84MByWEAaRQJ4+uMel+q4ZL3Q4FoA6Js?=
 =?us-ascii?Q?uN+4z6m0KLIxcDqMuyH/SoeEpl8f3fbEQnbAR5mTycRnn5/J9zXW/duE5ZX/?=
 =?us-ascii?Q?75kfP8y96WPvOb/5kc0YcTkpAVfN4EsQXpUW7prfQpb+cXFeTPFzrVn+Bwnj?=
 =?us-ascii?Q?kTUoCIOKYLno7t4SoPAb1wpEFzB8pcclAIT29Vn5WmODwIWWzjwfTTKiV0E1?=
 =?us-ascii?Q?L1Z3H0xMIqMhmoDWxNFaRroQBXLvljeySws7i+ONWckwWTKeYMyPMGz+bi/m?=
 =?us-ascii?Q?TWqW3nrq1URp0t48G56yx+BeXFwx9P35XJgOXL395JWddb0EThvDJXJRJJdM?=
 =?us-ascii?Q?+w5X+NbCLQ1tQI3fq8pDXwbCq1C76NEJI4gYTdGLxUzvrWfxGjrAKU9lBBeY?=
 =?us-ascii?Q?gVeU70uJzdB8EQyeLwr7texJS/RQe8DmLkWJZhaxIl2aqQhWT8VwZuv+vHzf?=
 =?us-ascii?Q?TbXbOF2o76FtpXRj6h0mc/tvro3AndzyRvE5kIDa+8mh8rM3AyhktG9fC/Yl?=
 =?us-ascii?Q?dTZ2mshqAaUzCSXpnPHD7dxdenCuy4ZDOJcvQDYfhhXJ8EjWJGEvEBUWgWaE?=
 =?us-ascii?Q?DOKZYHGDvev1jtMaWbCF326LGn36G4sdNXkzliQT5M42poBIzugKEe46fuD8?=
 =?us-ascii?Q?fPL3lhi9TGSP0qDn+xa8TzN7P8QFstXWR8IB0GmyBB41Cu78Q+VIKdgGsT4W?=
 =?us-ascii?Q?n/NuifQ6qYemUp+r05jE+yS837cMJO6XqDu+mFw0N0P14Z79uoQ9cmRHIoR/?=
 =?us-ascii?Q?cyLqohdQ308iASlo5VqlwLTULaX5+c0SocPk/NhUI3v3GTOnLXAtsM1i/++b?=
 =?us-ascii?Q?uhVrFv+9YgjTkzBY9h2R+zLUPehR5DeXXfOxEi2ypJoPUfYIZC+35XRkL51r?=
 =?us-ascii?Q?aBt//xdOt6GEYmMIcPvMBQ4nGCpKaD1myWOw8/Cl/YeFMSNTVoOS74P1xgk8?=
 =?us-ascii?Q?SVmxwz9Y+f+3rQ+w43K0kaXgGMKNC61g3sdnuofhqkhFOCEvz365LUwmOMKJ?=
 =?us-ascii?Q?aej5zZYiUt27W9Jo+i0+fRI4lQk33yh99DMnNs2we00040KrvaelbvZhyx7h?=
 =?us-ascii?Q?0u59rzroDdcWasyp7l2J4YOdIsGp//d/WLGEW3TsUxBO3QDyBYMQgqX492RH?=
 =?us-ascii?Q?jPxqYcwB8c/z7n3x28rfmWokPrENoi/pixpoWA2X?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcebb4ab-c966-4e40-9cdd-08dac9176e2c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 03:46:11.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: agMobD3064iYJ1N3zy6r5b8uLzRrCni+Xrc+tuKMltbsZ8V3FaTf9daxBWBm5CAe2ScX5HVmT7txBi7PifksBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5204
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Under the current logic, after the discard thread wakes up, 
 it will not run according to the expected policy, but will use the expected
 policy before sleep. Move the strategy selection to after the th [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.127 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.127 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ovsKd-00062m-Sd
Subject: [f2fs-dev] [PATCH] f2fs: init discard policy after thread wakeup
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

Under the current logic, after the discard thread wakes up, it will not
run according to the expected policy, but will use the expected policy
before sleep. Move the strategy selection to after the thread wakes up,
so that the running state of the thread meets expectations.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8b0b76550578..609e90aa80c2 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1685,6 +1685,11 @@ static int issue_discard_thread(void *data)
 	set_freezable();
 
 	do {
+		wait_event_interruptible_timeout(*q,
+				kthread_should_stop() || freezing(current) ||
+				dcc->discard_wake,
+				msecs_to_jiffies(wait_ms));
+
 		if (sbi->gc_mode == GC_URGENT_HIGH ||
 			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
 			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
@@ -1692,14 +1697,6 @@ static int issue_discard_thread(void *data)
 			__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
 						dcc->discard_granularity);
 
-		if (!atomic_read(&dcc->discard_cmd_cnt))
-		       wait_ms = dpolicy.max_interval;
-
-		wait_event_interruptible_timeout(*q,
-				kthread_should_stop() || freezing(current) ||
-				dcc->discard_wake,
-				msecs_to_jiffies(wait_ms));
-
 		if (dcc->discard_wake)
 			dcc->discard_wake = 0;
 
@@ -1713,12 +1710,11 @@ static int issue_discard_thread(void *data)
 			continue;
 		if (kthread_should_stop())
 			return 0;
-		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
+		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
+			!atomic_read(&dcc->discard_cmd_cnt)) {
 			wait_ms = dpolicy.max_interval;
 			continue;
 		}
-		if (!atomic_read(&dcc->discard_cmd_cnt))
-			continue;
 
 		sb_start_intwrite(sbi->sb);
 
@@ -1733,6 +1729,8 @@ static int issue_discard_thread(void *data)
 		} else {
 			wait_ms = dpolicy.max_interval;
 		}
+		if (!atomic_read(&dcc->discard_cmd_cnt))
+			wait_ms = dpolicy.max_interval;
 
 		sb_end_intwrite(sbi->sb);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
