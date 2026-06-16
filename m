Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HXWpMpAbMWrcbgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 11:46:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21B68DAC3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 11:46:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=HzxBXtfZ;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=inQRRuEL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=BR+VMlJA;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=Ap8egWZr;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7khbhg5qg1+VyDLZnWKPSSpFEt9ETq5/oIU5RTWFwQ=; b=HzxBXtfZmVS23GocvmYgRnVy/L
	uoAdvOX1W4Aqn9/er3zHuekmZkiXQgcMdUWZlxTnuNvXoiOO88kgO4OAhxq1y88WaqMej68xa9/wD
	8fyjhD4AUKPQ/TMufmfDCPffdZjUK8UUZxqSWT9iBWqoHm4phpgogXYE00AuRthv3+yg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZQNb-0004lY-VL;
	Tue, 16 Jun 2026 09:46:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wZQNN-0004lJ-Ah
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 09:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H83fYrj9XvhFb5i44qB3Zo2OlAVP2u2LHxupGylFnOo=; b=inQRRuEL8tFJ6v7skKMY78z1nq
 xGV8mRsO0MoEkCTPtA2vbsf63bvsKeXs4qPTkcDUJvv+hPVur99nQkZbCdAas9OPhqKx+cTfuahof
 H+YZd7lQUQg4fOvcfHMMkD6ONX/RaY4+UMWzyFz2iNeS0wu6ygsQdocQjHpL9DdtawV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H83fYrj9XvhFb5i44qB3Zo2OlAVP2u2LHxupGylFnOo=; b=BR+VMlJAN2JciPOmQTeLXmcwr3
 JLDoLPK78wHxsm1SyrC8rLZsejxBq4bjQSMUmsrLHfbxr2qmOrgei+lbytlljByOl5A8KnkcbE/wV
 /AatooyfhQ40SDPliOiZHjN8TdTvg8YVvv5Kb5m7d5kXjVAh/KRI3maWwYreM6BEA7JU=;
Received: from mail-koreacentralazon11013006.outbound.protection.outlook.com
 ([40.107.44.6] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZQNL-0004uN-EQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 09:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJMfvmsJnIO6IIRxZ6bIpfG93xuOnk6KQzT88eGB+pJhCa5n6cToZB5KFDeOr1NzLFkfuzHVvkU63sXjIx3h7/3USWlQ0xoDmXmUvpMy9HrLUO8d9dSJ4pJjLD4KvYbUuiNkwl8vzG1MsEhrnVMBCqvsvaSgnDTXFzm4euCGriJd2QyvHnuE3HHkYOhCRjtm5deja7QMJDL84Ki9d+qx52pIhFVMAjaRl7/T1Nat+WBzD+/OLlQLRPujD3jpwZmjR8A9a9PMQ95KeHrAdZds77WFdmTPXDcA6/7M9piKZlVHzfclH9Um4xAfOQ7h6GTNuyOlwy+M26TauF/YdtTJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H83fYrj9XvhFb5i44qB3Zo2OlAVP2u2LHxupGylFnOo=;
 b=hi2WI0MCiuYHABtgeuG0loVRaL3NSMO529IeJiZqi3j++vgqGVTX2zyZnhRvGb044ICzmWoSCa596HujVVXN9IoxM+iXsuuZiGWQfP/chGtqZKv7cyTNPuxsQs0mJXNTGBFfJmqmlMU5dmfTNX6XABp1/kb2yRrljVwoMR+Scsd8SZowy6gDiFMOTGgJAK/pR6Ju/vXx/dHkF3Vj8AgdFV2tRboG1kXRiY1BnosptB8+IQ1d7DoFajnPWLpR5o43fHZs8Itkh7VKOJSkfCjHuzixBQmt1fNmjGoOt/5hszTSt8iA7nrtInXgaYYXa1mAxLKB/FJWzS4ljI9tpNWzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H83fYrj9XvhFb5i44qB3Zo2OlAVP2u2LHxupGylFnOo=;
 b=Ap8egWZrM7dkuhG4FgV0fmtXaxlsYdfFKek/80VaH7/bMDwn9QGsMDk5bXhSWn29tt/7YJ2IMacOwt0zDEoB4BPCifOSdNnE5parUXoSHPhEAl1QZmMkLFw1UnmYkzKGmI73w1hoX1dDAil5yS7yp5aU+0th4HUlRNTFdqFhQLt/9HkBM4+gpcfuL+H6WMViUaQF8U/Geq8Bk33fqlG1FqhIg44k4CEEQwb62tHJREGBjiLrj/72FcO4yJiuOW7Ugr51FPji6OhlgK7slD9a9mnrSVC2qkDXcGTrqtKhV4kMPf0Fe4vxTrrXtV8yw1wlfALs4CVa8apmhY85l8gUCQ==
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB5438.apcprd06.prod.outlook.com (2603:1096:101:9a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:46:23 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:46:23 +0000
To: ebiggers@kernel.org
Date: Tue, 16 Jun 2026 17:46:12 +0800
Message-Id: <20260616094612.45505-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615193728.GA1764@quark>
References: <20260615193728.GA1764@quark>
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB5438:EE_
X-MS-Office365-Filtering-Correlation-Id: 80e92ae2-b14c-491d-1a28-08decb8c2048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|52116014|376014|23010399003|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: YNINnTguk7H3bsJlV4xadxnP3PoWcftC+Og2DZ7Jk5gFPpit6GledtWfNNPaGtQJSdLM02EQa8aMVvfNOAruHKwW8lCN2FHwwGyK4isNOlOmlDFZi6CDgpVKqe3z3aPogU/WLSzg20Ax28a93oU0SAz2ASQxfgn5E6pRL+lDHNzmKm8vTxzuqM6yGcjvQsWw3Cw8uYIg4pWp7rXCpPDxub/eGWRZkQHBnqdheCaE04qghKlgqTGPQhlqeB8zsesZgKOvaS7t847E9A8d+J6q1joal5UugwT+XHfTxgZdexmEAHAuBVIYf4LgCgPEHlzGtGXaPLIpagtqdoMEoX1CLG4rsUCnTuE63t324y81sbVlL7igRwa/8Nc9ImSfWXcP8RLYNIrcU3b+a0XVhGv0ZWD3zhsEE4FWaXIsHVyarxxGo2MCmVA/6njoJ1eEJMRp5wuSRwspDYpi9qaRV35hFurmHUvLzzEwpmAXMip0D71HjsNh1ORp0IoGKXy7XE872JRHemoQxnV1+1akU8fAIRWpoRKTNMM6MS7BGiqTVMTn5Srd3i6st+ftAoGGhYxwjHiVXfVcX4telbelHCVE3zObWHX9lUYpeIkb39VWy8IQEOOYTU4776jusyu8nXfHmxn7DdftnhCupYZ5mB6+9gnjeSNEP7RWcuUbACk5VziIxUzu+s2fpUh/ckcQs79qh/La3KWMUzDnQ80Bocu4Imqc6AT1bgJN0D6LGeDOg6Oh+VwTlQUNhwh+zN6ZA9eh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(23010399003)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wUfFfoC6PBeQgOG/Qe2RqZd4oMj4+dwKCbOiiVKl3gidIDbVW3mMMVdJ5FRQ?=
 =?us-ascii?Q?aFmuCSYbJK+sz8DDllil1ZgSDRg7nbcYwCtMEvR3FOJASw7G2H/iqwGKnyJg?=
 =?us-ascii?Q?tuo24DF23emBIkPf8an0KupCbeluPQfaIjgyfjJ1l0EQzfF3pS5wJiUHS5UU?=
 =?us-ascii?Q?JJkw3CiXt03QEOxUm7dCcNkM+1Qtdd7VYeTVu4GfqlkPjEd3VV0HZZqL/ry3?=
 =?us-ascii?Q?6bUfXh9pJb+7lXO9YomhQjGAIEjxPiu7/agjN5xQDTKkOiydVSdjiX4DPM0w?=
 =?us-ascii?Q?ZYV9zzh7g6U5U7STjM72VHjqQfBm0bH9gxzwEhZIo4j8YXAZuFAm5R91/+Vl?=
 =?us-ascii?Q?8+FLH4xMd5hYRGWndfND9h6OVMsXV30ma77UL/AfLto481+sYyhRQpBXnoqz?=
 =?us-ascii?Q?7rRVpbZA/6QrBAUBzP5DVWKKtVZIyg6I4hNyuMhO1fDOjqjymY/1R7dMrNnb?=
 =?us-ascii?Q?7IeqpXr7HNb4wpyRo9mhddJcEUM1inyXxLhZH5n8nKZLXS2P1P9CuE9V5/3+?=
 =?us-ascii?Q?V3bUiQMvY42mU9wRxiXvUbjoYYsCSn/SHslh7Xh4nbFqE1OTtYbbsaZdQpUr?=
 =?us-ascii?Q?VB9WZNRvdRucwY6gci/dgUnA44bsMp8kbZQcqpoqXhcDBB/jY6jC13AROFjn?=
 =?us-ascii?Q?IH0S/MzFZeegu4dGK0MKHWI0+g+lyP9Eh0ghtKsf8qarzbID+AomRXMcUTbg?=
 =?us-ascii?Q?iDicv6J33JieEsjLTvI0esW2SuzMwYAPYE1n7bEEd25YtBfQrVJORz6aHPRQ?=
 =?us-ascii?Q?8v6wxJh0QpENlezWOlZMg6GQ6vvnT8YTRD4x9GY/pHNuJHdZdXwce05Tq2tC?=
 =?us-ascii?Q?M203Yp2uxxejORYIbhbiEIObfEjzyu6MPaPfa4uRVeTKyibYTkpwC3xDcPQY?=
 =?us-ascii?Q?Ddn4F/9Z0KYmdJ3SpOUSHfR4Ihg7qtItW9DAv5V38U1drjSiJhji5s66Ra4m?=
 =?us-ascii?Q?IS788yD38MoATwqS1OQGOv/U7yZJAT+HIQHGJbpF6kkrzdf8LPMgW5IV3MWP?=
 =?us-ascii?Q?16vfrvumeTQKyy/4SKXx3w+U8wGwrETcvF/+CTPEY/eoHeEOL5XNPAWZMJK4?=
 =?us-ascii?Q?ql3CCDAw4bdFr9ZLOZhb5dyZQHjFkm9cpVVzvzXJLbHgAN2/5zZ8ptNBZ2+1?=
 =?us-ascii?Q?M3N1qYVXaLZMiptfxAehw7zYNf+6npsoS9wiG/+E4sHhhwetuds2maJPgXU1?=
 =?us-ascii?Q?Ugrqa5jqI930wQvj0CLQWy/0Vz2Wz/lcgkmIWUY0tqJ7TJo73XiWGvEp5/Aa?=
 =?us-ascii?Q?t1rKMTxLKA/eNTB6704yD6sZZzf2SgycCZfH6qm6aoFpnAA02xWRF9TKP83P?=
 =?us-ascii?Q?cA6LjZDbZfZ0Y5TGcEHWYPmM5J2hUXsboMDCKTVTjvKBVa3erxIc4a/yVtU8?=
 =?us-ascii?Q?BNxXzHPLvYC5YsCF3KuXwrVFUlXvRLlSxMBQsqTlzX2CDivSbDUBRsF9d0m5?=
 =?us-ascii?Q?WlzbNM2G2w/GlqFfiE2Nvc4yDynF/wTM8ItKcbI47Uv2EVt6aMWaRh3K/B/2?=
 =?us-ascii?Q?eN9gcsKRMdTe/23acm+J5Dul9AStf5WDhmYAzxsM+UexCZEo5TrzXNLXz3hF?=
 =?us-ascii?Q?bEtztIgjAAajLxADzLs8LF7JbrSrTDuvNkcz/9YGpkmh2fsLWg9k0bvL7GUq?=
 =?us-ascii?Q?vOKsKfwr4hEwso14dubmJa+l3nx9W3KbCRVwB193p1zOGxTVWdivIIxwcrii?=
 =?us-ascii?Q?GC4POVCVnXTmRm0+2zVae+Xsi8I54QnJBtID+ADSJ2K4mEmhb9+OVw2o7/gk?=
 =?us-ascii?Q?UQ9SIWK7ag=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e92ae2-b14c-491d-1a28-08decb8c2048
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:46:23.3995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUF+ajaARsiUT+OeyYKsSQUjw8JlvBCkr0M5ZOUrEVAx2Lk2YOiR3FB3v6SJQLZX8EmOTJYHQu1A7Syrh0VNhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5438
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric, Thanks for the explanation. I understand the concern
 about deriving software contents keys from sw_secret for hardware-wrapped-key
 files. I agree this is not the right security model, and I will stop pursuing
 this direction for [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.6 listed in wl.mailspike.net]
X-Headers-End: 1wZQNL-0004uN-EQ
Subject: Re: [f2fs-dev] [PATCH v3 0/3] f2fs: support encrypted inline data
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
 skhan@linuxfoundation.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:corbet@lwn.net,m:tytso@mit.edu,m:liaoyuanhong@vivo.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:skhan@linuxfoundation.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:replyto,vivo.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D21B68DAC3

Hi Eric,

Thanks for the explanation.

I understand the concern about deriving software contents keys from
sw_secret for hardware-wrapped-key files. I agree this is not the right
security model, and I will stop pursuing this direction for now.

Could you share more about the direction you have in mind for simplifying
f2fs/ext4 contents encryption around blk-crypto?

For f2fs inline_data, there is still a real space-saving benefit on phones,
since many encrypted files are smaller than 4K. Is there any acceptable
future direction to support this kind of inode-resident data with
blk-crypto or hardware-wrapped keys?

Thanks,
Liao Yuanhong


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
