Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A2607DD6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 19:47:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olw6m-00032N-8p;
	Fri, 21 Oct 2022 17:47:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1olw6k-00032G-4b
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 17:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Sr5YSZobnbclmXyQ21pXlgXZwokdjw9E2Pr4nbL7zA=; b=A98E9RK6FU0Yc6JUrJ6DaU81Vn
 RSnn9nlcjrMiTeDefyyeeuzIWl43i51C8nuCr2n8ifXiPqWGPQfMI5OtLVpcD4auUcaEF7TDGtAL0
 HWMc58ym/PyxiPi5KF1rDWziqUcotR0H6MHF+d9bcXreE+J2N2rcXl0On0if4RaTXV24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0Sr5YSZobnbclmXyQ21pXlgXZwokdjw9E2Pr4nbL7zA=; b=G
 OzdSPTY2ce42VfIUlyEeAeRxWTfqh1W1ot9WYJsM4khujFnrPjz+R6W/5mFCA0rRUEOw6Nl9hn/vJ
 hDtew3519TQClw1oxtlVh7U3yPTaUPdvyCXNCRnwx3EgaSHQn6wzgajYZXSBkMkBcyMBl8Cw0lgx1
 FiHGAF547rrx+P3I=;
Received: from mail-tyzapc01on2122.outbound.protection.outlook.com
 ([40.107.117.122] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olw6h-0002Xg-5z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 17:46:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dyb3YtaZe2w3KRqdbhMf/+Swt/SrE4ME57SLimDln5DLOp3+x2jcruw+2BeMGxmx2Py8/H/T3TLxE9635sGNt0NNPYqjovQ7IDa1ItIoCmzgj5HSOvWIY9/LSRLBdE1AZNLrGW2hrums1ashITd2MsoHiPXfl+GJI5mOmAJXkTi553tx0OCb/gcE9SMjWxu/uN0+XPrEu5po5JcxZKqpxMVFMvBn/hw9WIqZGHn7/RKYxgo+eaRGlaPc58XimD88wJ3HSgROmP5xxGfyg84rKqc44PhBujowy0IoCQlftYKoxOTPmumS3FTvFY2yK8DRQYIEwDmSIt5cN8jGRdxytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Sr5YSZobnbclmXyQ21pXlgXZwokdjw9E2Pr4nbL7zA=;
 b=dVPzwOq1xLNiajznowAfrKMp4yaiIvsWXWFXxrfN0IuC27x6YT6r11sF2QVfPz2z62lUiyHlMU42vcSf+wNQ29mof6Yn7QziD2D0sP5q0HpCrPe9BHmVWwUore+8ZYgaJUZPbbaLG1RTAB50rRW8Hd4McR7HvfEUxex2I+8XPtKpVxS/CmSg9qkafZ7TdoJ/jlgVkJ53MPIKENx/6JGGvDYWXfI0RTowdmxW+Rl9DWG7mc1IJyNi73XhYl71dZT3uc3irDg+Jv+VAMVnQYB7DheWDm0mWmoeyvC2B0SLTA1wHyYBfr/3K9DFOftjhqalSx/jyS7Kn08cr1+vum9NhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Sr5YSZobnbclmXyQ21pXlgXZwokdjw9E2Pr4nbL7zA=;
 b=RSTdaD4GLW6NqyzrMmliSVUIsbYG15DBudd1TNzDRXija/7Sdiu62Tfn5ttneN8P2vpbSDQZvevScp4bhnarolaZNOh2MEHtep36QrnxXcM8/w7ozLOx1s8waN8uUuASG2KYMH3DCJywCKXzkVocNMe965erIGDXIjZRKV681drcs8DhOK2pAOEMlZDG1KTJxv877qUzmzc+7Zi1YSeuATrkn8qCBW6qVn6oNb6g2LV5W7/LD6+L+bYYW/MNfsGqMqGlqdp+PTqOnqBD8GFbc+kWYcOYKAcWEii9CfvRwwH3A/XwCXFH0dOZip96rnpPvpRaa+3w1EbSY/3n6awvCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5056.apcprd06.prod.outlook.com (2603:1096:400:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 17:46:46 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 17:46:46 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 22 Oct 2022 01:46:32 +0800
Message-Id: <20221021174633.12541-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5056:EE_
X-MS-Office365-Filtering-Correlation-Id: affabdf7-83a7-445d-ac85-08dab38c391b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cs3FJy1CgQdNPLpotSYRBhNjRyXlyrUpzesYaLJUNLL3wki0btBdKPW3NIeCm6f0P2bVPacdt7hFQyA2r8GggZdDWca4BMpyEobpnhnXmRcKccbG8NYkk861ZlKL3YQd2broG2ftWr31RBPQDZLaRK90idhB/Ayn8knF9qpcCA/kuMOSxFdaOn0T+7Y9uHUBbwN3O5PODG2/eegLDK2Vxwf2HxMBy9V90X0L4Ju7EkPCFJp4hFiMKchH7Qnh2vMRLJf5yCHnBjNgJzbluDo8Li3twXMEj+zU5f8agIuVRdA+56ueoCl4TkFHN+a04QbxIhDAxL+LWnJk292gkmZwBjDFLyxAwSdtUCpYMEICNxbVafUojpIM35ZZhf79xj1oDC7qhX1DO0QiXDZQ+rtExvqSxlSMdgtF7WVnV3uq1vhHVbIXa85zqlsY3Lh4UVPbZhcaz/OZa2ihNT6B1OvlOQ1YXcLNkwu4PYUaeLyLhSGR1EgGFIKjPGZhIuEkWVtW+2A8onmutH+ff++cVnYBXNtK6RixkZj/kE0BfDdcK28wkZYp69/Sa3GuYF3mDcVJo0pgtXpx/PKyjmYAts6lBe8fYDTXIkuWYOO3eMY4KpJul8GCfpwd9KP13q9iuilGFd6kZEA7ZorSSyWzZ9fY1kE4XLKvHoflTilhCoeNt6WuStW70CJRJUK+9sCeay1B40TVcX1Ip4IfnGkcYTOwn+GSRibalFPuRRTXQpRZeOa4oWfZgyTjLTzPWzVr/XJH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(36756003)(316002)(38100700002)(38350700002)(6666004)(86362001)(2906002)(107886003)(66946007)(478600001)(4326008)(8676002)(66476007)(5660300002)(8936002)(66556008)(6486002)(83380400001)(26005)(6512007)(41300700001)(6506007)(52116002)(1076003)(186003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ut3rYhLwa1uA/bzSjeMxoI/tVEEGU5aSXYcUE5GCAFlxUAaZ0lYs6evn/3Kc?=
 =?us-ascii?Q?/dCanKctofS8IidboVKUsD+k4+vhnRlOth7Gra5IFbA3WF3cTYd1PAtEALCQ?=
 =?us-ascii?Q?sqG6D1z8M9PEJcKLUHEpHoJYytJz06bmH77RQFyDjmTh+kB0kQ/+rr8pEbcy?=
 =?us-ascii?Q?K3DcYuAxT3C3GUu1tWXQjX8CW+WVmvby928Ku1XUe5FenLhGCuhb1/q4gU6U?=
 =?us-ascii?Q?Tr3UOkEr40IyfPmH0M1ALxKfNJ+ZOm7tB8i4PKzRjhL7Ps0Oy5jYBOiI7GIY?=
 =?us-ascii?Q?AFjJFYD/LrKBW2yZiQYEWyHHejiDuSsKQkxZApLQtVzxju9Y7zbFe7wuyCcH?=
 =?us-ascii?Q?nLvpo3JU1/N1d+Exg8G7zgjPWEtFkGdjXQwBkXa7zgIWvJ+iWE9VGi341l3g?=
 =?us-ascii?Q?ZIaTbu40IvZd6+zXvwVkqaHLhrdX9TQvRxmdCtXfPBF2tVqpP++WdQps7bzk?=
 =?us-ascii?Q?eO2TwLgSjE5qfAzzsAaA2Alpa5hofSM4EKEmAEdnoN5HitQFsag6QYrtOov/?=
 =?us-ascii?Q?zmD1UCHPDDfJl6+WrB5gC/hg1SCCnmi/gAi9EOp+3DC1H6Di8kfawjf4Osv2?=
 =?us-ascii?Q?Ng2Rrfkfp9WMe3ngUuQwnfTMHWMNWDaAJMNazWcPAIAchlHk3UWEL3bULkTE?=
 =?us-ascii?Q?lWnAguw4dbRQsfbNo2EawWZm/dU3NJF6jbEQdmu9uhuQ/e9U5XNB/dnnelbh?=
 =?us-ascii?Q?gNUXhYI5AcaP27YCftIL9lOl6LiO3qpwTbxj/fI2R9vU6KQmaHxgBSU9kCxg?=
 =?us-ascii?Q?c6UapJ1BhFwu8nzs1MiGbKFU1gEfimXamDqhx7mTnfOr6gS3pLyarRDzDgkn?=
 =?us-ascii?Q?uPu2Sl9X7EPgNPbx5S4Bm5UIJkQcJpvCcGHx3MYyj2qmLMf2j9Ftfhw6eVbC?=
 =?us-ascii?Q?WD9p/pvnjISAl9a2b5rWalIClsX+P20CvrlVT1StQzB3WuSDKWrfHjEfX+Hl?=
 =?us-ascii?Q?+w+iJJ+aqOBrZkiiZiP90gMpcUBPinqCiVb1hypLkAHfn0LIKiUn0Ct2td9S?=
 =?us-ascii?Q?oBEwcnbZL8Htjvzdw73lLD4z0nYJIFoh6ZkdkXRECuCkfZSpM0sgiYIz283S?=
 =?us-ascii?Q?8UO0zLi/C+2RBGr4+8tEtKNyWJVvn0GTXoXR3Nn9tGyNx9/kqyTgXmYxvdxR?=
 =?us-ascii?Q?5HN8YcbWeyOKbDjKRyDmhprKHmDnVjcT9uta0ztOBebCK7A4fcR8J0wSJkLt?=
 =?us-ascii?Q?2VGUbJx9HaBfv9ngarcbPYQgQdJxpqbl+yudDAnSU7BK0dPdnKAVBIZNNOUu?=
 =?us-ascii?Q?rMEE1ea9KFJb6bj20/N/0B3kczSu9M9M00uAane6tqDowS1xzyXaWW2uJuqM?=
 =?us-ascii?Q?+Otq5pJ75aJZo7cZJmRMZ8pWLh4JygJ8e4cbsT628xWJq/xgnc1rhrN7OZTm?=
 =?us-ascii?Q?jWY6ikjl8cr22WQfJRFnFGZwByQBrBVgwoQ4pLvwrQb5XlHvbunX73rmbIhD?=
 =?us-ascii?Q?y1HWMxRIRsbu0yT5essaejyygc7IdbCKRLqV0Su17aOzY8bM/Pd5djoMg4vo?=
 =?us-ascii?Q?SX220ypmsQAX1UAFU6FW9J9a6WdS2/aowa//WwUF05kOPVirvtjYvlkGGVGi?=
 =?us-ascii?Q?JYRGEVTX9THJuGxuFYo/UUu4ZeTDO1AATQw0ZQ35?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affabdf7-83a7-445d-ac85-08dab38c391b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 17:46:46.2973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4a3kpdKcHQA8OF1T66TKZY6Laq1pwte0/0r3ZXCPpPeyTy25RroOz07BrNOfoMYDE2G5VCzy8I8cEe2lw9bqwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5056
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.122 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.122 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1olw6h-0002Xg-5z
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix gc mode when
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
 fs/f2fs/gc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..2f113fbcb85c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -45,6 +45,7 @@ static int gc_thread_func(void *data)
 	set_freezable();
 	do {
 		bool sync_mode, foreground = false;
+		bool gc_normal_mode = false;
 
 		wait_event_interruptible_timeout(*wq,
 				kthread_should_stop() || freezing(current) ||
@@ -101,7 +102,7 @@ static int gc_thread_func(void *data)
 			if (sbi->gc_urgent_high_remaining) {
 				sbi->gc_urgent_high_remaining--;
 				if (!sbi->gc_urgent_high_remaining)
-					sbi->gc_mode = GC_NORMAL;
+					gc_normal_mode = true;
 			}
 			spin_unlock(&sbi->gc_urgent_high_lock);
 		}
@@ -162,6 +163,10 @@ static int gc_thread_func(void *data)
 		/* balancing f2fs's metadata periodically */
 		f2fs_balance_fs_bg(sbi, true);
 next:
+		if (gc_normal_mode) {
+			sbi->gc_mode = GC_NORMAL;
+			gc_normal_mode = false;
+		}
 		sb_end_write(sbi->sb);
 
 	} while (!kthread_should_stop());
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
