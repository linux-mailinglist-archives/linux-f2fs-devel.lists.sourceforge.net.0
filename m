Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E37D5969A26
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 12:29:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slQnA-0000nK-Uy;
	Tue, 03 Sep 2024 10:29:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1slQn8-0000n4-QI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 10:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gFqCxxf73eAb3UdUo7enSfo21KMF5eskPxkHn0fSUww=; b=CIQU9LkTjOkYBelXcUKPMhSDjc
 uTw6Y1v4irFHoggjhxiGV8/qf51UXinlPzZbl4kfNKvKNShZxfO23aKVREF/LfxLQKMKpl5NtQJKR
 jFp2sCkLbIWTrdqPSleX/KA5NpWP+jVIW6AfQWLn5xoYBclU0eC0jlF2DhoDDtfP958c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gFqCxxf73eAb3UdUo7enSfo21KMF5eskPxkHn0fSUww=; b=eyrNFAmWOp/Mpy6E9sC4ynwdaO
 KLL0Y7iqCBozlI+Ba2S05euAAKeqfQxXymW5HMXnaGHYuvv55VnPNubXEUDlmaoNycrD+uVsh0/vw
 XwoJyzcGX5NV4CSzko4TAECCHJhPHK76TL7Q9e4SSlID5OYE5XglqBrg+x/+zz/nuArg=;
Received: from mail-sgaapc01on2087.outbound.protection.outlook.com
 ([40.107.215.87] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slQn7-0001JH-Cr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 10:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsajau+z/b551vK/v/PVsQoPT85X43kZ3auB+19Lx9HXfUe3C2Js2Q5w/BLx3YbPgiguMKm0G/jAdQ7nGx2mOiBb1LgBbgvs6fhOLthof8cOGCgJswJLT0EiCN31yKH73f4ch4rrnrubTRy8Xm4SGcHw7F+DPo4+SuHxFWkD5TxPV7lS9ZrvN4gYZTKvMxAkgWK2XG7WLD0WMTVWReQLxkAjLC31X5Ca+Is7+SZz521Ua7+ujO0yAvYsigRyjUwDrhdd1SisZWZMf7p3rZw6pBH+1pFl8xnuoNXxzfcuO3/8s3tbP1by1ueG0ZTU+ZBxUWrm7hSTxnBPO11auBZZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFqCxxf73eAb3UdUo7enSfo21KMF5eskPxkHn0fSUww=;
 b=mEU0uhjL3UnRbI258LPApRYOjtswEBMq/e9M114OiD7C8X3w+PqwbG8SfrYzQt7Aj8kF2ZavjQnNO+y3lgRahiKMPcjx0ASQfIT0jiNNHxp2MTdbDJ5h+/Lj6vzfPqld/RaJNnzbebecz6qiS6awsYJL1rzWKdSEsOK6RdxlR6Gc5KJ1oC9TLkCOaGnmqe5ILjde7a3SOdqSePtCBKPbTpLZPOAcmJhBUAIKCsuWrsH1s8X5sZyLyoMH5gdPKsxq16Y18sN357dS+Cbk3g6Q4LMknX3LZvpg9VTnkGY6XoLY8VAhYnnEMpBcx8gCjjbvgpXZzIqOR4ZFHTgTZk/BBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFqCxxf73eAb3UdUo7enSfo21KMF5eskPxkHn0fSUww=;
 b=OGx+v3P6EHK8VQeSkwlZXnKLcSHTyLiNyniuALUrObJeDrRzDVGr7qpmyneKmODWGJvSM2eZOoYcXisZUv18aQzAy2JwGldygfDWhTUA72tWQMm3A8uL6Wz9+UT2Rn6JrfFVgDe5ldIJ3djDuqxxd8J+N2M0buwBwzGkN6xW8Pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB5762.apcprd02.prod.outlook.com (2603:1096:400:1d2::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 3 Sep
 2024 10:14:04 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 10:14:03 +0000
Message-ID: <8d9ebf65-a1e4-4151-8ecb-92a531a7a938@oppo.com>
Date: Tue, 3 Sep 2024 18:14:00 +0800
User-Agent: Mozilla Thunderbird
To: chao@kernel.org, jaegeuk@kernel.org
References: <20240704025740.527171-1-shengyong@oppo.com>
 <20240704025740.527171-10-shengyong@oppo.com>
Content-Language: en-US
In-Reply-To: <20240704025740.527171-10-shengyong@oppo.com>
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: b3daa385-cc1b-48f9-d66c-08dccc01230d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEVFRXJ0K3l0bXpZS3dNNTY0YjFBTlU4d3MwZ1pnbnhYZGEvNHFZUzlsSjBF?=
 =?utf-8?B?U3ZOaWZKN1JBdGNMdW02WEE5Wk1kZ1h4TkR4Qmh2N2tTRVFRaU93TEFwTnpZ?=
 =?utf-8?B?SzliZ2NzNSs2bk5ORVlnUDdWQnlSM1hkVWlmSXF2VnFJMmt1NlRpeU9hTmkr?=
 =?utf-8?B?WS9neEdTNVNJZ2p5K01GMVBMV0c0Wm5mN0ZEQWIrVDhtMmpwUmV0ejErVll1?=
 =?utf-8?B?N0VvSGE0R2lZRVJndmo5ZTlYVng2UjBULytwdUN6VCsrRlFTS0ZESkFHdWwv?=
 =?utf-8?B?VFRPOUVsQ2Y2Mmk3aUJ4aHVtd1JmSEdSQkx5RUx1Z2Z0RDVab2VXT3JTY2gr?=
 =?utf-8?B?TC9sY0hZQTBLRU9zKzdneVQvUC9xNGhpc1BzVjNvU21tS3FLaVRqT28vbDh0?=
 =?utf-8?B?NS96Ni9mQVlPM1NrSjEvbjlPUGVqYTQvL3o4UW1VOFlwQ0xyRW1PQnF1ejg3?=
 =?utf-8?B?OU5uRmlFQUEwNEFqS1V0eXYwRERJeEZ5Z0MxcWlNNlBsT1BONVVSc1pNSWF4?=
 =?utf-8?B?UkJiR1F2NTRGTG1GaXFiRmRxdWhrVEhkWlFQeHZHSVNsZXY4eXA4NUdubllQ?=
 =?utf-8?B?emN0UXRMbkhLdTVHSWVDdDFlcGdDY0g2MEhST21hWCs5MG9ySUZsL25GbWFz?=
 =?utf-8?B?UHNYRXQvMnpjWGNLZmlEalNlZDVsa3BEQU1PekFVMWNYenNtR0R4WTVDRXVi?=
 =?utf-8?B?bWZQMlpGbTBaYTFDTjR4bjFyclVSMk9Cb2VUTnVWYmtGMFZ6ZlJETGI0eEN5?=
 =?utf-8?B?MHNVMDdYWU5GaFhtYkxudHFxY3hlT05xWWZoQlJ1a3NOdHA5OFJPV1RsaFgv?=
 =?utf-8?B?a2krVlhOUFFYbFJKNHZsU3pkTUZQZHBHa0NtSmc0ZmsvK2VHc0ZuRisybVJX?=
 =?utf-8?B?dzdxS0ZVQjJYNFFzVmVaajl5dHlid0x0ZXpMNkNWS0RVZUpTRG0vZHdUODJ4?=
 =?utf-8?B?MzlQMWV3NWRGdERYYk1rTkhKK1VMZytRWVZkZTBlZ1pncTVtMklGbTVkMTU0?=
 =?utf-8?B?WmZFMnYvMnhNOUtGc09nZXFxc1pZaG10cnQ0L25qVlpRK2o5QWpnTEFadHVq?=
 =?utf-8?B?Wk9ITlFkb3FKc055M2lhTFVzOG5ENFZuc1JLZllWWVp5Vzh0VENGWWhZYits?=
 =?utf-8?B?S002eXB2OG5KdllGWGdpZ3J2Sm1YSEU4L0hBNzRzeWF2VWVheFoyeGdodGJC?=
 =?utf-8?B?d1doZWRqQ0E3NWx0VUdOSDlkTXRWNUU3aklaM3l6NVhMQzNvcjdtempSQ1g4?=
 =?utf-8?B?Qm1FV1FQTWJNMXpTN0xlbE1VMjZpTHlCOVVzaGU4ODc5WDJqNVBkSDdzTEYx?=
 =?utf-8?B?UTJxdGM4MzdlMVVRSXg3ZTBQWHA4dkxEdTZjakpoT2I0SU1EcFhSOUpkczFX?=
 =?utf-8?B?Y3dvSjFlSURCaVQvRk04aVpvR1lucm84YXhYZHdwVVFWbXR3YktzeEpXckIz?=
 =?utf-8?B?VERENUV4ZWhXczgxcmFQY1B2OGNpT08vZ0FBV3p3TE5XWXRoeEd6UzRhNlBZ?=
 =?utf-8?B?VENyQVdPbXRndXlZcTZGQWMyTFdxMmFEMnJ2dTdTcUpHL0drMU5PSXRDL3ls?=
 =?utf-8?B?aGJNMEVpTzdyeE9yWkhpTDBoenIxYW8xOU5iWU1XaEgwdmxzMlcrSmJCQzVa?=
 =?utf-8?B?aktnb1RLWGo4MTkyVng2R0FQWjJDQzhTcVovcjVaK081RUQzL2hZQ3YvSHpY?=
 =?utf-8?B?VW9BMXRMVko0emg4WjVNVjYreGJGL09hK0tzTXd0WTlYb1A0L2hmU21EZUVZ?=
 =?utf-8?B?STdDY1NER0xneFlWdUJuRzlFSGxZdzRhTzNGa3V1SWlGZ1lTYjdZcEEwTzgw?=
 =?utf-8?B?QmxhQVBEV0pUNGgvUzZaQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGU2eUw3NGtQa24vS1E5S3A0eUk5WHFYVFZKeEpoWVVxamhmVlppVHBKN29B?=
 =?utf-8?B?emNqWTZ3ZlE3OS9kQlRSa3ZHN1UxUEo1amhVdStrL2hLaWNYcVJSM0VrUHo0?=
 =?utf-8?B?akpoamVld1BteXRhZUl6dmpITmczeUZNZzBGbGtsb2pYQ25TTTRRQ3hQa3ZD?=
 =?utf-8?B?aFUzN1BMV01zc20xZ2VUTVNKSU9kT0ZvQjNMRnZKMlhibXJNdC91NHRqVHRF?=
 =?utf-8?B?SHpxSWsyTmppNm9zUnhiL0R1VHNlcGRCb28wOGdXYUtaT2l1Tm4zYnNqUmZv?=
 =?utf-8?B?OEFyK0tlUmxReHR0QmVVaXdEV3FEZEpSWVp5SHNIUXgxcTRKSDU4RUtJd2kz?=
 =?utf-8?B?OFVKYUZmODAzS28reUxtYmNud2NGU2dZVXRWcFVDRzVVazZrZk8zdzVGdXp6?=
 =?utf-8?B?MlJhbjJXVDM2b3NEdnVwc3hFY2c5MXVXZUVNSTF4RXU4bElQSTFDdkl0WkVJ?=
 =?utf-8?B?WnVHZlNiSFgwS2Z2c29wL3RtNUhpRWRWQTNLbXZ0OTkrYUhTbTd5dHMzNm5l?=
 =?utf-8?B?YkdzYzNrb0F2M3lBS0NrZnl2OElnVTBFR09QZjR6Y081bDlPaVU5di9HaW9u?=
 =?utf-8?B?MXpmRjgwNnd3TnN3Y1RBZkpjT3hubFVIdTN2UzFlRnlka3l5bC8rbk8yalAr?=
 =?utf-8?B?SmdpNWE5emtMWGdONXlWbnNQT3hZK0ZRL3E1cWtycWdMRjFSZkZlUTZzaGk4?=
 =?utf-8?B?dHJrYitJSFNBcHZkMlFhUmkzM3BLOGdFNE90bm9tbmRqOUFYVG9XMUNZWHpB?=
 =?utf-8?B?ZmNJV1Evb3FMZmV1eUNmNnFBREQ0SFgxWmgyRGU1T1hDSDMrRFlTUVpnWTdD?=
 =?utf-8?B?V0dqYW5YYjBXcUtjVnhqNnVOMUpaV0N5VVRKRDh5RlVpandnZTdSRDk0ZkxK?=
 =?utf-8?B?eEpnaVZ2aUYxdy91WTIyODdERmliRW5kQUNvT2d2NnBkakJ2ZmJJUTZRbHg3?=
 =?utf-8?B?TXB2Rnh6MTBES2s4Wm5ENUxhczdLb3lweUtnTmNXd3BPSlhTTGpOTzA3eUxC?=
 =?utf-8?B?VXlkUEpXU2QxVjQzYXhsU29LNDN0M0N3ZU5tVVNuQ1ZxcEJkQkFTcHpSUkNK?=
 =?utf-8?B?QXZKK1psdUVVcUx5b1RUWFNuQ2FZV1AzYUVFU1lDSUswK1dLb1BTSDU3c2la?=
 =?utf-8?B?cHR4L1ZEZUh2dkl5K1lETHRBaEFObWovcCtTZDhTRzh4SzA4TEJIcnA0UEJ6?=
 =?utf-8?B?R042aml2ZDJMNEw5anBPbWpGWGlFSkYzWFhDcEdkZzVaN0hRampYczRCUSsw?=
 =?utf-8?B?aUIwOG5LVlE5eUxzTnFCN0pVL2lnNlZLbm43SnBEekZWSG1kS0owNmUrcjBl?=
 =?utf-8?B?TWxubmlRY2hpbXNrWGlPbE9ORjNVZzA1ZXdGYk5aYlNGNWd4UWh1ZWE5ajBs?=
 =?utf-8?B?dkN0alczK2R0M2VzWlpCb0lNRHZSN1RrS2ZwK3gwQ1NIQ2NyVERKQ3RkbE9F?=
 =?utf-8?B?NEFMRmhLcHg0M1BmMzJCbzVmWllNZ3JzMjhEMHpOK1BRZHl0Y21TbmtCZjl0?=
 =?utf-8?B?RGtEMHJSZFp2QkIxbEZocHdsMk5YNUJvVnVjNDVVeDNmTFIvdHpUaWgwMXdH?=
 =?utf-8?B?ZnMxV1RlL2I3RlNRTGpSMkhXNWtYT2pjQUVSTzV2MUYxN3NrMk5XVkVkTGR5?=
 =?utf-8?B?TU55MzU0Ny9UVXFWbllLR0ZQWk1uVkhKN2xqbDNTZ3FmaVI3alZaY3JmR01R?=
 =?utf-8?B?cUl0bU8yaWhjRnhJUzRDQURDZmQ0MWUyRDBvV1dkTE1JNlAyWG9vZXpHZGVq?=
 =?utf-8?B?UlgvQUc4WW9vWGNYOHVOOWZqaVRtR1grYUw4bU5LTlp0eTZLVGlnWUZPRTRE?=
 =?utf-8?B?d1ZJQnBQdThFYnhLdkxoa0ZwWU1Kb1ozT2RYa1J2cEhMQzMwNlZncXkwd292?=
 =?utf-8?B?SHpiWXV3ekpLbW5SSmF4N1ZseUR6emJZMzR6dGtuQmY3V0V0dHhoZThKQXh5?=
 =?utf-8?B?NmViZFdQZHlJVmh1R0w3OXFpZ3UzZjhKR2J5QVFXc1R5WVEyNFNaZElCUWZH?=
 =?utf-8?B?UVljMFlNWnpYaTVDR1JQRGgwaDlXTGgwYW5JbG05RWVpWjdrZzE5NG00YXpi?=
 =?utf-8?B?ZXZSM1U3WGZEZHlkZU8yK0tWbDhZd3VMU3dCbUlQWW5acTNQWVhmOVJDVnlk?=
 =?utf-8?Q?B3MpflPNI8LfQfD7MuNNJhtql?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3daa385-cc1b-48f9-d66c-08dccc01230d
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 10:14:03.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsFI4oTxen0d0Y/UpFslrtA86p+dBIeaKgzeYp4fX0kyzwNtdc9AtzYSk66M5BxpVtn7sN1T+7OYLTGFyVNNvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5762
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, Jaegeuk,
 I noticed that this commit is not queued in either
 dev or master branch. Do you have any comments on this commit :-) thanks,
 shengyong 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.87 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slQn7-0001JH-Cr
Subject: Re: [f2fs-dev] [RCF PATCH v3 09/10] inject.f2fs: add dentry
 injection
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi, Jaegeuk,

I noticed that this commit is not queued in either dev or master branch.
Do you have any comments on this commit :-)

thanks,
shengyong

On 2024/7/4 10:57, Sheng Yong wrote:
> This patch enables injecting dentry block or dir entry.
> print_raw_dentry_info() is added to show values of node footer.
> 
> The meanings of options are:
>   * dent: means dentry is injected.
> 
> The members could be injected in cp contains:
>   * d_bitmap: dentry block d_bitmap of nid
>   * d_hash: dentry hash
>   * d_ino: dentry ino
>   * d_ftype: dentry ftype
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>   fsck/inject.c | 184 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   fsck/inject.h |   1 +
>   2 files changed, 185 insertions(+)
> 
> diff --git a/fsck/inject.c b/fsck/inject.c
> index 2a21dae..a7d2a2c 100644
> --- a/fsck/inject.c
> +++ b/fsck/inject.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <getopt.h>
> +#include "node.h"
>   #include "inject.h"
>   
>   static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
> @@ -74,6 +75,17 @@ static void print_node_footer_info(struct node_footer *footer)
>   	DISP_u32(footer, next_blkaddr);
>   }
>   
> +static void print_raw_dentry_info(struct f2fs_dir_entry *dentry)
> +{
> +	if (!c.dbg_lv)
> +		return;
> +
> +	DISP_u32(dentry, hash_code);
> +	DISP_u32(dentry, ino);
> +	DISP_u16(dentry, name_len);
> +	DISP_u8(dentry, file_type);
> +}
> +
>   void inject_usage(void)
>   {
>   	MSG(0, "\nUsage: inject.f2fs [options] device\n");
> @@ -92,6 +104,7 @@ void inject_usage(void)
>   	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
>   	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
>   	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
> +	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
>   	MSG(0, "  --dry-run do not really inject\n");
>   
>   	exit(1);
> @@ -186,6 +199,16 @@ static void inject_node_usage(void)
>   	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
>   }
>   
> +static void inject_dent_usage(void)
> +{
> +	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
> +	MSG(0, "[mb]:\n");
> +	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
> +	MSG(0, "  d_hash: inject dentry hash\n");
> +	MSG(0, "  d_ino: inject dentry ino\n");
> +	MSG(0, "  d_ftype: inject dentry ftype\n");
> +}
> +
>   int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   {
>   	int o = 0;
> @@ -206,6 +229,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   		{"blk", required_argument, 0, 11},
>   		{"ssa", no_argument, 0, 12},
>   		{"node", no_argument, 0, 13},
> +		{"dent", no_argument, 0, 14},
>   		{0, 0, 0, 0}
>   	};
>   
> @@ -294,6 +318,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			opt->node = true;
>   			MSG(0, "Info: inject node\n");
>   			break;
> +		case 14:
> +			opt->dent = true;
> +			MSG(0, "Info: inject dentry\n");
> +			break;
>   		case 'd':
>   			if (optarg[0] == '-' || !is_digits(optarg))
>   				return EWRONG_OPT;
> @@ -323,6 +351,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
>   			} else if (opt->node) {
>   				inject_node_usage();
>   				exit(0);
> +			} else if (opt->dent) {
> +				inject_dent_usage();
> +				exit(0);
>   			}
>   			return EUNKNOWN_OPT;
>   		}
> @@ -898,6 +929,157 @@ out:
>   	return ret;
>   }
>   
> +static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
> +{
> +	struct f2fs_dir_entry *de;
> +	int slot = 0;
> +
> +	while (slot < d->max) {
> +		if (!test_bit_le(slot, d->bitmap)) {
> +			slot++;
> +			continue;
> +		}
> +
> +		de = &d->dentry[slot];
> +		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
> +			return slot;
> +		if (de->name_len == 0) {
> +			slot++;
> +			continue;
> +		}
> +		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
> +{
> +	struct node_info ni;
> +	struct f2fs_node *node_blk = NULL;
> +	struct f2fs_inode *inode;
> +	struct f2fs_dentry_ptr d;
> +	void *inline_dentry;
> +	struct f2fs_dentry_block *dent_blk = NULL;
> +	block_t addr = 0;
> +	void *buf = NULL;
> +	struct f2fs_dir_entry *dent = NULL;
> +	struct dnode_of_data dn;
> +	nid_t pino;
> +	int slot = -ENOENT, ret;
> +
> +	node_blk = malloc(F2FS_BLKSIZE);
> +	ASSERT(node_blk != NULL);
> +
> +	/* get child inode */
> +	get_node_info(sbi, opt->nid, &ni);
> +	ret = dev_read_block(node_blk, ni.blk_addr);
> +	ASSERT(ret >= 0);
> +	pino = le32_to_cpu(node_blk->i.i_pino);
> +
> +	/* get parent inode */
> +	get_node_info(sbi, pino, &ni);
> +	ret = dev_read_block(node_blk, ni.blk_addr);
> +	ASSERT(ret >= 0);
> +	inode = &node_blk->i;
> +
> +	/* find child dentry */
> +	if (inode->i_inline & F2FS_INLINE_DENTRY) {
> +		inline_dentry = inline_data_addr(node_blk);
> +		make_dentry_ptr(&d, node_blk, inline_dentry, 2);
> +		addr = ni.blk_addr;
> +		buf = node_blk;
> +
> +		slot = find_dir_entry(&d, opt->nid);
> +		if (slot >= 0)
> +			dent = &d.dentry[slot];
> +	} else {
> +		unsigned int level, dirlevel, nbucket;
> +		unsigned long i, end;
> +
> +		level = le32_to_cpu(inode->i_current_depth);
> +		dirlevel = le32_to_cpu(inode->i_dir_level);
> +		nbucket = dir_buckets(level, dirlevel);
> +		end = dir_block_index(level, dirlevel, nbucket) +
> +						bucket_blocks(level);
> +
> +		dent_blk = malloc(F2FS_BLKSIZE);
> +		ASSERT(dent_blk != NULL);
> +
> +		for (i = 0; i < end; i++) {
> +			memset(&dn, 0, sizeof(dn));
> +			set_new_dnode(&dn, node_blk, NULL, pino);
> +			ret = get_dnode_of_data(sbi, &dn, i, LOOKUP_NODE);
> +			if (ret < 0)
> +				break;
> +			addr = dn.data_blkaddr;
> +			if (dn.inode_blk != dn.node_blk)
> +				free(dn.node_blk);
> +			if (addr == NULL_ADDR || addr == NEW_ADDR)
> +				continue;
> +			if (!f2fs_is_valid_blkaddr(sbi, addr, DATA_GENERIC)) {
> +				MSG(0, "invalid blkaddr 0x%x at offset %lu\n",
> +				    addr, i);
> +				continue;
> +			}
> +			ret = dev_read_block(dent_blk, addr);
> +			ASSERT(ret >= 0);
> +
> +			make_dentry_ptr(&d, node_blk, dent_blk, 1);
> +			slot = find_dir_entry(&d, opt->nid);
> +			if (slot >= 0) {
> +				dent = &d.dentry[slot];
> +				buf = dent_blk;
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (slot < 0) {
> +		ERR_MSG("dentry of ino %u not found\n", opt->nid);
> +		ret = -ENOENT;
> +		goto out;
> +	}
> +
> +	if (!strcmp(opt->mb, "d_bitmap")) {
> +		MSG(0, "Info: inject dentry bitmap of nid %u: 1 -> 0\n",
> +		    opt->nid);
> +		test_and_clear_bit_le(slot, d.bitmap);
> +	} else if (!strcmp(opt->mb, "d_hash")) {
> +		MSG(0, "Info: inject dentry d_hash of nid %u: "
> +		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
> +		    (u32)opt->val);
> +		dent->hash_code = cpu_to_le32((u32)opt->val);
> +	} else if (!strcmp(opt->mb, "d_ino")) {
> +		MSG(0, "Info: inject dentry d_ino of nid %u: "
> +		    "%u -> %u\n", opt->nid, le32_to_cpu(dent->ino),
> +		    (nid_t)opt->val);
> +		dent->ino = cpu_to_le32((nid_t)opt->val);
> +	} else if (!strcmp(opt->mb, "d_ftype")) {
> +		MSG(0, "Info: inject dentry d_type of nid %u: "
> +		    "%d -> %d\n", opt->nid, dent->file_type,
> +		    (u8)opt->val);
> +		dent->file_type = (u8)opt->val;
> +	} else {
> +		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	print_raw_dentry_info(dent);
> +
> +	if (inode->i_inline & F2FS_INLINE_DENTRY)
> +		ret = update_inode(sbi, buf, &addr);
> +	else
> +		ret = update_block(sbi, buf, &addr, NULL);
> +	ASSERT(ret >= 0);
> +
> +out:
> +	free(node_blk);
> +	free(dent_blk);
> +	return ret;
> +}
> +
>   int do_inject(struct f2fs_sb_info *sbi)
>   {
>   	struct inject_option *opt = (struct inject_option *)c.private;
> @@ -915,6 +1097,8 @@ int do_inject(struct f2fs_sb_info *sbi)
>   		ret = inject_ssa(sbi, opt);
>   	else if (opt->node)
>   		ret = inject_node(sbi, opt);
> +	else if (opt->dent)
> +		ret = inject_dentry(sbi, opt);
>   
>   	return ret;
>   }
> diff --git a/fsck/inject.h b/fsck/inject.h
> index 9b14c31..43c21b5 100644
> --- a/fsck/inject.h
> +++ b/fsck/inject.h
> @@ -32,6 +32,7 @@ struct inject_option {
>   	int sit;		/* which sit pack */
>   	bool ssa;
>   	bool node;
> +	bool dent;
>   };
>   
>   void inject_usage(void);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
