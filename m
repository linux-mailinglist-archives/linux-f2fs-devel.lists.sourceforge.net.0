Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DD0B393B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 08:18:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnVSyLPDjSPNSoi+lI7l7LCzV9aM+FJXtImxQZb0ApI=; b=L6mmoCbR3ATbiplyy0TcgMWpZQ
	jvJns4rkfjmQLtRWReZRQZy30FFMEc1rreJt+UaQ23Mexaj0Rbuui7OImAR4iFllH4GLv8z7zWFqe
	af78ZRNgcTpfdNzg+K350VKwwcTtC8txhVfyHud+mAWj50szK2uI0MRfT2g26Gr6/+e8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urVxx-0000OA-Mv;
	Thu, 28 Aug 2025 06:18:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1urVxv-0000O2-4w
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 06:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TTJFJKt45U35ereDwr6S16MRTnX5v57OqnbZZtW+/Sg=; b=YP/vpZlMCXiBfUHoD+8yiKM0c8
 HH6COwaIgbAgFcgzVMmnZ4vnIzDy4Ikr16dxJKUqfdwqiM+iP6wCdn9arWrqwuMOEQmasrITyK81z
 hm0CecL5mFzbAOPF5sJqETupz4QS1I0c8ZEeM1ZvvmAxSVyxiI9IRpSmVvqK35ufkFYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TTJFJKt45U35ereDwr6S16MRTnX5v57OqnbZZtW+/Sg=; b=GI9wkkFPPW356aFFoWS9VNGO0g
 h9ZuHQ580MVNsy+OUepkHwvrMx5GwqxI8zLmmid6GPsFBNZX0YD1nbYGQuQ36T73Rtm0BrVUYS/ie
 7cMIy/JPlSrJKPr5K5CIGgy4PujtXnPJ2VNkmCBk+FmlncgHSSzdVwL6hVGLgBHXpzoM=;
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com
 ([40.107.93.61] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urVxu-0001am-Jf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 06:18:31 +0000
Received: from PH0PR12MB7080.namprd12.prod.outlook.com (2603:10b6:510:21d::20)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 06:03:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3M6DTR5z4T++XIVgZCUI4gyOVzHTSTRTTUGSjBmOKoCUXIvNh8gok0YIY1tSpe8l7LjAqshMMqyfLn8parJsdIXBilLqwHlt0/bE1d0WjJsxLTOkpbTckM8lld+hihrpNYh5M27BgxMAbXCsH1ojO5im0j390RWtS2rInBGrT8DKHAfnXaQHiGyBOCtMNEsuET2Sv7LCBWL4Hjs+cKwzHMIFvA0HPe6vK0zPFhmTSenDjvZWNqAHCbLuAyA4Wa4s82CiidWo61rNutCir/d/rkliF4E9J7krjEZDqU/oo0WXP22uWbrMkD3dYsp91QeXdrx4/6O8CTa+AtxzAuBlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTJFJKt45U35ereDwr6S16MRTnX5v57OqnbZZtW+/Sg=;
 b=ge3J6QRuRQO4BHBry7E01G6/AVDp+D8DRqL4njmr6UBkPSudLIx8MFsKythYIq8g1xR2N2HbuFHZHYYb1NvVS9LmTtPlGyk5FFo1i0gavbdgTtlNOli3sVNuuaJSMUgCG0dSL53ZYd7Vdlsv+Gx+Xfxh9j+kby3UUZSn0bjcN/XFZANEKr2yuKslqrwJObng/uPTyCV2rH0u5fs7CAKk5hWU0mBcp8e3qGO7Gal2vlhSrTCbGX9Z4kFhvJ9l9JKosFCCUVeSqrqr/9d3Az7rolTE7r4W62gVUUHG5QoTrXFEZXZG++Yb0bgdzq3zaQTZtOnMh5dH/mAeujHznY3r9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTJFJKt45U35ereDwr6S16MRTnX5v57OqnbZZtW+/Sg=;
 b=XiJEwkqk89yYcEJFIDOKpE/jd+q2n4mjH9cnySSLG1GC1GvqIoPRKdHjkhQzty+b+ZpturWnp02FDtFNxsj1vtFPIOVWBmNTNhVEvn2vlNlcQs+iT8a8BwDuBtDsChS9SRUM4GT5IVbpU5Fkr2jcmi2/N0XMCiQ/CwYh9x+mQ9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa) by PH0PR12MB7080.namprd12.prod.outlook.com
 (2603:10b6:510:21d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 05:50:08 +0000
Received: from SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 ([fe80::329f:948a:34ef:9848]) by SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 ([fe80::329f:948a:34ef:9848%7]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 05:50:08 +0000
Message-ID: <79fae787-7160-4245-886f-671860b5708a@amd.com>
Date: Thu, 28 Aug 2025 11:19:42 +0530
User-Agent: Mozilla Thunderbird
To: Ackerley Tng <ackerleytng@google.com>, willy@infradead.org,
 akpm@linux-foundation.org, david@redhat.com, pbonzini@redhat.com,
 shuah@kernel.org, seanjc@google.com, vbabka@suse.cz
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-7-shivankg@amd.com> <diqztt1sbd2v.fsf@google.com>
Content-Language: en-US
In-Reply-To: <diqztt1sbd2v.fsf@google.com>
X-ClientProxiedBy: PN2PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::14) To SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9aa)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPFF6E64BC2C:EE_|PH0PR12MB7080:EE_|DS7PR12MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ed136c-ec85-44bb-e470-08dde5f6be67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bURpMnFyclQyK3hTZ0RMMXJIOGgzN1VlS2lKUXN4cjcrYU11K2I1RjFCVllh?=
 =?utf-8?B?LzJQUTFBUUVINU8rSTBOYnZLTnhZNGNSbHpidS9wbTFOWllkTFpFQUlpRmtQ?=
 =?utf-8?B?RVpKSTQ3WllCdFc5M2pIMFUwVXlOV05pR1FhSXd0cXpTZFIzU2h6Q3RVemxD?=
 =?utf-8?B?eE1qMzRaU250ak1NR0hzWW9aQTlKV2djenM0VnJjdllRNis0VkYwRkdnVU9K?=
 =?utf-8?B?cHhaNFR3SmJEUUVmZ21ZUHpQUGpUeWhZSFhWMUlxNFZXSzVCbHdMS1EzNXpW?=
 =?utf-8?B?S05yb3VDMXdpVDNFYThTYkxaa3RiWkIyTzVjcVpRMHY2Y1FDL0IyV1QzU2ky?=
 =?utf-8?B?NGx2RUpiUTMwTWZGMkZ4NENIUDU4TTFnd212bEw2YjFVQXVTaDU3UFo1VW1D?=
 =?utf-8?B?bEljMmk0MkhVWE9uS1V1eXczQmt5L2QvY0RSOE9mekxiWG9zeHQ5TFlZZ2lp?=
 =?utf-8?B?c0JaUkpJODIwK3kzMWtHakRlbFhrVEJJa0xndXlsWElNd2thazBvaThMMzNO?=
 =?utf-8?B?bXZCM0U4UVcxRnZQV2tIMDZIZktxT2FMNFNJUGgyMU51ZkJrTXYxRE5QSFF5?=
 =?utf-8?B?VWx5Yjh0R1NSZjdRVW5VY2tmSHpkaUczckhjcWRqT0lQc2dySWRsRmRlMUV5?=
 =?utf-8?B?b3dSWGZRMlRNQkZmQXFWT1hFVEhoVm1ZdmREcFFPemdJODU4aFQxYlRLc3Jk?=
 =?utf-8?B?cUcvUy9xSTg1aU1LNWM1YzJob1JrT2NEL1J0U1djL2RxM0dQR0c1S1Q2TkhB?=
 =?utf-8?B?clVja1h2dWFoRlFWM2szbjhPckgydjBhYVN2M0NjY1J4NGFjeDlaNlZrMUVr?=
 =?utf-8?B?bXo2U2s0b1ZIYnA4MnZCME1scExUOUhRc1A1OG0wa2RxUnN4K1UvQWV2YW5Z?=
 =?utf-8?B?ZEhaS3k3cjNseVNLV2hFN1ZEUkJ1RzFsNUhrT2NacjFhb0ZxeWhkRDdIclpJ?=
 =?utf-8?B?MzdUcVlub3czcXdiNm5ONkVUOTFiMTdMYkJJUDdSRFFOSjQvYmhnaUlSbmty?=
 =?utf-8?B?L3Bhd01EanZuQlFsa3FHL0V2Q1lXVHhyZWpIV3B1bks1YUYwQ2NtN2EvK1dJ?=
 =?utf-8?B?MmwrM0ZpTGtYdUNRNHRVaUYzQzZrbXNwYnB6NFhlMXZLOEtGdGg4ejN3WExF?=
 =?utf-8?B?WS85VmhZTCtONDAwU204L0xXbEw2Y0d5Y245SnBHdmUrUSs4ekxFeEFsWkV3?=
 =?utf-8?B?Qmt6SlB0cnJHeUVIUVVsOG9yVW1IblNjbStodFRFdjhVbFpsNmVoMTFoSEZV?=
 =?utf-8?B?bWErZEFmQnVzcEw0Q2l2dTVIbndqNTVhZ0tCeVAvVkhMdTVxVmZTZy9rT3pk?=
 =?utf-8?B?bUZnM1ErTUx3dGpQaS9ZdmgyN25hMFRDZFV6MFJiK2RHMUZTYzdXYzN4eEpF?=
 =?utf-8?B?M0czanVpK3lqbVlLZmw2SUxJVDVPWEJEcVh0QUVtT1FjZjZrYlFpU2N5OVZr?=
 =?utf-8?B?U3JoQmZJb1FJanVRYUxEczZjOTh5VkRaUXVFZzFPSVNuZXBsV0dDNFpCU3g0?=
 =?utf-8?B?aFJuTVM5QWtBOEw3TXdXTDQrVGs4cW5xUVZRay9pS3MzekNiZVRiSGxYSHRR?=
 =?utf-8?B?ZDZybzRsY0x2UTJEUml2dms1TzNZc0Z5RVVsWXIreFVuTExhRnMwanhoemRJ?=
 =?utf-8?B?VmI1YzVPWXZPQ2tIK2RBMXdvaWhIbUI1bzcxbVJQVlp0NnYxS0FMb1BCdFRt?=
 =?utf-8?B?NGRTdGJkMmZPeklnem8zdVhRWWtnL001OC9VNm01Y3dNNEFQRmcxZzkrT0JB?=
 =?utf-8?B?Sm5EWEZreHQrY0pwdlQxQkZ3S29VVnB6U3Z5T28vNy9POGxCWFVEN1d3TW9C?=
 =?utf-8?B?bndVVFBJOTlscUREa1gxZGl0LzRUeHNCbzN5MkxqNzdxY1J6SVNOa0JHQTgz?=
 =?utf-8?B?aDRFYzF4Uk81VnMvM2VqS0N0Mm9DdWZITDVpUVc4dEJoUHBKRFhnUFhoSXgz?=
 =?utf-8?Q?faLzxGAC1aw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPFF6E64BC2C.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1g4SWlVN1dBd3l0YnlPVitwb0JOUXJJZmlHZFN3S1gwK0wyTjdpM1RFVDZl?=
 =?utf-8?B?eFI1c3poRFZtdGZaMTd1RC81YzNGRUpGQ3FSaytvSG1rcTFhcGE2aHZFdVh0?=
 =?utf-8?B?RTBYMWRnUEl5Y3U5QkY5c0hkbHpwRkhxazRkMXRLVXN4c3dIcVVkVThrOWVZ?=
 =?utf-8?B?ZVRqbXFxUUxpM3dlNi9ZdGdGRDJQWEI1a2xpTHVhQkZVYTdRNFp2ZWpuVEV5?=
 =?utf-8?B?ZmxKN2VYclo4L0ZqdDhvUmJhMmJKNURUTStiRGR3dWd5NS9rNjVXNFQ2UjNE?=
 =?utf-8?B?U2VobGZ0TEswU1BZU3ZDODNPTm4yYTIrTGJiRDhSc1FhVDllRVJlZ0wxR21x?=
 =?utf-8?B?R2ZQTEYrRWhCa0J0a2hBa3VjKzV1TDlmMTV6OEpCUXBva2dSVGpydllOQUlR?=
 =?utf-8?B?UXQ3RTJqK01xY2NGMXY4ZCtQRlBSR1NKQ3NoWHR0Um5VZHROUkRYaXd4bmZV?=
 =?utf-8?B?cEhyS2tDTm9JdUlEUXdmNDJpbUZ6eTY1akpoQTFVYXFxTXgycy90dU0xanRj?=
 =?utf-8?B?SFRjTGlQNXRqamJOaGhRMjg5Q3R0Kzg0ck14YjNGN3RucEJXZ1g3Q1hZVklS?=
 =?utf-8?B?Ry83dTlaV0NVQ1EyK3Q4em5LTldpNlczaG9zb0Fxa2MrcDBPS0VSSFpCUzB4?=
 =?utf-8?B?ZFdYUTlTVTZYN05INzZUTVNic2xUQWVmUUU1bEVWZXdBaHpNaFB0WG1CODNE?=
 =?utf-8?B?ZVcvZzhuNmM2MXRpdklVSFpzMlFZWmJHS2VDRStwY2cwR2FqZmRwS2FndVRY?=
 =?utf-8?B?dWdYZG1nY3VIRUc5akowWWwzbTVrM2ZNanRxb1V0dTVuK0tDUE5RTlRYTWVM?=
 =?utf-8?B?cnY5K1RXeTNRYlZTUEZnQVYvOENUWFRueDcrRk5LRjZZeGtoQlVYSTc2MjRE?=
 =?utf-8?B?eHk3c2FWYVQ0RnFzNCsrNmdFa3RPSFhsb0dxdEppSVlLRStQNnZoWlRXQnVH?=
 =?utf-8?B?STEraDc5U0V4cktiR0VXelM1NjkrYmtlSmhJVzZrbkcvQWdTWUduRHJiakNL?=
 =?utf-8?B?djhSd2RaSFduVXVwb3BOcVRjbXcraENNNmRDUUsxeUJyS2JXZEtrRXBTWGtO?=
 =?utf-8?B?eW5zZlhkSktUUFdyZDFKR1JwY3g4Zk1pTHQrNGNLbUdsekZBNVJqNGV6RmtN?=
 =?utf-8?B?UTRJc1pzSkFRSmgyNUhOaU5CTGVTdktNSFRHMWIxNHFkZy94cFhiVmE0TVdJ?=
 =?utf-8?B?R251cVcwcjFMUkxoWlpkakQyWWJKQ2t1RTV2OURKdnFoNGM4YzNiOEtzZ2Q2?=
 =?utf-8?B?d1dVZmxMU21qcFowRWtsVzZaL1B2bWdkWWZURTBOTUV3YjYvSWw2TWF2NGVM?=
 =?utf-8?B?QkNvNGVXeERuMkdEbWZMcG5HSUM0aURNT3JEZGgzLzA0aFBpUlArMkdYSDdP?=
 =?utf-8?B?SG9jeityU3IxdGVxZFVGQUxwUmRNWmlDNmw5d3p2WUpxbzBoR0JBWHFRSElW?=
 =?utf-8?B?S1NLd0w2TGl3NWtOanZjRUJiYU9HSzBTaWlaU0NrOGNsNm9aanR2d3FKdEt3?=
 =?utf-8?B?SFgzakhYQWR5OFdtZk1hcUd5S1NVQkZod0paWDVYR0RlSTd6QlNUSExrSEFD?=
 =?utf-8?B?NDIwZUdCeUIyTVo5MEd3ZU9ydjJ2MWZjTVVrTkw2TjQ3VjZ4STZ0VDdKeTZ2?=
 =?utf-8?B?OXhJbXRmalI2T3hPUWw2TDF4MDBqSnBQUlo1T3Q1eEgxKzlLdnBFTzU3YlZw?=
 =?utf-8?B?dFlMZUFDQ1ZxTy9VbVRjUTl4Qkt5bjRTa0c5MzRLTkNhUkE1ditBSy84SWFX?=
 =?utf-8?B?MWNQRXg5N1o3WHhlOXNGMDJvSk1xOFQrMTNEVis0QmFwY0h3QStQNmNLdCtZ?=
 =?utf-8?B?dFVLUEcreHo2WXJzR2pHM2Fnc3ExYlM2YTYxMHNSU1JLR2NFMmRFTjZveklw?=
 =?utf-8?B?bDBUMSt3SXlGRm5zQm1wb3NTNVV3Wjk2d3BZaUp2ZjFtQW9IN2VFeE42WVkv?=
 =?utf-8?B?UUc4UHZuTXZwRVFQZFZycXNTNW1TaGRUSnNJaDhFTUo1SzRYQi9xZGUrS1Bl?=
 =?utf-8?B?Vk9MeThQTmRsMVcrS3psWmZzdGhsaHEySTBQZisxclQvK25EZ0tyMkw3aTh0?=
 =?utf-8?B?TjRKK3o2MW5RWVNNVkJ5RUpMRGhrbzdPQ20zamRUZEhGWHZkZ3lBQU1mdUFt?=
 =?utf-8?Q?ss8uKsoA5RDePAGgncrO9j2YN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ed136c-ec85-44bb-e470-08dde5f6be67
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFF6E64BC2C.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 05:50:08.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fP3mXn4Yi3dhBdxvsXdKgKW3f8Z/3mLTEtLNquCwv60WYfYjnPSxKH6aJg66UjSH5R0xOMhxTB5D6lQL95ufQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7080
X-OriginatorOrg: amd.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/28/2025 4:13 AM, Ackerley Tng wrote: > Shivank Garg
 <shivankg@amd.com> writes: > >> >> [...snip...] >> > > I meant to send this
 to you before this version went out but you were > too quick! I wanted to
 get it merged quickly ;) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.93.61 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urVxu-0001am-Jf
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 4/7] KVM: guest_memfd: Use guest
 mem inodes instead of anonymous inodes
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
From: "Garg,
 Shivank via Linux-f2fs-devel" <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Garg, Shivank" <shivankg@amd.com>
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 dhavale@google.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, ira.weiny@intel.com,
 roypat@amazon.co.uk, matthew.brost@intel.com, linux-coco@lists.linux.dev,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 apopple@nvidia.com, jmorris@namei.org, hch@infradead.org, chao.gao@intel.com,
 cgzones@googlemail.com, ziy@nvidia.com, rientjes@google.com, yuzhao@google.com,
 xiang@kernel.org, nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 amit@infradead.org, thomas.lendacky@amd.com, ashish.kalra@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 suzuki.poulose@arm.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, josef@toxicpanda.com, Liam.Howlett@oracle.com,
 pvorel@suse.cz, dsterba@suse.com, viro@zeniv.linux.org.uk,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, dan.j.williams@intel.com,
 surenb@google.com, tabba@google.com, paul@paul-moore.com,
 joshua.hahnjy@gmail.com, brauner@kernel.org, rakie.kim@sk.com, bharata@amd.com,
 kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pankaj.gupta@amd.com,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 linux-fsdevel@vger.kernel.org, vannapurve@google.com,
 linux-erofs@lists.ozlabs.org, rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 8/28/2025 4:13 AM, Ackerley Tng wrote:
> Shivank Garg <shivankg@amd.com> writes:
> 
>>
>> [...snip...]
>>
> 
> I meant to send this to you before this version went out but you were
> too quick!

I wanted to get it merged quickly ;)

> 
> Here's a new version, Fuad and I reviewed this again internally. The
> changes are:
> 
> + Sort linux/pseudo_fs.h after linux/pagemap.h (alphabetical)
> + Don't set MNT_NOEXEC on the mount, since SB_I_NOEXEC was already set
>   on the superblock
> + Rename kvm_gmem_inode_make_secure_inode() to kvm_gmem_inode_create()
>     + Emphasizes that there is a creation in this function
>     + Remove "secure" from the function name to remove confusion that
>       there may be a "non-secure" version
> + In kvm_gmem_inode_create_getfile()'s error path, return ERR_PTR(err)
>   directly instead of having a goto
>

Thanks for the quick update! The changes look good. I'll incorporate them
in the next version.

Best Regards,
Shivank


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
