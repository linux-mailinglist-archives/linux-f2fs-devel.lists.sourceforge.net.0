Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EABD792864C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2024 12:03:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPfmc-0004kw-2W;
	Fri, 05 Jul 2024 10:03:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1sPfmZ-0004ko-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 10:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6AeyS1YGXun5k78Brcj11zEowrTKYVPh2u3tv9kMGtw=; b=m6bG2TyyWRVdPUJJ6+jRrBSGB5
 EYIvgin380nCs9A8+YhKKSs28MUA7TYCN5XTAIasx3qdPCnjphWUv3wwLVPJvvcqrZKPfvVLyELJ7
 j/YIkQmrFgRKUZDeGNBJYNlwp8V83E1/x9Hwel5kJD+Vqt1royiS6pdPSf4ozUMgCFj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6AeyS1YGXun5k78Brcj11zEowrTKYVPh2u3tv9kMGtw=; b=WwWembJVP+/sdSLb7RkOuAj8ms
 rm9pmfkR2EQbu2/uYSOFmu+qkL28YZvyI38KcN32NT3PufvQzTNVfgNQgfKZ6b3sbHM4smp2Mah5g
 EI2OskImrJYxCfKNfxv467wapL5GLHrti3FFa2Lq2teyRNo4n7ZEPklTu8JYjbdLekrk=;
Received: from mail-tyzapc01on2081.outbound.protection.outlook.com
 ([40.107.117.81] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPfmY-0001cl-Jv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 10:03:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYRdNU5lQtTFxjagQAa45ejCcGta2XpfNxyIwpwMLMvSN2XeD0GFnrnsfN5y97wpeLox9mnT016W43b6lEH7FhXo4SVmBq2BzNZb6Wxbu2OLXHECo4hp+u631uk7U1hoGygqu+NQgSTFPGWb44uYBRR7Z2Bmm8dRmCQdVGZ0pHBNwtTv4wiVM14l8gzdx5/yX5DMSq37fFGlGYaOhgpWz67uedKd232M/li9UCLwMSp2dbI+eSjspdH5E4M1jAs8ZSlBm/BSsHPVOz+oPDGdDmEj7VKDHDCnr7naupwpNr4xYSPN4UjnP7vToFTdSKjXNO+U11YySiLdZoqXNIAi3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AeyS1YGXun5k78Brcj11zEowrTKYVPh2u3tv9kMGtw=;
 b=gIMX2qc58O31sNJSYc10G9yORXVMyJnF/HFizdYiJhRtkvXvhV8R3U2aJxNdOnCsU1N3SfBzn/mrEYG1yNQVekm/jXA5im6g9UtoARPZBxTH/uaCxdHCyAQd244kwdeMH8G9zcgTebFrWn/cI3+Q2LWG1zu8/zxtq8raH9MCyvVJn0yFktjMltVqYSgdiJSkTqIBDLPXwje64vf/tEMhQUh2iuyZpqg8rSLna4Z6mbPAYNpgHrPzLLe+Xw8vrFMPV+l/2JrIjCayGt7KBYzLLscyELJCjZUQSB6SvaexrxcSQoyHt1saJrp6e+dSKMJVgjiWqO4UIOBNS1UhjC1nYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AeyS1YGXun5k78Brcj11zEowrTKYVPh2u3tv9kMGtw=;
 b=iFwx702BOiXNGpmfLhIAMTLKoagWQi7PLwKWs7ewX8F16FC7TUlNKJl6OViaeZw6dGJK0h65xmo8c7wPmZhuEfp9XzNWMQrC/XFs/rMYAGR6UoFqLFKMIMvg2aLqQOVqYQi8cCHuoSyt+9GbLrTna6GGatNBPsfvXpJ9vgdE2f996U4OZ/gMuRmHeTEG07Gtl4V3wwKXQEs55i/28TiRd4geQCWoUbnDGMvOxb+3515G2/gi/jZUHIICvoAKUvRjqpYo0y0HdW65OJ/NLPASTGmRAV8oJO9AEcAyGFOcODJuLqKh11KihAd1qzhosm/Qh/rsNWNcrec/Lf/jRqY65w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYSPR06MB6625.apcprd06.prod.outlook.com (2603:1096:400:47d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Fri, 5 Jul
 2024 09:47:03 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%6]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 09:47:02 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  5 Jul 2024 17:46:41 +0800
Message-Id: <20240705094641.13451-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240702062952.28859-1-liaoyuanhong@vivo.com>
References: <20240702062952.28859-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TY2PR02CA0062.apcprd02.prod.outlook.com
 (2603:1096:404:e2::26) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYSPR06MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 0414de78-7c4a-4f5f-c529-08dc9cd76bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WrhN28s9hAMapXu47s7B66L2qKeHCyhYFOcdX7w4ku5ni3mqQIIkzoEP/20r?=
 =?us-ascii?Q?N8iowNUpNN3Phgj6yYKlerEiitMF3y2gyQTPLxRSHkdCudf/bqSihe92gL5E?=
 =?us-ascii?Q?8p2C6s01bh1JzFJNqGC/aSYY9XX79CLhZzCgCUSAyJyZulv3st3jFO7ll50j?=
 =?us-ascii?Q?KrG+e6dqY2R00+t1lZPGOSYO8IuIq5DsLuoAEzXg0ahy1Fnf8W69rC3bS3bS?=
 =?us-ascii?Q?WjpGyN004nkG8P/cX9XMmHOGvXoDCkYwsnYd/nCsYlL1bJWeBoOU/Pat6e+V?=
 =?us-ascii?Q?dQVeRrJ4oZ0XKWFi1SX3gU9m5bVKUOIdckX1GjiUk8fQHRUWvh36wQUaCSuN?=
 =?us-ascii?Q?ijKrU5sri/VjOArMHQb6BtB9ccpolL5+QjkrgYPdvBRWiVJDNwAXVw84f3wQ?=
 =?us-ascii?Q?IrI3z2U8ZNqMy8eXmlq+HzqE4+1a+BLhxp+KMWL8lV8Jp0t5fZSfgTxzQiLO?=
 =?us-ascii?Q?u96Alcfe3DCiDjziPdIQEIDNbAa5GX702CMTNrwCuYfNiM+tkDq3J5RNbZ4/?=
 =?us-ascii?Q?UkR879c/qSXUX3Y76UnScMOPoQrj76ub821CY7A69fi90cig+Qb89ANY1Lid?=
 =?us-ascii?Q?KuLKPpyoeJiZbRWuDz++/QAskyF3DgYtnG36WpkHWX3fsg0i5To9OW86w2oo?=
 =?us-ascii?Q?nYtZAdFct79eM/zDbYl0pOSkbyitzQFlbNDqOESDcPI0zwq+s0EVhEIKYLn4?=
 =?us-ascii?Q?ea2ijM5P36uj/Qq92hBHY52JWYZOTH0B1DqeKl9rZsdGraz+RXPsd64pnUZn?=
 =?us-ascii?Q?EZdZAsu9qkz0aDvGjDfU9aAl1m1aa3RDt2x41ZRAC/ZQgL3mSMmSWSQoa2k3?=
 =?us-ascii?Q?bLEJzJkCiq3WVsVEsnei4lLyu/YzIclwvy3qyrJPwHJeclD05pu9QP36xFVd?=
 =?us-ascii?Q?q+1IXNYjwbcc6pWGOjWS/uRpijxD1yRRli1KjbfewSGHG1OgLOIopxw3KaH7?=
 =?us-ascii?Q?JjvCbj5lAvOUqHsIas9R7fXLu1sj2hLxlrqCn8JDUo3epsMs9jRmO4UamV0V?=
 =?us-ascii?Q?GBa46nJsPypqLjEFL2MagNrOlTiv/LV+2oIFSRgHkFtz4mKOqUT9J4quSPN4?=
 =?us-ascii?Q?+mFMzf08FRhqaKdlLxk8QURlEscHg68BkpqbXt86CHlYFwgAluU3FVDqfpld?=
 =?us-ascii?Q?pTeh9Ag4Ear0r2RySYxkLjGeunimO0rGE18gt681UdITAZYMVTExo5ira+f0?=
 =?us-ascii?Q?qcKbdLXA5KY5HWfsZ9PNzDpZZsMrSRX1IAcn11hCnFYJnjBG0l/Lls8VS16U?=
 =?us-ascii?Q?u0QxHJ9vHfZAwQ7qeP7yO9Wq/8KvgJvMaHhZZHEM19exxBl0W8vEn0L8HnXg?=
 =?us-ascii?Q?2OLDqOWFPhrgyuUCh+O7KHfLHuzPffWcY9hK4HJwQv3RGEQ4YayanCRgjhhK?=
 =?us-ascii?Q?XlqzoGFHuCDKiW/+KgcpDPwrNDzwLTu///AP//8197qmc/PANQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VfEK6juiZ1vTyBL8ZzfeOpaYa63VCU4AzknbA5tOysjXkFzvc+7zUo0vrTef?=
 =?us-ascii?Q?KH42EnIcmxOLeLIBoJSO8auUpTm77LeeVmYtvqyP752G+8ccsdSQjvcjn8WJ?=
 =?us-ascii?Q?+1IPHgLeqZHwiVgPMXMHampib85yO1ZRVZ+HcPyRnmT35OLyJl6dm29tF/qj?=
 =?us-ascii?Q?9is0dp7OpJ9tkp+ossEgBjdY7b+t1XxfcPgGrSk8l947YuDmpvRRSOQPZLNv?=
 =?us-ascii?Q?atw3+2DfpHeinOfp5LrPxibjk4jyijL/fbwuJu5P2xQaYYGAAQKPqmOLGCN/?=
 =?us-ascii?Q?NkJMRXyU5YpFSaLpNp5FP7ijhTXEPmCZ45t+p+VAQq4sSGYM9V1XkAJsToyY?=
 =?us-ascii?Q?hlXmZcNTsr2dUf9nlIgSW2U8CRH75Q84wgvGU6JguTJTyrIrsjsRGfJpTQU7?=
 =?us-ascii?Q?BpeT0dDdOtmXvyxQb63GJKrGxUozfi7Nk0yACEyWPW1fWLbQvN1UAnIPXdnl?=
 =?us-ascii?Q?7TBQY0IsU7kEhWss41KGhZXzk0o9zvBZ1y9cxVvhM46S6F+Ro/9Omlh9GXSG?=
 =?us-ascii?Q?pdU/Ysk5eRGluZ6rsD1+xr5y7LK2P+EVWVIBrxDVSRl0OAGMgiNZfPitXtgd?=
 =?us-ascii?Q?zcDs1Zs+z5F1HYUInbQcxOs3++mz0C17m3RHuv6J6dhw3Lr8TOuPF8NUf1Sq?=
 =?us-ascii?Q?a0wrf6nNGQv4bfntXB7dfyh+lRwA9mfYAcVI3lTJV65cxiSBNxmdxxC1AdAI?=
 =?us-ascii?Q?yDM90Okfv2oIUhTR3AtfWsj4C78V3SvG++nj1N9npsUKkTDz62TTuJxwUsok?=
 =?us-ascii?Q?SNaC6AAjOyIlfgzgLabmUD2+VOlqBIyOpD0Aa/V/Mb3ROBAEm1mGVapmrWY0?=
 =?us-ascii?Q?W14x4O44HQsDK6+Hbxgftp7k/v9VaoOfeVbNvDvRQTbLVGu8CWHXfCUdaIQ7?=
 =?us-ascii?Q?7t9XPp7pLgLSukroGqwWRftuhvwMbhHGCd0sAuTXkTWIeXnLxgzcb9KODQbk?=
 =?us-ascii?Q?RjgWlw45DYUuakxrFUVMBc6BkuAmoQxH+IP6wD4M70UNVqQfY7A3doGfpZW2?=
 =?us-ascii?Q?sa3qlzaHGgv/uTlMLbjePf1CDD8A6ymesMtMA9HC4cPz2zKFx9fgMmhUcN0V?=
 =?us-ascii?Q?bqZp8H512Hd4ca3GmAxljRNAL5iCE/v+XX0TLf0yJDPtzgjW0JDdSjpRyh2Q?=
 =?us-ascii?Q?GOdfxrxQTNE+3pDhMEzHBmV/D64hmegimvrvjJETtkqnLV3RXrtHre0RxMdU?=
 =?us-ascii?Q?H07bjIu/kaLYCf3TODDcgzWutHgaJvAjxta6grXSYvSQHj9QvJnfgelFCcxI?=
 =?us-ascii?Q?hZug1vgwgXi9/UNzrNSDcoo+tvIIYL7B3rFvXU8Z29rB9vKezxtc99bLhgS0?=
 =?us-ascii?Q?GnHh6hAhoVqtGL/4OO6c9InURZEdg51JZDrSw/RwXhrg59K/Cx3iWFwpW8MN?=
 =?us-ascii?Q?4qXY1TwaoosLf2mATv7E2Qel+qr5/46uYUidIooNrgeKOilGU8JV/asMgnVC?=
 =?us-ascii?Q?MIWIFOALSiafa/bVJagX6nmylI/qxpXYdIPQh/DSslV6qItT8QTQFY1Jsx5n?=
 =?us-ascii?Q?NfCM6G0RXakd74xC4ycF3nNVXiJegSGzMsmRE8CkPzuXfXntOvBZd8fpSBjZ?=
 =?us-ascii?Q?FqINFhJ7z4Ou4dUOt3jq84zi6iNEZ6jtgY2Aj0bf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0414de78-7c4a-4f5f-c529-08dc9cd76bc5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:47:02.2486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IQag3uSCyaPiEZ6SFMyKdstBFOK0GB9NEQAE3HS3Gfw1p5gPOkaoAAZe5jT7OITCfka1C1PurmHkP1jn1Nzag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6625
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.81 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.81 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.81 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sPfmY-0001cl-Jv
Subject: [f2fs-dev] [PATCH v2] f2fs:Add write priority option based on zone
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
v2:
	-Change name to blkzone_alloc_policy,
	-Update manual of f2fs sysfs entry,
	-Use macro instead of magic number,
	-Initialize it w/ default policy in f2fs_scan_devices,
	-Add validation check,
	-Merged the ifdef PROFIG-BLK-DEV_ZONED area.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 14 ++++++++++++++
 fs/f2fs/f2fs.h                          |  6 ++++++
 fs/f2fs/segment.c                       | 25 ++++++++++++++++++++++++-
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 5 files changed, 56 insertions(+), 1 deletion(-)

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
index f7ee6c5e371e..29b0e8897e81 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -134,6 +134,10 @@ typedef u32 nid_t;
 
 #define COMPRESS_EXT_NUM		16
 
+#define PRIOR_SEQUENTIAL		0
+#define ONLY_SEQUENTIAL			1
+#define PRIOR_CONVENTIONAL		2
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1555,6 +1559,8 @@ struct f2fs_sb_info {
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
 	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
+	/* For adjust the priority writing position of data in zone UFS */
+	unsigned int blkzone_alloc_policy;		/* data write mode */
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4db1add43e36..7b8dc255836b 100644
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
+		if (sbi->blkzone_alloc_policy == PRIOR_CONVENTIONAL)
+			segno = 0;
+		else
+			segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
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
