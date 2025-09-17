Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5BDB7DFE8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Sep 2025 14:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoU99TRPFimJDTQZAmcsnCC+LAonjyCcMLd1KYpAavs=; b=dVgyOVeV/otLoEaDJPYvgFTIfz
	OlY8ZB6Rpg6OPDsM+jdvmm9UXrNSWWdFmS+v1v0Kn8Y1BBhGMzo6//93eNFtUEX02o+m8V7oQTv0V
	nhj8lW8mAIcJXSOCgtU44WFDBHneKAQZTzpwxFl/QNcSqUFQmaLKKxVCg/EM44vU4CrI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uymOV-0008GL-8v;
	Wed, 17 Sep 2025 07:15:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uymOT-0008GB-LC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 07:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TaSvyC0rr0YNAR4i/Peghj6SEuyofv2X3eloz17dKmU=; b=O+dIZaTS4zus4WpO9W4eSvjKGe
 KiWO0Y4KkXSSQhJXwoc03DC16zEIK+VZUpDIBUWiNQVA0PXH1xcpHGnClNkmSoqj5ZU01rqrmQi1k
 8vGEOw4teMNUS1w9Vsm23/5pDocsZXakdINikZrLPmPlx+7oZ/dfziOOMbQLB6utVjwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TaSvyC0rr0YNAR4i/Peghj6SEuyofv2X3eloz17dKmU=; b=F6TK099HlRyD+XckLxkFPmF7Be
 U2O760UoK8GYcu293xNw+2NGzoNgZVAVPQZGn0+lUUp2SJdo8mqMxtTMiUfeL4Ivs9jIY09MiVYO9
 yHQ2aT8mbuXlf9KhQXkj0FNhNfaiCcablRoy19PWFerVxLeHODih4Dg93B4G3L4xTVAM=;
Received: from mail-japaneastazon11013004.outbound.protection.outlook.com
 ([52.101.127.4] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uymOT-0006V4-2j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Sep 2025 07:15:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPzYw4JE2485IMpndDB0Jl6JNWi6OK2x7aKPd6NgTcj4fjvC6dp4LW9AcrxnS4GJd+L/Iy3n1UjjQtdmJzzKB14wTkMp5jPMvLqpfBNWh7Z938Mgftm1gdt6RSzOJPLDmjmrXqXQavEmsH74Vy+CuNPHIQ5VwMvkuN1j0AIxAVEXN0s1D+bTEpnwa+tcrfIQPmQyK/vD13swNT4jkZ6DuauOE+H9HS1IfxPaBxC0lpeiA8AYWWBJI0OiPqpu6t5jRuwhRyrSRGLeF2W5mjs7BnShEvOy3AkUSdi0BJWYwhNNnlqz41KRb1bGUIkekgDWXsMOHoVHV9Rh6JL0XJ9HpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaSvyC0rr0YNAR4i/Peghj6SEuyofv2X3eloz17dKmU=;
 b=YAts+8RaDgfU7T//3IxtXm8yGbH6uYlXaDF4Q9oISu5MtdpFXxjuw7el1V7JV9oq4RVF4UNa9ZEcTNdva3sn8wEsUyhl/ZfQyrJOpmGIKkGDR8ko9YJleLLoQj4a+b/jHaStvwZs0Y4GNczRLgmuhj8f15LoqgzyYkBVnHPwq+oL7gxlbIdzYjdMPzMzVaOVH8VXN8YspTKi0XoaVRtH8hzuKVI8iveq7vX3X/LoLiYj+dx+u74GmcUDopNG5z2y2ZoQIVGJ6Y+Oeqhk28Fh5VNQNUXfeKMY3iscD2fPcNGoSrWMroospaPfbr9APy0lkttqrpNoATLgNHLNoIrisA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaSvyC0rr0YNAR4i/Peghj6SEuyofv2X3eloz17dKmU=;
 b=SL2jM3n0YzHAtTxJRPpfH3MSnaUscmgFTTEWk+clbNg5hasUi98E6V56KAxfy6Vf+X7ueXsRRwI8AaEExKRVH0qi403nxOAx0kzuoLd2Tpexbe1llzJJBobTZ4xRLqe4oJtULFZNLb1OobBS03lSwExQBsIf063BYPKELv+VT0pbfxW3YOHuD4G7589afRH3SnVg6ZXkldMzSXOmWX7UARY14e6QfmuK/uKhCgvAMLCFD3QLff70mrHh6NIM+kzHLL8dQXn5OA/0+ZF4RN44/DmZ6ApMJj3m7kXeGWU/TFwcphLtcXhPLb9sq7Ste5Vgp1QoophJTtQTmG6sboRxVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSQPR06MB7251.apcprd06.prod.outlook.com (2603:1096:604:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Wed, 17 Sep
 2025 07:15:43 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 07:15:43 +0000
Message-ID: <9c5db535-f10e-4743-a8c7-e74f2680f2d0@vivo.com>
Date: Wed, 17 Sep 2025 15:15:38 +0800
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250909134418.502922-1-liaoyuanhong@vivo.com>
 <20250909134418.502922-2-liaoyuanhong@vivo.com> <aMjLMwNDjabD8MVH@google.com>
Content-Language: en-US
In-Reply-To: <aMjLMwNDjabD8MVH@google.com>
X-ClientProxiedBy: TYCPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:405::21)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSQPR06MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1803b5-2114-4ae2-04bb-08ddf5ba0382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1Y3VVcyTjZqUFBRU2J0N1NYMlRpZEV6cXZqeWg5U3pWRElsQjJ0OWlGVnZS?=
 =?utf-8?B?L0dObEFEdG5EWlhrdGE0TXRYaWo5WGptcWpmYVA2TXprOG5CQzd4Yjg3cmVC?=
 =?utf-8?B?S2hCc3NxYnAvZjNNb2NRNEVCajBFSnNoeEl2Q0JOd1pyemExdTVVWTNWeHp2?=
 =?utf-8?B?ejl6RVRIZnVMdXJpRlRBNUxiSEErbUNkT2ZhOXYyY1N2L1A0VW00UVNSa0o0?=
 =?utf-8?B?ampKS2NsRlh4NVlITWNvWG5jeE9DaXA2djgrWFhaWUREWVVJUXp5SmFjb1hk?=
 =?utf-8?B?c0JULzZ1Q1Y3ZmlTanBmL1ZuQVJLcGV2cWpUdXMrZXF6dms1dmNRODZ3Uzls?=
 =?utf-8?B?ZytvQ282K2dVaTk4aG9Yc0tXNnhXWWcyaCtBTGc0Z0xHWkZVcGNIQ0hiZG9x?=
 =?utf-8?B?VENBRmpHK0dpMmN1M3cxUEtyUHNaNTlwcGQrSGFWbVF4TWpCQnRsTkJIYm43?=
 =?utf-8?B?NFpWdnpFeDE0LzhBSHNPZkJQNEs4b1cwVlhicVphQ015VzJ2RWpuRlZwUmFP?=
 =?utf-8?B?WVQwdlNlV1JwTk83azJYSlk5UGZTb0hXQWdEYkxQbUQ1Mmc4WUxwek1COWw5?=
 =?utf-8?B?RkIxeGF1WlhxelRTL3FtQ3FTbzM0VUk5WHNqcTZrbFdNckVCRzFZb2JML0s1?=
 =?utf-8?B?K2lNYXdYYjlvVlhIa25UMTY1K24rM0JGRkRZVktVTDYvZGhTeTVuL2dLbkIz?=
 =?utf-8?B?T25wQ0t0Y042cXZJZzhkb0tlc1A0R1hsSGtRL1pDZXVlMkZheS9pWHErNGdi?=
 =?utf-8?B?eU44TW9FaTlLc1dtWDI2RDBrRGxZNEkvZUM0MUo5Vi9jamJWbVJNdU1FRi8y?=
 =?utf-8?B?R1NiUkpHRzNxSTZORjU5UjRVdlNCbDRVeWQ2M1ZRWmVBUEgyME1ZZFV1c09O?=
 =?utf-8?B?Z3JqZGlDbXhuNDRYcjB6RGhDMUU1Ykg3Vk1RTnAvWHdZL1J3WFVoTy9nS3pK?=
 =?utf-8?B?ZGpXN0ZWYTdzSEtCbnNLZ1dpSmxSaG5oU3JMTm1zeUJjUDFLQm51U3NKNm00?=
 =?utf-8?B?RlhWQ0hWckF0dGp3c2FZTExhSUlqeXJRbmdwNXcwdUREMnQxRFJPU0xJYUZH?=
 =?utf-8?B?RVNxMDQxR2llT1JnaWxTdHJucGI5akZUUWtsU1IzMTNsdmRDV0gvQWJyRmRN?=
 =?utf-8?B?dXFIcjFEMVVUWngvRjlIc0E2bEFxL0xOeURDWk5DMXFjOFhoVldnZTBYMTlo?=
 =?utf-8?B?blNzQURaRWQrUGw0U0xoM1NsWEp6TTdQeXFWN3hpelJYU2IwelhWWlhJSy93?=
 =?utf-8?B?ZVQxZmFaVG03aHNzRnVQVjhuYi9tTkp5clpHVmdJT1ozZ3ZJbkRkMWZ6U2Jj?=
 =?utf-8?B?Q1lEeVRmeG9zejVGOU1FRGdtYVJENnZDcE5kcEtEeUI2em9lYzNxNDdIY01k?=
 =?utf-8?B?dUhhNmpSMmJiNTcwc2EzcTdEazdCa1cycHpnaUVaY0w5SlROMTUrRU9sckVX?=
 =?utf-8?B?WXA3YmtNTVo4WDViTXhxbG53LzRVS0t5T0V2d3dubzk0VEhSWDFtcEdJcllI?=
 =?utf-8?B?VW9tbmt4aFcvdUFENkIzMzFqbUt0SVo5YWhhY3F0VHoxeDc5T1ZISzJ4eHN2?=
 =?utf-8?B?RmRsOFV2THNtUUJQYWlPcHJoblJGSVJHSzdxTzBBbHk4SmhrSDFEQnAwWGFL?=
 =?utf-8?B?aUpkb2lOQ1ZHblQyaWVXUmZTWHRHYnFyOWtBWk5qcFhQelJ5WWhuUnRyd1lu?=
 =?utf-8?B?cGM5VXFkSnZFVDJUNS9RUTJXMnhqajF6TFBQaFM3cTlQbVByNHZDUHoraTZ5?=
 =?utf-8?B?TnNmanBaSlltcmp1WThYSlNGZmU0ZTFTK0p5VytxSVNPOVVuQWw0OHUxUXpN?=
 =?utf-8?B?R2F1U0o4b291TjhPT1BwK2lyd0FhV3BmRWlkTGtTTDIxcFJxSExZbmdqZ3ps?=
 =?utf-8?B?UzJmelF2M3JmcmY3OGJhT1JTUEZ1TjJ2S29lNFg5d3dkVFdxS1lGSnh2SkpE?=
 =?utf-8?Q?FGDjQV92ZW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0lLRUc0cDdhN3pVSXhtZFh2YnV1eWhqL2hMN0hyaXNtR3UxYUZINFNuKzRi?=
 =?utf-8?B?VjJTOFlUcVN5YzVEcE0zVm96d21wY2ROdk8wb2JCZVptTGdsMmlYUXhYd0Fs?=
 =?utf-8?B?cWtsakFTSVV6am9BOU93dmtrcmFGU0NsTXVCUnB0V0JyWnd1T01OcC9uTkUy?=
 =?utf-8?B?Nk5BS3pFZ2tRWU9vak9KbTNqYmZBemhmT3RaV1BjQzNBNGZMVnMrczgraXBD?=
 =?utf-8?B?WmlZWnlleGVOL1dmY3ZNbEw4ck9NSUs3alpjakZBY2lzdlhCSWVObkE2Vitm?=
 =?utf-8?B?NHJsNWR0a3FLcjVETGJkcUxyQmsxNGU4STREdEpqZnRwUFBrU3VQdTlObGhr?=
 =?utf-8?B?VEtiNXBFQlpDaXBLWVBSNVdUY3JWc3ZyeXdVVnBCRkY0VnNhMFFwQnhuWDR5?=
 =?utf-8?B?NU9nd3JPNXhzdU9lY2puWHBrVjl6eTQ5Ym5yeklZMlhLaGtBRDExNWN3eEgy?=
 =?utf-8?B?MjdtT3ZJTzVKYXdCYnd2eWQvSEpGZG4wcEJtMnBYellLWVdENDdGZzhHSmQ2?=
 =?utf-8?B?eTMzYXV3NWp1YzVKSXErTFZ5VElaWkZyaTNIek1BejVXLzYzVTdaMyt5VFFs?=
 =?utf-8?B?aTNRREY1SWlKY2J0K1NJQUo1V1ZPT0NubzRudFo1MDFhbkxPNmMyNWtJV0JF?=
 =?utf-8?B?RUpQNXVWZFNUSXBCMnJhTFpxcC9oM1liUm1zRFIxOThjVFNYQkxjOVQ3UW9w?=
 =?utf-8?B?Vzc1aEpuc0wvd1UzNzBJNXFleXY0dXNzeWM0L3hiUGtoQWpnUTdkdE9qOUMw?=
 =?utf-8?B?REZRYmdIRkpUUDk5L0R2TzV3ZVNPdG53c1l1Q2JWMFBNbldwUnNCL09XeHpX?=
 =?utf-8?B?ZTBwN1NiSytJN1NtbFRXSGEwOStlSGlGT2pTcTBNbFRnZG5MNnQ5Rk5HcXRO?=
 =?utf-8?B?WnNuc1dLOEdXckhSazljWTZkTU0zSktnSlMrL3cvYzVxSER4S21IOHhRZm8r?=
 =?utf-8?B?QkdQd0dYdGYyOHJLaWQ5OERMNElQS2ZYbjJlOFFpZE9zM25RTmRRVkdhR2Fr?=
 =?utf-8?B?Zkgzem9tcm5xOHVaV3FvUlB4a1NWN3FxUFlVeEQvTkdYRTNLUXJseGQ2L1lo?=
 =?utf-8?B?S25hcGlxelhGRHNzOW1WL1B0c0J3Q3BFb0Y3akRJQmJqVjZ0bURkYStNZ1Js?=
 =?utf-8?B?YUNtNTJkNG9Gd3pUVHVDbkpoYW5RRncyN0NRL1RFdi9qbmx3VjFra2Y0Sm5t?=
 =?utf-8?B?aTRHVlhUMGhTd0t5TjVTdEJ3cERtd2hNcUo4dktRK25aQ3UvQTZ3VWpHMTBs?=
 =?utf-8?B?bXBPSHZlMnpENFlseEtzYVJETzBzUGQ0eWdsUksxZXlSTnBzZjgzblVwYW5F?=
 =?utf-8?B?RjJVS2M0NEtBcXluV2E5enZOejNIZ0VhbkpkbWl3U0NjeFBxLzdqUWI3ZnYz?=
 =?utf-8?B?LzZ4dnIyNWhuS0laMGVtdHNsc01ra1dEVFRsSi9BU1ZsQXNLd1JTcUVoVTIy?=
 =?utf-8?B?ODZSQmdpcjl4WmgyaTJNam5WZ1h5UFM0LzM1a1g3R2NoVEk1dHpiVzVuUFN5?=
 =?utf-8?B?aSs1Q3MwbGQ5TWlKWHBiVHY1Z1J6ZnUvbVkxMm5aaWh6a2pPcmZlSkdQU2xi?=
 =?utf-8?B?TTZTekI5SGtkYlR0L04wM21KdVdtM0NuM0lrVjdXbHNUYnJqbjMrbFc4NVc5?=
 =?utf-8?B?S0tUNnZYSzY3bTlYTGc3amJoV1hUWDZBanhWZlowR0lZZytpOTN0UkMxR2JY?=
 =?utf-8?B?Tis5cDR3ampSY2hCU0pBWkVLaGhOTWU2ZERWR08yUWJTdTlweVJrS1JMbVdi?=
 =?utf-8?B?OS9mU2xVT2dBZ1R1Zk40dDh2OHlYU2xMT25LVWo3cUpKWjJoU1RDYkdtazNB?=
 =?utf-8?B?QWF5Z2Q4NXBxTnN4SEMvdytQLytjQmM3bUdKUmRpemsxRkJGeUc4R1JGajRO?=
 =?utf-8?B?MWpSbmtncWtyVzZncUl5aTVVVGROVG9hOUp1SDhheUlONTZ0OXMwUVowd3dr?=
 =?utf-8?B?RWM4YzZHSnJENkI5V1F0S0QwRFpaZmZXT0E1NHI5UU01SkZhQU05VVBoRlVk?=
 =?utf-8?B?SktEd1dHYU1vL3pqbzJtUmYyZGN2TENTOEQ0NUhLbmZKZ0VuUTN3KzVYMTdt?=
 =?utf-8?B?Wi8zTXU0MDdJMStpRnJFN3U2d2VVNlJGRTh3Q3E2SFllR2hoRDlRMnZEc1VZ?=
 =?utf-8?Q?mt6TMa5Iy2NyNCZIJw6eVq5BY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1803b5-2114-4ae2-04bb-08ddf5ba0382
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 07:15:43.0298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: os3RE0hDN0ZRq2ONNISb6xC1o3DtzPcC88yeSEqNl3hS0L+Kl7GfEywulXzOwZN4EsgixjvhWdVMIzHJKokAHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7251
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/16/2025 10:28 AM, Jaegeuk Kim wrote: > Could you please
 share some trends of relation between has_enough_free_blocks() > vs.
 has_enough_dirty_blocks()?
 I'm wondering whethere there's a missing c [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.127.4 listed in wl.mailspike.net]
X-Headers-End: 1uymOT-0006V4-2j
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: Optimize excessive write
 operations caused by continuous background garbage collection in Zoned UFS
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 9/16/2025 10:28 AM, Jaegeuk Kim wrote:
> Could you please share some trends of relation between has_enough_free_blocks()
> vs. has_enough_dirty_blocks()? I'm wondering whethere there's a missing case
> where has_enough_free_blocks() is not enough.

Sure. I will find some time to test the data and create a table to see 
if there are any omissions.


Thanks,

Liao

> On 09/09, Liao Yuanhong wrote:
>> Incorporate a check using has_enough_dirty_blocks() to prevent redundant
>> background GC in Zoned UFS. When there are insufficient dirty segments,
>> continuous execution of background GC should be avoided, as it results in
>> unnecessary write operations and impacts device lifespan. The initial
>> threshold is set to 3 * section size (since f2fs data uses three write
>> pointers).
>>
>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>> ---
>>   fs/f2fs/gc.c |  8 ++++++--
>>   fs/f2fs/gc.h | 10 +++++++++-
>>   2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index ed3acbfc83ca..4a8c08f970e3 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -120,7 +120,9 @@ static int gc_thread_func(void *data)
>>   
>>   		if (f2fs_sb_has_blkzoned(sbi)) {
>>   			if (has_enough_free_blocks(sbi,
>> -				gc_th->no_zoned_gc_percent)) {
>> +				gc_th->no_zoned_gc_percent) ||
>> +				!has_enough_dirty_blocks(sbi,
>> +				LIMIT_GC_DIRTY_SECTION_NUM)) {
>>   				wait_ms = gc_th->no_gc_sleep_time;
>>   				f2fs_up_write(&sbi->gc_lock);
>>   				goto next;
>> @@ -1750,7 +1752,9 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>>   
>>   			if (f2fs_sb_has_blkzoned(sbi) &&
>>   					!has_enough_free_blocks(sbi,
>> -					sbi->gc_thread->boost_zoned_gc_percent))
>> +					sbi->gc_thread->boost_zoned_gc_percent) &&
>> +					has_enough_dirty_blocks(sbi,
>> +					LIMIT_GC_DIRTY_SECTION_NUM))
>>   				window_granularity *=
>>   					sbi->gc_thread->boost_gc_multiple;
>>   
>> diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
>> index 24e8b1c27acc..1ef234c2702b 100644
>> --- a/fs/f2fs/gc.h
>> +++ b/fs/f2fs/gc.h
>> @@ -36,6 +36,7 @@
>>   #define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
>>   #define BOOST_GC_MULTIPLE	5
>>   #define ZONED_PIN_SEC_REQUIRED_COUNT	1
>> +#define LIMIT_GC_DIRTY_SECTION_NUM	3
>>   
>>   #define DEF_GC_FAILED_PINNED_FILES	2048
>>   #define MAX_GC_FAILED_PINNED_FILES	USHRT_MAX
>> @@ -177,6 +178,12 @@ static inline bool has_enough_free_blocks(struct f2fs_sb_info *sbi,
>>   	return free_sections(sbi) > ((sbi->total_sections * limit_perc) / 100);
>>   }
>>   
>> +static inline bool has_enough_dirty_blocks(struct f2fs_sb_info *sbi,
>> +						unsigned int limit_num)
>> +{
>> +	return dirty_segments(sbi) > limit_num * SEGS_PER_SEC(sbi);
>> +}
>> +
>>   static inline bool has_enough_invalid_blocks(struct f2fs_sb_info *sbi)
>>   {
>>   	block_t user_block_count = sbi->user_block_count;
>> @@ -197,6 +204,7 @@ static inline bool need_to_boost_gc(struct f2fs_sb_info *sbi)
>>   {
>>   	if (f2fs_sb_has_blkzoned(sbi))
>>   		return !has_enough_free_blocks(sbi,
>> -				sbi->gc_thread->boost_zoned_gc_percent);
>> +				sbi->gc_thread->boost_zoned_gc_percent) &&
>> +				has_enough_dirty_blocks(sbi, LIMIT_GC_DIRTY_SECTION_NUM);
>>   	return has_enough_invalid_blocks(sbi);
>>   }
>> -- 
>> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
