Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E810737F1E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jun 2023 11:44:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBuO9-0006AJ-Cl;
	Wed, 21 Jun 2023 09:44:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qBuO5-0006AD-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:44:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d9n6hAlwBhaCOVqO1oeth7RtUmcL9lX0Xgg0Awq05to=; b=EywIJxol7/WSU6Qx//k2AMs11u
 0rDb+rGnCnZROGW4zGsRgDz852WUVDDMNjR5uDJF7jxyKpFqnmcAIQQYJ5AtjEjbu+I0JhqEgoRaf
 yilFb9SWwIdbenECS81A9Uq8bEjH43wOPdo4iDPp6WHUGHWn78yDjhz+QvkEADw6zN0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d9n6hAlwBhaCOVqO1oeth7RtUmcL9lX0Xgg0Awq05to=; b=W
 przVAY0qHjepd9qJPIFYcz1xd3PZUl2cyMijPPHDBHRZqR1+8D+FtdJJlB4NBiGY4zDBM9M3B8tCW
 p47YcJdtdBm1nGebcSEmpnpS/YCfD6sOA/xG9tnT81FNsASdusc1CPunCnD3AiYuHPM3VICYvOuCO
 XmQwfhelvRZjRDUI=;
Received: from mail-tyzapc01on2042.outbound.protection.outlook.com
 ([40.107.117.42] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBuNz-00AWmH-Do for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNnoR2rCULpBceGH1qrKqVw2tL6maIBWOKvu4ItmI4HzMrd+6PA/6rEMgKyDF8WLw8ycn1YZMVlmUl/m5JGgFClFbnsx3IzT2urhugqSUDJx9U7Mfjn6yYFAg/I6dnFqenT5d5iz/AQxwLU7neYKq8a9MtI0Sf1li1y242aNIGTBmUQzL/P/+FGigNH5HKmi7EhY2aVjIUS2347zMfjx7c4wY43pB/PP8FHnvq3ok5UtVeAn9qJ32Uzrshgk1Plex6f/6BzSRguBc0DlZ6GjYopVzFTkMEIVlOVC1UYHlwPucHGCSo8Grv8pUXyVgnqlBEYsXFOCHsSGapmYIoJu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9n6hAlwBhaCOVqO1oeth7RtUmcL9lX0Xgg0Awq05to=;
 b=Uh6leckUpve0QRHeiBMI9UFh3QoX5VtRJc1pstIeMRkxhQ7NS4h//XHPcSSuKthqqVNzz9d6bv6yzg3+l9nZbw0altk1BsdmUORAiRbrze6IsLb77CVg0gombZPR9L9CwEilNBy9sx4fwml7VwksVJZRkzA5RMPOKtFOddbhLZmUcS62TzgtlBY9mhAxZOBixvCt+IvqoNdUw7Yn7fn/XBAIHlyyynrWWBooF9wR4QDLUUS7Y77aOf6cn3VXt9Pt2utw7PeM3lWFQRLwIiYmhZABHaqVX6BBH/+znD0H/Fc4rCfyaxivQ6lGxWWCzw+qhSQc8bWjn01wvu3VCyOvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9n6hAlwBhaCOVqO1oeth7RtUmcL9lX0Xgg0Awq05to=;
 b=iV2OIaG0Sq9XxQOXhcfDKeth118fPnrWlQ9pg7Whkl2UZRdOghX+zmheGw+bo2qIGg281fHBo6RImqR56AyuEr7ScfYRyZM0iP5ZKlCVZK2bIyedT98rD15QBcJakZLlQzUKz3VeqHhk1kGJZ52H5dhIL+qvgOZ+nQ3egBpuV+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by TY0PR02MB5621.apcprd02.prod.outlook.com (2603:1096:400:1ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Wed, 21 Jun
 2023 09:44:14 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 09:44:14 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 21 Jun 2023 17:43:58 +0800
Message-Id: <20230621094359.3827832-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|TY0PR02MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 57826df0-0d76-4273-b075-08db723c12b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5DRZLKYtDHQNRX8tdkArPatWH72OR+KMOl6BLmFC8/KKmfrUT+wdYv/lGhyGVGywxwC0MTU13naWvMJdlPk5c0bbMPK1/86u1HtmA7hUeh/y4rN1GYK0sdwzHVl1nOZoYoYd2UcE/+/M7xPmShVIEudgslw6eJkx8ru1vM35Ts90bkTBWrof/fRUu8Fb04Jz0rt63cmZKqADF8ivqyiyQrzgmzXEcF//lATBSUEoOHL51WXC7Z3eb+ZecFtVEs7j2HCwRgL3fnQzjY31Bb/ce9pTEAeKK9OYK+7V/ceFWqqRvwU23qfYprO7W1PzEckunpNYi7tCsPPIkburUNFQZus3it0lhNVPJxIJ42H2um8aH8O+w7nqnxWjGyFhSZf0+Uw32/YU6WtKq1MpSBcBp4Vs49Y/kH56FHMz1oMR3tYkvh3X58w8ovhdO+qczo2uySxM/AYAYwgWSyp4B8qjYvlMsVVN+bDzzdFCU7Er0j2yqPKuwt2s0CtQyuzrB6sW3rRhmgtL4nrb0FgxHdHmBP52auknr7SlmhT2dnkiuwVkKf3oHXP+wBXXJ/UmV3891T9EESY/HhCkKhEOS39xcPP6M/QsKQJtma4MAbqCDArzGO54M2pvRG2JLNeaWRq3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(451199021)(38350700002)(38100700002)(36756003)(86362001)(8676002)(66476007)(4326008)(66556008)(66946007)(316002)(41300700001)(26005)(1076003)(6486002)(107886003)(6512007)(6666004)(5660300002)(6506007)(8936002)(186003)(2616005)(15650500001)(2906002)(4744005)(478600001)(52116002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nvf936NC4o8VZeq5/vYf3Gw3hlMnA660RwnlrlqQ/i87NZ1NMqXMi2iSAgBP?=
 =?us-ascii?Q?tO1cubyorUHBPcjMrw95a8zZHv3UZcoOQqBaaIxcT0DKUskxODeCAe1wFqML?=
 =?us-ascii?Q?aB2X5vXbDVIdpKdVP5TlyI3L/t9Mxi3Z+M0hB0NLEyae2iqO/6sJBupqm2+F?=
 =?us-ascii?Q?GDhQQhDF0Jzkvmh5j/kj2baDh52ojFLr5xXfyLXyV/UldNp212V+gTyLZddB?=
 =?us-ascii?Q?h5FWkAFK5JrIP4faGb4ZrDagGux1Np9o5UO6QFxrS/CBg9HLHiraREsq9qrI?=
 =?us-ascii?Q?HuZVyzJcwVyoQks+oupTXB3ZpCImC87p/ZLAKOOLrV4GFST4qrxIjg/qHICI?=
 =?us-ascii?Q?58RJ7A8qhZKJQPoKEEYi09nYEB10clzwemjVkDYdhSQYPPkdPkZiWWTnuqUt?=
 =?us-ascii?Q?634mz6j5IegHUx0X2L9e/a+l8puw6cgfFJ4sp9mVT6VtZRi2yeV2lBmAbvag?=
 =?us-ascii?Q?u7lpGYKAoDvgYHiwffoNRaW9TrD2qCni5uDb474iFhUyLIXj96eDTJXCVUEO?=
 =?us-ascii?Q?OWR4gWxYmaB8ky9sDOb4rv0CbsHNCZtG/ZCboLOCO9iLD/O759duNNqK1Lna?=
 =?us-ascii?Q?ZCXKQFzfSwe05LBnE+R5rTQ7nSuc15IDnxC/RdlS10SALZKwTgiAx/JnQET4?=
 =?us-ascii?Q?Mhsz1hEQxstSAOaO8hHSETpWqH0CmdaG6uMR6HEo5w6fHQI1acARpr2MfO2o?=
 =?us-ascii?Q?bWLOiJBEeafFbfhVGZ0o40Cg3l3WrJfwBU1xPjmeSWzK6cIiAQGwpFwUkcN7?=
 =?us-ascii?Q?UXwoCHDYQdi6tEU3AcvaCvWLGugPy1rl9EPzT315Fule+eohiaxns0UzsOe5?=
 =?us-ascii?Q?5T9XAlmv1pmGh0eG09UEpCUS31T7Ft91uGKYcB30C2xOivukt3gLzSsXpCta?=
 =?us-ascii?Q?p8thgHkuXOCCmMGF8rqu2awE0AkhVbCCloxgZDH1t9NBhsAfk9eZv9Icxt9Z?=
 =?us-ascii?Q?qZLgT2NT+pSkqv9Qejw5MdQX56Ng2PsZ4XjUEC/jwgkYLPo/kERA12nE0n1/?=
 =?us-ascii?Q?r4ou5Wpw1w4FDeIHdaoqpNmy2iUn38Oe6yMsqObFq/wkxCoEs+iHEY9i6dee?=
 =?us-ascii?Q?H9dNDpaAJj3cfKFNcdJ71l43BTiOHcf/3S+MBE9wSGy70BSvKumqqTKSexID?=
 =?us-ascii?Q?eA6PINtpR6xcQ6OsvwM+AXA9QSgsud+3wsYKnWDYE8KQrqwCOwGFhbSQN2d0?=
 =?us-ascii?Q?MTgHntyVEmENIz12dmZxKTL88sujQ67LpyRXA6XZfBt7aZCtrZRAMRP0wFqk?=
 =?us-ascii?Q?UGKCG5E3eDuY412buDzu7pYRme3TykdsHdepydW5tV+fRo8ThzwgUGFODY+I?=
 =?us-ascii?Q?vrT9pkzCNDw8T1pq4M4/drYcKfBvlzHjfLFUQV3621FxYMIRbezzIWq0XM0G?=
 =?us-ascii?Q?yhYjinUgUEXl2aUBFCcSAYC7zq4GPP1BZV94lVRwaLOLcWB74wP5faicAz/d?=
 =?us-ascii?Q?cvUFJzPeQH12KPcZHKG4yaxiSaQIamrDM5WgfaEEpNZCYoZyuRWQQFTjP3Wl?=
 =?us-ascii?Q?QGsr14JFQKNT794Jo0M5mvMG1LvqMvvqhPAPr8j3xj6wd9CfVhBAOqZ9Q0MR?=
 =?us-ascii?Q?jVZLeQm9oL3MBjn84hELtQVMy936jG395h70OQ9X?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57826df0-0d76-4273-b075-08db723c12b9
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 09:44:14.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5j4Koy1A4TDJCBUtRVEiM/JUGXTz/IBKf7iIABRmDcmgIapRBk5EG089XRURehRB26m6zHxEpMHHV9+c5uKv5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5621
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Mtime and ctime stay old value without update after move file
 range ioctl. This patch add time update. Signed-off-by: Yunlei He
 <heyunlei@oppo.com>
 --- v2: -update both src and dst inode fs/f2fs/file.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qBuNz-00AWmH-Do
Subject: [f2fs-dev] [PATCH 1/2 v2] f2fs: update mtime and ctime in move file
 range method
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Mtime and ctime stay old value without update after move
file range ioctl. This patch add time update.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
v2:
-update both src and dst inode
 fs/f2fs/file.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index cb42d8464ad9..4adcf62e2665 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2884,8 +2884,22 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
+
 out_src:
 	f2fs_up_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
+
+	if (!ret) {
+		src->i_mtime = src->i_ctime = current_time(src);
+		f2fs_mark_inode_dirty_sync(src, false);
+
+		if (src != dst) {
+			dst->i_mtime = dst->i_ctime = current_time(dst);
+			f2fs_mark_inode_dirty_sync(dst, false);
+		}
+
+		f2fs_update_time(F2FS_I_SB(src), REQ_TIME);
+	}
+
 out_unlock:
 	if (src != dst)
 		inode_unlock(dst);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
