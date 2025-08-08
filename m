Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12AB1E142
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 06:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V/UdO/F1TqFpiTyO1P6zZe9YxaY+ByGEBoDosbqzog=; b=LM2OdkT3f5HXXXNUv9oIx1gwpj
	59+rZ9Pv0j8TaFjN87C2gEGvCkwPUOIMpaGAomZGYpzHZQUzFoPzhceUmy7ObOSL8aPe+pT5KXrQt
	IHqrJx9gLysb6bwmw4bOHtoqJFchZPqLx2iEkJal7tvRB95OWrbtzmIt9T+TrwQoi1gg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukElf-0007P3-G8;
	Fri, 08 Aug 2025 04:31:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1ukEld-0007Ov-1Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 04:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0CX8vESXksAOpQSKuRA7be+370dH9tGtte7N0i6/p0E=; b=g5BOGExsyL6kZg0LSZA/5imdqr
 lqgFLhCUgvrl7gUzaFlHi+UhuahwAvhmGvToREUxZKY61anTnjlSsYqyMZTdffoz0Odl/ZaJ7VwyX
 dmt/bRDdKqYbJj3QSn30TKyQeMStNNEJkhjl3VsbaIhbVoLQ0sQJk/W7Yk6jdgK0NQ5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0CX8vESXksAOpQSKuRA7be+370dH9tGtte7N0i6/p0E=; b=IKbIwBLQUVKRBMpx4T7IO9ZA1P
 qeDGTvLFrGklmjbhsWtKxH4buas+qJp9VvK+Aef1hAHrewFmZV0u4E1l1H9blpCx01cmVaOfqicev
 2aKcNqDM/xq69nkiL2omVJ0Z0W5XAS6wBsFBCUWCzgjT+L4xh5hwrnF186e/LMJ20mis=;
Received: from mail-japaneastazon11012035.outbound.protection.outlook.com
 ([52.101.126.35] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukElc-0003kF-7L for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 04:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCZjLOwkTJuFIle/IVgDpist+AD9CuDemqCb3YlI7zpgl8lfLlw5L4jhAkMVRi/18KEDQRNWPSuIkgetYrs4O6LxzYQqjWWqx57eA/8mLbOyhnDYk0bl4ezcnHGHRZAIUJWhMGa+VNxEMldEFoUB6Pwi16U66WRSkHr6ZD8uAMyTKafajWENWaYgpSrcCWp2BR1tLaa9GHMPHHeQgytw9p04Clna+QHRZrH5oIsXmj2+NWUyWAJVtFtpjejtPM89XlrxrTYn35WAR3OWM5x+otslzZMRnE0q3ozh9P5Tx8QNe1P7jZCBxf/2GOAwixxOD00KTdEN/pWyBtMD1EBLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CX8vESXksAOpQSKuRA7be+370dH9tGtte7N0i6/p0E=;
 b=X8uS54ROgbkrdQQGtWxBkFCyVEm4J6+yPWM8+TwsJTzRLVSRA6iPdBj4BYDrAxk3cRb2geOVBBCUzX0pp+Fj0/1q3TMyBCeGtThOUclFQwt2bnxdSKV+0TWEMVoEbijnsRv41LJJKfec5gvAyqdIe3O8pqyFYDgnVM5D9bmQYEl723pbqL621VRp3XVgl3c3Zn7MFsG4k0IQB9ne4UBRlOJi/CxwkKlWdQROC/AyKW1rW8lO1ppHWlUd5QAnY0ecpaXO+HJeXgaADI5T198IN2IMyeahVkcfMJJI40wSt6kAJCd0jyiQ8f4/Cvs6OV6+kz+3noPd8KDE498OEgR68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CX8vESXksAOpQSKuRA7be+370dH9tGtte7N0i6/p0E=;
 b=VDnC1EVinvxRfmo1P7wTx76Jud0Ype7b3FuqKEr720JQYtS53ZSoc2IDleotNm2DDeyAa6nuHSt4GPe1OnRcMm0BYIkJBsS78hZ8TcP40pYFPwqx+PiVsVp3ShHnueClW4/iUPdx0WfowwSHnQh4enQSADINs6aQlUY0rxdrAAlM3J3xchBvPSWXeGR6DOYIGtl8fLpOJjeXgX3v51iTUyx3+njS/a3rDM92lsuRvEpoOqbatMjlgSQnetROE2GSEeGeS/uuem+xzNEITFRSm5/wDNxBqBmyUBHTbnAFuE43rx/Hc/+s6s8urlloyCDdUw0d2gW52RFUYF1Rbt3VMQ==
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by KL1PR0601MB5446.apcprd06.prod.outlook.com (2603:1096:820:c1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 04:31:28 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 04:31:28 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
Thread-Index: AQHcB3eLVY4SVx71lUaUM/5T13XYU7RYJ4YAgAAEJoA=
Date: Fri, 8 Aug 2025 04:31:28 +0000
Message-ID: <b5610ecb-14da-4236-922f-8a913d7761de@vivo.com>
References: <20250807084442.422751-1-wangxiaojun@vivo.com>
 <7fbd778a-8676-4040-bb8f-f5417d458c7e@kernel.org>
In-Reply-To: <7fbd778a-8676-4040-bb8f-f5417d458c7e@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6845:EE_|KL1PR0601MB5446:EE_
x-ms-office365-filtering-correlation-id: bfca2da2-fa8a-4367-6ff6-08ddd634714a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|366016|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?dndrekYvQkx3UTBSN2NxajNHSlJRVmxBSDU2WFdSY2ZScnhOWS9VdjhWQjBo?=
 =?utf-8?B?UVhacGZYR1dkLzRtRWhaOFR4N3VlOEFMalRRY3czc2g1WnFXelovTUkrMWtK?=
 =?utf-8?B?RHVRYloxRnNxaXA3QkJZaDIxVVlISnA3Y0o2WDBRVFd1U2kxU2lFTThCYlB3?=
 =?utf-8?B?WUxwamk1c2o5NGJiN2JWNGFFVHUvTHhoN3BTUy9qUVl0NGtSUkEydThpQzc2?=
 =?utf-8?B?bnZRTGdBck02NFBlQVlCUTFLYjZKdXE1bGtNZXRkTlVBMmovMmdnRUczamh2?=
 =?utf-8?B?NC9KSGlJdHBReXdSRXRUdlVUd3NlZWp5SjNUQ0xNcW5VanJsWC9IeTNvQ0V0?=
 =?utf-8?B?UGozdjVkc3lTTEVqNzRxT0x6OXFGVC9KcGp4cGF2dkdKNTJqWThqeStRMmpC?=
 =?utf-8?B?d3dpNzFaRGJmeDduWTMxQ0dIcjJ0Y0ErRG9NYnh1Tm1vSkgvTU92dU5VUTRE?=
 =?utf-8?B?VG5veXQrMngzKy93ZHlIdDNpM3UzelAyVXRYSDE2aWZ5SHFwUjJLUlcwSG9v?=
 =?utf-8?B?alhmdjZFMndicmJBai9xNTJ2ZnVhbGlxQnkrbVowbkhPcUlYc1ZDcWxFMWFU?=
 =?utf-8?B?eU9pa0IzM0tJZUttSzJrT2VOaG44SVdKWnBoNUZyVnE1V2t3WHBGOW5QRXMz?=
 =?utf-8?B?U0FUMHRSTlREajAwSkxzcmhXaWdhRzNlZ2NYRGhLUE5mNzc0TDY4YUdyY2xZ?=
 =?utf-8?B?SS9PL2JIL1hIM1R4ZWQ1NGw3RVRDSW85ZTFSTm10Q3BJK0ZpcU00cEJ6NFZn?=
 =?utf-8?B?ZWpHN3l1YmR6SHVJMmROU1JHWUtZMEdJcll0Y250Y05udTRLeGtMS0ZIKzh6?=
 =?utf-8?B?VHBrQlUyYmduYnFVT24xdXNuRGZObytmTWF6eEJKazZuUFRQTXRQTDRUNUk0?=
 =?utf-8?B?QWdpdVlIV3pHdFVKVG8rT1hVNnFQVzZiZVBCWkxUalF0bTRvakZkVHBOaWRl?=
 =?utf-8?B?M1l0ekg4RERhaVE0NW1QYmkzcFErZjlRaUJvMHBTd1FXNnNJM3lIY3d2eXpJ?=
 =?utf-8?B?Z3pNZFlEQnRJLytKdlRqWVYrZG1sMS94bFhmRkdrNnZVZnBKM2c4RnlZN2RJ?=
 =?utf-8?B?MjM2K1I3K1NsdFlFditMbzRpZU1SaWljWGwyQityV3M0N2pTMEpNcEg0SDhX?=
 =?utf-8?B?aW8yUTB6ZWhQcGFuOTFSVWdGN0JtUlFVSHYzOXVCVytMbk00VWZkRkN5Tksv?=
 =?utf-8?B?WHNYZE1wUGVtT2NiVkpJdzBDZ2FHWU9May9UQ0N3VlRSTG9DOXZJcFBSdFdK?=
 =?utf-8?B?b1Z1REtGK2R6L21jVjBxVEc0dEFjbnViNWhqS3VBM2thWG1uRHUyaWZacGV3?=
 =?utf-8?B?aXNHbE5WMmZOby9ONlVXWmJWRkRoSm9ycDczMHpmSGxiRnl6T3lhaEcvWjZO?=
 =?utf-8?B?cmNtcUswU3VMODN3WlkyOE1XVUZ3K0FuUWduMXJDN0t2OG5GTGFUV0ZsV2hp?=
 =?utf-8?B?cXltcHMzQ2UvcWpDWHJBYnB5SmREaWxPUVNjMjY5K1JnUlRjdjdzYVZaT0hx?=
 =?utf-8?B?VkpaYWdTQ0RobXprajNielo4RDB0c3J1Y2VZazJaZ0NvaVp4eVlLSkxuM1Bl?=
 =?utf-8?B?ZGJRR0NzNFNNZkR1Y2U4WFkvQVV6N05QVWJFcFBNekFZLy9tbVdhalBwQWxG?=
 =?utf-8?B?K2xmdTJzeC8wUWsvQjgzMFk0cXBueXVnZVFPVXFNck9kcFdvK0xjdDNxVUgz?=
 =?utf-8?B?L1dVVEJOek02TWxRSmNUQW8yRUxNS1lGMFhkd0dLdkFNUlB2UnFNbDgrQ0Ew?=
 =?utf-8?B?ZlZhM2JEbVlMeUlFaVk3UVFCNkRXTWdnakU4VC9TSkNHYi9VbVVvUS9VcDFp?=
 =?utf-8?B?SE1IdXJXdUNtL0NteVZNWkM0a0dPU1dsM0poNUZMSGhuME1mK1l6VEowMlJv?=
 =?utf-8?B?OGw2aHF2R3FtQ0gwL3ZoWSttT3ptOC9LUWRjaWEvMlZTTS9xS2lJbjNPWDA2?=
 =?utf-8?B?dDNwZFMzYW9INm5TOGpjRFlIWlovN0Y2cnQ3b0ZoNXVobnRHaGpHeDNYc1Q5?=
 =?utf-8?B?MDhGckt5ck93PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(42112799006)(366016)(376014)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWc1NmpCZ3ZvakxLR3BMMHZoZDN5VmcyQnZ0Ry93Nkg1Zk9KWlEvUXVkRGFO?=
 =?utf-8?B?OWY3c2lhUENxaTV0RE1oandxcEIxK1JZd015bjAwK28xM2QyMXRRemdINmVn?=
 =?utf-8?B?YmlRN3ByUkJZaEZHSkVMeVhLb2RUM25VS0xiQ1VmbmQvZ0JhQzBXL3FXYXgr?=
 =?utf-8?B?clVXREFPN1V5NlVIN1FJZXlPZ0syMHVSSFluTTh5T0xSaVpneFA2VlJORXFK?=
 =?utf-8?B?bVdzNUUzMWM3RjZHaWN5cGlyWlJZTTY3UzZ1ZEc3RldoNDJYYkpLT0p2U2JN?=
 =?utf-8?B?MzBFTEtLNUxtbTJ6cVlHKzF1M0xaTTQwT3NWT3J1ZUZvZWpjV1hPNTZFR01z?=
 =?utf-8?B?NjNsRU1KRDIvbGd0RlNwTlFiY1JpOWpiT3FXZytRdkNXVDdPR1I4S2xlZjFP?=
 =?utf-8?B?eXg0ZGhWWFJhVjJPRGNQcVU2MWJYVFlZbkErcmF1dVA2V21oRzhPRUgrNTli?=
 =?utf-8?B?MTJMQlFhQXVSb3dZVk1ZZ3orTnlKQThTOEh1VnE0empwbE51blRXV0p3M3ZH?=
 =?utf-8?B?dHJUdlNSZXVSaWNzMTRoVjdPYWhFdGg5ek9XZzFBTkNOQWVHMmZoUGxsWHRa?=
 =?utf-8?B?SjV6RTh0eGNxb25wR21kZTJNWU40V1drMnBzOE9nL1RRTHRTL3JsTlpyQkVt?=
 =?utf-8?B?aXoxQzllRm40dFlLemo2RS9TZ3VzUFBYVlY4VFd0Lzc5cDFraWxNSmd1YXhi?=
 =?utf-8?B?KzVTWWN0bUFDeTJYbmN0cUxodmpac0UzUU42NE1JSXA0dG5uVTN3eForVFNW?=
 =?utf-8?B?R3hlc085UWw5aHk3YmMxSStqbW91Q2h4NHB2SXRoZzVEYmp6ZEJLT3ZEcGNU?=
 =?utf-8?B?aXNNU1l5eVNNRVpUUVZneHdiNFZDTldXNHBMZUhtWGViQUpzYnVPdnFzaExT?=
 =?utf-8?B?QisrQlY4b01YYnlyQjNtNm1xUVFmSWRibnhLb1RzcWRibVRPdzU1RlZsNXFB?=
 =?utf-8?B?eUxnbXNWaGN2OGVGanhjTG9VUmRFV1JTY0dJNG5Hd0ZZck52ay9uVko3WENv?=
 =?utf-8?B?VXE5NURpN1MrOU92bUw3Q0wrMWgvdUdnT2NHdk1Da2FzWXVBdGlDcTlkNDBP?=
 =?utf-8?B?SXQxZDIrL29nRk0rQzhtWmVianF1cTQ2YlNSN3oraU5FVlJJWXN3VnhWeHlV?=
 =?utf-8?B?L3c3RWhjTHVhVHphUXhFTnhqOWlxK1lDMUZQKzdhS0hGTVZub0V1enZ6RUQv?=
 =?utf-8?B?b0hEanFvMHFFTFl4Tnh2MlYxS2dsaTRScUt2RVdNRVErSExTSmt1TWVSMXRt?=
 =?utf-8?B?ZkpLUEVjV1Q3cC80cVZIeGVyRVM1YTk3WlhZcUlMdWRGSktXMnFLYVYzdkQ0?=
 =?utf-8?B?Y09jOVYyRU9EZUxDWkp3NzZ2YnJQYjlxYUVoQ2FlV0V2c21HWnBBVUd2aCtS?=
 =?utf-8?B?eGpONFBqaWlxWkFqdmU3K0xqTkJ5Zmo2WXM0THJubW1NTGc1R2JGM0NIVjhW?=
 =?utf-8?B?dDcwdm1pOTRFOEdLeWJSWXZnMzdLZHc5ZWJ0TFViSHNZOS9vb2NXNFhjdHdu?=
 =?utf-8?B?S1pLV1k2a2d1eWY5ajdWZzU2Y0VkQXFUNldrRHRFaG0zeGxwait5bTArZFJJ?=
 =?utf-8?B?c0hLbEswaDB4OTZKSTB0a3JPVDd5b2t1Z05tQmtuU3lDUFgrMnk0bWpPT0Q2?=
 =?utf-8?B?Ry81ZEVSODBpMGJJdm9JcDB0T3o5VkMxUHFxTFh4WFlldzRvTWNhMzg1S29m?=
 =?utf-8?B?QUgydHljWlBjSG9KYjA5dVNDak40UXRGQWJYMzd2dm5hWUhCa2k5TnZkZ2wr?=
 =?utf-8?B?dDl4OEtLZUg5TVRIK1hpQ3B0MjZzMFJjWmJOTDFCTU5GM0pVdkE4eVdBazMy?=
 =?utf-8?B?NWJBV0VzNzBXNkVrcDdQS2FCbVdhY01jOE05SFVEWUxkdnBnZm1vbkp2WHpH?=
 =?utf-8?B?N2hmTDkzZTZZZjJXUmtUM25IZDZTbFZidDBIcEc0SnAwamhBYXk3R1RZdUhH?=
 =?utf-8?B?NFZkaXlQRm1nS0ZtN25KUUpjZXpPb09seHVSRFYwTFZ0QmZSSkZKYm55M2Yr?=
 =?utf-8?B?MjZSYUpMUW5sRGtGVkhEcEExU01WbnIySlEreXRrdUljKzd6S3ZZaEpYNzkw?=
 =?utf-8?B?TTQyN3hXZ0xOWk5WOWk3WGxkallCS09oWlNkTXpGbmRZUGlQaWZVWFQ1NmtW?=
 =?utf-8?Q?pJPE=3D?=
Content-ID: <023CDEF3C4F57C42B88180072D5B03E9@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfca2da2-fa8a-4367-6ff6-08ddd634714a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 04:31:28.3601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ds7Ro8w415+uoW59n7zC17nI20FdYisjvk7M0suLr2LavB3OsCG/UvQsnLbO9GjO5lKyIieW/affpMlWUW0vaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5446
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/8/8 12:16, Chao Yu 写道: > Xiaojun, > > I just
   notice generic/483 will fail w/ this change, can you please take a > look?
    > > Thanks, Hi Chao, OK, Thanks for pointing out the issue. 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [52.101.126.35 listed in wl.mailspike.net]
X-Headers-End: 1ukElc-0003kF-7L
Subject: Re: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
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

5ZyoIDIwMjUvOC84IDEyOjE2LCBDaGFvIFl1IOWGmemBkzoNCj4gWGlhb2p1biwNCj4NCj4gSSBq
dXN0IG5vdGljZSBnZW5lcmljLzQ4MyB3aWxsIGZhaWwgdy8gdGhpcyBjaGFuZ2UsIGNhbiB5b3Ug
cGxlYXNlIHRha2UgYQ0KPiBsb29rPw0KPg0KPiBUaGFua3MsDQoNCkhpIENoYW8sDQoNCk9LLMKg
VGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhlIGlzc3VlLg0KDQo+DQo+DQo+IE9uIDgvNy8yMDI1
IDQ6NDQgUE0sIFdhbmcgWGlhb2p1biB3cm90ZToNCj4+IFRoaXMgcGF0Y2ggZml4ZXMgbWlzc2lu
ZyBzcGFjZSByZWNsYW1hdGlvbiBkdXJpbmcgdGhlIHJlY292ZXJ5IHByb2Nlc3MuDQo+PiBJbiB0
aGUgZm9sbG93aW5nIHNjZW5hcmlvcywgRjJGUyBjYW5ub3QgcmVjbGFpbSB0cnVuY2F0ZWQgc3Bh
Y2UuDQo+PiBjYXNlIDE6DQo+PiB3cml0ZSBmaWxlIEEsIHNpemUgaXMgMUcgfCBDUCB8IHRydW5j
YXRlIEEgdG8gMU0gfCBmc3luYyBBIHwgU1BPDQo+Pg0KPj4gY2FzZSAyOg0KPj4gQ1AgfCB3cml0
ZSBmaWxlIEEsIHNpemUgaXMgMUcgfCBmc3luYyBBIHwgdHJ1bmNhdGUgQSB0byAxTSB8IGZzeW5j
IEEgDQo+PiB8U1BPDQo+Pg0KPj4gRHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLCBGMkZTIHdp
bGwgcmVjb3ZlciBmaWxlIEEsDQo+PiBidXQgdGhlIDFNLTFHIHNwYWNlIGNhbm5vdCBiZSByZWNs
YWltZWQuDQo+Pg0KPj4gRml4ZXM6IGQ2MjRjOTZmYjMyNDkgKCJmMmZzOiBhZGQgcmVjb3Zlcnkg
cm91dGluZXMgZm9yIHJvbGwtZm9yd2FyZCIpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogV2FuZyBY
aWFvanVuIDx3YW5neGlhb2p1bkB2aXZvLmNvbT4NCj4+IC0tLQ0KPj4gdjM6IEFkZCBhIEZpeGVz
IGxpbmUuDQo+PiB2MjogQXBwbHkgQ2hhbydzIHN1Z2dlc3Rpb24gZnJvbSB2MS4gTm8gbG9naWNh
bCBjaGFuZ2VzLg0KPj4gdjE6IEZpeCBtaXNzaW5nIHNwYWNlIHJlY2xhbWF0aW9uIGR1cmluZyB0
aGUgcmVjb3ZlcnkgcHJvY2Vzcy4NCj4+IC0tLQ0KPj4gwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDC
oCB8wqAgMSArDQo+PiDCoCBmcy9mMmZzL3JlY292ZXJ5LmMgfCAxOCArKysrKysrKysrKysrKysr
Ky0NCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oDQo+
PiBpbmRleCA0NmJlNzU2MDU0OGMuLjI4ZmNlNTkxOThjZSAxMDA2NDQNCj4+IC0tLSBhL2ZzL2Yy
ZnMvZjJmcy5oDQo+PiArKysgYi9mcy9mMmZzL2YyZnMuaA0KPj4gQEAgLTQ1OSw2ICs0NTksNyBA
QCBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaW5vZGUg
Kmlub2RlO8KgwqDCoCAvKiB2ZnMgaW5vZGUgcG9pbnRlciAqLw0KPj4gwqDCoMKgwqDCoCBibG9j
a190IGJsa2FkZHI7wqDCoMKgIC8qIGJsb2NrIGFkZHJlc3MgbG9jYXRpbmcgdGhlIGxhc3QgZnN5
bmMgKi8NCj4+IMKgwqDCoMKgwqAgYmxvY2tfdCBsYXN0X2RlbnRyeTvCoMKgwqAgLyogYmxvY2sg
YWRkcmVzcyBsb2NhdGluZyB0aGUgbGFzdCANCj4+IGRlbnRyeSAqLw0KPj4gK8KgwqDCoCBsb2Zm
X3QgbWF4X2lfc2l6ZTvCoMKgwqAgLyogcHJldmlvdXMgbWF4IGZpbGUgc2l6ZSBmb3IgdHJ1bmNh
dGUgKi8NCj4+IMKgIH07DQo+PiDCoCDCoCAjZGVmaW5lIG5hdHNfaW5fY3Vyc3VtKGpubCkgKGxl
MTZfdG9fY3B1KChqbmwpLT5uX25hdHMpKQ0KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvcmVjb3Zl
cnkuYyBiL2ZzL2YyZnMvcmVjb3ZlcnkuYw0KPj4gaW5kZXggNGNiM2E5MTgwMWI0Li42OGI2MmM4
YTc0ZDMgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZzL3JlY292ZXJ5LmMNCj4+ICsrKyBiL2ZzL2Yy
ZnMvcmVjb3ZlcnkuYw0KPj4gQEAgLTk1LDYgKzk1LDcgQEAgc3RhdGljIHN0cnVjdCBmc3luY19p
bm9kZV9lbnRyeSANCj4+ICphZGRfZnN5bmNfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LA0KPj4gwqDCoMKgwqDCoCBlbnRyeSA9IGYyZnNfa21lbV9jYWNoZV9hbGxvYyhmc3luY19lbnRy
eV9zbGFiLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdG
UF9GMkZTX1pFUk8sIHRydWUsIE5VTEwpOw0KPj4gwqDCoMKgwqDCoCBlbnRyeS0+aW5vZGUgPSBp
bm9kZTsNCj4+ICvCoMKgwqAgZW50cnktPm1heF9pX3NpemUgPSBpX3NpemVfcmVhZChpbm9kZSk7
DQo+PiDCoMKgwqDCoMKgIGxpc3RfYWRkX3RhaWwoJmVudHJ5LT5saXN0LCBoZWFkKTsNCj4+IMKg
IMKgwqDCoMKgwqAgcmV0dXJuIGVudHJ5Ow0KPj4gQEAgLTc5Niw2ICs3OTcsNyBAQCBzdGF0aWMg
aW50IHJlY292ZXJfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIA0KPj4gc3RydWN0IGxp
c3RfaGVhZCAqaW5vZGVfbGlzdCwNCj4+IMKgwqDCoMKgwqAgd2hpbGUgKDEpIHsNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZnN5bmNfaW5vZGVfZW50cnkgKmVudHJ5Ow0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBmb2xpbyAqZm9saW87DQo+PiArwqDCoMKgwqDCoMKgwqAgbG9m
Zl90IGlfc2l6ZTsNCj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWYyZnNfaXNfdmFsaWRf
YmxrYWRkcihzYmksIGJsa2FkZHIsIE1FVEFfUE9SKSkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOw0KPj4gQEAgLTgyOCw2ICs4MzAsOSBAQCBzdGF0aWMgaW50IHJlY292ZXJf
ZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIA0KPj4gc3RydWN0IGxpc3RfaGVhZCAqaW5v
ZGVfbGlzdCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWNvdmVyZWRfaW5vZGUrKzsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlfc2l6
ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5LT5pbm9kZSk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoZW50cnktPm1heF9pX3NpemUgPCBpX3NpemUpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGVudHJ5LT5tYXhfaV9zaXplID0gaV9zaXplOw0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIH0NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZW50cnktPmxhc3RfZGVudHJ5ID09
IGJsa2FkZHIpIHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHJlY292ZXJf
ZGVudHJ5KGVudHJ5LT5pbm9kZSwgZm9saW8sIGRpcl9saXN0KTsNCj4+IEBAIC04NDQsOCArODQ5
LDE5IEBAIHN0YXRpYyBpbnQgcmVjb3Zlcl9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gDQo+PiAq
c2JpLCBzdHJ1Y3QgbGlzdF9oZWFkICppbm9kZV9saXN0LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IH0NCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZWNvdmVyZWRfZG5vZGUrKzsNCj4+IMKgIC3CoMKg
wqDCoMKgwqDCoCBpZiAoZW50cnktPmJsa2FkZHIgPT0gYmxrYWRkcikNCj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoZW50cnktPmJsa2FkZHIgPT0gYmxrYWRkcikgew0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaV9zaXplID0gaV9zaXplX3JlYWQoZW50cnktPmlub2RlKTsNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIChlbnRyeS0+bWF4X2lfc2l6ZSA+IGlfc2l6ZSkgew0KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBmMmZzX3RydW5jYXRlX2Jsb2Nrcyhl
bnRyeS0+aW5vZGUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlfc2l6ZSwgZmFsc2UpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoZXJyKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZjJmc19mb2xpb19wdXQoZm9saW8sIHRydWUpOw0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfbWFy
a19pbm9kZV9kaXJ0eV9zeW5jKGVudHJ5LT5pbm9kZSwgdHJ1ZSk7DQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X21vdmVfdGFp
bCgmZW50cnktPmxpc3QsIHRtcF9pbm9kZV9saXN0KTsNCj4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+
PiDCoCBuZXh0Og0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJhX2Jsb2NrcyA9IGFkanVzdF9wb3Jf
cmFfYmxvY2tzKHNiaSwgcmFfYmxvY2tzLCBibGthZGRyLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5leHRfYmxrYWRkcl9vZl9ub2RlKGZvbGlvKSk7DQo+
DQoNCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
