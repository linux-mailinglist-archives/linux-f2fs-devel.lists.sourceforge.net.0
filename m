Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500F91EC87
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 03:17:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOS8Z-0003JW-8X;
	Tue, 02 Jul 2024 01:16:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bounces+SRS=arXme=OC@healthnoworg.onmicrosoft.com>)
 id 1sOS8X-0003JN-VV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 01:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=; b=OU+N8SShGYK+3WsLKB0SowFnyQ
 pNY81l8TTNP+n7xFBSJKlLYbBrFxjbBTeBN8+9dhDyMftUjGn7Dew9PlHMSHbu+DOYruVNJ8nbxU/
 7NtmiL3nhueatTNToTidz6fBk80Xbz0xpvwouAqGgllEi9cV8Lk8JjSJBVH8S/JWXLJU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=; b=S
 6cN2rGIRbKez8mo6feX3+gwmOEoHUQhF6XrCxHwGZLGvCwMhoqyFKx39MSHj0e7QpoGNI/aN7M8/R
 GgSobh4YoOD5eQyqDEMnTRz0hXsv9Nh13dP0Vib2AVNOddfgWH9QqnhDzJoHlWdoALWcaFJsgfjOt
 igOpUoBaC6qhPAlY=;
Received: from mail-dm6nam10hn2211.outbound.protection.outlook.com
 ([52.100.156.211] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOS8Y-0004J8-GA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 01:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpE1tbhelzFRArkQNw/gyLbmOHfruWkjbfC0NcauBvLjdNdVPQt2OJF20g3kX10G+W9/yuf0hoXb5ttukKZbduGp9zbH2UVmKiyChU0MIPejBP/+eAzCUiGkU/XHqIACIJGH+NGIYc1aOOEx69KNyM+cMkNmMr57mJtj+ctsEsf5M9bBTlc6GO/FJ04Qb+J3wEo5yQANqo+/hHX4DTXo/gkF0bAqwIMtSLR+LWnoKfVUwzE5UcbS6aGuQZGfQDAZesKsaNzAtHPGUCDxlfNVero/fyNcPMepNFGcTZh4S9nNcLcJ+kVZHBhQQmNU0xVsJDuG6WtGPSnL2G76HGKd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=;
 b=YE9QMk2hdSBKZxO43PA8hdLyTyju5TRXGNR65GaChGUh8oGQPoH3v0DxwGENQdh5NTJc2Ody8udjukDj/CyNyODjUX/LONj/K9iuyaUifM5R4uObP3VJwR3IyzIxxbW4tK4gFEMItyDmqGpWvzO81Xdr3SJfz3kqOs5VS1dthmZbgv47QUIaT3BMRu8fpRLo+uMllOLs7VYEpAzzFRVaXTaJ5rqu4vcd5WDIwB0sRfDMP7c0K1/KvL0uHJpyR9JeDpHI7DFfOSCNgui6kWNW3CUlLMlcDBbnIHFzQpKDi+GXhbiJubGDRjgAWH+XfPkLy1xCNQbL9tYsx8sTh1PsrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 208.81.14.32) smtp.rcpttodomain=lists.sourceforge.net
 smtp.mailfrom=gmail.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=healthnow.org; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=healthnow.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=;
 b=N9xP6njREkl238jNJ0aDYPcgH9QvD8lSs21q5sLzvi0I/sUJONiROizFPbAKdOPISWvPSzvuo5cwQp5FU5v35KFVLT9NlYtb7LKVhz/a8fiHG3gJNrb7Rzkt6DUXzaFOCF7s1grSnhNCJZHYPJ7J3muSBYOwVbYwE5WfCQcfGm4=
Received: from CH2PR10CA0018.namprd10.prod.outlook.com (2603:10b6:610:4c::28)
 by PH0PR20MB5797.namprd20.prod.outlook.com (2603:10b6:510:28f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 01:16:42 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:4c:cafe::4) by CH2PR10CA0018.outlook.office365.com
 (2603:10b6:610:4c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33 via Frontend
 Transport; Tue, 2 Jul 2024 01:16:42 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 208.81.14.32)
 smtp.mailfrom=gmail.com;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=healthnow.org;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 208.81.14.32 as permitted sender)
Received: from mail.healthnow.org (208.81.14.32) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.7762.1 via Frontend Transport; Tue, 2 Jul 2024 01:16:42 +0000
Received: from EXMPR02BVWA.healthnow.org (10.130.146.23) by
 EXMPR01BVWA.healthnow.org (10.130.146.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.2507.39; Mon, 1 Jul 2024 21:16:30 -0400
Received: from [178.215.236.233] (10.8.129.249) by mail.healthnow.org
 (10.130.146.23) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Jul 2024 21:16:29 -0400
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 1 Jul 2024 18:16:29 -0700
Message-ID: <20240701181629.DB778FA020EE4691@healthnow.org>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: EXMPR01BVWA.healthnow.org
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: CH3PEPF00000011.namprd21.prod.outlook.com
X-CrossPremisesHeadersFiltered: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|PH0PR20MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a19247-2fa1-4d1a-c643-08dc9a34a1d9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35950700016|376014|82310400026|1800799024|366016|7093399012|3613699012|17110700014|17130700016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1cwMitoTzdSUWMxZDVzL0dBdU50UGtOdUVybEhjNm9HQVRVK2JEaDI5bHVs?=
 =?utf-8?B?L1B6UmlJeXYyUm5rQlgzSm5IcHFJZkp3RVdOd0FnbnowSnpxdHErbm5qZHM0?=
 =?utf-8?B?dkRVTTZHVUQxUDBLK0w3MFFENlIrTzBkNkI5bkF5a1Fla3dWN0xiME4xamVU?=
 =?utf-8?B?MnNnM1NxUENXc1lMQllFU2U5a3BTZWl0ZjIramJkd3hIa1BqU0RvZ3l3aFp1?=
 =?utf-8?B?eXZlUnNySDhFSTdqeTVYL0pjK2RmbmhJVmdGM3JNNFNXYmR4WTRvc0s0VzNz?=
 =?utf-8?B?UUU5VFRxaXc4bm1oYWl2ZVMwSk9iK005UHhTSzl1d1Q1dXhFV3QwU2xtQXFv?=
 =?utf-8?B?eTlzbkhmYzNvOTZVRnNrSXhmZmZpOVhzRm9tUHJ4b0FjZnRGQjVVUWhiM05P?=
 =?utf-8?B?NVFDM25UaEVLRFAvU2ZKTFkvTzAwa0h0RWVzNzNrcXAwUXZPb2dUc2pPZVk3?=
 =?utf-8?B?K2ZKK3VWcjlVdExSenZnbnIrMGhmU3ZpajgwQ0NjSjNWRDJ4ekZCZmkyd3JX?=
 =?utf-8?B?dGVPSXRBTkxaek5scHgrbm5uUSs0WDdiL2w4UHZyQkg5enh5RG80S1NXeDFW?=
 =?utf-8?B?RzZ2VFdzdTJPWkpoaXNnOHYvZE9FWHJDbVdVSEg4aDNKbWxoNXE0dVpTdE9C?=
 =?utf-8?B?YmdHVlJUQ0FPTUJNa3Jzc1JkMXU0d3d0UEFPTnBiNlZTNkl5cFZRSFloSERN?=
 =?utf-8?B?YWJTbkYrM0h4b1FkNU9WRUJMNkViejB4by9ZMTExaUNNY25pZFBSQ1RDVjlU?=
 =?utf-8?B?bzQ1dVlZVmRINDkyUmRDYTAyZjR5RkJZcWZWRUFjbHVOc3hVK0doQUlWTUJH?=
 =?utf-8?B?RU5IQ3VoL2dvejhSWUY1RkZHbFN0MktmT3RhOXl5WC9ZRXR4YjQwSkMyREZW?=
 =?utf-8?B?V3dXUHRMM0NKTHNIQWtOMHhuaW9DajNJNy83Y204SGtlTlNMcGVsck9xQWxv?=
 =?utf-8?B?TTJiYU92ajI4Yk1GL09VYU9zVEdYdHltcVQ2UjBoSFRBL1Z1SWQ2L0F4VUt4?=
 =?utf-8?B?SXZUa2JPN3cydFBGNHZ2a3BibFRKZTlqZDBsM2YzeitzZ25PV3BMc1BRRWJi?=
 =?utf-8?B?V0E5bjFNaEQxTzBIa3lLekMvT1hEdlV0NWw0QnVUWmtoN3Z6Y001Ni93UDJ0?=
 =?utf-8?B?MGVVdDduVGI3SWVsRTBxQVpWM2JseitqZitDdW1UWlRnY3VCelhLNC8xM2xX?=
 =?utf-8?B?RHNVQS9XdWowSVEzVVAxVGc4YnpTbDRTT2pKRGsvM1VHcG02L2xTYm5GTWtz?=
 =?utf-8?B?bUtIaDVoNERXVzIvZ2hnMjJlUER1UVgyWnBlWFpUNUZja2VWcEpTOS9Ba01t?=
 =?utf-8?B?ajlHSzVJQUpDelpQcldmMHB3UTFNOVB5REZ0cW9xbU5reDZQckN4Rmdtcm5i?=
 =?utf-8?B?VXN1TG1LSEZRTmlHSWJLakpzeUgzV3VTbCt0U3lBbE11cXd6amw4eFp6RDhJ?=
 =?utf-8?B?aTk4TnRxQ1ZFblpFdnp2b082eVlHOUlTRDVzV0NBaUg2WDVYandsTCtabE9z?=
 =?utf-8?B?eTZ5ZUE0K0lsQlI2VlZlTTFVbFVNSGo5YWV1Q2hwNXB6WDBwWEEzSmdMNytL?=
 =?utf-8?B?OVFoQ0ROa3FHVTViKzAzVzQxcXh2TU1Ycktydjl0Nll6YklGNUV5REJVcEhH?=
 =?utf-8?B?M21BWVVyUHpySWhMQ2p4NzliMDlkeXFFeUVOREd4Q0dZTG9oMXFDYit1d3Iw?=
 =?utf-8?B?Ny9XRit5aEZQTExxaEVBNk8rZCtBS3NGWEQwODJTRndGTDBtQmVKanpRcFNz?=
 =?utf-8?B?RkdMK0Z3Tll0ZURTZG9Qd2VHMkd5RitlSkpYM1Mwb0R3ZWUrbEpTa2RvMEw1?=
 =?utf-8?B?VFBEMzdNMEFFNks2a0g1UW8vOGRXcHlEOC9XOXNZNlZUbDl5SHJWN2N3TGRj?=
 =?utf-8?B?bUd6S0VpRHY3SUE2SWxIK2piTGlGZDl1a1p4Y3E5c1VJVGpaRzIyUENQWjVC?=
 =?utf-8?B?K0VuSTZaanRSK2RvLzhJSGRBZVFkMnN6alJaY1p3UllHM3ZHeWg0Q0R0Ti94?=
 =?utf-8?B?SjQ2MkRXeFlvM1VkNzBtakRRUkZ4RmR6ZEd4ZE8yam5za3RzdFE0eUVXeVpv?=
 =?utf-8?B?Qk9qVVVyQjd2bFg5Vjh6bDVBTEx4QzErdXNUNm01L29rNG4vUXFjWVhtREQ3?=
 =?utf-8?B?Rko5SUdmcGJQaEI5bTlXS1FMc0RibnBoTXBmNFVnNlMvK2FqdmNpTmdUeCtv?=
 =?utf-8?B?Mk5wVSs0Um9jRU5qMUNJdVBBcHIrWXRQeTdSU0NEQXVQZ2VCd2dNRzliV3ZL?=
 =?utf-8?B?Z0FTdnlrZEsxSGR1UTVTalpzM0dZamdBeWlYa0E4YXVFTFVQS09MY1IrWWZa?=
 =?utf-8?B?TUZXaGdTd211R1hBQmFCbTFXT291Nm9mT1dSbStRS3RHN3A4U0lYa1dHaUtJ?=
 =?utf-8?B?bCtSUTFiU05MUTQ4bEZMb09CV0l6TnQ4MHM1MG5PSzZmT1J2bWxCTm5lbmZq?=
 =?utf-8?B?VytISkE3WEVlZzRaTHJtdFFMdjNZRXhmbDNHczNaWmhnZVBmNGJtcGhMeVdP?=
 =?utf-8?B?NmlRYVhRTHZyL3JoMWFYRE84bG56NUN5WnEvZnNwQjZBSDBNNmc2OFBpekdM?=
 =?utf-8?B?SlFIYjZpQmQrSmpTRWNLMzRRa1k3VUJuZ2U0cDdCSGRYOHVjQzl3RkpIZTZO?=
 =?utf-8?B?ZEJyc3dXaHE1enorQjJ6QkovUmRkTm03UEN5MzNtTDhTSk9qMjhZTzFtSEh6?=
 =?utf-8?B?bUp5dHNNUmtBL2xDK2hWS2ZLaHhQYXhQbVE9PQ==?=
X-Forefront-Antispam-Report: CIP:208.81.14.32; CTRY:US; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:mail.healthnow.org; PTR:InfoDomainNonexistent; CAT:OSPM;
 SFS:(13230040)(35950700016)(376014)(82310400026)(1800799024)(366016)(7093399012)(3613699012)(17110700014)(17130700016);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: healthnow.org
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 01:16:42.3367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a19247-2fa1-4d1a-c643-08dc9a34a1d9
X-MS-Exchange-CrossTenant-Id: 480ee22c-5ff4-416d-bfa6-99e16833d21c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=480ee22c-5ff4-416d-bfa6-99e16833d21c; Ip=[208.81.14.32];
 Helo=[mail.healthnow.org]
X-MS-Exchange-CrossTenant-AuthSource: EXMPR02BVWA.healthnow.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB5797
X-Spam-Score: 7.9 (+++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear Beneficiary, We are writing to inform you that we have
 been authorized by the European Investment Bank of London and the
 International
 Monetary Fund (IMF) to investigate the cause of the delay in your legally
 appr [...] 
 Content analysis details:   (7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: healthnow.org]
 0.0 DEAR_BENEFICIARY       BODY: Dear Beneficiary:
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.100.156.211 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.100.156.211 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.100.156.211 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [52.100.156.211 listed in list.dnswl.org]
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 3.5 ADVANCE_FEE_3_NEW      Appears to be advance fee fraud (Nigerian 419)
X-Headers-End: 1sOS8Y-0004J8-GA
Subject: [f2fs-dev] We have reached an agreement with the European
 Investment Payment
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
From: Holley Lisanne via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: unitednation.kerrymorgan@yandex.com
Cc: Holley Lisanne <holley.lisanne@healthnow.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RGVhciBCZW5lZmljaWFyeSwgCgpXZSBhcmUgd3JpdGluZyB0byBpbmZvcm0geW91IHRoYXQgd2Ug
aGF2ZSBiZWVuIGF1dGhvcml6ZWQgYnkgdGhlIApFdXJvcGVhbiBJbnZlc3RtZW50IEJhbmsgb2Yg
TG9uZG9uIGFuZCB0aGUgSW50ZXJuYXRpb25hbCBNb25ldGFyeSAKRnVuZCAoSU1GKSB0byBpbnZl
c3RpZ2F0ZSB0aGUgY2F1c2Ugb2YgdGhlIGRlbGF5IGluIHlvdXIgbGVnYWxseSAKYXBwcm92ZWQg
ZnVuZHMuIE91ciBpbnZlc3RpZ2F0aW9uIGhhcyByZXZlYWxlZCB0aGF0IHlvdXIgcGF5bWVudCAK
d2FzIGRlbGF5ZWQgYnkgY29ycnVwdCBiYW5rIGVtcGxveWVlcyB3aG8gYXR0ZW1wdGVkIHRvIGRp
dmVydCAKeW91ciBmdW5kcyBpbnRvIHRoZWlyIHBlcnNvbmFsIGFjY291bnRzLgoKIFRvIHByZXZl
bnQgdGhpcyBraW5kIG9mIGZyYXVkdWxlbnQgYWN0aXZpdHksIHdlIGhhdmUgcmVhY2hlZCBhbiAK
YWdyZWVtZW50IHdpdGggdGhlIEV1cm9wZWFuIEludmVzdG1lbnQgQmFuayBhbmQgdGhlIElNRiB0
byBtYW5hZ2UgCmFuZCBtb25pdG9yIHlvdXIgcGF5bWVudC4gQXMgYSByZXN1bHQsIHdlIGhhdmUg
cmVjZWl2ZWQgYW4gCmlycmV2b2NhYmxlIHBheW1lbnQgZ3VhcmFudGVlIGZvciB5b3VyIE1GSSBw
YXltZW50LiBXZSBhcmUgCnBsZWFzZWQgdG8gaW5mb3JtIHlvdSB0aGF0IHRoZSBFdXJvcGVhbiBJ
bnZlc3RtZW50IEJhbmsgaGFzIApkZWNpZGVkIHRvIHJlaW1idXJzZSB5b3UgdGhlIHN1bSBvZiDi
gqwzLDUwMCwwMDAuMDAgYW5kIHRyYW5zZmVyIGl0IApkaXJlY3RseSB0byB5b3VyIGJhbmsgYWNj
b3VudCB2aWEgYmFuayB0cmFuc2Zlci4gVG8gZW5zdXJlIGEgCnNtb290aCBhbmQgaGFzc2xlLWZy
ZWUgcGF5bWVudCBwcm9jZXNzLCBwbGVhc2UgY29udGFjdCB0aGUgcmlnaHQgCmFnZW50LCBNci4g
S2VycnkgTW9yZ2FuLCBhdCB0aGUgZW1haWwgYWRkcmVzcyBiZWxvdzogCgpFbWFpbDogdW5pdGVk
bmF0aW9uLmtlcnJ5bW9yZ2FuQHlhbmRleC5jb20gCgpBZGRpdGlvbmFsbHksIHBsZWFzZSBmZWVs
IGZyZWUgdG8gcHJvdmlkZSB1cyB3aXRoIHlvdXIgV2hhdHNBcHAgCm51bWJlciBmb3IgZWFzeSBj
b21tdW5pY2F0aW9uLiBUaGFuayB5b3UgZm9yIHlvdXIgYXR0ZW50aW9uIHRvIAp0aGlzIG1hdHRl
ci4KClNpbmNlcmVseSwgCgpNcnMuIEhvbGxleSBMaXNhbm5lIApSZXBseTogdW5pdGVkbmF0aW9u
LmtlcnJ5bW9yZ2FuQHlhbmRleC5jb20KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
