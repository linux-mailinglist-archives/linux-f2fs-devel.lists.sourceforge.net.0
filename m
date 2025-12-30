Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E963CE8E8E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 08:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnhUZUiCgF+sRq9HiDUxqIJz6NWCAhhyk8uLDZkZ0Vk=; b=a9+0sj5b50yyXcgAOhpmzIefX8
	UNqzLwtUROpxqkbQVuCq2jmbqLB0CbTnXYvVRwc59UEmnj4b21itTi+wtkw05kxrUOVi2NPUiLm72
	DYBsExfhxNry6JQ6SiVjYFPQcbD1J3GjKtjGoeZpycNMNf2RDlMHlvdloz3TvGagYa4w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaUKE-0004Xc-C0;
	Tue, 30 Dec 2025 07:39:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1vaUKC-0004XS-VL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 07:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tTeI7IIkthWgqIcJxQGKz3dmWamp05iwgVra83VKv3k=; b=mjEorbtN62woP1K/JW2XKxohbk
 vyRemdnwX+biMt8iOjV25TFN+NpsdPx1PobfcS1149SyUZAbX1LsOh7hNJCnejn+04LSFXEP3j55b
 k2egR6TwlPGi27Dn7PfxJ0hNDbSnPD4uIacmeJ96azxIVAHdKCRnVs3lUfmzecOvQ4SE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tTeI7IIkthWgqIcJxQGKz3dmWamp05iwgVra83VKv3k=; b=jIXhqNZMD4vOu7FyyG7UP4kMIM
 9YFcEnE2Tk+BzOTVNE0eKcLUZSUQVgBzkEBTzD0qkZmorYTvQEHNXvPxhk5YWyx08tZQfyYup/v8n
 CIAqqwt59PmVzKOkwjhqYKAOrwoJSDDTSQB56D5frgEklr/tD52cwGgt7MA6w+nNUptg=;
Received: from mail-japaneastazolkn19013082.outbound.protection.outlook.com
 ([52.103.43.82] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaUKC-0002mv-3W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 07:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIQW1/hlqCZ7ETPIduJC4QI2CQftTXfd5q27Hk9nOSIZ2VbWAxh1qBkqOTh63vWX8qyLaqpBNvxwVw8BAeMAXYylczCrAcg7It7FE3QSPQpiohZcWDE4IOF7SuCX59c+5ip/aXZt/AbUAnI3QBdpEhEpifQiCehd96WmAOInyo9FEHcVi0S1dhxwkpl95GKmrxKp1uMKTnzkizeRXbu3p7/RRYjinhVFDzuTImz2nN6CeCCyzhdFrm55aqe1sXGj2w3vE5x6QgY0Y1Didgx6SNBHNFz9iVUn7K1zkQz27jpk8WUh4MMNULCFeT4FPVvsqlPUWZDuvySj7u4vdCaX9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTeI7IIkthWgqIcJxQGKz3dmWamp05iwgVra83VKv3k=;
 b=cVTxhD2qqyWrBWD9y/48awSjTWUlJVBsX38gbmVvGqX2ct1wHu/UBbL5Unw2EMG3PqAvVy2QHPLm11ZcYCtUELyl5+IOad/gJ1EdyzezqSbnrH54hN0ZNJvZCJk6CtHxQO1FEEHqzXlmyGqa8LMfajtr+iIgBEClQRUNZ5QHOiVQ0WQm8MauK581+9fdJpQMxY9gi9I03tKo4zk6uuJm0FtA+5v3iUJLnEppRq/el/0QRa1Sh5VF896h9bDeELNc9ePJSfaYUtcEQi1uQPn2WfvTbOiw6Y/B5lmAI/r+VG+toH4UVVLJWFe6LvkvGrVurRD8FW8qd3fL328ED1zn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTeI7IIkthWgqIcJxQGKz3dmWamp05iwgVra83VKv3k=;
 b=jtc0a62WdNaX92UUyOpQ/LLC5w6EF0f0IRyq5yUeu5v0l+GoDtnhkNXILpB3vSzLKSHCTGT5NflUxpbkuXSTThN4pt/NLGHK5jnJ9Syg54gDibb7iPbuZdl8C/igkfYDpSXZJspLSJ/mkKAASGyShA8RfGu6DIom3dBp0H04hxXk1qLcNdfCJCMhJX+MTRqu+148ML6kneIlx3eNxbjTSgOU6q547B69SGNmAKEH2wzZ9dhqH+mYpBCLBMTUPjODsf98acDnqHFA7Z8GPZXpvXg4ilvYo4i7mRMgdGhT3/uf2iAvlp6I4vyWzCSN54swuDB9mEi7zMzS0cSXwxBwKQ==
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com (2603:1096:101:47::14)
 by TYSPR02MB6533.apcprd02.prod.outlook.com (2603:1096:400:433::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 07:39:14 +0000
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120]) by SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120%4]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 07:39:14 +0000
Message-ID: <SEZPR02MB5520C63CFC85871F6537F97A99BCA@SEZPR02MB5520.apcprd02.prod.outlook.com>
Date: Tue, 30 Dec 2025 15:39:10 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251227062141.7722-2-yangyongpeng.storage@gmail.com>
 <c0500125-a353-40df-8fb6-d6e468364f6b@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <c0500125-a353-40df-8fb6-d6e468364f6b@kernel.org>
X-ClientProxiedBy: SL2P216CA0144.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::23) To SEZPR02MB5520.apcprd02.prod.outlook.com
 (2603:1096:101:47::14)
X-Microsoft-Original-Message-ID: <785c341a-eeec-4098-b02b-17f62a948fe3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5520:EE_|TYSPR02MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 66db8abc-3bb6-4c7d-a225-08de4776878a
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799012|9112599006|6090799003|15080799012|51005399006|5072599009|23021999003|8060799015|461199028|440099028|3412199025|10035399007|40105399003|3420499032|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzRtU3BnREFXNVp6WXVMaHdNR0tOcGxqT0ZzaUg3Sm9kMStFOVNVVjYyb2sr?=
 =?utf-8?B?R0xGd04vZW9ibFY1NlRjVysrSUg0OVdONDZvbVpNdEdja2kySXZuZGFieXhP?=
 =?utf-8?B?STJyTjB2L21EMmxLZkVZTzVmWWpXVGJIaG41S25rQThJS2o4cGNmUWgxUExT?=
 =?utf-8?B?RVMzMmRaazYvbTRacmQ1UUltTkxiQWRqUjhKTjNLa1ZrUEw4bmFCdlE4UWpW?=
 =?utf-8?B?VlNzVzQrSHE2MlV6clIrdzFVL09lY29nUldGWloyWWgwUk5GTnArR09ZTi83?=
 =?utf-8?B?T3UxT1c4MUNZWUZKRG5hT2s1R09BUk5nZEpZaWFKZmxvTUR5M1U4TEhLdEVV?=
 =?utf-8?B?S0lVUk9zWGxaNXpTLzVUc09jd2p5dUcyTkdObnpkejNJOS9LRlFXZW95ZXFz?=
 =?utf-8?B?UTFJRlBJOEtOY3BWUFhhaVFIYy9qaytRbmRSWGJiN29BOC9pTjg5SDhmQ25y?=
 =?utf-8?B?SUh1dUZjUW9HOXpadGJ0SU5pcXVJNTZZdFFHV24xbEJqZStIbGY5R2xETHlH?=
 =?utf-8?B?cEs5eVhmRzI2MkFPMVl2WHRsc1VMelNVWUNRQW42UDdTa1J0U0V2dTd5WWg0?=
 =?utf-8?B?Z3JoaFpPMDIrNWlvUDdDU2xXNTU0U0k1OXJFRDAzMjQ1dzRVSHB6NERBWHFt?=
 =?utf-8?B?djQ1Q3MzRlcrU08wTEROajhOdlZENlczNmh6OWJ5bEEyRmVhV0hEZWdJSnZM?=
 =?utf-8?B?Y0RsNVZPNXJOVHlGSTNYREVBck9BNm85TWFKWkkwSjA1WGp0cjhFeHBQUnA4?=
 =?utf-8?B?V09sVUNYUlRYeEpFSVJiU2IyZ2o3RitMUGtFdXovRlk3dzYrQVY4cHRqeE1B?=
 =?utf-8?B?eHhKRFhoN1hycUdIbHRFMWFWdk1TdnZ0dmRNb3hUaTdJRVdCV3FrN2t6cVY0?=
 =?utf-8?B?Y1FpalFoY2dSYVZoNGxDdnZ3RDNjamNQZzN5R1FIbjJ3cTZ6a0ptSFM2YU13?=
 =?utf-8?B?SE9QY3JUOWY3aWRCMnhXMC84QkJtMDU3aDNmQ3M2MWF6RlkxcDk1aWZsc0w1?=
 =?utf-8?B?Mm85cXBFVklKMzBwbG1icnhWV3dRSTFJOWZOcEZyaHVscVo1ZTNXd0p0L21C?=
 =?utf-8?B?WFJmK21rbXIxdSt2MGFtTHFlcElFNkNRUVdoT0JGU1B4VWZjaEd3ZlFkdGwv?=
 =?utf-8?B?VkF5WStjTm80b1YvR1ZGUGVKT2hyNTFKVXlEM1VSYlQrSkx6M3BBaURZUTRX?=
 =?utf-8?B?c1ZmTnNxelZHd29pWjArTVNPT3E2VkpwSU9uWi8yY0hpb0ExSUY4YVdsRWtI?=
 =?utf-8?B?dVJTWVQ4VUZkN212Q2dDc05KdTF1SS8xdStWQ3hDZm9SV3EwT0lSVDgzVTRs?=
 =?utf-8?B?QXpPMURnSEpreFR2MUlBVzYxa0N1NVErUEdWRVczdDBmSExTYVhQd2J3clpk?=
 =?utf-8?B?UkF2Q0hUUEE2eGxzbmxPMDBvY0E4bDEyYk9TeUJMckg5VFJDb0wzQ2VXTHZB?=
 =?utf-8?B?N05KazRYb09VcXZrMHV3blpMVi9VTnM2VjZaNGZzRHMwcmNyTGN2MTlCMVk5?=
 =?utf-8?B?SDh5YjdiYksvTE5LakRmTXZMTlhxZlo5QlJHNWVmL2llZUd0bENlcDMwQnU0?=
 =?utf-8?B?Tlprb0Yva05JcTZGQ3BlL2pHK0NwY3pNSzVXYm5ydzBxK0drNDdWbGdCZy9k?=
 =?utf-8?B?THBPS2lOcDZ0Y1dFY1pFY1UvM1crUGRySm1uUUVVVTQxYjM4N3BnOXhOMTdt?=
 =?utf-8?B?TENoYmFuOWJEVzV1TTdpL1gwcTVMamVBWFVYeCtkaENrVHh4aGFsY3VmU0Jq?=
 =?utf-8?B?OWJLLzZ3OU9RM1Rkekl3YnZJd2wvclpZcjVNeFF1SzRsTEY3VDZjUlp4SW5J?=
 =?utf-8?B?SWRHQXRFbmxkOTIvd1BXZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnQvMW9hazh2TU1UVi9GL3d5dkYvQjNEc3lhRndNSERwb3liaHVNMng5L0dr?=
 =?utf-8?B?UWZMQ3RuYUYwTmhyU0NqektoZEhhdWZ4RnlvZU4zUHlXazV0NmN0MHJFeXFy?=
 =?utf-8?B?bUFvNFVmczZtUmF0YzBkdkJJRng3RnpRYWc5L2ZOTXoyZ3l0OVZQZitDbFFz?=
 =?utf-8?B?aEdaZTJIaEdidUhjVlM2eXNKRVVTNWFZdjcxY0U1Qjd5U0pBK1RKRTAwMUEz?=
 =?utf-8?B?QmZMMG1YYVlJNmFWeDR2SENTVjZPUVg4VmQ1MzlnaTJiRlBhQUtob0doTUl6?=
 =?utf-8?B?K2dBSHdZQjZSZkJNekJMWGhkWlg4ZjJkaGZQcjR3K2VzTDdDZ1Q4bEtpQlR6?=
 =?utf-8?B?NDJYYWZldTJnK1lYanl5R3BZcUFpN0pyajlEb3p6TDk0Q0c3YXhhdXlvSHNa?=
 =?utf-8?B?OUN6QUFIaEpTYXcxZXpqTWJvaXZ3RFNsZENxUjdKUHd5ZUZCTFMrUUI1OGty?=
 =?utf-8?B?MWRaWCtJQzEvYmdHR044WlRVS2RFdWpKdWJPNURkc0tPTXZhUksxVlAxTmsy?=
 =?utf-8?B?Tzc4cUdCT3NjQ0hyL0J5UldKVkhlalFVOWJZZzdPWFlqYWNsekQwZkFTNE5z?=
 =?utf-8?B?eW9OTUN5QWgxSVNTY3J4YnQ4d25WQmllbElEdU9XTGVGYW8vU3V2Wk1Tb2dP?=
 =?utf-8?B?a1U3aElkbEMrMStuS3psQVM5dFJaM0p2ck9YRGZOczkzdjI2emEwWEhNVjVK?=
 =?utf-8?B?eUNIeVJjT1ZRbUZhR1FoazJVTXNSbGNrM2d4cFRIcWk5ekxrNWFmcVE2WHBs?=
 =?utf-8?B?REdnWnBwZGtqTDJlM2Y1NGZJMXhja3pJQjdta1dLUktWTTZHK3BxK1VJdjdF?=
 =?utf-8?B?dFVqQStzODVjTmxaeExMTUVId1JvcEhqVkxINjl1dXZnc1pPdHk0SDkwb3JZ?=
 =?utf-8?B?cklRUVMvdGk2akh5SklUYWNCT3FKd0o3YmhEa1ZDU0IxcmtIU3B2QXdUYmFa?=
 =?utf-8?B?UVdDY3A0NXV1bVU3ZFIvT1RyNStETGlPSXBJbHJPeTl0REFVdlhzYmZIMjFO?=
 =?utf-8?B?V0pMMEZNaTZvTWlXNkE4Z1VVcTBHUnFBQnlreTRYWmNGRUcrcGRrYXk0blJa?=
 =?utf-8?B?T0pqNUtIUDF6NWpCWFFKWEFWSVptaTBKdTZDeGF2NVprdjVKZDB3Q1AzeGJj?=
 =?utf-8?B?dldjdWpPb0c2THhlQXpRMW5IRFhqcklaSEFUaC9oY2lnZFFWbEZNOUVRZ1Fz?=
 =?utf-8?B?ckhXWWRtL2NKSXVCVUdJRXpRaENOQzZXZy9VdkNYb3N5cW9SWmVadlkwTkNN?=
 =?utf-8?B?Q3NCN29ZOE9WNmZndVpaU254UEVxMTUyUDFXT3VEOEw5QjducXJtOFVvUzA3?=
 =?utf-8?B?dEJLZ0ZaWXUxbWpwQXpCSDJ3Ynd6bEtGVnpKd1N6WU81SzJlTFlVZXBNcGQ0?=
 =?utf-8?B?ZFlDZHVuTE1RQVlVY2RDWVo1clY4V3Q3eXZLekhzNzdublV1bXVISlZRMVEv?=
 =?utf-8?B?NGhVOEp2TWNySEEzRmJoSkYyWDBXTTE3eVRZcmZhbzRBQ0JjSjUwc3RhWnlD?=
 =?utf-8?B?NU5xNkN1L3dkRjhLZVVMWitOU09PaXBiTHBTanVtQ1o3ZUhNZnR1VWs3Q29K?=
 =?utf-8?B?NHVoaHBaVFM5YmtkZ09Pc01OT3d3Uy9FMlJhVlZxTllEQW5veHZ1TVRCc3lQ?=
 =?utf-8?B?ZjNOWGtIcVhyblhjYWNqQXBDVEZ4dlVCMUxWL0cwVzFNTkdaaUp4Z2FHTEFV?=
 =?utf-8?B?c1lkT2cwZC96aFJueHF0b0haQnJBS1c2L2ZxeXgzL0NVNGw3TnI2UEEvRkxy?=
 =?utf-8?B?c3VKMVpMTXpWQkROV2M5S1FIUnUxZXFvbXNkMXRmTHpoNnZoRFlyQ0tmZTRL?=
 =?utf-8?B?YUJkMGQrZHJDM09nZlpBZVV4U25nY3QxbFJjTzdnblhVNmt3L2VTUVhwQU9E?=
 =?utf-8?B?Y09yMXNobERjbnR5Q1lxaitSVkVWVW1WTEtteFVxaGFDK2QvUmxWOHZNeWlq?=
 =?utf-8?B?amFabXNUOWxNd2RROVM4bjZlT1J4d2JkOVQwcFl6NTlvWjJKcnNkbDE0Vzg4?=
 =?utf-8?Q?nG7cGbkQoI08yZFdUZc0VcBT3W1Njk=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66db8abc-3bb6-4c7d-a225-08de4776878a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5520.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 07:39:14.1659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB6533
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/30/25 3:01 PM, Chao Yu via Linux-f2fs-devel wrote:
 > On 12/27/2025 2:21 PM, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >>
 During SPO tests, when mounting F2FS, an -EINVAL error was return [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.82 listed in wl.mailspike.net]
X-Headers-End: 1vaUKC-0002mv-3W
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 Sheng Yong <shengyong1@xiaomi.com>, Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDEyLzMwLzI1IDM6MDEgUE0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6
Cj4gT24gMTIvMjcvMjAyNSAyOjIxIFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZ
b25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4KPj4gRHVyaW5nIFNQTyB0
ZXN0cywgd2hlbiBtb3VudGluZyBGMkZTLCBhbiAtRUlOVkFMIGVycm9yIHdhcyByZXR1cm5lZCBm
cm9tCj4+IGYyZnNfcmVjb3Zlcl9pbm9kZV9wYWdlLiBUaGUgaXNzdWUgb2NjdXJyZWQgdW5kZXIg
dGhlIGZvbGxvd2luZyBzY2VuYXJpbwo+Pgo+PiBUaHJlYWQgQcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaHJl
YWQgQgo+PiBmMmZzX2lvY19jb21taXRfYXRvbWljX3dyaXRlCj4+IMKgIC0gZjJmc19kb19zeW5j
X2ZpbGUgLy8gYXRvbWljID0gdHJ1ZQo+PiDCoMKgIC0gZjJmc19mc3luY19ub2RlX3BhZ2VzCj4+
IMKgwqDCoMKgIDogbGFzdF9mb2xpbyA9IGlub2RlIGZvbGlvCj4+IMKgwqDCoMKgIDogc2NoZWR1
bGUgYmVmb3JlIGZvbGlvX2xvY2sobGFzdF9mb2xpbykgZjJmc193cml0ZV9jaGVja3BvaW50Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gYmxvY2tfb3BlcmF0aW9ucy8v
IAo+PiB3cml0ZWJhY2sgbGFzdF9mb2xpbwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIHNjaGVkdWxlIGJlZm9yZSAKPj4gZjJmc19mbHVzaF9uYXRfZW50cmllcwo+PiDC
oMKgwqDCoCA6IHNldF9mc3luY19tYXJrKGxhc3RfZm9saW8sIDEpCj4+IMKgwqDCoMKgIDogc2V0
X2RlbnRyeV9tYXJrKGxhc3RfZm9saW8sIDEpCj4+IMKgwqDCoMKgIDogZm9saW9fbWFya19kaXJ0
eShsYXN0X2ZvbGlvKQo+PiDCoMKgwqDCoCA6IF9fd3JpdGVfbm9kZV9mb2xpbyhsYXN0X2ZvbGlv
KQo+IAo+IE9uZSBtb3JlIHF1ZXN0aW9uOgo+IAo+IElmIHRoZSBsYXN0IGZvbGlvIHdhcyBjb21t
aXR0ZWQgYmVmb3JlIGYyZnNfZmx1c2hfbmF0X2VudHJpZXMoKSwgdGhhdCAKPiBtZWFucyBpdCB3
YXMKPiB3cml0dGVuIGJlZm9yZSBkb19jaGVja3BvaW50KCksIHNvIHdoeSByZWNvdmVyeSBjYW4g
ZmluZCBpdCBpbiBub2RlIAo+IGJsb2NrIGNoYWluPwoKU29ycnksIHRoaXMgaXMgbm90IGNsZWFy
bHkgZGVzY3JpYmVkIGhlcmUuIF9fd3JpdGVfbm9kZV9mb2xpbygpIGRvZXMgbm90Cm5lY2Vzc2Fy
aWx5IGNvbXBsZXRlIHRoZSB3cml0ZSBvZiBsYXN0X2ZvbGlvIGFmdGVyIFRocmVhZCBCIHJldHVy
bnMgZnJvbQpibG9ja19vcGVyYXRpb25zKCkgYW5kIGJlZm9yZSBpdCBjYWxscyBmMmZzX2ZsdXNo
X25hdF9lbnRyaWVzKCkuCgpUaHJlYWQgQSBpcyBibG9ja2VkIGluIGYyZnNfZG93bl9yZWFkKCZz
YmktPm5vZGVfd3JpdGUpIHVudGlsIFRocmVhZCBCCmNhbGxzIHVuYmxvY2tfb3BlcmF0aW9ucygp
IGFuZCBmMmZzX3VwX3dyaXRlKCZzYmktPm5vZGVfd3JpdGUpLgoKSSdsbCBjbGFyaWZ5IHRoaXMg
bG9naWMgaW4gdjQgcGF0Y2guCgpUaGFua3MKWW9uZ3BlbmcsCgo+IAo+IFRoYW5rcywKPiAKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX2ZsdXNoX25hdF9lbnRy
aWVzCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA6IHtzdHJ1Y3Qg
bmF0X2VudHJ5fS0gCj4+ID5mbGFnIHw9IEJJVChJU19DSEVDS1BPSU5URUQpCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUE8KPj4KPj4gVGhyZWFkIEEgY2FsbHMgZjJmc19u
ZWVkX2RlbnRyeV9tYXJrKHNiaSwgaW5vKSwgYW5kIHRoZSBsYXN0X2ZvbGlvIGhhcwo+PiBhbHJl
YWR5IGJlZW4gd3JpdHRlbiBvbmNlLiBIb3dldmVyLCB0aGUge3N0cnVjdCBuYXRfZW50cnl9LT5m
bGFnIGRpZCBub3QKPj4gaGF2ZSB0aGUgSVNfQ0hFQ0tQT0lOVEVEIHNldCwgY2F1c2luZyBzZXRf
ZGVudHJ5X21hcmsobGFzdF9mb2xpbywgMSkgYW5kCj4+IHdyaXRlIGxhc3RfZm9saW8gYWdhaW4u
Cj4+Cj4+IEFmdGVyIFNQTyBhbmQgcmVib290LCBpdCB3YXMgZGV0ZWN0ZWQgdGhhdCB7c3RydWN0
IG5vZGVfaW5mb30tPmJsa19hZGRyCj4+IHdhcyBub3QgTlVMTF9BRERSIGJlY2F1c2UgVGhyZWFk
IEIgc3VjY2Vzc2Z1bGx5IHdyaXRlIHRoZSBjaGVja3BvaW50Lgo+Pgo+PiBUaGlzIGlzc3VlIG9u
bHkgb2NjdXJzIGluIGF0b21pYyB3cml0ZSBzY2VuYXJpb3MuIEZvciByZWd1bGFyIGZpbGUKPj4g
ZnN5bmMgb3BlcmF0aW9ucywgdGhlIGZvbGlvIG11c3QgYmUgZGlydHkuIElmCj4+IGJsb2NrX29w
ZXJhdGlvbnMtPmYyZnNfc3luY19ub2RlX3BhZ2VzIHN1Y2Nlc3NmdWxseSBzdWJtaXQgdGhlIGZv
bGlvCj4+IHdyaXRlLCB0aGlzIHBhdGggd2lsbCBub3QgYmUgZXhlY3V0ZWQuIE90aGVyd2lzZSwg
dGhlCj4+IGYyZnNfd3JpdGVfY2hlY2twb2ludCB3aWxsIG5lZWQgdG8gd2FpdCBmb3IgdGhlIGZv
bGlvIHdyaXRlIHN1Ym1pc3Npb24KPj4gdG8gY29tcGxldGUsIGFzIHNiaS0+bnJfcGFnZXNbRjJG
U19ESVJUWV9OT0RFU10gPiAwLiBUaGVyZWZvcmUsIHRoZQo+PiBzaXR1YXRpb24gd2hlcmUgZjJm
c19uZWVkX2RlbnRyeV9tYXJrIGNoZWNrcyB0aGF0IHRoZSB7c3RydWN0Cj4+IG5hdF9lbnRyeX0t
PmZsYWcgL3dvIHRoZSBJU19DSEVDS1BPSU5URUQgZmxhZywgYnV0IHRoZSBmb2xpbyB3cml0ZSBo
YXMKPj4gYWxyZWFkeSBiZWVuIHN1Ym1pdHRlZCwgd2lsbCBub3Qgb2NjdXIuCj4+Cj4+IFRoZXJl
Zm9yZSwgZm9yIGF0b21pYyBmaWxlIGZzeW5jLCBzYmktPm5vZGVfd3JpdGUgc2hvdWxkIGJlIGFj
cXVpcmVkCj4+IHRocm91Z2ggX193cml0ZV9ub2RlX2ZvbGlvIHRvIGVuc3VyZSB0aGF0IHRoZSBJ
U19DSEVDS1BPSU5URUQgZmxhZwo+PiBjb3JyZWN0bHkgaW5kaWNhdGVzIHRoYXQgdGhlIGNoZWNr
cG9pbnQgd3JpdGUgaGFzIGJlZW4gY29tcGxldGVkLgo+Pgo+PiBGaXhlczogNjA4NTE0ZGViYTM4
ICgiZjJmczogc2V0IGZzeW5jIG1hcmsgb25seSBmb3IgdGhlIGxhc3QgZG5vZGUiKQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBTaGVuZyBZb25nIDxzaGVuZ3lvbmcxQHhpYW9taS5jb20+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEppbmJhbyBMaXUgPGxpdWppbmJhbzFAeGlhb21pLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+IC0tLQo+PiB2MzoK
Pj4gLSBBZGQgZGV0YWlsZWQgZXhwbGFuYXRpb25zIGZvciB3aHkgZnN5bmMgb3BlcmF0aW9ucyBv
biByZWd1bGFyIGZpbGVzIGRvCj4+IG5vdCBoaXQgdGhpcyBpc3N1ZS4KPj4gdjI6Cj4+IC0gSWYg
YXRvbWljIGlzIHRydWUsIHNldF9kZW50cnlfbWFyayBpbiBfX3dyaXRlX25vZGVfZm9saW8uCj4+
IC0tLQo+PiDCoCBmcy9mMmZzL25vZGUuYyB8IDE0ICsrKysrKysrKystLS0tCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+PiBpbmRleCA0ODJhMzYyZjI2
MjUuLjJjNjEwMmJlZTM0OSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4gKysrIGIv
ZnMvZjJmcy9ub2RlLmMKPj4gQEAgLTE3NzQsOCArMTc3NCwxMyBAQCBzdGF0aWMgYm9vbCBfX3dy
aXRlX25vZGVfZm9saW8oc3RydWN0IGZvbGlvIAo+PiAqZm9saW8sIGJvb2wgYXRvbWljLCBib29s
ICpzdWJtaXR0ZWQKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gcmVkaXJ0eV9vdXQ7Cj4+IMKg
wqDCoMKgwqAgfQo+PiAtwqDCoMKgIGlmIChhdG9taWMgJiYgIXRlc3Rfb3B0KHNiaSwgTk9CQVJS
SUVSKSkKPj4gLcKgwqDCoMKgwqDCoMKgIGZpby5vcF9mbGFncyB8PSBSRVFfUFJFRkxVU0ggfCBS
RVFfRlVBOwo+PiArwqDCoMKgIGlmIChhdG9taWMpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICgh
dGVzdF9vcHQoc2JpLCBOT0JBUlJJRVIpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmaW8u
b3BfZmxhZ3MgfD0gUkVRX1BSRUZMVVNIIHwgUkVRX0ZVQTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChJU19JTk9ERShmb2xpbykpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9kZW50cnlf
bWFyayhmb2xpbywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX25lZWRf
ZGVudHJ5X21hcmsoc2JpLCBpbm9fb2Zfbm9kZShmb2xpbykpKTsKPj4gK8KgwqDCoCB9Cj4gID7C
oMKgID7CoMKgwqDCoMKgwqAgLyogc2hvdWxkIGFkZCB0byBnbG9iYWwgbGlzdCBiZWZvcmUgY2xl
YXJpbmcgUEFHRUNBQ0hFIAo+IHN0YXR1cyAqLwo+PiDCoMKgwqDCoMKgIGlmIChmMmZzX2luX3dh
cm1fbm9kZV9saXN0KHNiaSwgZm9saW8pKSB7Cj4+IEBAIC0xOTE2LDggKzE5MjEsOSBAQCBpbnQg
ZjJmc19mc3luY19ub2RlX3BhZ2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gCj4+ICpzYmksIHN0cnVj
dCBpbm9kZSAqaW5vZGUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBGSV9ESVJUWV9J
Tk9ERSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGYyZnNfdXBkYXRlX2lub2RlKGlub2RlLCBmb2xpbyk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXRfZGVudHJ5X21hcmsoZm9saW8sCj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfbmVlZF9kZW50cnlf
bWFyayhzYmksIGlubykpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKCFhdG9taWMpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHNldF9kZW50cnlfbWFyayhmb2xpbywKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX25lZWRfZGVudHJ5X21hcmso
c2JpLCBpbm8pKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogbWF5IGJlIHdyaXR0ZW4gYnkgb3Ro
ZXIgdGhyZWFkICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFm
b2xpb190ZXN0X2RpcnR5KGZvbGlvKSkKPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
