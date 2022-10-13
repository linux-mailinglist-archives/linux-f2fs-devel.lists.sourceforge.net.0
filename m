Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504F5FD37B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Oct 2022 05:14:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oiogJ-0006PO-7c;
	Thu, 13 Oct 2022 03:14:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lvgaofei@oppo.com>) id 1oiogH-0006PH-Og
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 03:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=in+tJ8rNMtUiYGluPT0OsnNtdHjVYrllAZkSj62XMOg=; b=ixQZxDHLLurSKlcse5MremxU8K
 iRCWdDZnIU8aBS96eoQxbzwqY7BFVJGjcj0+CZSuhbsDTMewldd4VoNrq8s5uumndinlfDf+SQudH
 7ouvX9hp35SOQWHQzRhMMYZee1KHOUv1pGVIzSYIA/VJ9Wce3vrIO6apI6MJYWRG6kQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=in+tJ8rNMtUiYGluPT0OsnNtdHjVYrllAZkSj62XMOg=; b=S
 8kAFSw65TLUF4ul8zwfYvTp/us1KmZFjVALkoIJ56CUsvsinAXrMd1MpjYyz4UfWyACiiwhS5epdN
 OE7kS4Qga2bpaOh5TDo3SkB2Q+9Unc8iaXphe43a0+1mvFSrEla32zSEObLzgI4xT6a8WUFcxSjwq
 pMBlIbINBOgSpZoU=;
Received: from mail-tyzapc01on2054.outbound.protection.outlook.com
 ([40.107.117.54] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oiogA-0004NX-NT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Oct 2022 03:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp4fVp1WoMEoPWSh6hvlwxDoztVl/jFxsSVnk9pYSDUXvVyVRCqTBC4yE/0BDPjm4jAHD8FkP75yCi34ejKuP7hj8SvcxuIrD9iyEsGaKQIhbDu8KpEYh+Mcord89p3FpnsbwwpFYkEdhouHT1RvsnGOIbqFtKRgswXkqMwt9ESbYuX9bKkvt2T3CoEXP4tXi/wujcw9FXCgCiVEjbdVL3zCGn78+ojacNNMuUfP3yPfVOvsH7AhmGVv1ood2jjPcqoH6yEcQjiHZPVZFX6tUVGfSEx/3BETf9m5pkP6F7/V3gGtjWpGjRJEZPE9QvRSmM1rneVPRpe8gVrDUestcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=in+tJ8rNMtUiYGluPT0OsnNtdHjVYrllAZkSj62XMOg=;
 b=EwG9xAYrO5DX6u5bXCUn1WT7LX69R72H7TTNX4Ei4N5xvUMpHJ6N6SelL+B4/R7S3yfphE56vksgpPZV7fRU36qEw/Mf3uz/VIjQO5Ndr2vPUPiFCapd89G+l9G+Vp6QK0gYCm8x8d2RWilsq7PBQ7hvVnNfR4dylUqHzW6cjN4hDlU6GdDe+RAu6mSE3c2IPZ8BAUAeoRJn0pUyNUBw5wV4NHcQQN9rpE01sg62ICYH/jLqsOw10EVsVmGA7iZz2hDSVz0YmqhJ3iY19BpMr5l2+DXjmBtlAk9IjaN/yQfbIxierURo6S6siF684G3+LKHiOUMrzzgNqP07aZps4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=in+tJ8rNMtUiYGluPT0OsnNtdHjVYrllAZkSj62XMOg=;
 b=PCsCRk4Rj2EeH9VNcDOtrLE436kicxPfQPoZ4k3/nZ7xiVNhx5RrV/Y3Go4hGfvtCYXIjddNR2FjezozsSp07tqB02AuHY8iLa3M16ROizWBr+fRwwDjDHKyvongMnT+YTEJ1skzxA/XK7aMSIM+avdptERBSukgCxBrFYmrZtk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB6007.apcprd02.prod.outlook.com (2603:1096:101:7e::10)
 by TY0PR02MB5527.apcprd02.prod.outlook.com (2603:1096:400:1bd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 13 Oct
 2022 02:39:59 +0000
Received: from SEZPR02MB6007.apcprd02.prod.outlook.com
 ([fe80::3402:acf8:13e7:9741]) by SEZPR02MB6007.apcprd02.prod.outlook.com
 ([fe80::3402:acf8:13e7:9741%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 02:39:59 +0000
To: stable@vger.kernel.org
Date: Thu, 13 Oct 2022 10:39:34 +0800
Message-Id: <1665628774-388896-1-git-send-email-lvgaofei@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SI2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:195::19) To SEZPR02MB6007.apcprd02.prod.outlook.com
 (2603:1096:101:7e::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB6007:EE_|TY0PR02MB5527:EE_
X-MS-Office365-Filtering-Correlation-Id: b3734058-fc71-46d3-4cd2-08daacc4387c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tis22jC6wRfC7/g+Cn2S+EpY+a7geYT609+BeE64aPzp8q4SanpjB3R2FcQwNoLaTfMc+AVS+YKQe5kFW2DKMkBwyXq+mHhuqrL54x394DlzzOs6jTtTBVKgb6dBSsUi09i1+IbgO4fFj5JEcMKckqpnmNU5uubce7TmMY9I532EStsbp+9aegYozwvOHiNeDC/3JbD/acsMt/D/jYVczONo6zozK9F8eocMvIf5nV2FKmqj9mZchN/WN57Dph+YuZLtosY3mxZD5p+CAUdmXmyLj29/pcRa488KfmLpms/p2KhOaJalCmuhmJvi61N74VRH+osMQoN1l+r/8uPRsHukD62lU+8TNJBrt5qofi70cw1ujsTmzlFHJPCnSUTd6lGiDnbm+vWrdfZh7r5PYc+N3/bVS3W8wssoj0uvodpLLSCmj9eRV0mGmVBRBCLKE1nMTb1ySNb7hf+rpX1Q7j1sB320s9znQo2wRW2Oe1n7VhxtvtPqvU41OMtACKT4Go7bwU0m56no8K1kjkMxmkl8T6Tj2BrhHxH+3Xp7Hb2DzroqU+e9+90zn1/mSXV2K/z/JOei8iE1c5KUxZTjmix1wsHPg7mPG9eayZ4TaT2IPenBE6+BNi4oNNreb+/ZGhettXLU7WNN3SxMBnZ9Y35m1HPZXybKlFycvcpS7qGZW4+maNpWRvXxPMrLN47B2FxXeajIJQdtQ6faQUm05kiqhzdcAR3xeXM32e3Z6L9oOIkqYrxj7ej7xDiIr7qt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB6007.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(451199015)(6916009)(316002)(2906002)(8936002)(54906003)(478600001)(6486002)(2616005)(36756003)(86362001)(38350700002)(38100700002)(8676002)(66556008)(83380400001)(4326008)(5660300002)(41300700001)(66476007)(66946007)(52116002)(6666004)(6512007)(6506007)(26005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXRGRGx4blBFbThOQ2FmRW1tWUFRZE5PaFFLc0J6a2xZV2xWa1BiOTRWZXc0?=
 =?utf-8?B?SjdXVEJyVU9XSVhoM0hJNG9TR2YvK2tkOEZvTU82eUpqZFlsV09HaXZQdmFi?=
 =?utf-8?B?Y2VNdmRFN1dWckVFRFVWVG1xekMrRjAwTy9KL0RTYUY2SWRKc3NTa2lWK0Z6?=
 =?utf-8?B?V3grWmMwN0dmYU5nZDVMVmtxL0xDamRaMDN1MGdtT3lYU3ovbG1MUUsxSXV0?=
 =?utf-8?B?M0E0ZXVlMDd1TVpNc0x0a3EzU3ozM2I3YzNVdlNtQ1d3cFhNMDlIbnFFZkNP?=
 =?utf-8?B?S0E5dXFldk02WVVxSkpqZUhoK0thcWV5NlpuN1RrM3B6ekk5b1RnclB1dzhP?=
 =?utf-8?B?aXFNWFlaSEtvRmNaQlpNb21oYmdZSjBocFlWR21BejBXUjV1cFNoVkRsMUd5?=
 =?utf-8?B?NTNSdmVTZWtDb1hYSkhIb3AwWnhIQ25CUUJ2dGdZSXBhMC82N242bWkzbkUr?=
 =?utf-8?B?ejh0aVRZYllZb3NpN2F1ZG1uQWwvdEYvck5pdnA4aFZUenpoeU1tSEF6VU14?=
 =?utf-8?B?L1BuMmRtaGJuS0V5ZHg3Qm8zZmNGQU5oWVdFRVQxTytqYzlKVnVzcE9Sb0U4?=
 =?utf-8?B?RkR6TkltaTl2UjhaMFBQVjF1NDN4akdMNStxOS93VFI0V1NscnczN0RHemRC?=
 =?utf-8?B?RmE4dFdCOHVUdTJ3eXdrK2QySXFFTUcvZDhhTTZzYjNvRnZ5S28rZVliRExs?=
 =?utf-8?B?c05IN3R1S0hrVEZFR3lHeWNkV2xFV1h1T3k0VHJVbDd1NU9aNW5ZbGM0T0sw?=
 =?utf-8?B?Tm9tMFZlSkpwblJFVUsveFlsYlVTRmJCRVk0RUZiQ0JwK0pPTFAyRDF1ZHZB?=
 =?utf-8?B?ekpsRk1wTWVGTjJZc1o5R29pblJ3eWlIVk5LYTNkTDVTNUQvVkUzY2xINXJI?=
 =?utf-8?B?U2ZHVk41RXBxc3M1QUdaTFZwdmp2ZFFtcm0zcG50WERraVVFdjgwajZZRzZM?=
 =?utf-8?B?SjVvMzF3WlZnZ3dqTDQ1aE00cXVPNS9ZWXBZNkJlZmM5MnlZQUFNcDR3cnhW?=
 =?utf-8?B?Q00vVmVqMmo4VkZZczU5QTJNdnY4bjZ5ckhJY3IwWnNHMVJsTzl0RVUzaDMx?=
 =?utf-8?B?RFRxclJqb0c5NWF0b20vVHBsK1R4bXdFZXR4RldLV0tsdmNRTmhHOVBEV0s5?=
 =?utf-8?B?WkRFN2UzRDBPZVR5ZVU0Smx3NlRrRko0S3ErQ2JkVmNZdmxKK0JUWHNiQldw?=
 =?utf-8?B?dnNsYmM5aDBnVlNMRWc5T1V4ak15QVVGYWpOekZ1N2NQbzJQU2xmQVl4V1Ar?=
 =?utf-8?B?L1o4TWNFbzdhS2dXc3REWjhqNFB1eldpbE0xQzV6eHp5RXpjZG80a1owRnpj?=
 =?utf-8?B?Q3pZbjRpUjdFaWE3bUptWEFyZm9rUjFvbXdnRnlkRDNNTjJwTFY4dXZrUkxp?=
 =?utf-8?B?TDdZNUYxaTIyZnNlcEFEaW0rSDNMNGl3K3pYektWa29MZkE5VStxN2pzRmho?=
 =?utf-8?B?TDVJYjV3WmRnenlQU0FRVmFhcXprTm9sRFdGT0lhMVlkd0RxUkJHS3BxK2Y5?=
 =?utf-8?B?SnJQVlVNdExCa3pKcGJDV0RCbjFGVERqWmhVZXkwaE5YOGpsR0VIOTdrVHBz?=
 =?utf-8?B?ZzJja0RGWUxHNnM4MUhuZFA2RGZNVDB5UWgxYWUyV2xYbzE5SmxjdUtwK05n?=
 =?utf-8?B?VkFUbFBmUkVHaklTMUhoYnJKRjFRcFhWUm12MEJ2TU9oOEt4RUlkN2ZhbmtC?=
 =?utf-8?B?M0lzNkF0elpLa2ZkTTE5cjdPSUw0WFROWHFEaXk0TlJMQlQ3R1hKM3BHeUh5?=
 =?utf-8?B?SVZvUS9FeU5LOWZjSXdsTWx3K1loLzgrV3U4b2VzRlhKbmtKVDYxaFlNK2U5?=
 =?utf-8?B?UTdjTkJrTDRHYm02L3VKZHhYbjhsbU5RU0xrYW1JMFU5RXoyNktBR0x1dmJw?=
 =?utf-8?B?WWFDYloyQk9BajJXcUVXcUw4bm5hd3B1aGhpOGsxY2NySkcyVUdhOTZTdVhI?=
 =?utf-8?B?MTRhUXM4UTVKdzJJUE1Fa1VndWh3UWFQQmVhTXpnVk1oMVB0RHMyejNvWER6?=
 =?utf-8?B?VHZrVEU3QTRmeFhQTlB0VDl1aWxFaFZRMzloSWVMY1pxNGRzMUhsUmpkS0Zz?=
 =?utf-8?B?TFRtdDVGdG05TzlPUDN3bFFZblIwVHpxVkxTWDBqZG1MOG9NbmxGUVpDUkta?=
 =?utf-8?Q?Mxd9zUDdkR2bDAHhbrPHE1fXt?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3734058-fc71-46d3-4cd2-08daacc4387c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB6007.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 02:39:59.0396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jH5ZQmBk9r8Sydbhdyq+9xqOlZLPf/ofDGrfPK3SW6PhjEe3O1xJEgGnUtARyp/YC4QI2JEqukZT4Sd1oQojNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5527
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: BACKPORT: f2fs: invalidate META_MAPPING before IPU/DIO write
 Encrypted pages during GC are read and cached in META_MAPPING. However, due
 to cached pages in META_MAPPING, there is an issue where newly written pages
 are lost by IPU or DIO writes. 
 Content analysis details:   (0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.54 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 FORGED_SPF_HELO        No description available.
X-Headers-End: 1oiogA-0004NX-NT
Subject: [f2fs-dev] [PATCH] Cherry picked from commit
 e3b49ea36802053f312013fd4ccb6e59920a9f76 [Please apply to 5.10-stable and
 5.15-stable.]
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
From: lvgaofei via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: lvgaofei <lvgaofei@oppo.com>
Cc: Hyeong-Jun Kim <hj514.kim@samsung.com>, drosen@google.com,
 lvgaofei <lvgaofei@oppo.com>, linux-f2fs-devel@lists.sourceforge.net,
 jaegeuk@kernel.org, gregkh@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QkFDS1BPUlQ6IGYyZnM6IGludmFsaWRhdGUgTUVUQV9NQVBQSU5HIGJlZm9yZSBJUFUvRElPIHdy
aXRlCgpFbmNyeXB0ZWQgcGFnZXMgZHVyaW5nIEdDIGFyZSByZWFkIGFuZCBjYWNoZWQgaW4gTUVU
QV9NQVBQSU5HLgpIb3dldmVyLCBkdWUgdG8gY2FjaGVkIHBhZ2VzIGluIE1FVEFfTUFQUElORywg
dGhlcmUgaXMgYW4gaXNzdWUgd2hlcmUKbmV3bHkgd3JpdHRlbiBwYWdlcyBhcmUgbG9zdCBieSBJ
UFUgb3IgRElPIHdyaXRlcy4KClRocmVhZCBBIC0gZjJmc19nYygpICAgICAgICAgICAgVGhyZWFk
IEIKLyogcGhhc2UgMyAqLwpkb3duX3dyaXRlKGlfZ2NfcndzZW0pCnJhX2RhdGFfYmxvY2soKSAg
ICAgICAtLS0tIChhKQp1cF93cml0ZShpX2djX3J3c2VtKQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGYyZnNfZGlyZWN0X0lPKCkgOgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtIGRvd25fcmVhZChpX2djX3J3c2VtKQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtIF9fYmxvY2tkZXZfZGlyZWN0X2lvKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBnZXRfZGF0YV9ibG9ja19kaW9fd3JpdGUoKQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtIGYyZnNfZGlvX3N1Ym1pdF9iaW8oKSAgLS0tLSAoYikKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLSB1cF9yZWFkKGlfZ2NfcndzZW0pCi8qIHBoYXNlIDQgKi8K
ZG93bl93cml0ZShpX2djX3J3c2VtKQptb3ZlX2RhdGFfYmxvY2soKSAgICAgLS0tLSAoYykKdXBf
d3JpdGUoaV9nY19yd3NlbSkKCihhKSBJbiBwaGFzZSAzIG9mIGYyZnNfZ2MoKSwgdXAtdG8tZGF0
ZSBwYWdlIGlzIHJlYWQgZnJvbSBzdG9yYWdlIGFuZAogICAgY2FjaGVkIGluIE1FVEFfTUFQUElO
Ry4KKGIpIEluIHRocmVhZCBCLCB3cml0aW5nIG5ldyBkYXRhIGJ5IElQVSBvciBESU8gd3JpdGUg
b24gc2FtZSBibGthZGRyIGFzCiAgICByZWFkIGluIChhKS4gY2FjaGVkIHBhZ2UgaW4gTUVUQV9N
QVBQSU5HIGJlY29tZSBvdXQtZGF0ZWQuCihjKSBJbiBwaGFzZSA0IG9mIGYyZnNfZ2MoKSwgb3V0
LWRhdGVkIHBhZ2UgaW4gTUVUQV9NQVBQSU5HIGlzIGNvcGllZCB0bwogICAgbmV3IGJsa2FkZHIu
IEluIGNvbmNsdXNpb24sIHRoZSBuZXdseSB3cml0dGVuIGRhdGEgaW4gKGIpIGlzIGxvc3QuCgpU
byBhZGRyZXNzIHRoaXMgaXNzdWUsIGludmFsaWRhdGluZyBwYWdlcyBpbiBNRVRBX01BUFBJTkcg
YmVmb3JlIElQVSBvcgpESU8gd3JpdGUuCgpGaXhlczogNmFhNThkOGFkMjBhICgiZjJmczogcmVh
ZGFoZWFkIGVuY3J5cHRlZCBibG9jayBkdXJpbmcgR0MiKQpTaWduZWQtb2ZmLWJ5OiBIeWVvbmct
SnVuIEtpbSA8aGo1MTQua2ltQHNhbXN1bmcuY29tPgpSZXZpZXdlZC1ieTogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwu
b3JnPgpTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYt
Ynk6IGx2Z2FvZmVpIDxsdmdhb2ZlaUBvcHBvLmNvbT4KKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21t
aXQgZTNiNDllYTM2ODAyMDUzZjMxMjAxM2ZkNGNjYjZlNTk5MjBhOWY3NikKLS0tCiBmcy9mMmZz
L2RhdGEuYyAgICB8IDUgKysrKy0KIGZzL2YyZnMvc2VnbWVudC5jIHwgMyArKysKIDIgZmlsZXMg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwppbmRleCBiMjAxNmZkLi45OTRhMDllIDEwMDY0
NAotLS0gYS9mcy9mMmZzL2RhdGEuYworKysgYi9mcy9mMmZzL2RhdGEuYwpAQCAtMTcxMyw5ICsx
NzEzLDEyIEBAIGludCBmMmZzX21hcF9ibG9ja3Moc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0
IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLAogc3luY19vdXQ6CgogICAgICAgIC8qIGZvciBoYXJkd2Fy
ZSBlbmNyeXB0aW9uLCBidXQgdG8gYXZvaWQgcG90ZW50aWFsIGlzc3VlIGluIGZ1dHVyZSAqLwot
ICAgICAgIGlmIChmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJiBtYXAtPm1fZmxhZ3MgJiBG
MkZTX01BUF9NQVBQRUQpCisgICAgICAgaWYgKGZsYWcgPT0gRjJGU19HRVRfQkxPQ0tfRElPICYm
IG1hcC0+bV9mbGFncyAmIEYyRlNfTUFQX01BUFBFRCkgewogICAgICAgICAgICAgICAgZjJmc193
YWl0X29uX2Jsb2NrX3dyaXRlYmFja19yYW5nZShpbm9kZSwKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFwLT5tX3BibGssIG1hcC0+bV9sZW4pOworICAg
ICAgICAgICAgICAgaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2VzKE1FVEFfTUFQUElORyhzYmkpLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAtPm1fcGJs
aywgbWFwLT5tX3BibGspOworICAgICAgIH0KCiAgICAgICAgaWYgKGZsYWcgPT0gRjJGU19HRVRf
QkxPQ0tfUFJFQ0FDSEUpIHsKICAgICAgICAgICAgICAgIGlmIChtYXAtPm1fZmxhZ3MgJiBGMkZT
X01BUF9NQVBQRUQpIHsKZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9z
ZWdtZW50LmMKaW5kZXggMTkyMjRlNy4uODU0OTMzMiAxMDA2NDQKLS0tIGEvZnMvZjJmcy9zZWdt
ZW50LmMKKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKQEAgLTM1NDcsNiArMzU0Nyw5IEBAIGludCBm
MmZzX2lucGxhY2Vfd3JpdGVfZGF0YShzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCiAgICAgICAg
ICAgICAgICByZXR1cm4gLUVGU0NPUlJVUFRFRDsKICAgICAgICB9CgorICAgICAgIGludmFsaWRh
dGVfbWFwcGluZ19wYWdlcyhNRVRBX01BUFBJTkcoc2JpKSwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmaW8tPm5ld19ibGthZGRyLCBmaW8tPm5ld19ibGthZGRyKTsKKwogICAgICAg
IHN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKGZpby0+c2JpKTsKCiAgICAgICAgaWYgKGZpby0+Ymlv
ICYmICEoU01fSShzYmkpLT5pcHVfcG9saWN5ICYgKDEgPDwgRjJGU19JUFVfTk9DQUNIRSkpKQot
LQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KT1BQTwoK5pys55S15a2Q
6YKu5Lu25Y+K5YW26ZmE5Lu25ZCr5pyJT1BQT+WFrOWPuOeahOS/neWvhuS/oeaBr++8jOS7hemZ
kOS6jumCruS7tuaMh+aYjueahOaUtuS7tuS6uuS9v+eUqO+8iOWMheWQq+S4quS6uuWPiue+pOe7
hO+8ieOAguemgeatouS7u+S9leS6uuWcqOacque7j+aOiOadg+eahOaDheWGteS4i+S7peS7u+S9
leW9ouW8j+S9v+eUqOOAguWmguaenOaCqOmUmeaUtuS6huacrOmCruS7tu+8jOivt+eri+WNs+S7
peeUteWtkOmCruS7tumAmuefpeWPkeS7tuS6uuW5tuWIoOmZpOacrOmCruS7tuWPiuWFtumZhOS7
tuOAggoKVGhpcyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlh
bCBpbmZvcm1hdGlvbiBmcm9tIE9QUE8sIHdoaWNoIGlzIGludGVuZGVkIG9ubHkgZm9yIHRoZSBw
ZXJzb24gb3IgZW50aXR5IHdob3NlIGFkZHJlc3MgaXMgbGlzdGVkIGFib3ZlLiBBbnkgdXNlIG9m
IHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQgaGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywg
YnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBvciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVj
dGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkgcGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRl
ZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRlZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlLW1haWwg
aW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBieSBwaG9uZSBvciBlbWFpbCBpbW1l
ZGlhdGVseSBhbmQgZGVsZXRlIGl0IQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
