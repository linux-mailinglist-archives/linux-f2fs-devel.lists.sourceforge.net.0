Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B44B11601
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 03:45:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZvqmBKloMFI+lHMlvvAw7WOC2wWMNeMiEyLCZiQmRs=; b=MDCwRd0kJDkTmR6KfmTJ/GmSJz
	mOCbFFj6p5L/xkg9uZcr6V+laum/0xhv7peJ+XoqCKK1ZDIiy/xppu7DFB0B3Gmi/qq+tLSFvzlnj
	0yHnioNoK3I/lI3Xtx6/+Kmv1HWgj4HWlKdgCJQMjTEYmOiJEJocVA0qMk5i8POInbtk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf7Ue-0002Ui-Mk;
	Fri, 25 Jul 2025 01:45:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1uf7Uc-0002Ub-B4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 01:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xb8s6ezLixBIFzdZ2j9r6x1SqMFdbRyRmBiStr3QNNk=; b=c0M6Jz5Gikn+tEmlx7jXiq4sCi
 D0J7yFVDkrKEuzJ+KtQGD6TbIp/PdMWYfhoWtrMGWDE3EAOzpmrRvEQkbNKG4KH7YmDJ4J8eZfEcr
 W+MFKYGy/zgyRWgwDu2ayF21801qWEDpPla9YbHtd0ZIjZqKbYYNpYCrm0XcHvx8FWlM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xb8s6ezLixBIFzdZ2j9r6x1SqMFdbRyRmBiStr3QNNk=; b=GvTrGreIAvyuWqW8ns3dE3Cexe
 Rf030aNRktSfrMnwHTftnFGbznMtOyIjSVlagOb6NT65x6c1RXBAQk0VQDNGtwrrthIUMirfazq7f
 cEsnfuuyHxdmOXX9lLDXm7Xk9jXIcvWsxuu9lD9rdhIVqNQhi+aiEiKQXmYY1Fc6Pius=;
Received: from mail-koreacentralazon11013060.outbound.protection.outlook.com
 ([40.107.44.60] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf7Ub-0002uL-7r for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 01:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bqw7enLUuRIpbrZtK8QFNN5S2RZ1HVBbhaK0ZZkwN9lVV6H4HROV+cAJMYtFQI4VUOYluHPtqwgN0+d2jSKs8MUFDgIuI7qmKEMYLfOsD8dASeg8T/L0VYy2jSBi0lr134gkhCg5HhOH1JFl1RyBP4XgVoNu5uOI+cjV7z8k3dilLCTMvEybOUvmIBVNpqTgcr43y9JjtOCnZ4eyeUKk2P7izYUfkJSG8eP/6R0Io3hE+s9p8NgQeQq0cWOMxDsBW4a7AnSi8sl4HzblZT679qDVrfYyHyVUe5PgwJKyZqgAPrcZLtpRMQWzRi318INhuGuiJSfIdOvevO6lADl1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xb8s6ezLixBIFzdZ2j9r6x1SqMFdbRyRmBiStr3QNNk=;
 b=LLVe8me/5DCXGJ447cmjbAjNw6V4YSzTttG/sFOMqsu7U3UUu66KM1ok1KGRmVD4T3O9Bl9eAjhsfI2g9akDgWs9xH4Tpf4kcQ3g2EX/OqoVHojT4DhLic5Rk3tm87bbeK8taPKCSFq/3nXg+8Jvtgn7nnRAcy03csboFmKkYn+l4P7W6Lea2z+5o+KfIwRxkp16QgQBaT3Tn7XJKNE+EAdhJBH2j9RhZdomfrM3sOMS7qob2PPAjVsYdWb9UtzkAGTGVOuhi5I/Z3j56nVWGrtxUZTGvqaevS+KvU4LOcLTJsXcxFeJMWVZsTltZOIPCyZ/y8ffM4aGEIGqRaTUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xb8s6ezLixBIFzdZ2j9r6x1SqMFdbRyRmBiStr3QNNk=;
 b=NGhpj6qDJZzRfjsaL2nr1w83IUhi1ANmEY/3DjxTy1Dm5eL1GJiWy1pPbGeIr8me9PA0Mg3CO7/tRZL9Y6moSGuFzdkfHO60AqGQjcEtEphIjPGrSsBXpLDHXR4edOLx8lVnyFIb6SgIrzM65pLpJO+Fztme9GaLNVH4TSx64GVQFxOykxkUqgWkbSUrkxxy4m0PBPronAiCHhQT21cgrFyi3fwQBF2cYsXI9W9QwAoMGTg2K41breaX+Q6ycvoW/p8tKZS1iUqP2ES58E9i7UbFKxs3vspzNHx1C+nuKlD7nNs39wsU3kCBEEAi5c7w/zaLqfYoZdo21nKVqs6Tjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by JH0PR06MB7328.apcprd06.prod.outlook.com (2603:1096:990:a2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 01:44:45 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 01:44:44 +0000
Message-ID: <06b9d287-816c-4347-945b-8fda83a6f557@vivo.com>
Date: Fri, 25 Jul 2025 09:44:40 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jens Axboe <axboe@kernel.dk>, jaegeuk@kernel.org
References: <20250715031054.14404-1-hanqi@vivo.com>
 <056e083b-8e41-45a2-9b0f-2ec47d1a9f71@kernel.dk>
 <f7408161-eaef-47ed-8810-8c4e8f27bfc6@vivo.com>
 <51168786-6c30-4065-be82-6d07b2ae74a8@kernel.dk>
 <4366bf0f-64a1-44ae-8f81-301af2d179d8@vivo.com>
 <d5355d7d-4e93-4741-9ef7-c7407d600ec0@kernel.org>
In-Reply-To: <d5355d7d-4e93-4741-9ef7-c7407d600ec0@kernel.org>
X-ClientProxiedBy: TYCP301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::8) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|JH0PR06MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 3574afa3-5189-4c87-5de5-08ddcb1cd48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEtlVFA3Tk1SQ0hUckp1dVlZTjBlblFaV1IzaUJjZ2ZzTm41MjNHYzA2RURD?=
 =?utf-8?B?VmdDR2lRWkdiNlROdExuZlQ4KzhSMDFWNzRvSGVhM0NPblh4ajhnSlFNZm9H?=
 =?utf-8?B?TTZlMHBXdTc2MGhWYm5rbVgvdUZTNVE5SWhnKzNpS1RlcG53RWEyZUJEc1g2?=
 =?utf-8?B?cWE4Q3B4amNPT2V2K2p6RXFkOCt0TFVQR1ltNDFyRytXcXlRcUFBQlRnUkhJ?=
 =?utf-8?B?M0hEMjF2Y3NlbTdQcnB6bVZoTVQvV2NQWjVMNzlETS9QczNBRjZIN3pHTTl0?=
 =?utf-8?B?aEliWFYxdEdMdXJXY2swb25Pc05IVmVOdnNva0crK3JzaWZ6dklqZjhjZko0?=
 =?utf-8?B?dkZKd1RCV0prb3A0ZG5lTDlaVEpic2JWRFpOcndQdDdyeVBEWXIrazV6ZEJr?=
 =?utf-8?B?Z2o3eFdOOTNmdk82R1k3cGJzaEtieWtJUmkzNDFKOHJ4aDExam43RXZrTVhJ?=
 =?utf-8?B?MUdNREFpcVF1TUcwNGIrQWV0bEpZaitwS2JBenJHK2E2VTdyMzVsZEwwR29p?=
 =?utf-8?B?Qk9RUzQzN0o1STBTOW9pZ1ZweHJ5UEJzSnZ0MmxrVkxoMVNsek8wQ043dWF0?=
 =?utf-8?B?NFpuaVFLVXRKRFI0alVJU2phWGZSanJRcXVXY3l2TG9vbzVYUUI4OGh2M1Uv?=
 =?utf-8?B?aUhNUXZpY005NTRneElRalNXSUpTYlN6dzVuM1VESkpyMWNnRzFZdE9rUnhk?=
 =?utf-8?B?YzNpTG1yck5iWEhDK3VEWHp5OGdHOGxLaTN4dHQydWEyZ0pobVJiczBoMjZD?=
 =?utf-8?B?YitTNkNjSWpsREhIa1lvUFc0UlkvMytXTjlFbVI1azB0TWxOMzgrNXJLTG1n?=
 =?utf-8?B?aG9tWDhPVldZS3dKT3BCV3VqTzVsMVdCN1FvQUFtdThDSC9QMUJmcFp4cHNi?=
 =?utf-8?B?RHdPT0JvRTg0RWxwalJZKzI1bG95VWlYNU9sMFZraTNWQWJsd3A0RGdRRjJq?=
 =?utf-8?B?ek9xbkZLbWRDMXljYUVpbFFYZUVMd2ZhME10VVovYlJqTzdJUjhDbE1wWHRD?=
 =?utf-8?B?cEJPN0ZvR3JQaW5sMXhZT2MxRkYxNytoVTRiaHZaWXNJTEtZY3I1VSsza3ly?=
 =?utf-8?B?Ry9DWWY3T2ZDNEROY3AvR2J3Tm9sR3ZBMmJad0ZhQlEycHF0U3JiN3hkajhY?=
 =?utf-8?B?eU1LWW9pWWJQcXhRUFBjL2ZIWEpOQ0Yzc05neGYzYlVva25uL3BPWHpna09I?=
 =?utf-8?B?NHZHRFdFV0wvczNGc3dROTlRa0wwWThVSkpDd0JqVmZBL2ZXRHZMYWZ1S1hC?=
 =?utf-8?B?M1QyU1luZHdhSEwweTM0bnBIOHV6dlN1VWVnU3FTZXhtOWRVTThoNGs4Nmdn?=
 =?utf-8?B?eDFvTXZjellrcmRNMzhnS1JINlViS0Y5K1p0bWtTUFBqSExFK3Q0MUFiSEZP?=
 =?utf-8?B?bmFkWWs0RFdKZ2IxUnc1aVJXc1hWOHZTb3AzcjJoaTNtOUdYeUh5K2FudjE2?=
 =?utf-8?B?eHFNYWp4Qms2VWJMajhjbVFTR2RsQTdaMm5sdllBZlYyV3hUaXFic0tsOHo0?=
 =?utf-8?B?L3VhOXBMdklvckZOZ2VkVndkOVV6dExDSmlpMEpLR3BtNFdxbGJBTUdQcHhn?=
 =?utf-8?B?TlJLbWt5L2RDU1pnMnkwMkJKelJIQUZpWk9ZMFlxRW9WM3BWRHdyWkthaXhp?=
 =?utf-8?B?K3o1ZC9wRXJpN1hiZ0RaWWI3RStlY2JsczJzbWgrZnpveHhiN25jWDUxcnp3?=
 =?utf-8?B?ZXRIcHdIeWJOSmo5aFVsejlNNDdRd2VEd0RTc21MZTdJOHdMNGZnSjh0NTRC?=
 =?utf-8?B?Y20yMGE4U3BIM29TVVRadnZ0YjBLMGk3d0pXcXVzNW5BU0lIYlJ0UlZrMU4z?=
 =?utf-8?B?SWIwS1RIWTZoV1c1eXBzNC9uOVhteHRVdVc1MzQrSTBwT2pQcHRwMFdKZXZZ?=
 =?utf-8?B?VlFkaHp6aGdyV0hnbkhISVEzUit4OXJJaWF5cWtZY2hzS3VHTlZ1SUNMS29X?=
 =?utf-8?Q?zNGvkh1pn6U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDlYTFk2NU1TSUNaVG1PZDBNZnRXZ1BhRHU5U1N2MmdVcDVjc0VmNS9uTzVX?=
 =?utf-8?B?OTNNaXNselErNVNJR25kd2xmK3RUeFhTY0dSYldHSDd1TVExcnVVM0dGSjlC?=
 =?utf-8?B?QlFIVldlNmVSaGFTRHg2RVhhRldSTFo1OVJJNC9LZUJ6dS90cGNYOTc2RndP?=
 =?utf-8?B?WmVMRUJTY2lDUmc2cjhzdW45Rkk1NzRvMklLQ2pGSTBZNXozQU5RV1ZWMG5R?=
 =?utf-8?B?azErU1BPV1ZtVFFCOXVPcXo0Rlp3U2xpSDQ1SDl5MGxQOEk5QWlDYkQvVGRW?=
 =?utf-8?B?anVMeFl5d0FJaWFRbDVhUlRYTStlaGZobFZBeFFNa0w1aTBhd1FTRm0xSmRN?=
 =?utf-8?B?cmYwZjZ4WU90TnluRWZkR0FLSTVRbk9HekJJWk5UZlUwUjdyT0hvSWkzQkVM?=
 =?utf-8?B?WFMvZWhEN1dwZW43ZmxuKzFnSlN5THVlNWpwRGdYTnhUWTBUK0JJd2c1cTBT?=
 =?utf-8?B?WG1zUnFFYU5NWXBoRytMZmxKc01nTUgwRHpBTlJ0Y3FXbEdwQVQyQ2FVZEtk?=
 =?utf-8?B?ZFJGYURadm5ySzFIcGFLd2Vrd0h6WHplWHVTZ0VLbXJqTXdVSDRYUjYreEhX?=
 =?utf-8?B?MDBiNFdWY21yWGZhQVpLZzh4Tk5OWnFRUkd2MUwzT01DcmVjVnd4SE13SHJI?=
 =?utf-8?B?dW5JcnFTcjBNTTFGYnQzQlNCZkRsWTM0UllDaVk4eWY2dm5mQTZacSs1ZUF0?=
 =?utf-8?B?T29EM092OHNhTGNkUEREaTY1bkRlS3ZDalRjR1lYOGFGUHdGazg2cXFnSUVG?=
 =?utf-8?B?ZXAwUzhaNUJBZUVWTm82aXVjTHE1ZG9QUFFEQU5NTENBU0c1UFA4NnBwTy9D?=
 =?utf-8?B?QUZLYUgwRlZRTlQ5dXBTZTgwYXB5VHJBcWMxTlF6NjcwblIrTEd3aitQWUJo?=
 =?utf-8?B?VEIzWWNkNTJUWUdCTjdKTWJxWWhacFM0SFF0R0U3L2p6dWdpYjBITlpaS2xJ?=
 =?utf-8?B?WUk2TVRUZlFrVnVPV2N4K1l5RkZoZnB6MERPbXlnRVNIdkEreDlsNEJqc2tS?=
 =?utf-8?B?L3VmVDdUOTJuQlhFSGJaK0p4Rk5Pc2psbHk3ZVgxZGNGMWtYTS9XTW9NNVJY?=
 =?utf-8?B?eGs2MHVEeTdGQk1zNXd2a0w2VTFDU2dONzVmSTFlNkZOelZhK0RqWDN5ZTdJ?=
 =?utf-8?B?aTVRSWRsSHlYTWdIWG5tSWV1RUllV21tTkhuYmQxa0lTeDVkYkNNSWZ4Zzdq?=
 =?utf-8?B?Mms0SUQ3dE1tUWhTeTlTR290ZmwvY2R1L2p4dHlOM1FyTDloYVhzNlRaUVRj?=
 =?utf-8?B?L1FyM1JqWEZDODZZNVNLNWJJNzdzOTJseDZsTDE0SkNnRTZickdlQkNEK3lI?=
 =?utf-8?B?cHdwL1VPU3F6Rjg4QWpqMDJoN3dRTjZSRW85VWpvWWtEMnVHSUswVXNUdlJv?=
 =?utf-8?B?Wnk0MzFsVVBqVXFlcjlDSVdISEZUSzR2K3J3WlNGT1RaRWxSeFJucGs1SGM4?=
 =?utf-8?B?ckprOHVTUnBWMlk5ZW5jeThMY3JRUE0yMVpvOWMxUFEyR1gzdWFvZldkbzc5?=
 =?utf-8?B?bDFaOStSaDVkWEFwZGxvenJqN2owU3drV095clJ0QkdYZ0l3ZmxnZ25UeTg3?=
 =?utf-8?B?V0tzRzVaWVhoSEJFMnp0RTQ2LzNJM0x3NEd5a2ZXUWV3cUw4L0FweGRzYmZX?=
 =?utf-8?B?bkJTR2VTRkFBOXpQUzA4Zm1jOEFUTHVhYlNJZjh2b2JJS09uWkVUelNITEo4?=
 =?utf-8?B?Y1ozMkNZd1h0SURRYjMyQkFwNUFGM2tUZ3VYdEtoQUFaL1VvSG11amtOU05u?=
 =?utf-8?B?YWZLM3ZXYnptMkRCajlmM0phQkhkYUdGeXNnbTJyeDRkTmxKK09udWtEYXZO?=
 =?utf-8?B?RDNBZWtENllOM2Y4ekR1aVhuUzUyb2lwZDYrNHk4djI3dTQ0d0UrWDQ3Z05p?=
 =?utf-8?B?dzhpejBwbmZjNEN4d1YzVVE1R1ZVSFhiNjhqWlB6L1ZRZklmTE9nbVlmZ1lO?=
 =?utf-8?B?cHFtaFJxb3JHYXNMWFVEejU0R3g2SGFIcEN1T0IrbkVPWE5XcmlVanA0b0Y0?=
 =?utf-8?B?V3VmOFBxZFI5SU5GOHRvYVlxN0dNK3hpWXpGMVZYU3B4ZFVWRUJjbzVpSlZ3?=
 =?utf-8?B?TXFlcHN6ZXhNazQ1amF5UllobGpHNk5XV2xzczl1em5hUGVWT3dhZ1A0UGNT?=
 =?utf-8?Q?2aCrL3+9qIfT9zA1nF02iwF/7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3574afa3-5189-4c87-5de5-08ddcb1cd48b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 01:44:44.4209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H5Bt7CLcKXY9BJkw5yAQUFeDrY9iTgD0fQ8hpcDSTGF7nu1VnVirA5I/9muPfkipribcSGjDw6YyUiKI5SPNeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7328
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/24 21:09, Chao Yu 写道: > On 2025/7/16 16:27,
    hanqi wrote: >> >> >> 在 2025/7/16 11:43, Jens Axboe 写道: >>> On 7/15/25
    9:34 PM, hanqi wrote: >>>> >>>> ? 2025/7/15 22:28, Jens Axboe ?? [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.60 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 ARC_SIGNED             Message has a ARC signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
X-Headers-End: 1uf7Ub-0002uL-7r
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
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
From: hanqi via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: hanqi <hanqi@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyNS83LzI0IDIxOjA5LCBDaGFvIFl1IOWGmemBkzoKPiBPbiAyMDI1LzcvMTYgMTY6
MjcsIGhhbnFpIHdyb3RlOgo+Pgo+Pgo+PiDlnKggMjAyNS83LzE2IDExOjQzLCBKZW5zIEF4Ym9l
IOWGmemBkzoKPj4+IE9uIDcvMTUvMjUgOTozNCBQTSwgaGFucWkgd3JvdGU6Cj4+Pj4KPj4+PiA/
IDIwMjUvNy8xNSAyMjoyOCwgSmVucyBBeGJvZSA/PzoKPj4+Pj4gT24gNy8xNC8yNSA5OjEwIFBN
LCBRaSBIYW4gd3JvdGU6Cj4+Pj4+PiBKZW5zIGhhcyBhbHJlYWR5IGNvbXBsZXRlZCB0aGUgZGV2
ZWxvcG1lbnQgb2YgdW5jYWNoZWQgYnVmZmVyZWQgSS9PCj4+Pj4+PiBpbiBnaXQgWzFdLCBhbmQg
aW4gZjJmcywgdGhlIGZlYXR1cmUgY2FuIGJlIGVuYWJsZWQgc2ltcGx5IGJ5IAo+Pj4+Pj4gc2V0
dGluZwo+Pj4+Pj4gdGhlIEZPUF9ET05UQ0FDSEUgZmxhZyBpbiBmMmZzX2ZpbGVfb3BlcmF0aW9u
cy4KPj4+Pj4gWW91IG5lZWQgdG8gZW5zdXJlIHRoYXQgZm9yIGFueSBET05UQ0FDSEUgSU8gdGhh
dCB0aGUgY29tcGxldGlvbiBpcwo+Pj4+PiByb3V0ZWQgdmlhIG5vbi1pcnEgY29udGV4dCwgaWYg
YXBwbGljYWJsZS4gSSBkaWRuJ3QgdmVyaWZ5IHRoYXQgCj4+Pj4+IHRoaXMgaXMKPj4+Pj4gdGhl
IGNhc2UgZm9yIGYyZnMuIEdlbmVyYWxseSB5b3UgY2FuIGRlZHVjZSB0aGlzIGFzIHdlbGwgdGhy
b3VnaAo+Pj4+PiB0ZXN0aW5nLCBJJ2Qgc2F5IHRoZSBmb2xsb3dpbmcgY2FzZXMgd291bGQgYmUg
aW50ZXJlc3RpbmcgdG8gdGVzdDoKPj4+Pj4KPj4+Pj4gMSkgTm9ybWFsIERPTlRDQUNIRSBidWZm
ZXJlZCByZWFkCj4+Pj4+IDIpIE92ZXJ3cml0ZSBET05UQ0FDSEUgYnVmZmVyZWQgd3JpdGUKPj4+
Pj4gMykgQXBwZW5kIERPTlRDQUNIRSBidWZmZXJlZCB3cml0ZQo+Pj4+Pgo+Pj4+PiBUZXN0IHRo
b3NlIHdpdGggREVCVUdfQVRPTUlDX1NMRUVQIHNldCBpbiB5b3VyIGNvbmZpZywgYW5kIGl0IHRo
YXQKPj4+Pj4gZG9lc24ndCBjb21wbGFpbiwgdGhhdCdzIGEgZ3JlYXQgc3RhcnQuCj4+Pj4+Cj4+
Pj4+IEZvciB0aGUgYWJvdmUgdGVzdCBjYXNlcyBhcyB3ZWxsLCB2ZXJpZnkgdGhhdCBwYWdlIGNh
Y2hlIGRvZXNuJ3QgCj4+Pj4+IGdyb3cgYXMKPj4+Pj4gSU8gaXMgcGVyZm9ybWVkLiBBIGJpdCBp
cyBmaW5lIGZvciB0aGluZ3MgbGlrZSBtZXRhIGRhdGEsIGJ1dCAKPj4+Pj4gZ2VuZXJhbGx5Cj4+
Pj4+IHlvdSB3YW50IHRvIHNlZSBpdCByZW1haW4gYmFzaWNhbGx5IGZsYXQgaW4gdGVybXMgb2Yg
cGFnZSBjYWNoZSAKPj4+Pj4gdXNhZ2UuCj4+Pj4+Cj4+Pj4+IE1heWJlIHRoaXMgaXMgYWxsIGZp
bmUsIGxpa2UgSSBzYWlkIEkgZGlkbid0IHZlcmlmeS4gSnVzdCAKPj4+Pj4gbWVudGlvbmluZyBp
dAo+Pj4+PiBmb3IgY29tcGxldGVuZXNzIHNha2UuCj4+Pj4gSGksIEplbnMKPj4+PiBUaGFua3Mg
Zm9yIHlvdXIgc3VnZ2VzdGlvbi4gQXMgSSBtZW50aW9uZWQgZWFybGllciBpbiBbMV0sIGluIGYy
ZnMsCj4+Pj4gdGhlIHJlZ3VsYXIgYnVmZmVyZWQgd3JpdGUgcGF0aCBpbnZva2VzIGZvbGlvX2Vu
ZF93cml0ZWJhY2sgZnJvbSBhCj4+Pj4gc29mdGlycSBjb250ZXh0LiBUaGVyZWZvcmUsIGl0IHNl
ZW1zIHRoYXQgZjJmcyBtYXkgbm90IGJlIHN1aXRhYmxlCj4+Pj4gZm9yIERPTlRDQUNIRSBJL08g
d3JpdGVzLgo+Pj4+Cj4+Pj4gST9kIGxpa2UgdG8gYXNrIGEgcXVlc3Rpb246IHdoeSBpcyBET05U
Q0FDSEUgSS9PIHdyaXRlIHJlc3RyaWN0ZWQgdG8KPj4+PiBub24taW50ZXJydXB0IGNvbnRleHQg
b25seT8gSXMgaXQgYmVjYXVzZSBkcm9wcGluZyB0aGUgcGFnZSBtaWdodCBiZQo+Pj4+IHRvbyB0
aW1lLWNvbnN1bWluZyB0byBiZSBkb25lIHNhZmVseSBpbiBpbnRlcnJ1cHQgY29udGV4dD8gVGhp
cyBtaWdodAo+Pj4+IGJlIGEgbmFpdmUgcXVlc3Rpb24sIGJ1dCBJP2QgcmVhbGx5IGFwcHJlY2lh
dGUgeW91ciBjbGFyaWZpY2F0aW9uLgo+Pj4+IFRoYW5rcyBpbiBhZHZhbmNlLgo+Pj4gQmVjYXVz
ZSAoYXMgb2YgcmlnaHQgbm93LCBhdCBsZWFzdCkgdGhlIGNvZGUgZG9pbmcgdGhlIGludmFsaWRh
dGlvbgo+Pj4gbmVlZHMgcHJvY2VzcyBjb250ZXh0LiBUaGVyZSBhcmUgdmFyaW91cyByZWFzb25z
IGZvciB0aGlzLCB3aGljaCB5b3UnbGwKPj4+IHNlZSBpZiB5b3UgZm9sbG93IHRoZSBwYXRoIG9m
ZiBmb2xpb19lbmRfd3JpdGViYWNrKCkgLT4KPj4+IGZpbGVtYXBfZW5kX2Ryb3BiZWhpbmRfd3Jp
dGUoKSAtPiBmaWxlbWFwX2VuZF9kcm9wYmVoaW5kKCkgLT4KPj4+IGZvbGlvX3VubWFwX2ludmFs
aWRhdGUoKS4gdW5tYXBfbWFwcGluZ19mb2xpbygpIGlzIG9uZSBjYXNlLCBhbmQgd2hpbGUKPj4+
IHRoYXQgbWF5IGJlIGRvYWJsZSwgdGhlIGlub2RlIGlfbG9jayBpcyBub3QgSVJRIHNhZmUuCj4+
Pgo+Pj4gTW9zdCBmaWxlIHN5c3RlbXMgaGF2ZSBhIG5lZWQgdG8gcHVudCBzb21lIHdyaXRlYmFj
ayBjb21wbGV0aW9ucyB0bwo+Pj4gbm9uLWlycSBjb250ZXh0LCBlZyBmb3IgZmlsZSBleHRlbmRp
bmcgZXRjLiBIZW5jZSBmb3IgbW9zdCBmaWxlIAo+Pj4gc3lzdGVtcywKPj4+IHRoZSBkb250Y2Fj
aGUgY2FzZSBqdXN0IGJlY29tZXMgYW5vdGhlciBjYXNlIHRoYXQgbmVlZHMgdG8gZ28gdGhyb3Vn
aAo+Pj4gdGhhdCBwYXRoLgo+Pj4KPj4+IEl0J2QgY2VydGFpbmx5IGJlIHBvc3NpYmxlIHRvIGlt
cHJvdmUgdXBvbiB0aGlzLCBmb3IgZXhhbXBsZSBieSBoYXZpbmcKPj4+IGFuIG9wcG9ydHVuaXN0
aWMgZG9udGNhY2hlIHVubWFwIGZyb20gSVJRL3NvZnQtaXJxIGNvbnRleHQsIGFuZCB0aGVuCj4+
PiBwdW50aW5nIHRvIGEgd29ya3F1ZXVlIGlmIHRoYXQgZG9lc24ndCBwYW4gb3V0LiBCdXQgdGhp
cyBkb2Vzbid0IGV4aXN0Cj4+PiBhcyBvZiB5ZXQsIGhlbmNlIHRoZSBuZWVkIGZvciB0aGUgd29y
a3F1ZXVlIHB1bnQuCj4KPiBUaGFua3MgSmVucyBmb3IgdGhlIGRldGFpbGVkIGV4cGxhbmF0aW9u
Lgo+Cj4+Cj4+IEhpLCBKZW5zCj4+IFRoYW5rIHlvdSBmb3IgeW91ciByZXNwb25zZS4gSSB0ZXN0
ZWQgdW5jYWNoZWQgYnVmZmVyIEkvTyByZWFkcyB3aXRoCj4+IGEgNTBHQiBkYXRhc2V0IG9uIGEg
bG9jYWwgRjJGUyBmaWxlc3lzdGVtLCBhbmQgdGhlIHBhZ2UgY2FjaGUgc2l6ZQo+PiBvbmx5IGlu
Y3JlYXNlZCBzbGlnaHRseSwgd2hpY2ggSSBiZWxpZXZlIGFsaWducyB3aXRoIGV4cGVjdGF0aW9u
cy4KPj4gQWZ0ZXIgY2xlYXJpbmcgdGhlIHBhZ2UgY2FjaGUsIHRoZSBwYWdlIGNhY2hlIHNpemUg
cmV0dXJuZWQgdG8gaXRzCj4+IGluaXRpYWwgc3RhdGUuIFRoZSB0ZXN0IHJlc3VsdHMgYXJlIGFz
IGZvbGxvd3M6Cj4+Cj4+IHN0YXQgNTBHLnR4dAo+PiDCoCDCoCBGaWxlOiA1MEcudHh0Cj4+IMKg
IMKgIFNpemU6IDUzNjg3MDkxMjAwwqDCoMKgwqDCoCBCbG9ja3M6IDEwNDk2MDcxMsKgwqDCoMKg
wqDCoCBJTyBCbG9ja3M6IDUxMsKgIAo+PiByZWd1bGFyIGZpbGUKPj4KPj4gW3JlYWQgYmVmb3Jl
XToKPj4gZWNobyAzID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4+IDAxOjQ4OjE3wqDCoMKg
wqDCoMKgwqAga2JtZW1mcmVlwqBrYmF2YWlswqDCoMKgwqAga2JtZW11c2VkwqAgJW1lbXVzZWQg
Cj4+IGtiYnVmZmVyc8Kga2JjYWNoZWTCoMKgIGtiY29tbWl0wqDCoMKgwqAgJWNvbW1pdMKgwqAg
a2JhY3RpdmUga2JpbmFjdMKgwqDCoMKgIGtiZGlydHkKPj4gMDE6NTA6NTnCoMKgwqDCoMKgIDY0
MDQ2NDjCoMKgIDgxNDk1MDjCoMKgIDI3MTkzODTCoMKgIDIzLjQwwqDCoMKgwqDCoDUxMiAxODk4
MDkywqDCoCAKPj4gMTk5Mzg0NzYwwqDCoMKgIDgyMy43NcKgwqAgMTg0Njc1NsKgwqDCoCA0NjY4
MzLCoMKgwqDCoMKgNDQKPj4KPj4gLi91bmNhY2hlZF9pb190ZXN0IDgxOTIgMSAxIDUwRy50eHQK
Pj4gU3RhcnRpbmcgMSB0aHJlYWRzCj4+IHJlYWRpbmcgYnMgODE5MiwgdW5jYWNoZWQgMQo+PiDC
oCDCoCAxczogNzU0TUIvc2VjLCBNQj03NTQKPj4gwqAgwqAgLi4uCj4+IMKgIMKgNjRzOiA4NDRN
Qi9zZWMsIE1CPTI2MjE0NAo+Pgo+PiBbcmVhZCBhZnRlcl06Cj4+IDAxOjUyOjMzwqDCoMKgwqDC
oCA2MzI2NjY0wqDCoCA4MTIxMjQwwqDCoCAyNzQ3OTY4wqDCoMKgIDIzLjY1wqDCoMKgwqDCoCA3
MjggMTk0NzY1NsKgwqAgCj4+IDE5OTM4NDc4OMKgwqDCoCA4MjMuNzXCoMKgIDE4ODc4OTbCoMKg
wqAgNTAyMDA0wqDCoMKgwqDCoDY4Cj4+IGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hl
cwo+PiAwMTo1MzoxMcKgwqDCoMKgwqAgNjM1MTEzNsKgwqAgODA5NjkzNsKgwqAgMjc3MjQwMMKg
wqAgMjMuODbCoMKgwqDCoMKgNTEyIDE5MDA1MDDCoMKgIAo+PiAxOTkzODUyMTbCoMKgwqAgODIz
Ljc1wqDCoCAxODQ3MjUywqDCoMKgIDUzMzc2OMKgwqDCoMKgwqAgMTA0Cj4+Cj4+IEhpIENoYW8s
Cj4+IEdpdmVuIHRoYXQgRjJGUyBjdXJyZW50bHkgY2FsbHMgZm9saW9fZW5kX3dyaXRlYmFjayBp
biB0aGUgc29mdGlycQo+PiBjb250ZXh0IGZvciBub3JtYWwgd3JpdGUgc2NlbmFyaW9zLCBjb3Vs
ZCB3ZSBmaXJzdCBzdXBwb3J0IHVuY2FjaGVkCj4+IGJ1ZmZlciBJL08gcmVhZHM/IEZvciBub3Jt
YWwgdW5jYWNoZWQgYnVmZmVyIEkvTyB3cml0ZXMsIHdvdWxkIGl0IGJlCj4+IGZlYXNpYmxlIGZv
ciBGMkZTIHRvIGludHJvZHVjZSBhbiBhc3luY2hyb25vdXMgd29ya3F1ZXVlIHRvIGhhbmRsZSB0
aGUKPj4gcGFnZSBkcm9wIG9wZXJhdGlvbiBpbiB0aGUgZnV0dXJlPyBXaGF0IGFyZSB5b3VyIHRo
b3VnaHRzIG9uIHRoaXM/Cj4KPiBRaSwKPgo+IFNvcnJ5IGZvciB0aGUgZGVsYXkuCj4KPiBJIHRo
aW5rIGl0IHdpbGwgYmUgZ29vZCB0byBzdXBwb3J0IHVuY2FjaGVkIGJ1ZmZlcmVkIEkvTyBpbiBy
ZWFkIHBhdGgKPiBmaXJzdCwgYW5kIHRoZW4gbGV0J3MgdGFrZSBhIGxvb2sgd2hhdCB3ZSBjYW4g
ZG8gZm9yIHdyaXRlIHBhdGgsIGFueXdheSwKPiBsZXQncyBkbyB0aGlzIHN0ZXAgYnkgc3RlcC4K
Pgo+IENhbiB5b3UgcGxlYXNlIHVwZGF0ZSB0aGUgcGF0Y2g/Cj4gLSBzdXBwb3J0IHJlYWQgcGF0
aCBvbmx5Cj4gLSBpbmNsdWRlIHRlc3QgZGF0YSBpbiBjb21taXQgbWVzc2FnZQpDaGFvCgpJIHdp
bGwgcmUtc3VibWl0IGEgcGF0Y2ggdG8gZmlyc3QgZW5hYmxlIEYyRlMgc3VwcG9ydCBmb3IgdW5j
YWNoZWQKYnVmZmVyIEkvTyByZWFkcy4gRm9sbG93aW5nIHRoYXQsIEkgd2lsbCB3b3JrIG9uIGlt
cGxlbWVudGluZwphc3luY2hyb25vdXMgcGFnZSBkcm9wcGluZyBpbiBGMkZTLgoKVGhhbmsgeW91
IQo+Cj4+IFRoYW5rIHlvdSEKPj4KPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
