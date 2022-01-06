Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6148644C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jan 2022 13:21:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5Rlq-0005Xf-CA; Thu, 06 Jan 2022 12:21:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao.yu@oppo.com>) id 1n5Rlo-0005Sd-3T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 12:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SFY4BkJiJMctliLHyDkXrysavEDbktWmq/qQiZUOQIg=; b=U2RiZZ/hf9itGIrXe0rVSAewQ5
 lu/kYoPoYm7hhPD6+kMoXDhbD5ETX/SMxxdKp+uzGSdaSJHs4zJqEc51ILCQiAFmh94hg7o4dlnBB
 MX56OxvoBEcBSnFJND8wUQ/6QWFDEfeUdQpnGYeeGrsp9IREoXUN5wakivovfLdlyHCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SFY4BkJiJMctliLHyDkXrysavEDbktWmq/qQiZUOQIg=; b=bhne6wsgaajCHVgY9LAUnsicJw
 Y5KoSfCBYk3Y/pC4WKYu/ShzUmafsxiTfMS7nkesxkk3ku25N8GtR+r5Oe+IHH61aa6+Jo3NhAt6S
 tSAbYkpKLDZwMKa0QbvRL/5OZpfYan6Ho7HtJPhtKJ2NjyHGV6qZFZMg18rKBUG1yi3A=;
Received: from mail-sgaapc01on2076.outbound.protection.outlook.com
 ([40.107.215.76] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5Rli-003xhQ-SX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 12:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARYeI1/hLse0fqX9lCvjZxL9HOoIwwuB6gqYcqkuizzzVOjdKfTulHQdwwlaEWfMBGMJJUr9svx6uX7uvReY87Wvre2DfDIq+EOCwHcWnDEjUdjw5HpMm1uTXTJQE/+6O3Lg5vlnsvWwCfJ1Ywpmvvfa7th+FW64Fhz/Fssu88BWMvneXwzswGxYwoHJTyOLmKIdVt6RIpDXW0MX/mTKE/yJWGbdJ0FUgBFZwKU2F6EIf/kcO52j+PFZBlcBv1cSqsOK7JMVCFyNL+2s2PIwSbXYiIvJ36N9+yBbKLvCl4MgTxjFxOXE/wwcdHTzeJGumNc3HvcVnl5IVbaqAziTYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFY4BkJiJMctliLHyDkXrysavEDbktWmq/qQiZUOQIg=;
 b=YHbNgk0kg1FFSRZZfi72iYGkI903LrfaCamAZHDLpB8jFVm2D/LD7dFP8Nuuf450pD3U5dKxv9E3mhpZFL/ZWNw4k7ndlXhdigFVC/1koYvtZNlEMDdakb8DOmN59cUfSUViWo9YJnLHscDwJa/TgmaykubOCM7M9bSOp2o1ubstrGXSDmYak1PqxtK/2YAM3v/aCT1jKNpswjQ3fYWdMYqoyn3j53//J/WYlxE9EJrU15cYteX99wN29lC+102Q9tlwXQJU+mfCJBwUKfrJDy4mN4bNabQE5XLq2B0T5+CmGQrqHGTHGPv5hvhI5kl5jiLQ+N+gudoDOuBEyukFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFY4BkJiJMctliLHyDkXrysavEDbktWmq/qQiZUOQIg=;
 b=RSagkwRRaZtxros9Sgto4KilqIqGT/DOyUHJqZAwX0HppVmvMmG+3Y0AOAtpWBnpaz6u4ehaL3/kACql3TRap0hai/sMl3D4L7Oq2uiapiBkuDellKLAnqfa2HplITBiUjuQxPY6mV/XFZtjKhW1WKSidA1dw46Cytsl+RdkpzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB3165.apcprd02.prod.outlook.com (2603:1096:404:4f::13)
 by TYZPR02MB4799.apcprd02.prod.outlook.com (2603:1096:400:50::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 11:48:04 +0000
Received: from TY2PR02MB3165.apcprd02.prod.outlook.com
 ([fe80::35b9:c661:8ee6:3491]) by TY2PR02MB3165.apcprd02.prod.outlook.com
 ([fe80::35b9:c661:8ee6:3491%5]) with mapi id 15.20.4844.017; Thu, 6 Jan 2022
 11:48:04 +0000
Message-ID: <45a5b735-b09c-a36d-b204-e0096b99d2ae@oppo.com>
Date: Thu, 6 Jan 2022 19:48:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Antoine Viallon <antoine@lesviallon.fr>,
 Antoine Viallon via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
References: <20211230002942.298407-1-antoine@lesviallon.fr>
 <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
In-Reply-To: <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
X-ClientProxiedBy: HK0PR01CA0061.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::25) To TY2PR02MB3165.apcprd02.prod.outlook.com
 (2603:1096:404:4f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2de23822-b5e0-4899-fd9b-08d9d10a65ed
X-MS-TrafficTypeDiagnostic: TYZPR02MB4799:EE_
X-Microsoft-Antispam-PRVS: <TYZPR02MB479964C5F48F6C6BF0839CD8924C9@TYZPR02MB4799.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nvtiXP+okO22B4TFFmhT4Maxxp8GyZBoBsbDpdzoaPyh5rhA9tQVZJ22xz0dkMrbTNvxV1kHzifTymAat1p0ppJDOFwhm74tkCRGsoOBzurqH5rXscL1WPCWiCE6UmqRL+lPowimzkjQJEAzwGtjmvVEjn5N1Wf9eQqqmkkIGUPCbragHeNirhs3cUld4tZGpe20i0xxI4qI9uSepfxyXQTWJzbMQsYSBdRFuCdoKVBaRG79PlLDHrFzww+cCVaK1xtDxRsQU30i8BrO2lgoq0T69ZNhoHOB3wwGXgq5gMv1XHUq+V2t2THI+HmgnSINj1n/j0MxA5p4LQ5yeH5vnAsxn90bpYAoj39Ee8U+jw/pGQTq/nfDGS2AWDMm/sAVeeab5TyNTHBZppS98WMVAg5bLN2Y8eslxmDzU8Bmdvq4d192rpTt9vG3GP3W+D7Kd/TRCRfIf5srGqmBZm7PHGBx/uxQa/+drzlJUPV+RaTKgoouiFO01x6bNOmuTA7BT9JjeVULRoJGsQiqD4cNir7aeChZuHHxdMs+XxCAe2XuW0CMkEhdOzVasHCqHNN8yCc7znSetTXfSdasWUAkGwira5gs27U9Qf5aD8XvYn9NMtCj3xYKe1qNqYIp6ZXZ2rZ6oov+ubP3ySRZR6x8Z3q6PiLwT/1xEVQ+foYUyQFuYPFWWYMWh/89G1O7FNH5heV03LtJnOj8wklo9NQigQ5Hl8BwZ8SnSVRzPgn0ygvWhExJvn1EMw7WpEWEp8fEDzVqzYf1q3WnsjYiXb6hkyYBSG2smMzKf4/s9u6oZ2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB3165.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(6666004)(26005)(36756003)(52116002)(6486002)(38350700002)(6512007)(53546011)(31686004)(316002)(6506007)(66946007)(8676002)(2616005)(8936002)(66476007)(5660300002)(44832011)(83380400001)(86362001)(110136005)(31696002)(186003)(38100700002)(66556008)(508600001)(11606007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRIZzdRWVFWKzJ3Y3g0aUdhdUZiOHhQVDVMaDZnejgyQVVIWkdaRHJKdVg0?=
 =?utf-8?B?aGt1aDAzOEJZTERMWHZzS1AvKzV6aEI1T3Y1aTgxWis0UHI0YnIrWU1CakpE?=
 =?utf-8?B?NlBEZzBEOUlLNlBOcnpmUG5FRThScS9kV0ZOcWVLRkZnMElCajUwZ1hQd2ZJ?=
 =?utf-8?B?dUFwcnlIbzlsMHBuSCtCd3V5QmtHaktBbmhYREJJaTBYbEZJT1hPVFpFYm1r?=
 =?utf-8?B?Z2l5c1k0MDNLMlVTZDBTbFZ2OHRDVDI3L0I4WWtwOUJPdVovSk5Ra3ZtaThO?=
 =?utf-8?B?TlBvT2tHMGlvcXNUSDZOOWsxSzU2VEpKOXgrTGtYY2xxTXdhWGNDU3l2N3Rh?=
 =?utf-8?B?dDh5U2xqenNPbGl4NkNUL1Z6WWNFNEhDMnB2SXBQVmxHQkQ3M29FV0xhUjBY?=
 =?utf-8?B?RzFSYTR4bklPVWxMdlFJT0lDNzFvUmVWNEhuWG52K0cvYzFXVWtBMjBGR3VI?=
 =?utf-8?B?cXVvZVpwdVY4TW93Q1NXeklNaGVFTTBGelZWK1ZtR2J0L05Ub0svcjIyTWlN?=
 =?utf-8?B?QXBiV3FyZXh2enY0ZU5TdXNHZFF3Y1Baa2thcWx2bC9xV1hvTUxleHI0ZjFu?=
 =?utf-8?B?cnRNaWtiQ3JEYUdycmZqcDJJd2c4MSsyemIxbk1IMFkrekFRbVlqUFhGZTNZ?=
 =?utf-8?B?NHZ6Z2JjZWprdkxueThLUWdrU2dDU1B6Q2ZER3BGdlNUcngrdTF6dW1wdE9r?=
 =?utf-8?B?MHp4L09jVkhxSlBzdnVtZEFNMHBmcERtUUNzK3pBN201dDZwczA4NllQUGQ2?=
 =?utf-8?B?ZjRtKzIwMGRIa3ZXVmpiNUw1MXNzZGdZVDVGUFFpNHY0c3BueGU2a0R0TUpC?=
 =?utf-8?B?K3hCNjVPdkZTYnF5TFNQTk03cWQzK3ZwTkhFQ3pWaWFZTVk5YXYwTENXelRV?=
 =?utf-8?B?L0FFMk93T3BURzFidm5XZ2RUMjR3dVU2WVRMbjFoTEppbjI4Vk84a2I0U3hu?=
 =?utf-8?B?N0FBV211RzNpdDNkUHJOYmFPTEFWSjJRblR1REN5NWowVGd5bEZFM3RsdENv?=
 =?utf-8?B?MlZRMGdmOGM3TFZFazNSWHZEVFlWK2pySk1qNkFnU3hWY1BvMndYZlBiQytE?=
 =?utf-8?B?TWxueU11Y25pOUdESm1qVzBRa0E5Z05VdmVsYXNEdjk5SXVOby9xUzdFODYz?=
 =?utf-8?B?TzdHMG1jRUdmaW5vdXNETkdwZGg1ZHM0aTRlaWtRT1pzTU1RVnpkSXBQbGR3?=
 =?utf-8?B?Um5oY1IyV0MvVGhJRWJUeWJOQ01Lc1NMZDVnSWF2TXoyUHJYVFZXc1o5aVlE?=
 =?utf-8?B?RFFTdE9tNk1uV3g1bTBYdEhham5JQVg1WTJKVTNtUmlYaTREdXZmQ1dtSUNT?=
 =?utf-8?B?UGhNN0JleXp5V0lrSVlRcUhNYWVsQWVxeVEyS1cyNi9BOWpVZE1TL3hGY2w4?=
 =?utf-8?B?TEEzcksweGJMQ3BtRzB3REhkTnQyQ3EranQ5RDloVEFPbDF5aU1GQjRCQkF4?=
 =?utf-8?B?WjQvWHJlTnBTSHdCTy9WemFvRWJSaXByRUEzdVVhQ0VWQTFMZGZSOEI4M09p?=
 =?utf-8?B?Q2w4ODErQ2xqU3NrT0l4ZWhaVThjS0xCZzFQRW1BaWNkQ3VTcU14cGpDTmtY?=
 =?utf-8?B?UXM4Tk9odnRIeWRoTTI5eWFxWjZCNG1sMWlXWEpqRnl6U1cwN2VwajBWaXpV?=
 =?utf-8?B?b2dVUklTcEdwZEozR00zNlR5LzVod2J5aWF3bkJWUkR6dVJtejlOMmVZOGE2?=
 =?utf-8?B?eHBoZnBUdElENllXUTJnWlFnVDdOckVvYlJwVmoxK2E3My9MT3B2T2ZrMENB?=
 =?utf-8?B?WVpoOEhFTG1USElPQVZiMWhtUWxjeTBQQXQyODcyNmZNQ1NrcFdMdHRIdklQ?=
 =?utf-8?B?c2ZrUGlWNTk0ZzJHYVpEYjBHek51bjU4NWJTVU4zK3A3WVp5eUFPTzRuajdF?=
 =?utf-8?B?SUkzUmNnZDlmbjVBN0JoY0Rma1E3Mjl1M0FTR2djcG43TEhCclJyanNuWU9L?=
 =?utf-8?B?UDRNMGdDeTRXL0lxZ1RVRVpibUtnRWxXbW1GTHNzK2FyNkREMUtaMFNFbmtj?=
 =?utf-8?B?cDVRS2hOK2FOYjlyNlpSQVJPRkFqS2xmOHJvS2VXdDFoMTZUTXVIYVg3ZFRT?=
 =?utf-8?B?QTlQM0xQdFZXSVhMWUtGTCtVRDFhWlgyZlcrTGFGRUN2RnpqaVFXL2djcE5w?=
 =?utf-8?B?Y24wZm15YjNtV3E0NDBoc3JaZzkycGVOdTdiUkFybXhncFNLWVFsZlNUTE1C?=
 =?utf-8?Q?JLHK2adieNvj8p/lgwk9MU0=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de23822-b5e0-4899-fd9b-08d9d10a65ed
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3165.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 11:48:04.1172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YA2HEeGPypsjAqqxd/0MzX7EwEF0OOLCF1Iogpt04oAR0f6Fm1zTduBYypLyAHpFShLFN1hPQBNqIMLdiAD/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4799
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/12/30 8:59,
 Antoine Viallon via Linux-f2fs-devel wrote:
 > Some variable naming mistaskes were made in the last patch, > here is an
 updated version. > > --- > fsck/fsck.c | 9 +++++++++ > fsck/f [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.76 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.76 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1n5Rli-003xhQ-SX
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao.yu@oppo.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/12/30 8:59, Antoine Viallon via Linux-f2fs-devel wrote:
> Some variable naming mistaskes were made in the last patch,
> here is an updated version.
> 
> ---
>   fsck/fsck.c | 9 +++++++++
>   fsck/fsck.h | 1 +
>   2 files changed, 10 insertions(+)
> 
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index ecd87af..921db0f 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -546,6 +546,15 @@ int fsck_chk_node_blk(struct f2fs_sb_info *sbi, struct f2fs_inode *inode,
>          node_blk = (struct f2fs_node *)calloc(BLOCK_SZ, 1);
>          ASSERT(node_blk != NULL);
>   
> +       /* Progress report */
> +       sbi->fsck->chk.checked_node_cnt++;
> +
> +       if (sbi->fsck->chk.checked_node_cnt % 1000 == 0)
> +               printf("[FSCK] Check node %u / %u (%.2f%%)\n",
> +                          sbi->fsck->chk.checked_node_cnt,
> +                          sbi->total_valid_node_count,
> +                          100 * (float)(sbi->fsck->chk.checked_node_cnt) / sbi->total_valid_node_count);

How about showing this message in debug mode? may be under level one?

Thanks,

> +
>          if (sanity_check_nid(sbi, nid, node_blk, ftype, ntype, &ni))
>                  goto err;
>   
> diff --git a/fsck/fsck.h b/fsck/fsck.h
> index 11846e1..535d6d5 100644
> --- a/fsck/fsck.h
> +++ b/fsck/fsck.h
> @@ -93,6 +93,7 @@ struct f2fs_fsck {
>          struct chk_result {
>                  u64 valid_blk_cnt;
>                  u32 valid_nat_entry_cnt;
> +               u32 checked_node_cnt;
>                  u32 valid_node_cnt;
>                  u32 valid_inode_cnt;
>                  u32 multi_hard_link_files;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
