Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M3aHHiDxPGr8uggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 11:13:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 672776C41D9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 11:13:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="lTPL5gM/";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="h/bjWYwj";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=BOZ8BZPm;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=NWFq6x1p;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqqZFSaaS8PWK/LqwSDbJfBhNJHJXa0CTXgmlkQXn+Q=; b=lTPL5gM/0BEeezu20QCsI55XY6
	PDO1BwvPS0BUwmo6aIMHQ5eZlq5e2gITZktMGzcTqF0Zd3XU8aPSoZiDV5ZZCt5p90K42SZHtuirR
	9B1FjKMnubBUBZF78Y3zUKehSHYuw6o3Cbq5PRq75vve3qhOVF+XytZY+pUVcp0jf2hI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcg8l-0005Kk-KN;
	Thu, 25 Jun 2026 09:12:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1wcg8k-0005Kb-Aj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 09:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5aF5yHXmoEUmewJxeJGmuGqrgJtEnIQklTIC6NaDrMg=; b=h/bjWYwjs/I8GgCKJ42+ANaPUN
 G8kwbKDtaUumSwOZiPcOKdIVJCRzNPZH6mUsLhxRlll0Cb4Hd9IsqDcSnAd+RL0pTznFfiJtBMWed
 QwQ/bM31f4bsGsiQAAFOvZhcUrUmKwsCJQBkgrtIcXfibGsa2sRgwK5r9kn//7bhtDNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5aF5yHXmoEUmewJxeJGmuGqrgJtEnIQklTIC6NaDrMg=; b=BOZ8BZPmJKMKF9UWWLXRXUEBtT
 G8G5uU/f3CU9mZfqyTc9LNw1PGPYtQCvNH/ydRljfx0Wg++mRj+9WXbAGS8UqmftHwIk2jceGFWjq
 9/SVGAyEEPT4D0YIVV4Q8dfGFreV0OONhMPfz8xxAa9cMUa1IQ7Annqzu8nBnXrGoPWo=;
Received: from mail-japaneastazolkn19013086.outbound.protection.outlook.com
 ([52.103.43.86] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcg8e-0005DW-Ln for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 09:12:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM8CVmYkG7TKthfU8s8/HDKzwOcE+ZNYQF3Lgd56HiiVHZH7tbwaMcdzOZubQVOiorF5yt3uqKsmYRzuPRRJdIrNpH7NLYjcvg3maP9l6BdIeDI3zgMY/nR7KjpF5o8Fa1+1ln2fd985nNteNr+WXnHbNGqLc4t617uGNvs3ysa027qWkXKzeLYZN1TkhVjKafvn6rhJJ4Dzl1Ym1acC6rYRiXcxocy4kExPxhTJtvUtaOe9XtSoZr4CWsJVtFx1t8LlMHpKMUp4j4cE3+5ln1pK/TrI07bUrLWg8fNI4TOhea/rMlXGzA1JLfEzuPlvNACgAxW/V4B83GO//GOxFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aF5yHXmoEUmewJxeJGmuGqrgJtEnIQklTIC6NaDrMg=;
 b=sIXvYHXCuyPKP/2mtBV7X87IRg0j5tCkrbIEdne0k6T+N/di6audvf/BmUa3QpUrBpDNeCkdCmy3fUArxpJW7/mJjprOsYJrS0eAHkdutob8t9G+LLPevhT1ROGxBfHyNj6ZMONqu99J4i6jBT57DjRK8zpa0wQknhZIZbix75B00fvUkozFo87LIUn6MIFxl5Bb10d06meaaVfTeSNlSos08H2weg5hkezCaG6mOLq+YFpKJheSEP27/BigfJJPLWL5rCUcpQB8X1ZY7cPQYWdFN42sv5tnrq271PgDk8SH8IBvI3aAf1o1D0BSVrpOlExzgeuEBboo8zGXP4PkDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5aF5yHXmoEUmewJxeJGmuGqrgJtEnIQklTIC6NaDrMg=;
 b=NWFq6x1pNDIXG5MMXSU3uDVnJPDjo2RYQxB4Js7MWYgdYbqCQW9512kze2nZDbgKG/5Xb4W8rt8H7sRRk/hAfK4rVFIX46PcmDQrk+lGs4bJAWlrKRjDvQ9RQ8Jy/DMXDgSAJbKPraIhDKrhhdWz54vCjYiej39JPPqpv9eUqmEOx5fev2BakHRZ4GuI0X5uC1SnIsx3NDneNsz+KRVFBP06plVpIYQjrxurIc96B/q4nL5pEDA3IFgteXxVGESYHWQJbNVr9RXeT0ta+COwJaJpPF1M5z1vDZUuUamXynPuPHJACbMdgJbXi8RaUGBDY+Y+Dd53x5JGuEVsvKqdSw==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by SE3PR02MB9465.apcprd02.prod.outlook.com (2603:1096:101:336::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Thu, 25 Jun
 2026 09:12:39 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0159.012; Thu, 25 Jun 2026
 09:12:39 +0000
Message-ID: <SEZPR02MB56620B1FECD774B0918A755D99EC2@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Thu, 25 Jun 2026 17:12:35 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-3-yangyongpeng.storage@gmail.com>
 <7ffe0789-1024-4dc7-9089-2dcf856a1bd1@kernel.org>
 <SEZPR02MB5662A85B218D3EF7B2FA8C6599E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <e876caa4-37bb-409c-98e5-2d051178d6db@kernel.org>
 <SEZPR02MB5662F1A9AFD88BEA4624BC9699E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <d74fd6f1-9c92-4810-9549-e8066ec9d807@kernel.org>
 <SEZPR02MB5662929A720F09F0ABFD3DD499EE2@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <cfcc27d8-8071-412b-abf9-0c804305a195@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <cfcc27d8-8071-412b-abf9-0c804305a195@kernel.org>
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <9f1b38c7-ce51-461d-b020-f1f63e958bd8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|SE3PR02MB9465:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b3d1e8-b4da-4244-9532-08ded299e7b1
X-MS-Exchange-SLBlob-MailProps: laRBL560oLSPhlJ95/U7v6W/AahuugGaBOYlhJxz6e+l5hPQY79uKuk9Uh5kTGhznUT2FQ1mM8JCoKyQKk/p9lHJgpEvnjteuR/yFKcPXHIWznje30UBqOgvLhQ9Yb/peUscGrk8P9I+nGgk+bilqG+u3fNUjN/cU0UPfmj9hlLa0ZoE006xXaB2VOn1pZZAqf9gWGjgCdaLYKSA1Xl10NoUumnrVQLiD144q9W89qtCLwD+Kd3a6te4sSExPMM1kJa0ST+6yidElOCv5LeGLkEfmik5bUWQ5m5/JTtFD7mTbxRhLsXJbZqUJydwFVtX9OZ6AMDe3c53BQeubwg4FFMQUTduiREGipnaAfaTwFXYde9VABuVcG2yuXtOhBfLEBf0/LG9OKMXFRFE+l8bCvC8Mfd2JX9Bo1NIrin5Ac0MR2Glyfh7rbtTJWhTz/PWZxC7WG/ed57c4mWD0WaUEUQTXk8UDqwecG/66Knot5KIePKmxBLWRUOanO9moGNKVHJY7Re3qKSmpKBrpSrSMWYo/WMwXj0lnYKeUQrH5CjpyDFgRnirv0nbuqd6jBmyrgkC95vxE5gUY/n3D5+NhXNDei8HJY+U4SD/JCpFDm4VSvAm76Jk8UF3vwDypUoICn5PR4b3EUqcMKQTDq61G1/ZDVquyIW3ZuoC9OohfIQQAxY0iNNSz6GhQAwvcv8G7+75GNrfHzk9GlWmJSZpxR+rnIag6CWYPLBQ4iocHn1iwkfAkxkbvWYnSeWL834yQA3u0P5736bQQYBpwCBub/Jdkva1zN8U
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|45011099003|15080799012|23021999003|22091999003|24121999003|6090799003|7042599007|19110799012|51005399006|8060799015|5072599009|25010399006|40105399003|10035399007|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFhEYWhRMjdmaXFMVWNIalV2WTcycC9PRkFvaVRvckRtRUJqUlVZN2Q5ZUIv?=
 =?utf-8?B?dC9EZVVKSlJFQTNMNFVaYTJIWXViRG85QUZ5VU9Cd2xCZlovUEhjQTdGT2to?=
 =?utf-8?B?cnRwNmZRUUdxZTNiY1U0SDVML1FNWjdUdnZaZHhOeElNVVpTeW1ZNml4QlN1?=
 =?utf-8?B?d2FYWVpvZXQzbFZvL0NnRkROMnh6YVF6aUZLV1RMemVEcVV2VjVTaUFiNU5u?=
 =?utf-8?B?OE0wL1dKUVRZSTRJUE1xZ2FZMU8reEgxSmRrblpZQlBoaG1iWmlzK2ozczBG?=
 =?utf-8?B?SisxSXYzdzF0VmNGc3BGR0o0Y3k4cmZ6YW1wakl5RmFBb2ZPeVJDT1lOeFF6?=
 =?utf-8?B?U2piVENkVzYzUkgvUi9xRGpwTTVOTVRLUkZ2cGhMRUJneGtTZzRzMVFEV2dx?=
 =?utf-8?B?b2NObWI4OVRUb3VaTVZvT1VBeHBUOVBzYjlZSk1YKzhGSjg5ZTYweEVNamhn?=
 =?utf-8?B?NHEwZU14QXBta3NJbExYVVBCd1hPWExQd2Rycmw0eDE0K0tzMS9aSWgza0FO?=
 =?utf-8?B?TmtlbDZIUE5KUlplYUZ6OHAzNkQ1cldXRzd6dWl1WXdGLzVqdVVHa2VFMXhw?=
 =?utf-8?B?Rk1XQ0tTUk1CYzVSZTdhSFFBT1BXUVk5aU9yMHhWaDVuSzFzcUhoMTVIQVJr?=
 =?utf-8?B?QjBMbkV1UHdIREVMcG1GTjgydk1hS3pMK2NQYVdURGI4UUovY3c0TWVtR20r?=
 =?utf-8?B?RjI4eWUxMFF1RTlad2N3cnpRVGZndjNWU0ZXQjl4QjFqVTdwcStGRzFTNjNX?=
 =?utf-8?B?WGM1SWdTdUh0VEFSWXMrK1VEMmIzRHhjMjViS0J0NktnT1V5N0dSY1JiVVNP?=
 =?utf-8?B?K2RIZUN1R0dPYTVUT0h6ZlpqSW9DblI2THRrSTBjWnBLeVdQTXlqNlIxWjJE?=
 =?utf-8?B?b0pqejlnZzRwZ1NmNTFmZk1LMEJOcnNscURmOWhUZm1kK0IvMjlTK1ZSY1kx?=
 =?utf-8?B?TGNTSFEybFAxZ2R6UlI5SUVsRmJPNk5NdFc0VGd3S3Q2c2J3Q1ZRSmluMmxS?=
 =?utf-8?B?em83RXBjOWZGa2hJTzBwbHJoOWVwa2lVU0VFakdqZzhmRmFsOGdYcXNWd1hC?=
 =?utf-8?B?NXNlREsxTFFVaEpjZzFEUEV6WmJCMlpReFJMZ3I5SDJUZ3NKSkNNcWMwa3BE?=
 =?utf-8?B?ZVB0SXhoU1cybE1kemtSK29VdUZrbEwyQkN0N05mazJkVFBRY3lMRTMyUkw4?=
 =?utf-8?B?cmJyMjg2WDFDZTdZLzNvSlNnMk9iNDhnRTNyaE14SGlSdWVtT3BUTlhZU3Q3?=
 =?utf-8?B?V292UzhDbjVaWEVrUWVxL3lVa2dIZnlYbmxSQVdxTzdEWkhUSmZFcWRRMWFR?=
 =?utf-8?B?THIwb0xFS3BQVFEveVpjYk5iYldPczlCc3k1SVBEU3JFa1VCZ3VWcWt0Rkgw?=
 =?utf-8?B?QXgxcHV6dzlFVG9XLytIRjNDRTdTWENBamU0TkpqTWxxVXorYlliMGlzMFFO?=
 =?utf-8?B?c3hXNjYzTEtLTnN1L3JGNzZSM2kyNUpvUlE0VkJUQk42cnhzYm5GR1JmV0hI?=
 =?utf-8?Q?HubcMZaN0nRT5PUn0Ly1VNFuQ2F?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dExwNmVtS0liMXcrU3NKN1lpY3VoMFNhSXVKa2MzNkpOZWtrZDJRODNsbTQ1?=
 =?utf-8?B?SGpNOHhVRzZSQ1ZzcmVsR3BiS010UHN2YytQNU5kNDhxT0xhK2dLNk5lWWJz?=
 =?utf-8?B?MXRpUUdGTmZ4K2VrMExQS0MxeWF6MTZMUzE2MFBzRUVKVDVlV1o5VWRpS1hN?=
 =?utf-8?B?N2RRNW81SFA3aVprVEVicjBmMHhkMUJnd3MvVlNRRXg5b3dLc21iRk40RklV?=
 =?utf-8?B?NXl1UEUzMXgwTUhOQUMvekNSbDBha0pkd2ZZaXFGMnBlbUJER1VhWThJNUxi?=
 =?utf-8?B?Zkt1Qm9BdXhuWE5mSmYxVjYxSHEralRPZDJmYWVqS0dZMVhBa1JZSmJRcW9l?=
 =?utf-8?B?OFh4MmxBLzF6VENwZG1MQXdlWFZVYmxIaVQrazZYQ2xHNCtvVEZjRGVhdHdV?=
 =?utf-8?B?c2dHazNhbVNXeDkxdEF0R21YVW10TGZwbHFUU0JnclJiK0UvQ3dGYW9ma1Ar?=
 =?utf-8?B?cXZvOFJDU2VHcjBqeWRPNVMrVUhHQ0ZiUEd1V3YwSm8vbGZJV0FWMTl1TFZB?=
 =?utf-8?B?eTQ0cWpNeWJVS3M2alBEUWJWMm50aUkvZ1d2bEh5UjNoMHF5L2taR09tQWw5?=
 =?utf-8?B?MTFUaWdOZzdVa0xvd1N2QTFuMjgwbDV5bk45OXhXK1IxYnZvaDlVcGx0c3JG?=
 =?utf-8?B?aFNFdGlqNUdpdmlIYTJzSWJQakJ3SzlTdVVFWHA0d1h6dENHSHhxWjgvdVNs?=
 =?utf-8?B?YkszMWFtWU9KTE5GckQ5TUdNb2N0Z2VZUUZSbGVjOVZ6SjBEam1RMlltVXE2?=
 =?utf-8?B?SUVxQWlwN2JZeEZiczBYYU9yekpGaXIxKzNHWUQ4M0VtRFh2RE95aFhiZ3Bv?=
 =?utf-8?B?RHNYd3E5UGI2VldIeFhndytObWNOTDc2eUV0amxQcTdBQTNGL1BqRnQ4NHJ0?=
 =?utf-8?B?K2pJbDJjcXBwZGlzdmdKR05xNkZWeUxLU1hJSHZxZnkvcU01RmxjL1J0Rk5q?=
 =?utf-8?B?dUhmS01ZYkpzeDdPSkY3aTdxV1VGQUtVSmsxR0tmTHpIaWRmSmRrNXA3RFpx?=
 =?utf-8?B?R3EyVnNGOGtzOUFVazY3dmk1L3NsR1ZoWUZoSkRkN21BbzhHOURrbGZPcW9L?=
 =?utf-8?B?bnVyZnVBeEp2MkR2RWJ5YVlIZEdNUTNPdGNvZ2gvZlRpd0x1cVp2Si9GWmRs?=
 =?utf-8?B?ZXNHT3liWTZoVkhTay9oak5KRmY3dytqaW1xRlVTZ2laQlQzb09tRnNrcSs2?=
 =?utf-8?B?NUQ4SVJZcEVOdk41Y3lrbmg4QUtmQkl6c1R3OUZVbUVmcmxOakgzWGVaWEFY?=
 =?utf-8?B?MjRtdHdVSnJIaE5NaHlSZjlIam56RnJMdENaM0JicHQ1YVpTaXRpVDgvUkV1?=
 =?utf-8?B?YjBSSXJ6RzZiZUwzazNBMEdnaUNmdXVSb3pCUStxQ05UWHo2TDNjOTBNVWVD?=
 =?utf-8?B?MUJ2bi9UYTJNREkvL1BkazdFRmpURjM4YTUrM0lwM0JaenRyUEVRRUlXQXlE?=
 =?utf-8?B?K0xNYTlPQ0I5TENWcHg4SmlQQW9EdjNhT2duY1Vtd2RDS1dKeGdHV21DNU12?=
 =?utf-8?B?TE9yZmx4TE5XNGpwNDczQjFXbkFkWm5RTTNkSEZObE1WQk43VDRFU1R1Z2ZI?=
 =?utf-8?B?V0o3T0JwNVNwSE1pcjYyUG5vdlpQMDFtV1NDN3JlcXFHR3Rtd1JsQjB5OWxK?=
 =?utf-8?B?TXpMdlBHaytGdUtocHZiR0M1ZEw3Ykl4bXowOE4weGVpc1BmVUo2S3h3REFr?=
 =?utf-8?B?aHAySnlNSFJ0c0JTdzVLK0lRV0JOZkluUVFWMTNWTjBnU3RPOHlmNWVkam94?=
 =?utf-8?B?R2d3OFNzTG50SjBHaTExcU9YRHU0TEVvdU1RcVhQQmlDUUhTUWNiZGtPWFkr?=
 =?utf-8?B?VUxYSDBlcC9NbUNVbTZpb3JQY1ZBRGlselZEeVhHWUtXWE1ROEE0SVpYYUIv?=
 =?utf-8?B?QklPbVp4c25vN2hxUWVWaEdGTjBOUm15bVhYMWlsczVpZDdBbVJTTTg0aU1l?=
 =?utf-8?Q?Zxvf9/Yhxrk=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b3d1e8-b4da-4244-9532-08ded299e7b1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 09:12:39.4892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR02MB9465
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/25/26 15:25, Chao Yu via Linux-f2fs-devel wrote: > On
 6/23/26 17:29, Yongpeng Yang wrote: >> >> On 6/22/26 08:42,
 Chao Yu via Linux-f2fs-devel
 wrote: >>> On 6/21/26 23:48, Yongpeng Yang wrote: > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.86 listed in wl.mailspike.net]
X-Headers-End: 1wcg8e-0005DW-Ln
Subject: Re: [f2fs-dev] [PATCH RESEND 2/5] f2fs: only initialize largest
 extent without extent_node at inode init
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_MUA_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 672776C41D9

Ck9uIDYvMjUvMjYgMTU6MjUsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gNi8yMy8yNiAxNzoyOSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4KPj4gT24gNi8yMi8yNiAw
ODo0MiwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+IE9uIDYvMjEvMjYg
MjM6NDgsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4gT24gNi8yMC8yNiAxMTozMSBBTSwgQ2hh
byBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+Pj4gT24gNi8xOS8yNiAyMjozNCwg
WW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBPbiA2LzE1LzI2IDc6NTUgUE0sIENo
YW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4+Pj4gT24gNi8xMi8yNiAxOTo1
OCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+Pj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoZSBsYXJnZXN0IGV4dGVu
dCB0YWtlcyBlZmZlY3QgZHVyaW5nIGJvdGggcmVhZCBtYXBwaW5nIGFuZCB3cml0ZQo+Pj4+Pj4+
PiBtYXBwaW5nIGxvb2t1cHMsIHdoaWxlIHJlYWQgbWFwcGluZyBkb2VzIG5vdCBuZWVkIHRvIGFj
Y2VzcyB0aGUKPj4+Pj4+Pj4gZXh0ZW50X25vZGUuIEZvciB3cml0ZSBtYXBwaW5nLCB0aGUgY2Fz
ZSB3aGVyZSB0aGUgbGFyZ2VzdCBleHRlbnQgaXMKPj4+Pj4+Pj4gbm90IGluIHRoZSBleHRlbnQg
dHJlZSBjYW4gYWxyZWFkeSBiZSBoYW5kbGVkIGJ5IHRoZSBtZXJnZSBsb2dpYywgYW5kCj4+Pj4+
Pj4+IGNhc2VzIHRoYXQgY2Fubm90IGJlIG1lcmdlZCBkbyBub3QgcmVxdWlyZSB0aGUgbGFyZ2Vz
dCBleHRlbnQgdG8KPj4+Pj4+Pj4gcGFydGljaXBhdGUgZWl0aGVyLgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBUaGVyZWZvcmUsIHRoZSBsYXJnZXN0IGV4dGVudCBkb2VzIG5vdCBuZWVkIHRvIGluaXRpYWxp
emUgYQo+Pj4+Pj4+PiBjb3JyZXNwb25kaW5nIGV4dGVudF9ub2RlLCByZWR1Y2luZyBtZW1vcnkg
Zm9vdHByaW50Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5n
IDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+IMKgIGZzL2Yy
ZnMvZXh0ZW50X2NhY2hlLmMgfCAxOCArLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+Pj4gwqAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNyBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4KPj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVu
dF9jYWNoZS5jCj4+Pj4+Pj4+IGluZGV4IGFhMzY4YTAxYjAzNS4uZjhkOTRkYjYwZGM2IDEwMDY0
NAo+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+Pj4+Pj4+ICsrKyBiL2Zz
L2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+Pj4+Pj4gQEAgLTQxMCwxMCArNDEwLDggQEAgc3RhdGlj
IHZvaWQgX19kcm9wX2xhcmdlc3RfZXh0ZW50KHN0cnVjdAo+Pj4+Pj4+PiBleHRlbnRfdHJlZSAq
ZXQsCj4+Pj4+Pj4+IMKgIHZvaWQgZjJmc19pbml0X3JlYWRfZXh0ZW50X3RyZWUoc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0Cj4+Pj4+Pj4+IGZvbGlvICppZm9saW8pCj4+Pj4+Pj4+IMKgIHsK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0Io
aW5vZGUpOwo+Pj4+Pj4+PiAtwqDCoMKgIHN0cnVjdCBleHRlbnRfdHJlZV9pbmZvICpldGkgPSAm
c2JpLT5leHRlbnRfdHJlZVtFWF9SRUFEXTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZjJm
c19leHRlbnQgKmlfZXh0ID0gJkYyRlNfSU5PREUoaWZvbGlvKS0+aV9leHQ7Cj4+Pj4+Pj4+IMKg
wqDCoMKgwqAgc3RydWN0IGV4dGVudF90cmVlICpldDsKPj4+Pj4+Pj4gLcKgwqDCoCBzdHJ1Y3Qg
ZXh0ZW50X25vZGUgKmVuOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBleHRlbnRfaW5mbyBl
aSA9IHswfTsKPj4+Pj4+Pj4gwqDCoMKgwqDCoCBpZiAoIV9fbWF5X2V4dGVudF90cmVlKGlub2Rl
LCBFWF9SRUFEKSkgewo+Pj4+Pj4+PiBAQCAtNDM1LDIxICs0MzMsNyBAQCB2b2lkIGYyZnNfaW5p
dF9yZWFkX2V4dGVudF90cmVlKHN0cnVjdCBpbm9kZQo+Pj4+Pj4+PiAqaW5vZGUsIHN0cnVjdCBm
b2xpbyAqaWZvbGlvKQo+Pj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChhdG9taWNfcmVhZCgmZXQtPm5v
ZGVfY250KSB8fCAhZWkubGVuKQo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBza2lw
Owo+Pj4+Pj4+PiAtwqDCoMKgIGlmIChJU19ERVZJQ0VfQUxJQVNJTkcoaW5vZGUpKSB7Cj4+Pj4+
Pj4+IC3CoMKgwqDCoMKgwqDCoCBldC0+bGFyZ2VzdCA9IGVpOwo+Pj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgZ290byBza2lwOwo+Pj4+Pj4+PiAtwqDCoMKgIH0KPj4+Pj4+Pj4gLQo+Pj4+Pj4+PiAt
wqDCoMKgIGVuID0gX19hdHRhY2hfZXh0ZW50X25vZGUoc2JpLCBldCwgJmVpLCBOVUxMLAo+Pj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZldC0+cm9vdC5yYl9yb290LnJi
X25vZGUsIHRydWUpOwo+Pj4+Pj4+PiAtwqDCoMKgIGlmIChlbikgewo+Pj4+Pj4+PiAtwqDCoMKg
wqDCoMKgwqAgZXQtPmxhcmdlc3QgPSBlbi0+ZWk7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBl
dC0+Y2FjaGVkX2VuID0gZW47Cj4+Pj4+Pj4+IC0KPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHNw
aW5fbG9jaygmZXRpLT5leHRlbnRfbG9jayk7Cj4+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBsaXN0
X2FkZF90YWlsKCZlbi0+bGlzdCwgJmV0aS0+ZXh0ZW50X2xpc3QpOwo+Pj4+Pj4+PiAtwqDCoMKg
wqDCoMKgwqAgc3Bpbl91bmxvY2soJmV0aS0+ZXh0ZW50X2xvY2spOwo+Pj4+Pj4+PiAtwqDCoMKg
IH0KPj4+Pj4+Pj4gK8KgwqDCoCBldC0+bGFyZ2VzdCA9IGVpOwo+Pj4+Pj4+Cj4+Pj4+Pj4gUHJl
dmlvdXNseSwgd2UgY2FuIHNwbGl0IGxhcmdlc3QgZXh0ZW50IG5vZGUgdG8gdHdvIGlmIHdlIHB1
bmNoZWQKPj4+Pj4+PiBpdCwgbm93Cj4+Pj4+Pj4gd2UgY2FuIG5vdD8gSUlVQy4KPj4+Pj4+Cj4+
Pj4+PiBQcmlvciB0byB0aGlzIGNoYW5nZSwgdGhlIGxhcmdlc3QgZXh0ZW50IGNvdWxkIGFsc28g
YmUgc2hydW5rLCBzbyB0aGUKPj4+Pj4+IHNldCBvZiBzY2VuYXJpb3MgdGhhdCBuZWVkIGhhbmRs
aW5nIGR1cmluZyBwdW5jaCByZW1haW5zIGlkZW50aWNhbAo+Pj4+Pj4gYmVmb3JlIGFuZCBhZnRl
ciB0aGUgbW9kaWZpY2F0aW9uLgo+Pj4+Pj4KPj4+Pj4+IEZvciB0aGUgbGFyZ2VzdCBleHRlbnQs
IGl0IG9ubHkgbmVlZHMgdG8gZ3VhcmFudGVlIHRoYXQgdGhlIG1hcHBpbmcKPj4+Pj4+IGluZm9y
bWF0aW9uIGl0IHJlY29yZHMgc3RheXMgY29uc2lzdGVudCB3aXRoIHRoZSBtYXBwaW5ncyB0cmFj
a2VkIGluCj4+Pj4+PiB0aGUKPj4+Pj4+IGV4dGVudCB0cmVlIGFuZCBtdWx0aS1sZXZlbCBpbmRp
cmVjdCBpbmRpY2VzLiBUaGUgcHVuY2ggb3BlcmF0aW9uIGRvZXMKPj4+Pj4+IG5vdCBicmVhayB0
aGlzIGNvbnNpc3RlbmN5LiBNb3Jlb3ZlciwgdGhlIGxhcmdlc3QgZXh0ZW50IGlzIG5vdAo+Pj4+
Pj4gcmVxdWlyZWQKPj4+Pj4+IHRvIGJlIHRoZSBsb25nZXN0IGV4dGVudCBhbW9uZyBhbGwgZW50
cmllcyBpbiB0aGUgZXh0ZW50IHRyZWUuIEl0Cj4+Pj4+PiBtZXJlbHkKPj4+Pj4+IG5lZWRzIHRv
IG1hdGNoIHRoZSBtYXBwaW5ncyBzdG9yZWQgaW4gbXVsdGktbGV2ZWwgaW5kaXJlY3QgaW5kaWNl
cyBhbmQKPj4+Pj4+IGJlIG5vIHNtYWxsZXIgdGhhbiB0aGUgbWF4aW11bSBleHRlbnQgcHJlc2Vu
dCBpbiB0aGUgZXh0ZW50IHRyZWUuCj4+Pj4+Cj4+Pj4+IFdoYXQgSSBtZWFudCBpczogZS5nLiBw
cmV2aW91c2x5LCBpZiBsYXJnZXN0IGV4dGVudCBpcyAxMDI0LCBwdW5jaGluZwo+Pj4+PiBpbiB0
aGUKPj4+Pj4gbWlkZGxlIG9mIHRoZSBleHRlbnQgd2lsbCBtYWtlIGl0IGJlaW5nIHNwbGl0IHRv
IHR3byBleHRlbnRzICg1MTIsCj4+Pj4+IDUxMSkgaW4KPj4+Pj4gX191cGRhdGVfZXh0ZW50X3Ry
ZWVfcmFuZ2UoKS4KPj4+Pj4KPj4+Pj4gSWYgd2UgZG8gbm90IGFkZCBsYXJnZXN0IGV4dGVudCBu
b2RlIGludG8gcmIgdHJlZSBpbgo+Pj4+PiBmMmZzX2luaXRfcmVhZF9leHRlbnRfdHJlZSgpLAo+
Pj4+PiB0aGVuIHdlIG1heSBoYXMgbm8gY2hhbmNlIHRvIGtlZXAgc21hbGwtc2l6ZWQoNTExKSBl
eHRlbnQgaW4gYWJvdmUKPj4+Pj4gcHVuY2ggc2NlbmFyaW8sCj4+Pj4+IGNhbiB5b3UgdmVyaWZ5
IHRoYXQ/Cj4+Pj4KPj4+PiBZZXMsIHRoZSA1MTEtYmxvY2sgbWFwcGluZyB3aWxsIGJlIGRyb3Bw
ZWQuIEkgY29uc2lkZXJlZCB0aGlzIGNhc2UKPj4+PiBlYXJsaWVyOiB3aGVuIHRoZSBuZXdseSBp
bnNlcnRlZCBtYXBwaW5nIG92ZXJsYXBzIHdpdGggb3IgYWRqYWNlbnQKPj4+PiB3aXRoIHRoZSBs
YXJnZXN0IGV4dGVudCwgd2UgcmVpbnNlcnQgdGhlIGxhcmdlc3QgZXh0ZW50IGJhY2sgaW50byB0
aGUKPj4+PiBleHRlbnQgdHJlZS4gV2l0aCB0aGlzIGxvZ2ljLCB0aGUgNTExLWJsb2NrIHNwbGl0
IGV4dGVudCB3aWxsIHJlbWFpbgo+Pj4+IHByZXNlbnQgaW4gdGhlIGV4dGVudCB0cmVlLiBJbnN0
ZWFkIG9mIHBlcmZvcm1pbmcgcHVuY2ggaGFuZGxpbmcgb24KPj4+PiB0aGUgbGFyZ2VzdCBleHRl
bnQsIHdlIGNhbiBzaW1wbHkgZHJvcCBpdCBkaXJlY3RseS4KPj4+PiBIb3dldmVyLCB0aGlzIGFw
cHJvYWNoIGRvZXMgbm90IHdvcmsgd2VsbCBmb3IgdXBkYXRlcyB0YXJnZXRpbmcgdGhlCj4+Pj4g
dGFpbCBvZiB0aGUgb3JpZ2luYWwgZXh0ZW50LiBGb3IgaW5zdGFuY2UsIHB1bmNoIDEwMjQgaW50
byAxMDIyIGFuZCAxCj4+Pj4gZm9yIG92ZXJ3cml0ZSBjYXNlLCB3aGljaCB3aWxsIGFsc28gYWxs
b2Mgb25lIG1vcmUgZXh0ZW50X25vZGUuCj4+Pgo+Pj4gV2Ugd2lsbCBvbmx5IGFkZCBleHRlbnQg
d2hpY2ggaGFzIHNpemUgPj0gRjJGU19NSU5fRVhURU5UX0xFTiwgc28gMTAyMgo+Pj4gd2lsbCBi
ZSBhZGRlZCwgYW5kIDEgd2lsbCBiZSBkcm9wcGVkLgo+Pgo+PiBPaCwgeWVzLCB0aGlzIGV4YW1w
bGUgaXMgbm90IGFwcHJvcHJpYXRlLiBEbyB5b3UgdGhpbmsgdGhpcyBhcHByb2FjaAo+IAo+IFNp
bmNlIHRoZXJlIHdpbGwgYmUgcG90ZW50aWFsIHNpZGUtZWZmZWN0IHcvIGN1cnJlbnQgcGF0Y2gs
IHNvIEkgcHJlZmVyCj4gdG8ga2VlcCBpdCBhcyBpdCBpcy4KCldlIGhhdmUgb2JzZXJ2ZWQgdGhh
dCB0aGUgIkhpdCByYXRpbyIgcmVwb3J0ZWQgYnkgIkV4dGVudCBDYWNoZSAoUmVhZCkiCmlzIHF1
aXRlIGxvdy4gVGhlIG1haW4gcmVhc29uIGlzIHRoYXQgdGhlIHRvdGFsIG51bWJlciBvZiBleHRl
bnQgbm9kZXMKaW4gdGhlIHJlYWQgZXh0ZW50IGNhY2hlIGlzIGxpbWl0ZWQsIGJ1dCBpbmNyZWFz
aW5nIHRoYXQgbGltaXQgbWF5IG5vdApiZSBlYXN5LgoKSSdtIHdvbmRlcmluZyB3aGV0aGVyIHdl
IGNhbiBpbXByb3ZlIGNhY2hlIHV0aWxpemF0aW9uIGluc3RlYWQuIEFkZGluZwphbiBleHRlbnRf
bm9kZSBmb3IgdGhlIGxhcmdlc3QgZXh0ZW50IGFuZCBpbnNlcnRpbmcgaXQgaW50byB0aGUgcmVh
ZApleHRlbnQgdHJlZSBkb2VzIG5vdCBzZWVtIHRvIGhlbHAgdGhlIGhpdCByYXRpbyBkaXJlY3Rs
eS4gT24gdGhlIG90aGVyCmhhbmQsIHdoZW4gYSBmaWxlIGlzIHJlb3BlbmVkLCBpdHMgbGFyZ2Vz
dCBleHRlbnQgY2F1c2VzIHRoZQpjb3JyZXNwb25kaW5nIGV4dGVudF9ub2RlIHRvIGJlIGFkZGVk
IHRvIHRoZSB0YWlsIG9mCnNiaS0+ZXh0ZW50X3RyZWVbRVhfUkVBRF0uZXh0ZW50X2xpc3QuIFVu
ZGVyIG1lbW9yeSBwcmVzc3VyZSwgdGhpcyBtYXkKcmVzdWx0IGluIG90aGVyIG5vbi1sYXJnZXN0
IGV4dGVudHMgYmVpbmcgcmVjbGFpbWVkIGZpcnN0LgoKV291bGQgaXQgbWFrZSBzZW5zZSB0byBw
bGFjZSB0aGUgbGFyZ2VzdCBleHRlbnRfbm9kZSBhdCB0aGUgaGVhZCBvZgpzYmktPiBleHRlbnRf
dHJlZVtFWF9SRUFEXS5leHRlbnRfbGlzdCB3aGVuIHJlc3RvcmluZyB0aGUgbGFyZ2VzdCBleHRl
bnQKaW4gZjJmc19pbml0X3JlYWRfZXh0ZW50X3RyZWUoKSBpbnN0ZWFkPyBUaGlzIHNlZW1zIGxp
a2UgYSBzaW1wbGVyCmFwcHJvYWNoIHRvIGltcHJvdmUgdGhlIHV0aWxpemF0aW9uIG9mIHRoZSBl
eGlzdGluZyByZWFkIGV4dGVudCBjYWNoZS4KClRoYW5rcwpZb25ncGVuZywKCj4gCj4gVGhhbmtz
LAo+IAo+PiB3b3VsZCBiZSBiZXR0ZXIsIG9yIGlzIFtQQVRDSCAxLzVdIGFuZCBbUEFUQ0ggMy81
XSBwcmVmZXJhYmxlPwo+Pgo+PiBUaGFua3MKPj4gWW9uZ3BlbmcsCj4+Cj4+Pgo+Pj4gVGhhbmtz
LAo+Pj4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4+IFlvbmdwZW5nLAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRo
YW5rcywKPj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MKPj4+Pj4+IFlvbmdwZW5nLAo+Pj4+Pj4K
Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pj4KPj4+Pj4+Pj4gwqAgc2tpcDoK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoCAvKiBMZXQncyBkcm9wLCBpZiBjaGVja3BvaW50IGdvdCBjb3Jy
dXB0ZWQuICovCj4+Pj4+Pj4+IMKgwqDCoMKgwqAgaWYgKGYyZnNfY3BfZXJyb3Ioc2JpKSkgewo+
Pj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+Pj4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPj4+Pj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+Pj4+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKPj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4+
IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwKPj4+Pgo+Pj4KPj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pgo+IAo+IAo+
IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
