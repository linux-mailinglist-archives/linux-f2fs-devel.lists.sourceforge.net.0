Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA377B1E5F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 11:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MpxQsvr3oo45BrcGK/RhmH6mf3DRIWX+LbGoTgmOY+A=; b=LuRGMuqMZAEUZpA/+TwGrO22v7
	ldbkhz212Qxxxihq6wjt1DxXXu37JIWhNb9hUOoZeybc60osUShFQZnaZWr/nuBb+u18C5q2Y+TJc
	trhDTnNHjJKa0wbjFZeBNx59FE5mpsqeFf6JJd6hFRDo0IbwwSNQdw/6CL/mui6cmjIk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukJiB-0002eK-CP;
	Fri, 08 Aug 2025 09:48:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1ukJi6-0002e5-Qw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 09:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hHBVXpHP/pZIpMJkcgDTCTGJRh3qwXvn2YNPJP2D/z0=; b=cBPGluQ/T63TshyRep8lTWW7sr
 93OUVu3Z/JS3hfsHXtacb+j7JQe7dqnx8C4XdhS/3AaE6Lf6TX7GgcccpudxLrEpthEGdGVIZz6+o
 gqQppfjSLr+indEHHsmiHZXas91FIam1fQRriPgs9b1pP665ls+YSdqzstIYEzFCrYcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hHBVXpHP/pZIpMJkcgDTCTGJRh3qwXvn2YNPJP2D/z0=; b=l
 WRuxGTJoXGiRMn8LKxvjOC1uLZVZMyjdT1T2xfyDip6+c3IQ43iNC9u2Lz37lMdOXQNrCkSYp6gNy
 /5U4mhYRfLhRmjwbBayo6CgNxSaGKfEQEM/FaThEr9mIKhKaRMJq+9wc4tN1eB0NcHcE7zQyCfy4n
 9rLFdmIFad+0Itps=;
Received: from mail-japanwestazon11012070.outbound.protection.outlook.com
 ([40.107.75.70] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukJi6-0004N0-8F for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 09:48:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5VylByMppJT+EICHT3mnb+8kKHA0IqrISRRr9MIm5zynEn+fxGwsdpEze3zn3SxgCgO7vPKwiXxM0I7ArliEja7fVujuH05mobfxvJ2H39G1SBhjy25FOx2630qxVovapUE22H4tjKIpklzb2t+aVxTwdQDHpvjJ6RCRRUe8FfUL1HD5bt/pP/TekppfzcqetLM5TOeV7sXCC+mUY5OF5XxVaWgqYs0MDX+KW62w8GJ43CbMZvw0pHC+pCCK02aYrhFIByJvZDWz8RYAtA8yv5ekGLDAOrUTWwATdK3CtDfVe3CbN+kjcDSYBJJ8uOc6CJ+YBri5VvN14314UmZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hHBVXpHP/pZIpMJkcgDTCTGJRh3qwXvn2YNPJP2D/z0=;
 b=iHofVPUE5JvwuJtum3nvKe2Ib8XtfT9SzoRxQpj1bVwA4PKJbxYGKuPpM+zVPW2IUv9ha5bLp8FOxkGIU74nPGLHTVEjMVGOzQb28L7ynkwTnMaRDpdqbFJfyhY0Jcr65ch2JBN7lCXXp9n1dUdKQQLUg0Z6E/ISidzsD+gWFKp6EYCWF0A1v21Tdp/hUCjL+fBKJRtWHwAidR4EAiiMmKAf+K9Oam6aF9Z/LqrIBYxj5E2k2Z2pCt+rGPRhWuu3ftB0WitD/XJaMkSiadgD4jrVtYENxPOUJkXaUEuHdpLfHg2ruXxscNTOhZaX1T5l3Ht3lgNExsnlb+xnr002hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hHBVXpHP/pZIpMJkcgDTCTGJRh3qwXvn2YNPJP2D/z0=;
 b=RuvbZwpuyA3tmUZthsp7iWQ20tutpSbCTnoQpsLXgQvEvjOeGdi3PBtEuLF/2/NvrQ3pQJn/6JhW8bSRi9EtS+eS1FOIZyr4f5JvC1pQCvBJzApPWw2nu9z5uH6FPDoNzthZYSl+njIJJU9iZEF2PdZIE6uf3JO1Ha9+ZumW7rhitCq6ieYBmHE4gB6W+/KkxK/m09btuAh3AINdJja2/VbUAgzknUoAobHN+tuka3xfpya8PaFB/u6B3XiPFiPFm5J8YunuTXXBONCTY+kHjDnEBBv25lSg7/wvfQ30vhOvgwQYxxH9DjIv1Aw7jTdPaI5dP0otdx7lcKx7gsjgbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by TY0PR06MB5846.apcprd06.prod.outlook.com (2603:1096:400:277::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 09:48:12 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 09:48:12 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  8 Aug 2025 17:48:01 +0800
Message-Id: <20250808094801.250480-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|TY0PR06MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb5cbc6-f503-42f3-f993-08ddd660b024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?blnvSAKVhY/tLMwGdMbDE5QfdLaEPFR6ndDkmdaQ9FB7S+Dvpq/2BKdYvZvX?=
 =?us-ascii?Q?mdDF2zedZ3wRTl+MbdpQVNeFzd6Rg3pMbqrGseyH9CsMpdko62aF+o2dFuZs?=
 =?us-ascii?Q?ZIv7cLoQhyqB60QZO/M5VqU41ixkni1rCGSp7vUXAShpDmrZ+3JRlt0IGo2e?=
 =?us-ascii?Q?6MMhSqTYljrAWeVG0bAY497coIs53kGAEzgw0DdenfPQ/gLdro/956TwUoIb?=
 =?us-ascii?Q?rBdQhmj8B8G9Jr6swxMILU7MVZTVWypKCSFezw5yVienB299xu0spCQNF6Lz?=
 =?us-ascii?Q?I0WvGDZZNvi2Ha64tebymA6IiTODER/Of+TLgJq1kBlNiQt3dTlEQDj5FRiH?=
 =?us-ascii?Q?et6c2WvXLThuSrQI5LxGrnZ3AQHUZUUN9IQcaMWwbjy+TcWsqE/I5vWJ/reo?=
 =?us-ascii?Q?OXF8QZN7bXw121OBfxiaGfN++6UXkswpfhYgwExW/Yw2ZR9ipjI8Ssah18V4?=
 =?us-ascii?Q?c5LIXKpQcLeCkTSSnPzHv4cDVV/OPNGfZJPqhuujQLoVTzokMP74j43cde6Y?=
 =?us-ascii?Q?ziOSFkze2P/HwlH/CC2uA+AodbZVSx/7eKKv0h3Rp/BAHH6xCtX9jWqsFNj/?=
 =?us-ascii?Q?Jt8yfo/aU6lr4bkJNl/stV0bOeUglSf7rOiWEcba4ZOTwj8kMPbL+s3u8GID?=
 =?us-ascii?Q?eAYl/J/QgU8KsrdBxsLvxnJu11c11aw1RLGz3+Nao2rMQkWgKjnOS5NqiAtn?=
 =?us-ascii?Q?c4KYBQwZl8gnDNIV5XdDtEwCvBsRALoz8c1tOHFflLYXhCZzkldtxpSHuXrd?=
 =?us-ascii?Q?NHdnjdAgCgXOi8u/wNWdYvaPKC2Nd/bGdX54gCT9WW+F5aP+iGCWo+c34aly?=
 =?us-ascii?Q?ICLD9n9/4l8ff0s/tUvIsVrpQOfUNSgPDgTNRjeUKjNswSkDUcYp0+uInyQm?=
 =?us-ascii?Q?MsXfpVlZQARKR0iqvcZKnprgKemcm50ccrPc/CbD8dCea4WEYLteIqmEM8vo?=
 =?us-ascii?Q?D3cVnm4wKi1nwVssBL78wznMmPb9C1wOjoSPDL+2+bMoWo4SBdznGZBpilov?=
 =?us-ascii?Q?goAFx4zWJvRVnlGCl6OeS9FfDCRd2hvNq4dfA35gSp4mA3Jk9lIg+8JoOZcl?=
 =?us-ascii?Q?K8/Fok2DdaNSP4q6kNEpsOQchMtoSoskkb3nWSKFsO9k7dFz64wmSTP5T7g8?=
 =?us-ascii?Q?R5fKspNcUbGHEHtdVAj3wdW949k0uexESYHpnStvB6D5YJY7FT5Xksj5Pwbo?=
 =?us-ascii?Q?fiRttA47/YM/C8+5qCkRB5TGYbYkGI5hmgzyMcQNNFJNGTOOiyZaWT7T4rSF?=
 =?us-ascii?Q?hiSNhz/4deM93ils/EZjJo+MenOlCq/1e8uuPDmleyhZVNvfQFFbBylC2Qop?=
 =?us-ascii?Q?irsKW9qXyjd6R5EUPA5kiYMa/kAjvw0NdWwV5NSb7xxt10NGLjmePTzi/0zZ?=
 =?us-ascii?Q?stBSWT3S0llRe0YafUnhtzcjjXMMCLupDQUqnFX+JDtLoYbyrhMU/njfcvZv?=
 =?us-ascii?Q?lVgwAeCnsvV1OcKJT5GkPQZfFfrtyNj5EGR6wAySKSGltfb35Ef0ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5579.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p3D9bmXmGkX33LIDIM4yGsjqHrwke3dBbNo0Pbctswt06MDVnM41dWcvyuXd?=
 =?us-ascii?Q?ZFsGENHrDmeh33iWSAD9UgxbvPOpicH6z5LzWuw3HpaaybiGYmXmIYf+vZsB?=
 =?us-ascii?Q?K1EpfLjH9L0P+7gmnMEpSGOCuStg7Rr07wk1JXi0opWPqqMj5VdWs1osdIh9?=
 =?us-ascii?Q?QdNzkycOkB3puLUMsp+rh7oDt8owKafd/4uYIutpB/kpz2QLsDkxYtUPMqgg?=
 =?us-ascii?Q?OzX3RGN08yFiviJyPLoMyDQmIb9zyxjzMXIARE7kb+Y0fcaI35fh/bIMnNZ3?=
 =?us-ascii?Q?PGRqfn+bJDgMVyMgK+CrEsa72BOMvprTDNTNFObLgmmu9XiHBsMP6smY+els?=
 =?us-ascii?Q?4Q8wjCOqUyTBMh63TGMyp7ubu/veTkHBWtV1RS578yc4UYvy1PG71QYeHBWZ?=
 =?us-ascii?Q?M+x0LjcNgBZ7+SEulLJzaz3iljTAnY5pwekXYBZ0QSki3eVHmOsgBhIS4H4L?=
 =?us-ascii?Q?hEelzlCXTP7lE5sBOS+SNF8gylUDivYBhwFbCP3R1oBHh1nk/b060ruMPk3d?=
 =?us-ascii?Q?tNGQK6egPbeeLQX7bdDMkFe1/leOpZkpLF9fNhyjBm7VfmPGQZnfblyHpcDu?=
 =?us-ascii?Q?Lg9z00ZbM7GD73pZaKtKcUpjZbg5igGlYgyfDjngUrFW9FayJAqGUON46u++?=
 =?us-ascii?Q?uBGr0bLqh3TVCz/FoQpQDs431bAG/SrOtu8TlqRPsIPx81E5YLWkAVZx8mD/?=
 =?us-ascii?Q?8vEibZtROQFBP3Vm/zRJ3JuEWYGPlEhHgKgbePEB5CpOLdWrbcO94JydFZ8g?=
 =?us-ascii?Q?kg9C6d7P9iPDSgwr1ISSz05/X578z8npyqu77PmeKrqzKBl6YzHCxAlMlO9U?=
 =?us-ascii?Q?a4ByKLQSC7AHwcNY4c2KhARKYejr8G16+6bD+iVp1Iek2y8Oz+WUaVaYgiiC?=
 =?us-ascii?Q?Hpp5UFwD24JDNriZt6ffZp/ET2EWnlk1Wb+YxDPvggf1RaWT+BYVKF+kstQu?=
 =?us-ascii?Q?ONHAN2ffLtKJaWB9XK8nH5x/YJNHs2mYjc6Mq6yNFUWosnXmHNZOUloGKZRB?=
 =?us-ascii?Q?08tUzwFDeOgy+mN8LQfbRyKMmBAl3xbf10UN1MF5bSTKQ1NgvqwJqC1mtNs1?=
 =?us-ascii?Q?c/lPDooOxrzyD54SOECq0J/k/JuAVaGX5bjwfKxk27a31r0j5kdjowQ/EPaw?=
 =?us-ascii?Q?J8GwVWVFI+ywz8x7SqCIw75ixKS/CYA3WmcaM+n1yzAOgP++Fq8VfSR5Z5fI?=
 =?us-ascii?Q?Cs5k/15O06r/bqhkYuWrfpDkp2T18HIM375BrRGp56XiExqdDNOzhzAYoyyZ?=
 =?us-ascii?Q?wW8lbmpMOO/cB5veCfU01KAE631UEjbgyo9wYDcNKHVFHusSYO/dfNjwUVVv?=
 =?us-ascii?Q?2bq7mBFMpcl4IeZt5YVP1QKikqcAptGBcZs4uwqsRY57qnQojEKrD/mpChEj?=
 =?us-ascii?Q?hCancG95VqTltAHSl+NPk4EJ1n6W9rJUX6QNi7FeM19vElEQ9/ktkmLU1twh?=
 =?us-ascii?Q?kxEncUCcbVo0zxvhCiDOOSaIyfRgFuS/TuBiyYNX3Dr7HJLn9Wn79g4HG9KY?=
 =?us-ascii?Q?g8FVkyE5SSlKJWOwrjM1FKpfG8DnemmfolxwDqj3Z0ioMg1tP9FNlg3uIBFo?=
 =?us-ascii?Q?xV2TPqpCgpEq1KCHtPgf/C9+m8su0iK/6X9GSJ5f?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb5cbc6-f503-42f3-f993-08ddd660b024
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 09:48:11.8865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nEEuxovMHKxVOR6DxFnuGyDkQmeLNTtVPpsedgxiy7SHOzrv8aiWgWwxfq1yV+afHHun/kDJ+nZHbejE13d1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5846
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 we have encountered some issues while testing ZUFS.
 In situations near the storage limit (e.g., 50GB remaining),
 and after simulating
 fragmentation by repeatedly writing and deleting data, [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.70 listed in wl.mailspike.net]
X-Headers-End: 1ukJi6-0004N0-8F
Subject: [f2fs-dev] [PATCH v5] f2fs: Add bggc_io_aware to adjust the
 priority of BG_GC when issuing IO
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
Cc: linux-kernel@vger.kernel.org, Liao Yuanhong <liaoyuanhong@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, we have encountered some issues while testing ZUFS. In
situations near the storage limit (e.g., 50GB remaining), and after
simulating fragmentation by repeatedly writing and deleting data, we found
that application installation and startup tests conducted after idling for
a few minutes take significantly longer several times that of traditional
UFS. Tracing the operations revealed that the majority of I/Os were issued
by background GC, which blocks normal I/O operations.

Under normal circumstances, ZUFS indeed requires more background GC and
employs a more aggressive GC strategy. However, I aim to find a way to
minimize the impact on regular I/O operations under these near-limit
conditions. To address this, I have introduced a bggc_io_aware feature,
which controls the prioritization of background GC in the presence of I/Os.
This switch can be adjusted at the framework level to implement different
strategies. If set to AWARE_ALL_IO, all background GC operations will be
skipped during active I/O issuance. The default option remains consistent
with the current strategy, ensuring no change in behavior.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
Changes in v5:
	Modify feature naming to match actual functionality.

Changes in v4:
	Adjust the default policy ALL_IO_PRIOR to 0 and modify the description to
	match this change.

Changes in v3:
	Modified the issue where it does not work after closing
	CONFIG_BLK_DEV_ZONED.

Changes in v2:
	Non ZUFS can also be adjusted through this option.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/f2fs.h                          | 18 +++++++++++-------
 fs/f2fs/super.c                         |  2 ++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..71309e75bf85 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,16 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
+
+What:		/sys/fs/f2fs/<disk>/bggc_io_aware
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Used to adjust the BG_GC priority when pending IO, with a default value
+		of 0. Specifically, for ZUFS, the default value is 1.
+
+		==================  ======================================================
+		value				description
+		bggc_io_aware = 0   skip background GC if there is any kind of pending IO
+		bggc_io_aware = 1   skip background GC if there is pending read IO
+		bggc_io_aware = 2   don't aware IO for background GC
+		==================  ======================================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..075f12f92fd3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
 	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
 };
 
+enum bggc_io_aware_policy {
+	AWARE_ALL_IO,		/* skip background GC if there is any kind of pending IO */
+	AWARE_READ_IO,		/* skip background GC if there is pending read IO */
+	AWARE_NONE,			/* don't aware IO for background GC */
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1804,6 +1810,7 @@ struct f2fs_sb_info {
 	spinlock_t dev_lock;			/* protect dirty_device */
 	bool aligned_blksize;			/* all devices has the same logical blksize */
 	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
+	unsigned int bggc_io_aware;		/* For adjust the BG_GC priority when pending IO */
 
 	/* For write statistics */
 	u64 sectors_written_start;
@@ -2998,13 +3005,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 	if (sbi->gc_mode == GC_URGENT_HIGH)
 		return true;
 
-	if (zoned_gc) {
-		if (is_inflight_read_io(sbi))
-			return false;
-	} else {
-		if (is_inflight_io(sbi, type))
-			return false;
-	}
+	if (sbi->bggc_io_aware == AWARE_READ_IO && is_inflight_read_io(sbi))
+		return false;
+	if (sbi->bggc_io_aware == AWARE_ALL_IO && is_inflight_io(sbi, type))
+		return false;
 
 	if (sbi->gc_mode == GC_URGENT_MID)
 		return true;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c2..5dc293a1a918 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4629,9 +4629,11 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
 	sbi->aligned_blksize = true;
+	sbi->bggc_io_aware = AWARE_ALL_IO;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
 	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
+	sbi->bggc_io_aware = AWARE_READ_IO;
 #endif
 
 	for (i = 0; i < max_devices; i++) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..99ba06ae23b2 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -866,6 +866,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "bggc_io_aware")) {
+		if (t < AWARE_ALL_IO || t > AWARE_NONE)
+			return -EINVAL;
+		sbi->bggc_io_aware = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1175,6 +1182,7 @@ F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
+F2FS_SBI_GENERAL_RW_ATTR(bggc_io_aware);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1303,6 +1311,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_idle_interval),
 	ATTR_LIST(gc_idle_interval),
 	ATTR_LIST(umount_discard_timeout),
+	ATTR_LIST(bggc_io_aware),
 #ifdef CONFIG_F2FS_IOSTAT
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
