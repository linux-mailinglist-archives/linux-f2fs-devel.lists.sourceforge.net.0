Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E86D969769
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:41:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slP6A-0002rq-3O;
	Tue, 03 Sep 2024 08:41:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slP68-0002rL-OT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=; b=dCffUFzPevvU5L6+kEo9qLBQ4W
 JMkM+onE9XxGzgiCpDG0F2MqKgeGLW+Uk7FWLTlg9giEWXW51ha8ukFPQkAgy+69tqcB3VXvRepPQ
 6owH8s1iBUqBlYkDpBMmUg9auPXsqMbD5xxmyapkvw375GzqrRxV4Rb1cJbCazfLlTfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=; b=nFk629xcguBDWFYD6R+2azq34t
 HmowRas+02T0xXkp58ubBXh4Dphjcqtz/7yZQN01i/krb6yTlM4eudayB9NOAjOs35rPTuihXnwy8
 k5n9qHQQ0zya+JLwE40Y8NegqM6D7cvJjEiyRDgVr9Xp+I1ri9HLBwaGWw/1VDTA3oMo=;
Received: from mail-sgaapc01on2060.outbound.protection.outlook.com
 ([40.107.215.60] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slP68-0008VM-Of for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:41:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxfQzvCZ6ZqDsiGvcRDRZiQ51b9gN2JFrJthjDXFin8I4TlAQOfD99pAumi4i1K3miJZiEbX3pvy8ICS8CQAfLGeZYKnuVs9V5GjK399wtxd3cXvvA/MwBwfGyZ/dOaGipQnzdphG/KRBZdyg4kYEV9/uKSf8ZruvNmrAr7oAFMitOtvEPlry41YPS+TNxuLAocDaGnX9R4Q10lickyTXpqjybMZ8dXOXQ/xHUTCIMQEjgB39Sgo4JPX6nGxjRlU3iGGUUMOBwFlx5vWNW/eDxbETI0Kh6TQO8n+2uQAcBSGbnGtvwN9vJyzrmmHvzktuAss9a9MeSlzCz014OHr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=;
 b=M95K7KZT3a/J2gEdaAkTdYz0UGonya10LRRjufYJubOGHIsDtNx5zUQ1HVm0pMteoZRoyrwizUP9UZm1kA07G+vtQxMg+jiluXXtMxVySVOHa4n8dhpt0C5npu43HXe769Ldb4/83vnpnu3F6gqmrq+sBc3b5XgTVhKZzghSGJmyZpa1L3lRAnOZizGh3G5Aj9IlGoCqbUaYsghbyYkLSlADOuk/yjKsc08ST03W/hgpcGt1LQRk79LkEIGYMvaZKmjQjFC/s0RL8PvRs7RtaP1nOLolCT4PyBy1pzCKqebujZw/Hd/0+0G3vkDf8MkATTsqqDTO9Zt/AbndlvGeKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=;
 b=iD95AKprc8NZH7tytyhY0EaF67NpD4vKroLNtX/aoEjJcIBuuGM+1icU97q9YOHPh2kTED9teqaHUYEK+NzXLWN56I+ftF9M0EDmkaDrTpM0Q8ZtnLfAXajfQvZFDX1O3PerfF2XN/mYJl1XHcSQOJk77V7LdK4aygXoUGOzJiSID8f9/LK09GsX4S2TP/4DJMpl2nXFF8yu6EDo5MT613Uy1aP4aGgV+kRvpOzXqy9cNXaa8OUlWGgJhdAnBmZiScdAF0MRxv7EEZGmkKyHsmmVWx9YB04zIU4cKn1ukygs1ZY/K5ZYZsqIHBluY7L+ftQUHUTZIRh3XZThKr+Qfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:57 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:56 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:52 -0600
Message-Id: <a76b4bcb04c636b7e40443a9c372679db67fdb6d.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 524ed027-c50f-436d-b851-08dccbf4211d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9VkuVtWegon8/CyUMWQYUYgXkouCocz5F8JIsZ44vTmLewjsqGvMC6FoLExi?=
 =?us-ascii?Q?PUbFy8s2g6lGF3Dd7teaAhiwas9EDIbiFmObhwsf3D/1VwHCXsW03i5tKDym?=
 =?us-ascii?Q?6o9T/0XqMnwaNjWuMMFDDKxhhPhE5lOicuatwRG6qLFGd/5D+Xb/X1ev9GOI?=
 =?us-ascii?Q?Lz1N8Ko4GEO48QWyppmObOSYrKoD7PPbfCvIi1z9zV8gVW8Vx+UOuSmcfMFu?=
 =?us-ascii?Q?uNpSmd2IhexRNlvg3GGMzEpA8l6WgCiQ0Hx+fnTcLj2CdUR7tIxSGh27kOHS?=
 =?us-ascii?Q?HWXe1s0jMZZWmuxsuJeeTzY1AnZK2pvjDa+SGmNX7TmsvQJoAmwv5yIHWr2o?=
 =?us-ascii?Q?oKX5+aBjWok/YwLRhuJwD4y1UNk9f8/syqRXJe2Mzb5tQ8/cCH8ptMt86kvH?=
 =?us-ascii?Q?o17Tv+zgzOtCZAVl4YhwyrHhuymY7u3ivdO6imwr+nvm6KEsftOVCD0VPP/Z?=
 =?us-ascii?Q?v+eiRM9cxGNED1UeoqpthzbJq0IH08gebjqQ5uqsYCHCWiWUPZr+VykFyahs?=
 =?us-ascii?Q?LKZ/QTWiCsC2aK6QttaR/+vKT7YT1W7sbXrRo46hm7UJemuro0oUGBYLC+VY?=
 =?us-ascii?Q?/2qU/agHbo06BmhNDdRoTmZLapwAeW9uhGBaxaby7gwk0wipO+81hMLzmInZ?=
 =?us-ascii?Q?hIWswZrDPKuyBqCMlvODPq8Mcj89glDqKYwGkQB3z8Giz91Mw2zS9drYFgjw?=
 =?us-ascii?Q?eGtItFl9obE6ow9j/y7DXgZgGAVU4OnIXetenTimKaxI0fdWg8cM2oi7Aqaz?=
 =?us-ascii?Q?8zzijLWOiT1Sfxz5GzoRRyOYPBbA/xg2I8Vsc3AgJQg5ORA/bq3PTARpDEEj?=
 =?us-ascii?Q?DDiDim/svt3sy/BNZFV2JXKlPsp4cf4tl7/b+/BHF+GoZPnYHhTROEY/3Qud?=
 =?us-ascii?Q?2wFif0y8hErrFugGLBWIyQo6qPIioIPHrrAjySrsYrrOQk91M2wY6uhHBVV3?=
 =?us-ascii?Q?/u/YKjbqHFd2N08kPM9Xi+oGBs1E1vg0svyx4Epoq4rr41q+lYVqXL3OVwNl?=
 =?us-ascii?Q?ccFa60kPLaEaZGMNXKy5ZuIvP3EZQ7WkeM1xckiR/cB2DgEpz+/7QS7HTdcS?=
 =?us-ascii?Q?SCj5UMOWSw7jFAIuwlbBPswCrfgGhGc0Xc/fue76w2WVFwk16KsRG/RHUV1B?=
 =?us-ascii?Q?EmSel4ntUz2rLPIz+2FZFEjEdftbpL/wlMVEs1C3bsk3i48DfFNdiNygXRVW?=
 =?us-ascii?Q?/+TzU5fW0z60qXVdhS6EYUFtWvewC//NEjD0Olo5WCmIGc494eZhIqa2aess?=
 =?us-ascii?Q?rb2qGyBycP49Syc2abKIyBcIhRs9kiK6xeKjr8nB6PKhcvslhJVUuIiYGXWo?=
 =?us-ascii?Q?cRx2D8RmLpi4PJ0unXwmEr02EA64YqeBWHOfJ3uDYbt2uylMV+tF/XyWZqW3?=
 =?us-ascii?Q?joMCOtxLguD3mdAt44D3NJ97U3/VbWgtjWk5Zcl0UVVGS4iTpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?806ihpqjcYpHnn7K9nbH3AqQQ3zVChgatNlwk96yl4CZWVN95uyTY5aPVcyg?=
 =?us-ascii?Q?tFJNI5vxUk2LB38LnBnkHfXcprGFWwyGTAg19iSxpCRIbJI9ulsY5Fm6lwyf?=
 =?us-ascii?Q?0Q3TXC5QobzK+tZmQv6JMuDgViQVaf/fWnzGwBnaP9/+u7VM6vAnm4mMGVbX?=
 =?us-ascii?Q?OCdWG+AAEr5uR/DdLgoE2qEBfTxyqbkC5aU4UtKg+xxzN18UGJM0F1v0QBKn?=
 =?us-ascii?Q?Py8C2h+TrbnZyQPv1+/iAjCk399H6dgpTbvMdI62eFB44Yb/CzVkGhgEbvet?=
 =?us-ascii?Q?D80e5yn36s2+L7ZudsSngxbBQsjQbbo334KcPknXyiTPFjvTMfD7HqltFkt6?=
 =?us-ascii?Q?iZ2d/KWy72C2uakercS+BJeqjDz1xXHEUpIa9gTNHFQf+R82zkLO4kX8dFPc?=
 =?us-ascii?Q?Zwz2q2OsFdFm8vNGdgvG2w6pEJxI/b1Gpad3LxrL/0iFHFP2xKNHLMWCFZXm?=
 =?us-ascii?Q?nSsEFW+RF4DzO/nX0LPJIUvdIWZ4TSqWGSH2NpPg4RNPb3HdPGuDoxl4Hk6i?=
 =?us-ascii?Q?djrRr3YLRMzd6f01Ql7KGhPISP1eUyqSKym8GAcgkxPQjxiSV4ZUv5WvQMLQ?=
 =?us-ascii?Q?PVKoDOzD2nPv5VR5JY5ha1LE8gp5FgEpYdHlVyGkoEev32Nn1oncrNtj0Dd/?=
 =?us-ascii?Q?nLdOVZuGvO6HaSkNJ8l1Jq3taePBGVuP4gmqf8B07xIbpfWvGRP0e7SmcRcl?=
 =?us-ascii?Q?9N9s9onGUMVlGcrvK1siDl5AcXxMMnHMApwQybRPMF3YidV+vxaTjD1cCzzv?=
 =?us-ascii?Q?XTZ/UKUHiMHr5nEKkrHnTlhJ+tM0EbwYf5sNWVAvfEY0HYcAL6tc4XnBdOSL?=
 =?us-ascii?Q?O3Hw3aCUcAA2b6N1q68k00felzDfMKibAL2Lbm9YxQbc3wvYtFxJBD1hVBRz?=
 =?us-ascii?Q?Icvr58q10AT333gxnaCXVzg/ZqqDwMbLeMfe8nBvRGNC5Xa0gVmaDZS8j0LO?=
 =?us-ascii?Q?rTAsC2fGe6zYOydHq1idvsMzoanj4UQaejpABfm3tgjiiOaAeV0aU1Juvo8q?=
 =?us-ascii?Q?MCBirhiU4Cnhbw1G5N4zfSNQHqPzZgWdm3wdWkMDeDy8Sw1evi1aSN3Izvt3?=
 =?us-ascii?Q?vQYdhkkCTpoDFGhydEOYRl8+B7iSnSC9jFMFnKwvccMST0ks13Xlu2ua5yon?=
 =?us-ascii?Q?1esj+fE/pySP7H/xapoFWCyRHo5eT26lppomFL9aX9IAyq90BjrhtdAN5d9g?=
 =?us-ascii?Q?GnHO8/Jb36J0lGdtCZHXfXmi7JolMyzQgI17gDLSPjuYt8Sr2veiqKPYDAuV?=
 =?us-ascii?Q?oHAhTolofS1Qbfz80OKYCJ+FdOcHApo4cvSUAdhMPm27sTfpcw0Xn2SXexZp?=
 =?us-ascii?Q?wFXTLajxHs/NjyBrSkywSEcD+Z0vXHlvvxZMkBLQrSKWSGt0gWqrkMZhyPxq?=
 =?us-ascii?Q?bytbWa5u3QCXgbJsJixmVxJxJIr6uYuLEFZF07fjgrslQljIMUlSXYoGlhsu?=
 =?us-ascii?Q?ETv4h607J2YxG8edU3Blie+Rh+gfpXwnbAXgl4VLlVbJlXn9Pin1m8roZIG8?=
 =?us-ascii?Q?ZhYZJm0m4xy/GxnKHqbqE9PYE30TFlm4djeRtbTK8OgOJ9tF/3iF8IoQpIHL?=
 =?us-ascii?Q?iKPfuli87Ig/UwjIah2ES0wvcRRDbTHb1PViVkr7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524ed027-c50f-436d-b851-08dccbf4211d
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:56.9243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dlJE7qLI1wXH5n2mR86zSz+BEHCZwqvlKU+B1zGzatkcDJzd+tkw2cEDHiG31fhmc0/0NUA5gjtzKyr5neTeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert an inline tail file to a normal file when the inode
 expansion exceeds the maximum size allowed for the inline tail. Signed-off-by:
 Wu Bo <bo.wu@vivo.com> --- fs/f2fs/f2fs.h | 1 + fs/f2fs/file.c | 6 ++++++
 fs/f2fs/inline.c | 43 +++++++++++++++++++++++++++++++++++++++++++ 3 files
 changed, 50 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.60 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slP68-0008VM-Of
Subject: [f2fs-dev] [PATCH 08/13] f2fs: convert inline tail when inode expand
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert an inline tail file to a normal file when the inode expansion
exceeds the maximum size allowed for the inline tail.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/f2fs.h   |  1 +
 fs/f2fs/file.c   |  6 ++++++
 fs/f2fs/inline.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2e0530b55e74..f889d97209c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4211,6 +4211,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 						struct page *ipage, u64 from);
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
+int f2fs_convert_inline_tail(struct inode *inode);
 int f2fs_convert_inline_inode(struct inode *inode);
 int f2fs_clear_inline_tail(struct inode *inode, bool force);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index dda4cf6d7325..2551403a5b83 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1783,6 +1783,12 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	if (err)
 		return err;
 
+	if (len + offset > MAX_INLINE_TAIL(inode)) {
+		err = f2fs_convert_inline_tail(inode);
+		if (err)
+			return err;
+	}
+
 	f2fs_balance_fs(sbi, true);
 
 	pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index a542956d618a..c2f84f3dde67 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -235,6 +235,49 @@ int f2fs_clear_inline_tail(struct inode *inode, bool force)
 	return 0;
 }
 
+int f2fs_convert_inline_tail(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct dnode_of_data dn;
+	struct page *ipage, *page;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
+	int err = 0;
+
+	if (!f2fs_has_inline_tail(inode))
+		return 0;
+
+	page = f2fs_grab_cache_page(inode->i_mapping, end_index, false);
+	if (!page)
+		return -ENOMEM;
+
+	f2fs_lock_op(sbi);
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage)) {
+		err = PTR_ERR(ipage);
+		goto out;
+	}
+
+	set_new_dnode(&dn, inode, ipage, ipage, 0);
+
+	if (f2fs_has_inline_tail(inode))
+		err = f2fs_convert_inline_page(&dn, page);
+
+	f2fs_put_dnode(&dn);
+out:
+	f2fs_unlock_op(sbi);
+
+	f2fs_put_page(page, 1);
+
+	if (!err) {
+		err = f2fs_clear_inline_tail(inode, true);
+		f2fs_balance_fs(sbi, dn.node_changed);
+	}
+
+	return err;
+}
+
 int f2fs_convert_inline_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
