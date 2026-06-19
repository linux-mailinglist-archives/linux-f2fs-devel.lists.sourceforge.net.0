Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pnRtGRVWNWpctQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:45:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7022A6A679E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jun 2026 16:45:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=dkiQ48lP;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=lb656qAB;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=NfzXMN4W;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=re43JUAh;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YblXIrKMYDBvaIi/Fel71TJ6kBeeL4dmkCjqminPO8A=; b=dkiQ48lP1AqXXW4RlmibRlHHkD
	OqTLKujJxp5Bc05LcdFHKDVaS6hVIQJuYRlAyvPx/QoZMTcXry5wOGA8BZ7ngkflkFe0fxZtu6i3d
	XG38hYO6o6J4Ux1u/SviVGhvET7OCMor0d9c5Pqur8KUoDb0xW/4owgO432GmTURV9W0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waaTI-0007ua-BP;
	Fri, 19 Jun 2026 14:45:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1waaTG-0007uK-Kf for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JJyj1xzjpZUt/O5PW3infZWAYFdmm0WexorXhsGYm+8=; b=lb656qAB5hQxGABK0R9/Ta4ygg
 O5SAnhysih430MdNkeu1T3oZRy/O+8soV5QJFe6xr8SEFPF4oPem9xtnbXKcg1FdiDrxPToUR0dbi
 YmMYUzqwB9MiBz7i4hUPDvDR+Vljwl5FKGtjrop2/A7aRLOUSWPDgsjL4tzxaVeU8YTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JJyj1xzjpZUt/O5PW3infZWAYFdmm0WexorXhsGYm+8=; b=NfzXMN4W21IlrNiV+q9bQ31+3D
 F3120zxCK2h86ho1kHZmJqumUtOOXMstwT5zVHXlBpN1cHYgFKKSCSs986q+hJW8hNsqZqVQCka0d
 OkyTintpVh9rGfLo3txirBVK9oMX/hhQVAoEUR7wbdGqiBplAk6ofx/1vX6O8+EdGSVw=;
Received: from mail-japanwestazolkn19012052.outbound.protection.outlook.com
 ([52.103.66.52] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waaTF-0005ud-68 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Jun 2026 14:45:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/RQxGKMiRMjHB6vEJUSzoWSqgdGVLGGDLHLnQ3aL0w0xkRvMjpG1s0LM1vpUJQ3UThiDyhRKdqv0Bs46gevVVXyzy7FEzZ+DVReGlXqi4ZR0qyiL8WXteMIvVEEpM0H0d8njcD5TEA3Txd0Q6XiUVqArC9shqfBM1exdYRbxsEL8PMLUTzNsaw5yGo3EwvU8TQYcAS9bLrWreEJPh2udY+QJtN12nwBDOgReMW8MXcenwmHbvbvz4Cm+gHosA8BvU8wY1Gz+5b8siaZrBzVXC9ul4/shE8NKUAOVMIGjzMvp3LtLpsxnG92yc1z6kFTGqAm6iBMjQWHLp0PfU7xRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJyj1xzjpZUt/O5PW3infZWAYFdmm0WexorXhsGYm+8=;
 b=GK2Qa1bVdDMPDLnCAs0QEx/oyCm/rPxkGQYmjatue8RsxTOix+K+x5G8FCo65t9pTuCkPdD51ihgiio1Hc2g0HX/aZtCmI8qFNTqPPSBYIBeUAijjUjxwSn9eZ9d3NY1xwb4i5Wt/JZEwERYGZutDXeHCH1MyjP6iT4MkTJ+rwGkSbawPAliP6kV+ij4LUbuL2CAMBc3QMez1D7keGY4b5k4BtRzA/Dp5kZ1y7aImnxcdkgTrPyon/lYS8k6nvR16HjdDbzFIv43KQGPFIjwNfdXalJyjne6dLvtogfW2rRsf5OmZixkwPBS2QpLw8UL3ha69aBCxK9Wc0fahDHOag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJyj1xzjpZUt/O5PW3infZWAYFdmm0WexorXhsGYm+8=;
 b=re43JUAh3WNdoU8u8fv42RT++cMhTE3KmTNMgKBQfNZGp/NBzmZ/eqs4SVrI7O/+KbtItws2BxlFX9IyZL8Hd1sQBbAZAeBbhpcYWhOZeL2RP1Dqvy4AVKEu03FaqC6lUxYgxlJid239OXrg/RA8tTKI2V/5uy+MTqoM451gksBAAkh/a8c0MFNd3QmOrSALuaVlreZEU7VN3JpwaUZkyxf5IVf1vscVXIJaNb9o1ZObcDOnutx9dYPjOcQ3PhdeF0UU+t2dpDCqiUqlFBn5xcvbxtgCeGOWbavUKB6Nw9KdZ7j0qEPZCw0X+YxV7KG7R3fShdVekGwToCqJyTcQOg==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by KUXPR02MB8792.apcprd02.prod.outlook.com (2603:1096:d10:40::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 14:45:11 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 14:45:10 +0000
Message-ID: <SEZPR02MB56625194F24957F19418C62A99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Fri, 19 Jun 2026 22:45:05 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-5-yangyongpeng.storage@gmail.com>
 <b2560939-82ef-4d1b-82fd-fa90388c3316@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <b2560939-82ef-4d1b-82fd-fa90388c3316@kernel.org>
X-ClientProxiedBy: TP0P295CA0025.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::17) To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <f9505065-6002-452a-b965-85307754eb8b@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|KUXPR02MB8792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a21d72a-7544-4399-e9e5-08dece115c8f
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkq33I+Bhlv8BlJeLPawnStKY0tYkYq+gwqUW+GOTjfJLakCNv1hRv2Bcb6RvqEePja5ttaR3YCUYpcHAip5M7s7/gBjLiPuUZk2ciDfqmJauStqI4NCR0t33qTuvjvonuJM88jbljFFoZr3l4JJ7Uz89f5CCH1jBHgBz2vORQ3bp7U9tj9RwDepnNRo11xb0wyt7zZKjvS70yf95YnQK/7CAog6ol1uZ3S0tqVAw8XK4AQGiilvKDB6RiPIaRCYheIB875JgggewEHSZzDQJoZRQyNEpuTn+lwLJvTaM3/j3ARIKVmuWXnr3tedIw0UPlNco/2A4kkFXO1bZ6FE9SRox5fiM273DuUwbaca4txq2eXrB2MW2mRjFDCv2ClMi3cXsBGkED0n7yFPv9pMxCtIU5ecoMJvSwcnHDaCLnl60fiyoNPyGZx7jvc2moHsSkS86cpOUo4IlwYy1eimKwPz/U9Jv2EgAVRwojqzG6NDets7Lj7DPyMbFRpqGebq9wJ3Zgrt+Vtvl1RuGhBx9pJMEmZRbjuSnTAwoko8+fZ7S0XS4dkZvcqBuFAmVQxxJxiPLre/9Xn2Ypjttt5aAnJgIrrOk5KSvbXjwQ+kipCB75m6xsncixeIjWMWjK951xNE8tNJtUV6yeLqJL8Nc5yradhimoBsDpe6pVjv784orIfKlwVzTK7zJe/nHh3ZLtKpqSLhCf7ytSLQwDkf9wOFL8XydXvkEQqzgthjOsrfqOB5jGDr2fl3al/cOzY7vYPCxVRIGb2Q0osG7GPLia40Qc3SlZ40CB
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|7042599007|51005399006|15080799012|25010399006|6090799003|45011099003|41001999006|8060799015|5072599009|23021999003|19110799012|24121999003|22091999003|12091999003|10035399007|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmlUVnhZYTltaUNPenUwbDYyTU41VHpMTVdEVzFxRm1ueVUrVVRRQUxWSGl3?=
 =?utf-8?B?bEhFQWIybEdPL3drbzVFYmxEVmVTN25NOXBUV0RwbVpsdFY2Ky9jQjRGN0RP?=
 =?utf-8?B?QXpsc0pMeFVVRjUrUVZRbk9RamVjc2prQjBheEZlNWRMQUhsOE5zaDdtOGUv?=
 =?utf-8?B?bElQRXhkTWNOczFzRnRKWHYwVkhNWngzdTlDMUoyM3RVT01hUTZONk51TnNa?=
 =?utf-8?B?VVU0Rkl3WXNrTWdxdnVPTU5rUUY0dWlwRkEyN1g4bC9SUlI1MXlzNXlYYktr?=
 =?utf-8?B?TFBlS2h6cmRPcDlIL1lFL2JSdzNlcFVDZ1dFSExQMW9SOWx3T2xqNW4zMGQz?=
 =?utf-8?B?QmNSL21GeFp4UFVKNWNGZUl5aFJ1WDAxZHpJaXhOTjRhd2MxNE1ZKzlVUXc1?=
 =?utf-8?B?L1daK1RheGxVODIwNVZITjVROTM5VFdIUUJBdWtxRGpoZXYzUjdLdVlxTDVQ?=
 =?utf-8?B?RFF4MlI5aEt5RW95RU16MEk4ODlBZDdaaHhqQ0hpZmV6cUp6MnFzVHR0eVU3?=
 =?utf-8?B?WTVWamd3RGMvR0VEcEJ0cWM0cVR3N1d5clovRy9SWnhBMDh2UDRwYjg2bVND?=
 =?utf-8?B?ZkNsQzYrS2ZzUDFQSTBxT1pHUlRiaG9KNHFSKzFZM1pWZUVUSlVodzFudDA0?=
 =?utf-8?B?ajhvUk9qWXVkZENEdEdpbnhIck9PSEpnVGE1djN0MnBkY3NzcnVlK082WkEw?=
 =?utf-8?B?ZlBJbk4xVDRIdjU5a1FNNmQwZHNZSDlMc3JaQkgycCt1cFRMWEJsZnNxekNs?=
 =?utf-8?B?WmZKUXhiREw3NUpuOE9WQlBnRlFmY2MxbjRvQXJPSEN4QkQ5WEVwZ25oZTZJ?=
 =?utf-8?B?UzhKUW83WUVSZVE5K2NhbUZJaXRLZVdWVjg1eUVYNjlNOW5aK3gwK0hnSUdE?=
 =?utf-8?B?SUlpTXpyTTFRVFVuSDNja0pwZ0puWGJCR0pmYWkxY0ozTnJyTVJQMS9za0lx?=
 =?utf-8?B?YkEvTlNkbFV3MG5vVzhnYmNvYUtwM3lLOC9SUk5xN1pxdTVsNGN2cERYSFpN?=
 =?utf-8?B?ckhWdWFZUjZSUHNib2VOcVFnN0dQVVNQUk96SnE4R0ZkTGdBeTJzUXRRcUxs?=
 =?utf-8?B?UEsrc2l2bWppNjV4VjZIamF2djh6Y1JiZFJ0Y1JVdlZCb2phQmZxZ0J4ZTVQ?=
 =?utf-8?B?V0VwWEVtcExYUXZWVVRRbEJBa25pMU5JdWR4R1VxZm9DTnFPN2l2RTNKV0ZG?=
 =?utf-8?B?UkIwWmRzam9PYzg0eVNwMWdlOEh6TE9zYjZ6S2p6R25YZEhwOU5FdGM1bm85?=
 =?utf-8?B?T0VNcVp3QTFhV1R1bmp3V1lyTmtSNmtIK29PM1dpZ3RSZ0YxeEgrSGtwUnVu?=
 =?utf-8?B?aFM2Y2NPdVNCWTc4Y2NNemlCMS9YbWhlT1p6WklKVDZHZHIwVDZ5dkhrWC9t?=
 =?utf-8?B?dEtRZDRBM2lNRjFlT3doNFZiQ1crbUhGbUFXSkwzSy9rY1NKRStOeWVQek8x?=
 =?utf-8?B?dGRmM2VYZnNjOENPV1RhQWtOT0FTSThReTIxT2o1MFAvNlpmWWJqSG1mdGJ6?=
 =?utf-8?B?ZlNZVkZFRWR2RzNQRnU3dmoxbERsa0N5WXZhWFZVNGM2aUpyM0dyS2ZqamJs?=
 =?utf-8?Q?vxOaOQQ/poV2wdcebObKWCb2I=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azlzYnFQQU95MGJVZ0VTRHBLVGxFVU5CbEwzMnRjMWtnQkFaWFN5VFREU0lU?=
 =?utf-8?B?RGt5MnpDcU95YVFJUUZuQ1NVdzV4MEpmdUROT2lTdXJEYmxwTTBVS1ZEWS9L?=
 =?utf-8?B?YlppTnBiUDZDUSs5MEgranZwUHM2blN4bFZCSWtVSTJjUlhvSzl6RmlveXRt?=
 =?utf-8?B?anRjS3NNay9Bd2F3ejBDMW9pWlpkTVBnYU1aTWwrNEQ4Qk16YWV4T1NMc2Nw?=
 =?utf-8?B?TUJrd2VFY0dkR2J2MzhZaEZWZUpUYko4SVVmVmE5ZzJ6TmlBbVZEK2ZKZHNY?=
 =?utf-8?B?bHRwdlo5cU9hNG5HTEZYNFhQZ243ZllyUkI5QmVzdEFsY25idjRUdkoxVzJy?=
 =?utf-8?B?TUZ2dS9GZURyVkV1d3ljVm1DT0ZFd2JkRkY4M3BHZjI1bzYvbGFBTFlYSHNX?=
 =?utf-8?B?RTMvRnUrdGcxVFFveVVyc2t3RXVTSHJlT0lzTWdjTGxiVWlXaXg5Q1hidHE2?=
 =?utf-8?B?QTJnQ0Z3R1p5eXBPSm5OOHJMY0pEYVdYN3NIdTMzblRMc1gvWmhYTlVaa0dW?=
 =?utf-8?B?eFdWalc4OERnVkxKNUZTSHM2aTAzMFpvZlNEVjVza0s4TU4yQ040YTN2OHhq?=
 =?utf-8?B?c1NzVWgyVExoNU96dnJNK2lZMHI4bTBaN3VjTVdJRnVxdjlZQUZ2K054cjBa?=
 =?utf-8?B?UXo1UGJhNXZSYUV1dFlqMnFkbmxSM1FsMlFlRllwa1ZqajdWZnZ1c0VXMkly?=
 =?utf-8?B?NityWEk0MnRDWSt2Sm12VHF5cFZGVkhRSEFteFA1Rks4WktOSVk5M0RScmZ2?=
 =?utf-8?B?VFc1dVQ5RGgwUTFobkR5YUpGOUxWN3ZzRFNQZXYwdE5Ta3RpeVBnWG8vRXZt?=
 =?utf-8?B?cXFUS0RNenZsQnM5Q0o2TjUwVU12OU03amhobFBnNlNSWXNEb2syS0M0cTBM?=
 =?utf-8?B?T21QOHd6RGZrTkFLWlpEWDcycE9WR0ZwZnJ1WjZHN1JDaHBNV1pvWnlCK1cv?=
 =?utf-8?B?QWFQWUNOVXdxQnZ2T2Zqd29PUUwzWlBvNGJLZDRUa0NkQVNSSXFreEtWY210?=
 =?utf-8?B?N25KZy9VZENpSUlUY2dNenZNRlFJbmhmT2I0UklnRk56aHk3VytLcU9sRndV?=
 =?utf-8?B?Sy9URCtjY29wZll5aGRGZG9Da0YxUkltUURnNk9JZlZ5cXlHa2FMSGVKem9N?=
 =?utf-8?B?aFhzcFdaWDBhYU5LSlJiMVUwRndBRkVkaW9YaWdKeTd2dHMwS0pqbTdMS3pY?=
 =?utf-8?B?V2lkMS9RMk8wb3VHb1FtOS9GVDVDSkpkR1lKT01vQkxVakE3OEJDZGFleVJX?=
 =?utf-8?B?Z1Z1a3RmaFpnZGpLVGhKZVJ3M3NTYWdFRG9VVmNMdGJZcHBGajNEUGQybG10?=
 =?utf-8?B?VFFTbUQ4OWZ0N1A5RDB6cFpRWXViUit0M2ZxOWcrTDR3OFhNVUFIeUh0VUNa?=
 =?utf-8?B?amlYNUFpZ0w1VW1rTmRSMXp5dkZFMmkranNMendHQWdpWFVHa0VodHExUjlJ?=
 =?utf-8?B?M3k3b094NGw5aE9CeFQyM3Z4bld6bWNFVHBzKzEraEllc2ZINm5ZS0YxNmtD?=
 =?utf-8?B?SzFiMWpjUE5NR0x2aEZqZjNyRlRrbUx0eHB5Y2hFRmNreFhqTXQybm9KeWti?=
 =?utf-8?B?ZHVoZEJDcjNDYjRBREd4UHk1Wmlha1lOSWw3YW9heE52cUxaUTJiY0E0T2Qy?=
 =?utf-8?B?VDRZeENqZS9QUzg0cEdTSlFiclFneHBmbXlZTHp4cnhSN3RMcGdEalJidnpN?=
 =?utf-8?B?TXB6eW5OVnVKdFZMNEo2eVpla1BJTkVTSEdvRzNUbiszdHI0QTllRDdVZ2t1?=
 =?utf-8?B?NFdEYTNJRVdVV0JjVks4THNGaGFNa0hQeXFZU2krb1ZYWXUxdnFSeHJCNFJ3?=
 =?utf-8?B?c2kyeGg5RDhJTGwzclk1ajc2NWs4NmJpMXBwTmcvWGRvb1ZyMDYrNXhxR0JJ?=
 =?utf-8?B?bTk2TmpWTFF0YXVKSDdudlFZYndEQVlVWEpQdEVmZGU0YkJ2SmRzNVhPaklv?=
 =?utf-8?B?THR6V3ZybVFGSm1IYWhGc1VtNmNUK2dIdGFnZXFpeS9NM1pHZWthQ2xGQUlX?=
 =?utf-8?B?b2FESyt6TFJBPT0=?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a21d72a-7544-4399-e9e5-08dece115c8f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 14:45:09.7561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR02MB8792
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 8:05 PM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/12/26 19:58, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> Introduce
 enum extent_access_mode to classify how each extent node >> is [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.66.52 listed in wl.mailspike.net]
X-Headers-End: 1waaTF-0005ud-68
Subject: Re: [f2fs-dev] [PATCH RESEND 4/5] f2fs: add extent_access_mode to
 track extent cache access patterns
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:from_mime,SEZPR02MB5662.apcprd02.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7022A6A679E

On 6/15/26 8:05 PM, Chao Yu via Linux-f2fs-devel wrote:
> On 6/12/26 19:58, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> Introduce enum extent_access_mode to classify how each extent node
>> is accessed or created (READ, WRITE, PRECACHE, TRUNCATE, LARGEST).
>> This metadata optimize LRU eviction decisions:
> 
> Can you please give some numbers for this change?

This is a qualitative analysis. This patch aims to prioritize shrinking
extents that are not read-hit and the largest extent.


> 
>>
>> 1. Extents only accessed as the largest extent (never read-hit) are
>> deprioritized in the LRU list since reads can still use the largest
>> extent directly.
>>
>> 2. Sparse single-block write extents that were never merged are moved
>> to the head of LRU for earlier reclaim, preserving extents with
>> better continuity and higher read-hit probability.
>>
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>>   fs/f2fs/data.c         |  4 ++--
>>   fs/f2fs/extent_cache.c | 29 ++++++++++++++++++++++++++++-
>>   fs/f2fs/f2fs.h         | 14 +++++++++++++-
>>   fs/f2fs/file.c         |  6 ++++--
>>   4 files changed, 47 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 9c6440a7db0e..2d38135005fe 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -1873,7 +1873,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>>   
>>   			f2fs_update_read_extent_cache_range(&dn,
>>   				start_pgofs, map->m_pblk + ofs,
>> -				map->m_len - ofs);
>> +				map->m_len - ofs, EX_ACCESS_PRECACHE);
>>   		}
>>   	}
>>   
>> @@ -1919,7 +1919,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
>>   			if (map->m_len > ofs)
>>   				f2fs_update_read_extent_cache_range(&dn,
>>   					start_pgofs, map->m_pblk + ofs,
>> -					map->m_len - ofs);
>> +					map->m_len - ofs, EX_ACCESS_PRECACHE);
>>   		}
>>   		if (map->m_next_extent)
>>   			*map->m_next_extent = is_hole ? pgofs + 1 : pgofs;
>> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
>> index 82d84c4e98b2..e141ffb64e5f 100644
>> --- a/fs/f2fs/extent_cache.c
>> +++ b/fs/f2fs/extent_cache.c
>> @@ -142,6 +142,7 @@ static void __try_update_largest_extent(struct extent_tree *et,
>>   	if (en->ei.len <= et->largest.len)
>>   		return;
>>   
>> +	en->ei.last_access_mode = EX_ACCESS_LARGEST;
>>   	et->largest = en->ei;
>>   	et->largest_updated = true;
>>   }
>> @@ -518,6 +519,7 @@ static bool __lookup_extent_tree(struct inode *inode, pgoff_t pgofs,
>>   		stat_inc_rbtree_node_hit(sbi, type);
>>   
>>   	*ei = en->ei;
>> +	en->ei.last_access_mode = EX_ACCESS_READ;
>>   	spin_lock(&eti->extent_lock);
>>   	if (!list_empty(&en->list)) {
>>   		list_move_tail(&en->list, &eti->extent_list);
>> @@ -624,6 +626,21 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>>   
>>   	/* update in global extent list */
>>   	spin_lock(&eti->extent_lock);
>> +	/*
>> +	 * 1. For the largest extent, if subsequent writes are not merged into
>> +	 * it, the write path will most likely not use the largest extent_node,
>> +	 * while read requests can still access the mapping through the largest
>> +	 * extent.
>> +	 *
>> +	 * 2. For sparse writes, if the extent length is 1 and no extent merging
>> +	 * occurs, this extent should be reclaimed with higher priority to avoid
>> +	 * evicting extents with better continuity and higher read-hit.
>> +	 */
>> +	if (et->type == EX_READ && et->cached_en &&
>> +		(et->cached_en->ei.last_access_mode == EX_ACCESS_LARGEST ||
>> +		 (et->cached_en->ei.len == 1 &&
>> +		  et->cached_en->ei.last_access_mode == EX_ACCESS_WRITE)))
>> +		list_move(&et->cached_en->list, &eti->extent_list);
>>   	list_add_tail(&en->list, &eti->extent_list);
>>   	et->cached_en = en;
>>   	spin_unlock(&eti->extent_lock);
>> @@ -747,6 +764,8 @@ static void __update_extent_tree_range(struct inode *inode,
>>   		if (fofs > dei.fofs && (type != EX_READ ||
>>   				fofs - dei.fofs >= F2FS_MIN_EXTENT_LEN)) {
>>   			en->ei.len = fofs - en->ei.fofs;
>> +			if (type == EX_READ)
>> +				en->ei.last_access_mode = EX_ACCESS_TRUNCATE;
>>   			prev_en = en;
>>   			parts = 1;
>>   		}
>> @@ -761,6 +780,8 @@ static void __update_extent_tree_range(struct inode *inode,
>>   					end - dei.fofs + dei.blk, false,
>>   					dei.age, dei.last_blocks,
>>   					type);
>> +				if (type == EX_READ)
>> +					ei.last_access_mode = EX_ACCESS_TRUNCATE;
>>   				en1 = __insert_extent_tree(sbi, et, &ei,
>>   							NULL, NULL, true);
>>   				next_en = en1;
>> @@ -770,6 +791,8 @@ static void __update_extent_tree_range(struct inode *inode,
>>   					en->ei.blk + (end - dei.fofs), true,
>>   					dei.age, dei.last_blocks,
>>   					type);
>> +				if (type == EX_READ)
>> +					en->ei.last_access_mode = EX_ACCESS_TRUNCATE;
>>   				next_en = en;
>>   			}
>>   			parts++;
>> @@ -808,6 +831,7 @@ static void __update_extent_tree_range(struct inode *inode,
>>   	if (tei->blk) {
>>   		__set_extent_info(&ei, fofs, len, tei->blk, false,
>>   				  0, 0, EX_READ);
>> +		ei.last_access_mode = tei->last_access_mode;
>>   		if (!__try_merge_extent_node(sbi, et, &ei, prev_en, next_en))
>>   			__insert_extent_tree(sbi, et, &ei,
>>   					insert_p, insert_parent, leftmost);
>> @@ -978,6 +1002,7 @@ static void __update_extent_cache(struct dnode_of_data *dn, enum extent_type typ
>>   			ei.blk = NULL_ADDR;
>>   		else
>>   			ei.blk = dn->data_blkaddr;
>> +		ei.last_access_mode = EX_ACCESS_WRITE;
>>   	} else if (type == EX_BLOCK_AGE) {
>>   		if (__get_new_block_age(dn->inode, &ei, dn->data_blkaddr))
>>   			return;
>> @@ -1091,12 +1116,14 @@ void f2fs_update_read_extent_cache(struct dnode_of_data *dn)
>>   }
>>   
>>   void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
>> -				pgoff_t fofs, block_t blkaddr, unsigned int len)
>> +				pgoff_t fofs, block_t blkaddr, unsigned int len,
>> +				enum extent_access_mode access_mode)
>>   {
>>   	struct extent_info ei = {
>>   		.fofs = fofs,
>>   		.len = len,
>>   		.blk = blkaddr,
>> +		.last_access_mode = access_mode,
>>   	};
>>   
>>   	if (!__may_extent_tree(dn->inode, EX_READ))
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index fffb516b78f4..1588b64d04a3 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -763,6 +763,15 @@ enum extent_type {
>>   	NR_EXTENT_CACHES,
>>   };
>>   
>> +/* extent acces mode for cache hit or extent add */
>> +enum extent_access_mode {
>> +	EX_ACCESS_READ,
>> +	EX_ACCESS_WRITE,
>> +	EX_ACCESS_PRECACHE,
>> +	EX_ACCESS_TRUNCATE,
>> +	EX_ACCESS_LARGEST,
>> +};
>> +
>>   /*
>>    * Reserved value to mark invalid age extents, hence valid block range
>>    * from 0 to ULLONG_MAX-1
>> @@ -781,6 +790,8 @@ struct extent_info {
>>   			/* physical extent length of compressed blocks */
>>   			unsigned int c_len;
>>   #endif
>> +			/* record last access mode */
>> +			enum extent_access_mode last_access_mode;
> 
> As we know, memory is expensive, :P, I'd like to know if we can enable this
> optionally if there is benefits.

extent_access_mode consumes only padding holes within the union and
brings no additional memory overhead. The union is sized to 16 bytes in
total, whereas blk, c_len and extent_access_mode together take up just
12 bytes.

Thanks
Yongpeng,


> 
> Thanks,
> 
> 
>>   		};
>>   		/* block age extent_cache */
>>   		struct {
>> @@ -4577,7 +4588,8 @@ bool f2fs_lookup_read_extent_cache_block(struct inode *inode, pgoff_t index,
>>   			block_t *blkaddr);
>>   void f2fs_update_read_extent_cache(struct dnode_of_data *dn);
>>   void f2fs_update_read_extent_cache_range(struct dnode_of_data *dn,
>> -			pgoff_t fofs, block_t blkaddr, unsigned int len);
>> +				pgoff_t fofs, block_t blkaddr, unsigned int len,
>> +				enum extent_access_mode access_mode);
>>   unsigned int f2fs_shrink_read_extent_tree(struct f2fs_sb_info *sbi,
>>   			int nr_shrink);
>>   
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 633e9ade654f..a3a5d499eadf 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -733,7 +733,8 @@ void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
>>   		 */
>>   		fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_folio),
>>   							dn->inode) + ofs;
>> -		f2fs_update_read_extent_cache_range(dn, fofs, 0, len);
>> +		f2fs_update_read_extent_cache_range(dn, fofs, 0, len,
>> +							EX_ACCESS_TRUNCATE);
>>   		f2fs_update_age_extent_cache_range(dn, fofs, len);
>>   		dec_valid_block_count(sbi, dn->inode, nr_free);
>>   	}
>> @@ -1672,7 +1673,8 @@ static int f2fs_do_zero_range(struct dnode_of_data *dn, pgoff_t start,
>>   
>>   	if (index > start) {
>>   		f2fs_update_read_extent_cache_range(dn, start, 0,
>> -							index - start);
>> +							index - start,
>> +							EX_ACCESS_TRUNCATE);
>>   		f2fs_update_age_extent_cache_range(dn, start, index - start);
>>   	}
>>   
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
