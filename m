Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 811B792AE2C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jul 2024 04:32:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sR0dv-0005A8-Uj;
	Tue, 09 Jul 2024 02:31:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1sR0dn-00059t-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 02:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uc4wXMSPo2NdCaepPWZOvKiN3OoCu6zXU2+XzzzF4GY=; b=Vk0cX0JV7QH0ZyGXBPJ5q/T4kr
 +HxcjRZJ7GbRDsRiVTtmyE3YKguM5fFtfRJT+yTdY/DCu+XKRXHrHp2zBxvMCcZzYAONyd7cFpXUp
 HUVuaBJI5vw8WDYKvZtgkuqk/in1fa/kM4gQgC9HFjt7b8aG19W8R35L3VAXH+2EXH7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uc4wXMSPo2NdCaepPWZOvKiN3OoCu6zXU2+XzzzF4GY=; b=mBFwJFSnmm1JWliqoJ+KJn2aI5
 0KajGXZUZYH5hjAFa46gAQKVh4Wwb94QNwyn8WNQaD6HPxLlsHr6CUSW1BttsIT77e+wddu+oVBXR
 FaBNcdvmgveccL8RsIzWTpFWNclJfXdDT8Dz+M84FUkF3+1ahuHIbKmoPv8IMkIIijgM=;
Received: from mail-psaapc01on2062.outbound.protection.outlook.com
 ([40.107.255.62] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sR0dn-0008T5-RX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 02:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCw7EQn1zoF8yzewKlNt+jI55Va3XZUzNX2hoiz+XFO3FedkfQVwZhq26AL5mCqjQjoVm8SrghLdu4V1BuUfcTYe4HX4uImvXnPC91RUJ1t29FqG6A5mOPLcMtUcVqk5rpwu/rGHGuF6bd4ZMb6IGvykogW8+ma5rWf0SjDALcgg5ZJKQ8el6ISm7CbLeQV8L5KO4+pRyT7mVitsbspheeZwb1PlUAngya7cyv6/06ebNTIYo6Y9YsmFLM6dnR4ouT/Klr6sFWyr2/AGmvEKja9Yhhaudi22XXuZKjVQ+WwHZQ2rS9twhs5PaoduSxnTwT1cqJODLVn5z0Dl+6Epdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uc4wXMSPo2NdCaepPWZOvKiN3OoCu6zXU2+XzzzF4GY=;
 b=PK5lQSV7BtA4mzu+BFq/TIAw7SLbiOOcIAx+EebbptCgG/QUnOr17AgFOgHjDEKOopfEAkWGjM0GsVMmzJ+329QLsc4iFf7Fhv79hhUI70MbhlqLGFSCYGzUenglojHy3q6WYr+GHdL/59C86YJpR2Lv/pgBhZgVkZWC6jDKTIzzE3zwFX50fyLjwePrNWywOK+Gmk3j8ly7qtoHNowVIsf0nNbhBevZMXFLLNMPeSGdtzCCIFT0b4TQvRLkPtx61XaA+q8LVqWuAUKJbjGukUQegK3+R+JmgV0CxAoIkytOz5UO8RpS/Z5r6x10logiPz5WhPRvBdoF07dTDAs/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uc4wXMSPo2NdCaepPWZOvKiN3OoCu6zXU2+XzzzF4GY=;
 b=A6pRYfH3gMz5Ym6i6D9Y47SNtLVcHc6Tnv0nmXoo5ivHMglkWw88nnx/B5nNiY1M9r0fEdqBR0u18XL+HSsqe1fHa60W4AlCWHS19POldp6nNiuiY0epgCpaKN7AqWUMMJ6Ok6c//Buubu65b3NwCieHfY0xoLRUlxidCuyF90Z9V5PSXfXaGEBb/XkghKLI5VU9+E5qcFlIqF/UaK5T6JOBkJ658m3LK3nk5NEh1qgukiMzN6uUuMNTNWiVk75GlLpXlGYlQzIWdu83kjCmnAy4x4jRKajnL1Qbk2nq9syBpNHxO5xY3gL3ghY4mCtN/NLoiHQfpfJnD1cPF0oKmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB6609.apcprd06.prod.outlook.com (2603:1096:101:17e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 02:16:30 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%6]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 02:16:30 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  9 Jul 2024 10:16:14 +0800
Message-Id: <20240709021614.17044-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240702062952.28859-1-liaoyuanhong@vivo.com>
References: <20240702062952.28859-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: SG2P153CA0036.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::23)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c337b2-d783-4806-f605-08dc9fbd24ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+7SMAckjYmQJuIFshxV+v8it1P+HHXvtDWTXlkO547W5sYnPkYTspnh9zT9L?=
 =?us-ascii?Q?X/ShNUpebHAePqK5iIBEJejA08otcxEVdzmNFERiZc0Of0SwVQNg8CbjM+F0?=
 =?us-ascii?Q?Pv+c0VxzgN98rjwPnJGqqFAnmxYTjZ7qqU9O8M3Hx4UoVwMeN4cM+YTwZO0R?=
 =?us-ascii?Q?HUn6OC5Qamq6boUaOfZEB/O3aCRhhWY28bt8pvgVDBOCXoUkqtgnH940x3Hb?=
 =?us-ascii?Q?awMu8auGj3Kd8Ou4nh0EtHKyJbdUkEaHC+W/hDT/A+pjuiEGZCIpNL+j0S+K?=
 =?us-ascii?Q?6GfVQW9R758J/hbBvJSi8P1GmkB4bXULRNGRunwLeOK0EkZZ7dzy3i+8raV2?=
 =?us-ascii?Q?wo/pLFNfP/V4GTDSCpGOwnSgWww9wGc13A63SR3TDglc1MvSZM0qanCVt/Y7?=
 =?us-ascii?Q?2jRIN4VaD0NDTTE4RR2vqNDkHiWw0BHP8zZbWVeGCb5Xxwv9JRF/DBefI5G/?=
 =?us-ascii?Q?1kxdBtq2+AZmFJv8P+NJsVZHUVu472ec5OMz7lMZggHRVDFvTwVasM0RJbHk?=
 =?us-ascii?Q?RRTkCDcDH1bfq2ptVOUZbpy0/w3E5EhIIKgggP0EjIiZwCtlet7nJB67luGR?=
 =?us-ascii?Q?7PaA8MXhai46MvbjmslAJagreknjo+ATK3IZZTLZbY8tAZ/kiFqUE6Y6qn+4?=
 =?us-ascii?Q?MoEotn5MxIDiWttjKU9udHsI00GPsk8+CJ6iXXtfsX2OqrFkyA5nHXUrBCv+?=
 =?us-ascii?Q?Z/s5uCG+h8B5upzbmM2BMkzgcFoNwAtEvTUuAXRchAs1/PCzgjRrVCapDmEx?=
 =?us-ascii?Q?KV3F14ETSaaeWYp5w/TcyOPCS5aFpcpkjQJYB6RPNxk0OFa0IojXBxlS/6w3?=
 =?us-ascii?Q?JjLtdkzkWfoTlT940rpObyCoA8qnXlT7Tgt4inndjHr8tEh83Ry53XOs9yj1?=
 =?us-ascii?Q?VP1OnvHmXiExVTDWWm7isV/VccbUB7m3lVxYlwTvsIVdJbfarP6K9Gv+Z6N1?=
 =?us-ascii?Q?TWd9WHDjr/Jz+y1K87OoJxdkzwmeI7PPKmlRI7TvL14yMEaTyezoKFBQMBAs?=
 =?us-ascii?Q?37fO1vJC/cl4hAOTmpKCEB5/pC6NAfJLFXSS1V7e6u98Z8PB2dgBQfxi3L0o?=
 =?us-ascii?Q?tEzhJmgZB8aVgoPyy0yQHq47s82XutZPb6cz+zrvy/PTHffkZczSUReyos9D?=
 =?us-ascii?Q?wU5MGuGwls07ExEFFhutzNAFcNa2etiAPpo9e3pf3IbUkAl7OWQTlj01Z9+H?=
 =?us-ascii?Q?p1WHOLMdaPcAIWqCuOzj3RCnqF1IaEhFtXVMX9XRbW7Z/QkXnO4pujZCA7dZ?=
 =?us-ascii?Q?D9IEocsLNz5GoPbraHdOg4iAG8B+83ydbvcsOgZfzlN8UNCSCuaDwvw9tj1s?=
 =?us-ascii?Q?g0Zz9bHYn98OIYcVoVQ2udyo9Uc3H2sSDF/3Pi5X7CXDsd6E/SAQLDi7MdPf?=
 =?us-ascii?Q?MRGwHROrUu6iDNIYyzl6IHye0CapZRK5XcD6NNj9tmRoZ/WgpA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5C4l+nHoKtOxl2xfyCAVvc17jUDhrVxRD29AmFCRsAfy9uOOhrOykazx8UqS?=
 =?us-ascii?Q?Ek7n7dA+4rqjUas8Hr6hiMBFcOhzQmwxX2yGKtLfKTwl/o1vn5YqpBKyp9Yc?=
 =?us-ascii?Q?zNQao0sM9zoX5S7zy6Q8YFFud50baq73F8AyCcqhxQoupXiovj7DmABQbHzy?=
 =?us-ascii?Q?nwrCleehGUMGdBE40+9JDb0Fqym9cCo9rfER92uHIRBVBrMwhtImzM7LaKxJ?=
 =?us-ascii?Q?S7qBNuPYBgCqJjBTqSu2g2pIyH0ItGrzeWlYgleodUE1mKhkjWvghpj0VFAW?=
 =?us-ascii?Q?Tq83O/ucTXs+BnZTeFc6GQ2LyhiWXlFzMGOkwcVsHGbsupZXmjXa4IHu3Hp6?=
 =?us-ascii?Q?jVFJW6K9dUgVc8u7s8gzJwbqixDsKeH6sspGc/ZbGBuY5lRx2wWCX38Y3IZJ?=
 =?us-ascii?Q?bPjk4f9FcbGQKnRtvhE9yA4jBR6qsAXGC7FaaKwa1EGAj+4nYHGnF+PUCot0?=
 =?us-ascii?Q?bTnkDuoe/y+E+Zs68JVvBV20itDKX0VqQ+TJ3IA82AhV4N9XWdGhtBbeANtt?=
 =?us-ascii?Q?G4Lk5+QZgG4Eq+hYM/xId5BIbDgDXi1rYgaGSW9JEy/dnOeWiUFzZvszk5wG?=
 =?us-ascii?Q?mAzhfgVPVZ5IuG3lJ1NBbVITJAMnMZbfE5GFP0KKInNVeI13sEOIwvOjilWw?=
 =?us-ascii?Q?LN1Kri0zzqIDLzV+xAmtLVMGH3K/ZmSfzr5l0SsyWPOApvvv+XLW8iyoqVuo?=
 =?us-ascii?Q?w70f5kqzwau35dabJLasEMi5FoHHv1vZiKAYMxFysVlaQUJrWAFU80XQMOhi?=
 =?us-ascii?Q?j1SrylYCc77M8MxNVPMLU3W8tytiCkCfl+WhoIjEk1I61VSSthm3LqnRJLRw?=
 =?us-ascii?Q?WrWM3WKEwiWUjSetOxj3nfngcyzPSjSMvlgpTspIpDLqSNzxkWXT7uCAWuyB?=
 =?us-ascii?Q?N8ALIMQxbKWeEjOISIYOnD/oPdOIsgfRiRTnJhle2O/HmAVsWPYvNDuNdc6m?=
 =?us-ascii?Q?SUpCql/sb3XTnUeEPqlvZMpsti25//XPjakV4kJ1F/s1KkVMoU5fZTOMK0Cm?=
 =?us-ascii?Q?GwkRzRLI+bfni/CntsksathxSedLy35uIV26ziGyUI3WkpfnguJyd5Fg3Qg5?=
 =?us-ascii?Q?NMWvTVSvbNU/womaiVNNfdVScz7P8NsQwoumhTHflufth4tdvIStrQAdtAsZ?=
 =?us-ascii?Q?2H4kxmHhc26tYM+Ah3qeCDw80kTqablb5JD1R87yKcWpcx5TuX8hXMzsfEU5?=
 =?us-ascii?Q?6K8GwWCleL23l9UYNjI/8AkK+yLSvy0RnI3czcex8kRkvatOXaX2zTL3sBqS?=
 =?us-ascii?Q?Gpf8GC28fWtDOGIiU08wtP2ZjqAIEUvDdEcGI20o09Jvfj/Ulajdz+pz4vPX?=
 =?us-ascii?Q?5NWKWniKsP38UxExo5xmn30GSEBON8AfHJAJpoIVmms4Gefi/ZgwF30eYY/V?=
 =?us-ascii?Q?KhsnhMzUVP3Z2257OWQ38pD9F0IvotKxImu0OegdQbUkdnTt64X1nX7+SLNC?=
 =?us-ascii?Q?6NJ7QwM5Fzbsu4gv/d3aUV4M341O+igxI5SHhYsKn8XKPPiSLkGXVYhZ+a8J?=
 =?us-ascii?Q?xCg/2vU4kHNKKnW3/JzGzTXvODINap9OQC6ZeqKWpxWzssU9/ULCVenR2aOK?=
 =?us-ascii?Q?m659eKsbwGY6Hiq27Hnc5SawjFXc59w7f3X+4AsO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c337b2-d783-4806-f605-08dc9fbd24ed
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 02:16:30.2346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olvIhrewnrVyyKlp0LsxlYAGgkPfxNsfiRZoGxi68JEghafHMFrPcH90lSTuqTCLjvTFwr2XUYWqy2B+2gJFoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6609
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, we are using a mix of traditional UFS and zone
 UFS to support some functionalities that cannot be achieved on zone UFS alone.
 However, there are some issues with this approach. There exists [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.62 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.62 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.62 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sR0dn-0008T5-RX
Subject: [f2fs-dev] [PATCH v3] f2fs:Add write priority option based on zone
 UFS
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, we are using a mix of traditional UFS and zone UFS to support 
some functionalities that cannot be achieved on zone UFS alone. However, 
there are some issues with this approach. There exists a significant 
performance difference between traditional UFS and zone UFS. Under normal 
usage, we prioritize writes to zone UFS. However, in critical conditions 
(such as when the entire UFS is almost full), we cannot determine whether 
data will be written to traditional UFS or zone UFS. This can lead to 
significant performance fluctuations, which is not conducive to 
development and testing. To address this, we have added an option 
zlu_io_enable under sys with the following three modes:
1) zlu_io_enable == 0:Normal mode, prioritize writing to zone UFS;
2) zlu_io_enable == 1:Zone UFS only mode, only allow writing to zone UFS;
3) zlu_io_enable == 2:Traditional UFS priority mode, prioritize writing to 
traditional UFS.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
v3:
	-Delete excess comments,
	-Use enum instead of define,
	-Modify some judgment criteria to make them more reasonable.
---
v2:
	-Change name to blkzone_alloc_policy,
	-Update manual of f2fs sysfs entry,
	-Use macro instead of magic number,
	-Initialize it w/ default policy in f2fs_scan_devices,
	-Add validation check,
	-Merged the ifdef PROFIG-BLK-DEV_ZONED area.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
 fs/f2fs/f2fs.h                          |  8 ++++++++
 fs/f2fs/segment.c                       | 25 ++++++++++++++++++++++++-
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 5 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index cad6c3dc1f9c..3500920ab7ce 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -763,3 +763,17 @@ Date:		November 2023
 Contact:	"Chao Yu" <chao@kernel.org>
 Description:	It controls to enable/disable IO aware feature for background discard.
 		By default, the value is 1 which indicates IO aware is on.
+
+What:		/sys/fs/f2fs/<disk>/blkzone_alloc_policy
+Date:		July 2024
+Contact:	"Yuanhong Liao" <liaoyuanhong@vivo.com>
+Description:	The zone UFS we are currently using consists of two parts:
+		conventional zones and sequential zones. It can be used to control which part
+		to prioritize for writes, with a default value of 0.
+
+		========================  =========================================
+		value					  description
+		blkzone_alloc_policy = 0  Prioritize writing to sequential zones
+		blkzone_alloc_policy = 1  Only allow writing to sequential zones
+		blkzone_alloc_policy = 2  Prioritize writing to conventional zones
+		========================  =========================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f7ee6c5e371e..adefd19810ff 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -134,6 +134,12 @@ typedef u32 nid_t;
 
 #define COMPRESS_EXT_NUM		16
 
+enum blkzone_allocation_policy {
+	BLKZONE_ALLOC_PRIOR_SEQ;	/* Prioritize writing to sequential zones */
+	BLKZONE_ALLOC_ONLY_SEQ;		/* Only allow writing to sequential zones */
+	BLKZONE_ALLOC_PRIOR_CONV;	/* Prioritize writing to conventional zones */
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1555,6 +1561,8 @@ struct f2fs_sb_info {
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
+	/* For adjust the priority writing position of data in zone UFS */
+	unsigned int blkzone_alloc_policy;
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4db1add43e36..b38b92e08c6c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2686,17 +2686,40 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 			goto got_it;
 	}
 
+#ifdef CONFIG_BLK_DEV_ZONED
 	/*
 	 * If we format f2fs on zoned storage, let's try to get pinned sections
 	 * from beginning of the storage, which should be a conventional one.
 	 */
 	if (f2fs_sb_has_blkzoned(sbi)) {
-		segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
+		/* Prioritize writing to conventional zones */
+		if (sbi->blkzone_alloc_policy == PRIOR_CONVENTIONAL || pinning)
+			segno = 0;
+		else
+			segno = max(first_zoned_segno(sbi), *newseg);
 		hint = GET_SEC_FROM_SEG(sbi, segno);
 	}
+#endif
 
 find_other_zone:
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
+		/* Write only to sequential zones */
+		if (sbi->blkzone_alloc_policy == ONLY_SEQUENTIAL) {
+			hint = GET_SEC_FROM_SEG(sbi, first_zoned_segno(sbi));
+			secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
+		} else
+			secno = find_first_zero_bit(free_i->free_secmap,
+								MAIN_SECS(sbi));
+		if (secno >= MAIN_SECS(sbi)) {
+			ret = -ENOSPC;
+			goto out_unlock;
+		}
+	}
+#endif
+
 	if (secno >= MAIN_SECS(sbi)) {
 		secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4a1bc8f40f9a..d5b0b7b141ce 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4229,6 +4229,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	sbi->aligned_blksize = true;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
+	sbi->blkzone_alloc_policy = PRIOR_SEQUENTIAL;
 #endif
 
 	for (i = 0; i < max_devices; i++) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fee7ee45ceaa..359a12f84060 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -627,6 +627,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 #endif
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (!strcmp(a->attr.name, "blkzone_alloc_policy")) {
+		if (t < PRIOR_SEQUENTIAL || t > PRIOR_CONVENTIONAL)
+			return -EINVAL;
+		sbi->blkzone_alloc_policy = t;
+		return count;
+	}
+#endif
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (!strcmp(a->attr.name, "compr_written_block") ||
 		!strcmp(a->attr.name, "compr_saved_block")) {
@@ -1033,6 +1042,7 @@ F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
 F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
+F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 
 /* STAT_INFO ATTR */
@@ -1187,6 +1197,7 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(unusable_blocks_per_sec),
+	ATTR_LIST(blkzone_alloc_policy),
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compr_written_block),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
