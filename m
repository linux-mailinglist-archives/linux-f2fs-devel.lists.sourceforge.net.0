Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A73F734A7E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 05:12:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qB5JL-0002Qv-Rg;
	Mon, 19 Jun 2023 03:12:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1qB5JK-0002Qn-5A
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 03:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5s2CdHfnTK/34CbL6Br9NFOc3uKGNsaPossuTprqu9g=; b=gKsBng047vfSBfT6kGzAprWwMN
 RxC+dtZeUN90WrXjwN7rjIdlA9Ub5+whqaf5K8e0L3cxY3fA72NEw3KX9eGIxeelYbQTjd6pt00bn
 xedwb1oT5Fqlr9RHyQjQ7HePEyFV/VrYSjeKcieQNGqm97TyG3tqZ79gLvLXO45dgyRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5s2CdHfnTK/34CbL6Br9NFOc3uKGNsaPossuTprqu9g=; b=KIuaB311dKU/6ipCyPNgG2N2+B
 inKfFLPLGBNwbgeAo2loIg6+/yTW7DhzupmXCpz15daVTlyD96zzYryf9GvMM2EAwriKtSdy0f+Bh
 tS1weWxkJ2WH659dWAn3XwSAOZywEEJlPx3MbH7F4sSg14ahkWV2P+r4q9ukIGKlE418=;
Received: from mail-sgaapc01on2137.outbound.protection.outlook.com
 ([40.107.215.137] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qB5JD-0000uC-4D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 03:12:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ldlgb3JpFv2GT6//j0h4ZzpRDNV6yeGCMhQfEYsfTvvWwDX9pQ65cGv2xdNPjsJL+Gs7XND8jqmFmVLrv02Z+OjQ1Qj7JMyW/GjIVd6vd4oh08h3cI72/i+LfYvUv95EJDt5AiNPm+buJeFhv2Jv153MaqQwUHXV6JalbwRI4EQVsnSlt81iAuaW5Q5x8eLAThtRBwgvLpqiCBWXlNtgs5A2S0AP8vPTe0IPNfpx7L/c7x14sB7WuQYaDEN/xqKN/JQttmHPRSRl/4IE807V2twBLyH01vEfBlFDBMYQBF5hOsS2ZVZZm0d7onJH7pA4Zh18mVLuROY01YOtCD8tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5s2CdHfnTK/34CbL6Br9NFOc3uKGNsaPossuTprqu9g=;
 b=QhacGAhVj3RfwTEjatmY5TvjsxCIpwxSniciYgp5hSMUelF9XRifctCtceoGx8B7bpvD1P3xzKSZaAA7aYayV7eaYym/E3J3V6qcgrhrnRsvlTlbI1Vzm7vqip8DHnnmZpzspSlfJVMh26AkxM4QZu8CinyFfzWXpFs8CeZbPKZWOV61K/y3fN9s9xcySn3KrMKC6EyL4jzrbkv2dOGZrqIoqCX0VBz82OBi7J80xV4mlK9OmwDrSoPYSGhBuH7wvyHXgnTpWbUxPhpUArXQpzrg+Hjm6QxxcYgNEBYMlM2knLY+skwpftkBmedFX6VXMYK29bk2mGxl08O1+92PKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5s2CdHfnTK/34CbL6Br9NFOc3uKGNsaPossuTprqu9g=;
 b=IOtYC6B6poJqhfIME78Dc0GsqEkpmoe9bh4Tq+bYbISbx7ahqExHKpkFk+w05/uW0FBe2QybUSJu/Im1oChMGrszlD1TBsPLrSFWuunkxgdaw9Qk7op1Ue3hpNrPWpQ5RAcuTPGbcDmtgV4a8nV8a5CACNkyJ3eWutIW2Ykd1AEAz4xfFxrOs3Lk06RXZerhsEM+EFo9Ar0z7b1xIaq6Gd7rMB1kbfencjxQAfQNB6sEICD2lO8/28d1rK078w7xstpCkXNcly3dhLjkOLiKQa2HWy7gTO/yjpyNGreF+wWGL+gjmIQeAFHOBzn1gQo7w6uymw/z/QZA2+WaR9zUGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB5934.apcprd06.prod.outlook.com (2603:1096:301:104::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Mon, 19 Jun
 2023 03:11:53 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%4]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 03:11:52 +0000
Message-ID: <fe223231-5445-61ef-1ba8-0d46f4f4ed5f@vivo.com>
Date: Mon, 19 Jun 2023 11:11:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230609131555.56651-1-frank.li@vivo.com>
 <8097d4d9-815e-2527-0fb7-90ec0609a4a3@kernel.org>
 <dde6972a-e98c-8a6e-493b-9aff5668101d@vivo.com>
 <7ab6b6f9-37fa-9bf2-69ce-7b1b1944d9f3@kernel.org>
In-Reply-To: <7ab6b6f9-37fa-9bf2-69ce-7b1b1944d9f3@kernel.org>
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 893b3b79-8100-4a2a-0828-08db7072ed8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bi62B3xZQJMbCHJu3kyzh7QSjxNitLCYCaBXSpFIFA2Cj4HHq161ldZ4z9Hh9RQzZwbP574zuGnHjXR5z0i/NUxDQwIuIrCaK1NNk0LVKp1SDiP4H+6pMV4qaUB0H5kXslTSbvhTp6LrRnE/pcx/T4P2Dv4kBF1PgzLiYS0WUwLuv8WWVSqmjiG1c/KDAKMQr2smLbaoupgSqnGx9rb5vDiCYnPRMjAsE8t9KZ2GaG0T1/qMkBPW1fK3MfmrpUrT+57jmJOEIDnsAqTyJvHt/F799pLMv2RJhGrVrGthX6wyHHAFCzEkOjwmxjVqcG31p9PzZvcEynXqZQxuKyriG3k1y7VSTe7kru7LAO10GRLKujtFdTpmKrfh+oiLSVr//hcHjTdLfURJE8dofhf/mJad0ZGE1z16It2yo69TyREz/pHt48w+BUZeIKTU+r6qZ9UkeGhTPCYI0sGuuKZOmF6jPPZ4UoKV4z9pFUlGAxO9FvSw0mRLIaJveTjLMlIpGub4k9C/5mGP2z0QNAE4ZHDvYrZl4ap65Vd4UrebXWOgR/IJfNwwOwaXgcjMKjz4Fyb2zORRQ4kMN6W3e+uA020xYjjixoVj/33gcyY5CsVnY1KWmlaynugVzZJx8fDvFGCAknwUxrTnIfvCL1T6e9ibbiqdxTp/zH9TQ4y3ZbsDwheltvlaC7qJ8pfRDI1P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199021)(41300700001)(5660300002)(8936002)(8676002)(2906002)(40140700001)(36756003)(86362001)(31696002)(26005)(6506007)(6512007)(53546011)(52116002)(110136005)(186003)(478600001)(6486002)(6666004)(66946007)(66556008)(66476007)(4326008)(38350700002)(38100700002)(316002)(31686004)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2JTS2xUK3hObjZKcFhHZ0dCdmNCU1V6cmZWcHZuZlBBcks1TzUzeEk3V2pq?=
 =?utf-8?B?SzNlc2lKMzNaRlIyZkVsQmVsL0l0ZTlXcGpvdGJCek5WTVJvQkc0eUhZdFJI?=
 =?utf-8?B?VlZyYWE1OVFMaEZtbnVCS2pzQnI2bWpoZGlYL1BGT2xSTmdNTWxyVklYa1ZT?=
 =?utf-8?B?WGYzenF4Yk44ekwva2dwamxFUkpKVnlZRnVUY1drdlVzNVZ2NWMzMXZJcnI0?=
 =?utf-8?B?T1E3SUVYSTUrQ200UXRwenYrU0RtbUJCWTZxMHJQeURCUnBQdTA5bDR5VmYx?=
 =?utf-8?B?ajdwNndYRFV6bzNjSjg2RVAwZUpVVUtucHpja2l1cGwrbktod2FGRTRxako3?=
 =?utf-8?B?UStYQklyVVhGNU1zaVRGbGhkTWpZY2ZmQVd6TjV1WlJWSUJ3UFdXZXRsaEdi?=
 =?utf-8?B?NXJsSktlWjB6d3ZzTXVCWFNSOXhBY1cvYzducG1pSjBObWNMdGpHRXZxeU1S?=
 =?utf-8?B?SlVXQ01tZUtBQk9KWVJ0NkVualZJaFBvWFprdkRSNUtBTFVjQ0hFRnJtZmJS?=
 =?utf-8?B?b3VrRkFweHV5OHZlcU5TcjAxUUg5clNkcEhFTVJXNE8yVVRkQ2k0RFZOS2c2?=
 =?utf-8?B?eWdXN1llcjBnNTFkeHAxVWhaWXVoVkdEK0s2MmZFYmdHb3EwNmxTTGVPYUhl?=
 =?utf-8?B?SGFYcGZaK1dlY0JzM2M0SnU4Y25Yam5LWFJaSTlyZ1FiQnFEdHFVVkUwbU5M?=
 =?utf-8?B?aTZUZTVRZ2Jrc1Z4T3owT09pbkk2dnBzWVdmeXJ2NklnNmo2OTRPQ1NXNFlw?=
 =?utf-8?B?RW15UDZDMXJ4K2RNa3R2VEFabGxZeC9qR3ZmQ2dpUzV6eCtXekE3Y1hGSnJx?=
 =?utf-8?B?OHpCTkVSTDM3NjdGTkVSK2NCTU41TVVoVW5FV1llSmE4SVBXODRoeVRWL3R3?=
 =?utf-8?B?d2N1bmlDa0pYRjkvVG81bEF1TWd5TlRaS3FQeWk2S3Frc3ovaWtkb2k1U2ZK?=
 =?utf-8?B?OVF0QU9Bc2w0ajlwR1UzY1ViM3lZaTlZaTB3Y2RkbnJSU2hvZXIzbmFUSk5G?=
 =?utf-8?B?YVVTNkxJZVAyUHA0UnA5QzdGUXI4TWZDbmNoMVJyNWVnK044VFJCWFFTRlhH?=
 =?utf-8?B?WFN4TG1YWUpETTY2MGZTU2FmR1MrWTBRL2IrZGI4MkkrMVZwa09oVTZWTWxu?=
 =?utf-8?B?cDZKUGRIUDRIbEQxZFloT1QydkRkc1ZiRjlQNjIyb3VDYjBJZVkvRjBPZW0r?=
 =?utf-8?B?YkZndlhJdHd5Zm9VZzQ2QUZhN003TWxzd3FhSFZvWmpQVjZYTzhSWmxnZXox?=
 =?utf-8?B?ZEp0c2pJMStTWXNocWMwYzNxQVBQL1ZnQklrRmpyRUJIMzFMWEdqUlViYlla?=
 =?utf-8?B?NGYvR3p5cnRIMHRSYm1MQnR6czN2bHljQkR4ZTE4bmlTcFFHTGhKRkJSTk1B?=
 =?utf-8?B?QW53L1doMGo2NTBCUnBZOVF2dmhKYXRLRnJUdUtFK0JJSW9PSTkxMnJHaTZh?=
 =?utf-8?B?d21vTEEzZ2xZMm44L204cjVOVG8zekRRUWwycXNJeTUrZmxnL1p1SXNJTTc4?=
 =?utf-8?B?ckd0blhNbkZhSy8zVUQ3eE9YS0JZSFZCd2cxNjk0YjVqWXB1OGc5WHZOWE13?=
 =?utf-8?B?bjNTZVRvb2JnUlA1Y0RES1ZJMjd1cVA2NHY3WHd3V3ZHRDJueHk0bmxTekkx?=
 =?utf-8?B?MmZGanJWRHNFM2x1Uyt6MG9xMjVoM0Q4dlJvSUoyc0RzaXFwWFBYMFNNZ1Vy?=
 =?utf-8?B?dGU0TEc0MTNoK3NSemdqd3RwRFZ6QlNrU3l2Y0QzVlU0d2RxekJOVjg5SHh6?=
 =?utf-8?B?WjUvTGV5aG1IWVVOV3hkSHhXSWx2TnM4elp0bDQ3b21vS1hRUDRoZ3d5cjVz?=
 =?utf-8?B?WUZFTU1qSzNXUkgxVnJ4bkRlVndVWmlEalVPTWtYcTA5cnRGWGg3ZExqdjli?=
 =?utf-8?B?bWIvWVNrY1g1NUNGNkM3eWJNRGQzbXhER0JPeFdMQzN5V1Zxd25HSXRuaU5i?=
 =?utf-8?B?LzJTNnpjWWQrWXVNSEF1VDRINlNPQ0N2TlBtemtiQnNFTGg3VkFWbUpBbW9u?=
 =?utf-8?B?WmVxNkFaWmtUOUZoRUY3SjlkUWV2UGdlK1VDS2cwUnF6dGVWbFVWVWZXdDJT?=
 =?utf-8?B?NEExcjRvRDFmWTJ3ZXd6OGxGdXUybGloZlJoS2YzYjJNeW1pU3BWRXJuTmFq?=
 =?utf-8?Q?ROe3ICIJTa/wStDfRK24xBWQR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893b3b79-8100-4a2a-0828-08db7072ed8a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 03:11:51.9745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lp6NEMgpPEScsXqhXhb79oSMRMs5XMZ5Fd2VWn9Hh2XmBw7dbiWSLjusVjYvSdhDLreeEoT5ksv/bgCdo9gdMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5934
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/19 8:54, Chao Yu wrote: > On 2023/6/13 12:14,
 Yangtao
 Li wrote: >> >> On 2023/6/12 22:38, Chao Yu wrote: >>> On 2023/6/9 21:15,
 Yangtao Li wrote: >>>> It is observed that when in user compression mode
 >>>> (compress_extensio [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.137 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.137 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qB5JD-0000uC-4D
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: don't force buffered io when
 in COMPR_MODE_USER mode
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzE5IDg6NTQsIENoYW8gWXUgd3JvdGU6Cgo+IE9uIDIwMjMvNi8xMyAxMjoxNCwg
WWFuZ3RhbyBMaSB3cm90ZToKPj4KPj4gT24gMjAyMy82LzEyIDIyOjM4LCBDaGFvIFl1IHdyb3Rl
Ogo+Pj4gT24gMjAyMy82LzkgMjE6MTUsIFlhbmd0YW8gTGkgd3JvdGU6Cj4+Pj4gSXQgaXMgb2Jz
ZXJ2ZWQgdGhhdCB3aGVuIGluIHVzZXIgY29tcHJlc3Npb24gbW9kZQo+Pj4+IChjb21wcmVzc19l
eHRlbnNpb249KiksCj4+Pj4gZXZlbiB0aG91Z2ggdGhlIGZpbGUgaXMgbm90IGNvbXByZXNzZWQs
IHRoZSBmaWxlIGlzIHN0aWxsIGZvcmNlZCB0byAKPj4+PiB1c2UKPj4+PiBidWZmZXIgaW8sIHdo
aWNoIG1ha2VzIHRoZSBBbmRyb0JlbmNoIHNlcXVlbnRpYWwgcmVhZCBhbmQgd3JpdGUgZHJvcAo+
Pj4+IHNpZ25pZmljYW50bHkuIEluIGZhY3QsIHdoZW4gdGhlIGZpbGUgaXMgbm90IGNvbXByZXNz
ZWQsIHdlIGRvbid0IG5lZWQKPj4+PiB0byBmb3JjZSBpdCB0byBidWZmZXIgaW8uCj4+Pj4KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB3L28gcGF0Y2ggfCB3LyBw
YXRjaCB8Cj4+Pj4gc2VxIHJlYWTCoCAoTUIvcykgfCAxMzIwLjA2OMKgIHwgMzY5Ni4xNTQgfAo+
Pj4+IHNlcSB3cml0ZSAoTUIvcykgfCA2MTcuOTk2wqDCoCB8IDI5NzguNDc4IHwKPj4+Pgo+Pj4+
IEZpeGVzOiA0YzhmZjcwOTViZWYgKCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQo+
Pj4+IFNpZ25lZC1vZmYtYnk6IFFpIEhhbiA8aGFucWlAdml2by5jb20+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBm
cy9mMmZzL2YyZnMuaCB8IDE0ICsrKysrKysrKysrKysrCj4+Pj4gwqDCoCBmcy9mMmZzL2ZpbGUu
YyB8wqAgMiArLQo+Pj4+IMKgwqAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9m
MmZzL2YyZnMuaAo+Pj4+IGluZGV4IDFlZmNmZDllNWE5OS4uN2Y1NDcyNTI1MzEwIDEwMDY0NAo+
Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBA
QCAtMzE2OCw2ICszMTY4LDIwIEBAIHN0YXRpYyBpbmxpbmUgaW50IGYyZnNfY29tcHJlc3NlZF9m
aWxlKHN0cnVjdAo+Pj4+IGlub2RlICppbm9kZSkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
c19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQ09NUFJFU1NFRF9GSUxFKTsKPj4+PiDCoMKgIH0K
Pj4+PiDCoMKgICtzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19pc19jb21wcmVzc2VkX2ZpbGUoc3Ry
dWN0IGlub2RlICppbm9kZSkKPj4+PiArewo+Pj4+ICvCoMKgwqAgaW50IGNvbXByZXNzX21vZGUg
PSBGMkZTX09QVElPTihGMkZTX0lfU0IoaW5vZGUpKS5jb21wcmVzc19tb2RlOwo+Pj4+ICsKPj4+
PiArwqDCoMKgIGlmIChjb21wcmVzc19tb2RlID09IENPTVBSX01PREVfRlMpCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiBmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSk7Cj4+Pj4gK8KgwqDC
oCBlbHNlIGlmIChhdG9taWNfcmVhZCgmRjJGU19JKGlub2RlKS0+aV9jb21wcl9ibG9ja3MpIHx8
Cj4+Pgo+Pj4gU2hvdWxkIGNoZWNrIGRpcnR5IHBhZ2UgYXMgd2VsbD8gaV9jb21wcl9ibG9ja3Mg
bWF5IGluY3JlYXNlIGFmdGVyCj4+PiBkYXRhIHdyaXRlYmFjay4KPj4+Cj4+IElJVUMsIGluIENP
TVBSX01PREVfVVNFUiBtb2RlLCBpX2NvbXByX2Jsb2NrcyB3aWxsIG9ubHkgYmUgdXBkYXRlZCB3
aGVuCj4+IEZJX0VOQUJMRV9DT01QUkVTUyBpcyBlbmFibGVkLgo+Pgo+PiBJZiBGSV9FTkFCTEVf
Q09NUFJFU1MgaXMgbm90IGVuYWJsZWQsIGlfY29tcHJfYmxvY2tzIHdpbGwgbmV2ZXIgYmUKPj4g
dXBkYXRlZCBhZnRlciBkYXRhIHdyaXRlYmFjay4KPj4KPj4gU28gdGhlcmUgaXMgbm8gbmVlZCB0
byBhZGRpdGlvbmFsbHkganVkZ2Ugd2hldGhlciB0aGVyZSBpcyBhIGRpcnR5IHBhZ2U/Cj4KPiBP
aCwgdXNlciBtb2RlLCB0aGF0J3MgY29ycmVjdC4KPgo+IElmIHdlIGFsbG93IGRpby9haW8gb24g
Y29tcHJlc3MgZmlsZSwgaXQgbmVlZHMgdG8gY29uc2lkZXIgcmFjZSBjYXNlIGluCj4gYmV0d2Vl
biBhaW8gYW5kIGlvY19jb21wcmVzc19maWxlLgoKClRoZSBpbm9kZV9sb2NrIGlzIGFscmVhZHkg
aGVsZCBpbiBmMmZzX2ZpbGVfd3JpdGVfaXRlciBhbmQgCmYyZnNfaW9jX2NvbXByZXNzX2ZpbGUs
IEkgZ3Vlc3MgdGhpcyBpcyBlbm91Z2g/CgpXaGF0IGVsc2U/CgoKNDY5MSBzdGF0aWMgc3NpemVf
dCBmMmZzX2ZpbGVfd3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCAKaW92X2l0
ZXIgKmZyb20pCjQ2OTIgewo0NjkzwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2Rl
ID0gZmlsZV9pbm9kZShpb2NiLT5raV9maWxwKTsKNDY5NMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qg
bG9mZl90IG9yaWdfcG9zID0gaW9jYi0+a2lfcG9zOwo0Njk1wqDCoMKgwqDCoMKgwqDCoCBjb25z
dCBzaXplX3Qgb3JpZ19jb3VudCA9IGlvdl9pdGVyX2NvdW50KGZyb20pOwo0Njk2wqDCoMKgwqDC
oMKgwqDCoCBsb2ZmX3QgdGFyZ2V0X3NpemU7CjQ2OTfCoMKgwqDCoMKgwqDCoMKgIGJvb2wgZGlv
Owo0Njk4wqDCoMKgwqDCoMKgwqDCoCBib29sIG1heV9uZWVkX3N5bmMgPSB0cnVlOwo0Njk5wqDC
oMKgwqDCoMKgwqDCoCBpbnQgcHJlYWxsb2NhdGVkOwo0NzAwwqDCoMKgwqDCoMKgwqDCoCBzc2l6
ZV90IHJldDsKNDcwMQo0NzAywqDCoMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoZjJmc19jcF9l
cnJvcihGMkZTX0lfU0IoaW5vZGUpKSkpIHsKNDcwM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldCA9IC1FSU87CjQ3MDTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIG91dDsKNDcwNcKgwqDCoMKgwqDCoMKgwqAgfQo0NzA2CjQ3MDfCoMKgwqDCoMKgwqDCoMKg
IGlmICghZjJmc19pc19jb21wcmVzc19iYWNrZW5kX3JlYWR5KGlub2RlKSkgewo0NzA4wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVPUE5PVFNVUFA7CjQ3MDnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKNDcxMMKgwqDCoMKgwqDCoMKgwqAg
fQo0NzExCjQ3MTLCoMKgwqDCoMKgwqDCoMKgIGlmIChpb2NiLT5raV9mbGFncyAmIElPQ0JfTk9X
QUlUKSB7CjQ3MTPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWlub2RlX3Ry
eWxvY2soaW5vZGUpKSB7CjQ3MTTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0ID0gLUVBR0FJTjsKNDcxNcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKNDcxNsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0KNDcxN8KgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKNDcxOMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlub2RlX2xvY2soaW5vZGUpOwo0NzE5wqDCoMKgwqDC
oMKgwqDCoCB9CgoKNDExNSBzdGF0aWMgaW50IGYyZnNfaW9jX2NvbXByZXNzX2ZpbGUoc3RydWN0
IGZpbGUgKmZpbHApCjQxMTYgewo0MTE3wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlu
b2RlID0gZmlsZV9pbm9kZShmaWxwKTsKNDExOMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsKNDExOcKgwqDCoMKgwqDCoMKgwqAgcGdv
ZmZfdCBwYWdlX2lkeCA9IDAsIGxhc3RfaWR4Owo0MTIwwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25l
ZCBpbnQgYmxrX3Blcl9zZWcgPSBzYmktPmJsb2Nrc19wZXJfc2VnOwo0MTIxwqDCoMKgwqDCoMKg
wqDCoCBpbnQgY2x1c3Rlcl9zaXplID0gRjJGU19JKGlub2RlKS0+aV9jbHVzdGVyX3NpemU7CjQx
MjLCoMKgwqDCoMKgwqDCoMKgIGludCBjb3VudCwgcmV0Owo0MTIzCjQxMjTCoMKgwqDCoMKgwqDC
oMKgIGlmICghZjJmc19zYl9oYXNfY29tcHJlc3Npb24oc2JpKSB8fAo0MTI1wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEYyRlNfT1BUSU9OKHNiaSkuY29t
cHJlc3NfbW9kZSAhPSAKQ09NUFJfTU9ERV9VU0VSKQo0MTI2wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOwo0MTI3CjQxMjjCoMKgwqDCoMKgwqDCoMKg
IGlmICghKGZpbHAtPmZfbW9kZSAmIEZNT0RFX1dSSVRFKSkKNDEyOcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUJBREY7CjQxMzAKNDEzMcKgwqDCoMKgwqDCoMKgwqAg
aWYgKCFmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkpCjQxMzLCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKNDEzMwo0MTM0wqDCoMKgwqDCoMKgwqDCoCBm
MmZzX2JhbGFuY2VfZnMoc2JpLCB0cnVlKTsKNDEzNQo0MTM2wqDCoMKgwqDCoMKgwqDCoCBmaWxl
X3N0YXJ0X3dyaXRlKGZpbHApOwo0MTM3wqDCoMKgwqDCoMKgwqDCoCBpbm9kZV9sb2NrKGlub2Rl
KTsKCgpUaGFua3MsCgo+Cj4gVGhhbmtzLAo+Cj4+Cj4+Cj4+IFRoYW5rcywKPj4KPj4+IFRoYW5r
cywKPj4+Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLCBGSV9D
T01QUkVTU19SRUxFQVNFRCkgfHwKPj4+PiArwqDCoMKgwqDCoMKgwqAgaXNfaW5vZGVfZmxhZ19z
ZXQoaW5vZGUsIEZJX0VOQUJMRV9DT01QUkVTUykpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biB0cnVlOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJldHVybiBmYWxzZTsKPj4+PiArfQo+Pj4+ICsK
Pj4+PiDCoMKgIHN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX25lZWRfY29tcHJlc3NfZGF0YShzdHJ1
Y3QgaW5vZGUgKmlub2RlKQo+Pj4+IMKgwqAgewo+Pj4+IMKgwqDCoMKgwqDCoCBpbnQgY29tcHJl
c3NfbW9kZSA9IAo+Pj4+IEYyRlNfT1BUSU9OKEYyRlNfSV9TQihpbm9kZSkpLmNvbXByZXNzX21v
ZGU7Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+
PiBpbmRleCA3NGVjYzllMjA2MTkuLjA2OTgxMjliMjE2NSAxMDA2NDQKPj4+PiAtLS0gYS9mcy9m
MmZzL2ZpbGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4gQEAgLTgyMSw3ICs4MjEs
NyBAQCBzdGF0aWMgYm9vbCBmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvKHN0cnVjdCBpbm9kZQo+Pj4+
ICppbm9kZSwgaW50IHJ3KQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+
Pj4+IMKgwqDCoMKgwqDCoCBpZiAoZnN2ZXJpdHlfYWN0aXZlKGlub2RlKSkKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+PiAtwqDCoMKgIGlmIChmMmZzX2NvbXByZXNz
ZWRfZmlsZShpbm9kZSkpCj4+Pj4gK8KgwqDCoCBpZiAoZjJmc19pc19jb21wcmVzc2VkX2ZpbGUo
aW5vZGUpKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+Pj4+IMKgwqAg
wqDCoMKgwqDCoCAvKiBkaXNhbGxvdyBkaXJlY3QgSU8gaWYgYW55IG9mIGRldmljZXMgaGFzIHVu
YWxpZ25lZCAKPj4+PiBibGtzaXplICovCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
