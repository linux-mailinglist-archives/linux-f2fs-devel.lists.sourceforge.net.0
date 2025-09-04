Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0190BB43749
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Sep 2025 11:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=La3lOjXq6GrkexZhzOCJcb17SvWhtgtIDXxpP27/IhQ=; b=Y+4dMeK7NzUCcPXmJv0KV5qs+E
	WiETMKPSB+jYNN6cX39R0C/NQWU1btUoWZu13Sb8c0+Zy3eBzBZ1ocGYTBPbLauk9dDFTEnDSdmc0
	osTp6bEBOp/x51249obPUGwBrvFrQmLUcojLBJnh/WJ6iGKVq1uVqHc/OfUSFb90rVQM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uu6NO-0000xs-6u;
	Thu, 04 Sep 2025 09:35:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1uu6NF-0000xV-CK
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 09:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7uyKNSRB1l0/z+kSa3FaDjnCoJaTdm4vXlDOR0lXdsI=; b=k+pdSna8NarqnOZUWR9UVXxvRj
 kRG9DPGffybalxNtlTChs7Zp6PYsFbX3Ff/zBsjuwAAj0lyt2KziUJSyAbsrP6F6oKh5rTJzjWl1t
 QumftJrIu9jG90TvK0yohWGJd9BKCjKLFSbejqZrRZmk6TRfhbskjD+SoeGnt/yzWdLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7uyKNSRB1l0/z+kSa3FaDjnCoJaTdm4vXlDOR0lXdsI=; b=L9xsoVKTsE7e8Hm5J7k4egD3Xh
 vN4jL0ahMwHllCTwFAB6UODy8sZi90D/yZCb1SRmLPwkv3SY2Ufg2yY/vEBsclEIDtZZXjk2bpTRF
 Ti9WQGUFdkzeQLPonyWQ5ifBnW/N36tKPU0CDMKtJOUhg21j11kDviGCUWoYkKazU/dY=;
Received: from mail-japanwestazon11012053.outbound.protection.outlook.com
 ([40.107.75.53] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uu6NE-0003VK-01 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Sep 2025 09:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBOJxlnPGNbpDxYgIuud+7evOs5sSugOtgwARnubOHCf2wW+NRBRlq5LeBq4/MXB2cxGwJE7PTeIRAOPlHK15jf8MOI4a0CkYWH2KuEF/xGYGCrV9kN1io7j9XMRea6wV9BInOuA30U3fva9jYDyTDZ/07V4/TFDddac51DArZ71rL8XUGqV2hZB3huhHPk8TP/PX5BxqqsFdsLBUJshJ76v0gKeAvaUbmvnGpsLtwA1VDBgId5T2752YdNMRgiKsfHJrNt2KIaoSbJrEKkKqB3Wm+2cgxK4yyUHi1iL/6PrRalhSBibBgCG2L75MyAG1sjQETad2IrQDehc7rpyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uyKNSRB1l0/z+kSa3FaDjnCoJaTdm4vXlDOR0lXdsI=;
 b=cG1FC+E2YEpsdLxpkLKkiF81DI535zuDRfUn0AHHIzeEtgPsvw1nwrMWHV7AWJG6i2V1yLqV3YN3ZNDyqlx2WGPEJxo/vCbeECPwK5Y2cTcuw1o7Gc6vtX1Cj+NvXnTGyDGGQq6MsA3nN3eGn02/Yvb4cjom2OBK5ww835GLnKNUTKcpStWnBcx7qOieBV2aXnsxbjDHsOzyuxQmKdxJ92VGLTe+rz5pC7Bcs1xSh8t/TAzgUHb+aKHsY4delzanJibh+gBPejQ4lCrJDCTOzVnegUhZbZAeLkQ1y7GAh5V1C5CGVPXcILx2ymbMi+T1177cf2zfN/RbOHMqS/HUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uyKNSRB1l0/z+kSa3FaDjnCoJaTdm4vXlDOR0lXdsI=;
 b=TfNkW3ZaOuzcwKpl5vcGQvaU9RtX1WKgAeseN5ujPBWzH4znSkEYVWqfsUtRAQaRyWgprxX1fy93rpaib6v0GqbmMnmuJcuhqXXdsDbJ7tdG/dNTPG1vfF2yJ5jfEXbOUDs/We2QRqglxy6rQ7RiCEYa4dylk3Sn+LCSLbE0JZsOKUbdwQ2PFw5EY0Iav/VUmPZ6DMhpAtcqcF1TpV/UjjYkUK63a5PYJqgMllrlvbrwdcIZQuAT3Zw0Hzu5st0u3ufxY/RtWAdRw2EPjp1VJy7rsM2On6gMeR0p/PKPiiuaajGAbNYers5R2WgXSDmYhSnHXr/0se3fVEhUWBGyyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by KL1PR0601MB5725.apcprd06.prod.outlook.com (2603:1096:820:bb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 09:35:06 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 09:35:06 +0000
Message-ID: <cf992923-d6c3-4ee5-8cc9-44b4e11c2526@vivo.com>
Date: Thu, 4 Sep 2025 17:35:04 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20250820075444.378907-1-wangxiaojun@vivo.com>
 <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
 <234d4f23-5ce4-426e-9b3c-5f2b28d86a3f@vivo.com>
 <066cd125-7db8-4b97-b6e3-20e10023a14f@kernel.org>
 <b38f1597-c32e-4651-b5aa-596ed4e61ef7@vivo.com>
In-Reply-To: <b38f1597-c32e-4651-b5aa-596ed4e61ef7@vivo.com>
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To KL1PR06MB6845.apcprd06.prod.outlook.com
 (2603:1096:820:10d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6845:EE_|KL1PR0601MB5725:EE_
X-MS-Office365-Filtering-Correlation-Id: 1596be82-bf7e-4eee-86d4-08ddeb9654e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2N4WHZuK0lDUXFkTU1GdUsxL3VZNEZ1SmZrRmIyM3pjQ3NTOWFwV2NmUFB1?=
 =?utf-8?B?NVR1MzkvTm5scWNScGRWMnVwcGNpM3prMjRvNW5Wd0JRSkRRMHdQWWpqVzZj?=
 =?utf-8?B?aWVFMzFiTkMyYmNBZUw2M2Y2M0ZUZGNNMkRBN3BmdkRHaTBiMWNnRWdZYzFV?=
 =?utf-8?B?UXFxSDU2czlJV1JyanQ2QmJDU2s5U0VvVDFLQkJGZ2w3eEJWWnRDcTduUlN6?=
 =?utf-8?B?eFc0QjZkWU1JZUFHa1RwMzl2enk0N1VjaTZFL0wxbzB0NWdEVFFjVjJzTDJI?=
 =?utf-8?B?WGhMREJraWhyWWtTZVZyUEZMRHFQbUFYQ0R3M2tMZEo0Mk1IV0htU0JJSE1K?=
 =?utf-8?B?SWVmQ3RTa0M3ZlFlWFlPV1JnekVLZlk2MGFscWNxNm5JTUk2clhHRldTcExk?=
 =?utf-8?B?c2p4OXRnbjBzM0NiTnRuaklwUkUwNzZ3elNjb0FuOThRbW9rNTZ3SVM0TlB5?=
 =?utf-8?B?K0crZXN5R3UxMUEzNlREM0lLeURYYXd0U1ZSTXdTNmo1b2k3MFlHS0U0c2Fa?=
 =?utf-8?B?SVBUanExamJkWm9xR21WSlNBa2QrdmVsVlNPdTFtRkdJb1djaWFMemUzMGtt?=
 =?utf-8?B?ZXpjN2xlSDVEY2RNQ2VMV1REYk41MnZQcnU4c3ZxbS81Nm52L2NKOVFvTXp5?=
 =?utf-8?B?T0E1b2MyUVZWYm5ZOXNBRHdvUTVCeVgxQU9iTmpqeVBQTWhjdEJQaXlSemF5?=
 =?utf-8?B?ckFLVjZ4ci8yVHMvbkVsSUYxM0I5QzhlS2k2Rkl6V2VzcjVEM05rTlRxZ1My?=
 =?utf-8?B?ODVWT2g1N3lQSm1MSXhDMzRyWE5kR3o2akJUSjA2WXdINFhnV2g5Ky9HanFT?=
 =?utf-8?B?bS82amdSUER6Z2lNcHZyTDNuaWExZCtYaFBZb0MwcjlOWWFoQ2ZIRUNxTnFj?=
 =?utf-8?B?TkZFZXRMYi9hbUM0NkhqVmhTQ1o1WmtHSjlZRzlVbU1NZ05zdDl5SGNLN2dy?=
 =?utf-8?B?dTFzT0l3bkY3M0cxVlVFcTRKZzMyWkZLMGdVR2VvQTJraGpjOW1hVlBSa2pH?=
 =?utf-8?B?RTFLOFNmYUQ0dVNDWmJ3M1UxdjlXUmRFMU1jTnd1Tis4Z09MUXlWVlh1ckh1?=
 =?utf-8?B?L0o3bituTGhWUXZpOWc3Wmc1Y053UjNsc2p1VUVTV3JwRE5GQlBCUnJDcGNZ?=
 =?utf-8?B?WU5PRGxPRE9pMmNsK1Ura004K3ZGMGpUVmF0THJmc215Q1VsNHBnVkZvS3JU?=
 =?utf-8?B?SCtGODQ3R2c2RTAzalhWcVUwc1F1bnZHZlplUnBndVczOGp2bmZ6VGNjNWxL?=
 =?utf-8?B?ZXhoUWJzL3pCZk8wTUE4ZWk5MWtKUnlXRWI4SmloSWFmSGZQRHVldWFoN0Fv?=
 =?utf-8?B?Y1JreDdQa3NkTUE5ZHdRSDNwOVd0S1BJdzRJVnVOcDZWWk9pRUVlaWRmVS9S?=
 =?utf-8?B?U0VSbTdrNVNrd2RhdkE1VVZMRFp1eXhRUHlDWGNXRmx4M1ExaXRDbVpJUlZ6?=
 =?utf-8?B?cXV1eXQ5ZlNQNjduMVB4d0xHK3JBTE42YXl1UjFMS2dDOStNRFhqTmsvQmJY?=
 =?utf-8?B?UlZKREZNdGY1dmFhaktDZFQySTl4aThtclAvSG4wbEFmRmt2ZkgvdzFObFk2?=
 =?utf-8?B?Z2xIYXhUVmIyLzlOYmJpamR1MTI5Y0liUEtTZW9GdFRiTEJmNGo2V28vNkFY?=
 =?utf-8?B?aUQ1eGdEaXhWZXJtcjV1TFRBbjdyMHcrS1c3KzJvWDRTM0VmQW41YWdsdEhz?=
 =?utf-8?B?bWwxRGNidEgzaWY1ZHVTZThuSEZwZjRJRExpb2l3UkR3aVhnV1ZQS1pWZnZm?=
 =?utf-8?B?c2JoWG1yUUlUQ3p0SU5mV2dVcjhIYmFISUFSMWdBcFV5ay95KzJ5RXd3TTZB?=
 =?utf-8?B?aHVMd3dyUGljbkNBeHJyOTdoOE1jZUVVZ1JDNG5ndERWYk02bmZTY0FjUE4v?=
 =?utf-8?B?eGlJOWkyWEdLNDhGOVhUL3pFSUhSMHNNZ2ljTFJzTk15Ymhvd0trZXZYbnY5?=
 =?utf-8?B?bGVvZ3dUbmZjZmg0aFFROVd0OTd1UVlkRWNhbEIvNEJWNzM4UWc2NmlzM29z?=
 =?utf-8?B?VmdrMWZ4dGV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1BYOE82L3BqT0hLTytqLyszb3hheDdmMFEvUjVUMHVCYmxIR1pKN2hyc25l?=
 =?utf-8?B?V1RLaGN6YW1rWTUxdUVOL3IzYVpDYjJkUlB5a05lYU1XY1RHQURJSzNYLzBK?=
 =?utf-8?B?THlvNDNCZFFjWmZoaGUvZTd6MDdjbTFTRVRJbTU2VEVVZW9xTWNYc0V1NC9I?=
 =?utf-8?B?TFdKQm5jNHNoTktSN1kzYk1WNjdqUUhQaGtvM2hpc1hheUwwa1hwMENCMW1P?=
 =?utf-8?B?eFQrbE5xR0xZcmNxOHAwcllJT0pRWXVaT2JQcGpEMmZ3K1BvMVJBWVZKVWQz?=
 =?utf-8?B?ZkFtMkQyczFBWnJZek9LY3VtYStuSndjUWJKTno1eFV0TGxWNWZPYlRGV1lY?=
 =?utf-8?B?RzlxN3I4R2VRS2pONXhsZ1g1aVV6aWVZYVlwWWNRclZCVDBjUkNKNUtRSE9N?=
 =?utf-8?B?M0VYdUlhTGhvVDdNR2NXd2ZteVYxT3FMQnhCUTQ1QUlkaWdDVVYzWTg2cXpO?=
 =?utf-8?B?ODF5VVR5QmtBTkpucGd5NGRBckxZTmRncXo3aXJUeG9UMDFiaDZVbXZ2QWlP?=
 =?utf-8?B?Slg2TllSWjdDeFJjRDRiM3hxRVlqSVlOWnVyZWJnOUM5MnRRN2dpKzBuQ3Ni?=
 =?utf-8?B?RFM1V092eStoT0hXY0hGMWpVOXBTTERCekxTV0MwU0R3T3BUU2xnVTByckRD?=
 =?utf-8?B?d0dZOENSUUxPMmVBQmNpNXR0T2RlVkdtSTBHeHBnZmR4RlVLV1M5clBOeENC?=
 =?utf-8?B?N2wrcjVadlN4clFFOEFiWTUyR0dNQ1ZMMFJnV3JlanE3Y3VWNFhLaEk3SXpv?=
 =?utf-8?B?YnNreVA0RmxHck9aOXVGcUkxS1F4RGwzRTU1VUNDZG1kLzZxRnhOTUF0RXRw?=
 =?utf-8?B?bXpMaXRJdjcyNXE2clF1d2cvOE5mT1BmaWJDOWRrMTRKbzQ1QTd5QUhadUJP?=
 =?utf-8?B?Qkk2ZmltRHVlbnFiYkh1TDZLWUdIZ0FOVGM5VUNZcndKOXk3OHR6ems1Szly?=
 =?utf-8?B?aGxCMDRNbnFuMTZLdUZ4eGNtc3cxanhrQWhueUc4MzJqSDJJOFBhRlBNdUxC?=
 =?utf-8?B?WkpnVVdXRzRlZlI1ZE95RDhMeGlmaUk3dStsSmtLWXhzNWxpU2tBdHF6QlIw?=
 =?utf-8?B?TlFGZXJ4LzlGMWpVY3ljQUMvTi9Uc3phL0ttd0h0c2VmUExVOGNJMngvSVNK?=
 =?utf-8?B?cmpaQjZieDd5WmFveHpZejdwTU5hTWVtMk9QN1ZmNXk4QUQvNFdqK0tlODVy?=
 =?utf-8?B?QzNiZHlKR0cvMDNYd0hFMFlPVjByZ3hycnFDNGtIalRPUFlzOHRVdklLb2xa?=
 =?utf-8?B?NUpvOStKVUxHc0RFWnN3M2ZqWGIwV0g5NnE4emI0R1dLU2NpLzdMYzcxeHJH?=
 =?utf-8?B?TUpxQVBaMGYxTCtIVkduYVVRNWF4a1p5d0NxT0ZRMlBQTXhtNjYvazZ0MVBO?=
 =?utf-8?B?amNXY3I5TGtBWXFrQ0tvT2tudG54dzUwSEN3ejgzbUt6aVRGNW95QmpiZ1hN?=
 =?utf-8?B?YmZJL0Q3Y2QrMDFEQnJ5SkxlQ3VKRXpqejVCdFhaL29odENxOUI0OERHcHBT?=
 =?utf-8?B?UHJobldqTCtXU21FV1JWenNWWDVnT1lZSTM4RWc0ZzZUVjdWR2FZRWFKR1Fa?=
 =?utf-8?B?R0xheWxsdlI1bUtCSnRHYjl4elNuMnZhVE5HMXEreGpWVXZxaDNNVGt0cFdV?=
 =?utf-8?B?MThTNmpIRzZOWXJBeXZjWkFtUjhSMVhOU1MzSzE2ZGlaRnlsYVo2LyszWU95?=
 =?utf-8?B?ZjJDeGptVmVwelNLcUVYQmU3a3hDWTBSSXpBRGZiemFsUmJoTWMzS3M0SXQ5?=
 =?utf-8?B?MmNwUkJQZ2Fwb2gyczQ2dnR2d1RmeWU0WTJnUU1qUlNqVXRqTTJFRnkxZHVR?=
 =?utf-8?B?ZEJ2SkppZDRyM1EybFRRYUtiTHNPSkRWR0R0anJHNnpjRnNhVHBESTRNQ3lq?=
 =?utf-8?B?NVQwVlR6bE9tdzl0YlVucWFGekFyTGRiZWdZTVlub1hLOHVKVlQ1U1BUVHd3?=
 =?utf-8?B?M1dLSU10UTExRW4vT2NPZnN6UENZREs2NVUxbVp1WExlWnVsTHdCaVZoYlVS?=
 =?utf-8?B?V2tiMG0zd1JJbVJxVUVNOWluN29sQXV2Y1hJTjlUWUpqb1dlSFVoZjRIcUdr?=
 =?utf-8?B?UEJNamR0K08zT0lwLzRCRVRPMmxVVEg4VHoycnpKT2JOYXE3UXFJQkFKMCtj?=
 =?utf-8?Q?w7rz4sDIn7rOtawFfccIy9bBO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1596be82-bf7e-4eee-86d4-08ddeb9654e3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 09:35:06.1642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hLy2lx7H/CSfFrm5s4N48ubOq17dE02VxKi/hQMMymfnXtbP34BeiBv4PphioxXscNN6sCpJi2N1MqQhpSPejg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5725
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, We previously thought that "triggering checkpoint
 for fsync after falloc -k" could solve this problem. But I found that the
 above method can be invalid in the following scenarios. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.53 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
X-Headers-End: 1uu6NE-0003VK-01
Subject: Re: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during
 the recovery process
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
From: Wang Xiaojun via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wang Xiaojun <wangxiaojun@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCldlIHByZXZpb3VzbHkgdGhvdWdodCB0aGF0ICJ0cmlnZ2VyaW5nIGNoZWNrcG9p
bnQgZm9yIGZzeW5jIGFmdGVyIGZhbGxvYyAKLWsiIGNvdWxkIHNvbHZlIHRoaXMgcHJvYmxlbS4K
CkJ1dCBJIGZvdW5kIHRoYXQgdGhlIGFib3ZlIG1ldGhvZCBjYW4gYmUgaW52YWxpZCBpbiB0aGUg
Zm9sbG93aW5nIHNjZW5hcmlvcy4KCmNhc2UgMToKd3JpdGUgZmlsZUEgMk0gfMKgIGZhbGxvYyAt
ayAyTSAxMDBNIHwgdHJ1bmNhdGUgMTBNCkF0IHRoaXMgcG9pbnQsIHRoZSBmaWxlIHNpemUgaXMg
MTBNQiwgd2hpbGUgdGhlIGRpc2sgc3BhY2UgY29uc3VtZWQgaXMgCjEwME1CLgoKY2FzZSAy77ya
CndyaXRlIGZpbGVBIDJNIHzCoCBmYWxsb2MgLWsgMk0gMTAwTSB8IHRydW5jYXRlIDFNCkF0IHRo
aXMgcG9pbnQsIHRoZSBmaWxlIHNpemUgaXMgMU1CLCB3aGlsZSB0aGUgZGlzayBzcGFjZSBjb25z
dW1lZCBpcyAxTUIuCgpFdmVuIGlmIHdlIHBlcmZvcm0gYSBjaGVja3BvaW50IGFmdGVyIGZhbGxv
YywKCmNhc2UgMToKd3JpdGUgZmlsZUEgMk0gfMKgIGZhbGxvYyAtayAyTSAxMDBNIHwgY2hlY2tw
b2ludCB8IHRydW5jYXRlIDEwTSB8IFNQTwoKY2FzZSAy77yaCndyaXRlIGZpbGVBIDJNIHzCoCBm
YWxsb2MgLWsgMk0gMTAwTSB8IGNoZWNrcG9pbnQgfCB0cnVuY2F0ZSAxTSB8IFNQTwoKQnV0IGR1
cmluZyB0aGUgcmVjb3ZlcnkgcHJvY2VzcywKCndlIGNhbm5vdCBkZXRlcm1pbmUgd2hldGhlciB0
aGUgMTAwTUIgc3BhY2UgcHJlLWFsbG9jYXRlZCBieSBmYWxsb2MgCm5lZWRzIHRvIGJlIHJldGFp
bmVkLgoKUGVyaGFwcyB3ZSBuZWVkIHRvIHJlc2VhcmNoIGEgbmV3IG1lY2hhbmlzbSB0byBzb2x2
ZSB0aGlzIHByb2JsZW0uCgoKVGhhbmtzLAoK5ZyoIDgvMjgvMjAyNSAxMjo0OSBQTSwg546L5pmT
54+6IOWGmemBkzoKPiDlnKggOC8yOC8yMDI1IDk6NDQgQU0sIENoYW8gWXUg5YaZ6YGTOgo+PiBP
biA4LzI2LzI1IDA5OjQ4LCDnjovmmZPnj7ogd3JvdGU6Cj4+PiDlnKggOC8yNS8yMDI1IDEwOjA4
IEFNLCBDaGFvIFl1IOWGmemBkzoKPj4+PiBPbiA4LzIwLzI1IDE1OjU0LCBXYW5nIFhpYW9qdW4g
d3JvdGU6Cj4+Pj4+IFRoaXMgcGF0Y2ggZml4ZXMgbWlzc2luZyBzcGFjZSByZWNsYW1hdGlvbiBk
dXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MuCj4+Pj4+Cj4+Pj4+IEluIHRoZSBmb2xsb3dpbmcg
c2NlbmFyaW9zLCBGMkZTIGNhbm5vdCByZWNsYWltIHRydW5jYXRlZCBzcGFjZS4KPj4+Pj4gY2Fz
ZSAxOgo+Pj4+PiB3cml0ZSBmaWxlIEEsIHNpemUgaXMgMUcgfCBDUCB8IHRydW5jYXRlIEEgdG8g
MU0gfCBmc3luYyBBIHwgU1BPCj4+Pj4+Cj4+Pj4+IGNhc2UgMjoKPj4+Pj4gQ1AgfCB3cml0ZSBm
aWxlIEEsIHNpemUgaXMgMUcgfCBmc3luYyBBIHwgdHJ1bmNhdGUgQSB0byAxTSB8IGZzeW5jIEEg
fFNQTwo+Pj4+Pgo+Pj4+PiBEdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MsIEYyRlMgd2lsbCBy
ZWNvdmVyIGZpbGUgQSwKPj4+Pj4gYnV0IHRoZSAxTS0xRyBzcGFjZSBjYW5ub3QgYmUgcmVjbGFp
bWVkLgo+Pj4+Pgo+Pj4+PiBCdXQgdGhlIGNvbWJpbmF0aW9uIG9mIHRydW5jYXRlIGFuZCBmYWxs
b2MgY29tcGxpY2F0ZXMgdGhlIHJlY292ZXJ5Cj4+Pj4+IHByb2Nlc3MuCj4+Pj4+IEZvciBleGFt
cGxlLCBpbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOgo+Pj4+PiB3cml0ZSBmaWxlQSAyTSB8IGZz
eW5jIHwgdHJ1bmNhdGUgMjU2SyB8IGZhbGxvYyAtayAyNTZLIDFNIHwgZnN5bmMgQSB8IFNQTwo+
Pj4+PiBUaGUgZmFsbG9jICgyNTZLLCAxTSkgbmVlZCB0byBiZSByZWNvdmVyZWQgYXMgcHJlLWFs
bG9jYXRlZCBzcGFjZS4KPj4+Pj4KPj4+Pj4gSG93ZXZlciBpbiB0aGUgZm9sbG93aW5nIHNjZW5h
cmlvcywgdGhlIHNpdHVhdGlvbiBpcyB0aGUgb3Bwb3NpdGUuCj4+Pj4+IHdyaXRlIGZpbGVBIDJN
IHwgZnN5bmMgfCBmYWxsb2MgLWsgMk0gMTBNIHwgZnN5bmMgQSB8IHRydW5jYXRlIDI1NksgfAo+
Pj4+PiBmc3luYyBBIHwgU1BPCj4+Pj4+IEluIHRoaXMgc2NlbmFyaW8sIHRoZSBzcGFjZSBhbGxv
Y2F0ZWQgYnkgZmFsbG9jIG5lZWRzIHRvIGJlIHRydW5jYXRlZC4KPj4+Pj4KPj4+Pj4gRHVyaW5n
IHRoZSByZWNvdmVyeSBwcm9jZXNzLCBpdCBpcyBkaWZmaWN1bHQgdG8gZGlzdGluZ3Vpc2gKPj4+
Pj4gYmV0d2VlbiB0aGUgYWJvdmUgdHdvIHR5cGVzIG9mIGZhbGxvYy4KPj4+Pj4KPj4+Pj4gU28g
aW4gdGhpcyBjYXNlIG9mIGZhbGxvYyAtayB3ZSBuZWVkIHRvIHRyaWdnZXIgYSBjaGVja3BvaW50
IGZvciBmc3luYy4KPj4+Pj4KPj4+Pj4gRml4ZXM6IGQ2MjRjOTZmYjMyNDkgKCJmMmZzOiBhZGQg
cmVjb3Zlcnkgcm91dGluZXMgZm9yIHJvbGwtZm9yd2FyZCIpCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFdhbmcgWGlhb2p1biA8d2FuZ3hpYW9qdW5Adml2by5jb20+Cj4+Pj4+IC0tLQo+Pj4+
PiB2NDogVHJpZ2dlciBjaGVja3BvaW50IGZvciBmc3luYyBhZnRlciBmYWxsb2MgLWsKPj4+Pj4g
djM6IEFkZCBhIEZpeGVzIGxpbmUuCj4+Pj4+IHYyOiBBcHBseSBDaGFvJ3Mgc3VnZ2VzdGlvbiBm
cm9tIHYxLiBObyBsb2dpY2FsIGNoYW5nZXMuCj4+Pj4+IHYxOiBGaXggbWlzc2luZyBzcGFjZSBy
ZWNsYW1hdGlvbiBkdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MuCj4+Pj4+IC0tLQo+Pj4+PiAg
ICAgZnMvZjJmcy9jaGVja3BvaW50LmMgfCAgMyArKysKPj4+Pj4gICAgIGZzL2YyZnMvZjJmcy5o
ICAgICAgIHwgIDMgKysrCj4+Pj4+ICAgICBmcy9mMmZzL2ZpbGUuYyAgICAgICB8ICA4ICsrKysr
Ky0tCj4+Pj4+ICAgICBmcy9mMmZzL3JlY292ZXJ5LmMgICB8IDE4ICsrKysrKysrKysrKysrKysr
LQo+Pj4+PiAgICAgNCBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jaGVja3BvaW50LmMgYi9mcy9m
MmZzL2NoZWNrcG9pbnQuYwo+Pj4+PiBpbmRleCBkYjM4MzFmN2YyZjUuLjc3NWUzMzMzMDk3ZSAx
MDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9jaGVja3BvaW50LmMKPj4+Pj4gKysrIGIvZnMvZjJm
cy9jaGVja3BvaW50LmMKPj4+Pj4gQEAgLTExNTEsNiArMTE1MSw5IEBAIHN0YXRpYyBpbnQgZjJm
c19zeW5jX2lub2RlX21ldGEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+PiAgICAgCQlp
ZiAoaW5vZGUpIHsKPj4+Pj4gICAgIAkJCXN5bmNfaW5vZGVfbWV0YWRhdGEoaW5vZGUsIDApOwo+
Pj4+PiAgICAgCj4+Pj4+ICsJCQlpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0ZBTExP
Q19LRUVQX1NJWkUpKQo+Pj4+PiArCQkJCWNsZWFyX2lub2RlX2ZsYWcoaW5vZGUsIEZJX0ZBTExP
Q19LRUVQX1NJWkUpOwo+Pj4+PiArCj4+Pj4+ICAgICAJCQkvKiBpdCdzIG9uIGV2aWN0aW9uICov
Cj4+Pj4+ICAgICAJCQlpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0RJUlRZX0lOT0RF
KSkKPj4+Pj4gICAgIAkJCQlmMmZzX3VwZGF0ZV9pbm9kZV9wYWdlKGlub2RlKTsKPj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gaW5kZXggNDZi
ZTc1NjA1NDhjLi5mNWE1NGJjODQ4ZDUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5o
Cj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+IEBAIC00NTksNiArNDU5LDcgQEAgc3Ry
dWN0IGZzeW5jX2lub2RlX2VudHJ5IHsKPj4+Pj4gICAgIAlzdHJ1Y3QgaW5vZGUgKmlub2RlOwkv
KiB2ZnMgaW5vZGUgcG9pbnRlciAqLwo+Pj4+PiAgICAgCWJsb2NrX3QgYmxrYWRkcjsJLyogYmxv
Y2sgYWRkcmVzcyBsb2NhdGluZyB0aGUgbGFzdCBmc3luYyAqLwo+Pj4+PiAgICAgCWJsb2NrX3Qg
bGFzdF9kZW50cnk7CS8qIGJsb2NrIGFkZHJlc3MgbG9jYXRpbmcgdGhlIGxhc3QgZGVudHJ5ICov
Cj4+Pj4+ICsJbG9mZl90IG1heF9pX3NpemU7CS8qIHByZXZpb3VzIG1heCBmaWxlIHNpemUgZm9y
IHRydW5jYXRlICovCj4+Pj4+ICAgICB9Owo+Pj4+PiAgICAgCj4+Pj4+ICAgICAjZGVmaW5lIG5h
dHNfaW5fY3Vyc3VtKGpubCkJCShsZTE2X3RvX2NwdSgoam5sKS0+bl9uYXRzKSkKPj4+Pj4gQEAg
LTgzNSw2ICs4MzYsNyBAQCBlbnVtIHsKPj4+Pj4gICAgIAlGSV9BVE9NSUNfUkVQTEFDRSwJLyog
aW5kaWNhdGUgYXRvbWljIHJlcGxhY2UgKi8KPj4+Pj4gICAgIAlGSV9PUEVORURfRklMRSwJCS8q
IGluZGljYXRlIGZpbGUgaGFzIGJlZW4gb3BlbmVkICovCj4+Pj4+ICAgICAJRklfRE9OQVRFX0ZJ
TklTSEVELAkvKiBpbmRpY2F0ZSBwYWdlIGRvbmF0aW9uIG9mIGZpbGUgaGFzIGJlZW4gZmluaXNo
ZWQgKi8KPj4+Pj4gKwlGSV9GQUxMT0NfS0VFUF9TSVpFLAkvKiBmaWxlIGFsbG9jYXRlIHJlc2Vy
dmVkIHNwYWNlIGFuZCBrZWVwIHNpemUgKi8KPj4+Pj4gICAgIAlGSV9NQVgsCQkJLyogbWF4IGZs
YWcsIG5ldmVyIGJlIHVzZWQgKi8KPj4+Pj4gICAgIH07Cj4+Pj4+ICAgICAKPj4+Pj4gQEAgLTEx
OTMsNiArMTE5NSw3IEBAIGVudW0gY3BfcmVhc29uX3R5cGUgewo+Pj4+PiAgICAgCUNQX1NQRUNf
TE9HX05VTSwKPj4+Pj4gICAgIAlDUF9SRUNPVkVSX0RJUiwKPj4+Pj4gICAgIAlDUF9YQVRUUl9E
SVIsCj4+Pj4+ICsJQ1BfRkFMTE9DX0ZJTEUsCj4+Pj4+ICAgICB9Owo+Pj4+PiAgICAgCj4+Pj4+
ICAgICBlbnVtIGlvc3RhdF90eXBlIHsKPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5j
IGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4gaW5kZXggNDJmYWFlZDZhMDJkLi5mMDgyMGY4MTc4MjQg
MTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmls
ZS5jCj4+Pj4+IEBAIC0yMzYsNiArMjM2LDggQEAgc3RhdGljIGlubGluZSBlbnVtIGNwX3JlYXNv
bl90eXBlIG5lZWRfZG9fY2hlY2twb2ludChzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+PiAgICAg
CWVsc2UgaWYgKGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhKHNiaSwgRjJGU19JKGlub2RlKS0+aV9w
aW5vLAo+Pj4+PiAgICAgCQkJCQkJCVhBVFRSX0RJUl9JTk8pKQo+Pj4+PiAgICAgCQljcF9yZWFz
b24gPSBDUF9YQVRUUl9ESVI7Cj4+Pj4+ICsJZWxzZSBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5v
ZGUsIEZJX0ZBTExPQ19LRUVQX1NJWkUpKQo+Pj4+PiArCQljcF9yZWFzb24gPSBDUF9GQUxMT0Nf
RklMRTsKPj4+Pj4gICAgIAo+Pj4+PiAgICAgCXJldHVybiBjcF9yZWFzb247Cj4+Pj4+ICAgICB9
Cj4+Pj4+IEBAIC0xOTUzLDEwICsxOTU1LDEyIEBAIHN0YXRpYyBpbnQgZjJmc19leHBhbmRfaW5v
ZGVfZGF0YShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LAo+Pj4+PiAgICAgCX0K
Pj4+Pj4gICAgIAo+Pj4+PiAgICAgCWlmIChuZXdfc2l6ZSA+IGlfc2l6ZV9yZWFkKGlub2RlKSkg
ewo+Pj4+PiAtCQlpZiAobW9kZSAmIEZBTExPQ19GTF9LRUVQX1NJWkUpCj4+Pj4+ICsJCWlmICht
b2RlICYgRkFMTE9DX0ZMX0tFRVBfU0laRSkgewo+Pj4+PiArCQkJc2V0X2lub2RlX2ZsYWcoaW5v
ZGUsIEZJX0ZBTExPQ19LRUVQX1NJWkUpOwo+Pj4+IFhpYW9qdW4sCj4+Pj4KPj4+PiBXZWxsLCB3
aGF0IGFib3V0IHRoaXMgY2FzZT8KPj4+Pgo+Pj4+IGZhbGxvYyAtayBvZnMgc2l6ZSBmaWxlCj4+
Pj4gZmx1c2ggYWxsIGRhdGEgYW5kIG1ldGFkYXRhIG9mIGZpbGUKPj4+IEhpIENoYW8sCj4+PiBG
bHVzaCBhbGwgZGF0YSBhbmQgbWV0YWRhdGEgb2YgZmlsZSwgYnV0IHdpdGhvdXQgdXNpbmcgZnN5
bmMgb3IgQ1A/Cj4+IFhpYW9qdW4sCj4+Cj4+IEkgdGhpbmsgc28sIG9yIGFtIEkgbWlzc2luZyBz
b21ldGluZz8KPj4KPj4gVGhhbmtzLAo+IEhpIENoYW8sCj4gSSB0aGluayB0aGlzIGNhc2UgaXMg
cG9zc2libGUuIFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgb3V0IHRoaXMgaXNzdWUuCj4gSSB3aWxs
IGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gVGhhbmtzLAo+Cj4+PiBUaGFua3MsCj4+
Pgo+Pj4+IGV2aWN0IGlub2RlCj4+Pj4gd3JpdGUgZmlsZSAmIGZzeW5jIGZpbGUgd29uJ3QgdHJp
Z2dlciBhIGNoZWNrcG9pbnQ/Cj4+Pj4KPj4+PiBPciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwo+
Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+ICAgICAJCQlmaWxlX3NldF9rZWVwX2lzaXplKGlu
b2RlKTsKPj4+Pj4gLQkJZWxzZQo+Pj4+PiArCQl9IGVsc2Ugewo+Pj4+PiAgICAgCQkJZjJmc19p
X3NpemVfd3JpdGUoaW5vZGUsIG5ld19zaXplKTsKPj4+Pj4gKwkJfQo+Pj4+PiAgICAgCX0KPj4+
Pj4gICAgIAo+Pj4+PiAgICAgCXJldHVybiBlcnI7Cj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L3JlY292ZXJ5LmMgYi9mcy9mMmZzL3JlY292ZXJ5LmMKPj4+Pj4gaW5kZXggNGNiM2E5MTgwMWI0
Li42OGI2MmM4YTc0ZDMgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvcmVjb3ZlcnkuYwo+Pj4+
PiArKysgYi9mcy9mMmZzL3JlY292ZXJ5LmMKPj4+Pj4gQEAgLTk1LDYgKzk1LDcgQEAgc3RhdGlj
IHN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSAqYWRkX2ZzeW5jX2lub2RlKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPj4+Pj4gICAgIAllbnRyeSA9IGYyZnNfa21lbV9jYWNoZV9hbGxvYyhmc3lu
Y19lbnRyeV9zbGFiLAo+Pj4+PiAgICAgCQkJCQlHRlBfRjJGU19aRVJPLCB0cnVlLCBOVUxMKTsK
Pj4+Pj4gICAgIAllbnRyeS0+aW5vZGUgPSBpbm9kZTsKPj4+Pj4gKwllbnRyeS0+bWF4X2lfc2l6
ZSA9IGlfc2l6ZV9yZWFkKGlub2RlKTsKPj4+Pj4gICAgIAlsaXN0X2FkZF90YWlsKCZlbnRyeS0+
bGlzdCwgaGVhZCk7Cj4+Pj4+ICAgICAKPj4+Pj4gICAgIAlyZXR1cm4gZW50cnk7Cj4+Pj4+IEBA
IC03OTYsNiArNzk3LDcgQEAgc3RhdGljIGludCByZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9saXN0LAo+Pj4+PiAgICAgCXdoaWxl
ICgxKSB7Cj4+Pj4+ICAgICAJCXN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSAqZW50cnk7Cj4+Pj4+
ICAgICAJCXN0cnVjdCBmb2xpbyAqZm9saW87Cj4+Pj4+ICsJCWxvZmZfdCBpX3NpemU7Cj4+Pj4+
ICAgICAKPj4+Pj4gICAgIAkJaWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoc2JpLCBibGthZGRy
LCBNRVRBX1BPUikpCj4+Pj4+ICAgICAJCQlicmVhazsKPj4+Pj4gQEAgLTgyOCw2ICs4MzAsOSBA
QCBzdGF0aWMgaW50IHJlY292ZXJfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVj
dCBsaXN0X2hlYWQgKmlub2RlX2xpc3QsCj4+Pj4+ICAgICAJCQkJYnJlYWs7Cj4+Pj4+ICAgICAJ
CQl9Cj4+Pj4+ICAgICAJCQlyZWNvdmVyZWRfaW5vZGUrKzsKPj4+Pj4gKwkJCWlfc2l6ZSA9IGlf
c2l6ZV9yZWFkKGVudHJ5LT5pbm9kZSk7Cj4+Pj4+ICsJCQlpZiAoZW50cnktPm1heF9pX3NpemUg
PCBpX3NpemUpCj4+Pj4+ICsJCQkJZW50cnktPm1heF9pX3NpemUgPSBpX3NpemU7Cj4+Pj4+ICAg
ICAJCX0KPj4+Pj4gICAgIAkJaWYgKGVudHJ5LT5sYXN0X2RlbnRyeSA9PSBibGthZGRyKSB7Cj4+
Pj4+ICAgICAJCQllcnIgPSByZWNvdmVyX2RlbnRyeShlbnRyeS0+aW5vZGUsIGZvbGlvLCBkaXJf
bGlzdCk7Cj4+Pj4+IEBAIC04NDQsOCArODQ5LDE5IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRh
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwK
Pj4+Pj4gICAgIAkJfQo+Pj4+PiAgICAgCQlyZWNvdmVyZWRfZG5vZGUrKzsKPj4+Pj4gICAgIAo+
Pj4+PiAtCQlpZiAoZW50cnktPmJsa2FkZHIgPT0gYmxrYWRkcikKPj4+Pj4gKwkJaWYgKGVudHJ5
LT5ibGthZGRyID09IGJsa2FkZHIpIHsKPj4+Pj4gKwkJCWlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVu
dHJ5LT5pbm9kZSk7Cj4+Pj4+ICsJCQlpZiAoZW50cnktPm1heF9pX3NpemUgPiBpX3NpemUpIHsK
Pj4+Pj4gKwkJCQllcnIgPSBmMmZzX3RydW5jYXRlX2Jsb2NrcyhlbnRyeS0+aW5vZGUsCj4+Pj4+
ICsJCQkJCQkJaV9zaXplLCBmYWxzZSk7Cj4+Pj4+ICsJCQkJaWYgKGVycikgewo+Pj4+PiArCQkJ
CQlmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7Cj4+Pj4+ICsJCQkJCWJyZWFrOwo+Pj4+PiAr
CQkJCX0KPj4+Pj4gKwkJCQlmMmZzX21hcmtfaW5vZGVfZGlydHlfc3luYyhlbnRyeS0+aW5vZGUs
IHRydWUpOwo+Pj4+PiArCQkJfQo+Pj4+PiAgICAgCQkJbGlzdF9tb3ZlX3RhaWwoJmVudHJ5LT5s
aXN0LCB0bXBfaW5vZGVfbGlzdCk7Cj4+Pj4+ICsJCX0KPj4+Pj4gICAgIG5leHQ6Cj4+Pj4+ICAg
ICAJCXJhX2Jsb2NrcyA9IGFkanVzdF9wb3JfcmFfYmxvY2tzKHNiaSwgcmFfYmxvY2tzLCBibGth
ZGRyLAo+Pj4+PiAgICAgCQkJCQluZXh0X2Jsa2FkZHJfb2Zfbm9kZShmb2xpbykpOwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
