Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D1F625F35
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 17:14:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otWfc-0005pB-Hh;
	Fri, 11 Nov 2022 16:14:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1otWfW-0005p3-92
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 16:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H04VRKlbikqz/xyNL+sELbGigAsFtmhBEbQcUTICEG8=; b=Wu64+2o8qbUYEhoWmQWRVdOF2C
 +niRyLaAg3EcFPI//WBzp72kE4ug1z76adnwo4kZxo636Vf5r7z2dpWVUTh6eiF5v2X9rRNnVM83K
 Z0gvAB2NjPJPxOhCKJ6bYF+jY4XFDCXawFIYbmKB0lQr8/raj5i55IYeflKctYYF0bOQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H04VRKlbikqz/xyNL+sELbGigAsFtmhBEbQcUTICEG8=; b=K
 1glboezN/9x1l8PHW1XSLmmdZMGL9hZKE0p+aceJzJPGp30hKzTKb+M5T3ZVZCM932g39t1LYLYNX
 gfI5iaDUBRX+WXwXsEjPFOp73u4MeWg0nwhpPTdo9Nn99g7ngcYK8VAsC1EOREbkOJs7e5Eae9QlX
 AJPiFtL1qDLxWfi4=;
Received: from mail-sgaapc01on2102.outbound.protection.outlook.com
 ([40.107.215.102] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otWfS-004U1H-Jy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 16:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpTqoC230uNG9B09qh8xSlGSWFoCgW9ALLBbAntrq4owxuKeo+gybNHkOJTle9PXJxxm17dvsEz94R7Y+wM85fc9t96/FVINACGQ1HOfiME6LLAT/pxsA5DdeH2AIPlDTTbVRSPMTAxG38zlCT9AItoR+NV358awGC4wNLYwJvrKHjs6DyWFO2/MvZKGW4qy0mvvM8En083SVglYJibOrhjZvBu9ccYfgtw/sbXsavaW3kFdXO3PRsJkbLs2a3l/RjxPJxKINb916bbD9hz2dsGEWUM5ZBP92XiimifyuMzENRyz9zYpT7vkPKybkUHQUQf91aRrOoMx1G5yB9gS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H04VRKlbikqz/xyNL+sELbGigAsFtmhBEbQcUTICEG8=;
 b=ZBHFa/spVfpytFMkHMR7BGsk2J/Zfruriucf6k3+YfXQ4jq0smfzzneJlWIsYTCfGCfLpqVQ04eoVorLu2hC48V8DLEG3GbpXDbiWKvMqXOafmPDGKE/9rmDMRH6veNH8YzHs1QQSXO/utwKe7vfq/Y2h3+PM7QiU7S9xCclgGbC/JMXqfW4NzQGsFUabcTBNqDl1Ejo/NkPl0kV44chviepwjwYN+bj9QTpxaoSrcEJY+WvlpnFN8B1bxg8UsldgLaVgmLsAL+csTe7QLCUIIqqDdkmbBCQkRbVcqyeSJeN5Te/U8PmiHzFXbwa1jlPvLFVP3UliRxmjXJtwUY/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H04VRKlbikqz/xyNL+sELbGigAsFtmhBEbQcUTICEG8=;
 b=Gdcf9Xf0U1JP3vSnoA+trhnY/YUccePjJOyIi8BlKRdj6DMt8hBkwNr7EfkkwzlCrDgfTHWbRKrJokMEIB5nCA5349e1Iol6SR9ZBLSa9QNcZSrQtt6omJEHp07YIXiNp8ZQ3fhhFrDzyUFQgA7teu5aUEObpV1TilPC8JwQYcnMwC1efsc51aD3eEsCTopQdlQPdH7JbaRz1t/U66n8jmjUuoQhvVtIG2+V1F0sd3XM0opM5ACAb9BiGmz8y46L8Gmbw22+hmw1pZ/atF1dRG02CSQ8lVXS+EujL7UL1+XByc9NUfBxUA42wQHuY+XVKygYYybNm62UodjK9XWjyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4219.apcprd06.prod.outlook.com (2603:1096:4:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14; Fri, 11 Nov
 2022 16:13:58 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::1230:5f04:fe98:d139%9]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 16:13:58 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 12 Nov 2022 00:13:49 +0800
Message-Id: <20221111161349.60689-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR04CA0205.apcprd04.prod.outlook.com
 (2603:1096:4:187::6) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: 53dfb421-d67c-44bd-eb14-08dac3ffbcf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MsUm2I4O+QTmgx7JPonkwPgiiDQ0lOyLAPdEeOobGfVOIzGP9IGs1A/Tuu8pHQFw8IsMGjSfQbSqWVz/9Q1685qoxaHWWRbclYh9Gl0vdydLmtWmek5mpHczbcYk6eJ65rlUvFZP5N3xkq6BIUV5JHdsN1YHorhzAmEQ8rXyq0HgCvyn77loPwFYT07DOGLj5hDwcxzCfLuCjKUjJ5mk/sxvG/IX7tQNJ/wD+GTT8LBAelq4NJgfxWi1JD7zZusymPpCmSBefwJNQoP1lGUjgMfFsLtdJUae50Nk7joasE6cixFqq/qbjs4BMlii/C18WbmJQ1tA5DWk45qkXtTKj/qUBRVZ/APhhKGAnH3GUmTLJX3sAQz2en+Nnu855+sulmsFyNuuy+MD8kTYrJ8mXXONla72VziOUZAUrT6iWmCJ10IMeVcXVuomHqP5APyp60KyxlbQJ5LL1+klfMWA3ny+r/i6xC2yBLIp0Vy1t3GBseOcArgu/EGGhhBzgdyPnfMlwJHzQHp4EWL0mq9oMW2epq6aVZH5BrMukG13IZlUS+HihQTQLRbJtsy4msAvwycbyxz4/C5CiKn6/MAVOkwlhqGFpGbtQLp2rSH4VK2f1RwhdFDGHLnKyrSQPQT9BhkBikW0EcLnBiItaCYGwurTa/YupznBzEoMirkzLbF1JWXc0+owo6mJk4UJVM3E/rTvnkiMcC6pMeIwkAcOHXy85RSDK2twE8lk9X8/HQY2gL4ikLsCa+qfbWn2oHjO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199015)(8936002)(2906002)(36756003)(478600001)(6486002)(5660300002)(4744005)(41300700001)(38350700002)(38100700002)(83380400001)(6512007)(26005)(6666004)(107886003)(52116002)(86362001)(6506007)(2616005)(1076003)(186003)(66476007)(8676002)(4326008)(316002)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QZBhsqbYI8TvgI3gWcjsSzo9n1ntXwuB8NCI1e5iba4NZNSlhNY01nzU19tG?=
 =?us-ascii?Q?XeypC/mmmdC1LtjeJm6dFrmKvg4eBqMWfIextEfMiBBodZ34pUhDOhmkUGt6?=
 =?us-ascii?Q?cZxv6F6Us7rkSz+4GpTesmz2ZN0fk5BRRtFiyZGEEYIE51bs8AJwrT6UUg4Y?=
 =?us-ascii?Q?3t26R1DlnFH7yAYGl02yRx3MweEJ9mfxPbKtAT8LSoS0NVlw7SECNbPg2/Zx?=
 =?us-ascii?Q?PHkVYoPTtk8ig9Pk5aGKkZacpM6T4b/5Lalc78jO361igygfCULXSKIklhdw?=
 =?us-ascii?Q?3F9KrZaqPP5rl4otlZ38KGZIJ+3GYfXqMkJFon55320JCesOiIhGDSqvCJrT?=
 =?us-ascii?Q?Nx0mpIiVqgZuLVD8cCKJhhkv1f+dURli6h/dctoMjWlADjCr3m1TijXdQ2vq?=
 =?us-ascii?Q?zeiB1mjxd30GBOEoN/865SJnEjTLfmA66CRkuuJFrNy56Cr8ac3jDtAkCxdz?=
 =?us-ascii?Q?LcBLK8hZJJJCq9WqXKwbNVOuhxqD6oxO4lEHmtOdmuCWiuY3ESXtODNN4h5p?=
 =?us-ascii?Q?LBWGND7fLNJf6eQe5iQbq272FlBArKWB+rJt0UmIf0/HB/vUqVpvGBOSK4TX?=
 =?us-ascii?Q?a7uPU6VoAhhztO2hbtxPr5hJ39tra8Yufog+iwtW3W2QdihmsX+CFuz6ZqJq?=
 =?us-ascii?Q?nArmHzC8Bit0csZ2I+DpI7JjVVToQa0VEOiv/neK28Mv6bpqjqLn1mZPZb97?=
 =?us-ascii?Q?ifLYGmeLYlFEt7sCQmCauEzVzgxjz9DEkdNip0IESkNDeRivT9/c1eihbpif?=
 =?us-ascii?Q?+BWDOzLcI/ABHFhDIpkDgvLw5M7HnRhJvx9D7yEHQ1jGdL0FxvAz7BP5aq2x?=
 =?us-ascii?Q?nqWsATNSHlt9GbrsXR7rIfntxleM42RJZXgxEXhGuYOJSkfDBwvYeX1hjmfK?=
 =?us-ascii?Q?DqXRst0DZqw0DdUonUK1GmdQR6Xt15hJ9duFQgU4rwem35yequEPorOdQ2Ob?=
 =?us-ascii?Q?60n1LNQNh1eWVb7RQEKCZ5JFgzQPPCHLEfTOmEjDHO0cB6swxAd2EeEUT1+i?=
 =?us-ascii?Q?B4vDn/2euBliedBZW5IIEo3p4k6KHCrOhvQPZm+wu/Q8AG1r5ft3IWgF2Mp1?=
 =?us-ascii?Q?PMNn3SXAZx5+7vsDDi0aMkwLzNBsLcryWdcJPy5TLXjA6yntf7YS0rchyXot?=
 =?us-ascii?Q?5ilJdGZuQvPEhj2a9YxlUvhY2un3Kjq2OW8d9eXGY0rqNR7yGY8zvHabugsu?=
 =?us-ascii?Q?5ZRCgXgOQN7YFliepnyasyb6274Ra0GGFcZvUR+7QGv+Npah7AvyA0nbBgb5?=
 =?us-ascii?Q?imdrG+r9nY4PkEByhbzG/j2cs44Va1EYhXADf5SESXkFJL1muWMrDtIqGaKN?=
 =?us-ascii?Q?np7qTCyQ7lbCROmnZXrkjqfUN1jhRYMu0jolmrBpL9badGgHIiBWqYcaJnQS?=
 =?us-ascii?Q?bPPjeTS+AYyP0mgNQNjUdQHvtrhhEV3zfwDVZB8zRizqQ7eNddxvUEQrkHWs?=
 =?us-ascii?Q?eXRrvz11RfP9ekFxR72jpbUq8XFTK4BW5gBfoosxKWMud0QqM9pdutsy8nVU?=
 =?us-ascii?Q?LuBZy9F2G8pD5hQLj1FmbuYj2Q/8QwaYZTmbJUopncQFxoMPfA6oqI1O5gh8?=
 =?us-ascii?Q?2Yz1I7t9Qm/wUASPGtNrbFySfyZPK1UBwi8Ze6JV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53dfb421-d67c-44bd-eb14-08dac3ffbcf1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 16:13:58.2738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/1UsKOjZpBPXoIf2vOVn+tsRV0J7uEeDD0HFGRked1JkwogeD0PfAarESLAzFjHRW8CZUczApnnCPOsX0G5JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4219
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Complaint from Matthew Wilcox in another similar place:
 "submit?
 You don't submit anything at the 'submit' label. it should be called 'skip'
 or something. But I think this is just badly written and you don't need a
 goto at all." 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.102 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.102 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1otWfS-004U1H-Jy
Subject: [f2fs-dev] [PATCH] f2fs: remove submit label in
 __submit_discard_cmd()
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

Complaint from Matthew Wilcox in another similar place:

	"submit?  You don't submit anything at the 'submit' label.
	it should be called 'skip' or something.  But I think this
	is just badly written and you don't need a goto at all."

Let's remove submit label for readability.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 3654c30e0517..0a72e787c585 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1144,13 +1144,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		if (time_to_inject(sbi, FAULT_DISCARD)) {
 			f2fs_show_injection_info(sbi, FAULT_DISCARD);
 			err = -EIO;
-			goto submit;
-		}
-		err = __blkdev_issue_discard(bdev,
+		} else
+			err = __blkdev_issue_discard(bdev,
 					SECTOR_FROM_BLOCK(start),
 					SECTOR_FROM_BLOCK(len),
 					GFP_NOFS, &bio);
-submit:
 		if (err) {
 			spin_lock_irqsave(&dc->lock, flags);
 			if (dc->state == D_PARTIAL)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
