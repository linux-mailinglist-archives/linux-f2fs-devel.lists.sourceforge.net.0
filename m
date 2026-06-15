Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KWZNNCf6L2rOKwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:12:07 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD2686926
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:12:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Rjxn2XyR;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=UQL6yW7O;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=mUK2HLSX;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b="J5deS/Wb";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6C8RZo0FEyn29+swyuUhoQAMU5yDTFLLTDNDGXGJig4=; b=Rjxn2XyRlIQdbqZ6ylKsiPEYEu
	wVZcFUkcJPC+iPu3qhCRYI4iOLapoYHeDQa6oDZk8uxroIwDWQUpwyzpxAnMq48RRm7mya2vYeUm1
	5lmTHRcXm3Dga6LFAhufxLy/hebRGSHJQ/JB/m3GPC43tOsyhgW6vtKr8k0QaWwEYHyM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ76k-00028d-VQ;
	Mon, 15 Jun 2026 13:12:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wZ76h-00027m-SO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:12:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qQXZT6AQ68jDzq59cpPyun+yYLMI9gVYbqfZAzm9E3o=; b=UQL6yW7OPncxisAIqFLe34s0iH
 BHp/4J3rNHOf1HNu9pEtUgDc7NBFlUYnseaArTn++UWT4AnYkSsNL6trSizcGz28qBUh0IYlvhjDT
 i1P7TKMAkmcsFJABLAsNEeQIJrPtqajjGottLhjOz9EPkB9b46gxHb0OGHFZQDprlnX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qQXZT6AQ68jDzq59cpPyun+yYLMI9gVYbqfZAzm9E3o=; b=mUK2HLSX59OuyviiT7fa/HJxHT
 pY8dL8uXupPOyl3gHQ96XUugq849Dr5cvzquXs1sTUo+tOwqSuXwXxNJuhr8PxwXXmttLxAhf8jnn
 27EfzvyNc0bnb4RnQNYfnTwHtcrDGG6aRZwSQyfjnYK7NzLFUVZC9khEKUJOv1ajsO0Y=;
Received: from mail-koreacentralazon11013058.outbound.protection.outlook.com
 ([40.107.44.58] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ76e-0006eT-Af for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:12:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtTRRXUUj2plu99zMntR8jQStFRmQ+GCxkd98TokeAmptq4gdRzJtM7aw+5Xrqjk/mHi5k6pnJS6dA18eZVlDQxTYuJbRBlPu49STOMv+LpOLmlECRv3GZKT081/awBVyiX7lUD9ft0Gf5Sy3sjeIVYAW14PW16iCOCrQevfUwJSkpp8MelH+MSF5j2qLFoKUqULvps/QQ3/MsRxpJp1y+D4uJ7febg6zZfKR6HGvVkYoehEtTWhYMEFEgUJvU7oqwErd7mE1vrR2EutpMQxJ5NGDdBnxRDAmDWXIWds6zbAGMq9ibnIES4uP4sO9F40q0irC8MXax5uh+exKEKVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQXZT6AQ68jDzq59cpPyun+yYLMI9gVYbqfZAzm9E3o=;
 b=yjTa+7DoP+rOqStrP+M4KapRYFHMV8NTAnIyWUbSQyNL75j5zH7ZlNkqKwXpzAow0EcxtOuchCtwFiAMeXmqhkDgpqP3cepbF5zLc+WoED671B22Wu7nW6U757GlkivOAkVTgGU5jHs7SPnyc638klo0GhBPJkOiJmLxkQ6Bjsz/4j33Yh8uYSHAo7L8JX9qzSWGoSQJ5B5EKIg+PqVvNj4aJpQftVTruEnIFE9OiGrD+jiGDPc9JoOdPKrKZHdpJo9ByTeqmZUcfWuPMMUjdWZ87gI77+DTfYFG2F1UXCJ9HR0fvbrWIWwmERcDPcA5eaoTp0a59bG15ErA99rBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQXZT6AQ68jDzq59cpPyun+yYLMI9gVYbqfZAzm9E3o=;
 b=J5deS/WbnSIsVuVPUt45fmkqGV4tLYWJa1TSOaPekpB57P35iqCGqnoIvlzfE+1WK3OguA9flQMkFhjxIys8tw+k37nXtcs/hqVQy6bYLNy3J4YdSL9ZZBDiF0gKd/K6JFmqZuE4g1xUiMQUl3RlQS2Bi1mGGeqrEEhTe8YU1FehQguqKm8M6c8r0j6yMsjOoIonlD4CgKr6fZBd0Crdb+f9jwhEPurTIGTp8y+eiFxr/nta+VJppJAmBn7NW0i+IxNVXkO1w9JFjF37UNzv4Bl79Dww1yFqx8cq59u8nMouVtgPkWU0jwR5OloRdbp6jZsXeQv6/9kh+DeP6/FjQQ==
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSNPR06MB8687.apcprd06.prod.outlook.com (2603:1096:604:493::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:55:37 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:55:37 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Date: Mon, 15 Jun 2026 20:55:15 +0800
Message-Id: <20260615125517.362294-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615125517.362294-1-liaoyuanhong@vivo.com>
References: <20260615125517.362294-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TPYP295CA0031.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::9)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSNPR06MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: f4b96b41-fad4-493c-2777-08decadd6577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|23010399003|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: gFUMCw2goqyQImWsmImYLzdpjhb2F7KZo3r2WwsY4QfFRjzCmeWK200HRy5QNRu892yPqdFMNTPd6rC066e9bzcMZSuXCTwLE3oI8aeK53Dese+UK/2JghOHxtj0w+ZWA25uyXNyBSgJDe/hBdBZcY0vTpoWF7Xngb5SY9/6HgQ4okaS0VLOTQ9GDXO42TLezARvRh+ek/0MDk4w05mfNBjgYHupIwQIIDVq+sdvquU1Z5899EoKTkgD4DmlrORjKdTMyVLv5jVrGVezw6y8duOD5RGGYbk6245ghnyEiQFGnbBAnFmNnIcjUjuVdg+U+FfjVZlHLkPmq/gp14avSDD+s6Qj6SpgEnYzb5ee31S99c8NJ88sTMlNXhXWnYMj0sCOCvjcfuwahsGWCdgLz5ferVD0E7hU8y8cv7It37IIKxe2zSmB4UVfrKKKSWdYDOEfwO46XllmAIez8ULZoX895W035hiVb7nyExX4ScQqL+z3zeCYp5cFgwDYy4d0AfSXRBcm2FH54RUdRqM3CT8HOL9s1xinYPGY1NKCHyFn2wJd4/7rZBs5gzbBxODn62wOGJWEBX1UOsODTY+uvxtSPa69kuUVuBpjatA1rV4b1LXgxwvTGwhTh+kNmS0IfCoFS978HTTE25VfoX4Cvhs45M1HHSgJwjr7lWzAt4h24DkaJUlPXXhzMUWWXBUDl8zwj9nSONYoxKLu29vqxxj3SFLeuXWrUj3+BLgIGXutn+RovSIaCrvDFdDfZVsv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tv6R5Uclmm8iLjY1gBbXkC+925wSo2vaAs0axw+jglcP/xtx1B0gWbBPWS9c?=
 =?us-ascii?Q?bOKf8fSI5OCUz++CADsN+oc+4gVlPtvDr/A+BbDmGKcD0u5N7ayrWYb10F9r?=
 =?us-ascii?Q?YW7ZmidpLQNCp4pdMLwDHQKb12t9EdfxATcdYYX7N92PKNDCxqlavg/yNvDH?=
 =?us-ascii?Q?6RzNfhka68iQ2liHbobc8mYK3bZyz61HD7m+TCRbgiFVBK6wI0vPy1PtyFm/?=
 =?us-ascii?Q?zgODeCqhx2ghsFZJnciozbskEY1HbaWCeyY+m5yNvxOK+0C+F24/Ej5JDuH5?=
 =?us-ascii?Q?JoLedpTQVtbBTKRtOCJbxM7/dlgDcXSG6sr2m/ZhuRU33zxdQg7b9q/2ccOf?=
 =?us-ascii?Q?fiZTrToHK6wJFP0Cz96QURAee1WNYo2IxEHfX6lNAUM+JGbik30JjIxuDtKl?=
 =?us-ascii?Q?wj/YphVn8fCH9YyCNprlz+JeMHiYgKpzncUH4k9MuE0l/p9OOK2Mc/NuxUr7?=
 =?us-ascii?Q?LKSwGlaLj1YWElp8Ign9aB+ULQZXhCbB5ER6nPDaXKdRZWd5CLWMFVLa2Ylt?=
 =?us-ascii?Q?DuBhv3N92niZvAREhfWhxz6nGm9/UIJ9iE8Hr0bAiJ48+jtHmRVgx3+J5XGg?=
 =?us-ascii?Q?DCV1FuLaazWcro++TMfEOavPAt0RsD2boqhyjUkD9HV6QtciPnaqlhj+Q6sN?=
 =?us-ascii?Q?Q02VKuwK5KgmPF7DGTJAyEUXlnsoe6MP2OTs+6mn4lSvUzxrCI8DPrl4y+1T?=
 =?us-ascii?Q?y/7lMKV3UFTN/oWiJboxw5GaZCH5fwSh3fMY+ER8SKlhbyrIUulX8oFuR/7I?=
 =?us-ascii?Q?ekQj1yU6JJDbxNEI/JBQwf97x2DZm4lQxUSG60K9Kx7Q1QRw+f038jrA0LNM?=
 =?us-ascii?Q?oKZg+lzN0hZqqBTTDDtOgRvOSaeKIfk2qLiMtFONBi5Vrg4CrAYi3c2/EKWg?=
 =?us-ascii?Q?jK5vjEFYNgLaj0JCtYxGdJGtzPHsIJRAvOeltAn1LVDMdam7dRmbmePH/sHU?=
 =?us-ascii?Q?JE3+qWUUjDplnm6dMonqGMXpEVd7BXaAdhqsOxzcq/wnxEfh2UqqRKj4n2B0?=
 =?us-ascii?Q?NnTgJlQoWf2rZFQu6tZzjn1tHf3Ac95eHq807j8BwYprscUzI4WO3lKoPdeF?=
 =?us-ascii?Q?qNGweX2QwjaL1s6FbbpnjWEconrpv8FTQi5ay+ML/+vmiBn1D50MzEjYRaCD?=
 =?us-ascii?Q?tWlojDOIGi6/ygms1wt5rUnTgNGpC1UAKe++vGNowfGGB7X5CHtLALqiZ0Da?=
 =?us-ascii?Q?oiLDKisaubtvh925gMNHdmmAlzZkh3tkdxh19MpwCpao0+8W5Hc0xGxOtaHP?=
 =?us-ascii?Q?D/iD/1jtCPlrSIUVI/xuF7DTRtNEYIrpJizhjAIw+hChG7em3zF3e2ZCW1lP?=
 =?us-ascii?Q?S0uvmPOrY3g/lG2CNpSTFzqsRbOpEM2jHiHsiaDbMnOhRIPHRuU30kwhc+zL?=
 =?us-ascii?Q?3QN8xvV/Dexz9qd2zkMXjQGNx1XYyXCse6U48V6NVrJHm9gEMjcF0VgfHc1D?=
 =?us-ascii?Q?0I/KB2GuoRDqqizWnteGdlx32+GF8AxzNoraspQesX1sV2sUcAZXMZUwXP1p?=
 =?us-ascii?Q?nkd17+3o+ep0eipm5b1Ny/XXcf3+h7s3Ev3nQfnntPChoYmLoxNQspMXND70?=
 =?us-ascii?Q?YPiNfzy0r8CgqVEj9MTKYN7OLxjZfaCVl0IscOSv3wo3whof0jgD736vCcYz?=
 =?us-ascii?Q?y++BiBrCU/+sJUvo8MIInFhLQRVtZzFtb6oCc28kz+UIPY6XQwpkLLL61x8g?=
 =?us-ascii?Q?hmxZAJvBppAz+/s4IVKK53vTcgmyYuttw8iQENo7YdJWOVmmdP2/oPpCXod3?=
 =?us-ascii?Q?fO6nYTPV1A=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b96b41-fad4-493c-2777-08decadd6577
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:55:37.3609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +26W8Q2e9C2D839s96X/VhKir/YGy9ubv4NVG17pv+Ow1f8xPbQ6DrY48gF9NYYecNGpZdKMSF5r+SD4XQR9xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8687
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Document the F2FS encrypted_inline_data feature, including
 the on-disk feature requirement, the CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
 dependency, how inline payloads are encrypted and decrypted, and th [...]
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.58 listed in wl.mailspike.net]
X-Headers-End: 1wZ76e-0006eT-Af
Subject: [f2fs-dev] [PATCH v3 3/3] Documentation: f2fs: document encrypted
 inline data
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
Cc: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:liaoyuanhong@vivo.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,vivo.com:replyto,vivo.com:email,vivo.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1CBD2686926

Document the F2FS encrypted_inline_data feature, including the on-disk
feature requirement, the CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA dependency,
how inline payloads are encrypted and decrypted, and the truncate behavior.

Also document the supported key combinations.  Files using filesystem-layer
encryption reuse the normal software transform.  Inlinecrypt is supported
for v2 IV_INO_LBLK_64/32 policies, including hardware-wrapped key
configurations supported by fscrypt.  Per-file inlinecrypt keys and
DIRECT_KEY policies are not supported for encrypted inline data.

List encrypted_inline_data in the supported F2FS feature sysfs
documentation.

Signed-off-by: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
---
Changes in v3:
- Update the documented key support matrix.

 Documentation/ABI/testing/sysfs-fs-f2fs |  5 +++--
 Documentation/filesystems/f2fs.rst      | 30 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 27d5e88facbe..dad483fb2fc1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -258,7 +258,8 @@ Description:	Expand /sys/fs/f2fs/<disk>/features to meet sysfs rule.
 		encryption, block_zoned (aka blkzoned), extra_attr,
 		project_quota (aka projquota), inode_checksum,
 		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
-		verity, sb_checksum, casefold, readonly, compression.
+		verity, sb_checksum, casefold, readonly, compression,
+		encrypted_inline_data.
 		Note that, pin_file is moved into /sys/fs/f2fs/features/.
 
 What:		/sys/fs/f2fs/features/
@@ -271,7 +272,7 @@ Description:	Shows all enabled kernel features.
 		inode_crtime, lost_found, verity, sb_checksum,
 		casefold, readonly, compression, test_dummy_encryption_v2,
 		atomic_write, pin_file, encrypted_casefold, linear_lookup,
-		fserror.
+		fserror, encrypted_inline_data.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 5bc37a1c4e51..651e84e8dd98 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -420,6 +420,36 @@ lookup_mode=%s		 Control the directory lookup behavior for casefolded
 			     ================== ========================================
 ======================== ============================================================
 
+Encrypted inline data
+=====================
+
+F2FS normally disables inline data for encrypted regular files, since inline
+data is stored inside the inode block and does not pass through the regular
+block I/O path.  When a filesystem is formatted with the encrypted_inline_data
+feature, encrypted regular files may keep small file contents in the inode
+block.  The inline payload is encrypted with fscrypt contents-key semantics
+before it is written to the inode, and it is decrypted back to page-cache
+plaintext when it is read.
+
+This feature requires the encrypt feature on disk and kernel support for
+CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA.  It is intended to be used together with
+the inline_data mount option.  Files using filesystem-layer encryption reuse the
+normal software contents-key transform.  When the normal encrypted file
+contents path uses blk-crypto, encrypted inline data is supported for v2
+IV_INO_LBLK_64/32 policies, including hardware-wrapped key configurations
+supported by fscrypt.  Per-file inlinecrypt keys and DIRECT_KEY policies are
+not supported for encrypted inline data.
+
+Encrypted inline data is stored in fscrypt contents-aligned units.  Therefore,
+the maximum plaintext size that can stay inline may be slightly smaller than the
+ordinary inline data capacity.  If an encrypted inline-data file is truncated
+from a non-zero offset, F2FS first converts the inline payload to normal data
+blocks and then applies the truncate operation.
+
+Recovery copies inline payloads as on-disk bytes.  Encryption and decryption are
+performed only when moving data between the inode inline area and page-cache
+plaintext.
+
 Debugfs Entries
 ===============
 
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
