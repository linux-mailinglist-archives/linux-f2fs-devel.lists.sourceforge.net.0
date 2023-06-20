Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55973619A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 04:43:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBRKt-00053P-4o;
	Tue, 20 Jun 2023 02:43:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qBRKr-00053J-GQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 02:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lpVY2bCv38IJ/JQIOCgVXORDts9fIMbcLpQg9PARO7c=; b=GMDNU7LJbISpunofXi0gLSQA81
 nxn4HigeH2i/SI7jJZdLSZJ+juLGnJI4l3VSCpz5TCkqYWMlzccBfjqqRdoyNJN8tAJIG51QVTBq1
 NhrJkyZ9iyh8KB76sUrbd4bVCiwIfY/UwIWsQEar08kp84h1nFajnTB3C2Qbhq7M+6gw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lpVY2bCv38IJ/JQIOCgVXORDts9fIMbcLpQg9PARO7c=; b=EbT2HjxCDHL90Npl2OIyrSpPVs
 Wx3WIDqBqJo4FpSLkOygUVnt1T5yEj5qt3B+ngpaXinExXtGtCLUVLkXGUIw9qrMxA5edNkeBsIUs
 S8/7VYo+0VwuRqAX6V7gA1AWK2NlMjU5HjS2o9BWmMK2zYpGWVFM91TPuy+kSitCu9eY=;
Received: from mail-sgaapc01on2043.outbound.protection.outlook.com
 ([40.107.215.43] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBRKm-0004VB-AS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 02:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F++ibHFleDW5bV6Ij9lrUIxPbajWYzk7ePCNFjjlr4bIQOSe9y++/1guFa+XG2JESu3t675Tos4C0d3fy94TJ/pT3UO+o51f6+13DuHy6O3tMxfQIZ9/sPnMaYwZ8lIxag6jOPHlNGPVIiD5Xm5CU/7Rh8SB81i7MN2SRU2ZfOOJ3U4lkKrN7D+ziSp1muok3T7y/XpXJ+CuwEQ4hjiEw8sKzIQs7cUytM2RG/o7UybkCbQuP2YurdnSdiI81eqH9jTFvavG/MmbFLxLlzVCeA9C4+ogxhJ3SYglMu/idGhAisVJcrV7o91JbqzJohHbfLSUoVxCZQj6ORb6EpBEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpVY2bCv38IJ/JQIOCgVXORDts9fIMbcLpQg9PARO7c=;
 b=PYBB9VfmN+q0eUEf0CY1B5Y0dTwEuXVRmp5i8Hw+RpSaFQgU6CgeoWsqMi9v1F6PCHFGcKoy2Kk4jWCkHJJZk6qNMN9LbI9/eMXsUrdRGd6XKi3+7jdAnam/oUj9aN2Fb+rNWK6wa+RUYC4w0NtzxEQ+PveEYrU8pNePaEc7zOBPaFpNA4yb6YlgieEQVYWpZ+e74cLwAmViGubMsOrXH6JX9ZrBEWo1ZzPX8JEVt0kKiZ5wkqOLIOw9xmMGxdwsgbc+z3Jxm/ljEBpSt/OC9apdIA8Pafr6gdzDevdiPcdQzyVY0QeVM9RsDKiEybnPAdOyqHTF5gmggNyTw4+b8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpVY2bCv38IJ/JQIOCgVXORDts9fIMbcLpQg9PARO7c=;
 b=FFv5CSrWcDGfKdEciluMPeC0oRa9YnQe4LkCJkYcddabcCZMdCeerFZ+DBSygB4QkFJi9pAmmwK9+hVidC/844J6RLMZDhBquP6MGqiYBcxJ7WtmTOHMtawMrK6sFBHBlNp9d89tYtQW2zEsFpNQzXqLNX0YSPDktCGMz+estyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by KL1PR02MB4499.apcprd02.prod.outlook.com (2603:1096:820:42::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Tue, 20 Jun
 2023 02:42:58 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Tue, 20 Jun 2023
 02:42:58 +0000
Message-ID: <6c527e97-c4a6-dc58-13fb-516f77e5e068@oppo.com>
Date: Tue, 20 Jun 2023 10:42:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20230613085250.3648491-1-heyunlei@oppo.com>
 <b8523d41-246b-b11e-f6e3-423e32cc597a@kernel.org>
Content-Language: en-US
In-Reply-To: <b8523d41-246b-b11e-f6e3-423e32cc597a@kernel.org>
X-ClientProxiedBy: SG2PR06CA0213.apcprd06.prod.outlook.com
 (2603:1096:4:68::21) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|KL1PR02MB4499:EE_
X-MS-Office365-Filtering-Correlation-Id: c399f8a6-4702-44d0-ebd5-08db71380ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GuWtnUym1vxEhu35WVm1R65JoeaFaOxbOaNCvr1oc0WuXnyzbeQ0oWiJ8zIU0GWRpOPajUv4Q100KdTKFzbWXHz7u5cAuTcKh4rsI6CkG5LQN1Efq8EGO7LFZ3s3WstgxFN3IFD2EgHQxK2KwQQV4a9bHJZiQqRHWMEQHu5BOK4LUDqvUuinxxR2tg8HkrdMTQPA8HHGCeNxnMdd204wq2QHeleOn8St1jvb5aRiDYT3lDLY1g+2giSMvg6FU8B4qdnOdahu7/8Cezl03b/GQX15IOr0utujKhMyNHisoDpyTKiLQINAbxsG+UzwZVFxaX6w78/OKTQqJ1BClFfIIvdakr24B/y604WMJboihZ5mU0raS+2ohqedl+Q/imm1stEKlLfytrJlS+1nKX+qN6iQnhOzsgEPoAjPFFwvxSdewvDm8Ytsfoug5fv+ymL/+ioaFvfrW68m9a5o2QQnqDSmpf160vpy4wV7Nu+JaikHvBfCcMtAFU6VDHWN0+ShHMG9aQSNn8/xs+lWNONmfASDTu2qLQQKBV2apHAlLrZ0+2S15NeIlWQf8fSZ5a8umFAnjCGRMoSn+Cn/llQiLNogANJ+UDEN9WImyMMKTBFPzLdTEz22Owc+LSLbxx4qdmSAqjZZpYWMEIjX6XIiRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199021)(8936002)(66556008)(66946007)(8676002)(186003)(66476007)(5660300002)(6666004)(6486002)(316002)(38100700002)(478600001)(85182001)(41300700001)(36756003)(4326008)(26005)(6506007)(53546011)(6512007)(31686004)(2906002)(31696002)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NCsvV0IxZWIzWXdjNnhORWkzSGloUW4xVC9sTE56N3daNWtWb0RjL0dkRXo5?=
 =?utf-8?B?eitFL3o1SnJzUy9jVWMzRzlhOWZXL1dOTVJBYTFkc2NRM1VickxKWmVxZXdF?=
 =?utf-8?B?cGc1cjlUMkFtTXU2ejdnc3o4YlRpMHB1TVAzc0drakRqM3krR3pLZWQ1SHF4?=
 =?utf-8?B?amF2SDhEclFkMWI4bi80MlA1S0JLdU5HMGxLdHFEV1RrWjVtZDlwYzc5ZDhS?=
 =?utf-8?B?eWhtNDNlS2tDb1U2cnZhcUNveUZLYlR0am5pOGdJMk5zNEhLRFJ1NXkwNTZY?=
 =?utf-8?B?RnZoNWxBUEpWdHo3NFF6RFZzK0x1N0JudVpKdUFKSytzdWJuak1WdkUvY21q?=
 =?utf-8?B?dmpFNWNtelowQkE1TUJRYkFRS2tXTHp1a3NIVDlOMU5qSlczeHgzWTNBOGFO?=
 =?utf-8?B?VU50bDlWRmU4L2pFSXB3YUM5ZGV2OEZGNUJSMm4xa1lLY3Q3UURMZWYxOVVE?=
 =?utf-8?B?U3RMOFBPd2R1TGNyRnFwS2gzckU2VXZ6VHJPOUl1Vng1UHJvZGpFcXhzVHJw?=
 =?utf-8?B?djBTVEZsWEE4OUgzNElzZUR2QldJdmNKYmVWRklkdVNEK1VEb3lrWHVuc3NV?=
 =?utf-8?B?cGRDb25vNWYvRFVsa1ZVUlpIb25pRjFKQ09DTnI0eTBBcWZqY2tGdFh2U2Z3?=
 =?utf-8?B?WjRjazd3ZlNET0xxUHNydUpISWcxTkRmMTF3U2VpWFh4RXVKWXpLQm9vNWRt?=
 =?utf-8?B?eHhTSThhK0tCQ3RlL3RIRldBWHpTL0JiRlYwcEo0c3JQdmdXK2FObU9paXRv?=
 =?utf-8?B?eUM2UDk4Vnc0NkdQSzlUbU1kN092MGE1VjZHNFdtWmdQTHozRDJ1WnVJTjJk?=
 =?utf-8?B?QUl2UlVaSjdQVGI3dlB0WG5naUVnMS9hcGU5Y2Q4YnFPc2RCMDNwejZ5c2tk?=
 =?utf-8?B?S2pJdmloR0FFRkEweXZoWVpFSjViVlRRanc0dWJOWmRvMktzMmhIT0hkT1kr?=
 =?utf-8?B?VXYzMldRaFhWNXBQUS9nVXpRWHJ0OEdJNnJHWWxkbkpJb3dHOHhWRm1EWnhj?=
 =?utf-8?B?bEZPUzd1Y0Nmaks5N255K0V0R0wxbkJCaE5ya3RKZDROK1JtU3ExdDRQR3Bu?=
 =?utf-8?B?NEl1Zlczb0t2VGVkays1TGUwUHB2SW1qRlZNOExHSTErdmppaDU3MCs5SUo2?=
 =?utf-8?B?Rjh6eWdodUhFWkFCbnFJUjZyb1B0WTZNbXFWOFZnNWx4ZklZUjByaWdPdjRI?=
 =?utf-8?B?ZDlQZ0s3bzl4VmlybHFKY0JrYzdoZlZRSTg0ME14aHFSYXBFWGMvMFBDTnpi?=
 =?utf-8?B?TEpqKzM5dis4S0JHZURpNUpGclA0V2NqbkpSSTA2RTdNS0g1ZStUSTlkb1JS?=
 =?utf-8?B?V0s0WVNIZnJmOS9QWVIwZWdsRHVNQmQ1UjVVWVZJY1Z0VnUyRmp1Ums5ZlZO?=
 =?utf-8?B?TUoxZ21NM2pqWmdOYjMzVWZvZHBad1B0emhGcGJoRFVodjFrcTB0RlpFakZH?=
 =?utf-8?B?aXMySkxiVW1ZcGlxOUdsVnQ3TzFPTUM3M1hRZFd5N0VHa2tmaWkrTy9od01J?=
 =?utf-8?B?bXA0NGxKbXhhTUdjRjI1UnhLTTZWRDh1UXl6VUk3UkdyS0dLS3dwQ3RqSCs2?=
 =?utf-8?B?RmNRbUpjc0dWTnlRd2crMkc0cGZPUmZJSGVJZnkxRzlUWEV4cnRPYmh0Zk5X?=
 =?utf-8?B?NTg0NDJKWElRTlIzbFlwMGF3bFIzV3Jma2VWbGxwK2FTMHk4WEdGZms5aG8z?=
 =?utf-8?B?cnhGSlVaVXk0UWJQUU9kdW00RkIyWXRaQVZiUUI0NDdvUG9VenUvZDlqYzVY?=
 =?utf-8?B?VnVPMnRGeGJmcWhEL3hZdDJKVXBQMzRlYTdUdEFaVS93ajBVTzI3bGdoV2NZ?=
 =?utf-8?B?M3d0Z2k5SkRuVDI4aHBPUGEwcjVuMUZMYkErdEVpR2xIczR0bnJ3a21kS3hJ?=
 =?utf-8?B?ZDZGM015cnBDbGluN2JHK25uWHJxbUptQmErUnpNUm82KzM1eDlicDRJUDhy?=
 =?utf-8?B?bk9ta1FuQ01FbzNMT2dKYXp1cndYbFp2TFFhMVAyT2wvcEsxWEYzZ3gvSGRF?=
 =?utf-8?B?ZFp1UDFXN01qajdjM3VCa3owWG9mWnhOY0lWejNSV3pSZGczNk1maHV5ak9T?=
 =?utf-8?B?MlZFdjFMMHRzajVvcVlhS2h5QjlUWmFjSjlKa1dkNEl1dnd6cU55eXZBSDRE?=
 =?utf-8?Q?p4s6OgjYgPywud4y665zDlqD5?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c399f8a6-4702-44d0-ebd5-08db71380ee8
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:42:58.6909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzyJiKJZnv005Rp4hSK3WC/1WLENzRVBCc/hjuGECn24FC3jqdRq3TUWCjhvMvmYfDOM3jWMzQ3NUtyZOcMuJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4499
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/20 8:33, Chao Yu wrote: > On 2023/6/13 16:52,
 Yunlei
 He wrote: >> File set both cold and hot advise bit is confusion, so >> return
 EINVAL to avoid this case. >> >> Signed-off-by: Yunlei He < [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qBRKm-0004VB-AS
Subject: Re: [f2fs-dev] [PATCH] f2fs: not allowed to set file both cold and
 hot
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
From: =?UTF-8?B?5L2V5LqR6JW+KFl1bmxlaSBoZSk=?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?UTF-8?B?5L2V5LqR6JW+KFl1bmxlaSBoZSk=?= <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjMvNi8yMCA4OjMzLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIwMjMvNi8xMyAxNjo1Miwg
WXVubGVpIEhlIHdyb3RlOgo+PiBGaWxlIHNldCBib3RoIGNvbGQgYW5kIGhvdCBhZHZpc2UgYml0
IGlzIGNvbmZ1c2lvbiwgc28KPj4gcmV0dXJuIEVJTlZBTCB0byBhdm9pZCB0aGlzIGNhc2UuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFl1bmxlaSBIZSA8aGV5dW5sZWlAb3Bwby5jb20+Cj4+IC0tLQo+
PiDCoCBmcy9mMmZzL3hhdHRyLmMgfCAzICsrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3hhdHRyLmMgYi9mcy9mMmZzL3hh
dHRyLmMKPj4gaW5kZXggMjEzODA1ZDM1OTJjLi45MTdmM2FjOWYxYTEgMTAwNjQ0Cj4+IC0tLSBh
L2ZzL2YyZnMveGF0dHIuYwo+PiArKysgYi9mcy9mMmZzL3hhdHRyLmMKPj4gQEAgLTEyNyw2ICsx
MjcsOSBAQCBzdGF0aWMgaW50IGYyZnNfeGF0dHJfYWR2aXNlX3NldChjb25zdCBzdHJ1Y3QgCj4+
IHhhdHRyX2hhbmRsZXIgKmhhbmRsZXIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRUlOVkFMOwo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIG5ld19hZHZpc2UgPSBu
ZXdfYWR2aXNlICYgRkFEVklTRV9NT0RJRklBQkxFX0JJVFM7Cj4+ICvCoMKgwqDCoMKgwqAgaWYg
KChuZXdfYWR2aXNlICYgRkFEVklTRV9DT0xEX0JJVCkgJiYgKG5ld19hZHZpc2UgJiAKPj4gRkFE
VklTRV9IT1RfQklUKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
SU5WQUw7Cj4KPiBZdW5sZWksCj4KPiBXaGF0IGFib3V0IHRoZSBiZWxvdyBjYXNlOgo+Cj4gMS4g
ZjJmc194YXR0cl9hZHZpc2Vfc2V0KEZBRFZJU0VfQ09MRF9CSVQpCj4gMi4gZjJmc194YXR0cl9h
ZHZpc2Vfc2V0KEZBRFZJU0VfSE9UX0JJVCkKCkhpLMKgIENoYW8sCgogwqDCoMKgIEkgdGVzdCB0
aGlzIGNhc2Ugd29yayB3ZWxsIHdpdGggdGhpcyBwYXRjaCzCoCBjYXNlIGJlbG93IHdpbGwgcmV0
dXJuIAotRUlOVkFMOgoKIMKgwqDCoCBmMmZzX3hhdHRyX2FkdmlzZV9zZXQoRkFEVklTRV9DT0xE
X0JJVCB8IEZBRFZJU0VfSE9UX0JJVCkKClRoYW5rcywKCj4KPiBUaGFua3MsCj4KPj4gKwo+PiDC
oMKgwqDCoMKgwqDCoMKgIG5ld19hZHZpc2UgfD0gb2xkX2FkdmlzZSAmIH5GQURWSVNFX01PRElG
SUFCTEVfQklUUzsKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoCBGMkZTX0koaW5vZGUpLT5pX2Fkdmlz
ZSA9IG5ld19hZHZpc2U7Cj4+IC0tIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
