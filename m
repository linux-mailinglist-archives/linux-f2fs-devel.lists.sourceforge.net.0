Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCA29E892E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Dec 2024 03:28:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tKTVg-00023v-Nj;
	Mon, 09 Dec 2024 02:28:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tKTVf-00023o-Af
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Dec 2024 02:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bCDUzRc30GCXUQln1RUIK73Gc0ZWiGeQgcm3hQSVgPY=; b=l2RSMVipnjEbz7hsndB6LVhC++
 2e8YC0U8aikQEn99flsSsXlPsVHnYQ5M4/gzOtVILlq52fhmfbR7hF09e2XETJZYy/sE3BItJJBPt
 ggZoZ/kjAQ7NToeLn91HMzNwWKpThfeXPfKhEZPf03taemaXx09DcaSDYF3R8MNvUhrk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bCDUzRc30GCXUQln1RUIK73Gc0ZWiGeQgcm3hQSVgPY=; b=W9m5lnmzQ7bDv0q2aNoo+9267E
 nirlObz7+4rIhzNMDDEX8EejhH/IrCMUO1HAY6WOM9RAIMBlxZMgok87x4YHbhwJtPdaJkglMWCwi
 C0psSyGFYOYUa+7+EsdkziutJnMVTPWRf+F5qVdhw5yQ4uEh9D0AeJS/3uzPLT8OjoTI=;
Received: from mail-psaapc01on2060.outbound.protection.outlook.com
 ([40.107.255.60] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tKTVf-0002Zo-9H for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Dec 2024 02:28:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+MYv04SMpq3E444ZokcRgpP06t+TU7FEazj0Vix1ruiKeNVp4X0pGvoDYKCHClLwe+/FN27S1WW4soWbn2MFG2knF5UIlXEyBE9BGdpnmIvPWK2P89bVLzLm3FiGUDYFQo2vv5g8qnR1jucFb8UVwQ0FXgf2CWf1K/S+bDmVox7rox71KErXrRnpIrHSOA8vTPRZKzz6qyOwvsZtO7TQB8F/a5RTWUqs6RM52E710R2QPAvRkYKJ8Q8fz+PP7pVCO9aS5i8VlEM5uSd/3voG7Jjt+TVXnWweuijHvG+jazfBUW7H5J2+olGbjEuhq+nOuM0K96KeL1qI1twhcmLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bCDUzRc30GCXUQln1RUIK73Gc0ZWiGeQgcm3hQSVgPY=;
 b=TqZJ/tSFNplnkGTY3vpm0ZriZrB0iU6VHo4fYDLgb7D2WeHB0V8CIbelbaseBdZl1qYGZSRRLG3DCYendFY8BaCAZmg2qARpJe6wfZqPEK4mughDrboQ0MqFeb8JpwpfG7s0wgOHLvqswPoPQNgK7iVXjHqnk1U+Wgrept04nPKylK1h/Dg3RK30TR66k2ZH5YJcQZj5jJgTGYwUSPvwk+lRDHL9bIptv2CPy+U7/ykwvA41GXXL/1B8z30zSlrjvW0tQIH752ndxhLkg+xlyM4ifdlx5dPkPB2QkOSG4LxGRAsUfVttXTcl/aS4i2t3LUESyynFv5Rfq7/szjHRxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bCDUzRc30GCXUQln1RUIK73Gc0ZWiGeQgcm3hQSVgPY=;
 b=gh1MOExMQNAEqjvvVpDjhlw4RDt+Y0tGDXKkV8N6dqKBOE8WYU/M8bnd1Z1curfvW7pnBO84rYo/MzWvbIrs10bCbyn0eRKYyzrFTXmQpACpKzf9gfn8hyEDPO6udwf8aXejaoPB4Kc8tbWQ7wcRGzmlH4kGVAhhQUkSfmJg3nY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB5494.apcprd02.prod.outlook.com (2603:1096:101:4b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.23; Mon, 9 Dec
 2024 02:13:17 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%6]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 02:13:16 +0000
Message-ID: <83e3cec7-3f4b-4fba-950b-544ed7c3e455@oppo.com>
Date: Mon, 9 Dec 2024 10:13:11 +0800
User-Agent: Mozilla Thunderbird
To: Lu Pang <panglu2022@gmail.com>
References: <20241205080109.43552-1-panglu2022@gmail.com>
 <7ba0f67f-20bc-4097-9372-7feb45a6cefb@oppo.com>
 <CAOcz8Buo29gGg3bSyDn1MCeAY7qR1UHy5e0zZ+Pv41Weery6+Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOcz8Buo29gGg3bSyDn1MCeAY7qR1UHy5e0zZ+Pv41Weery6+Q@mail.gmail.com>
X-ClientProxiedBy: SG2PR06CA0193.apcprd06.prod.outlook.com (2603:1096:4:1::25)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB5494:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba1f359-8dae-4b4e-d0ef-08dd17f70ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEtFclJjR3ZPQThPd2N0STBiUHNzRFhNSHZhYjRrNDVQWG0xOWJDL21waUM2?=
 =?utf-8?B?ZlAwSndaUFRLdXdHYjFqUmlkdjVrUGVWV1hOTktCc0NIQTJBZTlodG1ZSFVR?=
 =?utf-8?B?b0kweEJUaWFGTEdmeFB1Tnh3djRmamxwSVU0bFA5bFBJMHdYYUVoK2xXNC8x?=
 =?utf-8?B?ZjlKcm5QV1B3cUxZVGpURmRPaFBLZTVLTGFMZy9ZRm1NQ3NBcmlNemo5Znp6?=
 =?utf-8?B?ZmpacmdKaDVKMHVXWmoxaE12aTRtV1F1S3VQOFpzaTROemRBK0FvOGNWZm54?=
 =?utf-8?B?SVBOZjk4RDNJMmF2SUZRZVBIZ0dRVktHM0pQcDBkTkRQQi9XUHZqUE83bGR6?=
 =?utf-8?B?bnlVTUVHQnQ0alQ5OUh3eFNqR0g4NFpmNzlkb3B3enFzOEdETVNUQmpqZ3dz?=
 =?utf-8?B?ZDl6QXNYM0NUQlNWOGlmNHlIZktPUkcyV251SXpqTmFkV0crV09jNks1bFFS?=
 =?utf-8?B?dUJpM3QrUEVFcW9QTWFFUHpDNTVpZGh3NkVKRmFUaGpyNk54UW8yUVNoa3hE?=
 =?utf-8?B?WUszaEtWQUthSmRaMWJaM0l4K0V2anpwY2prS2R6bFVvcTVKTG1vNmpYOWp3?=
 =?utf-8?B?cmp2TzRDeGR1Rzk5eUx2SDZPUEtyMHN5Z0dpN3piTjZYakVVdkExTENUdXBJ?=
 =?utf-8?B?aVkzYmI4V0hWVXB2SDk2M1JKcml2VmNWS3psNWZsaG43T1BreDBJQXVETzh6?=
 =?utf-8?B?SnRQYzlsL0FSQU1mbXI0eGdLM1lLNzU2K29ZRk15WkdIRG8vdDdlaTJLRWsr?=
 =?utf-8?B?ZkJWK0ZtTWRubUt5NzVncHJsdGtUNzVUZS81TkF5cFpwMHlDVUxRU0xsT0pp?=
 =?utf-8?B?Rk1acjVQeXRuVzFGTjArclFPcDM2TTZqS3NKWC93N29qY2tWbk1wOGtIN0hU?=
 =?utf-8?B?OVNweDdYdEVSaThjeThiRkVvSGtmVHlpV3g5UnR2U3JEMElJb3BVUkVPdjVp?=
 =?utf-8?B?SjdNVXpOa0lNNmdQVW9uSStsTTJ5d2ZoKzB4eG1wMURBUUNDK2xPdmFXbk1k?=
 =?utf-8?B?WXkyaVl5cElrVXV1TWNZOGhYYnQzRWxybUFPNVNFTEpibnUvUGhySHlob25q?=
 =?utf-8?B?TXUxQWJWWjZ5MnBlUDBrQVdjaHlxR2NCNmgvNUFLc3BzODFqWHJ3MVV0Y0ly?=
 =?utf-8?B?eHl1S3NnRUdEZ0dIaENza2M0RmFBNEpWTkN5Y3RWTWJoYVpxSUdxQnJRcGth?=
 =?utf-8?B?RXM1T0FrcHRELzNPRS9ZeStCcyt3dUo3UFdIbm8zQlNkN1JZU05NWlhRNEp2?=
 =?utf-8?B?cE9XbzJRV0NGZWRBN1ZpcXE2cWU1UTBSSm11cENxSWxGRVhPWmRPY2pHSjZm?=
 =?utf-8?B?MTFuUzlBWU9vemhCRGphWUE3WlZjL2N6aXFUZnBJZ0RRRHBiUGVKV2hKbGw2?=
 =?utf-8?B?Z2x6Ukpkb1BDNFMxSzR4d1JaUStzUFVDZGpxck05dXVyeXZCYXBUQUd3S3I5?=
 =?utf-8?B?UUJKeGJzYkZZTzFMcUVwbTYyNlZmVktyM1FoTlFGUjFjb0xEU1l3TjBPMSt6?=
 =?utf-8?B?VEIwZVBWaHB3UUFRV29MREZjMVVZbFlpUm1LWDVDM1lXNkdDM0VPZUxQMFYx?=
 =?utf-8?B?UnQzRmVSUTg4V0srRWVpUkF1TnBrcnhYWnVjVEt0VHNZZTltS212b1JWQ3JY?=
 =?utf-8?B?Z2dQeHMwc0txbnZoWE1ZQlZJUXB4TVJRY1VNTDFaa0QvTG5VOUhtSUFlMEx1?=
 =?utf-8?B?UmRpZ1dJdEdrQmV4TXJJVFFvVGRKTjZCeWtFQ0xHN1gxSGNKQlVVU3EwQmtT?=
 =?utf-8?B?aUY3c2JBWDlsanFMemdTQm1VcjJhMnZJKzJqQVhoRm91YzF6UDlxOWE2bGNI?=
 =?utf-8?B?UCtsaUZmdXh6RDhvN2hxdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk1VYUY5SXV4YjNiTDlaa1h0RThraEJtTjRObDd1YzJQcGQ2OFo5ZWN0Mkxz?=
 =?utf-8?B?VUh1TFFSbnFFdVJsbGNZcU5DWTB4ZGIwUTd2Vzc4WnhFd1NvR0trWURIRHhh?=
 =?utf-8?B?ZWI1TXNJWEpMTGplUGZLd2pENVNtWW5MWjNBQjBpTDlwNHcyZUxsMjF2Mm1Y?=
 =?utf-8?B?MmZmbFltZG5qRmwyTDFVRVlGN1prUmhLT3VSOVBvQ25IekVqczJvK09RQkFO?=
 =?utf-8?B?b3BGOUNmeEI0akUxMXhFc0RqVTVTTjZDQ3BZNjUrNkZGaEpFK1dvZW5PczBF?=
 =?utf-8?B?RjlnMHpHSEU2a2d5ZUt0cEVPNEZOVGpGa0lkeFNHZVVVSzJEaXNlRXgzQ0Jw?=
 =?utf-8?B?aWpuNVZMYlRISDlOb1NlRjdHQU5ZaGxJbElxZEZlYmtMUnRNSGtPaDRzN3JX?=
 =?utf-8?B?V2ltZ09kbytZQ1pUWHFHdUpIN202U2dYOUxVenU0NldkNnA2OTVoM1pKcnRB?=
 =?utf-8?B?R3lsVCtCeDk5Tm9XUFVyVUdsTEFhaktXSitRZDRYOE5hNUgweStYVDdWbkV3?=
 =?utf-8?B?UHVHZmZ2bFJLb3Z4NnRnanBuR1hmOVUvUlNtWjJJRnlQTmd3ZjJkdkJOb2xW?=
 =?utf-8?B?R2I4NGVGVS9rZUp6S25vSW5iSG9XWlRJZUV0aFI5WGtIckI5anp3NXlLS09j?=
 =?utf-8?B?T2plQ2NsK1VLd2Y5N0NTWURHMlo2TTY1dnNRbUNiOWlsdXdTcjJYb2FEMFBO?=
 =?utf-8?B?OHlJWC83dDFWQ0hiUFgvQnM2R3RkY1QrUTFEcW0yQk0zSnloaFpxcERwZ25M?=
 =?utf-8?B?R3pmbStxbUQ5RWFacHdBWk1CYkZzeVl5QWJIM3BucUUzME14R2w3ODRLSjlm?=
 =?utf-8?B?YTNxRHc2bWFHOUVoRFM4SXNSeFBZYTFsTWpTQ3dGUGZlcHRCMXczZHhIZUZ4?=
 =?utf-8?B?N0krSGQyeTZFeU9wdXlGRk41Z1FXTEtxenNlTWtrZXhZYmFEZHJTTi9XcGVv?=
 =?utf-8?B?U1ZDZFlMeWFCWjlSK3R6ZmV3d0NZSjdodU94V0JGdEYweHAwcC9QS2lBbUNG?=
 =?utf-8?B?aFV1QWtlVW1yUmxZb1JXVms2aWtxZkllYXZUUnV0VVZOUS9rSnBPK0RMUGN2?=
 =?utf-8?B?bWozMnkveUxOdDJkMmtvM1VLUDJpUlk0bzBMTlFtYit2ZEV4QzdrMUxCS2Na?=
 =?utf-8?B?dENVVUJFNjJFcmduNHY5aDNVUC81dmFXYnRycjBGdlVlMmlTOWpHR1JwVzlT?=
 =?utf-8?B?ZlltZUdJUVJPY2F0dEdpbGJscWNZd2tRSzZqWHpBYmNKakJmMnJRK2t6OWJG?=
 =?utf-8?B?V0tEdFpLVHVrNXdsVFl5TS83TUl0YktBd0ZvWXpsc2h0NmszWWNTbWZJMHZs?=
 =?utf-8?B?OGZLalY4Zi9nL3FKK29KVFg2ZlVJeEpCSkc0aXlGWmdNbHUwem03K1hLUVdt?=
 =?utf-8?B?NHB6Sk5kUHJNbklkRFRrYS9abWxBOUdHUWllUURUSnJQL3MvRllOcnpLT0l6?=
 =?utf-8?B?aEN3ODFOaEJBdjZIaldyNFhCV1lXVVhOSFVlcWgzQTlZYlorOW5RVWJMbG8x?=
 =?utf-8?B?NWhuQlRpdWpQSTZVY0h4Y1lxdzJHRGQ5dGZBQ0QzMUlrQXF0SnlOU2dKcVBr?=
 =?utf-8?B?STJETVA0TXl3cDlyOEZGbFNVY2R5bUUvU2EzTlo1U0tqcDVlQjhLaFpOWDM2?=
 =?utf-8?B?UXNsd0dhak5xSzN1U29HRytjdGJtWFVlWDQwZ0pGZ3djRDl0Y2VRSlRaeUcr?=
 =?utf-8?B?SmpKWjA1TlAzV0Jib05uZUVJSGN4dHpKVFFhREswQjU0ZzB6bG8wcDVGOThK?=
 =?utf-8?B?cGdheDhUano3MzJJKzZ2eTZkdU5BeEhqaTM5eE5nZXFodmtGN2F1SUo5SEo0?=
 =?utf-8?B?V2JGcThnWDhNdEx4SlZkT2dOcnlFdFhXb2NtSUFKZDZ6cGpDajVRVy81OEpk?=
 =?utf-8?B?eVpYaVliRFpESFE4MGxsRmRIcUJWdldxKzJiaW1VM0dnQ3AyQVozbmhPZ0lC?=
 =?utf-8?B?ZmtISWg0ditsZHBKMUJWTk9iQ2MvWVJIaytscGs1VjhPTEJ5Tytldi9LQ2kw?=
 =?utf-8?B?WTVheGsrV0tqTndtZjVldzBaSmtKT1FMa0tIVWlUVG9NM2F3N01XcjdNVnNv?=
 =?utf-8?B?OVgyZ1RrVXJ2KzdVN2Zzb3FCQXJ1ckFHeTE1QmNsZ0N6QWlNL3ZBVDA3aWN6?=
 =?utf-8?Q?oMbCmQ3NVP3cHnDrD/TSyoYmz?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba1f359-8dae-4b4e-d0ef-08dd17f70ac3
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 02:13:16.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8BWkBZkgYGp2Xa6CWVMv2fK/LD5Rm+V56xSr/+9+OpJ6B2uC8mRbOc0Csis+eqjX+LumIswUIm08iV3PPkZJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5494
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/12/6 10:15, Lu Pang wrote: > On Thu, Dec 5, 2024 at
    8:00 PM Sheng Yong <shengyong@oppo.com> wrote: >> It seems that both pread
    and pwrite are not available on windows. However, >> (I think) [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.255.60 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.255.60 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.255.60 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1tKTVf-0002Zo-9H
Subject: Re: [f2fs-dev] [PATCH] libf2fs_io: change lseek & read/write to
 pread/pwrite
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiAyMDI0LzEyLzYgMTA6MTUsIEx1IFBhbmcgd3JvdGU6Cj4gT24gVGh1LCBEZWMgNSwgMjAy
NCBhdCA4OjAw4oCvUE0gU2hlbmcgWW9uZyA8c2hlbmd5b25nQG9wcG8uY29tPiB3cm90ZToKPj4g
SXQgc2VlbXMgdGhhdCBib3RoIHByZWFkIGFuZCBwd3JpdGUgYXJlIG5vdCBhdmFpbGFibGUgb24g
d2luZG93cy4gSG93ZXZlciwKPj4gKEkgdGhpbmspIHdpbmRvd3MgdGFyZ2V0cyBhcmUgbmVlZGVk
IGZvciBXaW5kb3dzIEFuZHJvaWQgU0RLLgo+IEhpLCBTaGVuZyBZb25nLAo+IAo+IFlvdSBhcmUg
cmlnaHQuIEkgZm9yZ290IHRvIGNvbnNpZGVyIFdpbmRvd3MuCj4gSXMgdGhlcmUgYW55IGVxdWl2
YWxlbnQgZm9ybSBvZiBwcmVhZCBhbmQgcHdyaXRlIG9uIFdpbmRvd3M/CgpTb3JyeSwgSSBkb24n
dCBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiB0aGF0IDotKAoKdGhhbmtzLApzaGVuZ3lvbmcKPiAK
PiBUaGFua3MsCj4gTHUgUGFuZwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
