Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CAE60C405
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 08:51:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onDm5-0004wo-Gl;
	Tue, 25 Oct 2022 06:50:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onDm1-0004we-Tp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pysNbN8VkIYU1DHkLWkHGGdk2yU2bixq+963nWnPWhM=; b=BHNwtRBzUBbSEWSXoyvAu+l6Ah
 ex/Uj8Ioz16oovCoOK4+6oNre0EJKfCwpANc/iu7sPFDDKTUFgcUyCutmxts4SJxwqrRLIKCKEG8r
 W0FU6yKkdndNSjmwgb51NbYmnopcfd/C6F2HBj24TlE3az5nzTue2E2M8ne6anEW5ZCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pysNbN8VkIYU1DHkLWkHGGdk2yU2bixq+963nWnPWhM=; b=I
 jfLpUOpTCu6UV16oQaEE+0pRjVdCRoF76UXGK851unY4+SoNrBseXclF5wL9bI2Y0VKfemtnEE5Nt
 1SUIT/9unTdNGSc0Ks5RYG9SDQIGzqBEuLkH/IewYg4DMWLvJSphehROKCxrrn9J0j2qS9eYqxWcl
 TaMst05Bc+w7u/bU=;
Received: from mail-sgaapc01on2094.outbound.protection.outlook.com
 ([40.107.215.94] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onDm0-00GZSx-Ox for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiK2NTfpgctk3RV/hV3PQ2v8yYdhdJ98/QPmuzWKVMUX3yljjP+ryIL7dvZAPMOCXISscGL9Hz2VTHnhy8AAKIg3LUgA4TuZ0PXacx6EFqeh0PpEn6NHnBnSXQMM6mC4yUpZX0m6nITQ5MFgDFDDpJ8Gmpzv9k8ypm1WMwNZkGy+XFpFj5QwSxmMu9BtI7yjpaQ789w0WxuOHcUX38Fy3QuB9iMrSjyTAb+Hkwan6pn2vXn/s34PEMavhcIn1MjjaimTq08QLQKNZq0cwzGam4NY+3DmO92RYvWZomlnKyEkZq8DpnQzTy0kqawtnb52oBdjXnz9TiYEr/9t+515Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pysNbN8VkIYU1DHkLWkHGGdk2yU2bixq+963nWnPWhM=;
 b=j2fbZMB95QxcTzoQPhp8ljmrcx04NVgXm2dCE2n+m9IS9pNqRCaGYaN9NjJjrkxdSgggovS/6yiUc5Mvesf/mhe1HYpbDwdEuIlnDWNWR1b1GfFazRTJGIy2zB1Y5M86dYkKYqIa4ru9Wye3GuB1BXMSBlIJRzK4T97rAiL51TyKVob2++DWZhVpsU8EiUbyurbXqx7royayEMfwiaYaGsu6OJMg8ERGc8fRkxn8o1tQK5TTbRvSCJDScwp7Z01QYJ552duP7MjHIeTWZy/syqm0p5TLF9N1Cnc5F5Ij+aBNTBUTzpj5KjYnYnewhqvCCWkDhwqpwhe1HuDZLYc0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pysNbN8VkIYU1DHkLWkHGGdk2yU2bixq+963nWnPWhM=;
 b=G5fo14ZM9ZQt0h7gbCEY8VZ/Ej+xmofIJFqJIk+OBbgv234xul1CExDbCMzGTY/LJkrEyzZe2ysS6iAZLX/lrq2Upu2nQXJHHzms8BKW5N46uGDxMvWW0IxmwyCdSv2v2VQ70yepgBV0/E/nIDfcytuHruh75JcHqAyazTUEcIxS4vM8oobfuNiEJxa+Pt4CypMFb5/IZfdgKbEHK4N5eZtr9efacXQ0jkeY2/DCzm49LXu0ooNhao8ZZpARy+rvZiwyAErGOURiu6+DoajR8z8QaIPjY6y1NAfQ06/iZ0uAZ24n01XyJbcXLCaBrVFmoh5HYaAQTk4vH/Jna2PZow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4144.apcprd06.prod.outlook.com (2603:1096:400:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 06:50:39 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 06:50:38 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 14:50:24 +0800
Message-Id: <20221025065025.35017-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d3b9ec-fd59-4512-2f21-08dab65539e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +SBk8FG5R/a9qTKsWvuMehyFkRR2IF0HKhw74AXaX7ELh7kBEmMUQpO3CpaXC7A388KZmVQuJTrN7pBbXp6H1xzJ4vqwFAS2jiLtqmqLjvBCwvoxisXa99gOAYwTwAmResZXA/YM4r9x6yht/8ZjhnLmQrA3He5us37H9zEohWJdrhEfgLnw0aWowBQp+8t23El9J3zeslqCHfmIjEWjL3vyt0V6z3Z8yFK/YvDfoUU5pCfmZeCp1nk7QSoEj99Yz0eW49Bqr6kFCllW0m3NjynoHRLYZh6Fq/UM/VQSGxPAZfoeosEuqfL3/28fmKv4PkO/hVfn4Yxu79Ii9qmjKnUSqJbaadWosYEuw7CSuD6Wm27g/fYpMQ1o6rEVtNeoLt+WplHVIzWJK/kd2iXT/Sy3BmW4fSmDhc7Mm+IbnL2L1JhOUWPlXnTQ09P3yXWOCpCazc2UuVPzc+0C74OaJcyleM+HpBWKJoB58vEUrICN/hcCS7LIm87LbR9Eww395shGCZfeFwWRuPefbUjAxYLBHNINS6+KxGtImlxGq+O5bGDmBDGBZwrS6d18uZYtTcZvXD48iG8LAQVHc7Se3FQU0JAuJG9p5riRHiwMPtdEFZWpJg7cyTcKKKGDo9MO1t9b3XVAWrg8k4Y07yKVmYSc4TVseYYI6lK/lig1R/Pzf1ZZas2FYTpyylEdNvgf0CP2KmBNCjP+aGcW//0jstiy19O5lzljp1vRpBn5CE59etWjz1411tNIzMPIosQ1oB5jmznrSTbce/dVEn29dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(83380400001)(186003)(1076003)(6512007)(2616005)(2906002)(26005)(38100700002)(5660300002)(36756003)(41300700001)(107886003)(6506007)(52116002)(6666004)(38350700002)(66556008)(316002)(8936002)(66476007)(4326008)(86362001)(8676002)(66946007)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gQao9MpCOpmIC/yayS6K1nxvhQij/9GI7MRnsBcMy2B/Xa58YL+EP1WVOMKl?=
 =?us-ascii?Q?vxV3bb+xTIO3SpeYuHqszSmskenLwj2Nn46pOMb6dt5UcLnVVD0guRcAsyUR?=
 =?us-ascii?Q?dfspyNToB4n+PHNgXSUVeio7vNJXvkMp40Ul0wvfmuxFNIox3sBWTm9rgX88?=
 =?us-ascii?Q?v4fur1EhSDpE29Qaqxn0pvazQijRx8/Z8RhCKYm/vR/CkX7tcpIuoe1iGRC7?=
 =?us-ascii?Q?GvZIldo4VHnWGEeQX83dzccvyatxxInKPuCiOPEa2BS7jjZ4zypwNo3EWZCw?=
 =?us-ascii?Q?js0ccXc3ie1a+vkojkFwqYAvIBY6V53rtPAOccvwdHdzbi9erTrzGNx9M5zA?=
 =?us-ascii?Q?obcFre1M4WXG7knLg//kVOLGFyLX8wqLH8iBnoU4OrDPDIfXCwyMKGMTTeqT?=
 =?us-ascii?Q?6LMB6tSx+2PkX0aKoL7ikCq4XZ7q8kqY27Xbhk8JLyQ/WV+qlNe0a8UmBxyM?=
 =?us-ascii?Q?8RH0KC9zkxOqI2SP/u5EZ5n7SEW+iveXaXGYFc1uU0Fz4p2EN5jisqxyvcUN?=
 =?us-ascii?Q?iQnpTUoR0kMQ2yZPxMfJJh2RYGYHWBRcuB3JrVawAeW9NZkPsTOk5XKgsjsJ?=
 =?us-ascii?Q?FMzJsx4Gg+Ca7YjEoEhAiSnmGSIdK4ckgLSiW3tOQhWJadnUPkbwAyj0JyON?=
 =?us-ascii?Q?FkeUgsBoHHyrb9cwLJ3hoUpsEyCCEZrf3DYR76giNTrr1/6gyO3fQP3bIPGC?=
 =?us-ascii?Q?JYMHquIxDpaiEDx0rrA9y2H1145z9wU1NDQFIA6wLKU0Ii6s5JWq4YwUA75/?=
 =?us-ascii?Q?XN1Pyuw/5qCnzIxp61EbmxKh8d4eIyHK8XjOLnvDFXCn79U/d6bE/WGKsexe?=
 =?us-ascii?Q?evPumHBHAqFR8hcmrPML2Xlz9O03tP9MmK4NzrK8bzMAsudpTycAFx0KHxc/?=
 =?us-ascii?Q?5+/DiRUEXGE6dt4rFb42278Etpxxzj/bHZ+/5Ea8ER0J+Nww2BMzQMr8qW4+?=
 =?us-ascii?Q?oDn8Gb4astwLcjYQXXb5sPYdT/XB+fJvzv0BdLPWjJq4mMNMX+XAA43EVF3m?=
 =?us-ascii?Q?c0sXybYYZxAhrJzpd4deroLqPAyiWryvNjyxWMRK4g/bswM2ymQ/01NFR2Yp?=
 =?us-ascii?Q?DhKWCMWI4pmrEW/Dnhw4yN8D0UOHmfMvrQELF223Hqvg2eJiZx6rgK0883aq?=
 =?us-ascii?Q?kavLT9yeotNDdNux1v54L2cnF7tqFL7vx06+aqg9jlwMMXM3SYLKLNsPo/k8?=
 =?us-ascii?Q?SyQ4+/Jz3S/jGpyY6kwMWHCvcYppGrbMSCKnRN3MGgJO4fhO2sdAjvsivohi?=
 =?us-ascii?Q?Xr6WrIu9fo6pAL4zLu2JRFPQF4DPr2RgeWImrjFeociXDlMw7PtY+K/03ZCv?=
 =?us-ascii?Q?RO12Og3ysIAyi5nBeysN3xKifkycJYDDoT4dHX8jFUxS2uKPw9EehGin2JDB?=
 =?us-ascii?Q?6GJWeXxvKeGaL3hwFrmESJ/NxI3XK9iLRRX9bB4IIQEMpJ/bJJyFcluK28co?=
 =?us-ascii?Q?rJI9sklu2hMXq7nYMc/RQg7NifZGHOkf4DcNRtALcJ+0CzD6n+dnLG+z19mv?=
 =?us-ascii?Q?x3hnB4LuSYK1yItpPp6dcPFg+YLUjPIIiCigaz/EM4qDQN7GU4anFR/KRRdI?=
 =?us-ascii?Q?Fk5rVZDYtzac4WbzGb3q/wV2mVxdzxxZ5jDxSDgt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d3b9ec-fd59-4512-2f21-08dab65539e5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 06:50:38.7861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x9mhJ53lKDjb+N1zBJJlJkYXMWlT5TJLo1ifgfs7MQ56L/+Jj3rhSdkggihPMNdebXAuMkfAzdch3t29Use7pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4144
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Under the current logic, when gc_urgent_high_remaining is
 set to 1, the mode will be switched to normal at the beginning, instead of
 running in gc_urgent mode. Let's switch the gc mode back to normal when the
 gc ends. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.94 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.94 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onDm0-00GZSx-Ox
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: fix gc mode when
 gc_urgent_high_remaining is 1
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

Under the current logic, when gc_urgent_high_remaining is set to 1,
the mode will be switched to normal at the beginning, instead of
running in gc_urgent mode.

Let's switch the gc mode back to normal when the gc ends.

Fixes: 265576181b4a ("f2fs: remove gc_urgent_high_limited for cleanup")

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/gc.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..e0ff99c7e3f2 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -96,16 +96,6 @@ static int gc_thread_func(void *data)
 		 * invalidated soon after by user update or deletion.
 		 * So, I'd like to wait some time to collect dirty segments.
 		 */
-		if (sbi->gc_mode == GC_URGENT_HIGH) {
-			spin_lock(&sbi->gc_urgent_high_lock);
-			if (sbi->gc_urgent_high_remaining) {
-				sbi->gc_urgent_high_remaining--;
-				if (!sbi->gc_urgent_high_remaining)
-					sbi->gc_mode = GC_NORMAL;
-			}
-			spin_unlock(&sbi->gc_urgent_high_lock);
-		}
-
 		if (sbi->gc_mode == GC_URGENT_HIGH ||
 				sbi->gc_mode == GC_URGENT_MID) {
 			wait_ms = gc_th->urgent_sleep_time;
@@ -162,6 +152,15 @@ static int gc_thread_func(void *data)
 		/* balancing f2fs's metadata periodically */
 		f2fs_balance_fs_bg(sbi, true);
 next:
+		if (sbi->gc_mode == GC_URGENT_HIGH) {
+			spin_lock(&sbi->gc_urgent_high_lock);
+			if (sbi->gc_urgent_high_remaining) {
+				sbi->gc_urgent_high_remaining--;
+				if (!sbi->gc_urgent_high_remaining)
+					sbi->gc_mode = GC_NORMAL;
+			}
+			spin_unlock(&sbi->gc_urgent_high_lock);
+		}
 		sb_end_write(sbi->sb);
 
 	} while (!kthread_should_stop());
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
