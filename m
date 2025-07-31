Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B55E3B16CF7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 09:58:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYJxwTkhtSBXFlw3wzGCjB++03o0O1LnQnOXxAvwevU=; b=aFq4snu/hHeGRkiFzymUASGfVx
	+42guaJ/dHXqUwjhziFZGJPOiusbl+mpDgwhM1ZX1ZH3D0WH2UP7kHz2d7wEKOYVVVOK+6pFeIg5N
	/Dyf7kvDrZXo1jGXB8LtQH9yljVVIN4kB8wK0er4opBj/wpDDYyhZjzDQaByelPLsK8I=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhOAv-0003uP-Pz;
	Thu, 31 Jul 2025 07:58:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1uhOAt-0003u5-Lw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 07:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tEHwkN7Y6FTc0MSwtSePYTGNVI0zS5iXWfFyvM+IKpI=; b=lIHDUkqISEIhVww3bmDdeeRKkK
 qdM8OrwYAZiBGI9EnzBLHJrCMR5JBFkLoygjipZ0KbPfG1a29UwtE0uHmQ2EoWRKoeM2jkLgq5OrK
 gqUDOCbOH71gZurG8Tbh1g2ki13hyCc+Q4VU45oPnrvOXGQjWmiR54ocY7418qwv706M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tEHwkN7Y6FTc0MSwtSePYTGNVI0zS5iXWfFyvM+IKpI=; b=B
 EXs0okdt1wOC3L4WFo3itb9mWEbSsF7A5gmTRYXlzUs0zBZvOhnT2KYasUXAGZdfUlUPVMojnHNjn
 YaXMC9Sh4qxGp3PfupjqOK7AJ/prGJE5Du9bnBScMZxZqcSw89f6fL1hkIdbrsjhmaHtagfZ4Bqpa
 niJiKe2bCC2s5jXI=;
Received: from mail-japaneastazon11012026.outbound.protection.outlook.com
 ([52.101.126.26] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhOAt-0008Fi-6O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 07:58:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b230WoZGjE8W2atHREGm4QMsxkt03Epkh2Pj4I84XeRFgE/grEC+XVoQ7rhxD4qtRZ6cOJGMo9DJp3qsn8X79gno8i6+8fbVZNBwpn4G9jvjrK+F3uClJHa9M2FTqAXhBt0tC2bobRDfe7IbGu6VE5+P6R1/WmZYUTrXkyAYVByf2CyfxJvrqEgivJGbcsj8nBKFcV8Dny2xpIbVnHAMV4zxTRCktjGCn/Jz68+w2GacXZOVkCVs8+CdmiLVyuZtcq8cxa2Sl3J7h0PPNbFWiK/y3kSRD8Mk3HQSBNnU3LNXgfa8+3ownfYzaXWfAx8d3N8mE01KT+J49ka16FgUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEHwkN7Y6FTc0MSwtSePYTGNVI0zS5iXWfFyvM+IKpI=;
 b=rGpFxblAC7MQvtlGqFfJVyaBF06pe3ITT4E0mw9RStw/PvVgxM/orqQSYGLQ+2y3L07pyURNpwarR7/eQN2ids4HjZHCLu54GbyHpFDwljbcEoQzCI134Vj+fMeOSrptWNkPpZHS/Ep42BsbRjMzZJXBca5a1E5u+3XS3w+qd6jV8DW6dCMfojCJqoTeOTFtIHPtmsyMC4Ejw1VhAT9hSdNwBYjUedDtEiWRDP3hCSj0MRAyj34J8wUv8WramfhZ30N1Y1OOoB9rOcojmgoD5thFjM8Q0UJqeX6/HoJNaGTNOP2RfPeeJAs8k9/84JAJVSrLVuyNf30mGuESxMBVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEHwkN7Y6FTc0MSwtSePYTGNVI0zS5iXWfFyvM+IKpI=;
 b=UDfDisryPF5Y0+n58riLovVKZCRXjeqrA61CfyNoY4O6P56eqLG/sRpAMzVfdL2gYOPPwGz5gfnyLK6MjZOWJy4MUE7kjzh6vyQcXfJlDAPDEZSuPinBvskpkqfChlNP2UE3eXgruWrS6lUs1fGGIAMjeYyvy51k2G8vbUxqTOSMDbqfyn9+1YEL/YD3t40275J9sDYengh2Uj3TSzM5Mi1ibp34y5hYbmrKmxStmJdj2bX9N0J9uFY96D7yVX6nilY1pyulFU1AciZmw/bjQTNo3wj4NEnb3bLijNPNjbb8YmAgJrn0BkzS2tbVfvu31XIWNFBitJXgT7fSDA9Tgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e)
 by SEYPR06MB8004.apcprd06.prod.outlook.com (2603:1096:101:2d6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 07:57:45 +0000
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2]) by PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2%7]) with mapi id 15.20.8964.023; Thu, 31 Jul 2025
 07:57:45 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu, 31 Jul 2025 15:57:31 +0800
Message-Id: <20250731075731.628454-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:405:1::18) To PS1PPF5540628D6.apcprd06.prod.outlook.com
 (2603:1096:308::24e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF5540628D6:EE_|SEYPR06MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ba7553-43d3-457f-242a-08ddd007eef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nr3zt31ldEJr68MjUzWEEKWYZ5aShZXPWpcHy7i1XrWO40SqN7+WSFcsnHVX?=
 =?us-ascii?Q?TYkui3XxeL02+aO8Tu0eyCkBjALDfQlwTE1/heJT/PkI/hAkY7iEKncRhdY6?=
 =?us-ascii?Q?tA8/XbSDsp3GnIF/VA079mJjliIJvWH1rq3bgjYw3P3e8F/U5O2JTLlqqfTt?=
 =?us-ascii?Q?WaBaUMcaT5BefIfUpiFJiCLK+wwDty5oeS56WBGlRQk10vXTM1bxIlmHi5f6?=
 =?us-ascii?Q?HWh8lxCnfPm/WQO9iIydSAS+lHBEJg6dJZmlWYbsTeESnc+QAJd4zBaALRW+?=
 =?us-ascii?Q?R9Til/bIndXLutH/XhMnxtVZIYu2990oMndFzEeWc5RcsY82tJo8ahqMQD6G?=
 =?us-ascii?Q?BkZTSCoC1t0s88eUYn3tosA3SW+4amk+/ukjCcUWWQ8rhnVHNnzv/r2HWOPQ?=
 =?us-ascii?Q?on3rswKn5kJfOhL9GPT5Bt5KjdNk8vhiuyi+paJ+Q7MrL1e2sMYQG97es9td?=
 =?us-ascii?Q?k8qjFnbuyB9dY29UxidCtR5DyF3WU3pBCHeOu4XSULSKSWCXMTIa8RVWxlpL?=
 =?us-ascii?Q?9a49QZPZ7NYoATYzoA4SB8OsQNiydZI9EQvrAXLd7KDqwi3cmRrol3q4Vy9B?=
 =?us-ascii?Q?vBchkcR/m7rTjBd1xrzWzQFjiged16xNlKGXKpQH9jx1ZBFGsyHrCEoeiN3I?=
 =?us-ascii?Q?FB5QfD0UUomfgXhwi4P0TjbYBRpcu2mTVobSt9IIqXfWhVHXyI+mf4C062Pn?=
 =?us-ascii?Q?bo2xiBqRvSD+5iegkKMuKzo/O89HfEyYw6D/mTtQt9qTuC86CzLpLw+04oLB?=
 =?us-ascii?Q?Nok1Bkox+jqKJ/awEmoOHKqlaHv2UxCNpDioKuFVujjU3l/SeZlzsuSgD3mr?=
 =?us-ascii?Q?LZ28kh3p9L1wSfnglW+7drKOEECFD0eyYsCGh9viJCsfODh9bqT83dJg7zWa?=
 =?us-ascii?Q?wGzONCoQaaHNCEt7pUwtcc5LYjB+uMT5AkDba1n1qbpFJSYpGM4j7G6iMHc3?=
 =?us-ascii?Q?XgokKXRe7nIOqvnloweloXUq6Vsn04nA2/6k1u6UC3thLdYgUju11thgf4to?=
 =?us-ascii?Q?KcXxU2ZznASwgZvVng1+8IdWE3d4dDwr8AmlptGD2fCiQYFovXQ+YyhmWJqo?=
 =?us-ascii?Q?sEAUuLMVmfBnNcgotGHbvLEJ6v4/kKR0zVuZr2tCvKOEjxSKmrTBAGvGD6F6?=
 =?us-ascii?Q?VM4+/Q+fxcWiTBY37X088K3TYK0yD8rsk4XBcuuVHAiT/kkMoTE2FVjMCnve?=
 =?us-ascii?Q?G3maqldXF72K3gF3w6OgJvgltxLQbIZD8CIbQj2YjuOHeVnCyj000GVUcYk2?=
 =?us-ascii?Q?PU7XC/XwDga5uWZZxrR6XnN7/OyvWAtmhe9u5JrbbLqnq1d3EqVRMAIqxpWw?=
 =?us-ascii?Q?CHcOfx9l0R1G79uvoZILJgfL+niZWcRaLJ39ddyILM+mOdP/wrbngQ1A7Z4W?=
 =?us-ascii?Q?6cGVj5igkOw8TR0fVKyc6kPJhY9A6EFWkv5uoQcWfvNBzG//hnIDY5aL2WyY?=
 =?us-ascii?Q?q/4z+6MSeP1M5AnCHKDgYDnak5AZlNc+60GysA4lUgspn+xYfDJY9xRka6jY?=
 =?us-ascii?Q?cK2KCabmGEdJKb0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PPF5540628D6.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1dak2HZ2sWWvxzFGopGmQNrfazneWIleQ0t+23VklSB7pxvPJNC29R1DHYYj?=
 =?us-ascii?Q?7JUK5RJQNMEf+/LTSadauJTkbfSVLSGE7zA93qz/0pQn671OhPyWd2jFJxsv?=
 =?us-ascii?Q?/FBFLqXTVHGkhx9T6ASr+GIxTXeJe/OJstK5SVAKSyFXIg8LXTXd8SpsHOJC?=
 =?us-ascii?Q?5cRgPXnwWWTB85Mo6uaTTtIrodLn9LYJtng++Kvs3CGeNThZbKuotnhduO0w?=
 =?us-ascii?Q?nUTpIXoPcFYdpcwMyOCnMF/AqTbM/H/Br6vojWCyeM2STvcZw6+cPBqpJ82c?=
 =?us-ascii?Q?rIzTsca0VIkyoEAS+EYvsbICAgEeB5MrllY5myiluAGTs029s3y7fyhAC9t0?=
 =?us-ascii?Q?w59wM+Yp0fC2R5M9xWeVXng1Qd0gdI3SvITEAg3nVXWn/zeNcxpMuR4ARoQM?=
 =?us-ascii?Q?XwU320mt7xMd/bFFZdXDW70j6ze6iA3Os31uUrswqUuYx2qxlICYB6y9sv0M?=
 =?us-ascii?Q?rwF1WpQ9Qt0PVO77EHPcfAnDK1t0GUcRGUmOMUuC0bFPw/OZkJild8FhdFEh?=
 =?us-ascii?Q?iPZG9ZLET7IIQNCbDoBL4Y0o4PyVvUauXfOZoIbuk0fLNtNazEjdXyNPoj2P?=
 =?us-ascii?Q?6DrhENmdgNSq64rJdsKXoflSsB8dG82Lsd68r1mGEKHNunfsnGPUEazwcdrK?=
 =?us-ascii?Q?Z4a2U/drW+SYDknkJ24/llLjfZiuk9oe3W4POEdX5l45XrbPhRfZ2v/TEFLi?=
 =?us-ascii?Q?kVFTbYo8ILnK9prJQDs+dw3w6zPmC1waGNNOBsarjO/iyIPbnAmDgIsEjt86?=
 =?us-ascii?Q?vMfbRrO2MYP2aWgUbw4PMqLIkIKCuOlhn2z4hz/89fTuAXpxV1rIG9mbUeOQ?=
 =?us-ascii?Q?P5ElyPq1NaaVDLyK96SOAR6qbSrQntroOvfRBgDsQkHYGSN5s3Vi/QihOJzo?=
 =?us-ascii?Q?FjsP+naxNilZsdtxEKkQd+sUIhtmlldwTNiBn0N4yVZh90cO1t3bgyw34Xfr?=
 =?us-ascii?Q?S5jsxHlAGyU7PrqILMDI+hSL89fEYqqxKjaSQXi5ChPh3vsBvPnq7bCHA5Wt?=
 =?us-ascii?Q?7ZqXj4aBiswGVjXXKId3wCb+MnNReLRR6KkIoxDPugFdd+wCtWB9zfJOTvFu?=
 =?us-ascii?Q?+iT2t6kOFdV7ZYZxvcxm5L4uh9IIS7nuFeMVJiKaCpPsoZCHBshJQz48Eqiz?=
 =?us-ascii?Q?1EMOwGg2fj8eIC9WcRKGeymUcnCmPduZ7qa+inrW3Vq9PF4sSqcUmbZdCaO7?=
 =?us-ascii?Q?qS2NcZWcXj3xG+w7Wyv8+5pHzTMkaXbAMse9MzFeAnz/h4DP/7HhmOq6rv97?=
 =?us-ascii?Q?/+NDhAI+SFg5gqajgQ1yp6v1xtTO/3/9KzJrlkG+QPfIapJCfgpCxbp/t8oR?=
 =?us-ascii?Q?0GiFDkTbNQzMg2ARQXtqMlvK+e0Nj34JuywwCJL/zb8K9wJPHS73yLSlpiSj?=
 =?us-ascii?Q?3iCIPU1ag/yG1h3fINlUQWd2O/DBzKr7AQhApGEJ7ko7BFuUroTAWQFC7SJo?=
 =?us-ascii?Q?szsKgNdghr6uAzFW6rNg0xEw0iOM9qhPr6KJTv1uxPsDFeh4MyWMQIwSe9x6?=
 =?us-ascii?Q?b0mq2udVeVM+xhwohd1yI2ntF+seo9zCj5dm2ybc3QriwiMyebnk1J5gsqmi?=
 =?us-ascii?Q?UfJppuE7lesMsJ07kEXDNNngXQmuDMzQVaU3UuDm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ba7553-43d3-457f-242a-08ddd007eef8
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF5540628D6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 07:57:45.1827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KJvLks3Pw2Tj4n+DRZN9tPKgTPTAZ7gXDwZAZylUqPKCLWgT3oexKqFAEB8lQRTdSNaJQs6s3p4bQsSsMbENg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB8004
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch allows privileged users to reserve nodes via the
 'reserve_node' mount option, which is similar to the existing 'reserve_root'
 option. "-o reserve_node=<N>" means <N> nodes are reserved for privileged
 users only. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.26 listed in wl.mailspike.net]
X-Headers-End: 1uhOAt-0008Fi-6O
Subject: [f2fs-dev] [PATCH v4] f2fs: add reserved nodes for privileged users
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch allows privileged users to reserve nodes via the
'reserve_node' mount option, which is similar to the existing
'reserve_root' option.

"-o reserve_node=<N>" means <N> nodes are reserved for privileged
users only.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v3->v4: Rebase this patch on https://lore.kernel.org/linux-f2fs-devel/20250731060338.1136086-1-chao@kernel.org
v2->v3: Apply Chao's suggestion from v2.
v1->v2: Add two missing handling parts.
v1: https://lore.kernel.org/linux-f2fs-devel/20250729095238.607433-1-guochunhai@vivo.com/
---
 Documentation/filesystems/f2fs.rst |  9 ++++---
 fs/f2fs/f2fs.h                     | 14 +++++++---
 fs/f2fs/super.c                    | 43 +++++++++++++++++++++++++-----
 3 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 03b1efa6d3b2..95dbcd7ac9a8 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -173,9 +173,12 @@ data_flush		 Enable data flushing before checkpoint in order to
 			 persist data of regular and symlink.
 reserve_root=%d		 Support configuring reserved space which is used for
 			 allocation from a privileged user with specified uid or
-			 gid, unit: 4KB, the default limit is 0.2% of user blocks.
-resuid=%d		 The user ID which may use the reserved blocks.
-resgid=%d		 The group ID which may use the reserved blocks.
+			 gid, unit: 4KB, the default limit is 12.5% of user blocks.
+reserve_node=%d		 Support configuring reserved nodes which are used for
+			 allocation from a privileged user with specified uid or
+			 gid, the default limit is 12.5% of all nodes.
+resuid=%d		 The user ID which may use the reserved blocks and nodes.
+resgid=%d		 The group ID which may use the reserved blocks and nodes.
 fault_injection=%d	 Enable fault injection in all supported types with
 			 specified injection rate.
 fault_type=%d		 Support configuring fault injection type, should be
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eb372af22edc..b9676ef16246 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -131,6 +131,7 @@ extern const char *f2fs_fault_name[FAULT_MAX];
  * string rather than using the MS_LAZYTIME flag, so this must remain.
  */
 #define F2FS_MOUNT_LAZYTIME		0x40000000
+#define F2FS_MOUNT_RESERVE_NODE		0x80000000
 
 #define F2FS_OPTION(sbi)	((sbi)->mount_opt)
 #define clear_opt(sbi, option)	(F2FS_OPTION(sbi).opt &= ~F2FS_MOUNT_##option)
@@ -172,6 +173,7 @@ struct f2fs_rwsem {
 struct f2fs_mount_info {
 	unsigned int opt;
 	block_t root_reserved_blocks;	/* root reserved blocks */
+	block_t root_reserved_nodes;	/* root reserved nodes */
 	kuid_t s_resuid;		/* reserved blocks for uid */
 	kgid_t s_resgid;		/* reserved blocks for gid */
 	int active_logs;		/* # of active logs */
@@ -2355,7 +2357,7 @@ static inline bool f2fs_has_xattr_block(unsigned int ofs)
 	return ofs == XATTR_NODE_OFFSET;
 }
 
-static inline bool __allow_reserved_blocks(struct f2fs_sb_info *sbi,
+static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool cap)
 {
 	if (!inode)
@@ -2380,7 +2382,7 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	avail_user_block_count = sbi->user_block_count -
 					sbi->current_reserved_blocks;
 
-	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_blocks(sbi, inode, cap))
+	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
@@ -2738,7 +2740,7 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 					struct inode *inode, bool is_inode)
 {
 	block_t	valid_block_count;
-	unsigned int valid_node_count;
+	unsigned int valid_node_count, avail_user_node_count;
 	unsigned int avail_user_block_count;
 	int err;
 
@@ -2767,8 +2769,12 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 		goto enospc;
 	}
 
+	avail_user_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
+	if (test_opt(sbi, RESERVE_NODE) &&
+			!__allow_reserved_root(sbi, inode, false))
+		avail_user_node_count -= F2FS_OPTION(sbi).root_reserved_nodes;
 	valid_node_count = sbi->total_valid_node_count + 1;
-	if (unlikely(valid_node_count > sbi->total_node_count)) {
+	if (unlikely(valid_node_count > avail_user_node_count)) {
 		spin_unlock(&sbi->stat_lock);
 		goto enospc;
 	}
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 30c038413040..a24e855a38ed 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -143,6 +143,7 @@ enum {
 	Opt_extent_cache,
 	Opt_data_flush,
 	Opt_reserve_root,
+	Opt_reserve_node,
 	Opt_resgid,
 	Opt_resuid,
 	Opt_mode,
@@ -265,6 +266,7 @@ static const struct fs_parameter_spec f2fs_param_specs[] = {
 	fsparam_flag_no("extent_cache", Opt_extent_cache),
 	fsparam_flag("data_flush", Opt_data_flush),
 	fsparam_u32("reserve_root", Opt_reserve_root),
+	fsparam_u32("reserve_node", Opt_reserve_node),
 	fsparam_gid("resgid", Opt_resgid),
 	fsparam_uid("resuid", Opt_resuid),
 	fsparam_enum("mode", Opt_mode, f2fs_param_mode),
@@ -336,6 +338,7 @@ static match_table_t f2fs_checkpoint_tokens = {
 #define F2FS_SPEC_discard_unit			(1 << 21)
 #define F2FS_SPEC_memory_mode			(1 << 22)
 #define F2FS_SPEC_errors			(1 << 23)
+#define F2FS_SPEC_reserve_node			(1 << 24)
 
 struct f2fs_fs_context {
 	struct f2fs_mount_info info;
@@ -437,22 +440,30 @@ static void f2fs_destroy_casefold_cache(void) { }
 
 static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
-	block_t limit = min((sbi->user_block_count >> 3),
+	block_t block_limit = min((sbi->user_block_count >> 3),
 			sbi->user_block_count - sbi->reserved_blocks);
+	block_t node_limit = sbi->total_node_count >> 3;
 
 	/* limit is 12.5% */
 	if (test_opt(sbi, RESERVE_ROOT) &&
-			F2FS_OPTION(sbi).root_reserved_blocks > limit) {
-		F2FS_OPTION(sbi).root_reserved_blocks = limit;
+			F2FS_OPTION(sbi).root_reserved_blocks > block_limit) {
+		F2FS_OPTION(sbi).root_reserved_blocks = block_limit;
 		f2fs_info(sbi, "Reduce reserved blocks for root = %u",
 			  F2FS_OPTION(sbi).root_reserved_blocks);
 	}
-	if (!test_opt(sbi, RESERVE_ROOT) &&
+	if (test_opt(sbi, RESERVE_NODE) &&
+			F2FS_OPTION(sbi).root_reserved_nodes > node_limit) {
+		F2FS_OPTION(sbi).root_reserved_nodes = node_limit;
+		f2fs_info(sbi, "Reduce reserved nodes for root = %u",
+			  F2FS_OPTION(sbi).root_reserved_nodes);
+	}
+	if (!test_opt(sbi, RESERVE_ROOT) && !test_opt(sbi, RESERVE_NODE) &&
 		(!uid_eq(F2FS_OPTION(sbi).s_resuid,
 				make_kuid(&init_user_ns, F2FS_DEF_RESUID)) ||
 		!gid_eq(F2FS_OPTION(sbi).s_resgid,
 				make_kgid(&init_user_ns, F2FS_DEF_RESGID))))
-		f2fs_info(sbi, "Ignore s_resuid=%u, s_resgid=%u w/o reserve_root",
+		f2fs_info(sbi, "Ignore s_resuid=%u, s_resgid=%u w/o reserve_root"
+				" and reserve_node",
 			  from_kuid_munged(&init_user_ns,
 					   F2FS_OPTION(sbi).s_resuid),
 			  from_kgid_munged(&init_user_ns,
@@ -841,6 +852,11 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		F2FS_CTX_INFO(ctx).root_reserved_blocks = result.uint_32;
 		ctx->spec_mask |= F2FS_SPEC_reserve_root;
 		break;
+	case Opt_reserve_node:
+		ctx_set_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
+		F2FS_CTX_INFO(ctx).root_reserved_nodes = result.uint_32;
+		ctx->spec_mask |= F2FS_SPEC_reserve_node;
+		break;
 	case Opt_resuid:
 		F2FS_CTX_INFO(ctx).s_resuid = result.uid;
 		ctx->spec_mask |= F2FS_SPEC_resuid;
@@ -1424,6 +1440,14 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_ROOT);
 		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_ROOT;
 	}
+	if (test_opt(sbi, RESERVE_NODE) &&
+			(ctx->opt_mask & F2FS_MOUNT_RESERVE_NODE) &&
+			ctx_test_opt(ctx, F2FS_MOUNT_RESERVE_NODE)) {
+		f2fs_info(sbi, "Preserve previous reserve_node=%u",
+			F2FS_OPTION(sbi).root_reserved_nodes);
+		ctx_clear_opt(ctx, F2FS_MOUNT_RESERVE_NODE);
+		ctx->opt_mask &= ~F2FS_MOUNT_RESERVE_NODE;
+	}
 
 	err = f2fs_check_test_dummy_encryption(fc, sb);
 	if (err)
@@ -1623,6 +1647,9 @@ static void f2fs_apply_options(struct fs_context *fc, struct super_block *sb)
 	if (ctx->spec_mask & F2FS_SPEC_reserve_root)
 		F2FS_OPTION(sbi).root_reserved_blocks =
 					F2FS_CTX_INFO(ctx).root_reserved_blocks;
+	if (ctx->spec_mask & F2FS_SPEC_reserve_node)
+		F2FS_OPTION(sbi).root_reserved_nodes =
+					F2FS_CTX_INFO(ctx).root_reserved_nodes;
 	if (ctx->spec_mask & F2FS_SPEC_resgid)
 		F2FS_OPTION(sbi).s_resgid = F2FS_CTX_INFO(ctx).s_resgid;
 	if (ctx->spec_mask & F2FS_SPEC_resuid)
@@ -2342,9 +2369,11 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 	else if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
 		seq_puts(seq, "fragment:block");
 	seq_printf(seq, ",active_logs=%u", F2FS_OPTION(sbi).active_logs);
-	if (test_opt(sbi, RESERVE_ROOT))
-		seq_printf(seq, ",reserve_root=%u,resuid=%u,resgid=%u",
+	if (test_opt(sbi, RESERVE_ROOT) || test_opt(sbi, RESERVE_NODE))
+		seq_printf(seq, ",reserve_root=%u,reserve_node=%u,resuid=%u,"
+				"resgid=%u",
 				F2FS_OPTION(sbi).root_reserved_blocks,
+				F2FS_OPTION(sbi).root_reserved_nodes,
 				from_kuid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resuid),
 				from_kgid_munged(&init_user_ns,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
