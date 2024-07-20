Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCAB9380C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jul 2024 12:34:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sV7QA-0001wL-BZ;
	Sat, 20 Jul 2024 10:34:35 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1sV7Q8-0001vu-6X
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jul 2024 10:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B+CcTzxFnSc0blY69GjJxpN+CCB0nM3YiiWH2jUP8rY=; b=P9xG3uMAbj4uaG7XQ5eGD/kA4g
 AxKK7+6IsnXhPwGLdt0xARdBG1orKLoO9rKDD80Su8AXBMp2he9/fkxhslMTbRn0XMpvRYzzmQsPI
 TDtB0b+lBfB5/pn2OVcK1Xu/FiFJ2E6A7D6WZ1SHkphMhkxhfmSmBPeY+x3E//mThy48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=B+CcTzxFnSc0blY69GjJxpN+CCB0nM3YiiWH2jUP8rY=; b=R
 MhfrZhhXiZ2fqGg9vKGhhahE4rL2Xn35ipxjRst7SUjWGjuXcwLvLueYBUwMmv6zG5ecF+Y9CSlOd
 omLA/k9miopObjue4Bud41NPCVHPBAk3dia1fQO4oDlDqQf0I9EZvIadZHDPBQ09kQodzwUzwsd0O
 WwhtcR8gJHooZy2I=;
Received: from mail-sgaapc01on2070.outbound.protection.outlook.com
 ([40.107.215.70] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sV7Q7-0001pr-Bf for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jul 2024 10:34:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfseHttwX6JO+iGqBgOASwTLQHJNGdGKrP4kEc0PnMCkyYkizpS71ZXROsUFEblmdGxMFAhD8r5MhjwHivuZ1x7byqUjYqwT41xk0Btn3zSaNbPbG4is8oQnMt4Iui+5LJuxGAagxLG7wX0dc9h2+c8lNTpLKjVz56g432kiHOe1A+S9v80sXTia3aVJyjHdj+mC98hyBLzSCOkASFnNKdnUTqIvkunmZcJgbCeMQ+y1lrJDh/n4RmK0vDntX8bCzAZphGtBrsvFRnuy+LEbu7UiDBkvfeB97kz3z1AgOdWXUn0L7Sl1gHFR1i4CK3YJ8CcOsxmWp4RmIgFj+dlpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+CcTzxFnSc0blY69GjJxpN+CCB0nM3YiiWH2jUP8rY=;
 b=T8m0v6c/pB0K4rz4/3Pmh2dKxOBxwq5b4PLNUQOktk4mlku8bLVFJoWGr+p1kdZZt0f2G+CAU9hrMcRcjr1H7NdxXOIjTq3VpOn1TtDA2xYK+qDY3BclVuvcRM+t/pXbFk/XNQlCHJ6U666LGCdDdqEOPRk/J/b5r6LbO5Nk6mrWZ7AfslRW84dyiaOvfCxAs3BqhfKxo0lw95O78BkIyudYdsPKExehx2UzXr60WsstFjZug3qbu3Lz1zW8FueUu78UQ1Denono41It/bgG5jb5TtFNHpFkWqt7HmDMOCNKoaZH1MjxVL3iyGuUPN5zTHcJ543nIdMx0QnmEPAdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+CcTzxFnSc0blY69GjJxpN+CCB0nM3YiiWH2jUP8rY=;
 b=uyJ8AaSTWXp2i/Qg/2yyTIkSPZBtpV3bTrqpCOjC0GUaVBdiGiBEE91PyDJSrNdOfU7jQypvyRZ9pMN9TKq651NaSY/5gqQz5OawEVPnbkAPlrEOyaRj48jMvzrsDl84pPINoZ0GeJuwp2xlps2JRU40hqWVrvQLQgW8KOrNlzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by SG2PR02MB5652.apcprd02.prod.outlook.com (2603:1096:4:1cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Sat, 20 Jul
 2024 10:34:19 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a138:e48f:965e:36f9%7]) with mapi id 15.20.7784.016; Sat, 20 Jul 2024
 10:34:19 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sat, 20 Jul 2024 18:33:49 +0800
Message-Id: <20240720103349.3347764-1-yangyongpeng1@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|SG2PR02MB5652:EE_
X-MS-Office365-Filtering-Correlation-Id: cf4a8f67-c9c4-4431-f734-08dca8a782e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+i6YL20BFSmKDHX93t+qDaQTN70KFbH5FPpkq+Z6nyh3yB+cF3gcYpRGR8Tq?=
 =?us-ascii?Q?19cfsO4cpORIX/lrpUn49c8zNQEL4Ji8mBvOFxxP8xljQ/fNkFeVFJw4/w/F?=
 =?us-ascii?Q?WX7yfDwGeMsR0j99U1NgAB+++aMOmhRi7yVCMbza64okXVKZAYrpXbFQosZm?=
 =?us-ascii?Q?dhQBoWTXEeGqPTEnXLmbcXSjM3NgOJp3aQLgIXooS2ixIQEbTKfd++8Kwso+?=
 =?us-ascii?Q?GhSduvIlH4gu60YlfxGT98AsU3EHYFvGLN7SkRRjx5q4eaGIWzNvgMp4cbqP?=
 =?us-ascii?Q?ZxG/U+TCiHF0+ELtPhjU7m62ISvitg5vQxce+O9jZm5sBCluznODP//wsTeV?=
 =?us-ascii?Q?25+UhkraltgqUU3Yp2JXxKfFbpCtZNpwIKqUPMOetH2W7HpQdNyUEvHabHab?=
 =?us-ascii?Q?eHa15fz1vfSPpz6Yfn1jOtgFUZ/F3cbZyRumRsHHnBIpt+3bnykb749k8Ka+?=
 =?us-ascii?Q?Y3hXpAUIDVLvjE7+8xPRXzjDgC1jfIP2ymoE3QlrF72z2WaEsFUeD5tVP+s6?=
 =?us-ascii?Q?OCFSvXHVLCBIIRLJ2boG1sOAjt9HsiSw90P4TQhIejHhOfpgwl7EEAKJ/XlL?=
 =?us-ascii?Q?sAaFhq6WIgV1672gxnWmy6zawYQnixdov47QB4eAXeOitRBSd5BeutSzu6kU?=
 =?us-ascii?Q?Z12onrw/k2tN+AIuydh52Tu+E2z95ptq5EerHcw44vk7uU+Ws4yGGQc2qfk1?=
 =?us-ascii?Q?aZKi0c2/3mmg2DT8F0Q9Xywp212+4mipHdAl3963wVscUZv0uEuq3/eCJnbp?=
 =?us-ascii?Q?u6IMC0LW2lgnkaCU/tp9W47xVS3mruybmxilmPl4wdXey4JL5X+4Wu5b3mFN?=
 =?us-ascii?Q?eEtQHKXLsXkIfy33/P2yCgnb2CanzHrmVuYA52pmCdO9QAG/lEHElgXN1L+j?=
 =?us-ascii?Q?b+3eWQZErD94CDxvppALyUbsK680l3Q11JTIfMRdDxmPNowwT1yegqzphR4n?=
 =?us-ascii?Q?Pk9lQuysBF5K1Cb/WjKXBxtm9Nx28/URfJpoMkIGpQG106be8/Vanb+Ho6/H?=
 =?us-ascii?Q?7w3sXLC4fgPNtdVr5Pq6D/0+zNHrh9a6f1zMNqkm55J3usMQ1FCmKSpd8q4D?=
 =?us-ascii?Q?QbkM36Nle95qkp9R9HDH2TjCWAfs6lAni+gDjOrgY0j6LoNbbbRSnedKQ6Ap?=
 =?us-ascii?Q?zjlFbUVeGMY7K17jy9cDOwUutIQzIdP6HAG0lmuq9Wf5BOwIRTKL1laUlmni?=
 =?us-ascii?Q?BR1MQZmlBWFvzzmvBVtmH3wlKqCPBFhaMaWEeoQ0MqIoIjq2wLkBCajUb76s?=
 =?us-ascii?Q?d9APavA6Z1HErnh0eE+/0fnzLJLS5HxD/8qjqBem1TJ/oTpIJzr9DO9DGmtR?=
 =?us-ascii?Q?oBfNvf2tBiBIgfx8KGwBYYf9IkalMFxmKyeL5XKJ8uJWRdPspIYPFXEykfJm?=
 =?us-ascii?Q?Cr01kcECDaVLkZokTG51q/BwKpOq6GxC0zFr3ZaaFAmVbpENAg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DeE+D24m2cuf9fto/39C57u5MTnCMmF1zIQb2vXj4w1FFn862jdU/gNNBmWu?=
 =?us-ascii?Q?VwynnF5SKHeIir9NNMPw4X/h8zBazFuzor3wkRb5K5uOjMNaZR/iAe77K/8q?=
 =?us-ascii?Q?vKlsm8Qo2lV4/F7Cz0lFzfBP9ZzBGQRRN9UJ/EGK4uXmfvfhYtQZA5fHLvcv?=
 =?us-ascii?Q?rEfac2HkI0oaxYnVkJOltdIOivj3lzdaziMuEaGqIJKwMB+45EFSKdqk6XW5?=
 =?us-ascii?Q?Ae4PCN5mpmI6ou5lEXWJmhnGgLsjGJqRtdHHhO/ay6oxOHYvEx4wtFXnKCkc?=
 =?us-ascii?Q?XbZ550FsM05lvxICZKu1E1sBCphTySLTP35aMYm+O+31cIjT9di6qXx4TIXB?=
 =?us-ascii?Q?zjqj0hWFwaRtcVX+9ivtr3kHmhA0N/ZYtHtwGlm8gtbA8GIkcOuZzHCNy1Em?=
 =?us-ascii?Q?NvzElOBceEnYPiwSj5MhWhjYa9vUiOMrdJPGznvVCaiDv4NsuanYRPoeZNUE?=
 =?us-ascii?Q?dYRRnIQKU4vDYuzI4mqf7Z592hkghLxhVRsDyVZayb3NLt1yIm7zpZPUOEnO?=
 =?us-ascii?Q?ieCaBPug1VHwavQpwxlvXnWXCrgeShb2WrTE634xlW3KnNL5JakOhDjzg1Eo?=
 =?us-ascii?Q?BH7Z2TJJS78UfhkyccotY8rx7JO8qS/TFxwbQQDxGJvshVeH+WuIZxmzUVTg?=
 =?us-ascii?Q?fU39ZAslxXo7gBKLynw/LyUMpP7RY3396LL7CwtBX7bbb7ESw50Asz7gRb8v?=
 =?us-ascii?Q?GeintbdfzR82+1ymxJVbQ2ZM4/qGfJcHJdUQ6s4F8wnx+RCbFQAYcsW67g2n?=
 =?us-ascii?Q?VM9srY40ubbsgrjEtpqn9PlwT8Bmd7WKia6qB75fZ/IW9nrxAiFmtDHeW817?=
 =?us-ascii?Q?8TmcTqK7B2f/OR1Tuwv5rryA6cVKTCsv4EP4LNsEWmBcDYLS4EfngCN14/Cd?=
 =?us-ascii?Q?hOdmer4aRN1xr66rnmnGD90A05PildgCHSptOoTmKQuSn9uzD/87+dvdMp/b?=
 =?us-ascii?Q?zo9NdzhWr/o61Y0ajSOCnfa/LpRBSJY/8SyMPYCdRiKuTUlXiJwMZmZX+TlX?=
 =?us-ascii?Q?jZCX+VxRQHptB7FS0nxbIvLF+DYBDRyFO9G0zMlBxqrKH9fOdXl1iD29ZHSL?=
 =?us-ascii?Q?MCVXxSWxP+TgyiCG4ErOM7Ulp52/Q66vUZ3yHXEuBz0gD+RF7QDb8owSHEDQ?=
 =?us-ascii?Q?0O4g8EXsC00LOoM++mbYGnxvNWVQz941yHYquptEtkuVzRWByQUUN616RXQd?=
 =?us-ascii?Q?8K6l9o+M8Vs1rZz1l1LVn7DY5pCz3B90t2Re+DcEhcFEkoe5v+36cSp1jqGw?=
 =?us-ascii?Q?oy7PRCnjTckuUD8dmreQBFRG9z18tBjw57zc5QMCG5lTTNMjiJAYB1vvtpFP?=
 =?us-ascii?Q?y/5OAMn2zEBxJO1G/FKF9uBDt8jNWNV+6btT04RYu1hB/ltBgLOeGG4TeUJh?=
 =?us-ascii?Q?OHF2w2IhO055rCYW19JzaCU678bB5TDC7wfUslbwZgc8F1aFDVHjk4lqNOAi?=
 =?us-ascii?Q?i9jUlk+yQwMf8TsmlwOEplD7Qz4/n20xI12GlNN7cmhc8+4sIrFPubHKqr4J?=
 =?us-ascii?Q?5iUKX5ypf0AuKgVZgh5fV3Fv/Kf9HTfPjeDY6FyUfOr5i+Nw47DwkIulMVgU?=
 =?us-ascii?Q?R6wrqon6D5EkCV6Vo11KCI90/NqVPvWw8y7+OCTLSE3CgC1J7JF9gZ3UzbVT?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf4a8f67-c9c4-4431-f734-08dca8a782e3
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 10:34:19.1041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4jiyg4KD24FZsps9riCwuih/5JuveIfJTkQtdvxwy+4ckWPtU1tfk94R9rWEE2Fz5VphL8iL7LyWxW4BnmRvlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5652
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In the init_victim_secmap function,
 if the allocation of dirty_i->pinned_secmap
 fails, dirty_i->victim_secmap is not freed, which can cause a memory leak.
 Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com> --- fs/f2fs/segment.c
 | 4 +++- 1 file changed, 3 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.70 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.70 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.70 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sV7Q7-0001pr-Bf
Subject: [f2fs-dev] [PATCH] f2fs: free victim_secmap when pinned_secmap
 allocation fails
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In the init_victim_secmap function, if the allocation of
dirty_i->pinned_secmap fails, dirty_i->victim_secmap is not
freed, which can cause a memory leak.

Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 78c3198a6308..1e784ea3dbb4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4971,8 +4971,10 @@ static int init_victim_secmap(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	dirty_i->pinned_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
-	if (!dirty_i->pinned_secmap)
+	if (!dirty_i->pinned_secmap) {
+		kvfree(dirty_i->victim_secmap);
 		return -ENOMEM;
+	}
 
 	dirty_i->pinned_secmap_cnt = 0;
 	dirty_i->enable_pin_section = true;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
