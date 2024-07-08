Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54308929C08
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Jul 2024 08:18:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sQhhj-0003of-98;
	Mon, 08 Jul 2024 06:18:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sQhhd-0003oV-P0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 06:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J/XeK86Izj9igCvFjG0wSDzUtpfkPjftsQ5AU4i3Gbw=; b=luJ2WXM0oAHqICP6s7ag02xScf
 tNZ4z0hnfWmPm8TRci2lob5Qgd9FRRKcIx64WsIXULRHfwGWYZ+1r2+PeW0fsV+vpC47i514nAcw0
 ivs5EX5i0IIHZ+1G4kJBEtPdFU6R7OuygwnXnsDucqqRWESxMbaiG+1fONIjNJzFKi0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J/XeK86Izj9igCvFjG0wSDzUtpfkPjftsQ5AU4i3Gbw=; b=bAatEmtp+VIzFF7Eq45q93XUBq
 U7Unfe9JbEkA6h1qGkC+KxZPCdVaV/jywKfGHy3yI5lLbnAv8PmAyAcvxTj33byJyEFLB/BDbGQUg
 WhG6M1BrRkN3pGx5Ho16hiTrsMQYehrlt8jthXOuZq3ZfW8EgHiRqTMbZnwzcrb48zxk=;
Received: from mail-sgaapc01on2067.outbound.protection.outlook.com
 ([40.107.215.67] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sQhhe-0000ZZ-PF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Jul 2024 06:18:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1sjlgkwAuFlHaz7Mnfy/5R1fL8IxTUMOmrScefOOErJKDQfS9DSKvb68i1kIdRy65mQgyb66s3CqJg5Qe+jxYhRck1lZAP2ksdZn21lqrWiBAOJraLvlYuE8x6dP1LlkXM0noqcEWZmXn3K0cuX9DRwzQcdoCA/WRBlQSWWk5B+Zyc6KlQDbxHNllfDgn5ptLvhWosPrf9+ZcmAOk+NR0+CELw8/8DsghbZcRvsGSGXhkD+hxuYIMlNRtTVmmdAGXIJ9JG/K+fK//pT4pn4Rw58leBh7tLu6eQ+yyvxR0Y4Nejqi0xb5pJeTpfjpFAx2/iY3hCKqmGQ8UmdQjNzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/XeK86Izj9igCvFjG0wSDzUtpfkPjftsQ5AU4i3Gbw=;
 b=C27cmN5OK7AsUpEBN8pxT4A2r8GUjpdhg6Sa44yDbGvKW9nW9p56scAW8Q/V9Y397uiSANWQ8u++IeIJ804HwLNlFNFxXauYDQCBVNuGSS6l8YoVWOUTaugRIyjytzgDZnL27gnzJVEA1Crd1Y1l8YmBRPXwuT8kot5TUFPrSkruy2PnJVljpSpkMAaYxKGYN/tcEM5fY87bfRcdEjDjh59cJKD0TjAuqMrFrjFvkSbVDiVEJRjhyYHGDypqpTph8hMXFIpc7861q9CqoXfkhEez2Z+3WexAlAnhez41zhsyhlS3uxNiwehlMGvwuDurV0wao9CVRJ8vNtAiWcHwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/XeK86Izj9igCvFjG0wSDzUtpfkPjftsQ5AU4i3Gbw=;
 b=eEmhbN8Zd7MapV8t+SoPADP0M5MSGmtKuyKHxHn/hRrIytj1lbRSOFnFKNIHJCRvu5jrzKCvabfq5S+OJ8Tq1acsMMcYbVRWlibIBccS6GS21AXlEo6S1QEHnYHhB2cIGPT2xRpEqm3ojd+IoDtT3ytDOeDiU9O/psRg23Q7C04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6599.apcprd02.prod.outlook.com (2603:1096:405:13::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 06:18:07 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 06:18:06 +0000
Message-ID: <e63dc4e0-5a73-4672-a4a4-230448af6473@oppo.com>
Date: Mon, 8 Jul 2024 14:18:02 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20240706091634.1970874-1-shengyong@oppo.com>
 <5919b47f-616a-441d-bfe8-9c03739b61d7@kernel.org>
Content-Language: en-US
In-Reply-To: <5919b47f-616a-441d-bfe8-9c03739b61d7@kernel.org>
X-ClientProxiedBy: SG2PR01CA0124.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::28) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: d3983a4c-e455-42b6-443f-08dc9f15bb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHNSTi9KSnVNd0VqazdaNmpFakpwZWdtQ1dqN29vdHZ5ZTBYdWtGY0g2QzVt?=
 =?utf-8?B?TlQvOCtQSnVIbHNkVjk3WDBGcmN3bEw1UUVVWkZpZCtMeEJ3cytYVFJOSVRO?=
 =?utf-8?B?ejgzd3J1WVNlSHFXcm9lY01TcDBqMUJjZ2ZvWE5yaG5yeEJxcEJGMG9nMlE4?=
 =?utf-8?B?R05PL2s4a1dsazdVeXNMOEdlYmtLenpLTkt1eG14Y2x2aEo2Y2NmWlNtQ0tq?=
 =?utf-8?B?QTFqdlZialZFMmFrRXFDcmoyWkRVcnN3TUg0N29MdzhqMUZwaFBwTHA4TEV4?=
 =?utf-8?B?MWpTdFNKV1NCTkxhaE5BSmFKQ0I0Vzdtck1GMGhPeExTU1l4NlpaUHV6SW80?=
 =?utf-8?B?Z2RHNEpLZkpCUWd1ZVRxZmUzYzZDcGNxS2QrcnR2Y3lEWTVpaEdBN3lKSld5?=
 =?utf-8?B?aitTc2VUdXVUQzRLYWRCRXNNdEZPRENZZE5FT05BS1U5TXpvV0hiSXFOQVcy?=
 =?utf-8?B?bFROdUJOWUpLYXNyOVh3ZjM3WVAyV29XNTZFZE9ac2tMZlQ0d1ZSRmlnQkNR?=
 =?utf-8?B?OTc5alJoSmgwQUo0UVhKN1N2YzRVNnY4NlNhYmJpUUlwWTJBZkFzbXBKMU1T?=
 =?utf-8?B?RE13YWZpd2pjVy9ISVVjY2hld0ZUb3RaMEZEUE9hSG4xYk5aK0laV2xnTEVD?=
 =?utf-8?B?RWpQdmpyYVUzcUxnOWhOOUc5Mmk2eEVZRGlNOXBaOGZIVVB1a1FCREZhT016?=
 =?utf-8?B?RHFyTEhKbXpSYlNjTVRzTjJaSzk3SUM5ZkhTQmxOT1pXeXVzN2pVT2NFRkV5?=
 =?utf-8?B?UFhjOGlZSVNmVDc4ay9ZZnREQnovMnF4TXBXT253RWN2cFJjVXlwalZrWjRN?=
 =?utf-8?B?T3FibWQ1VmozMFR4NmZ4bHJxUVFNa3RWZ3dJZUM1N2MvWnF4K0FwMFR2UXEy?=
 =?utf-8?B?RUtlRWxmbDVkYXptT09DakM3ak9vY1ZjOGpLaDNQRlNTV1JPUzZFK0d0UWc4?=
 =?utf-8?B?cjBZN1Z1dWduOXdVN1VwYjdJQzZSK3dOa1lUeTBoRTUzVTRNQTRzM0xTTm40?=
 =?utf-8?B?ZVFpM05BMU1WWWJXRFBBekx6c1B5dDFSa3VPcWZxZGgwdDdPRmdqeUFLRkRD?=
 =?utf-8?B?S1JXY1NSVFZiQ1pTb094bXhWSXFoaExIbHUwS0pTZFNwR25BTWJtU2VKSWR6?=
 =?utf-8?B?cEJ5VDJzTThiQWNSSEY2cWwxY05JNjRNZnpucVc5aER4VnlaNXpWaHNUekF1?=
 =?utf-8?B?SFdGd1dWTWtNZzVPbkd5SFhlR0FwTzV2OVJUNVhkRG81ZGdDUDBveVBUQlIy?=
 =?utf-8?B?cmF1TFRVeWVRMlhEc0xJeXNQenRoTUJQVlRPQ2EyeFE4VlBFYzQ3YmZHM2NM?=
 =?utf-8?B?cU1wYnVkMG52cHBSeS91SytIRlFxdkxZSTM4YWRuWlJiZGdqR0NPZG01eEE0?=
 =?utf-8?B?cGYzMDNSdnljWmdTK3RIckg1Smo5VGxZRGlUdUw3N1YxWjdCN0l1WnVaL0E4?=
 =?utf-8?B?WUZsVjJQN2tMbjQ1bHFXYTZZVG1rbkRRVXhEVG5oV3Y2LzdEalgycHc3Z2RD?=
 =?utf-8?B?NXJEUEhlV3daWWpPOTd2Y0FialBBa1g2NXlJY2tEQ0F6UCtTTHpUaTV4Q1or?=
 =?utf-8?B?SzlvUXJlN2t2RjNyekdHYUVZQ0hTVFFrQ1RSWG40YmlzQU4wQ2l1dDdZaTBP?=
 =?utf-8?B?OSt0SXZ3MzZ3ZDNpUVFVN1ZYQzZrZGZaS1RkOWRPYXBvVHF1K1B2TUFvVjN6?=
 =?utf-8?B?ZnhSME1jWE5uay9FRWR6SW5lUDRqM3BLOG9ncDlURFgrSjAxS3h6QUlXeU9L?=
 =?utf-8?B?dTNqemNVUmpqV0FYeDNiQXltWThhdUt3QjVwdkJ2eTg1MGtIbUVOMlpCTmRM?=
 =?utf-8?B?S2VJRm02SFljczZvNjVsQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTA1THlOQU9hU1RTMTBXRFhWQ2hCRGZGakxQZldYdVlvUURCR1F4c1I2MWRX?=
 =?utf-8?B?OVBsbk9YN3VvZW5ZUHZnSC9BNE9jWTVwTGxqUFMraG5zenlKNmRoUDcyOU9E?=
 =?utf-8?B?cHQ0WFJoQzY2ZDRMYlVBU1FFYlNLM3N4RjZGMzI3bkpkRVJaemM3QkpHbDNH?=
 =?utf-8?B?MDVJYUpGS0JGaXpBMDg1cXRuZ0FVKzZteG9aZWZlbUx6blZsVjFIVVdNb1pJ?=
 =?utf-8?B?U21UN0ZaM3k3dEZqMHh0S2ljL1ZRd2lPWkdrNndqSzd2d2tSWmt6NkZwWWQ1?=
 =?utf-8?B?Wk5qdXhzSDNGdkpOdFU2YWVUQUo4QktoRHFrdzM3ck9Ra0xsR1k2VDNZeWJX?=
 =?utf-8?B?ZWFKTHo5RHVMYXhPZDhUUENoMmtPV3BJUVh5eElGWGYzWWt1V2dFUUZtQVJY?=
 =?utf-8?B?aThINHhvK0hiZWxRc1VkSHdkUFlTSWN3QVFnaGhHMzBxSVlIQU9sZ2U0cGVX?=
 =?utf-8?B?SkpDc0NjYUxFSWRYRUFManBkU3NsMlBKaVdFRk1Pa1FVNWRRaWNaN0U3aGh3?=
 =?utf-8?B?K0lVY2F6a0IxQTJ2blV2ZSs1b1ZNWDRVNnJRN0NLZlRBb1hLRGM4NzIzWDdF?=
 =?utf-8?B?TU5WeE5naWhhVWJ6N0MwckNON3BCT01oY2RobUVvQWo1SDZuenpHbkcyNjZL?=
 =?utf-8?B?WWgwM2I5QVdDMld4SC8wT1IrYWMwbTgxR2VRMU5WczdpS2Z5TXhWTE5lcFlr?=
 =?utf-8?B?UTBzZTl5aHdMeDQzQThlNlJ5cXJ3SXprQWRVSCs3VTEySTNrOWRWOHJxZ3Jx?=
 =?utf-8?B?Nk9hZVB2dzNYZDRsZWRwMk15WG5OVXJpZlVkYnNGeEs0eTZnTnJBb2hHM0k1?=
 =?utf-8?B?Yk9kdmRHS2t1c01IeUZFTUVkaW1tcFF5ZVdaT0dldjg2dk5NdSsrWXJBL2dm?=
 =?utf-8?B?VkRWeTZmZ0N6dlhibGJDT1JuMkxCR0U3Z3Z3ODlJVUg5cEcrUnBxU0czY1Fs?=
 =?utf-8?B?R01aVWN1UkdxdmJXZG1DVzRpNit2Z3Nhcm5JZ3hNZWw3SVpjZmIwZ0tYVjJr?=
 =?utf-8?B?a09mN2FWeW43bmU1OXR5Z2o3bzM4UkdlQ05zZ1krTUxrbTdOYXdCS3d1RkVp?=
 =?utf-8?B?WGt5Qmx5a0NJSEVVVWhaZGJLVjVrcjB0ZysvNCtPbnJJMUNENzBYRE9xUUND?=
 =?utf-8?B?REpWWXNqTDhDQzZpYjVKbHdEMTNyZFFGNzJSaThlVTBvOUpzc05XOWJuYUlK?=
 =?utf-8?B?UnkyOENQRzE4Y0wrcHMzd0hrMFE0SFFGcXI1aXJQRW1tR2UzM01GbVZPN3lB?=
 =?utf-8?B?UzBuN1dwUitDM3dLK3hyRHUybklUcWFzdlZrN0RuQ1dlblBuMGQwZElEeW95?=
 =?utf-8?B?NXRpUUgzcmRhdERwdUc1dkR5OXpERU9Rem84aFVhamVHY3hLNWVldHgrWGpr?=
 =?utf-8?B?Y0c0U1E0ZFl6MktoUFJCQ3VQeUxlellEOUxoWE1WYjlvSDFFYk9YNjVSS0ZX?=
 =?utf-8?B?YU92T09waGRiSVpnbXJyZDR6aFcrQXNRZ3R0T2F6M0JMckdLRDNadFVRZVJ1?=
 =?utf-8?B?QUtQSEtDTW1QOXltZzZiMjdQR2MvejJTd2pNSWxjRk5wR3dDK3h4dXloWHp1?=
 =?utf-8?B?QzhBdnMzM3ZPZ0llU3NPbFVjVnc5TDNlZ0E2anY0NUZlMUVBTFB1NmU0T05Q?=
 =?utf-8?B?bG9IcXVqRVpZYWtlUnIyeVJTRklzZlUxQWk3Ui9ZbUVTUDk5bXZWU1g0UXlB?=
 =?utf-8?B?eXJqdXFwN3NGcUZaYjRQajFDYkFNZUVmcmRRQVJkU1oweUpOSExJbFZTMzZW?=
 =?utf-8?B?WEw2NFhWRmU1YzV4MHFNbmw1RFVNNXRHSGhYTkpDSUVwOGlnNFdWWGh6US9q?=
 =?utf-8?B?eHQ0NkV6RERzeGJsa2ttY3dkYlFXQ0JkZkRwMkIvbERRQVhBNURPUTh5am5T?=
 =?utf-8?B?UmtmYnE2WWZrbmxySXdUVU4zRE92UHBpdHpwNjZ1dVhhQVc2MGlQNkt2b2xC?=
 =?utf-8?B?RnlYQ2dxSzdCVEVOUTFaMDNBdE94cnJHM3pGa0dPcDd2S3RnWGlBd0tlK2NW?=
 =?utf-8?B?OTl1K2dFMG5ZQ28vMUZsZFhGYWQyTW5ET25rb0NqS1NhY3dGeEFldHc4aE91?=
 =?utf-8?B?NlZjcW9odVVEYTNSQmZGR2NkeFNsU3ltZ2xrazNQVUNkeGJoZlhmTnZsZU14?=
 =?utf-8?Q?8WBVu88nk+yB1CDZdzPME659N?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3983a4c-e455-42b6-443f-08dc9f15bb30
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 06:18:06.5340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37f6vnJA8xvt2zxv/2C1zUae93tCL3/Y54au9yoFFTS3svYriQmKRt+q1yMwhisPvpHaYOqgSGBQMO7tgPBusw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6599
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/8 14:09, Chao Yu wrote: > On 2024/7/6 17:16, Sheng
 Yong wrote: >> get_ckpt_valid_blocks() checks valid ckpt blocks in current
 section. >> It counts all vblocks from the first to the last seg [...] 
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
 for more information. [40.107.215.67 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.67 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.67 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sQhhe-0000ZZ-PF
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix start segno of large section
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDI0LzcvOCAxNDowOSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDI0LzcvNiAxNzoxNiwg
U2hlbmcgWW9uZyB3cm90ZToKPj4gZ2V0X2NrcHRfdmFsaWRfYmxvY2tzKCkgY2hlY2tzIHZhbGlk
IGNrcHQgYmxvY2tzIGluIGN1cnJlbnQgc2VjdGlvbi4KPj4gSXQgY291bnRzIGFsbCB2YmxvY2tz
IGZyb20gdGhlIGZpcnN0IHRvIHRoZSBsYXN0IHNlZ21lbnQgaW4gdGhlCj4+IGxhcmdlIHNlY3Rp
b24uIEhvd2V2ZXIsIFNUQVJUX1NFR05PKCkgaXMgdXNlZCB0byBnZXQgdGhlIGZpcnN0IHNlZ25v
Cj4+IGluIGFuIFNJVCBibG9jay4gVGhpcyBwYXRjaCBmaXhlcyB0aGF0IHRvIGdldCB0aGUgY29y
cmVjdCBzdGFydCBzZWduby4KPj4KPj4gRml4ZXM6IDYxNDYxZmM5MjFiNyAoImYyZnM6IGZpeCB0
byBhdm9pZCB0b3VjaGluZyBjaGVja3BvaW50ZWQgZGF0YSBpbiBnZXRfdmljdGltKCkiKQo+PiBT
aWduZWQtb2ZmLWJ5OiBTaGVuZyBZb25nIDxzaGVuZ3lvbmdAb3Bwby5jb20+Cj4+IC0tLQo+PiDC
oCBmcy9mMmZzL3NlZ21lbnQuaCB8IDMgKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVu
dC5oIGIvZnMvZjJmcy9zZWdtZW50LmgKPj4gaW5kZXggZTFjMGY0MThhYTExLi42ZWQ1YmM4MTFk
MmMgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5oCj4+ICsrKyBiL2ZzL2YyZnMvc2Vn
bWVudC5oCj4+IEBAIC0zNDcsNyArMzQ3LDggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQg
Z2V0X2NrcHRfdmFsaWRfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2Vnbm8sIGJvb2wgdXNl
X3NlY3Rpb24pCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBpZiAodXNlX3NlY3Rpb24gJiYgX19pc19s
YXJnZV9zZWN0aW9uKHNiaSkpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzdGFy
dF9zZWdubyA9IFNUQVJUX1NFR05PKHNlZ25vKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHVuc2lnbmVk
IGludCBzdGFydF9zZWdubyA9IHNlZ25vIC8gU0VHU19QRVJfU0VDKHNiaSkgKgo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFR1NfUEVS
X1NFQyhzYmkpOwo+IAo+IEhvdyBhYm91dCB1c2luZyBtYWNybz8KPiAKPiAgwqDCoMKgwqB1bnNp
Z25lZCBpbnQgc2Vjbm8gPSBHRVRfU0VDX0ZST01fU0VHKHNiaSwgc2Vnbm8pOwo+ICDCoMKgwqDC
oHVuc2lnbmVkIGludCBzdGFydF9zZW5vID0gR0VUX1NFR19GUk9NX1NFQyhzYmksIHNlY25vKTsK
Ckkgd2lsbCB1cGRhdGUgaXQgaW4gbmV4dCB2ZXJzaW9uLgoKdGhhbmtzLApzaGVuZ3lvbmcKPiAK
PiBUaGFua3MsCj4gCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgYmxvY2tzID0g
MDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGludCBpOwoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
