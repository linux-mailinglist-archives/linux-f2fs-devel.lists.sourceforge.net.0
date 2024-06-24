Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C79E8914F9D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 16:11:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkPW-0001jY-Qg;
	Mon, 24 Jun 2024 14:11:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkPU-0001jP-IH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=; b=grzIpViOGCvomzwB6PnU8yZIox
 +rc/AYvBOgiJ0aj1oxkZfS3hR/S++HDC2tzXxqdq13VtjeLPHOyYjsxiWbcVC9ODa6hOmQi9Xxllf
 ALjBSPNf8EzKl2XYR2/jcCu9FxNTuRyVFGK4L7aeEvv10zOBLTKfU4QuV9CqPXZEI0cY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=; b=U5aFUDomA5Hp1+vCUdNREdohbJ
 1bd7BcSM7+57MiGpnmesfNhHPuLzQUDUiiW2qqOidjAaSE6XHbabEUsGZ2x/pEEN/HWBxMOmJLzef
 YvNmIGCo2bpsa6GUOx0Ion6a+OZjcC6J3rAThZGvrF4Z0DtBMa4e7idh19JAlXFqWpJA=;
Received: from mail-tyzapc01on2057.outbound.protection.outlook.com
 ([40.107.117.57] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkPS-0002nE-5J for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:11:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmvCj2bb5bLz48wPv6VhAldhN3JZTggFnmG97WSfmuTavEXd7F7NEyYTDlDsVOaM4KBEES9voMLYUwcBm70A1kmjDjzFPicqDsazspvXBNp6JxjC+GYzqPd3SzGAxcAnFwyiGxd8g0eL8/U1STjXEG1rIEzShN1DvupVbPu8MLja/gNB474cIV7atih3nZ5ulFlNvqgwm2pcApYgrDdjdSa63Y9pZseoVA+XhtVlJZtyKDg2zoOR14XxehRZy7hoMTfvDZaxnzlsvF2Z5aomCzDAcR2Hmi42GsDiipcQEQunQWOS+tiFHwYGOteoLrfCXR/Kv0GlFBWTBPjWrBD6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=;
 b=G1T6IiBPRSM2sHescXwgCnE0yAs2L/Ec8IgodQU0soWKkS7F/QNC4d6AUNMpMlLKBA3m2xDEBz/aM1O17wslbjYFY0uCqeUtdAVFnJeCBHG5ZOA11OI6Pe2nFfmfPBHX9s9x+6EDHcL7lTGc/Z+eJHT9o/OvJjgUJj5tHoE30/nAA2XnAPzHcO8N/miPNKI/Efk6B6KvVQiKfJyTdE5xBFLpGMTUt/EhklroFXwYvLBdPJVy5ZUiRLqj4btoCCfDa5qdzO4XVh0i7MfSnVwsPFdSIfS2bbrFOc6ouLkodnh54NxD2ydILKyejcBIQYh5S2taJZU5lMh185vNORpESg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=;
 b=eH6sZ86CUBxhe3nA0seoDSp1ovOcIssk1fmNDY24sjZN57DEa/IpAAj9zKh4DcaPKnAA/z1L8vAl+oUqXEAQwXRpCASrm/hlRqd7Ea3XUYo0NzSSZQKG7eAsB5sEej+ky8x8L4z8wVvmY8/R1VitLzJT1+xbzgxE5c+dMPi2S30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by PUZPR02MB6233.apcprd02.prod.outlook.com (2603:1096:301:f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 13:55:55 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:55:55 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:25 +0800
Message-Id: <20240624135532.3330136-3-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|PUZPR02MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 7534db64-4240-48d5-2610-08dc94555e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|376011|1800799021|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S3Vs7cdt4/ZV8JkwfqeGs8lehe+ZkOBz2O/on5L42QNYJAgAHn5sNo419m3Q?=
 =?us-ascii?Q?PA2Fq2/b7AwKO4krrPBZ9uOfxeON4yURmHmmrk7k2ahp7MuvyX/ruz3/w485?=
 =?us-ascii?Q?Kzqzu8MVURdyNZzILowGYiAhH3Vu4A6rrCQDypSgIJKoYtHOm8RBTVbTM6fe?=
 =?us-ascii?Q?cacl2jE3nlyjNUuKPJoEU+Bzv5pclrVCmUj3070dTDRekqhkACCZkLfbpaxj?=
 =?us-ascii?Q?JOuLiW+dKTfDeDeSO3CuWt9H0I8FRnpthY1NQQtgssgxA5gr1RfKjBUMiXVX?=
 =?us-ascii?Q?1NrxJtchFY4zt4uDV9rE2IwOb7SM2Z7rvsTeZ0t9BcUBwOVA9rB0pB3P0cVl?=
 =?us-ascii?Q?96U1xdjiZcefWQQ02x9NBVGB0klzUgjLohnCbePDx7CLWXkNeYl9gdv+cz6A?=
 =?us-ascii?Q?g82uddGpsFAZinuUAE6i9gzIVGmUSAaGA0niBSSB118vsOL62X0brn4YkOIa?=
 =?us-ascii?Q?UI5mJchUxPLZYb6VttUgxSzUdP/jcuD1ZA3MYMmrlqZ27A0/Znegg1EATiGh?=
 =?us-ascii?Q?dl6ysi5Xl63+hbXKqdEI4++UZWmdl9rOm5RSEIK2qqnrBNxPR+2z1VxCgmlN?=
 =?us-ascii?Q?hJNkH+Jv9c/2pkQiHuNFGT9YecZ6QWrnX0liSaqX/N7XBfJJVDfog+fHLh10?=
 =?us-ascii?Q?pP0XBL7oSXbzdkg39Mn4NS3iOU3+2e3hvdmxgG1AOD5vew45eYQtkBt+5Pjf?=
 =?us-ascii?Q?ews9jZOwdruEe4J6iitlgd4/Cy5snDt1mlBaHxTm/AsqawvJR5ZACyfbb8Z2?=
 =?us-ascii?Q?ZjjJXFtM/kglsnbtRrNEeM+7jaYA80jHQ6pktJxXTYjaAHRUOBX1/0k2fd7s?=
 =?us-ascii?Q?jf0vs+eqtx91xn0zQd+rtX2RPy8/5+ihPjoUB8RNxqNoTUM0v6jZF+gDb1FM?=
 =?us-ascii?Q?hVOV6j06MAl9q5D6YPs6a3sLHn7d2E07B1ff+RaFCKzOjg+1vkHVK5F7IR08?=
 =?us-ascii?Q?bLDq2U6SSnCzF51R62kz06D4VGPJfnvj48+m6z499xGwylAYGoj4VTROwxWL?=
 =?us-ascii?Q?4uISmfqBaw2w2Yovc8Xh5iZQ6FdabUnoCQAl2Kd5SB+nc6NZ8m5Ksf/Q6aGa?=
 =?us-ascii?Q?OexZ6tO6VVBoLF1fHoYCnbR0xZNpFl2c1tJ9yCws2OrE/R1cP81mS3f6tT7G?=
 =?us-ascii?Q?0i1UCWHu84DUxnR/8SFdpRzKA9tOw1HJ1pNi0brQN9KDSKuaZ7K/C0FjRJ9N?=
 =?us-ascii?Q?7m7ns/iPnySOZp38dbJls4js6znM7Ign70d3Jd3d0a4rf2I15P4AylkwVZXd?=
 =?us-ascii?Q?vcIpQnU8b5IAWzdAFRq6a5OgPTzjgZRdBS4W/Ipx2DTVg6Gxba3GGOs4wwUR?=
 =?us-ascii?Q?7zPPtFTKAFduk/R6QctHRZ+g?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SH+2ALnQN/1F6gqv6/AUmw5mXqCnjkL8/iQPZD7vtgNWc2LMH5PKyowmgboL?=
 =?us-ascii?Q?Gf+73AgmRXpNa9jouEU2W98s0nxmmcfQjRYxqNsYTJKlny4YOGvlmxrBIXlE?=
 =?us-ascii?Q?knOIV8qm/YFvmi6XCwxG9ijaT/YWh2NT+hIutFP3FLism+i/dqxx45MbXHAP?=
 =?us-ascii?Q?7CiwJAti3QXkJTgLqfMnPehSNDqO5HoFaQTrMmdN4sm6J3BKRqVHrqenDHWL?=
 =?us-ascii?Q?fqaOS2Dq7qw0OVotWd3Tk7705/ibJpmCfTcO8MESyOGGrF21ctWMFtx8gu6l?=
 =?us-ascii?Q?SXWh/fvpU65fftAv+L7O6DTxRzfAHWKqFW1HsWPITRViFn8KNiLyay0z4nki?=
 =?us-ascii?Q?CbV8zPkdYSc78PysfjtfwjPaXVV4VE4jvYAmVizyDyaci57kz9dpGQp5luVS?=
 =?us-ascii?Q?2ejAojdb3hoRsExpKtk89/dRJGBvMX/knF1l4hjLhEh/NV/6Hsyy+eJVmxBT?=
 =?us-ascii?Q?dmCNpSGpJkUyKmQZ9shGNtq/RTt1sJJJkM/hz9LeM10IpG2rOExArD3bTRjL?=
 =?us-ascii?Q?pISYRJcG+pyJRtT3KrpHmq2IBtbszq1K6YzSpkELtJiXlDvUUIXwdbaDrAUp?=
 =?us-ascii?Q?WF49prisCCLztU0rMI/DTfycAiO417dCyTuAKkTCiAbMYuQD+YVGBDTx/6n4?=
 =?us-ascii?Q?WYvz/W8rX49wfFpFjqfqrT5CsDJzZhzuVNTRRqTK1mVdC/Hp5boxWyw7ZZkI?=
 =?us-ascii?Q?BQkjs01rHtjof8Gvxnm4XtpapIp5I0kmwUPjE/nmu6vfqdeKuHzpR0E6B357?=
 =?us-ascii?Q?KvizvC/T9+4xf+WoTgQyPDgc0yozUm3gA1gPal71PfjyKev3UW8aGYF26TK+?=
 =?us-ascii?Q?AEas8LVzUNhq5C4LXyN+WPy6KSx33SUDznsu0t+wBbZGZyvOHh1r4vnhqYPw?=
 =?us-ascii?Q?AAkUZvnD5BWCy2tG90mXuTcf7/zcWfezVONuZ3I+Au+OQKuQru1QsO1ieyM7?=
 =?us-ascii?Q?3BAmdwYGGWgGkYEj6b/pv3SVGbK5grDuU1A6n3oYskcShRekrKAUcYhK8Aa6?=
 =?us-ascii?Q?kN5dF2NkwXp3UqI6K7eEgKzm4im5m/VY7VehOPTfbUrahneWj3wumncuKfbj?=
 =?us-ascii?Q?LMPhwms/7W9JXiD/71doXinA3h9htBBvB732Ropax45a5q1lJZtYbIlJH5+M?=
 =?us-ascii?Q?UeF4N7XRGXvcG6s3zdt2dfVf+JqAzkia6jQJlWBBGaq3iVHO2DqKi328c6RU?=
 =?us-ascii?Q?6F49Uuzc8Y3w6c5VjSzQNSWXfUYmq4xuzCt6lg+bdE4dgNE8XvJF2zS/cpqY?=
 =?us-ascii?Q?BxMsAuY1VfNE3Gd552H+5yIAXIoLPj+GiHpXjwe9zZ6p7dNLPBdSN+yFAefz?=
 =?us-ascii?Q?AxQTP/48Pn+dSlO+BNEGxlNZL/HRr/EtYa/XmJEtCf9eB0g5eEp1xr2BTeFR?=
 =?us-ascii?Q?yopa7oXLkYDT4dfJmJ9gU2TOqZ+ZgMQ4/gbKiOsuRT6wUnEhgb9wkmkeKr21?=
 =?us-ascii?Q?8HNYuMuDK9zHEH9a94jVwJlGq7wjIhMiSYtd/zp516nm0gOsbRXMLPkOBmyT?=
 =?us-ascii?Q?9waLwi8c+goltcZNembq99TTVkj10AEXIWcNqmR97Rf1TLOpgF6mOJrzci5f?=
 =?us-ascii?Q?EoFwhrCibL9oIKdJpR2okcg8UoOFHd1k1L/Z9p1d?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7534db64-4240-48d5-2610-08dc94555e75
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:55:55.9200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/xmccaP/vBDhL0072ANsaLUI7I3zyxB7IGkF+z21z3NvUVzS9vLux8YTxdvrWMU3oDpKtUZN9qnDq6UxOVwKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6233
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a new tool inject.f2fs to modify
 metadata
 or data (directory entry) of f2fs image offline flexibly. With inject.f2fs,
 it is easier to generate a corrupted f2fs image, which can help verify fsck
 or reproduce userspace behaviors of some a fault. If option `--dry-run' is
 used, nothing really gets chang [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.117.57 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.57 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.57 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.57 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkPS-0002nE-5J
Subject: [f2fs-dev] [RFC PATCH 02/10] inject.f2fs: introduce inject.f2fs
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new tool inject.f2fs to modify metadata or data
(directory entry) of f2fs image offline flexibly.

With inject.f2fs, it is easier to generate a corrupted f2fs image, which
can help verify fsck or reproduce userspace behaviors of some a fault.
If option `--dry-run' is used, nothing really gets changed, and that
could be used to get the value of a specified field.

The following patches enable injecting each part of f2fs.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/Makefile.am  |  5 ++--
 fsck/inject.c     | 64 +++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h     | 28 +++++++++++++++++++++
 fsck/main.c       | 29 +++++++++++++++++++++
 include/f2fs_fs.h |  2 ++
 5 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 fsck/inject.c
 create mode 100644 fsck/inject.h

diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 40d31b8..48402ab 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -4,11 +4,12 @@ AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS = fsck.f2fs
 noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h \
-		quotaio_tree.h quotaio_v2.h xattr.h compress.h
+		quotaio_tree.h quotaio_v2.h xattr.h compress.h inject.h
 include_HEADERS = $(top_srcdir)/include/quota.h
 fsck_f2fs_SOURCES = main.c fsck.c dump.c mount.c defrag.c resize.c \
 		node.c segment.c dir.c sload.c xattr.c compress.c \
-		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c
+		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c \
+		inject.c
 fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} \
 	${liblzo2_LIBS} ${liblz4_LIBS} ${libwinpthread_LIBS} \
 	$(top_builddir)/lib/libf2fs.la
diff --git a/fsck/inject.c b/fsck/inject.c
new file mode 100644
index 0000000..f6fd346
--- /dev/null
+++ b/fsck/inject.c
@@ -0,0 +1,64 @@
+/**
+ * inject.c
+ *
+ * Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+ *             http://www.oppo.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <getopt.h>
+#include "inject.h"
+
+void inject_usage(void)
+{
+	MSG(0, "\nUsage: inject.f2fs [options] device\n");
+	MSG(0, "[options]:\n");
+	MSG(0, "  -d debug level [default:0]\n");
+	MSG(0, "  -V print the version number and exit\n");
+	MSG(0, "  --dry-run do not really inject\n");
+
+	exit(1);
+}
+
+int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
+{
+	int o = 0;
+	const char *option_string = "d:V";
+	struct option long_opt[] = {
+		{"dry-run", no_argument, 0, 1},
+		{0, 0, 0, 0}
+	};
+
+	while ((o = getopt_long(argc, argv, option_string,
+				long_opt, NULL)) != EOF) {
+		switch (o) {
+		case 1:
+			c.dry_run = 1;
+			MSG(0, "Info: Dry run\n");
+			break;
+		case 'd':
+			if (optarg[0] == '-' || !is_digits(optarg))
+				return EWRONG_OPT;
+			c.dbg_lv = atoi(optarg);
+			MSG(0, "Info: Debug level = %d\n", c.dbg_lv);
+			break;
+		case 'V':
+			show_version("inject.f2fs");
+			exit(0);
+		default:
+			return EUNKNOWN_OPT;
+		}
+	}
+
+	return 0;
+}
+
+int do_inject(struct f2fs_sb_info *sbi)
+{
+	int ret = -EINVAL;
+
+	return ret;
+}
diff --git a/fsck/inject.h b/fsck/inject.h
new file mode 100644
index 0000000..62543c1
--- /dev/null
+++ b/fsck/inject.h
@@ -0,0 +1,28 @@
+/**
+ * inject.h
+ *
+ * Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+ *             http://www.oppo.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _INJECT_H_
+#define _INJECT_H_
+
+#include <stdio.h>
+#include <stdint.h>
+#include <limits.h>
+
+#include "f2fs_fs.h"
+#include "fsck.h"
+
+struct inject_option {
+};
+
+void inject_usage(void);
+int inject_parse_options(int argc, char *argv[], struct inject_option *inject_opt);
+int do_inject(struct f2fs_sb_info *sbi);
+#endif
diff --git a/fsck/main.c b/fsck/main.c
index 9bda412..f093ca7 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -29,6 +29,15 @@
 #include <stdbool.h>
 #include "quotaio.h"
 #include "compress.h"
+#ifdef WITH_INJECT
+#include "inject.h"
+#else
+static void inject_usage(void)
+{
+	MSG(0, "\ninject.f2fs not supported\n");
+	exit(1);
+}
+#endif
 
 struct f2fs_fsck gfsck;
 
@@ -190,6 +199,8 @@ static void error_out(char *prog)
 		sload_usage();
 	else if (!strcmp("f2fslabel", prog))
 		label_usage();
+	else if (!strcmp("inject.f2fs", prog))
+		inject_usage();
 	else
 		MSG(0, "\nWrong program.\n");
 }
@@ -804,6 +815,18 @@ void f2fs_parse_options(int argc, char *argv[])
 			c.vol_label = NULL;
 		}
 #endif /* WITH_LABEL */
+	} else if (!strcmp("inject.f2fs", prog)) {
+#ifdef WITH_INJECT
+		static struct inject_option inject_opt;
+
+		err = inject_parse_options(argc, argv, &inject_opt);
+		if (err < 0) {
+			err = EWRONG_OPT;
+		}
+
+		c.func = INJECT;
+		c.private = &inject_opt;
+#endif /* WITH_INJECT */
 	}
 
 	if (err == NOERROR) {
@@ -1224,6 +1247,12 @@ fsck_again:
 		if (do_label(sbi))
 			goto out_err;
 		break;
+#endif
+#ifdef WITH_INJECT
+	case INJECT:
+		if (do_inject(sbi))
+			goto out_err;
+		break;
 #endif
 	default:
 		ERR_MSG("Wrong program name\n");
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 870a6e4..3a5d146 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -45,6 +45,7 @@
 #define WITH_RESIZE
 #define WITH_SLOAD
 #define WITH_LABEL
+#define WITH_INJECT
 #endif
 
 #include <inttypes.h>
@@ -427,6 +428,7 @@ enum f2fs_config_func {
 	RESIZE,
 	SLOAD,
 	LABEL,
+	INJECT,
 };
 
 enum default_set {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
