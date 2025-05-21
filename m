Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CF8ABED9A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 May 2025 10:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+KHm5RlQ5GkAabmuI/hslueg+olNOL3FUCKEnkhncIw=; b=OoleOtEHyD2t/aIL0C+EO9uHzW
	jrivFrWEf3am48vUgCVfmhxLQIeP/HHSr5y9n0EGCuRK0MwGub6s+OkB+E/pqXjLtnUzixRxspvh/
	hc2kfdfRbHT6Rna4dm8xt9dy7Oce8Nm8lW7ovE4hm+pCPaRSbg9M7mjwi7iYxyEEBmKE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uHeXo-0001VH-1h;
	Wed, 21 May 2025 08:11:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1uHeXl-0001V8-N6
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 08:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/1wRcx9gKppfNFciHPQhj94Eez9wID1Qw8q5GU4ajm4=; b=TKkBRhNbIJHUIE+TvjHg8rK6LY
 MnVdR07dlMnKAHW1k5FCQn9W/7mvwdBxdZp7brGAErH0KaIMrPQnOkEYmX8eqeaxEXC+i9V+OcCgO
 Y1IC5BkX/Y7B5ANRvOZG0hZ7o8e1tIPn4KiI8Xwl1hw/qC4TXeXd7GzxaDeBOUKvCOZ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/1wRcx9gKppfNFciHPQhj94Eez9wID1Qw8q5GU4ajm4=; b=M
 SwS/wED9WhuiEm1KiQmH/e4aKn4AgfSz64W9LmvbeIgfyfNNFolR9qLgyz63CZdmHdCi4zg/7HrHx
 XnDLNNAa7bHapk1gUoT5DGttoWAY4QY15q4wdLnJHb2MaZV/FC53MmGifbpX4ZmceQuIpN1IURFNE
 GqbiHCEypnCsLkhE=;
Received: from mail-japanwestazon11012023.outbound.protection.outlook.com
 ([40.107.75.23] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uHeXl-000230-0Z for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 May 2025 08:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S+l+1RTO5iKmWbHhV5Gnn1ODM5kNJMCDQuhi8Gld+z4zkmGXMZJU1JB7c5N05kK1/Ppjg91DtFRrQQJlQQn/494MaGjF5QOdIRXAMFzVyya9Uupr2Kx2MLEp4cXNZqKAI827RXs/bpwOloclrTVQDC1gDi1RaF2vWqEROD0boMRXVoyiTyhb03uGvZ4haTWo5/oZodsOsWkje54N9sxg3Juvs1SMAQVOPXBuz2ziKeWJ+5Eweh3mroP9UT9V2DKD4m24ioHas1nmfLJd5aMATMjDHr9YJVY6Mv53GsUlqvoKaCHUIhZnDov2VtRslY3jYVh+Yxv5qRQ4bCTbgS0k5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1wRcx9gKppfNFciHPQhj94Eez9wID1Qw8q5GU4ajm4=;
 b=kHVTtl/s8mnbcN8d6gDb+SP824lglOp3Y4Q0BLW/D2Jn6ey2/PSZV10PNAbrC9ScZhe1OpgAq8qO1ZBIyEa9oS03aV+035p4Mm1xGlDybI54hXD5bQbgfOVzzOuZLDuCuAbjeSHVPi05gJxkbe6I+gjgbRiFzb/FhrTncbYnxqzokWM2/9EJ986b+M7Lqy8FRxWCAPS+04U9Giohq9dSmW9HYguj0EVYbv8M9wXg7+Dg+DVqSBzOKbc5SJ6kB2T22QexB8+A0MxQz8o3/OJeRfMmdpIZ9eN43EDSKFJcqkJZPmEeAY7DG9DWJ2XCDjPkwALAcFxUODwRFN71NnpI2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1wRcx9gKppfNFciHPQhj94Eez9wID1Qw8q5GU4ajm4=;
 b=R8LHaqkB1hVKEys7dTArhyZGWMQ4UVP+27LaPYLHr/XyWGW9CkLYgckbKLJguZBPlYBBEDrJlJIChwuyYFeKmNF7RRZLL+ok4jSxLuEEa2w8v2OaYvxgyTv+ZId44oxDu6F8JmE9VuAFSC/nzG3YHOZs+VkFbnTlv0/YoVFEnvs1YyccNDiD7Zd/8jZHWZ0+VZqHz1Usx+4NvISCJq0v5QMJelbM0e0A7JRs/RwCstCvsk84yONj9yL34+k7cBBizhg9knnd69iu9d02ND7zaJUMlb5ZMRFCM1DSwRvjoSSHf23o9zWG17/Gtx5zTTJ3MmCoNAt8NAJ4zLHe87Q4xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e)
 by KL1PR06MB6427.apcprd06.prod.outlook.com (2603:1096:820:f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 06:39:12 +0000
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::a57c:8e30:d8a3:54f1]) by PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::a57c:8e30:d8a3:54f1%3]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 06:39:11 +0000
To: zlang@kernel.org,
	fstests@vger.kernel.org
Date: Wed, 21 May 2025 00:49:52 -0600
Message-Id: <20250521064952.1373690-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR01CA0148.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::28) To PS1PPF5540628D6.apcprd06.prod.outlook.com
 (2603:1096:308::24e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF5540628D6:EE_|KL1PR06MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 360780a2-e446-4f5b-3145-08dd983231c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kxLk7l1gmPyvAYxXyeAN6ELvbLrHl3outcF3XYo8mHXgyP5kDsbgGXqSD87j?=
 =?us-ascii?Q?rAot/Yw9yND3qruvZsgwDIWK53A3c+K7VoVQrsRg2TqBD3h22VRIdPJtepNL?=
 =?us-ascii?Q?i7gIAWlTkwcwshaWBTHNBhkxOnXJzIHtJOF6MveM8ixSJNRY40sVueHLBwld?=
 =?us-ascii?Q?tlDMJRbHxwKqX9unr0b+4Q2LiNOac+xhzmXalYr6onLqeHutXx3GrMKAPWfV?=
 =?us-ascii?Q?ToSDk52A6bulPB7rA2ItWUKGi842wsWNIG7ceh7MBejJ9WhltRSn+H81yYyD?=
 =?us-ascii?Q?XxUezWsembdXGMHXeqAlI1MTh+IZf2JDLMKnD0n4SzYvxr/bB1rjDFW0zF1C?=
 =?us-ascii?Q?Bq7lbBdV4Dm/NML7FuR0nzkG2vrPuIg0JtmZ8scQGuR2MIjx8Nr4K4gQmpXb?=
 =?us-ascii?Q?pPKT8IAnZ/cd2bhPDD0uJeGfDFbzFRuT7zn7eyQKZ0EDkp8T4UYsxgItUiIE?=
 =?us-ascii?Q?CfcGUWZRM/aurOrGAzZhn3qJ68F85rYpBrlvjDeYsqVKWzprv7ZfjjH6asTB?=
 =?us-ascii?Q?NWyCuiPjh3s1o7kKXczPa7n11QpYxJWFAfpiZ5bMtsuADNSQCYsmKk87BBn4?=
 =?us-ascii?Q?C/cRmcLfIJpG4VaMrN/fy3M1cjdhKU3yIvX97fYV/8ZX4CD4TOHf94ErSe7G?=
 =?us-ascii?Q?PgOgcdWtyPMvJssHX1wJkkp2G/YsyNp4lSIAt+DX+clkXNKu10fl4AXZAVhr?=
 =?us-ascii?Q?0U5N2Pq5f4tMUFKLqpu4VC++E6iaKVE7E8oFCtSmA+JxjGmhMyHlMF5V0sFm?=
 =?us-ascii?Q?9gYpaBgzYK0SuL+kYSdhSLnJSyhbjYE13lWaD0mlm8hOb2jDJOth1nN5sgBg?=
 =?us-ascii?Q?MpZkazEhrJz8QzBY2/G5j994MdhQeCSrjyPL1lBXV7zxrB4H0Ye80eT1oRGo?=
 =?us-ascii?Q?oG40DEosI6Mu7gK4HGHpT8zmv55qCAR+WgX+tTFIL9YDwk46z7IWFFd5X0eS?=
 =?us-ascii?Q?nryMomKkkipECg9sqXYD2xBX9mE7EZcmOJ8FQ+SJoiftTN20Oa02k6kpkCWX?=
 =?us-ascii?Q?HCWqdCsyFtxjC8hTBh6cF0VwUeu9T6/1ik/zY9ePN2kQ/lVBYzsgURriRlf7?=
 =?us-ascii?Q?iq3p1iC8o5m2QQJFks9Qh160VLEBHdsnB5F0c8Ekehff+FBeGGT5hBcUD3Hr?=
 =?us-ascii?Q?diNhYDbQcIl2cvSUDA6g4JrHLZxEJlVPbXGETD4JJip3WU42YfjEjH9wgIkj?=
 =?us-ascii?Q?JQE44etLmVP20m29rBa+2/zbwKA1hDFUOceC44trePn1uhtq4aFX5vYvz5ao?=
 =?us-ascii?Q?vCqP4OXoxfA22enSgyqw9fJC6xQAj8Fp0dZddiLCnKq9d4NjaZ18NZnebzyZ?=
 =?us-ascii?Q?hg9W1xb+KsP53PAiW7dAyTQA4miFkA/ddFcun4PYj04oqnxCmoPJttvriuj0?=
 =?us-ascii?Q?wyba/6EerQZlUXfSW290Ou0wu/0XoIJ21EWo1cMuQMrOwMKm/f4LBaxKR2pu?=
 =?us-ascii?Q?0DcFF2swrpJ2B2++5i+H88XAKi2U3T5SgicQweKFm5vEKjwgYmEiag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS1PPF5540628D6.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dTv9/m4LeQDD7bEKQOq1Y2mBIqCVOp+iIA0+0gzHpa54+Heox3paj4fYOrV3?=
 =?us-ascii?Q?k/Y+zIF7e4BNT8W4xjjVI7U5dBWbZ+C6heinHn/iueguheOF8TmLDmKJyPCY?=
 =?us-ascii?Q?XG/ePIkaQ+d82B69fBCQ3k2D3z8NYcrsLh5dvVWd/qDiWk9zWCTkYhOFCZS9?=
 =?us-ascii?Q?PuLKNe6+V5GksTS0Gg/kelVHpbq2HT2/nnkMtkaVOa/hk8yEpaOa4A35/PKs?=
 =?us-ascii?Q?kAEiJlFncdyITpS/WnbH2KNyzHAPf2pSNHGmXfkrf062c2JVZ95EzpBXmgnT?=
 =?us-ascii?Q?cH3oymh/QA3+gI4ontb2JJLPpQuhayc8m/AmgQB+DwWGhT0y0RHz+JT1S5ZL?=
 =?us-ascii?Q?3PRSf/x1wcVwLymx+LGzlxyRpfBLt/rVn8dhRpsOzg0UZUaod9st8kZ9WNY5?=
 =?us-ascii?Q?HeiFVTcAvtbhsdAaYLXWkuenlzc/G54EmoIlGXJsF7aA1kSnucaqjBRGXWvB?=
 =?us-ascii?Q?DeH/UvuhDIBdDjWY3hSUFzKY6ktL2/ElCXa8GpOJi0tOlsg/l34RosGZTnHc?=
 =?us-ascii?Q?I6hj/SNKyr2doM4nGGJJfkc8ogB2NbN1CBn9cuOUJYO+pJZ0fL2cf8dZ9t68?=
 =?us-ascii?Q?9mWPJjAFQ4WlZTObJ+wly1BTxcVvqD0hJrkLTBXjL+wRAuinTT35G3DpInWk?=
 =?us-ascii?Q?bULkThlgP4wR67TQjqWwoeDeMVHHsaGTp5yk3Yc3AbSG5BcAuYgvWTz3hBQV?=
 =?us-ascii?Q?PHrOJbpDAIoVsl9+gJ4v6o++26zpHfQ5yfxAaM5CFf+tF+gxEP51lbT5igO+?=
 =?us-ascii?Q?xC285nUstbGo1WtDrc3dxML8RUhNd61ykQV4kADHE39BdvW7J6sfPN9TOWyI?=
 =?us-ascii?Q?plE59fBN0Q/SZMmsSlV35tIUxVIbkF9a2ZiiKAJbByfKIBFsUfH1WZOnANXO?=
 =?us-ascii?Q?NGs7BURrTfBtXBfKztDZ+HCLoTWewfIn1t2bIKsXTgdfwe9PEozsY1GTe+kA?=
 =?us-ascii?Q?CMdXBmVDXgAByikwroWXv4p9Tleny7eMNd0xgY+n17sKYjAnZxEIsrsT8IPD?=
 =?us-ascii?Q?KVxKmWSEe8eBOTGzIoNZ1qBp3TfIITr9OSHY8/r51eIOfg/lZo5bwe44qBJZ?=
 =?us-ascii?Q?6DsVAE6VzITUP1jXnWfUiRSo/YMotrtS5gWxtz9aNd800l+cU74sEuuN5Acn?=
 =?us-ascii?Q?Ks7SF5VbbTDw4BXWrtGxPa/bMQrB31Dx+RJWdl76jmmN6JzYlcXPdmraZIo8?=
 =?us-ascii?Q?O99VufjH2QIx4MHUjuZo2VrCDMXtEZdTw9R+K72lSxOvIpGO7WuQ4YZ6h1RQ?=
 =?us-ascii?Q?9onXySpXq4OgwHWZAOddFWJmd7AJRyVfIV/17sz5QpmVHHzEBWXOXq4pbmQf?=
 =?us-ascii?Q?eMNjSIebpqO1RCarwHolW+FUx3FGDnROVf4//3Nj/be2+RTVdc7J647mNFLM?=
 =?us-ascii?Q?katIcb/ZNO/aXOEDep2Af2g8gJN7PaAcAxMG9zrPLYyFOmIpxdA3yWgh0THx?=
 =?us-ascii?Q?L6caidlcuFXdf31klVR7GzGBOV1du4krpnYDa5N42S13KrUpBi/cv1EjUARR?=
 =?us-ascii?Q?JUClca9E/272lMTlvLGIS3DBo9Cb/tY1l5tliqHdtqEHsmHO782RWFvL2d50?=
 =?us-ascii?Q?pQ3AdqL9H+9WZtw9mWhnTkL86JFpf7KxiPatlTgO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 360780a2-e446-4f5b-3145-08dd983231c6
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF5540628D6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:39:11.4304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vj9gEdc+2j7Ldcr4TcbKCWFNfR5z61VleDB30Ll/pNUbWhozXq9o3+9pqYdQhJyMeUYBzKU5R0yxTEZ7Sqmi4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6427
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression test case to verify whether the
 CP_TRIMMED_FLAG
 is properly set after performing the following steps: 1. mount the f2fs
 filesystem
 2. create a file, write data to it, then delete [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.75.23 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.23 listed in wl.mailspike.net]
X-Headers-End: 1uHeXl-000230-0Z
Subject: [f2fs-dev] [PATCH] f2fs/012: test for missing 'trimmed' flag issue
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
Cc: jaegeuk@kernel.org, Chunhai Guo <guochunhai@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test case to verify whether the CP_TRIMMED_FLAG is
properly set after performing the following steps:
1. mount the f2fs filesystem
2. create a file, write data to it, then delete the file
3. unmount the filesystem
4. verify that the 'trimmed' flag is set in the checkpoint state

We should apply the commit ("f2fs: fix missing discard for active
segments") to resolve the issue where the 'trimmed' flag is missing.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 tests/f2fs/012     | 39 +++++++++++++++++++++++++++++++++++++++
 tests/f2fs/012.out |  2 ++
 2 files changed, 41 insertions(+)
 create mode 100755 tests/f2fs/012
 create mode 100644 tests/f2fs/012.out

diff --git a/tests/f2fs/012 b/tests/f2fs/012
new file mode 100755
index 000000000000..b3486b730fd4
--- /dev/null
+++ b/tests/f2fs/012
@@ -0,0 +1,39 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Guo Chunhai.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/012
+#
+# This is a regression test case to verify whether the CP_TRIMMED_FLAG is
+# properly set after performing the following steps:
+# 1. mount the f2fs filesystem
+# 2. create a file, write data to it, then delete the file
+# 3. unmount the filesystem
+# 4. verify that the 'trimmed' flag is set in the checkpoint state
+# We should apply the commit ("f2fs: fix missing discard for active
+# segments") to resolve the issue where the 'trimmed' flag is missing.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_fixed_by_kernel_commit 21263d035ff2 \
+	"f2fs: fix missing discard for active segments"
+
+_require_scratch
+_require_xfs_io_command "pwrite"
+_require_command "$DUMP_F2FS_PROG" dump.f2fs
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount >> $seqres.full
+
+foo=$SCRATCH_MNT/foo
+$XFS_IO_PROG -c "pwrite 0 1m" -c "fsync" -f $foo >> $seqres.full
+sync
+
+rm $foo
+_scratch_unmount >> $seqres.full 2>&1
+
+$DUMP_F2FS_PROG $SCRATCH_DEV | grep "checkpoint state" | grep -o trimmed
+
+status=0
+exit
diff --git a/tests/f2fs/012.out b/tests/f2fs/012.out
new file mode 100644
index 000000000000..00a061bb0ae4
--- /dev/null
+++ b/tests/f2fs/012.out
@@ -0,0 +1,2 @@
+QA output created by 012
+trimmed
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
