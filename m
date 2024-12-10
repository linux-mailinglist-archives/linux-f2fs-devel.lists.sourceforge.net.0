Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F7C9EB272
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2024 14:59:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tL0lx-0002Mm-6t;
	Tue, 10 Dec 2024 13:59:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tL0lv-0002Mf-3D
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 13:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RrjnCzW+piTgzeTiiZkmye4ZVYT1yFyi5Sb0XWZrVrM=; b=HsnJV4pcliNs0Fr8j6hKU9DTxG
 rwVLH6L7KHFsQj+v9MgV5Wd3zSzgD01I6UPj4iLXJ334KWVbDFLwm3/7krMMtfVpv3ml0WLltFPCS
 6LCYPUsi1Z8hEl1WXuxAKw7xfvBMSIygXbbsn5ExRpnosBLpqclzxyI5tChXgFpL3E0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RrjnCzW+piTgzeTiiZkmye4ZVYT1yFyi5Sb0XWZrVrM=; b=a0fh08fnqSHAaQMV+3VxGvNKkE
 iK5l4/IvPRFFUsiU6mSghJzkb4XpN2L+7CaICg171xGi4ILPt5zhDeMG7Tnf6ZSToOS+0HW5u1zoK
 4L3KzvStBZc/uVk8w2BsQBSvLMfHuNcQQznozUnHicJyiGUKsQsJnWXsmqy4hHSIjvdw=;
Received: from mail-eastasiaazon11010035.outbound.protection.outlook.com
 ([52.101.128.35] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tL0lt-00015r-BZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 13:59:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhHzyCzFOWoqYTSnz/imabhZclNHxG8v9vecVCYYeH6YofcltdzJ7U8TpJ1KnKKTca+MMSMcbIX1t0IE4im3sFA1/go5+3ZI9L3fV2db9h656RMoKu2CrIDUMqK3v3+JkOpNi4ZwtEljFvDLHVxnCva5lkwfU/WhuXnUaNMLDT5RHkb2gv/WWk3b3AW8XuSDje/fCqJHau/SKf7GTO9ssfkDX8GyQ/R+e/C0RJ5uayUxehELzGOF2W2ULXYhPLf5eBW+MlJ/Imeze++11rOx8G9q4KSWSNDsLPNZOSQ1sB1Xn2YWZ4jvM44je+R8UKasJ4HjfFDUntmZP6CILGP3YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrjnCzW+piTgzeTiiZkmye4ZVYT1yFyi5Sb0XWZrVrM=;
 b=lku/sRNAT5v7V6Rz9dTaQP9BRzKcCaWwiWw+MDYvhIufAMPMOn3FecZnysJXB/6Qw2EG8iJIQGb8dc95QoTT3mJdmVlXnsNG8XI0b0kft4qWgQN5PJXMqpsRxwAPO0tLVi6yWD+UFYACe5ymIRCfduv0rFD6ik692a4Vro42v3JIbErtgO+LgxiiHR3rAtYfo00wSYwOp7eUKHeERl0gnz85HPijxWvYSptzQ2tNUg0ewfowhXWsFYL8XK52A5VxNHhRPJTk3O6JQCJ9UlyZAKTx8WVZc5xFkKypSLuL8hagwg4c2rq7iHB1Bc8UMcPWBYWGvzBnrxoTbOf+dXVvQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RrjnCzW+piTgzeTiiZkmye4ZVYT1yFyi5Sb0XWZrVrM=;
 b=HNAB1jsM3M0uRmYNf4qxQI7eWFeVZfcE26eE3cpMI2mMhOQAl9ZTSRl4ZgErHAb5MPm50BnkXKmfRalVj5TII9rozolKk+0AnTJ2e3XiHu/Orijx0iyGAj1vzQomvoByC1vIdEUP/jlzPVCJJ2IGJP4QbhKtRUDhMf122TaUa+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB6607.apcprd02.prod.outlook.com (2603:1096:101:1b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 13:43:07 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%6]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 13:43:06 +0000
Message-ID: <7a567bbb-e49d-411b-9d59-8549135c15f3@oppo.com>
Date: Tue, 10 Dec 2024 21:43:02 +0800
User-Agent: Mozilla Thunderbird
To: LongPing Wei <weilongping@oppo.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20241210082801.4104194-1-weilongping@oppo.com>
Content-Language: en-US
In-Reply-To: <20241210082801.4104194-1-weilongping@oppo.com>
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c08aee7-ca64-4c53-e444-08dd19209371
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkEzK0RSTlhHaW1NKzRqQnhkQ1ozaURaWFlsQzJaeWVUV1dBMzA2ODJ1V1I5?=
 =?utf-8?B?K3hKM3lpdmpMVGUzR2tWMEE4bzB6cW83ekw4QjVjTTEwSkR5NmxHamlqcW9D?=
 =?utf-8?B?bk83RjZBbFNFcUUzMFNNMnVyUm5oYkJnbGd4U0ZsL2JwOTR1VUNuVTVoN2R3?=
 =?utf-8?B?TlVlK2FoZ2NjakRKN0EwM1RYWW1PcExFaFVkUjZkcERJRm5aazNzMmJVbGla?=
 =?utf-8?B?VmRET0NSaGRtQ2FEd2lzRFpHbzdIK2NxUEFCbXNLT3I0MDVLR1hNNzBHV3U5?=
 =?utf-8?B?UWo2UG01R1VNN1VSL1E3U2Q1SWpRb0FmUXlteXFIY2pmeVA5cjZEc0lnT0lH?=
 =?utf-8?B?KzNKSEV2Z0NvYlNrM3VETlNvYWZPM0ZqbkVZdHVKOHRrK0FzRzlNV21YQmxY?=
 =?utf-8?B?b2dpbUViYStoTno3RjV6dkFOUTI5L29mRDlwS1lFTjZ5dG9YcUJWMmx2Nkg1?=
 =?utf-8?B?V3hHa1FiWFdpOWdYLzZFL0JkWWx5VXNZL013Q1lnQTc4dHZKTEY3amFCbFRn?=
 =?utf-8?B?WUphbXdMZ1FyQUw4R2NJUHozdFNqVGNERlVjTVhnQzE5RVRkUGJWaUw0Q2p4?=
 =?utf-8?B?MnQrRUZvZUQrU2xHSFY2Q1lvWDAvNjVkdnFFUWlVaDdSdkRhWS9VY096YWNa?=
 =?utf-8?B?OVZhd3NTc0wrQzhNUlZIWjAxNzNYbm1YNGJWUjlkVWdKbVlHczFGY3ZrNGc3?=
 =?utf-8?B?S1FIaU5LZGVnb3BScVM4bXZzTkdZMVk5T3JHNURaa3pGS0U0dkorTEIzUUtG?=
 =?utf-8?B?TkFGOVRHNlgwNEpMRG44TEpHSHZtZVhPWVczRFBIeit0RWg2aW9XRlc4SjRv?=
 =?utf-8?B?SC85c25MWGxEeXpEMFdXY1Vyb3NvVXFTdFR4dFJxVGxROTZlMWNFTmUycU1r?=
 =?utf-8?B?VTNldnZ3TGVQbjdLRER6a1A5QmpOUkhnaGJOSkRlRFhSVW11S3IzUkpkTmdW?=
 =?utf-8?B?dDYwdHNFVHR6aGk5Y1k4cEFLb0VJdFRod2xoN3VkT0lUVURTV1ZmOXZJTC9J?=
 =?utf-8?B?UWNjRlVKNndHbGU3Z0Nmck5SMDc3cm5MbGhSenZsY29nSitkR0RDRzBiUDFI?=
 =?utf-8?B?Y0VZTWVEdlUvWUdrTTFHNE42MG5KYktoUThuN2JTQzVDNTVEY0FDT0dnR3RT?=
 =?utf-8?B?NnQ5Sld0WkRVWjJ1WW9LTUplM20rMXBScUVXZklkVExSeW1WVGplUzFvcE1K?=
 =?utf-8?B?RGorM2dXZjNSc3RNRG5oYS9PUUlNWGNnYWxBTThhSkNZV2Vvc0pDclR3dGZo?=
 =?utf-8?B?N1c2S2Vwdk9uTjNsYWNuQ1pDR0l3cmRhMU1QTENNRTFBU05NVFZVNGlFTE1a?=
 =?utf-8?B?OFdRbUNPcEZ3VjVJeFF4dThONzJocEowU3htM0FjOXRxWUs5N2FCYkVCYmhN?=
 =?utf-8?B?M3NlOFFRdTlObFVsVmJVVm41MzJSN1hSZ1ozV3k2L2Ryd1Noa2RyT3UyVDM1?=
 =?utf-8?B?eWlFSE4yUkk2TjJRN0RLNHhiZTJpVDVVU0FGZHRSa2VNSW81NC9vZDFpWllO?=
 =?utf-8?B?dHRJRFJpQVNzZW93MmNDbjBuUEpXMUpQeFpEaW9UNTA0cjZndTNZN25uTnZm?=
 =?utf-8?B?S01uczF4ZW1hR1I0MWxCMmZPTk9tdnJlZTJ1U2VNV1VlSFp4VGZObU9oa054?=
 =?utf-8?B?T09qaUxQUTZqNXVwWUxUNkg3UUN4YkFmVkxLWWltVUVsbGk0V1ZITVhYa1hJ?=
 =?utf-8?B?R0lINC9QOVhPNzVFYkpBMEVncVJXM0w1R000Syt1RDcvNVB0TDQ1emxpdmk0?=
 =?utf-8?B?clhHKzl2VDhrS1k4TzRHTmcxd3BkYU9xQW1KOTYzdVhXK3E2Q25kZHNOdGpF?=
 =?utf-8?B?aXNvbUxNWlRKUUs4MEFYdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnJ1VWVMYlQxbW5IbXlCbVdnTk4rNldJUVh6Vk1MSWV3Q21laXhXK0VZZ3kx?=
 =?utf-8?B?UGNBQURTNWNkVkx5bGVCT2Z1VWI0dytFMnppem1DZDJvR2gwd244L2FhTjA2?=
 =?utf-8?B?MFA3aktWOEF6b1lDbXo3SWgza3BrekRqUWdIVWdwSlJMSjNEYnBkQlNzUm5P?=
 =?utf-8?B?WGcybTFOVUx0My9ZZVRGMVdyU2FqQTd0clo4VWJQeEM4NmpTdEhLSXVLcFR2?=
 =?utf-8?B?MWlQOHVRM2RvQUVTQUVtTkVGaDRjN0pSRFN6a2xaUFRBalkyUytHUmJrdThj?=
 =?utf-8?B?L3JWUEVmQkJQMmh2NmwzeldJZEgvU3NrRGEwVDJBcVA2YXA2dFhsK1hTM0E3?=
 =?utf-8?B?cUN2ZkpTU1hLVHIzSjR3QytzSm5RZW0vdkRVTW93LzdSUk1NanNkY1NQUG5Z?=
 =?utf-8?B?U0tiRTlUclBXMU5PRnNuRVVQUEk4VTVxNHp4Y3FrMkpXVm5sMEZJRlFwYUFs?=
 =?utf-8?B?VmpaUWxJQ1U4T1ZKbVEwUzJubG9EUlFiM0dsdEJiOGd6UWxJM0JtN1N6Wkgx?=
 =?utf-8?B?ZkxZc014aUFZV01yTVlYaW5YbUxTbDFVM1dLS2pKQStuL2luRm0wY2FZR2F1?=
 =?utf-8?B?Tm5HNnZHaXJ5Si9LNldKQ2pZRFI1emNqZ1N3clNDSWo3MjFuaklTQlZ2V28r?=
 =?utf-8?B?WWJ2WS9OSHVRNTNXOVMxaUNwdmt2NTB4RU44MXhld2p3NVhPTllzWkNNZk5U?=
 =?utf-8?B?VitrdW9leU15ODFVTmp2L2xRbWdud2wxK05DUCsxN1d5YzlOUUcyWjkzZ1JX?=
 =?utf-8?B?OFlLOXhZbUpJVk5LUllScVpBdEF0aWt3RkpFTUFMeTRLdjRBL3Bwait0YVdt?=
 =?utf-8?B?YXptWjY1NTVzYTBkQXFtcE5qK01vSzkyUmx3dzhIOHZQdUZxL09jRk1QdHV4?=
 =?utf-8?B?aDlSbGUxQU04QjJMR3AwdGVob3lwK2xPWEhPQVR5QVFhNFJlZlVmNHlvQzds?=
 =?utf-8?B?OGYySVRqM0cwU3NJb09qS0lKWTZ6bkVTTjZqZGxPeG1DZnhVRzRrdllOcU5L?=
 =?utf-8?B?NDQ0NEZNcC90V3piVkZBQm13V1JRekxzdnpPaTE0SE9HcXIzWUYvOEZIeTRE?=
 =?utf-8?B?MHd3MU55TU80ZlRHUTUvM1BDZjgrb1prcjVkMXVCUFNYclhYLy9pMVlMRUpS?=
 =?utf-8?B?WTYwaG94aGtDNUVheVJEc0J3TzBuUVdubll6ZlU2Q293YXVLSTZ5WXhremNT?=
 =?utf-8?B?WVlLY2JvUFptNzc2NG9Jd2dLTDdzSHBqUXk4L3F6bmcvWUNtN0MwVCs4Z1ps?=
 =?utf-8?B?emZWcXJiMmhOamk2UnF4NEhtalF4VU1NWkJ0d2tubTdOYnI4V2NMZE9sMDFn?=
 =?utf-8?B?VCtFb2dZRjNYRW84aVFnbWxSS2NpY2ZZc1BzQllwd0FlQ3RaZkZ1N1NxaEdX?=
 =?utf-8?B?aHgzSjRvN3ZFc2U2RitnUWJSK1RNdnFESU1UNWpjOFk1MUFWZmxhVVRxVWZx?=
 =?utf-8?B?dCtuMTdCSjNLSG5xZ2dwOWxrRi9VdFhJaG5WZ1QySmdWZTdwVHN3eWg5VjF0?=
 =?utf-8?B?Q3lFRVRVNlBidGd0aENaK0J5OWFwSmZlVmFYenZVVDIyenU3SFF3YW5hMnVt?=
 =?utf-8?B?cmU1cXNCbndkdC9KZExMOFJDZUJwRVUzcFRFM0cwbVBlRjJIQ1I5KzhJWG5v?=
 =?utf-8?B?QzRUT3JueEZDR0lrOWZTK3NpM3JrdnRqSk5pTUUvVkEwUTlKclV3N0EyRXRY?=
 =?utf-8?B?eTdRUktDVjhtd3JxKzVTbldHVXhHNVJaOGcvR1E1TzBXTjRBSzJ5S1JYSmhL?=
 =?utf-8?B?WSsyQndZNjZKY0pWS1FOcktNTDFWZmJpY1pJNG5Ma3R6TU4zZ284QklDU2NY?=
 =?utf-8?B?VEV1V2ZWMitqVmdRclpUSHJSQldyVnpmM1ZJcDJac1prYU1jYmdXdW9Bbm4x?=
 =?utf-8?B?NFcydDVUd01ta3JDaFlHcXBYVmpRQ29Jd0xhZ0VNNllhUndhSXNjMWtFbi9m?=
 =?utf-8?B?YUR0Y1paTlNsdkp1TXg0OW9RUzY0c3dIcUtWcXQ3ZmhIMEkwVEtMNVRvbEtY?=
 =?utf-8?B?MjFoSm96bklWRzVpZUtJN0dhaHJZVk1scWV5d2V0Wm52NmxkUE1ZRTdtclMz?=
 =?utf-8?B?QXFneU93TXB5eG1Ga0ZISHlVNjFscW9PK09PdHpMdElmVlIyR3dhaDFtUnNJ?=
 =?utf-8?Q?tDN0pYisX9Lu5YtubMBTlEnak?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c08aee7-ca64-4c53-e444-08dd19209371
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 13:43:06.1779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67r2sOtEn7u445pO4l173zaIxCmB5+IGIl3yAWf8d6Ikkr+9BWislXqCqFr6rwsagZkTJ7rKV5Ijii+DQNLteg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB6607
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/10 16:28, LongPing Wei wrote: > This patch want
 to reduce the number of system calls to improve performance. > pread and
 pwrite will only be used when the target platform support them. > > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.35 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.35 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.35 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tL0lt-00015r-BZ
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs-tools: use pread and pwrite when
 they are available.
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



On 2024/12/10 16:28, LongPing Wei wrote:
> This patch want to reduce the number of system calls to improve performance.
> pread and pwrite will only be used when the target platform support them.
> 
> Signed-off-by: LongPing Wei <weilongping@oppo.com>
> ---
>   configure.ac     |  4 +++-
>   lib/libf2fs_io.c | 29 +++++++++++++++++++++++++++++
>   2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/configure.ac b/configure.ac
> index 2053a65..439b97f 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -182,6 +182,7 @@ AC_TYPE_SIZE_T
>   AC_FUNC_GETMNTENT
>   AC_CHECK_FUNCS_ONCE([
>   	add_key
> +	clock_gettime
>   	fallocate
>   	fsetxattr
>   	fstat
> @@ -193,7 +194,8 @@ AC_CHECK_FUNCS_ONCE([
>   	keyctl
>   	memset
>   	setmntent
> -	clock_gettime
> +	pread
> +	pwrite
>   ])
>   
>   AS_IF([test "$ac_cv_header_byteswap_h" = "yes"],
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index 520ae03..a8430c9 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -279,6 +279,12 @@ static int dcache_io_read(long entry, __u64 offset, off_t blk)
>   	if (fd < 0)
>   		return fd;
>   
> +#ifdef HAVE_PREAD
> +	if (pread(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE, offset) < 0) {
> +		MSG(0, "\n pread() fail.\n");
> +		return -1;
> +	}
> +#else
>   	if (lseek(fd, offset, SEEK_SET) < 0) {
>   		MSG(0, "\n lseek fail.\n");
>   		return -1;
> @@ -287,6 +293,7 @@ static int dcache_io_read(long entry, __u64 offset, off_t blk)
>   		MSG(0, "\n read() fail.\n");
>   		return -1;
>   	}
> +#endif
>   	dcache_lastused[entry] = ++dcache_usetick;
>   	dcache_valid[entry] = true;
>   	dcache_blk[entry] = blk;
> @@ -393,10 +400,15 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
>   {
>   	if (c.sparse_mode)
>   		return 0;
> +#ifdef HAVE_RPEAD
> +	if (pread(c.kd, buf, len, (off_t)offset) < 0)
> +		return -1;
> +#else
>   	if (lseek(c.kd, (off_t)offset, SEEK_SET) < 0)
>   		return -1;
>   	if (read(c.kd, buf, len) < 0)
>   		return -1;
> +#endif
>   	return 0;
>   }
>   
> @@ -535,10 +547,15 @@ int dev_read(void *buf, __u64 offset, size_t len)
>   	fd = __get_device_fd(&offset);
>   	if (fd < 0)
>   		return fd;
> +#ifdef HAVE_PREAD
> +	if (pread(fd, buf, len, (off_t)offset) < 0)
> +		return -1;
> +#else
>   	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
>   		return -1;
>   	if (read(fd, buf, len) < 0)
>   		return -1;
> +#endif
>   	return 0;
>   }
>   
> @@ -615,8 +632,10 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
>   	if (fd < 0)
>   		return fd;
>   
> +#ifndef HAVE_PWRITE
>   	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
>   		return -1;
> +#endif
Hi, LongPing,

Can we move lseek and the following write together after writehint
operation? I think there is no need to place writehint between lseek
and write, because writehint affects the inode and does not affects
the pos in struct file.

However, I am wondering if writehint here works as expected when fd
is not opened with O_SYNC or O_DSYN, especially if multiple writes
occur in a short period of time. Please correct me if I miss something.

thanks,
shengyong
>   
>   #if ! defined(__MINGW32__)
>   	if (c.need_whint && (c.whint != whint)) {
> @@ -629,8 +648,13 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
>   	}
>   #endif
>   
> +#ifdef HAVE_PWRITE
> +	if (pwrite(fd, buf, len, (off_t)offset) < 0)
> +		return -1;
> +#else
>   	if (write(fd, buf, len) < 0)
>   		return -1;
> +#endif
>   
>   	c.need_fsync = true;
>   
> @@ -663,10 +687,15 @@ int dev_write_block(void *buf, __u64 blk_addr, enum rw_hint whint)
>   
>   int dev_write_dump(void *buf, __u64 offset, size_t len)
>   {
> +#ifdef HAVE_PWRITE
> +	if (pwrite(c.dump_fd, buf, len, (off_t)offset) < 0)
> +		return -1;
> +#else
>   	if (lseek(c.dump_fd, (off_t)offset, SEEK_SET) < 0)
>   		return -1;
>   	if (write(c.dump_fd, buf, len) < 0)
>   		return -1;
> +#endif
>   	return 0;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
