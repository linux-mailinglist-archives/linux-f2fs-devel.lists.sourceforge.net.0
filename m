Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3543B334D1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 05:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OetlaQ8sDOdKacm+BAUFjXhtVeOosuPLbKmfmwdhgQM=; b=asIsfX25xc2uytz01FEcuQ8e6o
	BJFh/58XaqDqg5IkgoBCM2QupMSdXhCS2OqOhjjbGqL1ab74nytWcErHOQcniMep7P8dmoXNzVKBI
	ujypI/r4iGhfHHW41x51ponGtzy/RrfC1rMs3+IIdnLje6rlbR0iPA/3jI+K2yQhroJk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqO6Y-0001MN-LL;
	Mon, 25 Aug 2025 03:42:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uqO6W-0001MF-36
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 03:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g55CDK7gojscEPODhr3ztUfXx/BJ+KubG1j//cfBYfo=; b=BondOxyaKaA7v56iy4E827+j+Q
 Whqud5Qk8dwvIQqymvVwBWCimobEkaUUtva6aO0NQFdMkkRc+MizP8LRqzdgLuuwkSMyk9TZalnyy
 LQulY7f6HWD/GlZ8ahsqCb8ZB3YcR9n1WxkCH0CGuBxJ7NiuNdOvZpKsQiJl+s7mpoSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
 References:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g55CDK7gojscEPODhr3ztUfXx/BJ+KubG1j//cfBYfo=; b=aXe8lIPQWU5YPe38QovJf+U3NA
 YHBROrkKOKwX2zbD6Cciepei8oi+GO9QQhhu1J24pk8OqKRmiyGuhk2RMziCBrA2degO9QIsYblUk
 2RRlBsAVcZYJArcljSgnQxKDP8Bn6xO1Q6AITE9bkwnnBNVWx07xhtAOzp5XVSdRA9Jc=;
Received: from mail-japanwestazon11012006.outbound.protection.outlook.com
 ([40.107.75.6] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uqO6U-0007Nq-Ix for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 03:42:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyDrdejXP3uI4fT54OmjAuLVHIpSFmsvThzf2zjboLg6eHuY+jCv5xnZd1YFrH83KUQ4x97m93B54MHAW1JtbfZdrDsAApZFqcg/LpUm9Mm0jeX06tNpgA2AWrFgsh+YWfbkPJfzRNWMC/T3pVTuDf4BOFPb6n32HdmE8WMBYmt2Em0mvJecpZqC82iLfYvE1eeNsDn17OS1LaH2QYLHmPNdo5KyBb+9WbG6wfcvWuLuDb7wBbQy4mtMdjhpnhJvu8gDv/FQ8WMiAsvZ8B/rXw4FiXgopohCZy3sjqpYVYOLEZtf55gd5VIw2YKeRCuaegNtSfkXZ0dWZqnWXn2zWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g55CDK7gojscEPODhr3ztUfXx/BJ+KubG1j//cfBYfo=;
 b=V1lEZUv2gNL0PwnlSL7ZXzrj7hXm8qv+Y3cCTZjdCxCKUVaDLX7ZwgC6+0D51ECOx3mEFDzcHlPEBXxiIUV1UEit5UFby1thy383z//WiC+Yym1guPqmmjt0m38Buvlj4923BCJBHWvXRwonuOthV0L9LbHRj35igL1gDhB8oOILfPDziZsOJgFOsoiRuOo/dwXyUrePO2PDMe6xPieH1rfMRWtrozpMbH5kEtnslh6oyZ/s4gG6In+vXEzmFtNcBJwiFgZTdDB0EdXWE28+vqMh71vphfya/6Q1XkRpckTmNPjcvwo+5r8zEowr1peOBbbdtaLehit95Oai1JKwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g55CDK7gojscEPODhr3ztUfXx/BJ+KubG1j//cfBYfo=;
 b=b+UklJPNyZFD/0Wmd35uORplDxXfiYA04teQISyBTiDWH8+sVompqcAm2IBRrMe2XkFJ22+Ptqnir6ijFgGFbcUqm7ZE0OJrlT+szZL85dvbMsf5ixqX2KclIxql/VI17GHNytjcLfAHYuvkix0SFe059IPDHPZb4BW+5OHNT6ufE1sFQ9Hr/5CKbEqBnCiBaI3Z3TTDLfQq2a04kd3vMviIrnyR03mwDvb+rFDvooTosYMmMQ/3A+HT8gzH16ru36gSdIcWc491Elh7IhyBCMM82M8BvOCnjrkqi6b+s9vmOPniG9elZCplpDkuO2oD2KCTwETtylIHXl1rMhDVcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6670.apcprd06.prod.outlook.com (2603:1096:820:100::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 03:42:33 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 03:42:33 +0000
Message-ID: <f037ec6c-1290-4caa-a790-1d65d9f7c985@vivo.com>
Date: Mon, 25 Aug 2025 11:42:28 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 open list <linux-kernel@vger.kernel.org>
References: <20250820082142.388237-1-liaoyuanhong@vivo.com>
 <8bda5b71-e7b9-47af-956b-22b95c957d56@kernel.org>
Content-Language: en-US
In-Reply-To: <8bda5b71-e7b9-47af-956b-22b95c957d56@kernel.org>
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1466fc-33bf-4bb3-27e6-08dde3896ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzJodUwwTW9EeGhLZFp0bmNuczNjMDZUZ2k0YzA2QkpQV3ZVNE1xVnpVWkJh?=
 =?utf-8?B?L0NKNXZ2bTZsQjhDNFphckViOWZlYkRmbnExVmhEZUxodFh5Umxreml4MWNK?=
 =?utf-8?B?U09NU3FUN2FpVXQwTFFLQktwVFJXZ3ZpSzdlS3MzcVlXR3ZrOWl6SGxKRDhI?=
 =?utf-8?B?aFJXcFVHTTdQaDhCZ3VFdFhXYjU1VUphbkQycUhyZFg1TlhpL1NzZWVqcEZw?=
 =?utf-8?B?bGV3YWZobkFqeWVoYmlrUHpDODlrYm5wZDN6MjR3RHZpMzdDR2FBbWg4RWlT?=
 =?utf-8?B?MEtOeTUxK0UxMWxpVE0wR0szelJyeW04OFYwemp2ZkVwSFcwVGhDQXE2ZHJa?=
 =?utf-8?B?QU5Iai8rZkxUZDUrdmMxL25OSnI1Nm1ibm9DdzZPaG9kL1NBd1RDcFFBTkJQ?=
 =?utf-8?B?WTk3WDVlVzN4MTg4cE4vK0xLbHA0RnY1dEtwNDdtUW4rSFBMNkp5azg2RHll?=
 =?utf-8?B?K1ZNaEVITFlZdWxnWVI4T2x2bTh1azcxMjJNQnhQSy9leWFiVXA4b21Cd01a?=
 =?utf-8?B?VXpRME04NXB1UTNXanR0NExLM09Wb2RWSm41M3N2ME9GSGVhcTJEc0xrUnhr?=
 =?utf-8?B?RDFBRDYxYmg1VEoxRjNKcm0xN0JCeHhYaWRlTFprQVJUM0hPRzYrR2tGTWFm?=
 =?utf-8?B?NHhoU1JlUGN6eEJZL1FmRktBMkgyZmFBUVlqdTJUNGZMYXg4WVU1eUR2MTlI?=
 =?utf-8?B?a3hBVEtvNDl0NHByUm81S1JHZ1U5L1p3VmZPUUxnbW9IK2RmcWpScTFMUnFw?=
 =?utf-8?B?aVl2NEdGNzdOM3I5aEt6YkFGYWlMLzRkNnJLZWJtenVsQ3BCWWVpSjlOb2VF?=
 =?utf-8?B?ZTJGSDkxQjNiK085Ymg3NmJhWk9nZ1VobEYvc3p2NWdtNzVKSmxVSjY4V3kr?=
 =?utf-8?B?YXQrTVYzaHNxNWRjS1MwemVyY2xHMXo2NG9NVEZ3UE1Iajc2R3pOeXpMeUth?=
 =?utf-8?B?QU5mUlhHTExEaG9tc1UzZlNzSEY0TjVVWk5xeTBFemlScHpYeGhMam9JakJx?=
 =?utf-8?B?YnVCN0ZvRWtWWHdhT2pROFhhalMrUk9pZE12ZU5zbGpFM3NQNFdHK1M2QnFn?=
 =?utf-8?B?Zmd1STRTeXk1T1g5R2VEdGJHTVcxR044cGEwYTE1MThBak5vMGlwZ3hHU25L?=
 =?utf-8?B?aHU4djhqMkJrdlNWQUZZcnZaVG4zejhlNDZ0d1NxdFdLb0hwTEJ3M3lqOW45?=
 =?utf-8?B?WFFiSit5Y2tIRnRKWitMUStVeW5XeGZNTXlHb1BQZitoMlNWYVJjOVJ0b25C?=
 =?utf-8?B?dHFZTzJMQzhqS05CTVFEbEZxQU9lejU0bDlqUnYrajU1SHZieGc5R3pnYmdh?=
 =?utf-8?B?QTBRajNiRW5zUWdPWDJNeG1MM1ltcjlZN0FMUDk2dCtadnpzS1UwR3dCa0k2?=
 =?utf-8?B?ZUg0VDlTWVpGN25ieHAwamFEUnFTTXhreGxkR0xVZzdIZ0gvMWFlQ2l0bkVh?=
 =?utf-8?B?QmNKQVV3M0haaTZUWTRjZ0VBOXU3VWwzdGJOTG82MVU1M09kd0QvNm1aejl0?=
 =?utf-8?B?T3JpeVZLVUVlaUNESzU1S29mYW8zSkpsT01BbVFZckFjb0tLaEIzSTNwUEtH?=
 =?utf-8?B?OHFjd3FJNk9oenduVi83aDRYc0pQMy96VmRkUHJhbnRQYjVHdTF4bVhXMDJt?=
 =?utf-8?B?VnNnZFJwNzFvVTlxTVRoZlkrQ29VM09lSGtEb2oza0RqRUVmbGlNRUU4eEZz?=
 =?utf-8?B?MFNab1FBUyswNU0yUUJtcjI3dE4vOFpSMmlGTUVvUWN4NjBTcWVFSHlzQi9U?=
 =?utf-8?B?OW0xZkhmVWVjSWJaTHh0V1gzZ3M3YUtkeERxaVpyVE53am5NNVM5SEdmamVk?=
 =?utf-8?B?a0pIeTMrUi84Sk9XMXRNY0I2T1RadXlHMm8wL05HVUpaT2l5RGJ3aFV0MnpL?=
 =?utf-8?B?MWJUcEl5MjRhT2pwQk40QzdGQmtyTXYyc2g3ZVpYR3BlVXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmtkTEpmNkZYVnVZeGkwMlJaYUhiMEk2RFcyOTk2UklKZ0Q3NDl3VVZRMTh2?=
 =?utf-8?B?RTdIdDJGZThRakJxZGQyR3UzQnlYT3NtOG5XRldDN0sveHZXdTFBOFlVck5H?=
 =?utf-8?B?Y2Rmd3lLRkNLVnkvSmoyQWNiem4wSkZVRlR4RWtGQVkwNnZDQzV0TTBOTEpW?=
 =?utf-8?B?b3NqWkVWYnljVXZpUEJrZ2kyenAzTjNNRzhUd3htRHJFQ2VhZlZUU3ZhRU9I?=
 =?utf-8?B?TEtHbzVEdFBPQ0NBZEFqZWw1aXUvK1ZGemJQaHhrZXk5ZXVsWDlpcno3LzEz?=
 =?utf-8?B?bXlJK3NNOEROeEZOTzljZ1gydE0rWW5BWjJlK2pEMFllbDhOandrUTROY3Uy?=
 =?utf-8?B?YWVpMU1mWERuOEExTnlXUng0Q3l6Uk1FMkVMaWpBMk5NSDdGSDNSd04vZHFY?=
 =?utf-8?B?QldyVXJaMUF6QThFZStzNVpqczQ3V2RzallZeVJGSnJNbmJXbU9XQkpYL0VM?=
 =?utf-8?B?M0l1MEVnaGNwQXZhOVhGaEpTUlNRU21MY1MyR2pSL2lYVm9DNEVIY0o4TS9K?=
 =?utf-8?B?L1dsZ1lQK2FQU1VkOEZPRkVkU0FMQkM3amlHRmlhQ2NoOVVQWU02UE9RWWZ3?=
 =?utf-8?B?d2hlektZL05ORnRieVVPZURpSDZ0MGlWelFqQWdmYnZzS3BGcUMwV3ltMFFH?=
 =?utf-8?B?RGtKWWdaMUtZN0NEbEcxS1ZEdEp5Q3lmUDBpR3RvN2Z3MHRjMUplZW1WVEJQ?=
 =?utf-8?B?RWxpN2Rad1FLMEE0N3ljVzM0eTBxcFdXNXQrcG40ZjNJZzlmbEZFcEhvc1pl?=
 =?utf-8?B?YWlnWHBpME9DZGlUd2JmVEp3cE9Ud3pCL24rNlQ4RndhdlFCSmR0dXF3Z3lP?=
 =?utf-8?B?L0xjYmRQdm54elJES1ptOTZ4VWxkUkZkSTEyVVJDbzZZQ1QrOGV5YUFjdm9H?=
 =?utf-8?B?VVY3NGVKU3p6NWtEZ0ljdEFVR3g4WWtJdTF4ODI0bWFrQ09UOHd0UnpGbzVz?=
 =?utf-8?B?K1JCeUtRcHlnYTdidWV3aUkxaXVRMlF4NlhLZCtiSFl5bkVYdlErcllBRjht?=
 =?utf-8?B?bCtCak9vcTY3ZkpiZUMrVkFkSnFuZ3FPQjd6eml2MzJBemRNRVl3NHBwMkUr?=
 =?utf-8?B?QUhpK1VVZWovUUwyVjcyNVZVUTlvQUdMa0o0M24xSjFub1hXZlp0blFFeUM4?=
 =?utf-8?B?SjlGbmVqTzUxc1lMS2J6WjRUY245SzE2R1prNGlyck45OFozMDVJUCtIVy9J?=
 =?utf-8?B?VzdxVzh5aGdIdlZ1cHEyZGhPN2JSSis3cXdsaFJIZUZKalduQmZpMEtkZ2N3?=
 =?utf-8?B?czNmYmZGLzN4R0xjZDlvY2w0YzByRXdXQ0U0Y2VPYmIwdHh1OURnZk4wU3V5?=
 =?utf-8?B?TmtuaUZFNmlxQTNXeGJiV0d4SnRHRXBnUk5JMVlCam5xUlFma0Rnbi80bkpI?=
 =?utf-8?B?M1REU0tzTXBvU1Fhc016U0pkN3phbkkwNWNyUk5pTSsySkxTL3lwMVBsT2po?=
 =?utf-8?B?Ukh6TFRRb0RFemRkRW8xWUR5K1p6ZDlmZzA4ckx2NXg4SUY1bkw1TzJwekY2?=
 =?utf-8?B?YXZDcjUvd05seStzd0p4b3ArY3ZJemg4aHZyb3docVZJSTFOQlhvbTMrRXJi?=
 =?utf-8?B?Q1hUNitpZ0FmRUJ4cC9zUVpjV2xYODNZWElTUVYwZG9MaC9TOTJNUU9LWWpm?=
 =?utf-8?B?bTNTWWRqTlArN0xJTWJiN2xiS2ZGejlWSzJDN3I2VDhVazFrTlFnY29yQ0hu?=
 =?utf-8?B?T3R4NU9qNUx2L2V2Ukt6QVFGaGVONnR5endHdVloS1Q4U1JNcVFrQUE4STZ0?=
 =?utf-8?B?RmdlR2IrTm83YzY5cEJqQ3lVd2F5YWdXOW5jMVRwYmpubGRmcXluMXkwTW40?=
 =?utf-8?B?Qy9Ra2Q3dGtxU3V5bzRTbkJ5K0w2QjZ6UUFNZFVEL0dKMHVFQzZMRGNpWW5P?=
 =?utf-8?B?UmZvTDR6SE41Qk5jVERjL3NaVE0yWHJWekdkVXR0UnE2ZjBUOWE5QXY1Y213?=
 =?utf-8?B?WDJaNmdMcUdmU2dEdTR3YTZyRHRPT1VwY3FuYUMwTWxpSklGM1phdG5kaVNC?=
 =?utf-8?B?ZncxMDdjWGRCK2p5SllBMXlQb3RiOGcyTnZlbzhzTXpJU2RGZG9SaVdvd2Nu?=
 =?utf-8?B?MFpWSVlKa3ViN29pQ1hkaDZtRkpwek5HUFZtZHRtbzlMTTFKSGZpRlp0b2Uz?=
 =?utf-8?Q?CJb4E7zPCcGIr3tNKl2D/NN/T?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1466fc-33bf-4bb3-27e6-08dde3896ca0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 03:42:33.0830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mJpPupuQu9baVuv8oEzQvHeuUCVNroG17g4iT0AawHhR5gkdlRIUC2w4m7WozOtQMDOyNA99Gl4zKayopgJVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6670
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/25/2025 11:10 AM, Chao Yu wrote: > Yuanhong, > > On
 8/20/25 16:21,
 Liao Yuanhong wrote: >> Introduces two new sys nodes: allocate_section_hint
 and >> allocate_section_policy. The allocate_sectio [...] 
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
 [40.107.75.6 listed in wl.mailspike.net]
X-Headers-End: 1uqO6U-0007Nq-Ix
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Use allocate_section_policy to
 control write priority in multi-devices setups
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
Cc: liaoyuanhong@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 8/25/2025 11:10 AM, Chao Yu wrote:
> Yuanhong,
>
> On 8/20/25 16:21, Liao Yuanhong wrote:
>> Introduces two new sys nodes: allocate_section_hint and
>> allocate_section_policy. The allocate_section_hint identifies the boundary
>> between devices, measured in sections; it defaults to the end of the device
>> for single storage setups, and the end of the first device for multiple
>> storage setups. The allocate_section_policy determines the write strategy,
>> with a default value of 0 for normal sequential write strategy. A value of
>> 1 prioritizes writes before the allocate_section_hint, while a value of 2
>> prioritizes writes after it.
>>
>> This strategy addresses the issue where, despite F2FS supporting multiple
>> devices, SOC vendors lack multi-devices support (currently only supporting
>> zoned devices). As a workaround, multiple storage devices are mapped to a
>> single dm device. Both this workaround and the F2FS multi-devices solution
>> may require prioritizing writing to certain devices, such as a device with
>> better performance or when switching is needed due to performance
>> degradation near a device's end. For scenarios with more than two devices,
>> sort them at mount time to utilize this feature.
>>
>> When using this feature with a single storage device, it has almost no
>> impact. However, for configurations where multiple storage devices are
>> mapped to the same dm device using F2FS, utilizing this feature can provide
>> some optimization benefits. Therefore, I believe it should not be limited
>> to just multi-devices usage.
>>
>> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
>> ---
>> Changes in v2:
>> 	- Updated the feature naming to better reflect its actual functionality.
>> 	- Appended patch description to clarify whether the usage should be
>> 	limited to multi-devices.
>> 	- Improved the code style.
>> 	- Fixed typo.
>> ---
>>   Documentation/ABI/testing/sysfs-fs-f2fs | 22 ++++++++++++++++++++++
>>   fs/f2fs/f2fs.h                          |  8 ++++++++
>>   fs/f2fs/gc.c                            |  5 +++++
>>   fs/f2fs/segment.c                       | 18 +++++++++++++++++-
>>   fs/f2fs/super.c                         |  4 ++++
>>   fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
>>   6 files changed, 74 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
>> index ee3acc8c2cb8..b590809869ca 100644
>> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
>> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
>> @@ -911,3 +911,25 @@ Description:	Used to adjust the BG_GC priority when pending IO, with a default v
>>   		bggc_io_aware = 1   skip background GC if there is pending read IO
>>   		bggc_io_aware = 2   don't aware IO for background GC
>>   		==================  ======================================================
>> +
>> +What:		/sys/fs/f2fs/<disk>/allocate_section_hint
>> +Date:		August 2025
>> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
>> +Description:	Indicates the hint section between the first device and others in multi-devices
>> +		setup. It defaults to the end of the first device in sections. For a single storage
>> +		device, it defaults to the total number of sections. It can be manually set to match
>> +		scenarios where multi-devices are mapped to the same dm device.
>> +
>> +What:		/sys/fs/f2fs/<disk>/allocate_section_policy
>> +Date:		August 2025
>> +Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
>> +Description:	Controls write priority in multi-devices setups. A value of 0 means normal writing.
>> +		A value of 1 prioritizes writing to devices before the allocate_section_hint. A value of 2
>> +		prioritizes writing to devices after the allocate_section_hint. The default is 0.
>> +
>> +		===========================  ==========================================================
>> +		value					     description
>> +		allocate_section_policy = 0  Normal writing
>> +		allocate_section_policy = 1  Prioritize writing to section before allocate_section_hint
>> +		allocate_section_policy = 2  Prioritize writing to section after allocate_section_hint
>> +		===========================  ==========================================================
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index d6a49de1b7e9..5ce9bf6be462 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -162,6 +162,12 @@ enum bggc_io_aware_policy {
>>   	AWARE_NONE,			/* don't aware IO for background GC */
>>   };
>>   
>> +enum device_allocation_policy {
>> +	ALLOCATE_FORWARD_NOHINT,
>> +	ALLOCATE_FORWARD_WITHIN_HINT,
>> +	ALLOCATE_FORWARD_FROM_HINT,
>> +};
>> +
>>   /*
>>    * An implementation of an rwsem that is explicitly unfair to readers. This
>>    * prevents priority inversion when a low-priority reader acquires the read lock
>> @@ -1850,6 +1856,8 @@ struct f2fs_sb_info {
>>   	bool aligned_blksize;			/* all devices has the same logical blksize */
>>   	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
>>   	unsigned int bggc_io_aware;		/* For adjust the BG_GC priority when pending IO */
>> +	unsigned int allocate_section_hint;	/* the boundary position between devices */
>> +	unsigned int allocate_section_policy;	/* determine the section writing priority */
>>   
>>   	/* For write statistics */
>>   	u64 sectors_written_start;
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 098e9f71421e..b57b8fd64747 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -2182,6 +2182,8 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>>   	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
>>   	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
>>   	MAIN_SECS(sbi) += secs;
>> +	if (sbi->allocate_section_hint > MAIN_SECS(sbi))
>> +		sbi->allocate_section_hint = MAIN_SECS(sbi);
>>   	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
>>   	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
>>   	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
>> @@ -2189,6 +2191,9 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
>>   	if (f2fs_is_multi_device(sbi)) {
>>   		int last_dev = sbi->s_ndevs - 1;
>>   
>> +		sbi->allocate_section_hint = FDEV(0).total_segments /
>> +					SEGS_PER_SEC(sbi);
>> +
>>   		FDEV(last_dev).total_segments =
>>   				(int)FDEV(last_dev).total_segments + segs;
>>   		FDEV(last_dev).end_blk =
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 04b0a3c1804d..e0f6589c6a1c 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -2807,6 +2807,10 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>>   	}
>>   #endif
>>   
>> +	if (sbi->allocate_section_policy == ALLOCATE_FORWARD_FROM_HINT &&
>> +		hint < sbi->allocate_section_hint)
>> +		hint = sbi->allocate_section_hint;
>> +
>>   find_other_zone:
>>   	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
>>   
>> @@ -2828,13 +2832,25 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
>>   #endif
>>   
>>   	if (secno >= MAIN_SECS(sbi)) {
>> -		secno = find_first_zero_bit(free_i->free_secmap,
>> +		if (sbi->allocate_section_policy == ALLOCATE_FORWARD_FROM_HINT) {
>> +			secno = find_next_zero_bit(free_i->free_secmap,
>> +							MAIN_SECS(sbi), sbi->allocate_section_hint);
>> +			if (secno >= MAIN_SECS(sbi))
>> +				secno = find_first_zero_bit(free_i->free_secmap,
>> +								MAIN_SECS(sbi));
>> +		} else {
>> +			secno = find_first_zero_bit(free_i->free_secmap,
>>   							MAIN_SECS(sbi));
>> +		}
>>   		if (secno >= MAIN_SECS(sbi)) {
>>   			ret = -ENOSPC;
>>   			f2fs_bug_on(sbi, !pinning);
>>   			goto out_unlock;
>>   		}
>> +	} else if (sbi->allocate_section_policy == ALLOCATE_FORWARD_WITHIN_HINT &&
>> +				secno >= sbi->allocate_section_hint) {
>> +		secno = find_first_zero_bit(free_i->free_secmap,
>> +							MAIN_SECS(sbi));
> Will we hit "secno >= MAIN_SECS(sbi)" case here?


Yes, there may be hit 'secno>=MAIN_SECS (sbi)' case, and I will fix this 
issue in

the new version patch.

>>   	}
>>   	segno = GET_SEG_FROM_SEC(sbi, secno);
>>   	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 5aa9d650512d..fa38a3e6b9cd 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -3942,6 +3942,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>>   	segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
>>   	secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
>>   	total_sections = le32_to_cpu(raw_super->section_count);
>> +	sbi->allocate_section_hint = total_sections;
> What about assigning sbi->allocate_section_hint in anywhere else rather than
> in sanity_check_raw_super()?



You're right, it's not suitable to initialize sbi->allocate_section_hint 
here. I'll put it in

init_sb_info() or f2fs_scan_devices().

>>   
>>   	/* blocks_per_seg should be 512, given the above check */
>>   	blocks_per_seg = BIT(le32_to_cpu(raw_super->log_blocks_per_seg));
>> @@ -4713,6 +4714,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>   	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
>>   	sbi->aligned_blksize = true;
>>   	sbi->bggc_io_aware = AWARE_ALL_IO;
>> +	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
>>   #ifdef CONFIG_BLK_DEV_ZONED
>>   	sbi->max_open_zones = UINT_MAX;
>>   	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
>> @@ -4744,6 +4746,8 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>   					SEGS_TO_BLKS(sbi,
>>   					FDEV(i).total_segments) - 1 +
>>   					le32_to_cpu(raw_super->segment0_blkaddr);
>> +				sbi->allocate_section_hint = FDEV(i).total_segments /
>> +							SEGS_PER_SEC(sbi);
>>   			} else {
>>   				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
>>   				FDEV(i).end_blk = FDEV(i).start_blk +
>> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
>> index 1ffaf9e74ce9..81b99c2a02a9 100644
>> --- a/fs/f2fs/sysfs.c
>> +++ b/fs/f2fs/sysfs.c
>> @@ -889,6 +889,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>>   		return count;
>>   	}
>>   
>> +	if (!strcmp(a->attr.name, "allocate_section_hint")) {
>> +		if (t < 0 || t > MAIN_SECS(sbi))
>> +			return -EINVAL;
>> +		sbi->allocate_section_hint = t;
> Will it race w/ resize_fs ioctl?
>
> Thanks,


Does this mean that after executing resize_fs, the current 
allocate_section_hint value will

not match the resized size? If so, I've handled the data update in 
update_fs_metadata().

If not, what other areas might cause a conflict? Please let me know so I 
can address the

issue immediately.


Thanks,

Liao

>> +		return count;
>> +	}
>> +
>> +	if (!strcmp(a->attr.name, "allocate_section_policy")) {
>> +		if (t < ALLOCATE_FORWARD_NOHINT || t > ALLOCATE_FORWARD_FROM_HINT)
>> +			return -EINVAL;
>> +		sbi->allocate_section_policy = t;
>> +		return count;
>> +	}
>> +
>>   	*ui = (unsigned int)t;
>>   
>>   	return count;
>> @@ -1161,6 +1175,8 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
>>   F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
>>   F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
>>   F2FS_SBI_GENERAL_RW_ATTR(dir_level);
>> +F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
>> +F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
>>   #ifdef CONFIG_F2FS_IOSTAT
>>   F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
>>   F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
>> @@ -1398,6 +1414,8 @@ static struct attribute *f2fs_attrs[] = {
>>   	ATTR_LIST(max_read_extent_count),
>>   	ATTR_LIST(carve_out),
>>   	ATTR_LIST(reserved_pin_section),
>> +	ATTR_LIST(allocate_section_hint),
>> +	ATTR_LIST(allocate_section_policy),
>>   	NULL,
>>   };
>>   ATTRIBUTE_GROUPS(f2fs);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
