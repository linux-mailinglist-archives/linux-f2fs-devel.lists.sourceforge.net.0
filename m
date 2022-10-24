Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0960ABFB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 16:00:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1omy0M-0001xI-DA;
	Mon, 24 Oct 2022 14:00:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1omy06-0001wn-Gw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 14:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ulipJIhaT3hGFhk/K3//OPFdqFauYnBPGVD6HLEz8nI=; b=k4bvpo5Hm6yDAUcaSs06EELUfs
 9kDmFxvz0SR8m+AkGAn/0Qzl/sq9qxF0GaQcuC4tQLoNLCaUejZ3eDOD4VtDvShkq+lhCBVFcm5Kn
 n9RxLpKqBjGI+Zaglufg01+sCMQGxc3nDVrwHnADTcViS3ItCXYmC3vxNn6hdle4JVmo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ulipJIhaT3hGFhk/K3//OPFdqFauYnBPGVD6HLEz8nI=; b=k
 otj8PAZr/7aNmNxHDtDha3vXkQLhO/86gVq/qxDu0n9bwnJ94XCyFznCA4FLU1ybZXdKjuxu6jt5Z
 bTgak9wgM8Fjvllg/UNbcN7l6xpSptIU9kAkmRHEoMdqQe+R3zKyG3pJ33tQk69dgKaPdndli6zJP
 gYGQXrZ6JSU8h0jw=;
Received: from mail-tyzapc01on2121.outbound.protection.outlook.com
 ([40.107.117.121] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1omxzq-00013B-VF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 14:00:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsJViV8/HjFW2WV2SYfbE007eeBp5gHX6DtJnjpp1aO3f5GMewMdknWBg1mkuMWVYQB0P1HytkNdQ0jnbyJ3XzcX6801s44LgeGEArM0bwXIpBM/VwuBBUpqLw8S3vYmGPnqU8544Nca+okL3m2gZa8kW9czsy/sXhLT/HH/ZXKdED9IyjfdSZeJ/NF7oIEbrFiplY1FdRncloZ0erXDtFNGJC1cUSDHFmHicXYUNvU1tP2+vkGEM9kN1fHByxv8udY+RACudhsA2iN6mAygqs3zV1Stu7qPTXmzsR1K4XO2P2HxS3WJZJNWQafwXc2yXpNcFqC6IKVYCS4jhgEGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulipJIhaT3hGFhk/K3//OPFdqFauYnBPGVD6HLEz8nI=;
 b=WTspfrBj69X2oawCHY+ThZEIAnOEaTUy+dKrccwE/vuSLbVTuXp/BB0h35JNVS6Drii8ywHbyw7yRQ/HnJ/7drbovnOr8rSk2xz9+WF6/0Smt3UkrdI/DtQsNEdLgXZCK1BUZT6Xwr5Woup9ohBXBYaWwScWDCZsu8aw4qOYPN30DvpXLixdvTbtvtyyro6BiX1YzRwxxIqnVxD+tP12gGuW7rKd4rdemKksUCd2irne9gIsMKZMwjBpGQWPtAgWtFOEsvOyUAUa+Y8XKn7KFemzmx1ZztBTZXCD+SMuqNQlbIbGYnPQr/xjH3e8kouBt0rrw1bJVN1rxy7yrDx7tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulipJIhaT3hGFhk/K3//OPFdqFauYnBPGVD6HLEz8nI=;
 b=grcR7dozbOnUJCstDcAiGHrwOSL1IDI16dHgBcg7KfqzRnITHRk6mp3GzBL6Jr/uhp1PMqmMC7saRjCGCqOtMXSnz7q4gGYYOjkAfTIqu5mcyMGWSWc79FJtDT1+UMArkmGEiihC2zlrWmP4QaCD/fjMZwuXGQSVpbEhwn1FJQ1rEFRCuEWBxhVzpf6tlCwNzMXT98g0D3LrZ5lXRQ3bZ8HXgCRhF2HpHcyZTHQTtHFgBifwihF3hkGX+gk445bGzGssjJIxDnJZqeFe7jeFduKMTC55P8Dn2JWY54aSVmyxaKaGaAgy+b5ooPxrRFU+3qLImadUm0+c4y+eIh83Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5113.apcprd06.prod.outlook.com (2603:1096:4:1a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Mon, 24 Oct
 2022 13:59:53 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 13:59:53 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 24 Oct 2022 21:59:43 +0800
Message-Id: <20221024135943.76120-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 3653b31f-ffa7-4f53-f659-08dab5c8061e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n6NCA9A0s7azgFzRtcbaGQM02/kQEBpH3x+kgXmt5/zd+wSddJvZwgCt2cNZQIIXXVYB+ljmSC5Bqtt+jedD1ewdFE+Mp09upfbr3Xc+FmgTJzVwJMB6gIFyBV8WsFMU8tBoZE5GIAaLT57kkSML0AXdwKzJyW1XDSWRfs07eUUld/CcfEvexrasBfuqB9osyCJSXUYk3y/fpEFwJGplH7nRQu+8l7M9cDPuxqsufDwO/0eOZiFdBzZ15LNRJYM+hVVEqsuxwU0Px2rHJm3KDa9i7rDsFv/v5JUt24bgqor0NPJUXeEyF75E3ZB5hm/l51XluBhSQW9gkZLz9IlYF18YBDGuVRGFYJEMHu/YcvZZeG4GDs3k1UmbwmUvSXrY1Hcm13xoNniBAXhyxmdky4ek4Ixg7VUvaiyeSBUWJEOdnB3bObImAu2Pd1kQKMSWtRUjhFcTCUpLbiSbsJeLBr7+bhW/aipJQrVXqTt8oBAbde//KXKlOj4ZyMVZE6GCs6LrCWvl3SicdIDceTjdiIxPKLvhdAkgA/etczFS0IreelsSfdtBvpe/EQVgce21BkvdqwxpjjlEcwqPNjyTxsyDkzo/DnxRQMxFr6hoAelrbTS9wlHLet7lqo5sMYjQ6PAddAtvJDa3qXfXwhsZjBEYl7bLd+RTdNTrfus0pGp9mmxXOSxxaBNxioLTiMrnr7HUsGtsHj+fclD01+EDfNb2pdPYaVf4l2+MPdFjMne+GTLznvbpL2spx0NVnNL+JVwhUmCSzMvC4KFvRPpglw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(451199015)(66476007)(4326008)(316002)(107886003)(8676002)(4744005)(66946007)(5660300002)(41300700001)(36756003)(52116002)(2906002)(6486002)(66556008)(8936002)(38350700002)(6506007)(6666004)(1076003)(186003)(26005)(6512007)(2616005)(83380400001)(86362001)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SUzGuUIXgR3HckWg8/s+weTBiRQC0LUoRRdN5De5CFWW9pHju4LJny5oV/88?=
 =?us-ascii?Q?Bp0dLOplPDHLW4fm0vhmHKOb83xQ2d+xELtR1OVgOO5oB3I+smfi2C1/Zrr5?=
 =?us-ascii?Q?Oly9cHYB9guZLaSNvurnKvnBWZc06V19SxiMTCEFQY5HKEQdcyn4ymyLM0Ct?=
 =?us-ascii?Q?sY8gRIpVSu4RFSlVu82wB3LbWAvrSkZ3Vn7cuiNoFoFmw2Ra6j3jKwRqbknT?=
 =?us-ascii?Q?9aLRdEtuusNqLCu5mOlEfzUtsDo52I5kB9tUJm+/HpYa5UKW7qkOoobRWHV2?=
 =?us-ascii?Q?h7cEB+XEgPHMaBnPIp8UsyrBjOYy5pLZMeOfpetgcD1FggVUiuKDX0LRmrNQ?=
 =?us-ascii?Q?wDEb/GWP3djOebHWjwELRueIEXwzdRGy6H+FiJ2JqNxPJg7J8fAjFOyyZh4a?=
 =?us-ascii?Q?xP9DR5o758O4HYdP1GA4yZTSWGdApw+k1tYdclzuEARgonUkJSS898uhdI1o?=
 =?us-ascii?Q?qkwtDGsZvImd8lY3yiIbEMmnBi1K+gJ2P1djSG9UPiVhub7qUkdy6PPjRyYv?=
 =?us-ascii?Q?mKeXoKzFTzVQMwV0AlBA3vwGQ1B3Ahm0Pf7PCR2cWNt1s7b00CdFZVw6PTNf?=
 =?us-ascii?Q?E7491x6G+dRhCCo/8Bis7o6iec5YowG5dTJEzCuvgTqybtpyczqByzO+gAnh?=
 =?us-ascii?Q?W6gn8HeYP3peZbYhDViVylzp05Wrt1OyoRbyGc+0n1Q3z0aSsVcbHUp8nM9r?=
 =?us-ascii?Q?A8eHdgdHUOK+NeQskFe2LGe8UXWNFZJHsNmnz9Br3njEPD+Qc/9+bm9GWJGc?=
 =?us-ascii?Q?UAw/FINsOX4yMHUjpIHsRWM2uW4qG/rHMvidXBhk/jyrmO4GANFS23+M960R?=
 =?us-ascii?Q?1oCdZUV3oExVS5A/FsyhNcG45zcIPnk2pO2IyV53X9p5enro9jdQMzeO2CfX?=
 =?us-ascii?Q?/Dp7UxNVtAAl0SJqyjB1vGFVA0PpLaA7Hf5iNfkBeWJxzWWqL6PYrlYIKhzK?=
 =?us-ascii?Q?R+Ox32J3DTN5udxNGSiSLWA0HECFr4uMyoMM4aMSQXl/iNKCTE6Wpthv1JfJ?=
 =?us-ascii?Q?+h9jjjGTbZmHb5iTIybSV+4l/uMIK4JL25mPkuzk3WKW9X0xzsJtXvOblYzf?=
 =?us-ascii?Q?GpVHM5++Hl0k/rbhdBmLQ4nKLjWDINiat4Dk3SkWExijh9LqRh6/gdiSdorM?=
 =?us-ascii?Q?8yMuXCeNOPefQ9HXivst6gaxtDU0MhTzRAsO/2fdld1uXJRWx01zXGcpI8vC?=
 =?us-ascii?Q?QdgIGvOKdPvxErxFUtkLADeMZN9fIzPU3bUXhpan0iRPswzCuoi//0uOLAOR?=
 =?us-ascii?Q?SRV+xyHI8o49NTPRsMyNe/p1AAVuNaPlqjDUWlFdiWt+getXsDtiusPIK8qA?=
 =?us-ascii?Q?9EMQClZsx8VMIhYb23OMfkwLZucRXR2bWzagpWGvAA+t4FXmjZoyfOujDiUv?=
 =?us-ascii?Q?+W3smMy4KMs4XxSgDC/MQ8L9DgM9TWRcXE5EHGUppPr8iSCRKSvQJLAx8pTm?=
 =?us-ascii?Q?E81Mq8qx9YPPbqLsSwknLplkdkFXC1dAwXD6QfAnj9Ca3LNCBpwVm57309AZ?=
 =?us-ascii?Q?kPR77dJQuBG//VzCPbEqA8Oke4q3p+1GypcEXW4aeCAmIK3ggCMF84pPpplL?=
 =?us-ascii?Q?NVIkGIQBA6X+dFOFW3eot7q6XiJiGft2zsEj+yq6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3653b31f-ffa7-4f53-f659-08dab5c8061e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 13:59:52.9155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvNv72Ric4mwdA4VEBevAGvhbJJ7NBYCLzh98ooIWzzoYyp/FUOSLBDSiFZPGOnyyaiVEVIHwZaHzMgkp4vjSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5113
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Replace if (A) { ...... return err; } return err; with if
 (A) { ...... } return err; Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/segment.c | 1 - 1 file changed,
 1 deletion(-) diff --git a/fs/f2fs/segment.c
 b/fs/f2fs/segment.c index acf3d3fa4363..f6f16d691226 100644 ---
 a/fs/f2fs/segment.c +++ b/fs/f2fs/segment.c @@ -647, 7 +647,
 6 @@ int f2fs_create_flush_cmd_control(struct [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.121 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1omxzq-00013B-VF
Subject: [f2fs-dev] [PATCH] f2fs: remove redundant return in
 f2fs_create_flush_cmd_control()
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

Replace
	if (A) {
		......
		return err;
	}
	return err;
with
	if (A) {
		......
	}
	return err;

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..f6f16d691226 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -647,7 +647,6 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 		err = PTR_ERR(fcc->f2fs_issue_flush);
 		kfree(fcc);
 		SM_I(sbi)->fcc_info = NULL;
-		return err;
 	}
 
 	return err;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
