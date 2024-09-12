Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B65976094
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 07:50:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sociW-0006XF-RC;
	Thu, 12 Sep 2024 05:50:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liuderong@oppo.com>) id 1sociU-0006X7-Hc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 05:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b+v2V68K/15FU050IXb5UwMSKK1JZGtmFoZS7JL+r7M=; b=El1HLg5ZvEn+ueH4vtQPFublty
 8Sam7Mj+SR4zzXQhdTgQcY/W0qNFsscaXQXNdXjdaATNoDulIKcwpul3qj84/nsM85b11fLmAmhCN
 iALcsO/x+E7sCmfuwgxD3ZWmJqvGpHxW9WL3+z2p/O0o3Sunn3PMt+sKsZmc8uf7l3u0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b+v2V68K/15FU050IXb5UwMSKK1JZGtmFoZS7JL+r7M=; b=DerFCuPrzmSUPFARd+J95PJX7p
 O4rSabCY+DlZjsippUgDt7OYz03oeZMuGjGIBBeQQL8B167TeR16uaA6869QFuxPIJ/2LhMipTOmG
 cu0PS1AE27g259k9DZKoVYs2SsW8Tal1OhYbZm4VkGQ77jRWPuxg90L++5aC9y9OXmL4=;
Received: from mail-sgaapc01on2071.outbound.protection.outlook.com
 ([40.107.215.71] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sociT-0004lh-71 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 05:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tViSS4whZhMx8BACMxZP+YHVWPySZbns4EnYgaSpyNW31kBWm3UbSQFHD7CMhtpl2JKWhbSHEQmmeUaesLPTo9NHx0+hiNc83g+iVEJzRw2QuLNWfPLITzYxHOplNndMMcfIVJv5EN9fRX5REqxc8oqdzKWxbhfZLdkOt5Ku66Z6jzW9jZYN422L6IRdB83sSiCSFWW+ms2DJa/qVWGHmrd0LYSYIB16n+3QqCYe7WPDLTi+INlODpG2W72l51RAtYPSI8br+Mr+xB1y8arwBjrP17jBGabJSmE9Pj9ZIzJG5zHcZj+sKS/LyRO5SjpUVd4WP4b40IbHwwAMPNDOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+v2V68K/15FU050IXb5UwMSKK1JZGtmFoZS7JL+r7M=;
 b=RmSoksxUrcasWva0FQ2bVzFu4mFi35QGe4D11cDeJS0nvgvcYEuGCU/fAkgWNERHn4BpBN46HU8JL6/3VmF9DJo8FbunVJIQJ2GCuQO7/Em21X4VlEqC72Aw4PDyi7JaV6ITqymYy5TG+npB5TP5MAD1oWfG6cskheeeigCljNAAEC0quywWtpdvgpU9kfiQPPJPnVV1MJgommbT63PZHHXM/CXQ+SF+/lZFmLQ/XrYiufuiFbJ84/o+d97zyFEzhpFCp5X2a/0CjVzoYa3Crs5juvrhDd6bttdkOVTq6XJ7nHdclgYgTDy1mR/B1Z23T6UKMoB5vN+L25viShoSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+v2V68K/15FU050IXb5UwMSKK1JZGtmFoZS7JL+r7M=;
 b=u6VhnOZdYcn49RkvkkkvG4miTQ1iJAhB+WLiumfywLXog4VIvneJ4HqkJzhJn/afffDs6Rs5CbQBwsbINh9iSxVK8jGZs2dPqcxTiKG5IYFC2Ob2chOksa6Uo9zNQpF8RWYDJSUP/Jt/Vgr/pR6pq74a9K8gEfan7i3/fWBmZig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from KL1PR02MB6662.apcprd02.prod.outlook.com (2603:1096:820:105::10)
 by KL1PR02MB7360.apcprd02.prod.outlook.com (2603:1096:820:11e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 05:16:06 +0000
Received: from KL1PR02MB6662.apcprd02.prod.outlook.com
 ([fe80::6e0b:23b9:808d:ccf5]) by KL1PR02MB6662.apcprd02.prod.outlook.com
 ([fe80::6e0b:23b9:808d:ccf5%5]) with mapi id 15.20.7939.022; Thu, 12 Sep 2024
 05:16:05 +0000
Message-ID: <028d6892-f26f-479a-b27e-544d366d27f1@oppo.com>
Date: Thu, 12 Sep 2024 13:16:07 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <1726022421-58677-1-git-send-email-liuderong@oppo.com>
 <1726022421-58677-3-git-send-email-liuderong@oppo.com>
 <56e4e969-12d3-45c7-bb6a-27207ae4bf4c@kernel.org>
In-Reply-To: <56e4e969-12d3-45c7-bb6a-27207ae4bf4c@kernel.org>
X-ClientProxiedBy: SG2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:3:18::25) To KL1PR02MB6662.apcprd02.prod.outlook.com
 (2603:1096:820:105::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR02MB6662:EE_|KL1PR02MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: a857c149-79e7-4b8f-6f4d-08dcd2ea00ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVEwOXphTWowZk01a0RDcVYwenJuMDZqYitJbG5UV0hvbHpnRWNEYUtoRU1R?=
 =?utf-8?B?S2JtRFA5NDlqaHhGRG9SMnJRK0MyRjI1Z3pxMFcyNENhcHdqdDBOanZYUXFH?=
 =?utf-8?B?eTVCQkh5R2p6blNRVzlUYTRLSk1OeHVEL3JWTWVuR0gxZTJ0OE1OOTd6M3hW?=
 =?utf-8?B?UmFXZ09qNUNiMitHbjNtdmxlS0szR3haY0R5RndkeVE1MkNHVHBVOEZMek9W?=
 =?utf-8?B?ZkNoaHN2eUFwRm5tdjc1YThjZDhmbGRuQ1hNM1RwRjVVdnpYOWVPNWxSMkp4?=
 =?utf-8?B?OW9ydDJjM1ZWTGNDYjJVQmREN1hBSndzek8xdVgrUlQzeFRZWWpIUnBjTkpr?=
 =?utf-8?B?c0hhajdpelFBUEgrY3BweXdGZTUyUEwvamFzSjNxVnRqZy9Bc1dvWlVFMXc0?=
 =?utf-8?B?Zk5DWW9iNC9JVEdoVXd3WHZXUCs4TmNtbmNkVVlVaU8rMzdIQy8xcUM1Tzdy?=
 =?utf-8?B?Um9qY1RJSXpMWFNXWG5URnh6dTBHQlUxWURnbStNbVJZQUk1dnBhYWppOFdU?=
 =?utf-8?B?TTlKNVFGNStvV0lld3NyV1VKN3VLQ2E0NG1Oc0pkSjRFbGNLakNtYzV6azFl?=
 =?utf-8?B?dU9ncDN3WGlJK3QxZVpROHNJSzYzK0dNdERmTG9Pb2hpVk5XRXU4K0h6TlRO?=
 =?utf-8?B?d0tQRnRmUmN6R24zbzlvcWJYL2JTbEtoM05UM1pPbnI3cFkvdGhQbWZ3VFYz?=
 =?utf-8?B?UWtEOS9iWnlncDNwSFlUSDZvRXJoVytBVnVXOUxBWXM2YVlUTXkrcXBJak56?=
 =?utf-8?B?ZXh2UXJNZ3MySDVsdDI3TUlHZDVZK2Z6d3FYT0h5TGVtV1lwd3I5amZCSEwx?=
 =?utf-8?B?SmIycktrYzlJQklmcEE3aEUzUWh4Y3Zqb0RQblBxRU0xME5ZL25HSm9vNVVX?=
 =?utf-8?B?RStpcGcyRzIycFZicXNzU2EvTVlaK0RDZWZSZzdqek5MZWNISmtXRGRmbjVs?=
 =?utf-8?B?R014NHZEeHlIMjR6Nmp3RU16eHpjK3JadVdkK01uUmRjN2hLdlMwWloxVllV?=
 =?utf-8?B?b2pacG9XNktabkQ4RnduRDZ5Z0NsWXNhd1BMSGdrTjZ6ci94MFcrSDZpcVUy?=
 =?utf-8?B?SERUM1dzbGh5M251OURzUEUvVkdpWVJDZnQ0bFZRZGgvSzRhWnM1ZEZDQTl4?=
 =?utf-8?B?Y3c4ZUFuZ2hHeHZNdXZackRDMjU0Mmp2eHhlTkhJWVdEbnB5d3o2TXhuYkZn?=
 =?utf-8?B?MEEvZXBXemhBdzBDNE1mejJ2dEszZFNkeUpoUVhuUkc5WjZLQTF1aTk5N2R0?=
 =?utf-8?B?WkNlNUszQTRGajF2dXRaZ3hwbUw1Y3dXbFoxdmRjZGRRTWUwcUloWDVTK2Ji?=
 =?utf-8?B?dEtwaTBlV01tZHRXK2lVR0V5clJjWVdHODRxMEsyd1M1bldnMkx1UmZ2V2NL?=
 =?utf-8?B?MnZGcUhWMEpKSFI3S1lWM0NObHVyWGNmV2s0VVdmSlNUN3piOUgrWXlNU3d5?=
 =?utf-8?B?SkVXVjk1Yzh2eVVJZHZpSkVPWHo5VjdQcmp4ampJZXVxQ3BxNkh2NFErbVRE?=
 =?utf-8?B?YmVpY3h5OExRUkZMbE9OeXVHNkZJZkdlTk1aRHN5YVVCQWNySStCNGFBTWhU?=
 =?utf-8?B?bElnNGZXcDNtNXhTWTVNdWNxSEFjWUZndmtqa1MyNmluZXpQTUpkL1RBVG9J?=
 =?utf-8?B?UnBDamQ2VzVvSmVYSHQzcnhYSFY2Q2lHODlla0VGOGw1YzFOODd5L2RpK21t?=
 =?utf-8?B?cm1iR1FtdDRVbnNDYWZVSDczclVoenRON0VyS3FydWNDM3NLVkdxbFREQ1FN?=
 =?utf-8?B?a0xUQjZoRUE4UXVkMEJLa1dYOE5nN285SUcvMCtsVzlNUDIzRENTQ1JOb2lw?=
 =?utf-8?B?NFV0Yzh1OU9xQ1hjYzlzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR02MB6662.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi96TWxXWUtmS3FGZmlKYzJrMXFpVVNuZFYzM0pYemR1dEl4anpKWXoyeTBR?=
 =?utf-8?B?Szg5K3RYRU1HM0hzdkJKcVBucmV1VzJ2OVhqdm5rVlRZRDBjSzV4V3dIeU8y?=
 =?utf-8?B?OXlYMnlpMTNLNVBkV3QxRnlQNWtYSTRMTEE4Zm9MRWk1V2lJa3R5YW51YlhK?=
 =?utf-8?B?VFRxc0ZXNXpZVkMwZTZIS3dPTnJMRGNPdFBFRDhiT0RmSFdoN0NUVitRZzIy?=
 =?utf-8?B?VnNLVUdTMnNWTFVLVE9DRitJeWNOQTVBOFZ2TC9vNktjeU5od2MvMXNRcGlu?=
 =?utf-8?B?c1A5SUw2ckNvbXl3YzJxcnpQQ3pGYlZzaUE4MHRycml6N1hiVzhZY1UrMnRm?=
 =?utf-8?B?Q0xET2R2aFlpQXk2blJBVENUbDIwTnRnOTFpZ1JWSU5Qa3Q5YTFqV0tMbjdP?=
 =?utf-8?B?bDliMGlMWW5VaE02SnFONU1sdGQvVFpObUo2Y3FUZ2pPYS9zdWdvUDZDSlRm?=
 =?utf-8?B?bnRQWjZ3VFRWUmptZ2NiRlZFSDJhZ2I0Tkp1UitneVMzaWc0WmUyMWphbi9y?=
 =?utf-8?B?ZGZzZG0zMzArNVQ0Z2Y5WUJrRHNiQThxZjkyQzZMaGhmZk5GMENna2pjZ1Vu?=
 =?utf-8?B?bU5SRmZBcHNORmJwMmJBRmRWR2tQZmg3OGg2YzhDeHl2MlQ2Q3EwUUoya1lG?=
 =?utf-8?B?RzRjZDYweWpnd1FwQVd0Sm92bFlnWncyZmt2dkNNbnJVdGN2TnQyQW1ncW5l?=
 =?utf-8?B?OXF4aEk3c2plODl6bXZvbUVEVTJLeFo2ajNrMkYyR2MybjVvdDd4cGtaWWIz?=
 =?utf-8?B?b29EOHdnb0JSREVnd3dzZzVoQlFYVlY2bXF6STRidDhKV0ZYdzhYTmowa2hB?=
 =?utf-8?B?NEFQbDNoam96UEFaak9KdWMwTWRMckR5MDBLRFVtaTN6Vm1LNUtiS0FmZ1J0?=
 =?utf-8?B?U2JuMy9oRlRsRUh2OEEzVmpkRUd5bTBHeG5iVTVoY1ZDckNnUG1nYXN3dWVF?=
 =?utf-8?B?MjBrdFZ3U3hQMktQbW1BbENBN0ZLaVRIanR6SHZUYmhkWExrSm1TN1NhUldY?=
 =?utf-8?B?THAxMS9rbFZGeUFlY3ExZ0lHL0R5LzA2ZG9KWHdReFZTNGdMYVRRNXdHNFEz?=
 =?utf-8?B?Mm9wSTEvUmp2UTN2WFZaQ05aRWhzZUt0L0l5TjJBZkhLN0tocUdLamExb2JR?=
 =?utf-8?B?M0Fvb1lrczVqODNhVnd5U3VHRnBJZTBpd2tKWWlPZklOQ1BpMDhFM21VbnE1?=
 =?utf-8?B?dGZHQTJ5VmFxQVpmdkVDOTl5cVlDRkFjcXhydHJXdHBFajhObmhEVDErZFRZ?=
 =?utf-8?B?S1FTNVJXbFRlTTA5KzRVVkVZbCsyNkRibGxnK3Y5cFBvejA3cHVOdkFIU3Fz?=
 =?utf-8?B?NWNHV0JJVFZ3aGs2L2lZZEFRRGpvemhJa1RrdVFIQUtEM0xxSmtMTnVEK1FM?=
 =?utf-8?B?SXdqaUZtZWtoYmVvWnNFUmc1bmtsd2ZRbHFQMElGUStrakY1Zk50bVhFakQ0?=
 =?utf-8?B?V3NhWmtlWmN4N24xbmdnZXVrcXVxWVI3SEk2WWN3eUlVS0UxRkpsMVlFK05V?=
 =?utf-8?B?Zjdwc2FyQW1MVHBDbnZ2eFdjTVpOcXR5SHM3aW5Wcy9jcjBSYjk5K3JtV2My?=
 =?utf-8?B?RXdhRDh6bmYrbU1PZGhKYVhjVnlMSDVtWTBFSEYwbU9CNXJQNzdhTExxdzho?=
 =?utf-8?B?QkZ5Wnd2ekd2Z1M5V3AzNVovdEpHcnJiTGlzZXROVUVNR1pQM0NCcXU2VGhD?=
 =?utf-8?B?TkNUVGVBWHBacExBOS8wMXcrczgwMlZnbzIxcEQ3WktjSEdDKzFRSlFjVFMr?=
 =?utf-8?B?alM3QXFlUjNJcXpGcEU2STNXazB2NlFVelJteUdMSHkwaHhNVGkxNS9CSEhT?=
 =?utf-8?B?aElMOGNmNWgvMXc3Wk5VSVRYZzlYTldNeWRnWXYvV05iQmlyeEtXNG41SEpX?=
 =?utf-8?B?ZGdjTlVodTFFemF0cTcvK2pPSG9nVzVyMzN2d1diUXA3eFBzejF4eUlPdldv?=
 =?utf-8?B?anUyQ0EvemI4VVVMcUhlNHRnaHo1K2grNUR3UXErZXVJNUlFUysvNzFsVWYy?=
 =?utf-8?B?cnBOWm02bFBNWStSOXVtY1Z4Uko1YTQ2TEFFUXJnUTdMcURYbS9IbGRYaHV5?=
 =?utf-8?B?Q1JxZGp1NENpQmtLaWRjRDR1d2NqUmNEMXhkOEVOcmNJeHphVHBzVkZMbU1D?=
 =?utf-8?Q?ntuHwtgvSkXxF7YQOpTOTHkFH?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a857c149-79e7-4b8f-6f4d-08dcd2ea00ca
X-MS-Exchange-CrossTenant-AuthSource: KL1PR02MB6662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 05:16:05.8365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: er8Az23j7O9Ykvr9UqnH6/i0/2k9bpiRycsWc96oOpZ1x3dWk1VnjkzGLKsWMfIkh9cMEeumCnXMf0OtLmWFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB7360
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/9/11 18:22, Chao Yu wrote: > On 2024/9/11 10:40,
 liuderong@oppo.com
 wrote: >> From: liuderong <liuderong@oppo.com> >> >> When segs_per_sec is
 larger than 1, section may contain free segments, [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.71 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.71 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sociT-0004lh-71
Subject: Re: [f2fs-dev] [PATCH v1 2/2] f2fs: introduce get_section_mtime
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
From: liuderong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: liuderong <liuderong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC85LzExIDE4OjIyLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjQvOS8xMSAxMDo0MCwg
bGl1ZGVyb25nQG9wcG8uY29tIHdyb3RlOgo+PiBGcm9tOiBsaXVkZXJvbmcgPGxpdWRlcm9uZ0Bv
cHBvLmNvbT4KPj4KPj4gV2hlbiBzZWdzX3Blcl9zZWMgaXMgbGFyZ2VyIHRoYW4gMSwgc2VjdGlv
biBtYXkgY29udGFpbiBmcmVlIHNlZ21lbnRzLAo+PiBtdGltZSBzaG91bGQgYmUgdGhlIG1lYW4g
dmFsdWUgb2YgZWFjaCB2YWxpZCBzZWdtZW50cywKPj4gc28gaW50cm9kdWNlIGdldF9zZWN0aW9u
X210aW1lIHRvIGV4Y2x1ZGUgZnJlZSBzZWdtZW50cyBpbiBhIHNlY3Rpb24uCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IGxpdWRlcm9uZyA8bGl1ZGVyb25nQG9wcG8uY29tPgo+PiAtLS0KPj4gwqAgZnMv
ZjJmcy9mMmZzLmjCoMKgwqAgfMKgIDIgKysKPj4gwqAgZnMvZjJmcy9nYy5jwqDCoMKgwqDCoCB8
IDE1ICsrLS0tLS0tLS0tLS0tLQo+PiDCoCBmcy9mMmZzL3NlZ21lbnQuYyB8IDQ5IAo+PiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4+IMKgIDMgZmls
ZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+IGluZGV4IDRkY2RjZGQu
LmQ2YWRmMGYgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+ICsrKyBiL2ZzL2YyZnMv
ZjJmcy5oCj4+IEBAIC0zNzYyLDYgKzM3NjIsOCBAQCBlbnVtIHJ3X2hpbnQgZjJmc19pb190eXBl
X3RvX3J3X2hpbnQoc3RydWN0IAo+PiBmMmZzX3NiX2luZm8gKnNiaSwKPj4gwqAgdW5zaWduZWQg
aW50IGYyZnNfdXNhYmxlX3NlZ3NfaW5fc2VjKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4+
IMKgIHVuc2lnbmVkIGludCBmMmZzX3VzYWJsZV9ibGtzX2luX3NlZyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBpbnQgc2Vnbm8pOwo+PiArdW5zaWduZWQgbG9uZyBsb25nIGdldF9zZWN0
aW9uX210aW1lKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzZWdubyk7Cj4+Cj4+IMKg
ICNkZWZpbmUgREVGX0ZSQUdNRU5UX1NJWkXCoMKgwqDCoMKgIDQKPj4gwqAgI2RlZmluZSBNSU5f
RlJBR01FTlRfU0laRcKgwqDCoMKgwqAgMQo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIv
ZnMvZjJmcy9nYy5jCj4+IGluZGV4IDYyOTk2MzkuLjAzYzYxMTcgMTAwNjQ0Cj4+IC0tLSBhL2Zz
L2YyZnMvZ2MuYwo+PiArKysgYi9mcy9mMmZzL2djLmMKPj4gQEAgLTMzMiwyMCArMzMyLDE0IEBA
IHN0YXRpYyB1bnNpZ25lZCBpbnQgY2hlY2tfYmdfdmljdGltcyhzdHJ1Y3QgCj4+IGYyZnNfc2Jf
aW5mbyAqc2JpKQo+PiDCoCBzdGF0aWMgdW5zaWduZWQgaW50IGdldF9jYl9jb3N0KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgCj4+IGludCBzZWdubykKPj4gwqAgewo+PiDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBzaXRfaW5mbyAqc2l0X2kgPSBTSVRfSShzYmkpOwo+PiAtwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGludCBzZWNubyA9IEdFVF9TRUNfRlJPTV9TRUcoc2JpLCBzZWdu
byk7Cj4+IC3CoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHN0YXJ0ID0gR0VUX1NFR19GUk9NX1NF
QyhzYmksIHNlY25vKTsKPj4gwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGxvbmcgbXRp
bWUgPSAwOwo+PiDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCB2YmxvY2tzOwo+PiDCoMKg
wqDCoMKgwqDCoMKgIHVuc2lnbmVkIGNoYXIgYWdlID0gMDsKPj4gwqDCoMKgwqDCoMKgwqDCoCB1
bnNpZ25lZCBjaGFyIHU7Cj4+IC3CoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGk7Cj4+IMKgwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHVzYWJsZV9zZWdzX3Blcl9zZWMgPSAKPj4gZjJmc191
c2FibGVfc2Vnc19pbl9zZWMoc2JpKTsKPj4KPj4gLcKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBp
IDwgdXNhYmxlX3NlZ3NfcGVyX3NlYzsgaSsrKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtdGltZSArPSBnZXRfc2VnX2VudHJ5KHNiaSwgc3RhcnQgKyBpKS0+bXRpbWU7Cj4+ICvC
oMKgwqDCoMKgwqAgbXRpbWUgPSBnZXRfc2VjdGlvbl9tdGltZShzYmksIHNlZ25vKTsKPj4gwqDC
oMKgwqDCoMKgwqDCoCB2YmxvY2tzID0gZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCB0cnVl
KTsKPj4gLQo+PiAtwqDCoMKgwqDCoMKgIG10aW1lID0gZGl2X3U2NChtdGltZSwgdXNhYmxlX3Nl
Z3NfcGVyX3NlYyk7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgdmJsb2NrcyA9IGRpdl91NjQodmJsb2Nr
cywgdXNhYmxlX3NlZ3NfcGVyX3NlYyk7Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqAgdSA9IEJMS1Nf
VE9fU0VHUyhzYmksIHZibG9ja3MgKiAxMDApOwo+PiBAQCAtNDg1LDEwICs0NzksNyBAQCBzdGF0
aWMgdm9pZCBhZGRfdmljdGltX2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gCj4+ICpzYmksCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RydWN0IHZpY3RpbV9zZWxfcG9saWN5ICpwLCAKPj4gdW5zaWduZWQgaW50IHNl
Z25vKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNpdF9pbmZvICpzaXRfaSA9
IFNJVF9JKHNiaSk7Cj4+IC3CoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHNlY25vID0gR0VUX1NF
Q19GUk9NX1NFRyhzYmksIHNlZ25vKTsKPj4gLcKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc3Rh
cnQgPSBHRVRfU0VHX0ZST01fU0VDKHNiaSwgc2Vjbm8pOwo+PiDCoMKgwqDCoMKgwqDCoMKgIHVu
c2lnbmVkIGxvbmcgbG9uZyBtdGltZSA9IDA7Cj4+IC3CoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50
IGk7Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlrZWx5KGlzX3NiaV9mbGFnX3NldChz
YmksIFNCSV9DUF9ESVNBQkxFRCkpKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChwLT5nY19tb2RlID09IEdDX0FUICYmCj4+IEBAIC00OTYsOSArNDg3LDcgQEAgc3Rh
dGljIHZvaWQgYWRkX3ZpY3RpbV9lbnRyeShzdHJ1Y3QgZjJmc19zYl9pbmZvIAo+PiAqc2JpLAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
Owo+PiDCoMKgwqDCoMKgwqDCoMKgIH0KPj4KPj4gLcKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBp
IDwgU0VHU19QRVJfU0VDKHNiaSk7IGkrKykKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbXRpbWUgKz0gZ2V0X3NlZ19lbnRyeShzYmksIHN0YXJ0ICsgaSktPm10aW1lOwo+PiAtwqDC
oMKgwqDCoMKgIG10aW1lID0gZGl2X3U2NChtdGltZSwgU0VHU19QRVJfU0VDKHNiaSkpOwo+PiAr
wqDCoMKgwqDCoMKgIG10aW1lID0gZ2V0X3NlY3Rpb25fbXRpbWUoc2JpLCBzZWdubyk7Cj4+Cj4+
IMKgwqDCoMKgwqDCoMKgwqAgLyogSGFuZGxlIGlmIHRoZSBzeXN0ZW0gdGltZSBoYXMgY2hhbmdl
ZCBieSB0aGUgdXNlciAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChtdGltZSA8IHNpdF9pLT5t
aW5fbXRpbWUpCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2Vn
bWVudC5jCj4+IGluZGV4IDY2MjczOTQuLmI2M2YzNWZhIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZz
L3NlZ21lbnQuYwo+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+PiBAQCAtNTM4OSw2ICs1Mzg5
LDQ5IEBAIHVuc2lnbmVkIGludCBmMmZzX3VzYWJsZV9zZWdzX2luX3NlYyhzdHJ1Y3QgCj4+IGYy
ZnNfc2JfaW5mbyAqc2JpKQo+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBTRUdTX1BFUl9TRUMo
c2JpKTsKPj4gwqAgfQo+Pgo+PiArdW5zaWduZWQgbG9uZyBsb25nIGdldF9zZWN0aW9uX210aW1l
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4gK8KgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
c2Vnbm8pCj4+ICt7Cj4+ICvCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHVzYWJsZV9zZWdzX3Bl
cl9zZWMgPSBmMmZzX3VzYWJsZV9zZWdzX2luX3NlYyhzYmkpOwo+PiArwqDCoMKgwqDCoMKgIHVu
c2lnbmVkIGludCBzZWNubyA9IDAsIHN0YXJ0ID0gMDsKPj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZnJlZV9zZWdtYXBfaW5mbyAqZnJlZV9pID0gRlJFRV9JKHNiaSk7Cj4+ICvCoMKgwqDCoMKgwqAg
dW5zaWduZWQgaW50IHZhbGlkX3NlZ19jb3VudCA9IDA7Cj4+ICvCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgbG9uZyBsb25nIG10aW1lID0gMDsKPj4gK8KgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaTsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgIGlmIChzZWdubyA9PSBOVUxMX1NFR05PKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gKwo+PiArwqDCoMKgwqDCoMKgIHNl
Y25vID0gR0VUX1NFQ19GUk9NX1NFRyhzYmksIHNlZ25vKTsKPj4gK8KgwqDCoMKgwqDCoCBzdGFy
dCA9IEdFVF9TRUdfRlJPTV9TRUMoc2JpLCBzZWNubyk7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBm
b3IgKGkgPSAwOyBpIDwgdXNhYmxlX3NlZ3NfcGVyX3NlYzsgaSsrKSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qIGZvciBsYXJnZSBzZWN0aW9uLCBvbmx5IGNoZWNrIHRoZSBt
dGltZSBvZiB2YWxpZCAKPj4gc2VnbWVudHMgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKF9faXNfbGFyZ2Vfc2VjdGlvbihzYmkpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJmZyZWVfaS0+c2VnbWFwX2xv
Y2spOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHRlc3RfYml0KHN0YXJ0ICsgaSwgZnJlZV9pLT5mcmVlX3NlZ21hcCkpIHsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdGlt
ZSArPSBnZXRfc2VnX2VudHJ5KHNiaSwgc3RhcnQgKyAKPj4gaSktPm10aW1lOwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZh
bGlkX3NlZ19jb3VudCsrOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQo+PiArIHNwaW5fdW5sb2NrKCZmcmVlX2ktPnNlZ21hcF9sb2NrKTsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG10aW1lICs9IGdldF9zZWdfZW50cnkoc2JpLCBz
dGFydCArIGkpLT5tdGltZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiAr
wqDCoMKgwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgwqDCoMKgIGlmIChfX2lzX2xhcmdlX3NlY3Rp
b24oc2JpKSkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXZhbGlkX3Nl
Z19jb3VudCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdvdG8gb3V0Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdGltZSA9IGRpdl91
NjQobXRpbWUsIHZhbGlkX3NlZ19jb3VudCk7Cj4+ICvCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXRpbWUgPSBkaXZfdTY0KG10aW1lLCB1c2Fi
bGVfc2Vnc19wZXJfc2VjKTsKPj4gK8KgwqDCoMKgwqDCoCB9Cj4KPiBXaGF0IGFib3V0Ogo+Cj4g
aWYgKCFfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSkKPiDCoMKgwqDCoMKgwqAgcmV0dXJuIGdldF9z
ZWdfZW50cnkoc2JpLCBzdGFydCArIGkpLT5tdGltZTsKPgo+IGZvciAoaSA9IDA7IGkgPCB1c2Fi
bGVfc2Vnc19wZXJfc2VjOyBpKyspIHsKPiDCoMKgwqDCoMKgwqAgLyogZm9yIGxhcmdlIHNlY3Rp
b24sIG9ubHkgY2hlY2sgdGhlIG10aW1lIG9mIHZhbGlkIHNlZ21lbnRzICovCj4gwqDCoMKgwqDC
oMKgIC4uLgo+IH0KPgo+IHJldHVybiBkaXZfdTY0KG10aW1lLCB1c2FibGVfc2Vnc19wZXJfc2Vj
KTsKPgo+IFRoYW5rcywKPgpPSywgSSB3aWxsIG1vZGlmeSB0aGUgY29kZS4KClRoYW5rcywKCkRl
cm9uZwoKPj4gKwo+PiArb3V0Ogo+PiArwqDCoMKgwqDCoMKgIHJldHVybiBtdGltZTsKPj4gK30K
Pj4gKwo+PiDCoCAvKgo+PiDCoMKgICogVXBkYXRlIG1pbiwgbWF4IG1vZGlmaWVkIHRpbWUgZm9y
IGNvc3QtYmVuZWZpdCBHQyBhbGdvcml0aG0KPj4gwqDCoCAqLwo+PiBAQCAtNTQwMiwxMyArNTQ0
NSw5IEBAIHN0YXRpYyB2b2lkIGluaXRfbWluX21heF9tdGltZShzdHJ1Y3QgCj4+IGYyZnNfc2Jf
aW5mbyAqc2JpKQo+PiDCoMKgwqDCoMKgwqDCoMKgIHNpdF9pLT5taW5fbXRpbWUgPSBVTExPTkdf
TUFYOwo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIGZvciAoc2Vnbm8gPSAwOyBzZWdubyA8IE1BSU5f
U0VHUyhzYmkpOyBzZWdubyArPSAKPj4gU0VHU19QRVJfU0VDKHNiaSkpIHsKPj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgbG9uZyBtdGltZSA9IDA7Cj4+Cj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBTRUdTX1BFUl9TRUMoc2Jp
KTsgaSsrKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bXRpbWUgKz0gZ2V0X3NlZ19lbnRyeShzYmksIHNlZ25vICsgaSktPm10aW1lOwo+PiAtCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG10aW1lID0gZGl2X3U2NChtdGltZSwgU0VHU19Q
RVJfU0VDKHNiaSkpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdGltZSA9IGdl
dF9zZWN0aW9uX210aW1lKHNiaSwgc2Vnbm8pOwo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoc2l0X2ktPm1pbl9tdGltZSA+IG10aW1lKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l0X2ktPm1pbl9tdGltZSA9IG10
aW1lOwo+PiAtLSAKPj4gMi43LjQKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
