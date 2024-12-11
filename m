Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5B89ECE5B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 15:14:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLNU4-0005BE-KW;
	Wed, 11 Dec 2024 14:14:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tLNU3-0005B8-SF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 14:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J9vo+XYvcsRAtKNToHw3eilYd5SCWnYhG5hgbWuAaSw=; b=ltq7bAwW9A3jX+EfJ7buBSaAh7
 b4sg5vb+n+b1Ys231EZeiYkopvDev42k/uGcaN9IAtDU4vQAAN3e78k2tQ+5IKmntyBGjtuD2jemG
 5IglIJ9OEZKSWoY4tFKMQqH+2hH6wPagG0UO6GKIp81xMBl5oFIdGMddbxISJMCiApsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J9vo+XYvcsRAtKNToHw3eilYd5SCWnYhG5hgbWuAaSw=; b=mU/dNdIAjCBcv87kXX2r+Yw5MN
 UOMNU3f9DAieHOfsN/9W0ERBlrB/NUZyeptshkF3Ij90dtgNkl/k0ayIhd+imaVl/SQp4QpzEosoD
 0MLFxLETQShO9NdKKAIvlsKXGGBTUmQ9QS/qWn+s5pFcH5C++Jpb6Yz/7zOp3WsnVDWk=;
Received: from mail-tyzapc01on2062.outbound.protection.outlook.com
 ([40.107.117.62] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLNU2-0001WS-Nu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 14:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4xyeH/XBQIIwbO8NmZKd55mAYbv1YB2kBCyGs8ucXsy1HSuj2SoeJJq9so1ySSwVJZ9jAdNkkDS5Tto5hUq7z7+baT0QN6z6iTHY/PSqo4mSfkX8mOq9FaCrU9HvzKDDbDKJAIZNp+JFldftpscyQIQdBVlTB+pooDYcoi8zD1M9G1B8PzhpI3i/XXIUj+99+AzGJpszIk3XKbyDbALbwuYcL9YynCjea1UkeZ8iw6fAKEEhjNPtmzFM1UHvrX6ZRVGLceAP7Y3uxjlMZFJpouZjFGxzvDMEtNplz+o3vZIYcSsrKIdsXBlI/ucQcyrXYiCMUdiGtS4VynO97PQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9vo+XYvcsRAtKNToHw3eilYd5SCWnYhG5hgbWuAaSw=;
 b=A0Qk+HoBhxNjWytwPh9moOpioh+GaLpXSJKsXGxejWzlVu8gNgzj3h0v4M4DL8w7eVNvM+Hy55qvUbxiWsJk3O3F9P350jhy7NIwd5hbpVpAb5gfjzbroRxodNS/QXzVWgT4TZpvuNf5En/RonSibogcD6oLknCZRVPgsyKMWQzMwt3LWEs8qs8KvSXCph9qUFZscYAXdc7fkNfhvUMtnygJpCBoFo0bgcNaY9GyKXkRaPhQMhARdMq7yuTLIgktS1Raz2x/4RluEipkvfGhPxIDz8vV4rJ9Gs7gERtpqEahaDnqXSXfUmaSE2sD45uyt9tExwb2AD+AWsv5HD1ZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9vo+XYvcsRAtKNToHw3eilYd5SCWnYhG5hgbWuAaSw=;
 b=q2p3dqCJg6/iSD+BwBxTzDt+/5qqtqC/J0dkU9+tX6FPduyznFbf3MB4JxIstIIG1zsLxiiJeqD51x1/Hkue2nq2waRPiHLYRjivH2ITQ3WPvJJkaT3FPJiy67J04z+QFvkTtAmBo6AtoNatA6EIVnNzCQxzUx/y/k27M/1HpmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SG2PR02MB6023.apcprd02.prod.outlook.com (2603:1096:4:1d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 14:14:30 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 14:14:30 +0000
Message-ID: <17814373-1e6b-47c3-bf7a-f65701924b41@oppo.com>
Date: Wed, 11 Dec 2024 22:14:26 +0800
User-Agent: Mozilla Thunderbird
To: LongPing Wei <weilongping@oppo.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20241211001404.4120186-1-weilongping@oppo.com>
 <20241211001404.4120186-2-weilongping@oppo.com>
Content-Language: en-US
In-Reply-To: <20241211001404.4120186-2-weilongping@oppo.com>
X-ClientProxiedBy: SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SG2PR02MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b84c7e4-df95-47ad-96df-08dd19ee20a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGhBcEdGWEhKUVA0MUdKZHIwZy9xMTBmZWI1MWJRQTBTVnoreFJrUzJlZUMy?=
 =?utf-8?B?NGlpZHFvSjhoS1YwcFdaSWVGdXFPQnRZNDhBb1dQa1hLK3RKYWdSMHBmazZO?=
 =?utf-8?B?V1hjTFFHenJDeFAyVDZIZEZINXdWbTBJOG9hOGpnZFVwMm85ZTExdHh4cmxH?=
 =?utf-8?B?bjd4ZkhDelJyNGxzS2RQRTQ0aDl6Yi9UZzIrb1lzeFBOUnk0WGlDcWhoWGd5?=
 =?utf-8?B?dUR5UWIyT1NYek5DcCtRQXQzL1c3MmxXWkQxV1M0YStJNHllOWJpdGpnT09r?=
 =?utf-8?B?Zld6VUtRQjJqUGxoV1Vhd3ZqSitLTFZIZXJ1dVFya253OE53Ylc5OVlnb1NK?=
 =?utf-8?B?NEQ2L3ZGZFdwTVRGaGtTL3N1YUFlajFvTWh2eTl2TkpGb01uTGVqYmV0T1BT?=
 =?utf-8?B?RnN6N3dhaHRjcFcwcnhtOXY2ZVlrdVhKZDQrQ1FNTHZ5YzY0NkFoVzAzTU1x?=
 =?utf-8?B?WXIzemxWMVZCd3BTSUtEK2UvUFVNWGtUWHMwcEtZUFM4ZkhCSXFxTkNYREVF?=
 =?utf-8?B?Ly8zQXp2RG5pVy9XN2lrMmRqZzVveHRQaDdkZlFhMVNadWZBQmRNVzZTMHhB?=
 =?utf-8?B?OHV2NkNkQmtiU2k5ckFxdDl0cW02ZHRPNlRnNDRjb2RlaVRDVUdieHQrUENv?=
 =?utf-8?B?dzJnZURteWI2a0FRajZxQ2ZaKzBkRU5mYjRlaFl2OTBVazl1anZJbDNUVi8y?=
 =?utf-8?B?NGhxMGp4MCt5NGJ5QkpBQ0FKSDFUbU1zZjVOUHRjaDRPd2xHenM2akJyR29E?=
 =?utf-8?B?Y2FwbzEyaDJxK1cyazRVTmRWbUNxU1RlaHRYR0hNMlZVTU9SZnVwYm1ZQVNL?=
 =?utf-8?B?V080dWdTdGM2aEVUZ3hIWjd1NTJRODJaRmdEa3k4WFRaK3M3YysyRy9wNWxT?=
 =?utf-8?B?WitFUWZ4aDU1bnV2TXoxb3ovNEVKOTRqTk94NFlLMEFUd3UzVkZDWFFMYWli?=
 =?utf-8?B?ekt5Z2lzd0NwcG4yamFxdmFiZWY2dkh4MmR0M0U5MkNTdENQaExvTE9qMVR2?=
 =?utf-8?B?MS9XTU9YTE1PcmErSGFoaStUUldkM3JHakdUNVlrZEdOaHp1M0Nnc3FHU3dz?=
 =?utf-8?B?UkJNWTlyaU5YcGNqTVpJcDExdjJsaVVmMFozNGM4MEZCYkJpUmpVZlVqWVJ3?=
 =?utf-8?B?dldpMUU5QUhURzdBTlJuQjQwVncwOFgwejZ4L2ZmbVM3QlFOMm9QRlprL3Mx?=
 =?utf-8?B?SEpLd0ZVaVV3Q2YvaFVDOWtBZ2tDMTFBTzlkYUVITUNPYkFyVXI5azYzOEZz?=
 =?utf-8?B?ZlB4SkVzRGJxbDRGY1VoS29BSEVzT3YwTXlwckVaL21GTCtTd3RJZ2pUS2l6?=
 =?utf-8?B?RVBSaHNWazE5Wm9xZ1p3VHVNWG9CQ3RQcTJTTm1qZ3BMTkZuSkJKUmZjc05p?=
 =?utf-8?B?Q2F3b1lFVXJIeFQvTlppRnU2MzVvNWZISDRtZ3Zja3p2T2FpaFJ5Yjg3cllw?=
 =?utf-8?B?MEdXM0JKQkNQTlhLaVcxRi9YUkJudGZnSDNJOHVMNmdzTUpSbEV1ZXlGT1R2?=
 =?utf-8?B?UXVseDFNdXdLckU3RXFRZE1JVTNBaUxOV0xPK01ER2hGbFZleXFkMWdhMU1k?=
 =?utf-8?B?Q2duY29USTRqZGlQWFNzdEhxcWtCQXh0dWtvU3pEQWlTZU5HQi9iY1h2R21E?=
 =?utf-8?B?aEJ5NUt0bXY4aHZpUmVJdm9pUGRZMlJvQmZhRXk2UElVTUJIVE9SVXhOSnB2?=
 =?utf-8?B?RlQxZ0lMKzFFTHBTcEZncnRmWEQ2K1RFZmFHQzkzcnN1RXJwUXNLTFpYS2ZP?=
 =?utf-8?B?V24xTG1lMGpsT0NvQmlwR2EvRlpnOHErVnJoMU0zY3NHeEQ0Z1d1MzhEa212?=
 =?utf-8?B?N2NtTHIyZjdnYkdPcDNqdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHFacVhEYmNUYmFZcldob2M3cFNpc2c1UjJkZFpSbmNHUHdTRUlyQ3FKRzlB?=
 =?utf-8?B?TXVQWmQ3SDBUV0ZNekl3Y3lkWjJtRUUwRkRaMEJQUHBQWVdTMjVMdDFING8x?=
 =?utf-8?B?cTV2WmYxMEVmZkJYZEFta0toQkFxV1UzRTh5a2EzS3A4ZGNYTGxNZDdCcHVt?=
 =?utf-8?B?Z0FkditySnFjdm9iOGgwY3UySEdpbC9la2sxVkNBdk5jZjNKaXpWUWVtYUZ3?=
 =?utf-8?B?aGxheE1MalJWTFFlUHV3dXhHbWpKamdDTndsK29TS3BqNEVhY1l6VE1wYWdy?=
 =?utf-8?B?SDZ5QWJQQ09DUWhUK1hGUlM2MmxVQWF3K2tsREI0SzBNejJzczdFcHdJZkJT?=
 =?utf-8?B?bG1qMXRPc1IvWm5mSk53cVFIYTJLZWN5dTEzdEx1am9Eb01ZeHZpaVY1R3d2?=
 =?utf-8?B?WVdwUjBnNW9UYzM3MTl4Zno5SW50MjNuUG8zVEQ1Q0M2bnZjNFY5K1AyalNK?=
 =?utf-8?B?bDZpUnV1Rzk3bGYyb1RLaEJRRzUxWWtyUGlHS2Z1cGlLQ1A4OU5DMFMzUTdR?=
 =?utf-8?B?RDg4QmNTVGxLSVIxZ2tITi9BTzZ2NWZ3RHZSZHFzUmFuYzBRQis2d3FtZjdz?=
 =?utf-8?B?S1poWGVQaGUrSjdnSnRTVzdaNi9iajVjWVRXNlBkT1ppb0NlWW9aU3pOekdz?=
 =?utf-8?B?VTBBMnFWNWgvekVHb0tHRmNjUSs2U3dXamZiS2N2WXZzdjA2ZFArWXh3d0lk?=
 =?utf-8?B?NCs1Q0VNbEQycjJDSm9BbEZYVUtVamtyNGhVWnNLRE00U3FXSkY4YjlNdk0r?=
 =?utf-8?B?SlUvZ0xLUHpSUU1Fc2w0UjlmbGVFTHc1VGROckRTdzd4N01JZ09STjNMV0NS?=
 =?utf-8?B?TWxiR3c2Ny90RlRrVnh1VUpvalVFZ0haU2VjeDBRQi9Fd212cEJQWmxaYUcy?=
 =?utf-8?B?VDcwN2c0c3kwMVBuWmRDTXlZWlJKSmFwUUVWT24rTDBWKzhzT2wrRCtYR0hQ?=
 =?utf-8?B?UExsNDRzWUIxcVVxNE9wVzVQMkx3dFZpSGltTi83K01HTjlheS9ZMXozd0JX?=
 =?utf-8?B?TElyM1VVbFVsNjBkQlprVWNjcVNmVEVqbSt6d1FHa3lITzRlTEo1N1ZsTEc2?=
 =?utf-8?B?UXZZTTlaSHd0ZS9kamE0YkR6R3BBRkczbmFjWUtqRzREUnF4dFlnbjNKMHRa?=
 =?utf-8?B?SkRDdWFrSCtqemVvOWNxdFZNT3REV3RBWERJZkNoK08yQXdYaFJEdlNOT3k4?=
 =?utf-8?B?RnhIenZpTE5Ga0hUUmZvWStJNGVzVnRPbE9jV3prSEJXckVNcHlIVmV6R0ta?=
 =?utf-8?B?a2FRdEJxVDRtcTIwN2VYeWpaRGtMbHp3Y3NaT0J4SFBNR0hWenFwMTI2ckZt?=
 =?utf-8?B?bnI2YkpvczQ5QUlFVDlja2Q0My82Z1lVaTdSR0dyRFRqcE1qbFc0TGhmMW9S?=
 =?utf-8?B?STB0OC9aekdoaUpITk9vK2orRW1qL3FQbTJLTTlMaTEzMmFIRnh6UzAydXlO?=
 =?utf-8?B?OWcwcHlyNkszRFlHRzlOejg4N1lvVVpqVEJ5aXNFcE1aUXVheDNBR3drN2dp?=
 =?utf-8?B?am4raGlqdWNjQUY1RVVqMjJCZVNkdjNsRW1GNzVSQnd6RFQ2VnhxTmFjaUs3?=
 =?utf-8?B?RzZmTHNpVGpvbURleE5pdE9JMGwvYWIvUTFmT2U4K2lhRUIvQnRDb2RsVWhr?=
 =?utf-8?B?bThUS1ZBMVpDcldTU3ZTbGg1anJjRkRtbzh6aHNQVUFLbit3aVU2aWZsWWRT?=
 =?utf-8?B?UmFROUlVNE5Qa0xWRkQ2b1p2MGtGTlJRKzNyUm01NEdBTWdQSnFHeDFvRklL?=
 =?utf-8?B?aDFTTTlia1VJcSs3VVB5YzFkcmZNQjFPaVNFUjlqVWRqRHFoUFdyU1RjTnBX?=
 =?utf-8?B?THQydzAxUHVBSTNzVzdOQm1tcElzVlJhdFZkeUgzeURLblRrbnVGdkJpN3Bw?=
 =?utf-8?B?aHJVa21sT3BUeG9DQ0tOY1MyTlJudEJOVTFUN2Q0eGRkbVlDQ1lUL2M0ZUJj?=
 =?utf-8?B?R0JRVWtDZFZETVNkTXgrR2I0Q3dtVmdrcncwUGM2NWdFTmVGV25wUzNqZTRp?=
 =?utf-8?B?U2tlaVRXSE5VLzJRQTJqVWRCRGFhalVKakRFd1dMcEFzOHZxRCt2MkUzZ0Iw?=
 =?utf-8?B?ZHFQSlBtcU5reEVFT1B6c3d6eVloUEprd01zVFVMMkxyT1FyZ2pIVXV4dE5E?=
 =?utf-8?Q?hNhv1zrLNLT2XSpFa2479ffUe?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b84c7e4-df95-47ad-96df-08dd19ee20a5
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 14:14:29.9254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VCBcZzardesbVReSnt/7VrbxZKWESIf2CfFAw5qABJqzLnIpq2yTZPWXa9vQ8LP29Z0kyRhypTqI5HTKoO6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB6023
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/11 8:14, LongPing Wei wrote: > This patch will
 enable pread and pwrite support on Android platform. > > Signed-off-by:
 LongPing
 Wei <weilongping@oppo.com> Reviewed-by: Sheng Yong <shengyong@oppo.com> 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.62 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.62 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.62 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tLNU2-0001WS-Nu
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs-tools: add HAVE_PREAD and
 HAVE_PWRITE
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
Cc: panglu2022@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2024/12/11 8:14, LongPing Wei wrote:
> This patch will enable pread and pwrite support on Android platform.
> 
> Signed-off-by: LongPing Wei <weilongping@oppo.com>

Reviewed-by: Sheng Yong <shengyong@oppo.com>

thanks,
shengyong


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
