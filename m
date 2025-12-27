Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A76CDF483
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 06:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:References:To:From:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipeNPfwgeA2qevMDaJQ0EYpNNlEO0TWc7n2LY9ZVmCE=; b=LeQkbyVVLb40yjLD3ZqMI2+5pV
	VMuxuGX2PHwWbrQlEgJHIKbvWHh7vzCncizw+Vmn4EMESwo+AIPnK8Yvz5Jo/9ExYu2JBydrr7lv3
	C9RDR6qqW5JVqmdRRUCXi9J7msgUUgcN/MmQ19tzAAE0AdhgO660udCxsX53k6QdFnXQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZMjw-0004C7-T6;
	Sat, 27 Dec 2025 05:21:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1vZMjv-0004Bz-1v for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZxOXzLj33CpMFuLZ5k88ZIN/uzTZMuCywjZYRL+PRRM=; b=fuPssevDjXKSXJkNxn+JS96N1b
 7RH8OlnaHy3Fyfxv+3grsU9fzcUO0HB02Fheoe9u2FTx2kV4W2+ZctcjfdLnwX3KfcVazTO4mlU8E
 QUq303/cIjchEb4EBMtk2ePLJFHJrjXGUhSspMWuOUn+AU8E2vJCEtx8WIBHxgvkL9TE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZxOXzLj33CpMFuLZ5k88ZIN/uzTZMuCywjZYRL+PRRM=; b=nVIAMxl1YEjXcpYHiC7r6ntBD3
 J1B4GTa0K1VcMW1SWThYt5YS2MayCXiF5WvPGmVXF1UNAX9BHXGqZ4ciigNG62ipXskCPm6n912dv
 OdQ/ApXChcb3ErJULikJpaw1kY2x377zviX7QKoDYP1WHxDNLfwyx7Sm3lKJEWUdFcJo=;
Received: from mail-koreacentralazolkn19013082.outbound.protection.outlook.com
 ([52.103.74.82] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZMju-0000vK-F5 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 05:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WeMbynM5pnnAIJsHnPOl3at/vgZKnDLJWeDXzLHLWTFXhgchpvULhH/01FOjuPaVhuxpgukelAKtWUHvanDANOf2hKZ9ih5o2qzUlkqcdqtfJ7Et0HlHtknTRwRJskrzTmwiuUyvWRIZ2asRzBtdEHzDwimfr0xzzH/UnDi7Ig+wVZ705xOd1JVplv5pv5hdPmbeYPYH/nwB8BXJ5aItOiQIGEtmZxZQtRrsHBuwpcFAu3NvMOVFzY2684LwLfV0rHwYIngstoxMNcFdSIBY1AZGlD/1GnkfCuDSDHSy/lfaWn0we0YKKE/95WMZMS+kdZJ25E4hMTzarjs4zK85Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxOXzLj33CpMFuLZ5k88ZIN/uzTZMuCywjZYRL+PRRM=;
 b=KiYu9R01nSpngAkspegybrje6kp3paABjD9kcrCetbvDSfADtGFt7fRZHgHk/dNa8LaWq+a5hDwUWEKpFql8ES7VlXTLjXbnqwRV8mZm1VtAhZHVDwvu7lwrO+wBSJqW1aKFU3JdHG7F95j1xdqCziCRVukliODvSg+/fXPWfPC+4S4PmMR1dOuk94od9Jmax9iEcPILs6Lw7q9v8aAK4Ugs22dTTHmXlL6nPQCckfI33x2bYfl5csXa0taI6gE/WP8FtahyIBd+FWw9IDd7TKwB+qZTOZnYBij84nXk1GPGnlgZzKG5GkLpoxszrQxN2ZfrQcFlf9PeQ22nmSsDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxOXzLj33CpMFuLZ5k88ZIN/uzTZMuCywjZYRL+PRRM=;
 b=HKTKda2fkDpy78GbCripqDlbxJsTghYxaT4VAuHBGSEjC/MAThPCpqQJ5M/kJps68I8uhXrG6qxQXRxINaTuoB8iCTCkCT9qIzp8akGsQTDHLyyuTvDnjGjLV/I5HJlkItGvSgOfB7tfFxFLVJCDzO5V1AI5R2vi81iGykAxpv6mxjXT/nzVogwzM0CPHANiGTiMIL7f+0QRMRZ0PHv7MiuATofN9AADhoh6JwyAGAg/aFVasV+sXQF8HOyw2przWr0Z9mQXPEr5VE7xFNmPm8BJGzJXRFK0/oWzFrAR8jrAOgjAJDyyHsddmpkYEPVy3u1DCg6HvYjfOtG6WbtWvw==
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com (2603:1096:101:47::14)
 by SG2PR02MB5746.apcprd02.prod.outlook.com (2603:1096:4:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Sat, 27 Dec
 2025 05:21:07 +0000
Received: from SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120]) by SEZPR02MB5520.apcprd02.prod.outlook.com
 ([fe80::ebcf:d79b:73ca:4120%4]) with mapi id 15.20.9434.001; Sat, 27 Dec 2025
 05:21:07 +0000
Message-ID: <SEZPR02MB5520184D1645593DF214428299B1A@SEZPR02MB5520.apcprd02.prod.outlook.com>
Date: Sat, 27 Dec 2025 13:21:00 +0800
User-Agent: Mozilla Thunderbird
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251226141111.119177-3-yangyongpeng.storage@gmail.com>
 <3bfe20b2-9f89-4bb9-9fbd-6ca2f780ad66@kernel.org>
In-Reply-To: <3bfe20b2-9f89-4bb9-9fbd-6ca2f780ad66@kernel.org>
X-ClientProxiedBy: SL2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::34) To SEZPR02MB5520.apcprd02.prod.outlook.com
 (2603:1096:101:47::14)
X-Microsoft-Original-Message-ID: <8e0a6e48-9da7-4a8e-81f2-542a79203681@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5520:EE_|SG2PR02MB5746:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c604ec0-278b-42a8-5f56-08de4507bb9e
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|5072599009|461199028|15080799012|19110799012|6090799003|8060799015|9112599006|23021999003|440099028|3412199025|40105399003|52005399003|3420499032|10035399007|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2VKZ1UvZTFMMmVRZUROYmcwMWpxSlJ5c0t0KzJqb09GRkpJS09RREhOUHVY?=
 =?utf-8?B?QWpHVEJRNmZrQnRWOTZvUDRRNzArN2tyTUkvQXNSSHhtdWozUmlyT2dqWXJa?=
 =?utf-8?B?TGxjbEx2cjNUR29YMU9QTEFiMWhZVXJuZDdXWm15bm92M1ppWjMwM0REdlF0?=
 =?utf-8?B?cElOS2tXOXZnc08zT1RCZ0c3SjBsUE5Kbmg0QjQ3byt0SGJuSDRwZWNhOVda?=
 =?utf-8?B?clNqQUJyM2NoMHh5Vmh3SHdlYmtCQXJieVN6T1Z1R2M2V3lPLzlGVTZ2T0ZW?=
 =?utf-8?B?K0Ntd2YzOHIvSFVCRmNIaXM3NkRVUVVpdXJkMFRSVCswUWlUbnlFT2dOK0Ix?=
 =?utf-8?B?a0xWNE9oWnU2S1JwK0NoazJwWk80OE1ZYUFsRzlYVUZITDZJckR2WWtvQkhN?=
 =?utf-8?B?WitNOWNNYzdjaTF1cVJVczRWa1dlWUZaNlkxRUxOMWdwSXVjZThWd004QW8v?=
 =?utf-8?B?Tys4dHpseHE5cmZKQ1E0RDBmeEYweWN1RDQxODNIS1NYVnJVc0NGL1RYR3o1?=
 =?utf-8?B?K05ZSlFxWEtUSU1nQ3NMNVNnVU40TnJzeTJxWWxCRGFIVkF4M2JGNEdIMEpP?=
 =?utf-8?B?ZHRUZXllVUdvNmI0TjNCTzFRVGo1WjJ2VXA2emFJazUrQWpxZGFhdTY3SzRD?=
 =?utf-8?B?NmJ1a2dQOVRSZzBmUFlPV254d0VZRVlIZUpwME84T2RDTjhHVndZclp6d0ll?=
 =?utf-8?B?RHR1SDhHYURnUERwbWROUFRuMWw4TjZFU0taMU1yZmxTQng2QnhWbnE2Sk9x?=
 =?utf-8?B?U3A3eCs4L2VXSnlOVnRuT0hiTlhNSEU3NDNIbU5LdHloaWpuRUpkS2NkUmxt?=
 =?utf-8?B?MFUxOXJ2MFFxV0NCdDVteVNXTXFwQUwxRDJmVkhYWjNiSTI4YWFKR01sUjNu?=
 =?utf-8?B?azZuQzR1S2M1aTViUlFQam9TL250akZEaC9IMlJoVlIzc09GMllpMnRveFhn?=
 =?utf-8?B?YTZPNlQ3OXZpRE5ZQm9wMk5WWE5jcjlaT1NWN3IrbmFIVGdKNG5vMjZMWmlo?=
 =?utf-8?B?QkNBb3pTcGQ3dTdYdUFaaXRpMTM2YzhWYkJyajZrdGg1bE5xSitkY2ZXK3BJ?=
 =?utf-8?B?a20xTTV6SVFGYXd5TVZrNHVjaTJGcEdYS1k0UkEyTjZaMDVZSkM2UjdZNCt1?=
 =?utf-8?B?RW8zT0RWNlIwcDU5TWtnSVlhRFlQZmp3cGVrSTdOb0RMRFkraUdwbWZtNW9X?=
 =?utf-8?B?elI1OVBYUmNtMFJLZzVNa0VYa1RHMkZwcGdtUmQ4bStVb21IL05SY0YrTlpm?=
 =?utf-8?B?M0tVcFQvOWJnSG5uY1dWakhQT3NGQUJkMG55WmpZekYxQ0JUMmcwSk9zNmxP?=
 =?utf-8?B?NGlZNUNXNWtERHowMUVNQk4rbjJNQUxXZ2U1OXZIaEdzM2xyZExYTit1WTBq?=
 =?utf-8?B?T29mWVdyMGJmL0lHRHAwV3dUK0xKN3JIY2JIcEUySUpnbnhJWEtHemQxSjNo?=
 =?utf-8?B?MngxT2NNaFJaenZRdEcyYnE2M2RuL1JwRFhGL0V0SWFyRmtHcm03V3pRa3Bo?=
 =?utf-8?B?ck0wWGFiai9zelYvc3kwNWRVTTIzbkVhRkhEZmdQcDZiMjRtWk5NVXFkc0Zm?=
 =?utf-8?B?UXlCU1V0bGI1bHdlU1lCbWJrTm1FS1VFdElCcWNCdm1xNGdxYUtxYVlQWjBo?=
 =?utf-8?B?aktTeE9yMzdtVXZwOTVoVis2UjhldW80QmRuWnFIODg3VnZ6cWFjcml4RnNT?=
 =?utf-8?B?Mk9qd1A4UUxnd29IOWw4YW1tcURkU3phNzhxdm1paDRBQ2Y1dUVzT1BWNWRF?=
 =?utf-8?B?S1I2YmJvU0FSSG94S3k4Mkh2RC84NmQzd1hPODB1cWREL05IZG1JY0ZCbjZR?=
 =?utf-8?B?OUY2SHZhYVdkZEhpclB1QT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWRtaGFwdHNwRkhrVm12RE1KcTI5Q21lKzltRWR1K0ZiaGluSUVtbW5LeXBj?=
 =?utf-8?B?VnVvMi9VSGV5RURxY1dINFo0UWZFSDdPYlp3V2NhNEU2SC9NVkJ3L1hRUFhD?=
 =?utf-8?B?UEp5MlkrTzB5cXcwRVQyTEpKQWI1SmVoL0F5TjRmMlBxdHQyaVp3T2tLc2NG?=
 =?utf-8?B?Q3Q0bHBMRDE4K29jRmZTOHdvTEdla0lFK1Vud0VMczhUdlhiSENDUVQ0RDhI?=
 =?utf-8?B?a0Zmc1d0SXhRLzZVdit0cjkxSXNRUlNkSzFPVm9rdGx4KzhaZVBNMWR0SjhF?=
 =?utf-8?B?TkVpTno0cXpNOThBUU1mUkdOT1gveWpwUXRpUjhBbDRzS05XK05Uem9MMWg2?=
 =?utf-8?B?cFlyVTFsTy9jaWROZ1RwdkZDOEFmTlMyZExnQXUxeU9XMkhiSUN2UDdwL0dP?=
 =?utf-8?B?cm44MUk0RHBZaWN4QzhIMFFBUFlmcUF6cFRPQWxtU0M3NUs1dXE5b1hxUVk5?=
 =?utf-8?B?VW9sOTY3SWFWZTJtZjAvU2FpUDV6V2Q3cCtCZys0MitBMHVUa0wxZzdNYU1E?=
 =?utf-8?B?WGptcTE0MVNnQngwQ2hDRU1rbnpWRlpRUGttMTNnMkJ4RHNOTFN5bFpsZjNE?=
 =?utf-8?B?MUd1N2ZtbUxFZkk5bXNBSHh0dmxnSVRWQ3RPNUxNZ2h5YmRXbGgxcmNnYkV2?=
 =?utf-8?B?VUpoQWV2OXBRN3JVNGNJWkFSdWJRKy9rRUdGZmlLYk5Oczh6U1l1WGc5Z0ds?=
 =?utf-8?B?WVRnOGYyNlFZQVJTbldxT28rcis5QjdOVVVESTRiZVBiMm83SStXN2lJaXNL?=
 =?utf-8?B?OUZHanA1TkpSNUZvWTd3N2E1SGxuUFBnU0IvRTVXeFBTTUw4ay9BOE0vd3Qw?=
 =?utf-8?B?ZEx1YW9aNGhVWlordVE3cDRBa1hVRjAvUTA0empOQnE5aHNoMVVVL1BLVGtZ?=
 =?utf-8?B?dFZUd1JLQWhpZ1M0aEpqazQ2Z0ZnY1dRazBmVWREMHgzYzRvUkliam52cXRI?=
 =?utf-8?B?QU42MjVibUU2Z2o5MXk4ZTRtRzl0MUJDVVR2L0prYk1CVkQ1bXhIMVZwRGVv?=
 =?utf-8?B?TGMvL0g4UW5UUnlPdmllakhsT0ViNzdOZVJqRTNpZU9HWVV5ZFh0bEVOMjVy?=
 =?utf-8?B?MWYvYzV5c3RRRi9MTzFBRlV0UmhZSFh3aDdKRlJ4YUNVMnQ4S3VoL2Nva3pZ?=
 =?utf-8?B?ZkpacWRsbmdUNXEzR3hzalE5L291Wm1JS3NZZUV6RkNvL2ZubkhFT3czZElh?=
 =?utf-8?B?MTYvV3UzaVB2YVdNM1MzdUJqUVlmKzB5QWlBaDdVamtnSW45OWQ5T2NxS3lO?=
 =?utf-8?B?Zkw4Qm82eC9DQ2lvWUV6dUF0bHZCNHdmNldpQ1JwREd3TWZYSlVyQ0J4ZG9p?=
 =?utf-8?B?d3QwSnlkYjlWU3lUZGJRUTZXVG52QnlUV3g5LzBFUEViN1JoYi9UMStTdDhy?=
 =?utf-8?B?M0o3a01rRnFROVpUVG1jaTJMVkloSm5LN0xSYlhkcU9OMDFXd0xXQksrYnVZ?=
 =?utf-8?B?Z2lEblkyY0ZMMHFoVTRreHRyZjN0MzFKSnFwNUpNTWpLeE5GaTRlWGlqWTF5?=
 =?utf-8?B?aEdNZk5LTFRDR2RqSHZWYmJEL1FFNTd0NVVoY2hETHpodkk5TW9vamJxdDE0?=
 =?utf-8?B?cnB4eXF4czQwQklPMFFlcVY1dmlERkIyQUExY3lKT0VQbnlGcUt4WlFta0px?=
 =?utf-8?B?THBvNWJZc0ZrZTdKSEE1VWQ4bnkwQmI2NzBHMkwvaWdYUHJ3Wk4wQUZmdkVB?=
 =?utf-8?B?cmZuRGdyK3llcVdReUp3YlhEeVdGNjE2NHJzNk5xWk41aDNJQ1lhMjhIdEFu?=
 =?utf-8?B?WXRWNDZ2ay9HdnBLMG5WM3NHZW1uSjlPQjVOMysyczhPTTY4YThuOXVTWUFH?=
 =?utf-8?B?aWVSdk11ZE56TG1kZmxMWUdQdWdKenNJQS9lY0pFMVBFSytHQnplSUZjTTE0?=
 =?utf-8?B?NEc4VEhLbWVaNDcwczJYa3NLSE55eWZ3WktuODZOYngxN00wVG12U284QWRF?=
 =?utf-8?B?aitsTXI2N09icmFnRTF4UzY3R1RwOUdZVnFwVFp6N3ZEbmc2QXFtSGVDSnMy?=
 =?utf-8?Q?h8mASfX/NKd4++UI4M+q7ybW+8AJbs=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c604ec0-278b-42a8-5f56-08de4507bb9e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5520.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 05:21:05.0169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5746
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/25 9:42 AM, Chao Yu via Linux-f2fs-devel wrote: >
 On 12/26/2025 10:11 PM, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >>
 During SPO tests, when mounting F2FS, an -EINVAL error was return [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.74.82 listed in wl.mailspike.net]
X-Headers-End: 1vZMju-0000vK-F5
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix IS_CHECKPOINTED flag
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

T24gMTIvMjcvMjUgOTo0MiBBTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiBPbiAxMi8yNi8yMDI1IDEwOjExIFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+PiBGcm9tOiBZ
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
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfZmx1c2hfbmF0
X2VudHJpZXMKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDoge3N0
cnVjdCBuYXRfZW50cnl9LSAKPj4gPmZsYWcgfD0gQklUKElTX0NIRUNLUE9JTlRFRCkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNQTwo+Pgo+PiBUaHJlYWQgQSBjYWxscyBm
MmZzX25lZWRfZGVudHJ5X21hcmsoc2JpLCBpbm8pLCBhbmQgdGhlIGxhc3RfZm9saW8gaGFzCj4+
IGFscmVhZHkgYmVlbiB3cml0dGVuIG9uY2UuIEhvd2V2ZXIsIHRoZSB7c3RydWN0IG5hdF9lbnRy
eX0tPmZsYWcgZGlkIG5vdAo+PiBoYXZlIHRoZSBJU19DSEVDS1BPSU5URUQgc2V0LCBjYXVzaW5n
IHNldF9kZW50cnlfbWFyayhsYXN0X2ZvbGlvLCAxKSBhbmQKPj4gd3JpdGUgbGFzdF9mb2xpbyBh
Z2Fpbi4KPj4KPj4gQWZ0ZXIgU1BPIGFuZCByZWJvb3QsIGl0IHdhcyBkZXRlY3RlZCB0aGF0IHtz
dHJ1Y3Qgbm9kZV9pbmZvfS0+YmxrX2FkZHIKPj4gd2FzIG5vdCBOVUxMX0FERFIgYmVjYXVzZSBU
aHJlYWQgQiBzdWNjZXNzZnVsbHkgd3JpdGUgdGhlIGNoZWNrcG9pbnQuCj4+Cj4+IFRoaXMgaXNz
dWUgb25seSBvY2N1cnMgaW4gYXRvbWljIHdyaXRlIHNjZW5hcmlvcywgYW5kIGRvZXMgbm90IGFm
ZmVjdAo+PiByZWd1bGFyIGZpbGUgZnN5bmMgb3BlcmF0aW9ucy4gVGhlcmVmb3JlLCBmb3IgYXRv
bWljIGZpbGUgZnN5bmMsCj4+IHNiaS0+bm9kZV93cml0ZSBzaG91bGQgYmUgYWNxdWlyZWQgdGhy
b3VnaCBfX3dyaXRlX25vZGVfZm9saW8gdG8gZW5zdXJlCj4+IHRoYXQgdGhlIElTX0NIRUNLUE9J
TlRFRCBmbGFnIGNvcnJlY3RseSBpbmRpY2F0ZXMgdGhhdCB0aGUgY2hlY2twb2ludAo+PiB3cml0
ZSBoYXMgYmVlbiBjb21wbGV0ZWQuCj4+Cj4+IEZpeGVzOiA2MDg1MTRkZWJhMzggKCJmMmZzOiBz
ZXQgZnN5bmMgbWFyayBvbmx5IGZvciB0aGUgbGFzdCBkbm9kZSIpCj4+IFNpZ25lZC1vZmYtYnk6
IFNoZW5nIFlvbmcgPHNoZW5neW9uZzFAeGlhb21pLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmlu
YmFvIExpdSA8bGl1amluYmFvMUB4aWFvbWkuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVu
ZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+IHYyOgo+PiAtIHNldF9k
ZW50cnlfbWFyayBmb3IgYXRvbWljIGZpbGUncyBsYXN0X2ZvbGlvIGluIF9fd3JpdGVfbm9kZV9m
b2xpby4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvbm9kZS5jIHwgMTQgKysrKysrKysrKy0tLS0KPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4+IGluZGV4IDQ4
MmEzNjJmMjYyNS4uMmM2MTAyYmVlMzQ5IDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL25vZGUuYwo+
PiArKysgYi9mcy9mMmZzL25vZGUuYwo+PiBAQCAtMTc3NCw4ICsxNzc0LDEzIEBAIHN0YXRpYyBi
b29sIF9fd3JpdGVfbm9kZV9mb2xpbyhzdHJ1Y3QgZm9saW8gCj4+ICpmb2xpbywgYm9vbCBhdG9t
aWMsIGJvb2wgKnN1Ym1pdHRlZAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byByZWRpcnR5X291
dDsKPj4gwqDCoMKgwqDCoCB9Cj4+IC3CoMKgwqAgaWYgKGF0b21pYyAmJiAhdGVzdF9vcHQoc2Jp
LCBOT0JBUlJJRVIpKQo+PiAtwqDCoMKgwqDCoMKgwqAgZmlvLm9wX2ZsYWdzIHw9IFJFUV9QUkVG
TFVTSCB8IFJFUV9GVUE7Cj4+ICvCoMKgwqAgaWYgKGF0b21pYykgewo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKCF0ZXN0X29wdChzYmksIE5PQkFSUklFUikpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZpby5vcF9mbGFncyB8PSBSRVFfUFJFRkxVU0ggfCBSRVFfRlVBOwo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKElTX0lOT0RFKGZvbGlvKSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0
X2RlbnRyeV9tYXJrKGZvbGlvLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYy
ZnNfbmVlZF9kZW50cnlfbWFyayhzYmksIGlub19vZl9ub2RlKGZvbGlvKSkpOwo+PiArwqDCoMKg
IH0KPj4gwqDCoMKgwqDCoCAvKiBzaG91bGQgYWRkIHRvIGdsb2JhbCBsaXN0IGJlZm9yZSBjbGVh
cmluZyBQQUdFQ0FDSEUgc3RhdHVzICovCj4+IMKgwqDCoMKgwqAgaWYgKGYyZnNfaW5fd2FybV9u
b2RlX2xpc3Qoc2JpLCBmb2xpbykpIHsKPj4gQEAgLTE5MTYsOCArMTkyMSw5IEBAIGludCBmMmZz
X2ZzeW5jX25vZGVfcGFnZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAKPj4gKnNiaSwgc3RydWN0IGlu
b2RlICppbm9kZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEZJX0RJUlRZX0lOT0RF
KSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZjJmc191cGRhdGVfaW5vZGUoaW5vZGUsIGZvbGlvKTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNldF9kZW50cnlfbWFyayhmb2xpbywKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19uZWVkX2RlbnRyeV9tYXJr
KHNiaSwgaW5vKSk7Cj4gCj4gV2hhdCBhYm91dCAhYXRvbWljIGNhc2U/Cj4gCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCFhdG9taWMgfHwgZm9saW8gPT0gbGFzdF9mb2xpbykgewo+IAoK
Rm9yICFhdG9taWMgY2FzZSwgbGFzdF9mb2xpbyBpcyBhbHdheXMgTlVMTCwgc28gd2UgZG9uJ3Qg
bmVlZCB0bwpjb25zaWRlciB0aGF0LgoKVGhhbmtzCllvbmdwZW5nLAoKPiBUaGFua3MsCj4gCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWF0b21pYykKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2RlbnRy
eV9tYXJrKGZvbGlvLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGYyZnNfbmVlZF9kZW50cnlfbWFyayhzYmksIGlubykpOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvKiBtYXkgYmUgd3JpdHRlbiBieSBvdGhlciB0aHJlYWQgKi8KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWZvbGlvX3Rlc3RfZGlydHkoZm9s
aW8pKQo+IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
