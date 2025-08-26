Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC1B35136
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Aug 2025 03:49:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Dw3Jq2MfynP9HfYAeCPsGAal5H1cuCROpAqr5dTF6Y=; b=B9GHJSwtcqeV1Mhfzcz69BiTCY
	ZrGPV7LxHCvWfUQEpY/I/Bd55KvNql+UoEBPfLxvkTvXkayfrorrgPm3SeZyHhvjzz6fl7MrFPAYX
	/NBRYEd1ItGu86raJ+WVIlkTtVwK5LIgKIGplGk1q58MZ/m1Fd1tGJnUXk/gKSqfsbXk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqinv-0003Wx-3a;
	Tue, 26 Aug 2025 01:48:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1uqins-0003Wo-QK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Aug 2025 01:48:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WCGHJ1piPACh1qps1cWSwMy8IJkIgGRnXC05ajEzAuk=; b=heIEECGMeuqY4Sh934RiUUNu1U
 uADH9RckGBnH23973lfZH16jFZaERqd3+yzDpqNTne8rbR9Plqc3Yenhi/YToUjBefVSPHqPmp9tp
 vhTTpA0/bo8jxBsAvfQZlwJpofRRpnJk4EAaSkvWth+aPnyTOrkVni3kUqwgzk1JFC54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WCGHJ1piPACh1qps1cWSwMy8IJkIgGRnXC05ajEzAuk=; b=NgfcTHon2hRPAUmFW5sIFoyhmg
 g3j6v1nr6UX1A0gXSDYrF03tXjR4kZCF5fIuRNjRpKwQn3I3QbO3QHUDTr4TorR4ea0tu2Php+MPD
 SS+T2olxVRVSKT3A/7dKE+d0y2NSEt/f2265ES3wl9SbnoPvde5+FJ83O3zNiFFhTByQ=;
Received: from mail-japaneastazon11012000.outbound.protection.outlook.com
 ([52.101.126.0] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uqinr-0001Kc-S1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Aug 2025 01:48:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shDuiNFxhEiEgy2gavl0lY5m4DZAzJWLf+FoXc1Dgzw0y5ZkOh1GG00Ib7rTfprZgmEUnihBoG3sqrfqvfDb6cmBO2oY4AGUonUDLI3Muq88hb8Uhb4iI+Pib8gKTVzgN9ScAob0F12tk4xTwlSJzG8hBmNxE1TLU6QEwA115QFaE2akiJU4L5Y78IIBBVJfdQb0KVcF3q31DczjaDc6OSAYXPCxxsAqxxD1g+9LeS8luQerpzXlZgiW3YCP37fQbGrQyOvGRXbA/7ij1F8kzI46IM+ne12CFhYd8E0mMEsG9FHt4IC6ixtuCpg9/d9r7yqWqjw4QW3arr/sPymGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCGHJ1piPACh1qps1cWSwMy8IJkIgGRnXC05ajEzAuk=;
 b=njH7gh5jD2RvVhdIFOXIBPBKy3F+AiT9V5GU+e+259GsWlJx7kMOulTq/8iFMjAzIw1Bo/LgTX7UPlTDHlzNmZke+3SKE9IvKW1V1chfPJk9wmyWwFcDVMD2g21YEGR3iLcRcs3YMBz8j/5C6bUz7FD+xYBJN7RG6Hk1jUm4DuxZTMJD3p67a3TH9F7R4TYTFU+UvKn0Aa1kyTtdIZ35uL5Vy3lylAniNq/iSP6m/njeOask5wbxs57azChs5WDEaRsteIL3Fiaaz3xd7ZuW9It9TMOrklCASWxpt57dnqNOhX/jXMjAFuTrc3oafl9pxkhjJYdaTNm/wt+opSS2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCGHJ1piPACh1qps1cWSwMy8IJkIgGRnXC05ajEzAuk=;
 b=n39dms0i1e3gB7WBSOWKPQWIUeG94AiD5eu4kx+sjhFVe8fghpKGpXSsf/dEYVlntPz2/jLGVXBFTGu3KCTbe9IDiKEhJgVIQ12DbIGqcJvoLjLenK0JT6Pi8CWWXDYKN7d8Zys/a0u0zFOrI/jXKDDjrOKsXEtJXu1uew2r3E7CYj3t3bKMkJS6d/YJWZcVeSbEYLC2avAwfSbuX5TEm8gi3aclDOs+uMhQnUuVkBp5ImDZFUqc5hQmRt/hnoirayKfZpnG2HnkMC9TVxzb02/vY5o4zuHIANwOrsIBWsGlMkyMkfT9bdN744nAuyWZ4rg6e/aLB+RRChducR4JqA==
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by SEYPR06MB5400.apcprd06.prod.outlook.com (2603:1096:101:8d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 01:48:35 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 01:48:34 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during
 the recovery process
Thread-Index: AQHcEae4/QBW+zQuskmLaGzt9Idjh7RypxMAgAGMrgA=
Date: Tue, 26 Aug 2025 01:48:34 +0000
Message-ID: <234d4f23-5ce4-426e-9b3c-5f2b28d86a3f@vivo.com>
References: <20250820075444.378907-1-wangxiaojun@vivo.com>
 <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
In-Reply-To: <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6845:EE_|SEYPR06MB5400:EE_
x-ms-office365-filtering-correlation-id: 982af885-884b-4ca9-a67f-08dde442ab4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|42112799006|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S0I2aVRhVW1uNllyZjA2NHBiYkswenpXRkt3ZUVmRWQ4RlBURys0cTNzbjhy?=
 =?utf-8?B?bXFxQWpTWHVUZ1BuQ3ArUGpnT3cxVUdBMGdTVnVSTEJHcVRVQ0Iwd3Q1Nkdj?=
 =?utf-8?B?MkRvbU9NQzQ5NHYwTThVdzkvTDhZeTFEVk1zTzFDQTlpd2ZRVkJvSWlyeUM1?=
 =?utf-8?B?eGNNUTNsV3pIR01DOE8rTEUxemdVUjFHOFY3SGhQenV1enN5dHhTRXR2YkU5?=
 =?utf-8?B?WU5MSisvNUY3cXNrNEZGenZSSVYreHhhditFZ0FIdGdkZGxVdEF6NFlVOWVz?=
 =?utf-8?B?dDEyR3JoWDlvaW5xbUtxM2FLOEFscDdBYVVCZHUwTk5odERvUG9Ubmc2WnBt?=
 =?utf-8?B?T0c5eXAxcWFhNmJqbGtGSEdWZmh4OEhIWWoxcmZHRWo3Zi9jeWFPLzk1VDgy?=
 =?utf-8?B?MW1LUUw2b2pldldZTkVXSzVWYmszVWRXbVBnN1VxNlFVc0xCV0sxa2lpZExH?=
 =?utf-8?B?UW40S29HS3pDdnQ1NE5VZXBEQzZuakt3aFlMUFZVM3JoL0x1UmV3TDRwUmNk?=
 =?utf-8?B?cXlHQm9mcENDN2F0V0QrMTdrckFPeXBpRW5yWE9rZ2NpMUo2NU8rQkFTZDd0?=
 =?utf-8?B?RFlpblo2Sm5KTHdZWG9PK2xwbm9raHFNYjgrYXI0QjRsbFY3dWNpcGpPblBo?=
 =?utf-8?B?bXpQcGRIZkhETFMrSUloZHpKQzE5bU93SWlZcEo5UnU3S0tnL0hmNnd0b2JS?=
 =?utf-8?B?eG9aMU84N1IzaG5pcDBhcXRuQ0N4NG9JU3BxNlliVm00VyswR0dYWitaRlZa?=
 =?utf-8?B?MnlaeENqVWlrdlZQSUtuR1RuZXZYT3h2MTluSDN5OGcwQ2xPaVZueFNKYjNH?=
 =?utf-8?B?ZEtNdjl2bHlOZ0l5WlN0YVloOGsyQkJUekxWWlRwL3ZSWjEycStrMFU3Q0lt?=
 =?utf-8?B?UXJmVXF5M3lKSllJTjZDUTh2R1lVQTM4ZUQwQTdjdk1SZTl3QlJrK2lEWGZB?=
 =?utf-8?B?TkR1a3pWL1M2K254TE5rQjBDRStFdnJNR1lOTkt5VDZ2MGpMYjBMK21vakN1?=
 =?utf-8?B?QkdRTUV1cWhSUGZTd0lhN3lSMXFyRDNnS1Z3dFNac1dXb0R1b0ZqYkhDUGxl?=
 =?utf-8?B?cVZUZW5Qb2pyWmZJYXZ0SHVxeDYrMWE3SUkyS0NkZExTM2dId1pEOFpVSHc1?=
 =?utf-8?B?SXlzUG5KOW1WODRaMVlIUDdLcmpvUjhyYjMrR2o4VEhWeEVLM2V6SDQ5Q2lm?=
 =?utf-8?B?dkpjT3I4VXdLclJuWGVVRTRtWVF0WFlGb21WRW9lMFhoVysvdFFUM1p4UDhs?=
 =?utf-8?B?Tm90ZDgwODliY2xJblV1SHNFVExod2lFdDF1SjNUOGhFdkFvTnFMSG4zWmNv?=
 =?utf-8?B?c2xIZUMzTVRZZUJRVVhIVDE2SDlQQitTTElxejk5SnIwN2xkbVp2NG14NmJ1?=
 =?utf-8?B?QmMvNjAyOFFJalJxd1JsRTMxWmlHUEhaTncxRVo3QU80YXlWbk1WTnlFTTMw?=
 =?utf-8?B?VC91Ujg1WU5HbWJjZ3RhMUV4MXBndU5SZTgvZVJibUMyWVFnSVBsSlBNVnpU?=
 =?utf-8?B?bmFGNjRDdVRiSzlHcFZ5ZGxaUnBaTnVTaGhhcXkxTEZWeHl3aUY4YWJkakpB?=
 =?utf-8?B?eXM1S1AvOU9HQ21NeUpweklOOUQxdWtEb2o4bytIbFRodVZWT3dhVXljQmhN?=
 =?utf-8?B?djlVYWg2a0t2NUFPYXd4UGViS2pFSVgzc21sQnNtbURiN0htczZMQ0F0M0Zi?=
 =?utf-8?B?QUxHM2cwbzNONk9MdGZVc1VodnBMSStqNHI2b29VbHlCZTg0VWxwdUlUVkh3?=
 =?utf-8?B?VmUvZk0yN1FseWFnaHllRlZPRVR6akZxRk10VVlXalk0bEE1Rno2Zy9EUExK?=
 =?utf-8?B?RGNjczdMaXJaeWtVWFFOR1puU2N6RkNJRjRDcCtPMlB4QXJMenE1bytoMVh0?=
 =?utf-8?B?cmxsV0cxMlFSL0NNU2dQY0JiQTlpWnZ1cUZjQ2tqRkx4YjV2NWs4cE1oZ1h2?=
 =?utf-8?B?Y0kyM3AxMUM4djM0MDdWR2NXaERXSDhEQi9zQzZjREw4Y0V4NTgvUVg5VzRx?=
 =?utf-8?Q?001FI8tSXbduN8xMM5Rj1g4R6WwnPM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(42112799006)(366016)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzhXY1lRcG1ISmZMNGNvcW1CRmgrcS9mOWJRMmo1ZmYvQVQ2dk43NHR3U1Bj?=
 =?utf-8?B?TjZ2WDl1U0RWTDhBTk03TUlqc3lUM3J4dWJaWUlNK3NRZEo0TnhVZktFSWNT?=
 =?utf-8?B?clNYSzcxb2VqbFVWcGZLU0JWQmd3bjFGMkxuZDZnd2E5MGxCTStOcGFRWkha?=
 =?utf-8?B?c2pOd3BGa09YQXhvVDdUUmEzcDR0ek1CbncrbHZZd0hrMzcydlJBNUxGbm54?=
 =?utf-8?B?Q0RRZ1JaWFdaL3NUQ2hLWVl1MzNKQzZxYmJveVl0TDlsM3M4NGV6RkRaWHZI?=
 =?utf-8?B?TWpDUnZqc3pkSTJBdjVrem5IU0ovZlVrcUVzSXQ3RTNhV3BwVk5XczdqRXdI?=
 =?utf-8?B?dGJkZUNvRWl2ejJSVGN3MUFsbE9mWm1PeTJmSzMrWUx0TVJCd2M0eDBZenB4?=
 =?utf-8?B?R0g1SmpqY2UzWVNtZUdJdFkyNUdOYjVBR1ZyL0FnQnFTb1BvY1pQYjVVUHUv?=
 =?utf-8?B?bUJkZXFjNFhPbWZxVnpjNHV1RDMyTEI5MTlrU1grNUNyUE5hMHJ5T3ZkdWZN?=
 =?utf-8?B?d1J2ajBZdUZ4dkdMRCthb3F0dTBiSHVTR3NRWmVpQU9iNTRzcldycks4ZUls?=
 =?utf-8?B?ZjliQzkwNlVzWkgvSkdVWDlnMGgrR0hGV2xxbnZ4VitDbzI4NjR0YmU4Y3py?=
 =?utf-8?B?ZzZSVisyZVpZTVVuYmo0ZklwaTcxakZCdm9talZKVndxMG5OemZhT3EwbjRp?=
 =?utf-8?B?R201RU13NWxobnpxWjVselRXa0M1UWQyS3dubzNtMUIwL3hGVlZYTXhDZjEy?=
 =?utf-8?B?N3FBVVVSNzBTNGwvYytUN05zYjh3MHhwY1dUQVZDTWczaEsrS3ZoRVV1NVRi?=
 =?utf-8?B?ZnM1ME93NXdTZmo4WC9tMG1aMjhmZzBiRXFHV3V4WlFXYkRtVER2TG9iczNM?=
 =?utf-8?B?ZWNUZ0x1VHQ4MHJqZ0VLTGZTM0xlWDB5c205QVVwNVhqTVlNSlVBbnFEaU1K?=
 =?utf-8?B?cm5mOEZwSE5nTSt3WDNwRjhMdE9GdVJheURvdHRNZHFGbzI4L3JVMDhmOSsz?=
 =?utf-8?B?azhDWnQrbDQybGthdktWOHBSWlZjSTlGSzVxdG92MWJUazNBdlhqREdndVA4?=
 =?utf-8?B?bXVlNzNSbTVSb253dFFGdEJzSjdqL3Z2dFpJMERHelZRSHdHRllDeWJhQ2Vq?=
 =?utf-8?B?RWlHMDE1azlWcDdzUzQ5dkdHSWcwL1NtSnpyZXMzR0lVOWgrN1dJTjFrYjdi?=
 =?utf-8?B?WDZmRUVNRFBOKzVabERYaVc4VzFrNW9JQUR0c3QyYUpQQUIvUXFmZGNYZTVs?=
 =?utf-8?B?WUVML2FnazBJUmk0c3J4NGZqcXVVK3hSOE1MUnZjNTJxVEhERnBKVWFNZDZN?=
 =?utf-8?B?UHZKbDdVTnorS2l6alFnRGxKMjBscm56MUl3Uk9Nc05OUkEzMGxXK0g1TTBJ?=
 =?utf-8?B?aW5aY3h1eng4KytjVzUzNU9XTnZEN0s3czVla0QyZ0NiUGt4em1xSEFzOU43?=
 =?utf-8?B?bFZXcmdtWmI1dUVkcmtVUXdMSGJFZDlyV3BhZSsvb2Y2UENkUHlGSjNBWmhs?=
 =?utf-8?B?NGdMMXZmYWNBdnZVRUxaS3VFdDlZV1ZLUjdXTmtoTHMrNnREQ2Q5aFRkOVhW?=
 =?utf-8?B?dlhPdkIrYUZqZnVKdnRESGdmcHZZSzlsY3hZNnBDQkdRRXdETzdqLzFEVnls?=
 =?utf-8?B?V296TXRTMVVmdHdkK2g0c3JCMDUxcThVb2p0Y2hOM3hPQW1LVU9LdlBzU2JF?=
 =?utf-8?B?ampWeGNvdUs4dTlHNzhvTS92RERzcGxtSnFadlhSR0UxVWRiRDcvcnJhMEdM?=
 =?utf-8?B?QmRHcG5NOFZFbDdjM2JLMWVqMWdHYWV0d1VnODYxbnRrNjluQzFmVEQ4dFRr?=
 =?utf-8?B?Qkp4RDFyajFuYUxTbzlweTBXeWJkWm9ORmtlMmJHVHRKWTNnNEFpeitoQUhU?=
 =?utf-8?B?N1BGdHRucjN0eldWUnNxaklIamhRQWgvRzVURU93RU4xYVo4YmNtUDZ3Vklj?=
 =?utf-8?B?UnRDV1VUNzhJbEZVVTl3NzRmaXpVOUFvekN3QXFTeG04dTlNNGQ4ZWNLZ284?=
 =?utf-8?B?ZE5LNWJUaEdOYW9Gb3VsMVpjLzB4emQ0azFGQUl2K2ZYWDYyRjhqcFpLUEda?=
 =?utf-8?B?TC9KVUpUNFJPU3NMRHQ4VzhlbUJtQlNiMGNtR0Ftd21xTzRQRkxjNW9leDhQ?=
 =?utf-8?Q?CEqE=3D?=
Content-ID: <2A848BBA02FA3F4AA29CAAA5DA8FB98B@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982af885-884b-4ca9-a67f-08dde442ab4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 01:48:34.8793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CH+jg+Dr5sW5iceLHOrKDBLr7lcPP/nfnAJiOzbKvwNpb5Ap/8iBRualeqQMEX4q7Edv8Bya9oPj4Va0Ay063A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5400
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 8/25/2025 10:08 AM, Chao Yu 写道: > On 8/20/25 15:54,
    Wang Xiaojun wrote: >> This patch fixes missing space reclamation during
   the recovery process. >> >> In the following scenarios, F2FS cannot [...] 
 
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
X-Headers-End: 1uqinr-0001Kc-S1
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
From: =?utf-8?B?546L5pmT54+6?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?546L5pmT54+6?= <wangxiaojun@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDgvMjUvMjAyNSAxMDowOCBBTSwgQ2hhbyBZdSDlhpnpgZM6DQo+IE9uIDgvMjAvMjUgMTU6
NTQsIFdhbmcgWGlhb2p1biB3cm90ZToNCj4+IFRoaXMgcGF0Y2ggZml4ZXMgbWlzc2luZyBzcGFj
ZSByZWNsYW1hdGlvbiBkdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MuDQo+Pg0KPj4gSW4gdGhl
IGZvbGxvd2luZyBzY2VuYXJpb3MsIEYyRlMgY2Fubm90IHJlY2xhaW0gdHJ1bmNhdGVkIHNwYWNl
Lg0KPj4gY2FzZSAxOg0KPj4gd3JpdGUgZmlsZSBBLCBzaXplIGlzIDFHIHwgQ1AgfCB0cnVuY2F0
ZSBBIHRvIDFNIHwgZnN5bmMgQSB8IFNQTw0KPj4NCj4+IGNhc2UgMjoNCj4+IENQIHwgd3JpdGUg
ZmlsZSBBLCBzaXplIGlzIDFHIHwgZnN5bmMgQSB8IHRydW5jYXRlIEEgdG8gMU0gfCBmc3luYyBB
IHxTUE8NCj4+DQo+PiBEdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MsIEYyRlMgd2lsbCByZWNv
dmVyIGZpbGUgQSwNCj4+IGJ1dCB0aGUgMU0tMUcgc3BhY2UgY2Fubm90IGJlIHJlY2xhaW1lZC4N
Cj4+DQo+PiBCdXQgdGhlIGNvbWJpbmF0aW9uIG9mIHRydW5jYXRlIGFuZCBmYWxsb2MgY29tcGxp
Y2F0ZXMgdGhlIHJlY292ZXJ5DQo+PiBwcm9jZXNzLg0KPj4gRm9yIGV4YW1wbGUsIGluIHRoZSBm
b2xsb3dpbmcgc2NlbmFyaW86DQo+PiB3cml0ZSBmaWxlQSAyTSB8IGZzeW5jIHwgdHJ1bmNhdGUg
MjU2SyB8IGZhbGxvYyAtayAyNTZLIDFNIHwgZnN5bmMgQSB8IFNQTw0KPj4gVGhlIGZhbGxvYyAo
MjU2SywgMU0pIG5lZWQgdG8gYmUgcmVjb3ZlcmVkIGFzIHByZS1hbGxvY2F0ZWQgc3BhY2UuDQo+
Pg0KPj4gSG93ZXZlciBpbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlvcywgdGhlIHNpdHVhdGlvbiBp
cyB0aGUgb3Bwb3NpdGUuDQo+PiB3cml0ZSBmaWxlQSAyTSB8IGZzeW5jIHwgZmFsbG9jIC1rIDJN
IDEwTSB8IGZzeW5jIEEgfCB0cnVuY2F0ZSAyNTZLIHwNCj4+IGZzeW5jIEEgfCBTUE8NCj4+IElu
IHRoaXMgc2NlbmFyaW8sIHRoZSBzcGFjZSBhbGxvY2F0ZWQgYnkgZmFsbG9jIG5lZWRzIHRvIGJl
IHRydW5jYXRlZC4NCj4+DQo+PiBEdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MsIGl0IGlzIGRp
ZmZpY3VsdCB0byBkaXN0aW5ndWlzaA0KPj4gYmV0d2VlbiB0aGUgYWJvdmUgdHdvIHR5cGVzIG9m
IGZhbGxvYy4NCj4+DQo+PiBTbyBpbiB0aGlzIGNhc2Ugb2YgZmFsbG9jIC1rIHdlIG5lZWQgdG8g
dHJpZ2dlciBhIGNoZWNrcG9pbnQgZm9yIGZzeW5jLg0KPj4NCj4+IEZpeGVzOiBkNjI0Yzk2ZmIz
MjQ5ICgiZjJmczogYWRkIHJlY292ZXJ5IHJvdXRpbmVzIGZvciByb2xsLWZvcndhcmQiKQ0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWGlhb2p1biA8d2FuZ3hpYW9qdW5Adml2by5jb20+DQo+
PiAtLS0NCj4+IHY0OiBUcmlnZ2VyIGNoZWNrcG9pbnQgZm9yIGZzeW5jIGFmdGVyIGZhbGxvYyAt
aw0KPj4gdjM6IEFkZCBhIEZpeGVzIGxpbmUuDQo+PiB2MjogQXBwbHkgQ2hhbydzIHN1Z2dlc3Rp
b24gZnJvbSB2MS4gTm8gbG9naWNhbCBjaGFuZ2VzLg0KPj4gdjE6IEZpeCBtaXNzaW5nIHNwYWNl
IHJlY2xhbWF0aW9uIGR1cmluZyB0aGUgcmVjb3ZlcnkgcHJvY2Vzcy4NCj4+IC0tLQ0KPj4gICBm
cy9mMmZzL2NoZWNrcG9pbnQuYyB8ICAzICsrKw0KPj4gICBmcy9mMmZzL2YyZnMuaCAgICAgICB8
ICAzICsrKw0KPj4gICBmcy9mMmZzL2ZpbGUuYyAgICAgICB8ICA4ICsrKysrKy0tDQo+PiAgIGZz
L2YyZnMvcmVjb3ZlcnkuYyAgIHwgMTggKysrKysrKysrKysrKysrKystDQo+PiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9jaGVja3BvaW50LmMgYi9mcy9mMmZzL2NoZWNrcG9pbnQuYw0KPj4gaW5k
ZXggZGIzODMxZjdmMmY1Li43NzVlMzMzMzA5N2UgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZzL2No
ZWNrcG9pbnQuYw0KPj4gKysrIGIvZnMvZjJmcy9jaGVja3BvaW50LmMNCj4+IEBAIC0xMTUxLDYg
KzExNTEsOSBAQCBzdGF0aWMgaW50IGYyZnNfc3luY19pbm9kZV9tZXRhKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSkNCj4+ICAgCQlpZiAoaW5vZGUpIHsNCj4+ICAgCQkJc3luY19pbm9kZV9tZXRh
ZGF0YShpbm9kZSwgMCk7DQo+PiAgIA0KPj4gKwkJCWlmIChpc19pbm9kZV9mbGFnX3NldChpbm9k
ZSwgRklfRkFMTE9DX0tFRVBfU0laRSkpDQo+PiArCQkJCWNsZWFyX2lub2RlX2ZsYWcoaW5vZGUs
IEZJX0ZBTExPQ19LRUVQX1NJWkUpOw0KPj4gKw0KPj4gICAJCQkvKiBpdCdzIG9uIGV2aWN0aW9u
ICovDQo+PiAgIAkJCWlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfRElSVFlfSU5PREUp
KQ0KPj4gICAJCQkJZjJmc191cGRhdGVfaW5vZGVfcGFnZShpbm9kZSk7DQo+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaA0KPj4gaW5kZXggNDZiZTc1NjA1NDhj
Li5mNWE1NGJjODQ4ZDUgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaA0KPj4gKysrIGIv
ZnMvZjJmcy9mMmZzLmgNCj4+IEBAIC00NTksNiArNDU5LDcgQEAgc3RydWN0IGZzeW5jX2lub2Rl
X2VudHJ5IHsNCj4+ICAgCXN0cnVjdCBpbm9kZSAqaW5vZGU7CS8qIHZmcyBpbm9kZSBwb2ludGVy
ICovDQo+PiAgIAlibG9ja190IGJsa2FkZHI7CS8qIGJsb2NrIGFkZHJlc3MgbG9jYXRpbmcgdGhl
IGxhc3QgZnN5bmMgKi8NCj4+ICAgCWJsb2NrX3QgbGFzdF9kZW50cnk7CS8qIGJsb2NrIGFkZHJl
c3MgbG9jYXRpbmcgdGhlIGxhc3QgZGVudHJ5ICovDQo+PiArCWxvZmZfdCBtYXhfaV9zaXplOwkv
KiBwcmV2aW91cyBtYXggZmlsZSBzaXplIGZvciB0cnVuY2F0ZSAqLw0KPj4gICB9Ow0KPj4gICAN
Cj4+ICAgI2RlZmluZSBuYXRzX2luX2N1cnN1bShqbmwpCQkobGUxNl90b19jcHUoKGpubCktPm5f
bmF0cykpDQo+PiBAQCAtODM1LDYgKzgzNiw3IEBAIGVudW0gew0KPj4gICAJRklfQVRPTUlDX1JF
UExBQ0UsCS8qIGluZGljYXRlIGF0b21pYyByZXBsYWNlICovDQo+PiAgIAlGSV9PUEVORURfRklM
RSwJCS8qIGluZGljYXRlIGZpbGUgaGFzIGJlZW4gb3BlbmVkICovDQo+PiAgIAlGSV9ET05BVEVf
RklOSVNIRUQsCS8qIGluZGljYXRlIHBhZ2UgZG9uYXRpb24gb2YgZmlsZSBoYXMgYmVlbiBmaW5p
c2hlZCAqLw0KPj4gKwlGSV9GQUxMT0NfS0VFUF9TSVpFLAkvKiBmaWxlIGFsbG9jYXRlIHJlc2Vy
dmVkIHNwYWNlIGFuZCBrZWVwIHNpemUgKi8NCj4+ICAgCUZJX01BWCwJCQkvKiBtYXggZmxhZywg
bmV2ZXIgYmUgdXNlZCAqLw0KPj4gICB9Ow0KPj4gICANCj4+IEBAIC0xMTkzLDYgKzExOTUsNyBA
QCBlbnVtIGNwX3JlYXNvbl90eXBlIHsNCj4+ICAgCUNQX1NQRUNfTE9HX05VTSwNCj4+ICAgCUNQ
X1JFQ09WRVJfRElSLA0KPj4gICAJQ1BfWEFUVFJfRElSLA0KPj4gKwlDUF9GQUxMT0NfRklMRSwN
Cj4+ICAgfTsNCj4+ICAgDQo+PiAgIGVudW0gaW9zdGF0X3R5cGUgew0KPj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMNCj4+IGluZGV4IDQyZmFhZWQ2YTAyZC4u
ZjA4MjBmODE3ODI0IDEwMDY0NA0KPj4gLS0tIGEvZnMvZjJmcy9maWxlLmMNCj4+ICsrKyBiL2Zz
L2YyZnMvZmlsZS5jDQo+PiBAQCAtMjM2LDYgKzIzNiw4IEBAIHN0YXRpYyBpbmxpbmUgZW51bSBj
cF9yZWFzb25fdHlwZSBuZWVkX2RvX2NoZWNrcG9pbnQoc3RydWN0IGlub2RlICppbm9kZSkNCj4+
ICAgCWVsc2UgaWYgKGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhKHNiaSwgRjJGU19JKGlub2RlKS0+
aV9waW5vLA0KPj4gICAJCQkJCQkJWEFUVFJfRElSX0lOTykpDQo+PiAgIAkJY3BfcmVhc29uID0g
Q1BfWEFUVFJfRElSOw0KPj4gKwllbHNlIGlmIChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklf
RkFMTE9DX0tFRVBfU0laRSkpDQo+PiArCQljcF9yZWFzb24gPSBDUF9GQUxMT0NfRklMRTsNCj4+
ICAgDQo+PiAgIAlyZXR1cm4gY3BfcmVhc29uOw0KPj4gICB9DQo+PiBAQCAtMTk1MywxMCArMTk1
NSwxMiBAQCBzdGF0aWMgaW50IGYyZnNfZXhwYW5kX2lub2RlX2RhdGEoc3RydWN0IGlub2RlICpp
bm9kZSwgbG9mZl90IG9mZnNldCwNCj4+ICAgCX0NCj4+ICAgDQo+PiAgIAlpZiAobmV3X3NpemUg
PiBpX3NpemVfcmVhZChpbm9kZSkpIHsNCj4+IC0JCWlmIChtb2RlICYgRkFMTE9DX0ZMX0tFRVBf
U0laRSkNCj4+ICsJCWlmIChtb2RlICYgRkFMTE9DX0ZMX0tFRVBfU0laRSkgew0KPj4gKwkJCXNl
dF9pbm9kZV9mbGFnKGlub2RlLCBGSV9GQUxMT0NfS0VFUF9TSVpFKTsNCj4gWGlhb2p1biwNCj4N
Cj4gV2VsbCwgd2hhdCBhYm91dCB0aGlzIGNhc2U/DQo+DQo+IGZhbGxvYyAtayBvZnMgc2l6ZSBm
aWxlDQo+IGZsdXNoIGFsbCBkYXRhIGFuZCBtZXRhZGF0YSBvZiBmaWxlDQoNCkhpIENoYW8sDQpG
bHVzaCBhbGwgZGF0YSBhbmQgbWV0YWRhdGEgb2YgZmlsZSwgYnV0IHdpdGhvdXQgdXNpbmcgZnN5
bmMgb3IgQ1A/DQoNClRoYW5rcywNCg0KPiBldmljdCBpbm9kZQ0KPiB3cml0ZSBmaWxlICYgZnN5
bmMgZmlsZSB3b24ndCB0cmlnZ2VyIGEgY2hlY2twb2ludD8NCj4NCj4gT3IgYW0gSSBtaXNzaW5n
IHNvbWV0aGluZz8NCj4NCj4gVGhhbmtzLA0KPg0KPj4gICAJCQlmaWxlX3NldF9rZWVwX2lzaXpl
KGlub2RlKTsNCj4+IC0JCWVsc2UNCj4+ICsJCX0gZWxzZSB7DQo+PiAgIAkJCWYyZnNfaV9zaXpl
X3dyaXRlKGlub2RlLCBuZXdfc2l6ZSk7DQo+PiArCQl9DQo+PiAgIAl9DQo+PiAgIA0KPj4gICAJ
cmV0dXJuIGVycjsNCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3JlY292ZXJ5LmMgYi9mcy9mMmZz
L3JlY292ZXJ5LmMNCj4+IGluZGV4IDRjYjNhOTE4MDFiNC4uNjhiNjJjOGE3NGQzIDEwMDY0NA0K
Pj4gLS0tIGEvZnMvZjJmcy9yZWNvdmVyeS5jDQo+PiArKysgYi9mcy9mMmZzL3JlY292ZXJ5LmMN
Cj4+IEBAIC05NSw2ICs5NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgKmFk
ZF9mc3luY19pbm9kZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+PiAgIAllbnRyeSA9IGYy
ZnNfa21lbV9jYWNoZV9hbGxvYyhmc3luY19lbnRyeV9zbGFiLA0KPj4gICAJCQkJCUdGUF9GMkZT
X1pFUk8sIHRydWUsIE5VTEwpOw0KPj4gICAJZW50cnktPmlub2RlID0gaW5vZGU7DQo+PiArCWVu
dHJ5LT5tYXhfaV9zaXplID0gaV9zaXplX3JlYWQoaW5vZGUpOw0KPj4gICAJbGlzdF9hZGRfdGFp
bCgmZW50cnktPmxpc3QsIGhlYWQpOw0KPj4gICANCj4+ICAgCXJldHVybiBlbnRyeTsNCj4+IEBA
IC03OTYsNiArNzk3LDcgQEAgc3RhdGljIGludCByZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9saXN0LA0KPj4gICAJd2hpbGUgKDEp
IHsNCj4+ICAgCQlzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgKmVudHJ5Ow0KPj4gICAJCXN0cnVj
dCBmb2xpbyAqZm9saW87DQo+PiArCQlsb2ZmX3QgaV9zaXplOw0KPj4gICANCj4+ICAgCQlpZiAo
IWYyZnNfaXNfdmFsaWRfYmxrYWRkcihzYmksIGJsa2FkZHIsIE1FVEFfUE9SKSkNCj4+ICAgCQkJ
YnJlYWs7DQo+PiBAQCAtODI4LDYgKzgzMCw5IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwNCj4+
ICAgCQkJCWJyZWFrOw0KPj4gICAJCQl9DQo+PiAgIAkJCXJlY292ZXJlZF9pbm9kZSsrOw0KPj4g
KwkJCWlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5LT5pbm9kZSk7DQo+PiArCQkJaWYgKGVudHJ5
LT5tYXhfaV9zaXplIDwgaV9zaXplKQ0KPj4gKwkJCQllbnRyeS0+bWF4X2lfc2l6ZSA9IGlfc2l6
ZTsNCj4+ICAgCQl9DQo+PiAgIAkJaWYgKGVudHJ5LT5sYXN0X2RlbnRyeSA9PSBibGthZGRyKSB7
DQo+PiAgIAkJCWVyciA9IHJlY292ZXJfZGVudHJ5KGVudHJ5LT5pbm9kZSwgZm9saW8sIGRpcl9s
aXN0KTsNCj4+IEBAIC04NDQsOCArODQ5LDE5IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwNCj4+
ICAgCQl9DQo+PiAgIAkJcmVjb3ZlcmVkX2Rub2RlKys7DQo+PiAgIA0KPj4gLQkJaWYgKGVudHJ5
LT5ibGthZGRyID09IGJsa2FkZHIpDQo+PiArCQlpZiAoZW50cnktPmJsa2FkZHIgPT0gYmxrYWRk
cikgew0KPj4gKwkJCWlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5LT5pbm9kZSk7DQo+PiArCQkJ
aWYgKGVudHJ5LT5tYXhfaV9zaXplID4gaV9zaXplKSB7DQo+PiArCQkJCWVyciA9IGYyZnNfdHJ1
bmNhdGVfYmxvY2tzKGVudHJ5LT5pbm9kZSwNCj4+ICsJCQkJCQkJaV9zaXplLCBmYWxzZSk7DQo+
PiArCQkJCWlmIChlcnIpIHsNCj4+ICsJCQkJCWYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsN
Cj4+ICsJCQkJCWJyZWFrOw0KPj4gKwkJCQl9DQo+PiArCQkJCWYyZnNfbWFya19pbm9kZV9kaXJ0
eV9zeW5jKGVudHJ5LT5pbm9kZSwgdHJ1ZSk7DQo+PiArCQkJfQ0KPj4gICAJCQlsaXN0X21vdmVf
dGFpbCgmZW50cnktPmxpc3QsIHRtcF9pbm9kZV9saXN0KTsNCj4+ICsJCX0NCj4+ICAgbmV4dDoN
Cj4+ICAgCQlyYV9ibG9ja3MgPSBhZGp1c3RfcG9yX3JhX2Jsb2NrcyhzYmksIHJhX2Jsb2Nrcywg
YmxrYWRkciwNCj4+ICAgCQkJCQluZXh0X2Jsa2FkZHJfb2Zfbm9kZShmb2xpbykpOw0KDQoNCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
