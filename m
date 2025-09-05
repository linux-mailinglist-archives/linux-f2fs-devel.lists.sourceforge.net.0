Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A526B4530F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Sep 2025 11:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OMt8h3fHz57SGSK6dfw0QVMahtRinWjI8aKHBy5WxE=; b=eazS911qb4AkjJf9Cx38kyDQIr
	k2rmy4tj4hAxqdTRlnBMIJiWfT2qgnpEh1o16EzOXtIiV/hpOc9WP+kFI3/WI8hTqwiQAWK0Dv0Hv
	TubsabThXrdvGf+BjgGQvj69RS6eUqRADhH+WrBx9uJc44+1p2Q4jjuvSTeCwDEe8EQw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uuSem-00050U-1Y;
	Fri, 05 Sep 2025 09:22:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1uuSek-00050M-J4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Sep 2025 09:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bh4QkEJibOuT8AQiFuwzxdqeo9Ab6hQ/cuH2YpKdbPs=; b=H141NwffglvInNS7hY3LnHpUgD
 F4Pb2gKpy+7UX3FDAfxHHIrzDkmRey3xMTxlzkzCdLrihtyKzYgLh0zh6UTlPHY0jqdvW8v8Mf4NR
 BxB4/YchIZciw1Cd1IzZbkTkGnWVFOULVnd5qT1/CCLjPvHncX83znzlNn85tD979BmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bh4QkEJibOuT8AQiFuwzxdqeo9Ab6hQ/cuH2YpKdbPs=; b=KQHJoIaRkEK+VnhRmbjpucqI3m
 KUpEXOQdLjWYE6gYau1U48TqTjZOSU1eTUxK6ZSAFXIXRsUykbkSxBK4prDLOTKxfSlwx9VC3qmWp
 umpGnPkxs2xGDAkjGgI4tTSzRQBa0V7/p7cftlxp64lgXig6RJvMJ3LNVZKRVeT8NYKU=;
Received: from mail-koreacentralazon11013067.outbound.protection.outlook.com
 ([40.107.44.67] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uuSej-0000Zv-MS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Sep 2025 09:22:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUSrzNkZ5m5UhAY98lO5bls242e2ynp/LCaLS2MdFfYjCE0blZuVEixRaU3OfrsiOxnTH0u+mvZhMuRqInkBA4q6oLOrM30NJDdblFAIaGslUDYMxy/6/eok+Xm5CZ+n0Vi81NtN4VeUZVJKhCJSNW3WmwbSDLjDfQJdH5Vjd+mSq9V46GkGiwTrU2vHQxStqfgmXZl/ub7oddzqWoMC1mSmipoEd9gGZKgjAK1D85GjeByw+JQV5DfDo6KRYTPGk8sp6zBNRGqQmTaNKDma/11xAO2W5KBw+ZLEO7MkFKG2lN1kW3ez+8/IYUCpV2ei5UR6zfVvKjey8qH/ezo+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh4QkEJibOuT8AQiFuwzxdqeo9Ab6hQ/cuH2YpKdbPs=;
 b=mRF5OWgZ0CZRvP5byqJykaUe86pq5z3SjczgskDXk76x6lUlM+/B63Hpw6qf7GJ5XsA8b9h873HOYDcB7a6+nXlD5/BB1npSmOQPttLEQKOYyqtLKLbqU9CCpqsrZ1NJxM3n9U8rd0170SAm4sTCf+pOLKQv1iVc1UsEBUBFIkyxIjSMMT+XQMXvrT+mZI1lOY3mA67WZxrtSYCZtu5dTH+hcHxncQt3l4TQ9WSDuJxQnsOaCjGODDbFZlS3o7pfICnKYarvS6UhLitqcvcqGD2+LNvhJRL0UFi9/iGbiulyWvbAf3hJxu9aeciSUdj7tWrwZFkUBZDtuYkch/APrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh4QkEJibOuT8AQiFuwzxdqeo9Ab6hQ/cuH2YpKdbPs=;
 b=ohYbXc1NFU5tO+pa9hK5nbzjJj9i+F3TqGsoZwUrYHUFsW9XVUWM2QI82L61ETAmPA1AOtAQ2VnSavtwBCSMrd689Uk1X1cCN6VYNjU3fq+PVEBhwZw9XcNcTIpjeXKiUKBywdvOjzG8i8CgDZFyn3xFzo1ZNpbOuTy6zLiq9DMAWUKbeV3gLPwcUwVuyJPF4d3vH4js+ScMUMnGaPRvb1ZE60wlpcZ/D/Madxxy6G6inP3P0vT0pxhMx8ez8XHsZoXez5tD/8ormU56l09p9cxFhz1uccafcLwkrQC7h9KFbf7kfgn0g4gFtGyDVoYoSoGxTtal9uqZ8hWECI0tWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by TYZPR06MB6022.apcprd06.prod.outlook.com (2603:1096:400:340::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 09:22:39 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 09:22:39 +0000
Message-ID: <9fce8e27-7a2c-48f7-b588-58492f767eb3@vivo.com>
Date: Fri, 5 Sep 2025 17:22:36 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20250820075444.378907-1-wangxiaojun@vivo.com>
 <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
 <234d4f23-5ce4-426e-9b3c-5f2b28d86a3f@vivo.com>
 <066cd125-7db8-4b97-b6e3-20e10023a14f@kernel.org>
 <b38f1597-c32e-4651-b5aa-596ed4e61ef7@vivo.com>
 <cf992923-d6c3-4ee5-8cc9-44b4e11c2526@vivo.com>
 <87c42690-be6d-4691-a348-3fcde2def3e1@kernel.org>
In-Reply-To: <87c42690-be6d-4691-a348-3fcde2def3e1@kernel.org>
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To KL1PR06MB6845.apcprd06.prod.outlook.com
 (2603:1096:820:10d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6845:EE_|TYZPR06MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: e398f230-ee06-46ff-1c7d-08ddec5dc226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXJsZ3Fpdno2MGF2UWlYbGxkRlp2L21TVEwrQTlyWERPS1JHTlVtZ1k1R1Nv?=
 =?utf-8?B?VkNuL0VZWDFuMnhGWFVKMVB5bnRFNHkzd1lXZzlvL3htaG5DS0JsSzVEa2NP?=
 =?utf-8?B?STBJMXM2ZkNZaEVGQU9FVXVCNkY5UXhUNW1oZlRXakY2dWtNWkNxMVV6RHpM?=
 =?utf-8?B?ZW1rdFI2UWljRndteDhaMW5YZ2k5M3laNHRMclEwZ2VwMWRsTCt6eS9JZ2Rr?=
 =?utf-8?B?VHRjQU5rLytqRXlta1ZGdHFkTWlkMTJDUTB6aExmK05zRGNhMTJ4czJrdUNa?=
 =?utf-8?B?T21lYXlRVnBzU2ZJQVU5SmVRQnUwWHVDdEIvSjV0d1BrVXFoaEU1WHpwK012?=
 =?utf-8?B?UEJiMWR0TlNkUTVCb3ZDYTU2ZEM1U2Fyek02TEdRTmRMNWx4M2ZmaXFwdVA0?=
 =?utf-8?B?RExKL0ZzdEozeTFUVlFkNGlVZTBWRXpzdUJ1MEhJTlR2VVpxTzVWY3Zpcll0?=
 =?utf-8?B?bk0za3RZZGVtaTFlT2RlNFpQODJSQURqWVpNR3dpQzd4ZmpsdjVMdXNPK0Zo?=
 =?utf-8?B?dGM1SWRQYVA4NCt3cVdnOURiU3BJaGN2Q3VlbFBibEhmRnVOSzUrMHlBVFBE?=
 =?utf-8?B?YjNVUklEYnp6RFd5ZkNieXBOaUV1Zmh2UnV2SnJKS3kyZVJHd1B1Y1FTTVcr?=
 =?utf-8?B?T3dzZm1QVkgxOVNKTlJoSWwwTjNKNVVTeU5PMXZDRXlOYklraHJhcHVRNHpB?=
 =?utf-8?B?Vmx4bmJnSHd4M2pKT1hJYkY4NFNrRG5TbzJSY2Nac1Mzc2lmVHI5akR5TTZJ?=
 =?utf-8?B?djJ1MGh1NzJEbnAvYkpkQVVKeXVlQ09FeVhZcjN3UDlTaWRJRG55R1h5UE13?=
 =?utf-8?B?UTE5S1Iwb0RtV0pSQzFIN2Q3bENmZC8yK0l1VXBVQUZMaW9UNU5icHJQWEdM?=
 =?utf-8?B?aHNTQzhEYmlCZGRPU2Z5OGZxOEYwaU9SdXcrU3U2NERMaVhQcE53Zld4ZUcy?=
 =?utf-8?B?WVorWUVIMTd0RGtlUDJ4Q05hMVlKNjFQNmVsV2NzSExkT2NRL2U2bHNDRVhU?=
 =?utf-8?B?RmZsRXVtd3BHekJoY09wMWVmajQ4dmdzVnVLVUVUTVpXNVhNcEU1bkdEWGxr?=
 =?utf-8?B?NUE0dHNoeU9neFJiWjUvN0owemNMM0o2V042TzV2N2llZ2U4K1ZCV1JyZGtW?=
 =?utf-8?B?RWJlZEVES2JWTEo4TmtPb2hiL2xsQXF4UTZOVGVFV3NUOTYvb0hHS21abllH?=
 =?utf-8?B?c2NwUFV6SFdTWnA1VGROYVZEcEFibDRVejFYS0kwakNVbzlQcDZnQ2F4R0RQ?=
 =?utf-8?B?ZmhlRXU1YWxsODRRekVTVGVFNFJyU3hWVC9rMHFmeTROK1FiMXhRaVpPN3ov?=
 =?utf-8?B?dWhtam5pd1Q0YmVuUllkazdzMm9kdml0NDFrVm9NcS9ETmdwVHFBM3l1N05n?=
 =?utf-8?B?ZXBOUXI4RURCUVQ4T0pBRWcyd0FkR3lvdWJxYVRjWXFNdzVnZGJqbTVxU0xh?=
 =?utf-8?B?K0k0anlJWjdMTWJxUzgwZDBueHJCMWZwYWwvL0VvMnZ5WDZ6dS9YZFFjRWVl?=
 =?utf-8?B?NzlVT1l5TDg3TndNZXdDVlhhYjhoT3RMNFhPbld4YW53d2d2N3R6TmRlQVVt?=
 =?utf-8?B?c25VRjE1T1Z2UXloeGRlb3FpRzV6MHBsd0xqR1VhenVYUnRFdXc2aEh3dDgv?=
 =?utf-8?B?ZVkzVFNsMnJiV1k5VGlyZWhiMXJKb2xjTDliM1pxRjJqUzVKRjMwNWhiK25Z?=
 =?utf-8?B?V3JZRXU2SmM5Q2h5bGVQaUxxOFZqMksxdFRuazZpaEZueGFxY3c2S0RyWndO?=
 =?utf-8?B?bERneWd6enpKaG1BcEpXTkU0Ylk3OVk0QVFjUC90N3JrUmRWR0FMS2FXVlFq?=
 =?utf-8?B?Skkxanl6S1p6Wks4M1k4Zzc0SkNNK0FLcHpBbDNTK28xcjFmSG95Z0pHOE5D?=
 =?utf-8?B?dzIzTk82UTNyUllYZVVaU3ZZR0EreEhHVW9jS3FXZWtFZ1pld01xc3FPNStp?=
 =?utf-8?B?MDd1cWRJQjVlbTh5ODREYlZ1UWJxcHpaTkRCUm9IUnQyK2p0SWZtQjdYZ3Nv?=
 =?utf-8?B?S1pQNXlrMjFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUptK1lQUExsRVlkYWc2Tm01SHE4UTRYTVVuVTRrOXQwSURPUFQ2OWdrR0No?=
 =?utf-8?B?WVFzcmNGM2xTQzk0UnpoUW1kRjdERnNVYmQxTUk3SWp0YXQ0c0hLRWcyOFhI?=
 =?utf-8?B?Vmdlb0FzNmtTM2xueG9lRjAyaDJxZnFQMFZwSWNqajUyZVNia0pEaGswcmFm?=
 =?utf-8?B?UjRZeWFROGJGWURReXB2K3B3VlRKUHVHVWlUamk2U004ZmNpQkJMTnB1VEQy?=
 =?utf-8?B?eFYveU5LVk1vZFR4N3dSVE9RNG5pZWU3SzRyRWFab3orYmUycytQemVpUDcv?=
 =?utf-8?B?YWcrN2JBVGRLanNkMjBORkN2VENhU0pKdEY5S3RTQ2NMK3B2akhycGI2NFNv?=
 =?utf-8?B?MkZQZ2RrMHhQaU5ram9FWmtRL3RLY24rUkk2V1JQM1BHK2VLYldLMFRqZUFF?=
 =?utf-8?B?SkZRY3BYdHl2emllcHlZcnFkVEpDTTVJclhZSE4xMWU5ek9kT0ZVMFF6WXM5?=
 =?utf-8?B?V1pIeEhvVVZJN1o5Ky9BWmk1OHdHbWk4Wlpzd3N5cFk4dlZDTDl5Z24yTmdG?=
 =?utf-8?B?Vm5CTUJJMzJUTzMrY0xnV3NTYzJoYWc3QzRaMTJQdjQwK004b3J0Z0JsOUEz?=
 =?utf-8?B?eGdwS3NiS09MTDZySGdTUHcreTFPNEExUjBCQXlpK3Z3L2pkNzVicWppV0U0?=
 =?utf-8?B?akdwZ2YyZUhxWGI1ZGpqSHJrYjBEL0hrSjh1VGdOeEpnRm9aTVY5SWlSWURE?=
 =?utf-8?B?Q0IwRHJRU1hkdy9kRFlpSWJUaVNzLzZkNFpEc0t2amtMaXJSdGpqSFRFSE5m?=
 =?utf-8?B?TkcyaXA4dG9ZTzFwblpBcHVpM0h5N1V1aENnbVFZS0lOT0tDeWVKTVRjdWFi?=
 =?utf-8?B?a2RNck5TV0g3djJkd2J5Q050cDFXbUVHbDVhdkR3dEhGZFdUemFScjQwdGdZ?=
 =?utf-8?B?YkRrY0pYcUthM0Fod0dOeTQzU3NZcnhJWVpvbmt2VDNaMGNqQzZ5b1FmNzBS?=
 =?utf-8?B?akl4VXJ1Z3RkZ1JrQXJmdGpjK0ZOd21oV0JTS3BrVXBNYUY0NG5QRmEzd3Y4?=
 =?utf-8?B?OEJnWWFuSnR3N1g4anEyOWVybzV2cDhzMlBzOEhXbXdGdC8xV3pPc0p4M3lr?=
 =?utf-8?B?eGtUWWswNjNmY2hIK1h0MVBXTnB4SXRXejE5aFNFZzhvK2x4M1NmeEw4ZkV5?=
 =?utf-8?B?aFhxRlZlSkI4NDlGdnZSTjdDN2JzTWErNmxqT0VxMlFOVkZ6WStTTFprelY5?=
 =?utf-8?B?Ty9NUDRaTW1tM1ZVa3djRDd0TVRqMzB0NkJLbmMrWXJKZjcxQ0pOaDJ5VTlS?=
 =?utf-8?B?NkFHdDlzWVBta24zZzBJaDcrS2lzeEIrWktJM0NwYnZnVWJOdVU3TEdCK2Fq?=
 =?utf-8?B?NmYyblA3aXdkRUU1K01xbmxqdjQySlJsWUtsR3dqYmtFQTFFV3pZOFpoU2I3?=
 =?utf-8?B?UCtVVmZudXdablBQV2VvUFgwSFowMWYzM0tkMUtGT2dTaUN5anFXK1F1L1Fr?=
 =?utf-8?B?U1F6am00b0VnaTErTXBCZGdabmpIMno5ZDIrTkdCREk3THYyelJwT0pwRmFZ?=
 =?utf-8?B?RW51Ni9GVXdSenlRZTZaU0tyamQwaWI5SUtMZFlnMHpEbVk2ZmhoVmRtQ3Yw?=
 =?utf-8?B?clhjQjhzTEJFaVFVMHplYW12aHM0dXV6bkxhazA4Q3ByN0cxUWVKWm1vcDEv?=
 =?utf-8?B?RkhoVHhzbEltS2lPU1Z5Y3p3YzRQd3ZaNUhaNVV4NUkyMENxWmhlWS85OWtM?=
 =?utf-8?B?T1B1RC9yNnpGY3BFV1RadzRNTG1Db2xOTVRGZjF4TjBoelF0d21zN25FZDEx?=
 =?utf-8?B?RjNub2dIVjRBNW84WW9uRmhGdEw5MHVjQjJzUnhZVmVkVWppVVBEVVk3RG00?=
 =?utf-8?B?M1k1RmNJQk1PTktDMGNHU28vdG93a3JObTc3VFgxVlpwUXdkM01PdzBKK0xY?=
 =?utf-8?B?TmMwL0RmUFp3UldkVktQYStPMmtKZkNPdXY3b1grZHBVTHd5TWNvTSttTHpu?=
 =?utf-8?B?dVpvUFZaY2xQRVl1SEYvd01lL0p3Qmw5Q2VWQ2N4V3ZiOWVzQ3hWZUhIUWxp?=
 =?utf-8?B?Y0szMkpwSm0yS2UrdkR1RkdLblpWTEg0OGRPdjZFRUZ0QTFROURGdk1tbkRH?=
 =?utf-8?B?T3NEbVZTMm5BOG5IWmtnMXF5bHV4T2ZEdDVPZVB1cmMxUUkzemdRc2NOY0cx?=
 =?utf-8?Q?g0IeW07dR8BKY6Wedurern9he?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e398f230-ee06-46ff-1c7d-08ddec5dc226
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:22:39.1449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnHV670M1M63NZrHZ59BqknBfV2IHvwFTYLY1iBRqXDy2t+MGB/fWMIRrtg/W88EGDVyJhl+i1hVV8zp4bs0hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6022
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 9/5/2025 4:07 PM, Chao Yu 写道: > On 9/4/2025 5:35
   PM, Wang Xiaojun wrote: >> Hi Chao, >> >> We previously thought that "triggering
    checkpoint for fsync after falloc >> -k" could solve this pro [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 ARC_SIGNED             Message has a ARC signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.67 listed in wl.mailspike.net]
X-Headers-End: 1uuSej-0000Zv-MS
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

CuWcqCA5LzUvMjAyNSA0OjA3IFBNLCBDaGFvIFl1IOWGmemBkzoKPiBPbiA5LzQvMjAyNSA1OjM1
IFBNLCBXYW5nIFhpYW9qdW4gd3JvdGU6Cj4+IEhpIENoYW8sCj4+Cj4+IFdlIHByZXZpb3VzbHkg
dGhvdWdodCB0aGF0ICJ0cmlnZ2VyaW5nIGNoZWNrcG9pbnQgZm9yIGZzeW5jIGFmdGVyIGZhbGxv
Ywo+PiAtayIgY291bGQgc29sdmUgdGhpcyBwcm9ibGVtLgo+Pgo+PiBCdXQgSSBmb3VuZCB0aGF0
IHRoZSBhYm92ZSBtZXRob2QgY2FuIGJlIGludmFsaWQgaW4gdGhlIGZvbGxvd2luZyAKPj4gc2Nl
bmFyaW9zLgo+Pgo+PiBjYXNlIDE6Cj4+IHdyaXRlIGZpbGVBIDJNIHzCoCBmYWxsb2MgLWsgMk0g
MTAwTSB8IHRydW5jYXRlIDEwTQo+PiBBdCB0aGlzIHBvaW50LCB0aGUgZmlsZSBzaXplIGlzIDEw
TUIsIHdoaWxlIHRoZSBkaXNrIHNwYWNlIGNvbnN1bWVkIGlzCj4+IDEwME1CLgo+Pgo+PiBjYXNl
IDLvvJoKPj4gd3JpdGUgZmlsZUEgMk0gfMKgIGZhbGxvYyAtayAyTSAxMDBNIHwgdHJ1bmNhdGUg
MU0KPj4gQXQgdGhpcyBwb2ludCwgdGhlIGZpbGUgc2l6ZSBpcyAxTUIsIHdoaWxlIHRoZSBkaXNr
IHNwYWNlIGNvbnN1bWVkIGlzIAo+PiAxTUIuCj4+Cj4+IEV2ZW4gaWYgd2UgcGVyZm9ybSBhIGNo
ZWNrcG9pbnQgYWZ0ZXIgZmFsbG9jLAo+Pgo+PiBjYXNlIDE6Cj4+IHdyaXRlIGZpbGVBIDJNIHzC
oCBmYWxsb2MgLWsgMk0gMTAwTSB8IGNoZWNrcG9pbnQgfCB0cnVuY2F0ZSAxME0gfCBTUE8KPj4K
Pj4gY2FzZSAy77yaCj4+IHdyaXRlIGZpbGVBIDJNIHzCoCBmYWxsb2MgLWsgMk0gMTAwTSB8IGNo
ZWNrcG9pbnQgfCB0cnVuY2F0ZSAxTSB8IFNQTwo+Pgo+PiBCdXQgZHVyaW5nIHRoZSByZWNvdmVy
eSBwcm9jZXNzLAo+Pgo+PiB3ZSBjYW5ub3QgZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIDEwME1CIHNw
YWNlIHByZS1hbGxvY2F0ZWQgYnkgZmFsbG9jCj4+IG5lZWRzIHRvIGJlIHJldGFpbmVkLgo+Cj4g
WGlhb2p1biwgdGhhbmtzIGZvciBtZW50aW9uaW5nIHRoaXMgaXNzdWUuCj4KPiBTbyB3ZSBuZWVk
IGFuIG9uLWRpc2sgZmxhZyB0byBpbmRpY2F0ZSB3aGV0aGVyIHRoZXJlIGlzIGZhbGxvY2F0ZWQg
Cj4gYmxrYWRkcnMKPiBhZnRlciBpX3NpemUsIHJpZ2h0Pwo+Cj4gRm9yIGFib3ZlIGNhc2U6Cj4g
ZmFsbG9jIC1rIDJNIDEwME0gLT4gc2V0IHRoZSBmbGFnCj4gY2hlY2twb2ludAo+IHRydW5jYXRl
IDFNIC0+IGNsZWFyIHRoZSBmbGFnCj4gcmVjb3Zlcnk6IHRydW5jYXRlIGJsa2FkZHJzIGFmdGVy
IGlfc2l6ZSBhcyB0aGUgZmxhZyBpcyBub3Qgc2V0Pwo+Cj4gVGhvdWdodHM/Cj4KPiBUaGFua3Ms
CgpIaSBDaGFvLAoKSSBhZ3JlZSB3aXRoIHlvdXIgaWRlYS4KCkkgdGhpbmsgdGhlIGNvcmUgb2Yg
dGhpcyBpc3N1ZSBpcyB0aGF0IHRoZSB0cnVuY2F0ZSBpbmZvcm1hdGlvbiBpcyBsb3N0IApkdXJp
bmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MuCgpDdXJyZW50bHksIG9ubHkgdGhlIGZpbGVfc2l6ZSBp
bmZvcm1hdGlvbiBpcyBhdmFpbGFibGUsIGJ1dCB0aGUgCmZpbGVfc2l6ZSBjYW5ub3QgcmVmbGVj
dCB0aGUgZmFsbG9jYXRlZCBzaXplLgoKVGhlcmVmb3JlLCBJIHRoaW5rIHRoZSBzb2x1dGlvbiB5
b3UgcHJvdmlkZWQgY2FuIHdvcmsuCgpUaGFua3MsCgo+Cj4+Cj4+IFBlcmhhcHMgd2UgbmVlZCB0
byByZXNlYXJjaCBhIG5ldyBtZWNoYW5pc20gdG8gc29sdmUgdGhpcyBwcm9ibGVtLgo+Pgo+Pgo+
PiBUaGFua3MsCj4+Cj4+IOWcqCA4LzI4LzIwMjUgMTI6NDkgUE0sIOeOi+aZk+ePuiDlhpnpgZM6
Cj4+PiDlnKggOC8yOC8yMDI1IDk6NDQgQU0sIENoYW8gWXUg5YaZ6YGTOgo+Pj4+IE9uIDgvMjYv
MjUgMDk6NDgsIOeOi+aZk+ePuiB3cm90ZToKPj4+Pj4g5ZyoIDgvMjUvMjAyNSAxMDowOCBBTSwg
Q2hhbyBZdSDlhpnpgZM6Cj4+Pj4+PiBPbiA4LzIwLzI1IDE1OjU0LCBXYW5nIFhpYW9qdW4gd3Jv
dGU6Cj4+Pj4+Pj4gVGhpcyBwYXRjaCBmaXhlcyBtaXNzaW5nIHNwYWNlIHJlY2xhbWF0aW9uIGR1
cmluZyB0aGUgcmVjb3ZlcnkgCj4+Pj4+Pj4gcHJvY2Vzcy4KPj4+Pj4+Pgo+Pj4+Pj4+IEluIHRo
ZSBmb2xsb3dpbmcgc2NlbmFyaW9zLCBGMkZTIGNhbm5vdCByZWNsYWltIHRydW5jYXRlZCBzcGFj
ZS4KPj4+Pj4+PiBjYXNlIDE6Cj4+Pj4+Pj4gd3JpdGUgZmlsZSBBLCBzaXplIGlzIDFHIHwgQ1Ag
fCB0cnVuY2F0ZSBBIHRvIDFNIHwgZnN5bmMgQSB8IFNQTwo+Pj4+Pj4+Cj4+Pj4+Pj4gY2FzZSAy
Ogo+Pj4+Pj4+IENQIHwgd3JpdGUgZmlsZSBBLCBzaXplIGlzIDFHIHwgZnN5bmMgQSB8IHRydW5j
YXRlIEEgdG8gMU0gfCAKPj4+Pj4+PiBmc3luYyBBIHxTUE8KPj4+Pj4+Pgo+Pj4+Pj4+IER1cmlu
ZyB0aGUgcmVjb3ZlcnkgcHJvY2VzcywgRjJGUyB3aWxsIHJlY292ZXIgZmlsZSBBLAo+Pj4+Pj4+
IGJ1dCB0aGUgMU0tMUcgc3BhY2UgY2Fubm90IGJlIHJlY2xhaW1lZC4KPj4+Pj4+Pgo+Pj4+Pj4+
IEJ1dCB0aGUgY29tYmluYXRpb24gb2YgdHJ1bmNhdGUgYW5kIGZhbGxvYyBjb21wbGljYXRlcyB0
aGUgcmVjb3ZlcnkKPj4+Pj4+PiBwcm9jZXNzLgo+Pj4+Pj4+IEZvciBleGFtcGxlLCBpbiB0aGUg
Zm9sbG93aW5nIHNjZW5hcmlvOgo+Pj4+Pj4+IHdyaXRlIGZpbGVBIDJNIHwgZnN5bmMgfCB0cnVu
Y2F0ZSAyNTZLIHwgZmFsbG9jIC1rIDI1NksgMU0gfCAKPj4+Pj4+PiBmc3luYyBBIHwgU1BPCj4+
Pj4+Pj4gVGhlIGZhbGxvYyAoMjU2SywgMU0pIG5lZWQgdG8gYmUgcmVjb3ZlcmVkIGFzIHByZS1h
bGxvY2F0ZWQgc3BhY2UuCj4+Pj4+Pj4KPj4+Pj4+PiBIb3dldmVyIGluIHRoZSBmb2xsb3dpbmcg
c2NlbmFyaW9zLCB0aGUgc2l0dWF0aW9uIGlzIHRoZSBvcHBvc2l0ZS4KPj4+Pj4+PiB3cml0ZSBm
aWxlQSAyTSB8IGZzeW5jIHwgZmFsbG9jIC1rIDJNIDEwTSB8IGZzeW5jIEEgfCB0cnVuY2F0ZSAK
Pj4+Pj4+PiAyNTZLIHwKPj4+Pj4+PiBmc3luYyBBIHwgU1BPCj4+Pj4+Pj4gSW4gdGhpcyBzY2Vu
YXJpbywgdGhlIHNwYWNlIGFsbG9jYXRlZCBieSBmYWxsb2MgbmVlZHMgdG8gYmUgCj4+Pj4+Pj4g
dHJ1bmNhdGVkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gRHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLCBp
dCBpcyBkaWZmaWN1bHQgdG8gZGlzdGluZ3Vpc2gKPj4+Pj4+PiBiZXR3ZWVuIHRoZSBhYm92ZSB0
d28gdHlwZXMgb2YgZmFsbG9jLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU28gaW4gdGhpcyBjYXNlIG9mIGZh
bGxvYyAtayB3ZSBuZWVkIHRvIHRyaWdnZXIgYSBjaGVja3BvaW50IGZvciAKPj4+Pj4+PiBmc3lu
Yy4KPj4+Pj4+Pgo+Pj4+Pj4+IEZpeGVzOiBkNjI0Yzk2ZmIzMjQ5ICgiZjJmczogYWRkIHJlY292
ZXJ5IHJvdXRpbmVzIGZvciAKPj4+Pj4+PiByb2xsLWZvcndhcmQiKQo+Pj4+Pj4+Cj4+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogV2FuZyBYaWFvanVuIDx3YW5neGlhb2p1bkB2aXZvLmNvbT4KPj4+Pj4+
PiAtLS0KPj4+Pj4+PiB2NDogVHJpZ2dlciBjaGVja3BvaW50IGZvciBmc3luYyBhZnRlciBmYWxs
b2MgLWsKPj4+Pj4+PiB2MzogQWRkIGEgRml4ZXMgbGluZS4KPj4+Pj4+PiB2MjogQXBwbHkgQ2hh
bydzIHN1Z2dlc3Rpb24gZnJvbSB2MS4gTm8gbG9naWNhbCBjaGFuZ2VzLgo+Pj4+Pj4+IHYxOiBG
aXggbWlzc2luZyBzcGFjZSByZWNsYW1hdGlvbiBkdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3Mu
Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqDCoMKgwqAgZnMvZjJmcy9jaGVja3BvaW50LmMgfMKgIDMg
KysrCj4+Pj4+Pj4gwqDCoMKgwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoMKgwqAgfMKgIDMgKysr
Cj4+Pj4+Pj4gwqDCoMKgwqAgZnMvZjJmcy9maWxlLmPCoMKgwqDCoMKgwqAgfMKgIDggKysrKysr
LS0KPj4+Pj4+PiDCoMKgwqDCoCBmcy9mMmZzL3JlY292ZXJ5LmPCoMKgIHwgMTggKysrKysrKysr
KysrKysrKystCj4+Pj4+Pj4gwqDCoMKgwqAgNCBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
Y2hlY2twb2ludC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPj4+Pj4+PiBpbmRleCBkYjM4MzFm
N2YyZjUuLjc3NWUzMzMzMDk3ZSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9p
bnQuYwo+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4+Pj4+Pj4gQEAgLTExNTEs
NiArMTE1MSw5IEBAIHN0YXRpYyBpbnQgZjJmc19zeW5jX2lub2RlX21ldGEoc3RydWN0IAo+Pj4+
Pj4+IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoaW5vZGUpIHsKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzeW5j
X2lub2RlX21ldGFkYXRhKGlub2RlLCAwKTsKPj4+Pj4+PiDCoMKgwqDCoCArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIAo+Pj4+Pj4+IEZJX0ZBTExP
Q19LRUVQX1NJWkUpKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xl
YXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSk7Cj4+Pj4+Pj4gKwo+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGl0J3Mgb24gZXZpY3Rpb24g
Ki8KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaXNfaW5vZGVf
ZmxhZ19zZXQoaW5vZGUsIEZJX0RJUlRZX0lOT0RFKSkKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfdXBkYXRlX2lub2RlX3BhZ2UoaW5vZGUpOwo+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+
Pj4gaW5kZXggNDZiZTc1NjA1NDhjLi5mNWE1NGJjODQ4ZDUgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPj4+Pj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4+Pj4+IEBAIC00
NTksNiArNDU5LDcgQEAgc3RydWN0IGZzeW5jX2lub2RlX2VudHJ5IHsKPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGU7wqDCoMKgIC8qIHZmcyBpbm9kZSBwb2ludGVy
ICovCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBibG9ja190IGJsa2FkZHI7wqDCoMKgIC8qIGJs
b2NrIGFkZHJlc3MgbG9jYXRpbmcgdGhlIGxhc3QgCj4+Pj4+Pj4gZnN5bmMgKi8KPj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgIGJsb2NrX3QgbGFzdF9kZW50cnk7wqDCoMKgIC8qIGJsb2NrIGFkZHJl
c3MgbG9jYXRpbmcgdGhlIAo+Pj4+Pj4+IGxhc3QgZGVudHJ5ICovCj4+Pj4+Pj4gK8KgwqDCoCBs
b2ZmX3QgbWF4X2lfc2l6ZTvCoMKgwqAgLyogcHJldmlvdXMgbWF4IGZpbGUgc2l6ZSBmb3IgCj4+
Pj4+Pj4gdHJ1bmNhdGUgKi8KPj4+Pj4+PiDCoMKgwqDCoCB9Owo+Pj4+Pj4+IMKgwqDCoMKgIMKg
wqDCoMKgICNkZWZpbmUgbmF0c19pbl9jdXJzdW0oam5sKSAobGUxNl90b19jcHUoKGpubCktPm5f
bmF0cykpCj4+Pj4+Pj4gQEAgLTgzNSw2ICs4MzYsNyBAQCBlbnVtIHsKPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgIEZJX0FUT01JQ19SRVBMQUNFLMKgwqDCoCAvKiBpbmRpY2F0ZSBhdG9taWMgcmVw
bGFjZSAqLwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgRklfT1BFTkVEX0ZJTEUswqDCoMKgwqDC
oMKgwqAgLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVlbiBvcGVuZWQgKi8KPj4+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgIEZJX0RPTkFURV9GSU5JU0hFRCzCoMKgwqAgLyogaW5kaWNhdGUgcGFnZSBkb25h
dGlvbiBvZiAKPj4+Pj4+PiBmaWxlIGhhcyBiZWVuIGZpbmlzaGVkICovCj4+Pj4+Pj4gK8KgwqDC
oCBGSV9GQUxMT0NfS0VFUF9TSVpFLMKgwqDCoCAvKiBmaWxlIGFsbG9jYXRlIHJlc2VydmVkIHNw
YWNlIGFuZCAKPj4+Pj4+PiBrZWVwIHNpemUgKi8KPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIEZJ
X01BWCzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIG1heCBmbGFnLCBuZXZlciBiZSB1c2VkICov
Cj4+Pj4+Pj4gwqDCoMKgwqAgfTsKPj4+Pj4+PiDCoMKgwqDCoCBAQCAtMTE5Myw2ICsxMTk1LDcg
QEAgZW51bSBjcF9yZWFzb25fdHlwZSB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBDUF9TUEVD
X0xPR19OVU0sCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBDUF9SRUNPVkVSX0RJUiwKPj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgIENQX1hBVFRSX0RJUiwKPj4+Pj4+PiArwqDCoMKgIENQX0ZBTExP
Q19GSUxFLAo+Pj4+Pj4+IMKgwqDCoMKgIH07Cj4+Pj4+Pj4gwqDCoMKgwqAgwqDCoMKgwqAgZW51
bSBpb3N0YXRfdHlwZSB7Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMv
ZjJmcy9maWxlLmMKPj4+Pj4+PiBpbmRleCA0MmZhYWVkNmEwMmQuLmYwODIwZjgxNzgyNCAxMDA2
NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZmls
ZS5jCj4+Pj4+Pj4gQEAgLTIzNiw2ICsyMzYsOCBAQCBzdGF0aWMgaW5saW5lIGVudW0gY3BfcmVh
c29uX3R5cGUgCj4+Pj4+Pj4gbmVlZF9kb19jaGVja3BvaW50KHN0cnVjdCBpbm9kZSAqaW5vZGUp
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChmMmZzX2V4aXN0X3dyaXR0ZW5fZGF0
YShzYmksIAo+Pj4+Pj4+IEYyRlNfSShpbm9kZSktPmlfcGlubywKPj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhB
VFRSX0RJUl9JTk8pKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjcF9yZWFzb24g
PSBDUF9YQVRUUl9ESVI7Cj4+Pj4+Pj4gK8KgwqDCoCBlbHNlIGlmIChpc19pbm9kZV9mbGFnX3Nl
dChpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSkpCj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNw
X3JlYXNvbiA9IENQX0ZBTExPQ19GSUxFOwo+Pj4+Pj4+IMKgwqDCoMKgIMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIGNwX3JlYXNvbjsKPj4+Pj4+PiDCoMKgwqDCoCB9Cj4+Pj4+Pj4gQEAgLTE5NTMs
MTAgKzE5NTUsMTIgQEAgc3RhdGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCAK
Pj4+Pj4+PiBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsCj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoCB9Cj4+Pj4+Pj4gwqDCoMKgwqAgwqDCoMKgwqDCoMKgwqDCoCBpZiAobmV3X3NpemUgPiBp
X3NpemVfcmVhZChpbm9kZSkpIHsKPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKG1vZGUgJiBG
QUxMT0NfRkxfS0VFUF9TSVpFKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobW9kZSAmIEZB
TExPQ19GTF9LRUVQX1NJWkUpIHsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRf
aW5vZGVfZmxhZyhpbm9kZSwgRklfRkFMTE9DX0tFRVBfU0laRSk7Cj4+Pj4+PiBYaWFvanVuLAo+
Pj4+Pj4KPj4+Pj4+IFdlbGwsIHdoYXQgYWJvdXQgdGhpcyBjYXNlPwo+Pj4+Pj4KPj4+Pj4+IGZh
bGxvYyAtayBvZnMgc2l6ZSBmaWxlCj4+Pj4+PiBmbHVzaCBhbGwgZGF0YSBhbmQgbWV0YWRhdGEg
b2YgZmlsZQo+Pj4+PiBIaSBDaGFvLAo+Pj4+PiBGbHVzaCBhbGwgZGF0YSBhbmQgbWV0YWRhdGEg
b2YgZmlsZSwgYnV0IHdpdGhvdXQgdXNpbmcgZnN5bmMgb3IgQ1A/Cj4+Pj4gWGlhb2p1biwKPj4+
Pgo+Pj4+IEkgdGhpbmsgc28sIG9yIGFtIEkgbWlzc2luZyBzb21ldGluZz8KPj4+Pgo+Pj4+IFRo
YW5rcywKPj4+IEhpIENoYW8sCj4+PiBJIHRoaW5rIHRoaXMgY2FzZSBpcyBwb3NzaWJsZS4gVGhh
bmsgeW91IGZvciBwb2ludGluZyBvdXQgdGhpcyBpc3N1ZS4KPj4+IEkgd2lsbCBmaXggaXQgaW4g
dGhlIG5leHQgdmVyc2lvbi4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+
Cj4+Pj4+PiBldmljdCBpbm9kZQo+Pj4+Pj4gd3JpdGUgZmlsZSAmIGZzeW5jIGZpbGUgd29uJ3Qg
dHJpZ2dlciBhIGNoZWNrcG9pbnQ/Cj4+Pj4+Pgo+Pj4+Pj4gT3IgYW0gSSBtaXNzaW5nIHNvbWV0
aGluZz8KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+Pj4+Pgo+Pj4+Pj4+IGZpbGVfc2V0X2tlZXBf
aXNpemUoaW5vZGUpOwo+Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIH0gZWxzZSB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZjJmc19pX3NpemVfd3JpdGUoaW5vZGUsIG5ld19zaXplKTsKPj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgfQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IMKgwqDCoMKgIMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9yZWNv
dmVyeS5jIGIvZnMvZjJmcy9yZWNvdmVyeS5jCj4+Pj4+Pj4gaW5kZXggNGNiM2E5MTgwMWI0Li42
OGI2MmM4YTc0ZDMgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9yZWNvdmVyeS5jCj4+Pj4+
Pj4gKysrIGIvZnMvZjJmcy9yZWNvdmVyeS5jCj4+Pj4+Pj4gQEAgLTk1LDYgKzk1LDcgQEAgc3Rh
dGljIHN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSAKPj4+Pj4+PiAqYWRkX2ZzeW5jX2lub2RlKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIGVudHJ5ID0g
ZjJmc19rbWVtX2NhY2hlX2FsbG9jKGZzeW5jX2VudHJ5X3NsYWIsCj4+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9GMkZTX1pFUk8sIHRy
dWUsIE5VTEwpOwo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgZW50cnktPmlub2RlID0gaW5vZGU7
Cj4+Pj4+Pj4gK8KgwqDCoCBlbnRyeS0+bWF4X2lfc2l6ZSA9IGlfc2l6ZV9yZWFkKGlub2RlKTsK
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfYWRkX3RhaWwoJmVudHJ5LT5saXN0LCBoZWFk
KTsKPj4+Pj4+PiDCoMKgwqDCoCDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlbnRyeTsKPj4+Pj4+
PiBAQCAtNzk2LDYgKzc5Nyw3IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZz
X3NiX2luZm8gCj4+Pj4+Pj4gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwKPj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHdoaWxlICgxKSB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBmc3luY19pbm9kZV9lbnRyeSAqZW50cnk7Cj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBmb2xpbyAqZm9saW87Cj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGxvZmZfdCBpX3NpemU7Cj4+Pj4+Pj4gwqDCoMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmICghZjJmc19pc192YWxpZF9ibGthZGRyKHNiaSwgYmxrYWRkciwgCj4+Pj4+Pj4g
TUVUQV9QT1IpKQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+Pj4+Pj4+IEBAIC04MjgsNiArODMwLDkgQEAgc3RhdGljIGludCByZWNvdmVyX2RhdGEoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAKPj4+Pj4+PiAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9s
aXN0LAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJl
YWs7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlY292ZXJlZF9pbm9kZSsrOwo+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5LT5pbm9k
ZSk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVudHJ5LT5tYXhfaV9zaXpl
IDwgaV9zaXplKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW50cnkt
Pm1heF9pX3NpemUgPSBpX3NpemU7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVudHJ5LT5sYXN0X2RlbnRyeSA9
PSBibGthZGRyKSB7Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJy
ID0gcmVjb3Zlcl9kZW50cnkoZW50cnktPmlub2RlLCBmb2xpbywgCj4+Pj4+Pj4gZGlyX2xpc3Qp
Owo+Pj4+Pj4+IEBAIC04NDQsOCArODQ5LDE5IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0
cnVjdCBmMmZzX3NiX2luZm8gCj4+Pj4+Pj4gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVf
bGlzdCwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWNvdmVyZWRfZG5vZGUrKzsKPj4+Pj4+PiDCoMKgwqDCoCAtwqDC
oMKgwqDCoMKgwqAgaWYgKGVudHJ5LT5ibGthZGRyID09IGJsa2FkZHIpCj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChlbnRyeS0+YmxrYWRkciA9PSBibGthZGRyKSB7Cj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaV9zaXplID0gaV9zaXplX3JlYWQoZW50cnktPmlub2RlKTsKPj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZW50cnktPm1heF9pX3NpemUgPiBpX3Np
emUpIHsKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IGYyZnNf
dHJ1bmNhdGVfYmxvY2tzKGVudHJ5LT5pbm9kZSwKPj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlfc2l6ZSwgZmFsc2UpOwo+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVycikgewo+Pj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX2ZvbGlvX3B1dChmb2xp
bywgdHJ1ZSk7Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+
ICsgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoZW50cnktPmlub2RlLCB0cnVlKTsKPj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbGlzdF9tb3ZlX3RhaWwoJmVudHJ5LT5saXN0LCB0bXBfaW5vZGVfbGlzdCk7
Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+PiDCoMKgwqDCoCBuZXh0Ogo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYV9ibG9ja3MgPSBhZGp1c3RfcG9yX3JhX2Jsb2Nr
cyhzYmksIHJhX2Jsb2NrcywgCj4+Pj4+Pj4gYmxrYWRkciwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmV4dF9ibGthZGRyX29mX25vZGUo
Zm9saW8pKTsKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
