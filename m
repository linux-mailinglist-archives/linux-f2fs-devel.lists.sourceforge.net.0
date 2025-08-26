Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4AB36772
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Aug 2025 16:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q5IZD370bto75yDUk8W0t51+ifsxnNORZw/I0u2uNEE=; b=YdPPSexNdbDRJk3L3n1z06F3LO
	rtHgQFenXs4t8CLjlZfKJbv2FJMK5Zg65skvKXR3LHDbEuRZbRYs03kc8/fjUxVlunZEjyUu7/wuQ
	XeX+3snGyvgnYiBuxw0Ahxod1zhUHkBJzK9dclz7Dwc5wY8O5aRLwo6/A+CnkCyI2eJU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uquJX-0006Bs-PD;
	Tue, 26 Aug 2025 14:06:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uquJV-0006BZ-Hn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Aug 2025 14:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jcj6jaM3YJs/R7kGn8136swHuvh2bYkKL4YJtbcO42U=; b=MApgztQdkuQMxuh6E7ml4RghNb
 D7xRlxsO22PmHuv2wYhrIjf6kx1KJYrfBZar6V/WLz5v9UjV0v2OqXQ9DyRuROey2rKrtu/L1b3rs
 silQcS4lw3XBm0n1fJdWg8kbQtvgxASsB0tFhGmWxvofRV6yAx4oJu6GkNw7M+LyKKjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jcj6jaM3YJs/R7kGn8136swHuvh2bYkKL4YJtbcO42U=; b=S
 0SjIo6vBD7S/7+RGqBpd9+a79qmhc9Bnk5za5QPKL5+7kF3jdG75DMH7y8FO4S88RFqD3BpAjLMHL
 hHTVmpNz5tGCwaxw4kV9nXCWaUKSydx8fRIYWS2CgK3otIHUYjKq4mKbNRzemQySL2281wxgSSElK
 Rn/MusDJtv7EjySE=;
Received: from mail-japanwestazon11012008.outbound.protection.outlook.com
 ([40.107.75.8] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uquJU-0007Mo-M7 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Aug 2025 14:06:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au1SoteOnG85VyUSKQ+68Pi+ITvOV0eqvacNVbcc0Q9nZweT5wQva2nCx3U9OTaR7c6qnmVMEA3ddQ1+Bf/l7a3USsJvx3BZ6TKbvzJqIYktSN/qMZbufhVf2ElIWSnb8EHdo4Y6pPMYkTy4IuKdJvV3QNNsHNfnVMFtiKEseqHxNg3MxzJJ00olEVX7bwuoTr5i/Sky+VDa4itxhLThzWdhtnCf3CAocd4GNbuh2KPszF7RIntj9YZEur2HTxBuFcMsJBtHiOBZSO061VqnVSuyMWQucGOQRzX5Z42AV3bYxmqqVsp6c8eaL+31fSPbq1xW1hiGFKAmvxMZ2aIExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcj6jaM3YJs/R7kGn8136swHuvh2bYkKL4YJtbcO42U=;
 b=ess3m7MixLVs+Zx/o9yQrf+ykwvFE9Z67lAc1BGYZiSyVP+jWFj09aiZTb1AKGoW3cBSQoBCG68whb2JwYXwrdhl2g2wxY2JH8KAvXipXb5QFZJ6QwqR/5KuYEK9go3pPAJrfYTTqLOxBKYMV+nhQZ/xWXoIeE5gKbx3ONi3PVeiItfOx1dfvaAuA4zD0zGAkT5tEShp7X+BTHn9vFxLl5h96Pdi6UPUHWyH7IW2XqMvcctX5A/2pU/SlkfWPn4rsfPr+t2l0Hiz1OvZfIuQBvVaql/fPM4yI1kONotUVExSBUyfN7AGvLuqbC+laV6pVXPfhMjsuHPcjrafWS9weA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcj6jaM3YJs/R7kGn8136swHuvh2bYkKL4YJtbcO42U=;
 b=Gt93NBrwnZRcZzqFhWyuJdw7aKIwQarQ+uok9cZoSj8+yDvUsGs6/SvW3Cicjx7hjJZF4o/iTeAS96NjBFnmP8dokbpOfWMBYHK2mtbjtGJT79KDhhSRbHXdEkAAYmBJjhIdbMiQOBr/lJS2lA2HCTu6FkPU1Qd976HU8iFquvyL6vYoRndGdSW/Qx3/4MPDOsvE9oLofgrPAFJLgoJ+X35LSLz4aL8j8YYdVkVP9VZJbbDpfGTfmwJgHbMSrsb8Jr/5TF0WLBA9DgcWkaUNlMMclJMfiD8/nT7QOKXAXQOwkx2n8Pl7SpRCo8MJPTQpj/DcYgPYDR2B/FlZZi+PXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY0PR06MB6801.apcprd06.prod.outlook.com (2603:1096:405:12::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 14:06:01 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 14:06:00 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Tue, 26 Aug 2025 22:05:38 +0800
Message-Id: <20250826140539.521074-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY0PR06MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 13696bb4-face-446e-e7ff-08dde4a9afb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kCKeJDv9+7MZn9z8hXCS6mpeiNAa49QeJ0CTkk3PiS10yY3couWCObUenMAl?=
 =?us-ascii?Q?fT1j9LCrEgamyGFOj50IwbhnfdBcMv2FxIKpaqe2o9idVusi7yk+eHEL+AMA?=
 =?us-ascii?Q?HOKmpPzqUG+nZlDdkOSVNCf3KKbJfEJML9JilBV86FcW8bKirGH/eirQlGBN?=
 =?us-ascii?Q?VBTs4cyh/7LHWgXJl4fFX3sEW7ekNrra790L0lW6oJEERHQciSTvHjQMrD5I?=
 =?us-ascii?Q?KnUNRDmKGMrT3TY+J5xriHWfuA/YcFHtREvR/8eoROp4IsIruqsCDojI2z03?=
 =?us-ascii?Q?3I124lzSO8DnXql8oUkOobgG5Uc5auXGAHQHh3saPbCL2YtIA9my/E3SKran?=
 =?us-ascii?Q?2U/SKMg65UVgusB6JpJ9+sVz8mhNr3MBz1013VuqcAe7Rb/4BYtIZDEs/Iur?=
 =?us-ascii?Q?BWe58KxM8apllqhXNL54g8DfQ9PBxTsmNsh7l9fuPPnj0TH5qja7AVVsVVUs?=
 =?us-ascii?Q?2tBQvXnQHtI1NhCrr8pERCypVGXRcbDw65ch5EPa4fpm5Vepfhmeo+wDaMSR?=
 =?us-ascii?Q?qoJZbB13LGr5xJl4oFOmVfO0TwTXs5pGPGAhpbCEhfmQyAXNz1VIgaDupt4J?=
 =?us-ascii?Q?6JtvaOkvr/6C7pHUf3ctymA8SHdY4ahEdrJ1cMzCXTCjMpaXzeKFB4jrkucj?=
 =?us-ascii?Q?4FmvbnqJCihKZz8dKk6uxoAdTBP8WZHFUFSSwy8VeXNqhO3ETC0xzgn0WRH2?=
 =?us-ascii?Q?tOwylw2a1OclddbqGOxnWYtCZofdvLpfzBlOLMwLgwofetDknInOUWZudnbh?=
 =?us-ascii?Q?z1wk4k5Lm2qGSOpvZQsosn35b4bBzQepEnzFlarnokO7kPXh/KJbj6hNButh?=
 =?us-ascii?Q?lSpW3liv+Q13+Kp997oXBkLZr/W8Gm0qd6oTcxNcFt3Ie6GTEOphfuF/QHNZ?=
 =?us-ascii?Q?fJzn+gAh+gk5ptaQekQvDwFE2k4Wj5DNWL1wRi/PHBHxhDy0rwIXd+IL5gLr?=
 =?us-ascii?Q?/x9H2dAVrKNikz6IrZpnFtOwC4ayryzQxLMFWPHzEWUsQb114BW04hbVjQQ3?=
 =?us-ascii?Q?QK7qdesvHXIk+UluKU1nax+po+PbcrkLoDuEhwnbGNL2Mv4AXA9RcAP3x48S?=
 =?us-ascii?Q?Sl74aTyXMzmNmdRUvHAuii+orqUC/4xjCKTNNGRa4rhUvAUHa//EPJHVSfoa?=
 =?us-ascii?Q?owzdGK1T28MFk3oavhri13e4gbaBQr1SYGHtnekzCbEPIGPIy9MNgy+I4f56?=
 =?us-ascii?Q?tvJ14H+ERS8Z4MQL4Y92d7dJ9YNp2gSEcresAX2L8mXY1vAh1DxhfNBUejvW?=
 =?us-ascii?Q?Rn/a/hl5UcjboheLE6z7MmIHTILLMnqL5dLu8MG7wmxNb/VYFh0pEzLi806j?=
 =?us-ascii?Q?ODvYnWWjnUT14XREYENp8Yj2FopO0P5iO69TfIs5k3sYNOTxs6YephI3fGMd?=
 =?us-ascii?Q?v/DrQcXq0DiRGvOoitINEZ0DJ9CsEGflfNedwaH+ESRMoANoe09Ixj6CF5rm?=
 =?us-ascii?Q?b031ro6P5iR3ibVwCpXMb1IZjF4voOYRzEdOHmOY48cfzVOkhLNOtg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CC4ieE11PDy6hxnZyPONncW5xY9rURWmyIdmJgHPGJD4QioVIlmX0jJHywu0?=
 =?us-ascii?Q?ZL/CKLBkuxcHW6yu1afVAEChLIkncGmHU1BtiWAZni3A4ewldFMSzIgHhQY8?=
 =?us-ascii?Q?roydI/beriQyspClT4f/JYf9R+M9tHJ4twBG3gaoLlppjfMvxy0Y86QKMOza?=
 =?us-ascii?Q?tqFJ4gY4LJvIxHqDmumAbaDn/gG66E0SmHeg1ysossEIRJmLUyaHK6pZ695N?=
 =?us-ascii?Q?x228SdcO7u4jNBRSEEua/SxLDRk2B/RmBgZJ3XJpI9l1hjGghHI6LO85UGQx?=
 =?us-ascii?Q?4eEzhyb8x0HX/wCbJ1M+JXrj9OivNuCDqjDiUukCfwa7Ho1vcz0B7r5GZqkc?=
 =?us-ascii?Q?cXNcIyBx+NsOprRUNA9GMD55UbTzCRzM/DGhxbHQt0msf/cgjJfxsiEgmaW3?=
 =?us-ascii?Q?y2YrDDtYRokGFPqp3cRKXu6SLVqdg6RQ3i1asYFTcA63alaCDl7G2xdn7TUl?=
 =?us-ascii?Q?qh/1qhAH5wqEZol+SfenTstaDpqLNw5fYSeR7ClQGnDZtH8kMXalZ68phdQF?=
 =?us-ascii?Q?lCBLY8sg+GnyE2WViOwdMDn/uusRkP5Mfp8izxPACiTbGcUb37ZnWqFGOcRW?=
 =?us-ascii?Q?hPzg0vhhOkJup7eJwqn2/MbdfEC8Ql5KOG3rdkGCCGVVvscu4SIdHOu+5dgd?=
 =?us-ascii?Q?h7metpSUFfa22zy72q+R9Mf3LzZtbOUmphpInBn2HFPKaS2zS32SXBC29dIH?=
 =?us-ascii?Q?rT3VsYLZv7Lx0ZUh2A/5wck5gM+jnf3BsUx/srVhJh8aOc4RSkGYxlsblVur?=
 =?us-ascii?Q?fILAE2dRmMgLGX0AEe7ICHP9c0jfqrk8q8/l/uPnqzVOaMSSVxs+0ioA5waA?=
 =?us-ascii?Q?FkCV9WiPcT417bgSKSLFWJ8tUk1Xhv0qm0V/214ZBv9DpJYYp3vDtz/8+jyM?=
 =?us-ascii?Q?fy89pK8GJ5x/0hZmsO22KvNgvirJWX6SvfH6PoHB/3zDpKQBKaYnFS56aVUe?=
 =?us-ascii?Q?dF7Xz1s/ljyrSe08vM6/Mr11Nuao5dpQmSIXGvisSopEEoeTbwNDPhultlxU?=
 =?us-ascii?Q?UvES7IehemGU0mdeJathvCtAn/ssuN52XWme4tmqydGJOimp8jiW0C2vD+cc?=
 =?us-ascii?Q?65lWzQPlP5kjTsfRJFaOhFAxp3ZHUNUWaiYBclSqp1fckQV0KElvT4B66tpu?=
 =?us-ascii?Q?sbXXGsquyN63KApB4qgq1u8yHUTRxsaezVRWC9oSOpCzHePc9d9jjJ6UVpbv?=
 =?us-ascii?Q?X44kLnm/ED8cmvbeGzCaSlv3RF0MM9MDHlsL20Fllj/RvtdL2CuO5OHaViae?=
 =?us-ascii?Q?JECPZImP+f0kFNeNLsoBvB7Ru2G8GR2tqU0vUOSNBDIeNCeHNFlk5NRO9bn6?=
 =?us-ascii?Q?SQMN2FNXN6EpUCzmjJO8k9oXqo2tamCFIEoY24ccqoQY6uYhlWgG4Ckd13+u?=
 =?us-ascii?Q?kaJmS36WEofr+Hz+6DEJJMkFskJEYrFFwFk5JcJrDXrB3T/NiOlgU480lefF?=
 =?us-ascii?Q?ZZ34o8oDZV3Ea8aQmCB3U3+bAizhAZE+qgXZDqynh93SiL+dULw4of+D3nSz?=
 =?us-ascii?Q?gqB7Il5j4ciM1QSU18ROpr1XzIPyQMmzdJ+0G8TzMJo5iug+ZxoMdR5jR0eH?=
 =?us-ascii?Q?ZUEcdrcN25+sTN73Do9yYFpKJ/PGwbwjuHbOa+pB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13696bb4-face-446e-e7ff-08dde4a9afb2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 14:06:00.6441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysXiTD/Xf/oAkJLNNUXEI2S4Q6gT7HZwBx0Drwuk1p3nBx5vKh4T1/mpW8RI3Ed7zateIoFeSTEuBksGlZPV/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6801
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduces two new sys nodes: allocate_section_hint and
 allocate_section_policy.
 The allocate_section_hint identifies the boundary between devices, measured
 in sections; it defaults to the end of the [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.8 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1uquJU-0007Mo-M7
Subject: [f2fs-dev] [PATCH v3] f2fs: Use allocate_section_policy to control
 write priority in multi-devices setups
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
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduces two new sys nodes: allocate_section_hint and
allocate_section_policy. The allocate_section_hint identifies the boundary
between devices, measured in sections; it defaults to the end of the device
for single storage setups, and the end of the first device for multiple
storage setups. The allocate_section_policy determines the write strategy,
with a default value of 0 for normal sequential write strategy. A value of
1 prioritizes writes before the allocate_section_hint, while a value of 2
prioritizes writes after it.

This strategy addresses the issue where, despite F2FS supporting multiple
devices, SOC vendors lack multi-devices support (currently only supporting
zoned devices). As a workaround, multiple storage devices are mapped to a
single dm device. Both this workaround and the F2FS multi-devices solution
may require prioritizing writing to certain devices, such as a device with
better performance or when switching is needed due to performance
degradation near a device's end. For scenarios with more than two devices,
sort them at mount time to utilize this feature.

When using this feature with a single storage device, it has almost no
impact. However, for configurations where multiple storage devices are
mapped to the same dm device using F2FS, utilizing this feature can provide
some optimization benefits. Therefore, I believe it should not be limited
to just multi-devices usage.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
Changes in v3:
	- Refactored the implementation logic of allocate_section_policy in
	get_new_segment(). The current version has a more coherent and readable
	logic while maintaining nearly the same functionality.
	- Added a validity check for allocate_section_hint in get_new_segment()
	to prevent potential conflicts that MAIN_SECS() might cause.
	- Adjusted the initialization position of allocate_section_hint, now
	initialized in init_sb_info().

Changes in v2:
	- Updated the feature naming to better reflect its actual functionality.
	- Appended patch description to clarify whether the usage should be
	limited to multi-devices.
	- Improved the code style.
	- Fixed typo.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 22 ++++++++++++++++++++++
 fs/f2fs/f2fs.h                          |  8 ++++++++
 fs/f2fs/gc.c                            |  5 +++++
 fs/f2fs/segment.c                       | 15 +++++++++++++++
 fs/f2fs/super.c                         |  4 ++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 6 files changed, 72 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index ee3acc8c2cb8..b590809869ca 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -911,3 +911,25 @@ Description:	Used to adjust the BG_GC priority when pending IO, with a default v
 		bggc_io_aware = 1   skip background GC if there is pending read IO
 		bggc_io_aware = 2   don't aware IO for background GC
 		==================  ======================================================
+
+What:		/sys/fs/f2fs/<disk>/allocate_section_hint
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Indicates the hint section between the first device and others in multi-devices
+		setup. It defaults to the end of the first device in sections. For a single storage
+		device, it defaults to the total number of sections. It can be manually set to match
+		scenarios where multi-devices are mapped to the same dm device.
+
+What:		/sys/fs/f2fs/<disk>/allocate_section_policy
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Controls write priority in multi-devices setups. A value of 0 means normal writing.
+		A value of 1 prioritizes writing to devices before the allocate_section_hint. A value of 2
+		prioritizes writing to devices after the allocate_section_hint. The default is 0.
+
+		===========================  ==========================================================
+		value					     description
+		allocate_section_policy = 0  Normal writing
+		allocate_section_policy = 1  Prioritize writing to section before allocate_section_hint
+		allocate_section_policy = 2  Prioritize writing to section after allocate_section_hint
+		===========================  ==========================================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6cde72fce74e..7c6bfee81c61 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -162,6 +162,12 @@ enum bggc_io_aware_policy {
 	AWARE_NONE,			/* don't aware IO for background GC */
 };
 
+enum device_allocation_policy {
+	ALLOCATE_FORWARD_NOHINT,
+	ALLOCATE_FORWARD_WITHIN_HINT,
+	ALLOCATE_FORWARD_FROM_HINT,
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1856,6 +1862,8 @@ struct f2fs_sb_info {
 	bool aligned_blksize;			/* all devices has the same logical blksize */
 	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
 	unsigned int bggc_io_aware;		/* For adjust the BG_GC priority when pending IO */
+	unsigned int allocate_section_hint;	/* the boundary position between devices */
+	unsigned int allocate_section_policy;	/* determine the section writing priority */
 
 	/* For write statistics */
 	u64 sectors_written_start;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 098e9f71421e..b57b8fd64747 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2182,6 +2182,8 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
 	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
 	MAIN_SECS(sbi) += secs;
+	if (sbi->allocate_section_hint > MAIN_SECS(sbi))
+		sbi->allocate_section_hint = MAIN_SECS(sbi);
 	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
 	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
 	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
@@ -2189,6 +2191,9 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	if (f2fs_is_multi_device(sbi)) {
 		int last_dev = sbi->s_ndevs - 1;
 
+		sbi->allocate_section_hint = FDEV(0).total_segments /
+					SEGS_PER_SEC(sbi);
+
 		FDEV(last_dev).total_segments =
 				(int)FDEV(last_dev).total_segments + segs;
 		FDEV(last_dev).end_blk =
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 04b0a3c1804d..e86b78111444 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2807,6 +2807,21 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	}
 #endif
 
+	/*
+	 * Prevent allocate_section_hint from exceeding MAIN_SECS()
+	 * due to desynchronization.
+	 */
+	if (sbi->allocate_section_policy != ALLOCATE_FORWARD_NOHINT &&
+		sbi->allocate_section_hint > MAIN_SECS(sbi))
+		sbi->allocate_section_hint = MAIN_SECS(sbi);
+
+	if (sbi->allocate_section_policy == ALLOCATE_FORWARD_FROM_HINT &&
+		hint < sbi->allocate_section_hint)
+		hint = sbi->allocate_section_hint;
+	else if (sbi->allocate_section_policy == ALLOCATE_FORWARD_WITHIN_HINT &&
+			hint >= sbi->allocate_section_hint)
+		hint = 0;
+
 find_other_zone:
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e288b7be3131..924ad2216f67 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4238,6 +4238,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->total_node_count = SEGS_TO_BLKS(sbi,
 			((le32_to_cpu(raw_super->segment_count_nat) / 2) *
 			NAT_ENTRY_PER_BLOCK));
+	sbi->allocate_section_hint = le32_to_cpu(raw_super->section_count);
 	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
 	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
 	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
@@ -4721,6 +4722,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
 	sbi->aligned_blksize = true;
 	sbi->bggc_io_aware = AWARE_ALL_IO;
+	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
 	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
@@ -4752,6 +4754,8 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 					SEGS_TO_BLKS(sbi,
 					FDEV(i).total_segments) - 1 +
 					le32_to_cpu(raw_super->segment0_blkaddr);
+				sbi->allocate_section_hint = FDEV(i).total_segments /
+							SEGS_PER_SEC(sbi);
 			} else {
 				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
 				FDEV(i).end_blk = FDEV(i).start_blk +
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 1ffaf9e74ce9..81b99c2a02a9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -889,6 +889,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "allocate_section_hint")) {
+		if (t < 0 || t > MAIN_SECS(sbi))
+			return -EINVAL;
+		sbi->allocate_section_hint = t;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "allocate_section_policy")) {
+		if (t < ALLOCATE_FORWARD_NOHINT || t > ALLOCATE_FORWARD_FROM_HINT)
+			return -EINVAL;
+		sbi->allocate_section_policy = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1161,6 +1175,8 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
+F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
+F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
@@ -1398,6 +1414,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
 	ATTR_LIST(reserved_pin_section),
+	ATTR_LIST(allocate_section_hint),
+	ATTR_LIST(allocate_section_policy),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
