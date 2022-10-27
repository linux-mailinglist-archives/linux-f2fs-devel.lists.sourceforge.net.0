Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA460F4E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 12:25:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oo05D-0001TD-MW;
	Thu, 27 Oct 2022 10:25:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oo04e-0001Oz-53
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 10:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=skSA7H6VRgAiz059YN9/VM/V3hCNY+z0ypuYCT9/0E8=; b=YJA/lkxv4yotzSUfpY1QIkPoYW
 x4rULgi7dyGDEaG1nUuEMd7GPTJQkqz4lfvYSEtLKu8xW+8ic9U6VyKEdxlXWM+XuuwfEtuvDRQlT
 fZyr7ew6iRydeKqd/QPTSqT9g+poqMsSpoa3H3hZX0fSIcAsYoD+Ehkr571Tha0nBte0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=skSA7H6VRgAiz059YN9/VM/V3hCNY+z0ypuYCT9/0E8=; b=XG+CWp4SZF5FYvWEid/2m2jZhF
 JbD5HzdUUj0+gHaDaH3GdP37QahCuhL9mOc2XMyCr47iRWiqfrOJzAkiFMVpEgkfImrlR9zhPFF3w
 8F7MmTwp0SaA2lkHTJwYaue37aMxN6ceO/XFywkCq+0kakCDT6qrgpBmtvZO/CkkbUf0=;
Received: from mail-tyzapc01on2134.outbound.protection.outlook.com
 ([40.107.117.134] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oo04Z-001kcP-N9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 10:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbfKlDXvZ23YUQP4XEnk52ePxIQrHTCYmplz0oMI6fkx5Bxzxja7RvVsj0ELbAzsLg7TmiBM1qOYXVzE3f6vSJ0uug+NVSQMCt59PL9hJQ//sWfvlIluCqJA+4ea1/8PT0eSOsLEESW1Jb7dF4GgYARyAeeN28kij/XsVgW1h7jnRbdOZAB4ofd7ONZBes+DcCiwOV7Jh/eFEHj26h8i9QRZCNub0rmzaBt9BJqviZHrtku2+CaHMBWPKKYl8QRr1cTZ2hkU1Al2D/v6E3Oq7UDZAhHBNXdBdzFeXowbquj9VZ5o7SvhvVs75vPH1y4v5CPaCjzlwGPbfQVgsGRnNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skSA7H6VRgAiz059YN9/VM/V3hCNY+z0ypuYCT9/0E8=;
 b=lO4LxlKjus0Ab4WulkEyvAJhLupXtYve6EfDso/gjJWkczi9Tloo5a+EW8ntTab3h6cf1tILTPN+ZNxnF7dThNu42B6xouEg5pDNRx4zuC6QxJrYMKM7mv+YqLlnM+j/EbF/eSyO66ppjBLueC6R478NxeHqPd19ry5KWd1lNOZDiX9N1KXA0pHMrEQhY1PpBYAuENDJr+i9KqzYA2ijORuw4O7T10I7h5y39bSzJurBc7/1MCL9OXzdgGHThuuYNP0j2q4HemErlzLPRNChiLOY9xkd7VrUO933fa99Sjw120kU4WWexpEcv1KuoR5RCpMsc0T39HMF+033Ct8z+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skSA7H6VRgAiz059YN9/VM/V3hCNY+z0ypuYCT9/0E8=;
 b=X392nSv9sbXX9RWmn7ZJMV4KGj/3PZlPOqyRqt70utP7T0I8zKPEMQc4ILoR5R038JZ++KTXt1HA7m0urUX6E/x35BFwDeqMrSXoO+ZFtn1Uy8A+p3L42GS2sfU+szQXPR0mCa9dQVVWzGaWRyVcbzm+mRr+0yNqiwUKOfv1zxrH/9ZeizngfgdYutiC/4KvyvaSxHG9voMUI6dGLR7HQvaMZgUJEwWtUKjf/L1gjtd79YN86dPjLnY0mN+jzUgQyMB9G/BjlSyC6ZRn+9e3q3iJBjTsGG7CQCl8zR+h3Rq3vCqeOMFHRqi9X8zhmHtiPKNsbM2NT2H6tgn5UBygLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5366.apcprd06.prod.outlook.com (2603:1096:101:7e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 10:25:05 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 10:25:05 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 27 Oct 2022 18:24:47 +0800
Message-Id: <20221027102447.75708-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221027102447.75708-1-frank.li@vivo.com>
References: <20221027102447.75708-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 59de766e-5f9d-491d-db7f-08dab8058382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmb4roGQzKbk5HxqmQ/KZXD72H4JA3698q5vGD4ayYweosb3fFGQ1UZSp0t+09e8reoKT0DNNQm/o+scolE7qmA6NuYwZ+SGE6K7uCsNayXBFnTgWCqwLTSjIGW2h0tx9Lpewg1ZgEJsR+KJJxfUz/2BwAoVH8nPb0XVlwyKH4FnPwOvFajjJnlGKSK3ZHbNk8ffkQvjkWaTh+6U1pDnz06BO0gsoPXczAOgwUcyPAQdXAX0u/gFC3etLaXMvKbRnK2RIy6kkPdffzobnfhNKNTTeYIIX9YmsV5f2ZMprSHDYi5wMVJKionvKTSmW9cM7g+zDYh+WjLG1SsJW5+GIXrAxBqP+g2CoYLaYeOsOsN72xq7iqHpss0AAYuZzEMd1Scr4h57ddRuY7K8OE88u1NxwwTdn8YugpZOhHuSVVS7T92LEdmvz2iVhIAutstgVEMGothLNW6etefxnabKmhpI26RxOhGxdAe33UUwdjjVgHJEwxOunVpei1vn3e6o1j37bYr6LXIKYDfV8ggRjxAlfNWytQu7XEVfye3ybS4BJfymou2dIWjaJe8PDr+qnRpg5jxJimOss4QpCtwlSV3yPdPbnrIeVoU+gt/9vEZWaSePwAlyyyK9R/3nBUfNm+WhsSonRPyJdjopnqxtQoYlhe/KD/+pz9DUzmkNTt5KJf3IaWb5Y2IWopJYRe3jGxuFk7uMLduTjmcR5kGF3p1jpuaxT6WnBgsmjBk9CkatjTqED4Z4nyJPeX1MHE6OoD77mT17HXPCXk6PzhtpVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(6666004)(8676002)(36756003)(4326008)(478600001)(83380400001)(6486002)(2906002)(316002)(6512007)(8936002)(4744005)(38100700002)(86362001)(38350700002)(26005)(41300700001)(2616005)(52116002)(5660300002)(6506007)(186003)(1076003)(107886003)(66476007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lrgoDOeRcxJMGfFhIqYWRBYenLYfrmg1+fO/fWTjQLzPmW5wFlP/SjKoQ3KO?=
 =?us-ascii?Q?b0E1jmBHGmmDrPAzYPBPylnAPy/+Gp4X/H5lp+vCvpATRV/nkNWKpbsHll6c?=
 =?us-ascii?Q?ZxZWynZthK6RxV+zpCwwDEebwYDPoDZvlU5vBp7SBPt+agdRbGF3YcjkpAR8?=
 =?us-ascii?Q?UPHGCkvbrA6umX/RliymiR+xk2i3yO6nzmjGPvQDHNGh6SeveCdKFyUkbhbB?=
 =?us-ascii?Q?8zIZV3L96v0egZvGRnU/P1ITiI9F/4yQKYyEJBANc+3zszFT0wDbV5faGV/I?=
 =?us-ascii?Q?QPptJ6g9/etZD+JLN/zy8Hnqppgn94srQLMWibWAqKWavmRtKGUGIMKqQocc?=
 =?us-ascii?Q?wjUh1yPdkszOiCvuuedy7uxRej8v5ZhanVMXjFps0O3HyBE3p+YpcqhqFwf/?=
 =?us-ascii?Q?NgaY5X1lAXvuhYpM+X3BwJnkC7pzwJ9bhwxusrWMSNbv4apNQQr/KguA4c7V?=
 =?us-ascii?Q?5d0JdoXyqJi2Pc6ini8ltoFW0UNs2SsI24wiRsnMBJqKXFnDil1n/UJ088oT?=
 =?us-ascii?Q?reyHfZfizlHtPi2qEbM3D6tfK4id2hqM13Fj5Kne7cWaJ84W+QPy65whfnrZ?=
 =?us-ascii?Q?C3mEMGeuKQc/Zk0NRO69J80x76WqEZK/2ZTKINvcONMh3boh4s6t8n6l41tY?=
 =?us-ascii?Q?urYI6jkjNS1DY1NFaL3osm3TJpgRWiVB8GakQCOUXgXFBccs++cRVL8lT4K4?=
 =?us-ascii?Q?rrSacIkFxY1Ckyd393H77rx1+ZsMHloIMop6769Q9XAuzyBs25wogznkbjRX?=
 =?us-ascii?Q?DGRquRfX9okKmhAtcag6iv5UKhoQWxgHwW6zoJ9ou6hOKuxIFOKT9StGOf3M?=
 =?us-ascii?Q?rQeFNEK1wLrOus80hCObS63KKVCuMHLSRqoNEfcEHx+vOlm2k+HLRhui03W/?=
 =?us-ascii?Q?d2PLD6m/IWLRiq0gU76sXchk2kxbErECJVvD4Dgh+w4dZCgMjYcRC29DrDJd?=
 =?us-ascii?Q?HBLrLdKlbvPUpgUwoZPjKMM2ujWjkoMM+csOXpmKs5Z19NkCK8OkySIBX7oW?=
 =?us-ascii?Q?QKpTmm0OU1h8EqYbqmxHeEAep1o4KFvhh979wUoiNRqw/bfktYuydZf5VfLP?=
 =?us-ascii?Q?+RfHiLXnxkVvWisYx7Nd9C5TyyTqbGOQRnvRarD8qb+3uTKanbux+kR2S4R/?=
 =?us-ascii?Q?WJGCvpAplMZe9HYWIga9SmXRtlGqssYc6D4UgChr41hBSlvV5DJYzDu1nZtU?=
 =?us-ascii?Q?MoQFGpivdP8N5vEx0074Z+5CesqVc2m0kp0U1NZ8FFYhUh+m4mgZlHdJhhiZ?=
 =?us-ascii?Q?ZDUeQzMUssv2CBi1unfaEU/6GlhASMoXFCeQbSlliDXD8EN7aJhC7GoEwe5J?=
 =?us-ascii?Q?9EsYW0dpnLBnfG+tZxOsqYf/OZaCjVXLR4FRh5gDyCygPHTAIHZw1uv8NYWc?=
 =?us-ascii?Q?Wfhxo4pYUp4/FBRAutBlO9i4N03cyq/g4UrJVd1iO9tdmcY4nDva+3R2Afeu?=
 =?us-ascii?Q?obhWUJEmJ0SrSAkhjUQSH4ZYVMILIqaHA951js6nuvfhQ5QHxaws1o3HqBi2?=
 =?us-ascii?Q?dsZ2kwti5aCOylUnrI4Et9WSZHDhDWTFbPfKof98XBSy9riQ73jAF4qKUJ0F?=
 =?us-ascii?Q?R6IacLXjGdpWFearqEjnu9eiiPT5WnpUnZDzlXtp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59de766e-5f9d-491d-db7f-08dab8058382
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 10:25:04.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnLgpI4m3RFkk+xlUOmebd2T9P9Jb8DRtHKW+c9R+eaw7zi0A5uxgAC2+/Xw6Uthf7iwSx1ZFzEoi0hBwtARZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5366
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Return PTR_ERR(cprc->f2fs_issue_ckpt) instead of -ENOMEM;
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/checkpoint.c | 3
 ++- 1 file changed, 2 insertions(+),
 1 deletion(-) diff --git a/fs/f2fs/checkpoint.c
 b/fs/f2fs/checkpoint.c index 2a5d9256a6f4..12fd12f2bb97 100644 ---
 a/fs/f2fs/checkpoint.c
 +++ b/fs/f2fs/checkpoint.c @@ -1899,8 +1899,9 @@ int f2fs_start_ckpt_thread(
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.134 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.134 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oo04Z-001kcP-N9
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix return val in
 f2fs_start_ckpt_thread()
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

Return PTR_ERR(cprc->f2fs_issue_ckpt) instead of -ENOMEM;

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/checkpoint.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 2a5d9256a6f4..12fd12f2bb97 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1899,8 +1899,9 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi)
 	cprc->f2fs_issue_ckpt = kthread_run(issue_checkpoint_thread, sbi,
 			"f2fs_ckpt-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(cprc->f2fs_issue_ckpt)) {
+		int err = PTR_ERR(cprc->f2fs_issue_ckpt);
 		cprc->f2fs_issue_ckpt = NULL;
-		return -ENOMEM;
+		return err;
 	}
 
 	set_task_ioprio(cprc->f2fs_issue_ckpt, cprc->ckpt_thread_ioprio);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
