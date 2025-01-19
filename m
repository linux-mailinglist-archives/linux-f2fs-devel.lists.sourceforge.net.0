Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E341A16210
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jan 2025 14:49:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tZVfp-00079P-8P;
	Sun, 19 Jan 2025 13:49:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tZVfn-00079I-Rl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Jan 2025 13:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NAaMiQQTTnBfyygvntBVMnZfj2K8H2OlKZjr9JGTlj8=; b=PchgSvpKJJLsjGyQ+N8sC6mgOp
 ss/Pd2ZCYpzdAHDWisgQkXCUv1U2n77FqprRAIq0NYzd7o4g6G+AMRU94J3h3pCawhAUuJE8geYzb
 2HUZ7UmSafxCnaGnDQN/WMGM7ZqZlwJvT9iQ4aRR7gMRs49tCk0kqxM8PaqB0PqVIudg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NAaMiQQTTnBfyygvntBVMnZfj2K8H2OlKZjr9JGTlj8=; b=cpz02VxL7gZWLcdTEnZPlZNgqM
 GzmV2o2fWxbsOoHuWIJEZIWa98Vj2sije3MSivTSmq9JlzZZ9x3oODUT2Jk3hGNtW4PLNDNBBf6Is
 FmFCTMeZE/DdV+APOjgwjpMRmazx2SK7cm2Hh0S8YlECOyWIq02YuMrNM8RcjOZOfiOo=;
Received: from mail-sg2apc01on2046.outbound.protection.outlook.com
 ([40.107.215.46] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tZVfm-00039P-N7 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Jan 2025 13:49:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxwoNZbnN18f60v0UdjuWuHg0uW5bZEW+XVs0zBjxJxEjX5HQbDb9q7ljKXL35nRPD6/Yl46WZELtnhiw80y+3g4ivccHLkW1OYQoa8qhVwuQYcevwFnY/iTEn1DvtXjydsUwxl5tzb/PVDB/5FwJLEmaQGXXABzAA3y73xaa25Yu3ajcd1h6SJMavpp5n2zgeT5E8XIJXWA0IAO7v7kegmzElGX35x1gGhxpH1bFh57lLVI50QPLzzp1/Bhy/HV7Pbe3ApvGr/Q3tC2fNshJ+NUkqQfYSV2hnH74lE5m7pMsUDxJrhcTeoFrsQBMzTLE9fQHQENe0JDe1yyiVSQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAaMiQQTTnBfyygvntBVMnZfj2K8H2OlKZjr9JGTlj8=;
 b=JqpbwLyzsS6B+zsptQJ7oggbYT4d3KAP0W5C9mrjFwW2EuUCBBOUY9Uxq6D/vViAcCNpIz8dNpE4pHMHA1M4tG06Pcf6lkeCH0HQrfzBETM/SqzoqTQscPQpKW+Sv9HDBVj/4FN+kZ7y3WeLuaX/EqfJsx64dNAhwTnOBlwWXmmqHKP4yX87q0YjdBFLIqXUsHyvxaDdtNuE4Y413+YVoOu1rsL90QHKEvDQZF0eCP5oI8yBCqClptsKezIPB2It2s0q4ob5jRjGcb2+AEAPSjVCxwHfrS7t5l/Qf2+aaHzANyeidghAMNv0IS0qucGO/5aKuAPFNlHWmQnC71RT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAaMiQQTTnBfyygvntBVMnZfj2K8H2OlKZjr9JGTlj8=;
 b=N/CdKq/4fDAn9PsJKf1AdpOgQGLDGrJN4qHu5BE/fErpeLB2zGAnChox6jJnWmAuAsM9FaGGjr0u+sJ1kED/EOpodFHxJqj1tVt4rnOCD2FNsVBe91gBdx9Wpqh60jgclBzGWztQ9CaxwQKicZYUHYSVKaf76nEZlBuDJ933ix/83TYucgc28K1ZiDBt2xZIKPrqky+yNqcQlVElHVaQfPXuariwKB1Iw1ZiJyjuEskO8+s/P5zV642KfgwOwabsjGEkG5evx08YSSZdSuv4l2/W4qZZlb1x//i+pLfGI+MF+uO+9WN3miCKShmbRVMQ6kn0CKyZ6IugNnAhLvVMUg==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by TYSPR06MB7305.apcprd06.prod.outlook.com (2603:1096:405:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.7; Sun, 19 Jan
 2025 13:34:06 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%6]) with mapi id 15.20.8377.004; Sun, 19 Jan 2025
 13:34:06 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 1/2] f2fs: fix missing discard candidates in fstrim
Thread-Index: AQHbXPx8oQ8hJSG8D0iyeVcEHNoDB7MEZI2AgABOhYCACCl+AIABZOGAgAaD0ICACW5kgA==
Date: Sun, 19 Jan 2025 13:34:06 +0000
Message-ID: <c3726bec-6c14-459f-b5c4-6e8c9fcefc1d@vivo.com>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <62b14417-1297-4ed6-9ff3-b24115d433c4@kernel.org>
 <a4523b96-56eb-4b1d-a031-ec4a67c2c42b@vivo.com>
 <677e5946-3b3e-4f4a-892a-8aa8bfb3e45b@kernel.org>
 <a73d4f97-724e-4d42-9730-6ead37af25a1@vivo.com>
 <249cf700-781b-4797-842c-fb47a48f4fce@kernel.org>
In-Reply-To: <249cf700-781b-4797-842c-fb47a48f4fce@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|TYSPR06MB7305:EE_
x-ms-office365-filtering-correlation-id: 328ca805-0f54-4a58-aad9-08dd388df24c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bnhDR25vUDhnTnNKNnp5Y0RNZ2JCQWpLWkVKYkt6aDJvQlgybEppSmtzYWhU?=
 =?utf-8?B?azJCSU0yNnJYOXhnWGpwQXNxRzZBUmFVcldGWjRoRUI5NHJZdk45NUdpK1RR?=
 =?utf-8?B?L05QdWtDb2l6K3l2SVlCV1ovc0tiZm1LblI3eUcxdUc4QVlYSm05OXpCampo?=
 =?utf-8?B?WGJraGZkUWkydTdBZHc3V2xXcHoreDZjc01xRGtCMmlpaUV5N29jQjkyQllW?=
 =?utf-8?B?OXRPdmtOamFOalNYOFcwLzEyWGkxejkxajN3TndIU3ZRU3BWakZXSzhRdlFs?=
 =?utf-8?B?TGtxbkhlL1V4YkxzWGtncFdHWXNobU82TG9iWXozblVUTFRuWWhBTVl0UjJZ?=
 =?utf-8?B?VkZvYXcrK003akVoMkEweUp6MnYrc2ZXSS90UDU2TGVLcFNXSS9ycmlmcW1v?=
 =?utf-8?B?S0pTQjVEc3lXY1F4MG9yZEFsN0JWaEpWWkE2RmEvTjdXZ013b3RVdjZJRVNO?=
 =?utf-8?B?WnZmUkN6Y0MyUjRjak95dHBkNWU3dy9IcmVpaUx3USt0NUdkSnNkOFROZXhn?=
 =?utf-8?B?U0dKdm5Oc0pYVnhVNHlZZGJEbURZcHVIRHVkR2ZrTnkwWHJ5UUlyQVRLU0Va?=
 =?utf-8?B?QWdrSkltM29UV1orY1lyZ1NzQ2NPVk5heVZ4L3c5cTFTY0kyK3FFVFc2SHVt?=
 =?utf-8?B?WXM2SmxrdWpHZEFWTzMvTzFqQzhqSSt3Z1hadFFlS2NvOEQzV2FLUmlkM01K?=
 =?utf-8?B?Zis4ZzQyaC9kY1M4aXdyc2RUUll4VDVrNm1OYy9xMWpyUVFtYVRpeEZoQ0Z1?=
 =?utf-8?B?ZlZBbjlJL0tCNHdIY0FqcllvMmFCV0E1TUlGLzlDUWs4akhVMXMvVTFEY3lL?=
 =?utf-8?B?N3BHdW04R2FHaS9EN0owbW9DRVRPSnRyb21IOTZYSEYyNWtFUXBNaGdodWRj?=
 =?utf-8?B?UEFIZmZRNjNUT05kZ2J2ajFFSFhzeTRtMkxCb0loYjljN3R0T1FiMTdlRXZi?=
 =?utf-8?B?Vlo2bEJaK3F6cFFNS2QzTm5FRlNWeW5QMnZZL3dmeHN2ZUUvYUdvV3orK29v?=
 =?utf-8?B?U3NpSWVIcjhzblJ3L29DTU0vTnowNy9Bd24yS0EvWEVZOEFnTkU1bnFzMEZ2?=
 =?utf-8?B?V3k1NWhQTXo5ZWhFRE5tUE9xYjg5YzdwUUxYVmVidG4xeUJrd2M1YjdYSEFW?=
 =?utf-8?B?VUpSZGZQb2Raek82cFhqS3Y4anhRZjVuM28yQ2M3Z0RCYWVESlhnbzBZeHBP?=
 =?utf-8?B?KzBHTC9aMGpnWFkwVVp3Ui9WbHVZZlRjZ2QzWGg2Z3RJSmpqTTJ0RFdqUnQw?=
 =?utf-8?B?UndnRjVtay9IbkpBM2dWT3Bpdm1iUlpMeUZQN1E3bmV5anRQeGR2Z0szMTJt?=
 =?utf-8?B?VWtxRXFTMENNOXMxWXlxOEVaTkdHZ2ZWdkZYdWhWVjZ0OWtqNFk1a3E5bEJz?=
 =?utf-8?B?UTBQRWNSWEgwcnFVaXlsRnl5azlTdjh3TFcvL0NWblZQcXB4dzNZb2NSU0Uz?=
 =?utf-8?B?Z2xtS1p6b3BIbng2ckFWdDVMTEcrMWh3OGk2LzlDbDIvcS9CMmFDT2p0M2Vs?=
 =?utf-8?B?MW40ZFY5aGxEOEt3SjFMMUtHR0VuQlRqcXAvOVdDNE95RnFFSElQc0cweGxS?=
 =?utf-8?B?QzZSSERER3hsekJHdjZjWm9PTFpUQXBxOFFMeWNPQjdEM1ZxNjdXREVpWU5a?=
 =?utf-8?B?ZERxQTJqNm9mYkFMTnRNYWo0SFNRNUd4WWNLN2hPZDljODZ1WU1sOHRSNEp5?=
 =?utf-8?B?NXVKeFdERkZNVWY0WFEzbWF2OXZMTXZPQzZ3eXhFTitoVktPYmNnSFp0eUdq?=
 =?utf-8?B?TmJMTElFSmI5TjZrbVVyZGJTNzhnSkVlTW9vUkpBRDVFZnM4NXBNdHErZXlp?=
 =?utf-8?B?a2dqYjNaWnZIeVlrbWJXa3JPbjcvVXNYVk5NMnU2NkZlWnViWVdqRmxTZ05t?=
 =?utf-8?B?ZGkyZWhVUUdPMHVIM0RtTUxxeHdmOTlvSzYyOTNwdDg5bFdXQVBkS1UwY3Vs?=
 =?utf-8?Q?htVlfBwvt5jPAU3zII0E/PlyeGYDapbW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkUxL2dFdndTV25JWWZna1lscC94Rmsvc3NLcmpoYi9lNTdRb0xTcUJUeEJX?=
 =?utf-8?B?bi9MUzdacDZhSWpEYXB3Z2NUQURCUWIxQXp4TVdOUTY3bml5SmkzTlZXemVQ?=
 =?utf-8?B?azVaRFpIbnRyamRXejhKbUZjZDNNdFo4K2ZmQnJsbmJKUjdBd1JIVENlcEhV?=
 =?utf-8?B?eGp2ZjZlSmhVMW5hVm54RVZTTHljR0Y1YlRxUHE0dmtIL2JSdnUxbnpvZmhs?=
 =?utf-8?B?MEhOTTk4OEkwcCtJaVE5TVhYMUhBQXhoQTBhdVhscGtpQ3FLSXBjREJjOWlK?=
 =?utf-8?B?aGZyYU14WWRUWnhOSEw0Z2FON0pCZHFoS2JPSlowSDJPMXpNWEwvUGd5akdG?=
 =?utf-8?B?eXZlWktpN3VsbHFhbnM5Yi9CN1daREgyY25rTDBCdjV1anRyQ21xT2QwWFZ1?=
 =?utf-8?B?ZUNKM0tvWFk5R2pMZmhpKzFFOXBVaXh5QWtMMnphM2RSZjBZN2RPakltR08y?=
 =?utf-8?B?bVBsTlpmdFJPN2ovbzJuLzBkUVhiQ0NBaHBzbThpeVBxVUJtelE0b3JoYTJt?=
 =?utf-8?B?L2hTYi9OQytudVdUOHZiRWtWY1hrZUFXUU1KZ0VVSk1BT0dtYkpJVzE0M3BS?=
 =?utf-8?B?UzB3TCtwRW9DU1FDbkttdkhIYWgxT3o1Y2N5VHJweVl4TC8yOGkveWZTZjli?=
 =?utf-8?B?bWR6d0VSZlBrWXpjczlDNXI4VmZmZ3pKOUN6b0N3dE50eHhWWGZEWG9KM3o5?=
 =?utf-8?B?alIwNkJEUUtobVhDOHltcmNzOHBtSlNPQkpTZ0h2Nmdtd0Vob3FPNlo1NEcz?=
 =?utf-8?B?NU5icCtlWGFyT2ViYlBseHVyM0RYSnFWUlF4U1h3ZU5ZcXBQUU8vS2I1T3d6?=
 =?utf-8?B?QW0rdFZvZU5kenFhZ2xqVEluc2ZsODRzMG9LSmZKcnB6VDhZWnhtYko3RGZq?=
 =?utf-8?B?T1NscFRydHdKbkRhdkRhV09WT3F2TEQxWnJJNVFYNmJncFZ1RUkway9UdTg4?=
 =?utf-8?B?UkF0YlpLaTVURHRXVmpaQ0xzUnE4d2dRNTV3WVRZL3BsSTdnLzRDWVMwc3U2?=
 =?utf-8?B?R2hKM2JYRUR6N2tkQnpxM0N5QmNhTmNKcUwwRmhndk5scWowVjljRTExTXll?=
 =?utf-8?B?Q1hRRUxRUUcyam82ZHYrNDJTRjBIOUJGS2M4a3E4dnR0NEI3UzlRMXp0d05V?=
 =?utf-8?B?VGk2MHFxc1g2enZRWDQwNFVERUFYN2YzSFBocXlRZmoyaFZKZ0FCbHNES3FT?=
 =?utf-8?B?SENwRUwrbGpoQlZiSmR4bUJWRzBhVVFjZTd5NVhRUWpIMm5mQy9IWTE4NjEr?=
 =?utf-8?B?eTZPVlhDZWVlTmluMkJiVEF5amdLS241NkJQb25IREJqUm1paDJDRzhIU3Uz?=
 =?utf-8?B?SFlaaUF4QlBIWXgrQzhIRzlQaEZ5ZWN5VU93Q1UxT0pSc1pyT0wxMjNxRC9L?=
 =?utf-8?B?cFpNWWxabUpYM0l1MDFKNnpPRDl3eVNCM0Rhc01PSEVzUitOR1lLSzRhV1or?=
 =?utf-8?B?Wmx3SFJKOTRkQnBla3FUTzNabXJiOFJSS1NGdHF3Rkh4ZXpmQmh0cFRhQnpw?=
 =?utf-8?B?b1A1S25KbVdBclNuOTdzYlI4WlRJSnFiLzFMdVlCWlRLcDNxT1RWTW9EdnB2?=
 =?utf-8?B?ZlZEeHlNRjc0MEtlR2orM044aWVJMzhhWStwakRHRUw5KzRoSGxubE81eVlN?=
 =?utf-8?B?REVCSlBNY1pocEVWMWFqVGtub01URHhoS1Rpc0J3Ni9vdjJTOURUdzRLSlJ2?=
 =?utf-8?B?cjNrbTBUb1hpbFcvMllDLzl0d292RFpzQlQvcktqOWhwcUVUSkhLRGxWc1Vp?=
 =?utf-8?B?Y3kyZlhSQzJMeHZyM1V5a1VZakpyUEhWNDJVVFdLTDlQS2tGeWYxVHhFYm96?=
 =?utf-8?B?eTRiY2VxRDNZSnpGcytMNjNFUzNyTmhYSjZRQmx1R2Y3MkloWWxOQktVK3Jw?=
 =?utf-8?B?cHUvYzZwRVY3dWlMRGRqV0FuUWNDenp0em1LWEdLbFJaTUtTZDk2USs0dTlF?=
 =?utf-8?B?SXdPdytQNWs1d2hNSUZNRi9nRjBNUk5BTC9iMklWWjdJdjhIK1RQYWRjYnpN?=
 =?utf-8?B?cEsrUDVoNzVsWXd6elFMYTFXS21KcVpXeXNtMUQ0Z0VySVJ1V08yOXVmWG1W?=
 =?utf-8?B?Vlo4cm5OSVgzcXhEV0J2NHlTWmk5Tkg3QXRRS3duZ00xVjYxZHhtUEV2VHBr?=
 =?utf-8?Q?aiBA=3D?=
Content-ID: <3C9B10C12760E844BE4E780C204902D9@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328ca805-0f54-4a58-aad9-08dd388df24c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2025 13:34:06.2575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+8Ub9wkfwOpfWlvQlJ/OCUCdEuQ2rrWJMJUINoERDY/TjFeJMmNDaz4nlHJZ4ElXATg9khNxc0ho9bgGSLE7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7305
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 1/13/2025 9:32 PM, Chao Yu 写道: > On 2025/1/9 18:03,
    Chunhai Guo wrote: >> 在 1/8/2025 8:46 PM, Chao Yu 写道: >>> On 2025/1/3
    16:07, Chunhai Guo wrote: >>>> 在 1/3/2025 11:26 AM, Chao Yu � [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.215.46 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.215.46 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.215.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1tZVfm-00039P-N7
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix missing discard candidates in
 fstrim
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDEvMTMvMjAyNSA5OjMyIFBNLCBDaGFvIFl1IOWGmemBkzoNCj4gT24gMjAyNS8xLzkgMTg6
MDMsIENodW5oYWkgR3VvIHdyb3RlOg0KPj4g5ZyoIDEvOC8yMDI1IDg6NDYgUE0sIENoYW8gWXUg
5YaZ6YGTOg0KPj4+IE9uIDIwMjUvMS8zIDE2OjA3LCBDaHVuaGFpIEd1byB3cm90ZToNCj4+Pj4g
5ZyoIDEvMy8yMDI1IDExOjI2IEFNLCBDaGFvIFl1IOWGmemBkzoNCj4+Pj4+IE9uIDIwMjUvMS8y
IDE4OjEzLCBDaHVuaGFpIEd1byB3cm90ZToNCj4+Pj4+PiBmc3RyaW0gbWF5IG1pc3MgY2FuZGlk
YXRlcyB0aGF0IG5lZWQgdG8gYmUgZGlzY2FyZGVkIGluIGZzdHJpbSwgYXMgc2hvd24gaW4NCj4+
Pj4+PiB0aGUgZXhhbXBsZXMgYmVsb3cuDQo+Pj4+Pj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCB3
aGVuIGNwYy0+cmVhc29uIGlzIHNldCB3aXRoIENQX0RJU0NBUkQsDQo+Pj4+Pj4gYWRkX2Rpc2Nh
cmRfYWRkcnMoKSBleHBlY3RzIHRoYXQgY2twdF92YWxpZF9tYXAgYW5kIGN1cl92YWxpZF9tYXAg
aGF2ZSBiZWVuDQo+Pj4+Pj4gc3luY2VkIGJ5IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBbMV0gYW5k
IHRyaWVzIHRvIGZpbmQgdGhlIGNhbmRpZGF0ZXMgYmFzZWQNCj4+Pj4+PiBvbiBja3B0X3ZhbGlk
X21hcCBhbmQgZGlzY2FyZF9tYXAuIEhvd2V2ZXIsIHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBkb2Vz
IG5vdA0KPj4+Pj4+IGFjdHVhbGx5IHJ1biBiZWZvcmUgZjJmc19leGlzdF90cmltX2NhbmRpZGF0
ZXMoKSwgd2hpY2ggcmVzdWx0cyBpbiBmYWlsdXJlLg0KPj4+Pj4gQ2h1bmhhaSwNCj4+Pj4+DQo+
Pj4+PiBDYW4geW91IHBsZWFzZSB1c2Ugbm9kaXNjYXJkIG9wdGlvbiBkdWUgdG8gZnN0cmltIHN0
b3BwZWQgdG8gcmV0dXJuDQo+Pj4+PiB0cmltbWVkIGxlbmd0aCBhZnRlciBiZWxvdyBjb21taXQ6
DQo+Pj4+Pg0KPj4+Pj4gNWE2MTU0OTIwZmFmICgiZjJmczogZG9uJ3QgaXNzdWUgZGlzY2FyZCBj
b21tYW5kcyBpbiBvbmxpbmUgZGlzY2FyZCBpcyBvbiIpDQo+Pj4+IFRoYW5rIHlvdSBmb3IgeW91
ciBleHBsYW5hdGlvbiwgYnV0IEkgZ3Vlc3MgdGhpcyBpc3N1ZSBpcyBub3QgcmVsZXZhbnQNCj4+
Pj4gdG8gdGhpcyBjb21taXQsIGFuZCBJIHVuZGVyc3RhbmQgdGhhdCAnMCBCICgwIGJ5dGVzKSB0
cmltbWVkJyBpcyBmaW5lLg0KPj4+Pg0KPj4+PiBUaGUgcmVhbCBwcm9ibGVtIGlzIHRoYXQgdGhl
cmUgYXJlIGFjdHVhbGx5IG1hbnkgY2FuZGlkYXRlcyB0aGF0IHNob3VsZA0KPj4+PiBiZSBoYW5k
bGVkIGluIGZzdHJpbSwgYnV0IGl0IGNhbm5vdCBmaW5kIGFueSBvZiB0aGVtLg0KPj4+Pg0KPj4+
PiBmMmZzX3RyaW1fZnMoKQ0KPj4+PiAgICAgIMKgwqDCoCBmMmZzX3dyaXRlX2NoZWNrcG9pbnQo
KQ0KPj4+PiAgICAgIMKgwqDCoMKgwqDCoMKgIC4uLg0KPj4+PiAgICAgIMKgwqDCoMKgwqDCoMKg
IGlmIChjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpIHsNCj4+Pj4gICAgICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX2V4aXN0X3RyaW1fY2FuZGlkYXRlcyhzYmksIGNw
YykpIHsNCj4+Pj4gICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1
bmJsb2NrX29wZXJhdGlvbnMoc2JpKTsNCj4+Pj4gICAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsgLy8gTm90IGNhbmRpZGF0ZSBpcyBmb3VuZCBoZXJl
IGFuZCBleGl0Lg0KPj4+PiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+
Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuLi4NCj4+Pj4gICAgICDCoMKgwqDCoMKg
wqDCoCB9DQo+Pj4+DQo+Pj4+Pj4gcm9vdCMgY3AgdGVzdGZpbGUgL2YyZnNfbW91bnRwb2ludA0K
Pj4+Pj4+DQo+Pj4+Pj4gcm9vdCMgZjJmc19pbyBmaWVtYXAgMCAxIC9mMmZzX21vdW50cG9pbnQv
dGVzdGZpbGUNCj4+Pj4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMQ0KPj4+Pj4+ICAgICAg
ICAgICAgICAgbG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAg
ICAgZmxhZ3MNCj4+Pj4+PiAwICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDQwNmEwMDAw
MCAwMDAwMDAwMDNkODAwMDAwIDAwMDAxMDAwDQo+Pj4+Pj4NCj4+Pj4+PiByb290IyBybSAvZjJm
c19tb3VudHBvaW50L3Rlc3RmaWxlDQo+Pj4+Pj4NCj4+Pj4+PiByb290IyBmc3RyaW0gLXYgLW8g
MHg0MDZhMDAwMDAgLWwgMTAyNE0gL2YyZnNfbW91bnRwb2ludCAtLSBubyBjYW5kaWRhdGUgaXMg
Zm91bmQNCj4+Pj4+PiAvZjJmc19tb3VudHBvaW50OiAwIEIgKDAgYnl0ZXMpIHRyaW1tZWQNCj4+
Pj4+Pg0KPj4+Pj4+IFsxXSBQbGVhc2UgcmVmZXIgdG8gY29tbWl0IGQ3YmMyNDg0YjhkNCAoImYy
ZnM6IGZpeCBzbWFsbCBkaXNjYXJkcyBub3QgdG8NCj4+Pj4+PiBpc3N1ZSByZWR1bmRhbnRseSIp
IGZvciB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4gc2VnX2luZm9fdG9fcmF3X3NpdCgpIGFuZA0K
Pj4+Pj4+IGFkZF9kaXNjYXJkX2FkZHJzKCkuDQo+Pj4+Pj4NCj4+Pj4+PiBGaXhlczogMjUyOTBm
YTU1OTFkICgiZjJmczogcmV0dXJuIGZzX3RyaW0gaWYgdGhlcmUgaXMgbm8gY2FuZGlkYXRlIikN
Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1bzxndW9jaHVuaGFpQHZpdm8uY29tPg0K
Pj4+Pj4+IC0tLQ0KPj4+Pj4+ICAgICAgICBmcy9mMmZzL3NlZ21lbnQuYyB8IDEwICsrKysrLS0t
LS0NCj4+Pj4+PiAgICAgICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBi
L2ZzL2YyZnMvc2VnbWVudC5jDQo+Pj4+Pj4gaW5kZXggZWFkZTM2YzVlZjEzLi44ZmU5Zjc5NGI1
ODEgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMNCj4+Pj4+PiArKysgYi9m
cy9mMmZzL3NlZ21lbnQuYw0KPj4+Pj4+IEBAIC0yMDcwLDcgKzIwNzAsNyBAQCBzdGF0aWMgaW50
IGYyZnNfaXNzdWVfZGlzY2FyZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+Pj4+Pj4gICAg
ICAgIH0NCj4+Pj4+PiAgICAgICAgDQo+Pj4+Pj4gICAgICAgIHN0YXRpYyBib29sIGFkZF9kaXNj
YXJkX2FkZHJzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNw
YywNCj4+Pj4+PiAtCQkJCQkJCWJvb2wgY2hlY2tfb25seSkNCj4+Pj4+PiArCQkJCQlib29sIHN5
bmNlZCwgYm9vbCBjaGVja19vbmx5KQ0KPj4+Pj4+ICAgICAgICB7DQo+Pj4+Pj4gICAgICAgIAlp
bnQgZW50cmllcyA9IFNJVF9WQkxPQ0tfTUFQX1NJWkUgLyBzaXplb2YodW5zaWduZWQgbG9uZyk7
DQo+Pj4+Pj4gICAgICAgIAlzdHJ1Y3Qgc2VnX2VudHJ5ICpzZSA9IGdldF9zZWdfZW50cnkoc2Jp
LCBjcGMtPnRyaW1fc3RhcnQpOw0KPj4+Pj4+IEBAIC0yMDk4LDcgKzIwOTgsNyBAQCBzdGF0aWMg
Ym9vbCBhZGRfZGlzY2FyZF9hZGRycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBj
cF9jb250cm9sICpjcGMsDQo+Pj4+Pj4gICAgICAgIA0KPj4+Pj4+ICAgICAgICAJLyogU0lUX1ZC
TE9DS19NQVBfU0laRSBzaG91bGQgYmUgbXVsdGlwbGUgb2Ygc2l6ZW9mKHVuc2lnbmVkIGxvbmcp
ICovDQo+Pj4+Pj4gICAgICAgIAlmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKQ0KPj4+Pj4+
IC0JCWRtYXBbaV0gPSBmb3JjZSA/IH5ja3B0X21hcFtpXSAmIH5kaXNjYXJkX21hcFtpXSA6DQo+
Pj4+Pj4gKwkJZG1hcFtpXSA9IHN5bmNlZCA/IH5ja3B0X21hcFtpXSAmIH5kaXNjYXJkX21hcFtp
XSA6DQo+Pj4+PiBJIGd1ZXNzIHRoaXMgY29uZGl0aW9uICJmb3JjZSA/IH5ja3B0X21hcFtpXSAm
IH5kaXNjYXJkX21hcFtpXSIgZGlkbid0IGNvdmVyDQo+Pj4+PiBhbGwgYmVsb3cgY2FzZXMsIHRo
b3VnaHRzPw0KPj4+Pj4gLSBja3B0X21hcFtpXSA9PSAwIC8vIHdyaXRlIGRhdGEsIGFuZCB0aGVu
IHJlbW92ZSBkYXRhIGJlZm9yZSBjaGVja3BvaW50DQo+Pj4+PiAtIGNrcHRfbWFwW2ldICE9IDAg
Ly8gcmVtb3ZlIGRhdGEgZXhpc3RlZCBpbiBwcmV2aW91cyBjaGVja3BvaW50DQo+Pj4+ICAgICAg
RnJvbSB0aGUgaGFuZGxpbmcgb2YgY2twdF92YWxpZF9tYXAgaW4gdXBkYXRlX3NpdF9lbnRyeSgp
LCBJIGd1ZXNzIHRoZQ0KPj4+PiBjb25kaXRpb24gY2FuIGNvdmVyIGJvdGggY2FzZXMuDQo+Pj4+
IEZvciBleGFtcGxlLCB3aGVuIHRoZSBjaGVja3BvaW50IGlzIGVuYWJsZWQsIGFsbCB0aGUgc2V0
IGJpdHMgaW4gdGhlDQo+Pj4+IGNrcHRfdmFsaWRfbWFwIHJlbWFpbiBzZXQgYmVmb3JlIHRoZSBj
aGVja3BvaW50IChldmVuIHdoZW4gdGhlIGJsb2Nrcw0KPj4+PiBhcmUgZGVsZXRlZCksIHdoaWNo
IG1ha2VzIGl0IGZpbmQgYWxsIHRoZSByaWdodCBiaXRzIGluIGJvdGggY2FzZXMuDQo+Pj4gTXkg
cG9pbnQgaXMgZm9yIGZzdHJpbSBjYXNlLCB3ZSBvbmx5IG5lZWQgdG8gY2hlY2sgZGlzY2FyZF9t
YXAgYml0bWFwPw0KPj4+IG9uY2UgYml0KHMpIGluIGRpc2NhcmRfbWFwIGJpdG1hcCBpcyB6ZXJv
LCBubyBtYXR0ZXIgdGhlIHN0YXR1cyBvZg0KPj4+IGJpdChzKSBpbiBja3B0X21hcCBiaXRtYXAs
IHdlIG5lZWQgdG8gdHJpZ2dlciBhIGNoZWNrcG9pdCBmb3IgZm9sbG93aW5nDQo+Pj4gZGlzY2Fy
ZCBzdWJtaXNzaW9uPw0KPj4gT2gsIHllcy4gSXQgaXMgcmVhc29uYWJsZSB0byBjaGVjayBvbmx5
IHRoZSBkaXNjYXJkX21hcCBiaXRtYXAuIFdoYXQgZG8NCj4+IHlvdSB0aGluayBhYm91dCB0aGUg
Y29kZSBiZWxvdz8NCj4+DQo+PiBmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKSB7DQo+PiAg
ICDCoMKgwqAgaWYgKGNoZWNrX29ubHkpDQo+PiAgICDCoMKgwqDCoMKgwqDCoCBkbWFwW2ldID0g
fmRpc2NhcmRfbWFwW2ldOw0KPj4gICAgwqDCoMKgIGVsc2UNCj4+ICAgIMKgwqDCoMKgwqDCoMKg
IGRtYXBbaV0gPSBmb3JjZSA/IH5ja3B0X21hcFtpXSAmIH5kaXNjYXJkX21hcFtpXSA6DQo+PiAg
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChjdXJfbWFwW2ldIF4gY2twdF9tYXBbaV0pICYgY2tw
dF9tYXBbaV07DQo+IEhvdyBhYm91dCB0aGlzPw0KPg0KPiBkbWFwW2ldID0gZm9yY2UgPyB+ZGlz
Y2FyZF9tYXBbaV0gOg0KPiAJKGN1cl9tYXBbaV0gXiBja3B0X21hcFtpXSkgJiBja3B0X21hcFtp
XTsNCg0KDQpJIHRoaW5rIGl0IGlzIE9LLCB0b28uIEkgYmVsaWV2ZSBpdCBpcyBpZGVudGljYWwg
Zm9yICJ+ZGlzY2FyZF9tYXBbaV0iIA0KYW5kICJ+Y2twdF9tYXBbaV0gJiB+ZGlzY2FyZF9tYXBb
aV0iIGZvciBmc3RyaW0gaGVyZS4NCg0KTW9yZW92ZXIsIEkgdGhpbmsgdGhlIGNvZGUgbG9naWMg
Y2FuIGJlIHNpbXBsaWZpZWQgZm9yIGFsbCBjYXNlcyBieSANCmZpbmRpbmcgYWxsIHRoZSBkaXNj
YXJkIGJsb2NrcyBiYXNlZCBvbmx5IG9uIGRpc2NhcmRfbWFwLCBhcyBzaG93biBpbiANCnRoZSBj
b2RlIGJlbG93LiBUaGlzIG1pZ2h0IHJlc3VsdCBpbiBtb3JlIGRpc2NhcmQgYmxvY2tzIGJlaW5n
IHNlbnQgZm9yIA0KdGhlIHNlZ21lbnQgZHVyaW5nIHRoZSBmaXJzdCBjaGVja3BvaW50IGFmdGVy
IG1vdW50aW5nLCB3aGljaCB3ZXJlIA0Kb3JpZ2luYWxseSBleHBlY3RlZCB0byBiZSBzZW50IG9u
bHkgaW4gZnN0cmltLiBSZWdhcmRsZXNzLCB0aGVzZSBkaXNjYXJkIA0KYmxvY2tzIHNob3VsZCBl
dmVudHVhbGx5IGJlIHNlbnQsIGFuZCB0aGUgc2ltcGxpZmllZCBjb2RlIG1ha2VzIHNlbnNlIGlu
IA0KdGhpcyBjb250ZXh0Lg0KDQogwqDCoMKgIGRtYXBbaV0gPSB+ZGlzY2FyZF9tYXBbaV07DQoN
Cg0KSSB3aWxsIHNlbmQgeW91IHRoZSB2MiBwYXRjaCBmb3IgcmV2aWV3Lg0KDQoNClRoYW5rcywN
Cg0KPiBUaGFua3MsDQo+DQo+DQo+PiB9DQo+Pg0KPj4gVGhhbmtzLA0KPj4NCj4+PiBUaGFua3Ms
DQo+Pj4NCj4+Pj4gVGhhbmtzLA0KPj4+Pg0KPj4+Pj4gVGhhbmtzLA0KPj4+Pj4NCj4+Pj4+PiAg
ICAgICAgCQkJCShjdXJfbWFwW2ldIF4gY2twdF9tYXBbaV0pICYgY2twdF9tYXBbaV07DQo+Pj4+
Pj4gICAgICAgIA0KPj4+Pj4+ICAgICAgICAJd2hpbGUgKGZvcmNlIHx8IFNNX0koc2JpKS0+ZGNj
X2luZm8tPm5yX2Rpc2NhcmRzIDw9DQo+Pj4+Pj4gQEAgLTMyNzUsNyArMzI3NSw3IEBAIGJvb2wg
ZjJmc19leGlzdF90cmltX2NhbmRpZGF0ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPj4+
Pj4+ICAgICAgICANCj4+Pj4+PiAgICAgICAgCWRvd25fd3JpdGUoJlNJVF9JKHNiaSktPnNlbnRy
eV9sb2NrKTsNCj4+Pj4+PiAgICAgICAgCWZvciAoOyBjcGMtPnRyaW1fc3RhcnQgPD0gY3BjLT50
cmltX2VuZDsgY3BjLT50cmltX3N0YXJ0KyspIHsNCj4+Pj4+PiAtCQlpZiAoYWRkX2Rpc2NhcmRf
YWRkcnMoc2JpLCBjcGMsIHRydWUpKSB7DQo+Pj4+Pj4gKwkJaWYgKGFkZF9kaXNjYXJkX2FkZHJz
KHNiaSwgY3BjLCBmYWxzZSwgdHJ1ZSkpIHsNCj4+Pj4+PiAgICAgICAgCQkJaGFzX2NhbmRpZGF0
ZSA9IHRydWU7DQo+Pj4+Pj4gICAgICAgIAkJCWJyZWFrOw0KPj4+Pj4+ICAgICAgICAJCX0NCj4+
Pj4+PiBAQCAtNDYxMSw3ICs0NjExLDcgQEAgdm9pZCBmMmZzX2ZsdXNoX3NpdF9lbnRyaWVzKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGNwX2NvbnRyb2wgKmNwYykNCj4+Pj4+PiAg
ICAgICAgCQkJLyogYWRkIGRpc2NhcmQgY2FuZGlkYXRlcyAqLw0KPj4+Pj4+ICAgICAgICAJCQlp
ZiAoIShjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpKSB7DQo+Pj4+Pj4gICAgICAgIAkJCQljcGMt
PnRyaW1fc3RhcnQgPSBzZWdubzsNCj4+Pj4+PiAtCQkJCWFkZF9kaXNjYXJkX2FkZHJzKHNiaSwg
Y3BjLCBmYWxzZSk7DQo+Pj4+Pj4gKwkJCQlhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgZmFs
c2UsIGZhbHNlKTsNCj4+Pj4+PiAgICAgICAgCQkJfQ0KPj4+Pj4+ICAgICAgICANCj4+Pj4+PiAg
ICAgICAgCQkJaWYgKHRvX2pvdXJuYWwpIHsNCj4+Pj4+PiBAQCAtNDY1Myw3ICs0NjUzLDcgQEAg
dm9pZCBmMmZzX2ZsdXNoX3NpdF9lbnRyaWVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3Ry
dWN0IGNwX2NvbnRyb2wgKmNwYykNCj4+Pj4+PiAgICAgICAgCQlfX3U2NCB0cmltX3N0YXJ0ID0g
Y3BjLT50cmltX3N0YXJ0Ow0KPj4+Pj4+ICAgICAgICANCj4+Pj4+PiAgICAgICAgCQlmb3IgKDsg
Y3BjLT50cmltX3N0YXJ0IDw9IGNwYy0+dHJpbV9lbmQ7IGNwYy0+dHJpbV9zdGFydCsrKQ0KPj4+
Pj4+IC0JCQlhZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgZmFsc2UpOw0KPj4+Pj4+ICsJCQlh
ZGRfZGlzY2FyZF9hZGRycyhzYmksIGNwYywgdHJ1ZSwgZmFsc2UpOw0KPj4+Pj4+ICAgICAgICAN
Cj4+Pj4+PiAgICAgICAgCQljcGMtPnRyaW1fc3RhcnQgPSB0cmltX3N0YXJ0Ow0KPj4+Pj4+ICAg
ICAgICAJfQ0KDQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
