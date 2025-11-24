Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 737E4C7F519
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 09:05:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oINhJydpMgKVDk4WCjrhG7kRfRQYYLCKPbdqdaxQQdM=; b=kKbVamT3EW4etbB5xy3gxHaEcv
	cpTYH/erPp+uUwFeSBXPuICzr3hwc4qFipuvIW407U5nyVMBxgoahEt4sXR+LW6+jBHQ4Sukkp+Il
	B3tfK9AmoWegHSI61YLRDN8kU3mBZvaL/EccYB2yII9DzcCw0xNYKRwPrkDm8pCHjZug=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNRZq-0000ZP-4n;
	Mon, 24 Nov 2025 08:05:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=41613d8e1=Johannes.Thumshirn@wdc.com>)
 id 1vNRZU-0000Yw-7K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=; b=RQKxK47DVOFeLfG6jeG78b0VqA
 Gw10WZdw9PJ3t1gcR3Dp/2E/no6O5RcUwaLr/3VOGvcHeov4ErBVN+GSFqLDwI3yafduOHr/vwaPO
 LxArTpXrFz5Lf5S4HF979MBZ4uBu9WfnQH6/fspCDDSnXgRsjTc2rHZ4xK6THgLMVUHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=; b=XFBIzIjBqx3C4u4f9xwuPvoFyD
 CF4Z9dxVtMNBMFXKMhlVfSFO19IfhfqOWoOvymQLaa6waTFIo36mik8GCAut7BvvASBY52xwLyRAI
 r+q+kQtKlOWEjrF1X/l3NkdwCJEIqzzuihm6nq6SlJ6rC3wut8O1qkvy6Y+mseica7sQ=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNRZT-0005hd-Ms for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1763971515; x=1795507515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=HPMToZmBEus1apVWPox5vXHQ3wpBgb75A+clkVFxkGyda+Mm1UpeRuyL
 TaM4hcfTpzq0IJx9Lkj/7N7dIZdwtHUtU6JdoZddhTI3yNBO477ts0LZQ
 soC8KGrkvtCM6XoWaUhk5LR3nzoWKv5zhPqlnhFZvsyxncLCf5lapDib6
 BCllueydIVjZyp1yIgC0kPGScRoX38euRkoi7Z2PsdwCJo2P1v7eQELsu
 TcAmsGhcO8qcm5KMsu8fyU0EykYO2/wnDOB9slC17PkqZdsi3GYazDeTA
 IwY0uRhplDGCzRRGVIavhEAvq+y5MPCSoBs1GlrwLRCquQ7i4taD6Q0Gl Q==;
X-CSE-ConnectionGUID: F40fCWnGS4yDsa6fj0OX5Q==
X-CSE-MsgGUID: BmUqL+57ROyb5QLAXvoxEg==
X-IronPort-AV: E=Sophos;i="6.20,222,1758556800"; d="scan'208";a="132620383"
Received: from mail-westusazon11012001.outbound.protection.outlook.com (HELO
 SJ2PR03CU001.outbound.protection.outlook.com) ([52.101.43.1])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2025 15:57:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyZKESuIHxaZlAE1FhVIZYqzJYSu0ZS342NdanupHt3pHZcGdAVXJKIynB6VYGe9yPwpU0udf8tkYDKbnsF1NSLoVURrne99hr3eLVWxNc2r+84AaFNPzIZctENTkfqTvWnWhZVum7pXV2LvqjVQGazJAI7LOJCo8I4eoSe8xKVsYJQzYM4efpWgwUXb8OIExx4Im+Q6Kv/Gelmh6pUrcE4YeSv50HP5Mm6HADkKDBCiGvRNGz127602+g65LLx0ug9Ap4+4kmkpBBKbmSfzEy/Tbdiyj7KxyWzWQSoBN3pTyFrYnw8eR5gj7S5XqW3wZ5z23oOnFaik/pxOuOjA4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=g5Fytx2OOnETFe88WxbskJzxqC/k/gcKr2iazOq7iCbNUI6y/cizLAwa1CX9BclvM61j8xyvW95tP7R+JK0svNaatfiRLEm3qqVWP5MyyXssCuEwfsplBl/xaQwVC+2wCVCjLUuMbZKaeAIMVpw68J6n/MI/cfnZyRicO4IM6B0mxfzLm1sPF/tEXkH9rE8qiAAmpqNfzbMPQwxi7KBxcIqxlqCTW2fJbOKV7EXob4sPSP0fZdqJFf7LErlqe950WcuJUsOvqAS6/19V9aRSivAZpeZg1wqdwY7TeflU+u0dnNzSZYvVp8Lc4MvfAqYRzRtHfj066jJMquIDvtS13Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=Ecd0ozP57UG2XObgNBx72kVxRWiZhw3P4fEDv8junce0km7odmNnjr8fFwMeWTGXT/w1AdxBdqD1ASJSRbu4KK1ZI7GW3QdVGQ3tBt9tpz3MP98zV0M4tpUnLOEMecH8Z75GYTkZxzmzCRZtEZKUjuGcu2vcmhnKmWTvcSW4/TI=
Received: from SA0PR04MB7418.namprd04.prod.outlook.com (2603:10b6:806:e7::18)
 by DM8PR04MB8118.namprd04.prod.outlook.com (2603:10b6:5:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:57:26 +0000
Received: from SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9]) by SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 07:57:26 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, "axboe@kernel.dk"
 <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>, "snitzer@kernel.org"
 <snitzer@kernel.org>, "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "song@kernel.org" <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>,
 hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, "kch@nvidia.com"
 <kch@nvidia.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
Thread-Topic: [PATCH V2 5/5] xfs: ignore discard return value
Thread-Index: AQHcXO5kA5Zj3hls/kmM8KNG/VbnYLUBdhUA
Date: Mon, 24 Nov 2025 07:57:26 +0000
Message-ID: <9c8adabb-80f9-4bc4-afe5-a4ff42200bf0@wdc.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-6-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-6-ckulkarnilinux@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR04MB7418:EE_|DM8PR04MB8118:EE_
x-ms-office365-filtering-correlation-id: dc12bdb6-e7b1-4c7d-5123-08de2b2f1bf8
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?cTRkTVViNHZGNmZsbStLN1NMYlFsaUNVVzF0RGw4NmdXOXZVSFhxR1lpRHAr?=
 =?utf-8?B?ZG1uQ0puYWM2R1hReEdZdzl3Zk5VbGZXWDVkVVdsTHdpSWs5V0NEb28xRHJ6?=
 =?utf-8?B?MnVHbERqQkJLUWUzMVhFVU9ibjMvZ3QxUndEVmpmQ1oyKzJkM0tzRFNIVktG?=
 =?utf-8?B?ZEI2MXJ5cUVOWEp3b3NGcTZ5V3o1WlZiT3RDMHlLbTRyZDk4a1Y3STc3alNT?=
 =?utf-8?B?VEFMbFR1V1dIR1BaL294d3krdjNHdDE5QWxydWdwbU1CQmNaUVQxOEhUYitH?=
 =?utf-8?B?OEZDNlJDTTVCeXNIS011WnBmQWFmanlrb0d0VE8wYTJBcjZ4SHFSa2Qwa0lI?=
 =?utf-8?B?S0dOTEN0aVhKUG5uT1hYWEpieWI0blZzVkFOaGI5UEoxa2ZMUGpVcnQyV0dU?=
 =?utf-8?B?SXpkTERYTDBxTlF1bkR3YWdPbElORHB1NHlldm1XQ2NKcTdxK3FCejhkTHF0?=
 =?utf-8?B?cTRIV1ZVa3FHNzdDZmpGZGw2NmZnTm1RT0d3TFRKeWRBaVUrdUdpdzAxNThS?=
 =?utf-8?B?eDlOcCtzMGl1RUlIeEV3M0VIVU9tWEJBWXdjSXZDaDE5ZGJmVHBQTmhZZUd2?=
 =?utf-8?B?RUE2bHBQd3ZkUUpyTUpsT3BtakFtZFpRaVFXRk5lUE9SVnpDc0tnbVAzckNl?=
 =?utf-8?B?WTBEQWxMVE1BTEpaZitJL29zQkdyUzNMN2ZzVUllNmpCMVdVYlBiL25oUmtt?=
 =?utf-8?B?WTRSSmZWM3h2RVJaeUVLMHZkMklLVkgzVHF1cHc3V3VBLzhxaHZiaFN3Skk3?=
 =?utf-8?B?MGMyQ2xNRUxWMnBZc0NpeEZ2b2lQUVorVXhyblhvWnk1eUY0U0RJZmZxbmVC?=
 =?utf-8?B?bng5VUpoNEdvRkFUUGRoTk0vQmk4Y0NIWUJxOTBjL3Nndlo4eWxUUFZrdnUr?=
 =?utf-8?B?bCtjcmE0VlRWS2g1TzNlVHRNOVFSOGNWUkZ5dTBUQzdsREFrdWk3RVZDcytI?=
 =?utf-8?B?QXRiNnlwT2lFV3BkUzJjcmQzK1N4REpKU1NHc3dnS1FjVzBEY0NuQW5MZVZK?=
 =?utf-8?B?TW43ejl0M0Y1TFBRRk40SzNGSUVRQk1wMVA5Y3Q3YjZCZlpSNEFDZFVRUnh3?=
 =?utf-8?B?Qkl0UDZIRUZoY0tWajRmZ29CdTRIeGFtTHZwZlVLVW9RYXBlVWRYVkt1bWVP?=
 =?utf-8?B?V2VWR1RSTTd4cnVuQXYwTzU5dGZWVDFjd0l2a3FJVnk3elJHYUsvSlNCR1RK?=
 =?utf-8?B?dFBURUU4cWNNM0tqM0VHZHhZWE5tSERzUmVaYm9yeExSeFE0RmxzeGpnNG5v?=
 =?utf-8?B?R0Q1MWFMWjE0TEhsWFNrZWNHTy9QSU1JamhldkJEaVFIZk4raEZDMnUySlAz?=
 =?utf-8?B?Z3lLSGxZS3ZWaHhBVXNYcDlOVTlVZ1QwSzJhZFQzSVJGcHNjcTF4d2x0dERI?=
 =?utf-8?B?amRiMlpSUUtST1JDdU5VcFRTaEZNY2VEYndRa1l5UENscUZrMjkwQ3RiajVV?=
 =?utf-8?B?RWZuL1JLcFkzYzk4NFJ4cGc1MFpnVmIxaDI0RTk0TVdaVzJaeW5pMFRDYVk0?=
 =?utf-8?B?N0RBNzFNYTY5RTljRnE2Qi96dFRPTG1CeC83L3hOWkJSNTh5Z1BzUWl5RDdH?=
 =?utf-8?B?RnE3a0s3MHF6NGFQamZ2ejJQcU5QVkVkbjZPRUg3bG8xTFJQWnk4RUZzM2Js?=
 =?utf-8?B?aTMybnhmeVpOMjlBUUNkeGpwcFRzcEFkZVhpdXZwdWNHWk1ObDdFZHZ2V2F0?=
 =?utf-8?B?K3hpZXJSRUptQUdnOEJxaWwrUVBRZWkrTGNOZ3pPSGJ5ajlWd3IvZ2ZPTTBG?=
 =?utf-8?B?Q0hmcGhQRnMxdGlialNLbVZ2UVUrL1k4VHFwc3hUeEZrN25rTTFXUUphdERz?=
 =?utf-8?B?MW52aXlBR2g5QVdJVll4VUFyK1BSVTdGY0hTTU1HODl0TEt2czRsMlFEM1E4?=
 =?utf-8?B?YWd4czVPaWpZQi9XMFMvVU5RMERpVmF3dnNUUFI3WTB1VTZ5RHdRSzlENkRp?=
 =?utf-8?B?Q0VxWVhJb1oydTlOa1dLOXprVFlhYXYwTmhFZEIwa3hmRnBnOS9XbmhzbDdu?=
 =?utf-8?B?MGg3S2hzNm5vN0k4ejlOb3AzQzBBQkE3czM3a3VueFFoQ29tKzJxVG1QQWlM?=
 =?utf-8?B?VUlJM3BsTzJPdE5Td2NvN1dEbFZpM2NMTFlRdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR04MB7418.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHB1S09LQXphVUZ5SUdkdlNEdkVoMXozbnEzRlJtRXpqWmRGZHVKR0JzQktM?=
 =?utf-8?B?S1REWlQzaUE3MjZucVBKTHNiaUpKUlRwdGs3SE91em5tTmVwN2NKcmoyYzAy?=
 =?utf-8?B?K0x5YXNxM0Y2MnFxSDBrdytFZy9tUmNNUjdtQ1pKVVQ2dkZMbHk1MERFdWZ6?=
 =?utf-8?B?WnNuU1JuQmtRN0dWRCtLci9lWEN1WGNJa3JwRG1hcDRCYjNkUDhKc0F3RWR6?=
 =?utf-8?B?djhCSXVpVGhwVjlmaHlMRlVnZXNNTDgvMEZYM2xpZUk2QzhPYjBxM3cxU2RB?=
 =?utf-8?B?Zm1VNUVwVXhtT1ZPNk1jQ1hzdktnejV2WFRHSHhIWVM4N0p4Zll5YUZXajZC?=
 =?utf-8?B?ZGlqN1gyL055MXZMckMvWFhaUXFwa2JPYUc5MTEvc0xHNGJUNzB0V2RpNm1t?=
 =?utf-8?B?QXhrQjQyMzc4VUhnUnJrK2NnSDAyQ3BIcXlIRUZYSWpHNTNjZTZ1WUVlVGlC?=
 =?utf-8?B?bnJBZjJwWmNSYVhoa0VJa2llcGhQL1dKQmZhc1YwMkYycGtYN1U1U0xCekhm?=
 =?utf-8?B?U1RVTFIzODBxREFqWEhJbDcycmM4QVE3U256S3ZablIrQklsTE90TmJVQjBC?=
 =?utf-8?B?NlJkbEVTRDhXM0ZGbHo4RHMrdWZpc1MvQjBXYU1kK3FHM3Q4NCtua0VNSUhB?=
 =?utf-8?B?VERTUGhmUVdyRUgreWJNUDBtcGpSbEF2SXV0MFZqZytYSWZtQUo1T2ZwRXBs?=
 =?utf-8?B?THFka3huMkc3UmdVZkNpZktaYk9OZlpjSGp1eGFtRHdESlY0a0hmaFZHZ0JG?=
 =?utf-8?B?TjllOVZlNkhFK3E1MEVKZlVVTzA2WFVmNmlJdG14L3d4YUllUGhRZDFUMTA2?=
 =?utf-8?B?Ri9xcTBiUklYcmNmNTIxTmp0dXNvVXRrcmVRZlUvZHNXeUp2dlNySldHUXp2?=
 =?utf-8?B?eHEyQkkvUTJpUkZWVEhCY01xYUNBdjJpTTBJTFVwVzMwc3ZhanpaWW1oL3lp?=
 =?utf-8?B?TzlKUlJiN1U3a2M3Y24zZjdhQy8zUUdWRDRmc0tJQXNLd3hPdUVob001cHlL?=
 =?utf-8?B?WDB0bVRXU3FCaFl3aWQ3UkpKNlByK1VmZm9FaGJtdVhuZi9RbVUzU2QzenRW?=
 =?utf-8?B?bkhmbVRmanBPTStieWdycURpYzkyYXUvZ0RmQTFLbTRneXpPa0hkK2xlZmdy?=
 =?utf-8?B?M0M3MEI2WjBMcFY1UlVCa1dKcTM2Z1dodjFOTVQ5aktnTWR0aWVqS21XazZ5?=
 =?utf-8?B?REppbURsdGgvLzQzZ2lxSk11NU4vcS9zcFpWa3h5dkNXZ0hXbFRWVWJ4QlhK?=
 =?utf-8?B?Tjh0YnI0MEJ3UzdobktzUm94NldpcFRyYU1wRkdjL01mSVlWN3BVOXBYa0hq?=
 =?utf-8?B?RVpmQVhCMEhUU3ExUno2RHN2OFJXZytTdVd5MFFmWFVNVTJ5bk04ZkUzVWtP?=
 =?utf-8?B?NTdzMWdsRlhzRXUvU0xkNi9abEx2cWZtY2xvNDk2bGF6U3JZMFJydTI5VDNM?=
 =?utf-8?B?dHFUeUpDYmx3WjRKUTBOWE1DUWZsdWVORmlmTGhjZ0FSRFRpbWdxenBlZzhx?=
 =?utf-8?B?TlN5SXhaczZkVkVaeUZ2WGErZEVyNFJpTXQrTG5GekQ3eGpDOG0vSTdwdkc0?=
 =?utf-8?B?bys3aWJrclpqSUY5R04rVHcrb3Y4NVp3cVJidmJVMXA2aGJiWFhBUCs1bkNt?=
 =?utf-8?B?Tlh1ZDB2d0w3VDRJVVZFcWFhWUxxSlFBaWhlWjRvZ25tckZuZHM4Y3ErUWxn?=
 =?utf-8?B?dVVXTDhDbncvenRxcE1wY0VKME9qWTViVUdQbUV2OUtMUGJuK00vQkYxM0hh?=
 =?utf-8?B?WG42Y0QrVmdQK25HcWpjM0g3dERLeHQzR0NHQVlWc1Z1M3BLTVZ2YURQU2JG?=
 =?utf-8?B?dkxSSUh4SWdLb2dHa3JXUmFWWDlvYjJGeWs5ZURRWFJnNjNYV2JoRmlnVWw4?=
 =?utf-8?B?SWtQandYN2J4UkJGQkRVMm1vdXN0TmRzdFJKaWZ5bnFZYU9Uai9wOXhLYklo?=
 =?utf-8?B?eG9IZk5CUnl4RDQwSXJpci9TNkp3ZXNzV2RDVjJwc2xtYWF4cWpqcEM0dHFK?=
 =?utf-8?B?ajJwOHd5OTZ4TVorYm91TnZNNVoxR3R1TStNMmMyOGFPUGhLQ3htckJqclZu?=
 =?utf-8?B?SnFYMElmRkJISVF2QVc1bDhCdnc3L2MzQWFYbGRScUowcjNITklTNkZFUy8r?=
 =?utf-8?B?anJNQ2pkZ0hkQXYwK3p5d3ZmYmw2TmNXNDFEYUdTeUhkK3JuUzN2aXdzUnVL?=
 =?utf-8?B?TlE9PQ==?=
Content-ID: <9B16D7931950854DB4CDB56078C08D77@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xr2gBeIyyIj2ivbch3jdTYdjuB/AUDy/OMTHnDKvoLbHzpVg1YPMKdJlq4Es0BWxe/9rz9zKoH1x1XRrCsNTnGavNI0K8aQKftP21NfX1bpPhcZNbHD5qK6SrZP7d6pQDObvVvOgSn5lvnW9ZawSgu//uFn0dPLl/IPzsa2ixWwjtQdATErQ7i3PdTfT5dWOMXYQ2vhsoltyV487hOAMSLHf2lZf/YYkdHMaQS+XT/q/DZ8fL3mPSgnS2PJ2lVXhRgvqabiW998mTzWWw5LpjG1KD59Ez8/+Rjsj1YngGHdzUhzAgyXnVvo7yR9TtSlqTLYShCLDNoAhanzNg02oVgsldHOklYeKhn9nT4H1+ULBUUuFEUlvYhzsw392eXk+rgUdqt8eIjf7iVdx1ytJpfDccY3YhJjsNHUpeBEpDqnzCEO70ws00LHz2n3WdteDwk9yzjQc2/hwaUVWcNmkbR4Rhf3QU7B9xA6Bn/ZFVDIameUQ1v5WfCyw++L78rys3sqQuc02AnTwlk/Lt/W0mtIgvUSv9MxIT9zrMCN3wyQdDmYBWdJjl2vTy5bTJcvAVsupgY6EqC/V0vb28idmNrH2RHA672J1MNLTBtzMqck9SsOY7v/EFL7ap+q4ncO6
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7418.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc12bdb6-e7b1-4c7d-5123-08de2b2f1bf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 07:57:26.5472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LjH1B8lPdD7JWCaHupN+Ihi+0XmTbBZiOjaWoErREY5A1rrmT23/Gtx9rQqTDkijrLx+X70SVwLNfVykd/a2Hs84B18IrBvD8l75vQFjCJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8118
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good,
 Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vNRZT-0005hd-Ms
Subject: Re: [f2fs-dev] [PATCH V2 5/5] xfs: ignore discard return value
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
From: Johannes Thumshirn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Cc: "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good,

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
