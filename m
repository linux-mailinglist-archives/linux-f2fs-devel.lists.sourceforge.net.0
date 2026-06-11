Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zyz0GqC2KmquvgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2026 15:22:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9520C6724D1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2026 15:22:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=efzT7b4m;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=cY39Mur9;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=CXE8ju9D;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=EWCIR7jE;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdT9OiGtyMUNw/iCzU8RuG1ZnxpxaILg/51SMROrTBQ=; b=efzT7b4maZhraseluxJHcQHLG7
	oK4i/wvNQzQIX3/+YpiXfAlAydc9/mZmbov7pDR77bXgnRtZKCeoicq4VW6wD4AjQbsVrDeWiNtWC
	IDtcFDHioePru1SgNT+6z3D8V7V24YJwZL7dXcCZIbnjCGCEuYzTJVzXdvdXsq1klCLo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXfMZ-0002aV-QS;
	Thu, 11 Jun 2026 13:22:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wXfMX-0002aM-K3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jun 2026 13:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mK1HjNIxps7HHVkgliVXwznfjZ+UdIpBjFtUTG9/ZS0=; b=cY39Mur90EGuIhZrYJYnAEqUTq
 P9bNIY4aZ4HBbAHck0Uabah+AO8lqmlxmNOx/W/pWb6SgXG2IXawxMapv2J/15sRdVCi65aSE4/s8
 BpG84bkbgNX23IEqbUHtwoXp/pkGa9rWBfGSA66fenV0lYBANQVD9B4O6oa/DsZKo3p4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mK1HjNIxps7HHVkgliVXwznfjZ+UdIpBjFtUTG9/ZS0=; b=CXE8ju9DC1SOTQeki1YE7lkpVw
 Z3OhPtFZMVxriua2NfRX7WRndD0x6CZO7sGHusOm8I0ogYWY3B6jyZfBNnGt2T6wN/ZwA1KPBwOC7
 ieWlBHbRUriyKAhpLnIPs9ENYKzWTSIBe3Uub1eoiQ5/gtIBemBZ8JCzYlp5gxCaFhL8=;
Received: from mail-japanwestazon11012054.outbound.protection.outlook.com
 ([40.107.75.54] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXfMX-0006Ey-5V for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jun 2026 13:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7YX5dRQOVuMHekpJSuYOVnRDQYMS4si9r+T3nkS3RUMurj0lEEO+jtekiPoC5nd0tD+6qobf0DR2+PPZ+P34AE/LK0AZfyjuQzLXu+m+P8d1iwPAp96g/1LJ0jpBvb6FvkzUdDxAN6zwj5POC1TFVuhLXz5UVZRPLMJ0j+qvMYdtCq0pxEdURck03ZGY05YkiOJoH7hyRywzPNuBMBncTRDODJyOumpo1QBUyWOjGCxW28cmscxG8zeKq2tnPWYGkIgIGjOkm5dq4dxVw74PMU07HZzbZ/gmTfebOVl9O1CrIQGCB7OtWX/WgTzMWKZXEKaVZ4kGsMojAVSaeltkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mK1HjNIxps7HHVkgliVXwznfjZ+UdIpBjFtUTG9/ZS0=;
 b=G5qDucPpW9alSDr78qSBEo+r/i/M5Kf2lICWCszyReQru6h6IuP5QMdkJTZaE8YpCvEFWEPemBcWvpLtRt3LUcYMKMg5vKltny2ntJcinNs4XeCzC5RJeksv/EqsA7QAb05IKMoAMO8GfNpQRausSjzWKIBrMvz5sd/zzUdBKniQ3nYdLpyiW+RUX/2hX7/MYFuXAqB6/trkSfcDHopoea+k3koFich/KI7Ul1cVWOFEiIvWjAfW4UqcxRgT5HZ6L+OK5x3hvIcPgR+yHv5hHXPMbckuy511Nh91SWc2fkX3lbn8wCqsESdVxN3/35ijCcBHemlyDKT4UKhMGPA42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mK1HjNIxps7HHVkgliVXwznfjZ+UdIpBjFtUTG9/ZS0=;
 b=EWCIR7jEu15AEefQODYBuxfCNMFrid9xiOgvdEWiR3Q/ozuIwKManJ20B8hPF8tgWAPiCCoHyr70bWuJTwoCNL0P9SSZmhc5A9YOAbHGkyKkixAtwKzpfIohZibFVEZZUKbY7wvaPVz146UHzbp4KY/1W32CD1aLhwVPAO9h4MX5G2fJTQ1m1ZnpALqttBwfHbxxB8MnqguUjUFWuc3QwSZ59bK98BEbC7pPOdFWVaG/XVdHJaHB50puXv+A1EJDMPyTkelW6NaLZwoJJZ9yU0314MPXVBgfcvG5efd3SBh2NO2wSYt1SWz16EgMOOltJbTe3j1lflCh7S6CD1GNpg==
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYPPR06MB8236.apcprd06.prod.outlook.com (2603:1096:405:385::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 12:50:16 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 12:50:15 +0000
To: ebiggers@kernel.org
Date: Thu, 11 Jun 2026 20:50:06 +0800
Message-Id: <20260611125006.508734-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602134104.348655-1-liaoyuanhong@vivo.com>
References: <20260602134104.348655-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYPPR06MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 04850615-e8ed-4281-622d-08dec7b7fbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|52116014|7416014|376014|22082099003|18002099003|38350700014|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: miL2lU6UmOKAbzIdWUfLkzn1D5bqhK1XSaY+s0Dh4UhRZE6oyUExeRVcBncDlf4UGiJW8nV44nCxRcX9+eFVtDIQYfBlhcIDexuDRWTrah/PTUqvhk6O2j+11SVbpaT21E6jb4pH+ZG5IjFkEiTBws3Dd/ADj/VdMyM9g0RWCHd+q3FSRXCwSjLBDTKL8AB4Fas7UnDyBQAigVKb6zWqMkAF91ypaxDv82KgmbX4g5ywFXrUQl4SZyb008QnezydGk09GZNctJhecupM+TBuFykGHaQYv4lFnjHjbpXoPHWrjO081NmN4OV45cprlPJd/VtW2UHb2OpVPIoY3qTLngo+x4quLWFMvZJepiBWhSvOMbpHpywFN4f+1TcgpIcxh9BEzdFxz0Gz22WClUHXrczx67vpnHwL+uu0Uv85/SQQ71MZKFwjMA/tTE+UZtVe92BlDhabczjHWCEXfmq2Fi+NlY7P0urXBFlqIuw4PsWXXvLzEpaIsYd6ngUqpi7oWrnsE7sDQzbd59GgRlLnkq3Bbk3krGLfJgLg7o874NB7lyuUr2BpauT7P27CJTu8gw+Fm9vL83GyU7H9A1L2rMS0DQc/T5GrvfShLQ6nj2/kjGoI6vHXEP0BlFN8JXg2TYV/fI20/qqZxNSA4lH1WuAo55BflabUyu8zXeio5584Pr1settjSqzt1o8H+/heOXtKGVcpw4xmsB50b+Q3gcS1WwZHXCsAs6mUaeJiQfbUUs60mw39J/wzK4DelSkD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(7416014)(376014)(22082099003)(18002099003)(38350700014)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oB+6P2K+kwD/Cvom3nHHQ7ZKrCuiDtCz/+Jd092+HfB//Zft8MrNnDrAm2Cl?=
 =?us-ascii?Q?+NDN+uEOKZZYGTZL0HMplg/Tw6ZIAVT96f+cU+KFzdQoZceVvcOdWEgEo7m9?=
 =?us-ascii?Q?pkojfrJ+1K4b5Sk7u7dOCzjn8cInd9TNZB7SHRYOkIlbhfBTHo1aMrH4Mexb?=
 =?us-ascii?Q?dZUh0dCGiarcJxIu4vKZAdY81vWpT4rs2IUWrTVUK6VxoiBmCVkn/9RmfYnt?=
 =?us-ascii?Q?kkte8lM2+cWpTzS3wdqk0hHZFIrGhyqb4lDEAe4hy/RxHZJPOYS9lJmYLu7m?=
 =?us-ascii?Q?/QPhVEe9gQbmzwb4J5IEeFZI9EPiCO0LU7WUY8Pys7jUJlF4UJLaJ2DRQWZc?=
 =?us-ascii?Q?uFc8LWNv2pQXEN2chsTpK28rCmMEYqzdl7cW2+Di9EfpdM3m8UOrSzbXN5zN?=
 =?us-ascii?Q?QYRErCbHY3XbBG7HtzU1vvrdy27xKrh2bY5nFceMYIMtcKwr/Qn2HLZmFgzG?=
 =?us-ascii?Q?xgxWk2J8EkGcIsxsgVm8IMQS7wMEidl/xHkgfJ8IIbp3dZ85MZMUW3U9CjId?=
 =?us-ascii?Q?vDa41kXRXkxlrPmSD+ehOdc0WZyi1kkAzpYj8D+VkHw9X4rVhABsQHbQABEW?=
 =?us-ascii?Q?qk4C4ghnrA1Lsou4RP+5K/Dtl9KXm2lOupS/DoZzyzkQHwd5P/L3tciZw1px?=
 =?us-ascii?Q?RFirJZyYzMh9Zf7h8s0mthhtx1BHPKJ2r/sn+q1wlW0AfNTtJKzYhBpQ4VFU?=
 =?us-ascii?Q?juCf6295fZWBh2o211CS/FOFtsEybTPg0wOxaOWffusf5NNP9nysSQU1ya1t?=
 =?us-ascii?Q?aKwbmz6oPnVXWtQz4PLCCV8uEcxwBV1lFcQXVbcLMAWeD6nSmV/KaS76Z37q?=
 =?us-ascii?Q?5YcjlJ0g4C7q8k65tsCaoai83ggtEbYbaqSTQA4euqhFR0Tw3QXMNnxLTCvM?=
 =?us-ascii?Q?7nPAKQ7aI2iheraQW0J59KLLabQc8d6lnma87/ljDs6TF5lQ30dQWbv0RN+4?=
 =?us-ascii?Q?/ooMTV4Xtaz33KaGqeKoo8HtQdlAPgLLGtyNisGphBrFIqLCrxtsPGwz/oD1?=
 =?us-ascii?Q?1AMdpfYPLB3GSuxZA5mzTLqrhx/HCpFSRejZiOBsuyPzkR2QiKQ6Trm9qqAz?=
 =?us-ascii?Q?LCCoBkzb1Vz1qhkMEW397r7c8J67QNQ1pOtKk919fqau7MALVThpV+EyWVci?=
 =?us-ascii?Q?gkQNWUYXeDWc6T66Y62jnYESFx5CekI9Gq3Uhh+ypZMyWOfNlVV736VRM4fw?=
 =?us-ascii?Q?nPWbnuX/F3th3yeVIdpwYkL/pAVT0L7AkDIErPhCV9Xo7XolfZMvoreVu1FC?=
 =?us-ascii?Q?soMd4ru8kpDyj0NEJZPleQk/zsq8LWxpFfFOyc/brML8Eqq7zkRCHskjsuNG?=
 =?us-ascii?Q?uSfmcGXy2Wq/evEntdj9MQteM8YDe8IFr7AX3EOWZjWrBvqSZajQh0kjb0p6?=
 =?us-ascii?Q?ocHs2txOKEfLTMYKfiw2zBhPNSSOd+POiGdFtXqSojlw4AszvATL5YuawQz4?=
 =?us-ascii?Q?+sefI+jKip8POnR9qBhrjWMEZdj7S8/hNxZKlfNPDFjuCOvTXxeAc/ofo40I?=
 =?us-ascii?Q?i6mHCfwZp/RSsf8MeZ8pFVJ//Bot8dAc02vQjMZZyhZ77qCpEk5k0nhl2uuf?=
 =?us-ascii?Q?hTh388+flvXtbr4fgLoIDbg4V8lXS/ZS8eldY+OROtjx3XhmRMlpzNy8q1aJ?=
 =?us-ascii?Q?tzeKZpxNq5XhO4yTKHgJGSNb2U4dm90WJzKivwaX+EY0RMXX6lzeY21zbd00?=
 =?us-ascii?Q?TMuvkW4pVXJ0e7nX6rPPUg0cyZusAKX9iL+PWFz7DzT6kqBnxcCeJBAyVG6Y?=
 =?us-ascii?Q?GtvuDxcRFQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04850615-e8ed-4281-622d-08dec7b7fbef
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 12:50:15.5313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/RJu8oZvxTLY2vFydRdOHujsjOXYw+nKMhtVF8DqAh7IDX4STbMjUP8/vFoi1T0i32+/gBUnu6phV6OMz6/KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8236
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi,
 Gentle ping on this series. v2 tries to address the previous
 concerns by avoiding per-file software tfm growth, preparing the software
 transform lazily, and explicitly disabling unsupported key combinations. 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.54 listed in wl.mailspike.net]
X-Headers-End: 1wXfMX-0006Ey-5V
Subject: Re: [f2fs-dev] [PATCH v2 0/3] f2fs: support encrypted inline data
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
From: LiaoYuanhong-vivo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Cc: corbet@lwn.net, tytso@mit.edu, liaoyuanhong@vivo.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 skhan@linuxfoundation.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:corbet@lwn.net,m:tytso@mit.edu,m:liaoyuanhong@vivo.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:skhan@linuxfoundation.org,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:replyto,vivo.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9520C6724D1

Hi,

Gentle ping on this series.

v2 tries to address the previous concerns by avoiding per-file software
tfm growth, preparing the software transform lazily, and explicitly
disabling unsupported key combinations.

The main remaining limitation is hardware-wrapped keys. If this makes
the feature unlikely to be accepted, please let me know. Otherwise, I
would appreciate any review comments on the current direction.

If maintainers have any feasible direction in mind, I would also
appreciate hearing it.

Thanks,
Liao Yuanhong


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
