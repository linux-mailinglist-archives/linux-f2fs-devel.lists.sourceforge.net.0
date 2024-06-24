Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A136914FF8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 16:31:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkjT-00009F-Ek;
	Mon, 24 Jun 2024 14:31:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkjR-000094-KY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=; b=Y+rJ/LIXdSDvmfypStF6t1ELjw
 msEhAWhJ0EFS55iCKbKLss0UrVs082oVEg2AtPnT2ScnRgWHyTaKDD6A0Wdbo/YpahhOWx/fqSKgw
 33jgonqKfmmVX7fw7Fvfp7SEzU7+e9+4X4+bYomSWZoITrPADQSgH1hWffPL7bTDBTZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=; b=D11dR22uaLKZPYP4HWJhHqcLOB
 9qkBd3yTGKCf+1O3YNyliAVVPK+ReHojn45d4jVzzPHCopXcbnP5hdBtZRPFCySFuRymz4LS83Rsx
 kqdEZUtaJ74txaNebT9FTnX0pJcp9EzzIgYV0LzeqhmQ1f6PI+ZiFDtMTGogspE76eCY=;
Received: from mail-tyzapc01on2074.outbound.protection.outlook.com
 ([40.107.117.74] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkjQ-00050N-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ke/LBckTWqVPxmDLdmchdn8aM0hFOS5dFYzyRLe57sTznPSFOJQq8lLH1cnRySgVtW+VKmmckEJnqqv69I0ZFTHZtuQ2kEyOfCtv0oy3IVIDLeV4wUJsIvEFvg9Nt02FsutCz+6qbHLxpoM0zZGVQ5JetcnWW27OfZoAYpec0p6YueV7N1MiN8+hEwyQsfqd72vDTEZbhnIYtrAZPWNxnlcaF/njEM0VSxv0SpjHwpNiDNsWOicG+6RRHyzkPgVOZYQzA8WLOv6r8Wx39dpCCAcjNwtzBrDOJEm43pe0XsmHB6QVCoj+GlsKpyNyVu6q5f7jYbIh/SKYKXPwwMDStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=;
 b=V3MLWGa7jVVrcv8V09iqnlyhiV6Y5GaNPixH+qFfMjfHJ6WPAzXSpR1gs/YymsNGchCurJT03Er5MUW/HRqh/PkNYzBy3LoC7MIToAsNoBCJL3G2+RJwgGpbN92AYAdjP2ZJu8ByPKscR1D8W3cvXtorU3SWIbGjYEtZLp1WopZ5I4is3s4qXxmamqRPtctBC4RHfMNICBvCyBaH49J/QvV82rfBK9HyxeIXh8YCAAqVDor0JGtO0bgsFXFYIpo+L63qK/kQPpCsh1ljZcjA66RuszIkLZECixm1No3PCheHkBr/KtxoJJOiE3SjaOTwbOBcQjNFu+dgbQ7d7A3hrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=;
 b=sZmDecekymip8e1bw3Sx3VlaQP5bNcVuyVR6K5YzcrzYR9LWaroMhmmq2fGppvC12HQ5S9UkLs+UPSrRW1UxEc43GsE5LojXNEckwqxM9m7KIdXwZsnnoUWRqTHZIcCp8DqlOpbrYfD0QpN7/Dgs/86Hof6ZiSWK428fuCIINS0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7515.apcprd02.prod.outlook.com (2603:1096:101:1f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 13:59:31 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:59:31 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:59:08 +0800
Message-Id: <20240624135908.3331089-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR06CA0224.apcprd06.prod.outlook.com
 (2603:1096:4:68::32) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ab58b5-b6c6-49e7-e9ba-08dc9455dede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|366013|376011|52116011|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?owTbZ/hPLILCGsxFm9eXFaggxjtH0szsce7NwAkFNFIkiAV5eaxUALzu6kEK?=
 =?us-ascii?Q?b0vdnBwN1mgRPXiuddQdCqg+IcggVUJm0VbDRTd5hLFvEI0QhYDHWLK09jO1?=
 =?us-ascii?Q?JC48zcHRgU65iGbh8/JxPju0XQ9uLNbcUl0kqyUUp0rajGNeJnHvuMsn+xbN?=
 =?us-ascii?Q?cYK0aaoWH+fYir+1pAxqLhBDhPwqBN3NEakgoTlk+06BNjmzJU2Y/4co8kTH?=
 =?us-ascii?Q?hKNJwpdZ9/ShstajAGW1xWotnlxxRhr12ASMCVK99hlULoJ8rMcj++de0Ekd?=
 =?us-ascii?Q?o7/ZAuML0hsqyt/cAgh9OGnsQv/fRlrf512H1G5GxtMgKQM+mXEcjvAfHsGM?=
 =?us-ascii?Q?z8tGnTQwJNKubDv3h/yAuP7HAJNzfzs9xfDZYBtOxzPwTgNrtcdsON/q+L6z?=
 =?us-ascii?Q?rnokuCqSw4IULyGyp8nakRBF0pCYiaK5RbzpB2eEy4H6o0uia/VrEFTuyBRr?=
 =?us-ascii?Q?sKepOlPy2dEhbqd8xfVOqG8+I2MyM/v1UaR1QIbqz1WX9Qmr4njE4gQBch+I?=
 =?us-ascii?Q?auBhPe1NvWJcQUR0G9AWb9LHqRkRRBKbpU3vaMY9f+UROawNr0qfwR9jKtnZ?=
 =?us-ascii?Q?PPrrLc70QC/eHkdWBM1jiylSBW8sNE0FRwhGzR1KbmC7TOsx3zHePOdTpmoS?=
 =?us-ascii?Q?hBS0ip4leWFNkJTr+M3B73rFBtP+wUBXnloeP7KF9+B4KPQqm9iexohgx0Kn?=
 =?us-ascii?Q?j8cW7Voo4oYy9TpnZ/s5jM9bylAQdnfvHL/FzZqYaFQvLj8gs84392G0KkkY?=
 =?us-ascii?Q?lz6H/kYz5ZaH+Qj5pGff4VlhNyqL7/Q620VEG6i7EM2tl9GbZBTOeA0SbFVD?=
 =?us-ascii?Q?NlenBpEezdLA9I/qNkQSm0FKWlaJfJP9s8PBAFwKai0Qkb0P3jEe5+FKr9IA?=
 =?us-ascii?Q?k8P35olLi5XEGokKwLPPXUfi/Pj8tKWuKQuobEq1+1e+SeCV9JFRARuP+iL8?=
 =?us-ascii?Q?JrLPKUsgEaKeMT6R+WyA0JLphmaydTN71U/A8mZke3Il575EQAbVijNBmLkC?=
 =?us-ascii?Q?wPH3HDyXczkFNO6BiuyJ2jDPiFK6QmRvb5SM8IbNDc3QGgcuVhrJQwSdJMoa?=
 =?us-ascii?Q?4ZT9mrY35ax6snTo6/jVWjqM4Sg93zC/GlwEFengliOLCZ183rQlDSxhM1tI?=
 =?us-ascii?Q?MfbSU1J16MLU3hXP9fDjvIFaJc86RljsbkjSK5o8e6NiJ0alYQVn5Vvpgcgr?=
 =?us-ascii?Q?3c0CR5IGZ3WntMU2CsAqkkV/gG917la4TY2Bedq98sPsCPQRw3qW49RrYU2z?=
 =?us-ascii?Q?b1gdQBD6zODM6s7bvRxif4brbn1nRf1HMLomAR38Q/YErT24fsS6wNGgRyIw?=
 =?us-ascii?Q?7uMc/7w0DocaV8n86G1vwn9no1vZ0GjbS2t5qlktGqLl2on8FR2vv1HkVwal?=
 =?us-ascii?Q?A9SzFKw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(52116011)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ano9acGfZxPlAYF3CQwd6I+AC3I1A7kJ5YmnKR6HHrPbj0iicFuOa2WIhCbS?=
 =?us-ascii?Q?D818jtF7wnsqT2Mtty1Dh9owiOJrKSYGpfc5xJ46luINiNHUneWt9shJGWpP?=
 =?us-ascii?Q?vQDlvsOCpXyQZbOHg8yn5VNpe0Ips2s6i+s9Iz1C8O1yLBnH3viWEXXJYcNP?=
 =?us-ascii?Q?26Ln5Bzpn7QUIK2gZciFJb1/n5x8spUlsVcrZSj9J0Tx94DPrdM78EH0w6R+?=
 =?us-ascii?Q?rWapEz3jk7RUF8E7Ax83oVlAa4U9KEGs75qP2G1qhryFzAz9+07CaanoGc3K?=
 =?us-ascii?Q?sTlom9CKvNy0+8ow7c3TU9Sx6ewNd45PcH0vpl7a0Opcc/1sHfTOFJGYFY1Z?=
 =?us-ascii?Q?CwtnoAQHNDktQgYizzhdwbp676eD0fkf975L14l9T6bhqMzs6YY5wI1yvy50?=
 =?us-ascii?Q?ChizEUZOxd+Bukgi0yYbCGzwulDpQKFMfSO6Iantmn+uXdn/9fjTZ4q9AThX?=
 =?us-ascii?Q?MCLeRYmYBNvCqdtIRGBVwVSGA1BaI+E6RVWmgStw5sQRMf6OVHr3T+5KGtYs?=
 =?us-ascii?Q?D7lHx5vEcApeorWx80D8YdzU+nSwS6UPwCy69fMHfCEH9qzGOOczCSwHexQo?=
 =?us-ascii?Q?K/F6J1eNiSLP0sEZW3TaJBoZOJu/5zpClzjb48+skdWOl/PCSEJKdq002fR/?=
 =?us-ascii?Q?pSbavcgRznwbYbYNOM4iWUfOlNqA1OvXU+3JmQYYy9HJI+IGVdAFRb8HO2gs?=
 =?us-ascii?Q?AALNTUkLtOrgf4QvfV09Pj2VyorVqrtVKlU1KMKoVUg2GVuDtrOxLPrJUjCO?=
 =?us-ascii?Q?TOl+94JFs2+tumz1B5N2SbztQAHeP06UBSyCr7s5vKlM4i8VJ/2iMcWnxfdt?=
 =?us-ascii?Q?wUph1RlI75dsnIwFRukPYFha7JrJg5N9gcmwXKELD3AlUruNekGESpO6CJfV?=
 =?us-ascii?Q?QaJQuyOUHvWCUbeQE0vrL3DFpxQRM5imb98NTuST7GK4yEccYp63z8oqYImj?=
 =?us-ascii?Q?m35OoAchIKRc0q35Mzw4KrzkusGS3ilkIhdLHMX4E076uq0h7DrHicrz0wOY?=
 =?us-ascii?Q?5WMNccQ3BreQiWaT9jkQmzKYOMrTMTXV7FLgtsntwIRdZGsskx6SC4ovNTA3?=
 =?us-ascii?Q?IM6RzS/qZumQunMGYWEYGrZAz/y9kDK0ZjtCPX7yMeoRh9QRLYwI+wJgOJ6A?=
 =?us-ascii?Q?koILsFTBVBB2wPu/fkXlEzgjV5EMrdnvEbwnCVEPgTAbJpiZBsc/dIMHOnKz?=
 =?us-ascii?Q?BPjhoXi9EIETa/e4RxqfI7mcHn4BnMhzWaSEXoyrtMeuK3K7wIu3qc1pfMAr?=
 =?us-ascii?Q?GCrslbNFjqGuActgcfN6VC8v4sBNixxfTRkWeLJwJ5qP4wcKv/n/pRkNUhmH?=
 =?us-ascii?Q?2SJi6Wlh1HHlOhRO81jRPePLn2iLM15E+9eoVXMhurh5WdgEADd9DO9dNiOC?=
 =?us-ascii?Q?aN/RavICbKQSu4JOtqOXjtCDDisivuWY6ZpKmzEcpJ5LGKby4eGDpBB4TeGj?=
 =?us-ascii?Q?ob82TF7rAqAAdqV0RszlgeaGwL2qW/lmsBuPxhdJKNEos3R21DMmzeypQXoV?=
 =?us-ascii?Q?mr44nCYeORJ6+v1EKUD5MepJo8GLsTcil42ctmjO8U2Saoyopl+OdpnDZG+5?=
 =?us-ascii?Q?vbt38E24CDYH6ue9Z0PGdsMgOHKQOWY18lfgUPJT?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ab58b5-b6c6-49e7-e9ba-08dc9455dede
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:59:31.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETwKBZe2lcrhvbZtS4ENncCf/sTuSTnkHU4qV/fkKHJ2VoSSC7lvCavDiFU51CDTvecPjvzkvBRgrkvJ0+5d7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7515
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 man/Makefile.am
 | 2 +- man/inject.f2fs.8 | 225 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-) creat [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.74 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.74 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.74 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.74 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkjQ-00050N-Uf
Subject: [f2fs-dev] [RFC PATCH 10/10] man: add inject.f2fs man page
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 man/Makefile.am   |   2 +-
 man/inject.f2fs.8 | 225 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 man/inject.f2fs.8

diff --git a/man/Makefile.am b/man/Makefile.am
index 9363b82..b78344a 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,3 +1,3 @@
 ## Makefile.am
 
-dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8
+dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8 inject.f2fs.8
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
new file mode 100644
index 0000000..01d58ef
--- /dev/null
+++ b/man/inject.f2fs.8
@@ -0,0 +1,225 @@
+.\" Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+.\"
+.TH INJECT.F2FS 8
+.SH NAME
+inject.f2fs \- inject a Linux F2FS file system
+.SH SYNOPSIS
+.B inject.f2fs
+[
+.I options
+]
+.I device
+.SH DESCRIPTION
+.B inject.f2fs
+is used to modify metadata or data (directory entry) of f2fs file system
+image offline flexibly.
+.SH OPTIONS
+.TP
+.BI \-d " debug level [default:0]"
+Specify the level of debugging options.
+.TP
+.BI \-V
+Print the version number and exit.
+.TP
+.BI \-\-mb " member name"
+Specify the member name in a struct that is injected.
+.TP
+.BI \-\-val " new value"
+New value to set if \fImb\fP is a number.
+.TP
+.BI \-\-str " new string"
+New string to set if \fImb\fP is a string.
+.TP
+.BI \-\-idx " slot index"
+Specify which slot is injected if \fImb\fP is an array.
+.TP
+.BI \-\-nid " nid"
+Specify which nid is injected.
+.TP
+.BI \-\-blk " blkaddr"
+Specify which blkaddr is injected.
+.TP
+.BI \-\-sb " 0 or 1 or 2"
+Inject super block, its argument means which sb pack is injected, where 0 choses the current valid sb automatically.
+The available \fImb\fP of \fIsb\fP are:
+.RS 1.2i
+.TP
+.BI magic
+magic numbe.
+.TP
+.BI s_stop_reason
+s_stop_reason array.
+.TP
+.BI s_errors
+s_errors array.
+.TP
+.BI devs.path
+path in devs array.
+.RE
+.TP
+.BI \-\-cp " 0 or 1 or 2"
+Inject checkpoint, its argument means which cp pack is injected, where 0 choses the current valid cp automatically.
+The available \fImb\fP of \fIcp\fP are:
+.RS 1.2i
+.TP
+.BI checkpoint_ver
+checkpoint version.
+.TP
+.BI ckpt_flags
+checkpoint flags.
+.TP
+.BI cur_node_segno
+cur_node_segno array.
+.TP
+.BI cur_node_blkoff
+cur_node_blkoff array.
+.TP
+.BI cur_data_segno
+cur_data_segno array.
+.TP
+.BI cur_data_blkoff
+cur_data_blkoff array.
+.RE
+.TP
+.BI \-\-nat " 0 or 1 or 2"
+Inject nat entry specified by \fInid\fP, its argument means which nat pack is injected, where 0 choses the current valid nat automatically.
+The available \fImb\fP of \fInat\fP are:
+.RS 1.2i
+.TP
+.BI version
+nat entry version.
+.TP
+.BI ino
+nat entry ino.
+.TP
+.BI block_addr
+nat entry block_addr.
+.RE
+.TP
+.BI \-\-sit " 0 or 1 or 2"
+Inject sit entry specified by \fIblk\fP, its argument means which sit pack is injected, where 0 choses the current valid sit automatically.
+The available \fImb\fP of \fIsit\fP are:
+.RS 1.2i
+.TP
+.BI vblocks
+sit entry vblocks.
+.TP
+.BI valid_map
+sit entry valid_map.
+.TP
+.BI mtime
+sit entry mtime.
+.RE
+.TP
+.BI \-\-ssa
+Inject summary block or summary entry specified by \fIblk\fP.
+The available \fImb\fP of \fIssa\fP are:
+.RS 1.2i
+.TP
+.BI entry_type
+summary block footer entry_type.
+.TP
+.BI check_sum
+summary block footer check_sum.
+.TP
+.BI nid
+summary entry nid.
+.TP
+.BI version
+summary entry version.
+.TP
+.BI ofs_in_node
+summary entry ofs_in_node.
+.RE
+.TP
+.BI \-\-node
+Inject node block specified by \fInid\P.
+The available \fImb\fP of \fInode\fP are:
+.RS 1.2i
+.TP
+.BI nid
+node footer nid.
+.TP
+.BI ino
+node footer ino.
+.TP
+.BI flag
+node footer flag.
+.TP
+.BI cp_ver
+node footer cp_ver.
+.TP
+.BI next_blkaddr
+node footer next_blkaddr.
+.TP
+.BI i_mode
+inode i_mode.
+.TP
+.BI i_advise
+inode i_advise.
+.TP
+.BI i_inline
+inode i_inline.
+.TP
+.BI i_links
+inode i_links.
+.TP
+.BI i_size
+inode i_size.
+.TP
+.BI i_blocks
+inode i_blocks.
+.TP
+.BI i_extra_isize
+inode i_extra_isize.
+.TP
+.BI i_inode_checksum
+inode i_inode_checksum.
+.TP
+.BI i_addr
+inode i_addr array specified by \fIidx\fP.
+.TP
+.BI i_nid
+inode i_nid array specified by \fIidx\fP.
+.TP
+.BI addr
+{in}direct node nid/addr array specified by \fIidx\fP.
+.RE
+.TP
+.BI \-\-dent
+Inject dentry block or dir entry specified \fInid\fP.
+The available \fImb\fP of \fIdent\fP are:
+.RS 1.2i
+.TP
+.BI d_bitmap
+dentry block d_bitmap.
+.TP
+.BI d_hash
+dentry hash.
+.TP
+.BI d_ino
+dentry ino.
+.TP
+.BI d_ftype
+dentry ftype.
+.RE
+.TP
+.BI \-\-dry\-run
+Do not really inject.
+
+.PP
+.SH AUTHOR
+This version of
+.B inject.f2fs
+has been written by Sheng Yong <shengyong@oppo.com>.
+.SH AVAILABILITY
+.B inject.f2fs
+is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.
+.SH "SEE ALSO"
+.BR mkfs.f2fs(8),
+.BR fsck.f2fs(8),
+.BR dump.f2fs(8),
+.BR defrag.f2fs(8),
+.BR resize.f2fs(8),
+.BR sload.f2fs(8),
+.BR defrag.f2fs(8).
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
