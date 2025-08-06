Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 96252B1C287
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 10:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAace3Pq2Ad5wepT1EmzZGWLUVCk0pglTh6N/zrWJks=; b=T3TwguqWfqu6R+kGUKAuhFDxB3
	yzfEm0JGcoQdRQ8iFxC59NBekxpE0KNunSqm8eBgucb8y4ULWf0EpFLv7+VfBkHukPfCVbLkb7c9S
	y9sxNPO0FOxIkjzJJA7zPijtoDrdTiVEnBcvW8LmQ3hYbt9pRYVLTYNWy6G1jfw4QiPg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujZxK-0007RI-L5;
	Wed, 06 Aug 2025 08:57:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1ujZxJ-0007R8-67
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 08:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hnhKsNbZaYVYVh7RMoWBUicNBUYZXcQB3V/cX+GL9ys=; b=Whpe63lZ1mbzouQ2gdUF+pMhuz
 mtfw2YwewZFzw8Wt+tiG6/9OsmSGBWZmPXG2YK90cTmjsWJFyR+mv75/BOBXv9pXl8r4YJoSCsdmh
 VpK6F1SM3PG0Kvz2ezQuBrvVMLFBcxFTj1VVoPRysCoLODg4ChQ3+SjBf+uFkUcWp9b8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hnhKsNbZaYVYVh7RMoWBUicNBUYZXcQB3V/cX+GL9ys=; b=IkCvyHBDAkwccO6/IwS7QLCmvD
 MQmrFd47xLTkfv92RNcOQ2Mn8x4StAdswKgaUe4LJFVppfPrZOIRGHHaQj4QYeC4tlurTU1fvJEy3
 TQ7kmmGbxogk25DUpfoJaOT+qFZbzgBvn9xCYd8M8/GdDEp7d2TXY4LK8f63wXi0jl+w=;
Received: from mail-japanwestazon11012049.outbound.protection.outlook.com
 ([40.107.75.49] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujZxI-0004TT-8m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 08:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUt1JPxirwISiyU22opChrjt82MHQ4bGV2Y96+IVfhdi8NrP9KE+U6fkDdRrnAhQmyIykxjIYMFM6GOhaqDZTPP46FF8I2O5ot6sQXCYY36G13ajHFov5/9j/RJmUo1ngx8VUhyM7HdKeJAJxl/YOob8aDF8Gq4b65Tq+sv1Ep/DSUgJ+cWje/BOaX6ceDjXscueIwtb5QPF/MRc/3Zpuoo/vqguoT/r0Muo5Yv2sHF/s5B6JaOP+dU0C6z83hAGF0A3RrfhpYbwMJ+MUeUy8sMplTliJf3g36sGrdKOj1QwRM3ZSwmBSvaBUM48Eh/jHhhvKx0nDK0YZnKeQTSAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnhKsNbZaYVYVh7RMoWBUicNBUYZXcQB3V/cX+GL9ys=;
 b=R9kK//IQ2Mf/8kuzCepziDWsgK36UFNLBPlYyVnhm9rINC0+Fr0qoOPkp+llgOjxyMlndtGWOpzNAQDxB2gX6VXuVMVCHNak1oLYTZWTTjVpAjKeuUAtAXtM3kb946qhz8dOZaD+BAczlZlBxUSH2Rl7w5lIKlmZuWolEHTPVC4gs5AUrYQDYsmcIeE8I1fPq+0F71bYDhukkgqtLYIEBGcCa8A1drkxXlnGojtGg31G3no5VPaqpOgmxNL7V7zNtyu4+MPbxkWRoGDRGlcUczG9IjFswhMFofvI1ARXyPdyQD8fVYhA/gvGvnzU+vraG4LVshsTGwafk6Pdp1lyqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnhKsNbZaYVYVh7RMoWBUicNBUYZXcQB3V/cX+GL9ys=;
 b=V5vTQY+/0C2u/eUNkfsdr7UL8BEQ9Km+azTDCAg7bkN0ggzLzVbVZF30xzHTa+PlJxeMcg2jEopLaI2e5Uanjcp6jEWo9DBhlCXA900jAORXCLpAwf89DlHGdLNICxOl+9nArXycqReoTu44gLADDc7QDfituH0MiSXWrRgvUqFrtNPtmKC6zrlVkkNBUmXvNxPNY7vP5jO1iRkHJX+fAzeOtYDWTMs4q0g09nH0sErgpqrE3wwO1k3sjVzGTKM0iVyP6TxkZDlnfJhTTgiKIvzi8YRS3r9cl9FxF7WOSxS4mB/kRqa0tiSCzWo07MyIMEz9aKzZdzT9cNZ6NhVzxQ==
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e)
 by KL1PR0601MB5616.apcprd06.prod.outlook.com (2603:1096:820:9b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 08:56:50 +0000
Received: from PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2]) by PS1PPF5540628D6.apcprd06.prod.outlook.com
 ([fe80::5f12:df6:9716:ecb2%7]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 08:56:50 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v4] f2fs: add reserved nodes for privileged users
Thread-Index: AQHcAfDM8kPfZ6SYUUWrrljF9aem3rRL61YAgAfecICAAZJvgA==
Date: Wed, 6 Aug 2025 08:56:50 +0000
Message-ID: <61415c38-1846-4107-8612-ab763159a3bd@vivo.com>
References: <20250731075731.628454-1-guochunhai@vivo.com>
 <13bec8f2-8482-44f5-a7c6-db7cbde5173b@kernel.org>
 <ee0955ae-7d7a-40b7-8bae-f65ca56bd45c@kernel.org>
In-Reply-To: <ee0955ae-7d7a-40b7-8bae-f65ca56bd45c@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF5540628D6:EE_|KL1PR0601MB5616:EE_
x-ms-office365-filtering-correlation-id: 9f1620c2-3f3d-4204-2fa9-08ddd4c72eb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NnEyK2E3V01lNXVRWFZqUlAvblJrYjUvY1NJWGtxMitXOER6UEJjblhrR3ly?=
 =?utf-8?B?TUNRNFV6bDZja0JEck03NVRKaS9DSnVMb29SYXJncXZOQW42dGVRMHZ6MkRD?=
 =?utf-8?B?RWdpTXBXUk9KZ1grUGNtanBJdWNHU0ZadzF4VkI0QVhldFhUaG5DNktUSSs4?=
 =?utf-8?B?QnJPQm13QUY5R0txd01JTS9xZXpuZnJiQkhEMStOVXk1WTQ5ZVJhcHhjKzJG?=
 =?utf-8?B?ZXVDSzE5OVBNVGY5cUVWV0I0Y0pjQVdDN3pIK3pDRWN5d090WS9kQkVHdmx1?=
 =?utf-8?B?bDlmSmcxVDBaeWtQckt6cmpCdmJOVk8xejA5VkJKa0d6MlkxZ0RtZlRTR3oz?=
 =?utf-8?B?UWVVcUtqbGppV1FYMEE2T2NMSkdtSHY3YVNSWHFtbmN5QjFqdnIwR0JTR1oy?=
 =?utf-8?B?VnBDZTlLZHZDeSttWkhKNGx4VFFzUzlZMEw2MWg4ZFpZWkdRdW5XdU5HRmJZ?=
 =?utf-8?B?WUV0L0xYZ3BVSXNpRkJ5UXVobjZ1cGlzSG9ZZ2lHOWM0QWFycE95OVZSREhF?=
 =?utf-8?B?aHduMDRFVzcyN1VQNThUUEplcm1aSjgzMDBHMGtFL0ZVRHNlMjh0dFhQT0xD?=
 =?utf-8?B?VXRMR0NSMTZUTmhWTitlWEdMczBDam1FNThrbzlMSTlHNlBiZXJuTUhaUHc0?=
 =?utf-8?B?MUNwVWVOd0tWdDFjSDlTa1ZQaDhJWTVLS25iVVVZTmFhWlNoNW83OTNxeWZN?=
 =?utf-8?B?dGg3RFV0ektCeEFncHpWeWVrbFgwdVpWNHBBSHhkMmlrOUNUc24vVVdsYnh1?=
 =?utf-8?B?NFlUZUJaUFZKbnNPN2RWZHdJN1A5RmlFQ3lVRDhhRDBLRkVKYnJYL0F4RGNG?=
 =?utf-8?B?QTl4MU1yalpFdWFsamc1L1NtN2drS1IzN0I2aFB4eFNLMGl3UGJxM090dUJC?=
 =?utf-8?B?QnB5eHVWWW04THhjWEx2cERrQWpvZ1NSaE1NZ05qTzJGTjFvWmVnUmZ5UzlH?=
 =?utf-8?B?eG8vcGROQ0ViTk9CUlR4N1lrWGVYOElJUi83QmZFbFlhd25ZaFFqZHZaWGVO?=
 =?utf-8?B?a0h3OEpPZkdFYVZ1SFhDalUrczBjZVEyY2phYnVqV1BCQkpkamNUVHZIdTFU?=
 =?utf-8?B?Ky9XUDRzQ2d1UlVsb3B1aW5FaWVTem10L29IdVR2NUFBb3hnTW4yRTV3MUdC?=
 =?utf-8?B?anZ0UVZuYitSNXZTWmwxc1ZjQ2I2SGZmaHdhY2tjdmtJbWthWFVMOXcweGpV?=
 =?utf-8?B?K000TElEN0liT0NHdzl2eHdNcFdWdDBUWWtxc204d1h1eXZDOGp0QUdlSHZQ?=
 =?utf-8?B?RjhzZVZ5Q0JrWGZrbzBLaFV4Qm9UMTFFZE9NZGJVR3dacTNzQ0hxQmtEOGQw?=
 =?utf-8?B?UXp1ZjlhVUVSd2M3L1NmdXZPR3pCL0tMZDJzTjBRY2djL2dwRlVaOEdUVFRJ?=
 =?utf-8?B?S3UvWFAzV2QzUFI2WHg4WHZCc05vd0E0VE5QcFdObzU3VThDOTNFM1Rwenc5?=
 =?utf-8?B?RXRPY0JZRmlwTTljVDFNanFlTGFDcEpXT3p0b2J4blFKN3o3VmUzQ0diQS9w?=
 =?utf-8?B?RnFDZi9pWWw1djB2Umh0OGpibDh3MXFwL0FVTm50eGFrTGtIOFAxYmw5MFFM?=
 =?utf-8?B?U0hOeFd6dzA1TUZDV1RTbTdUbEovMVl2RzR3bGhMbjJTc0pwMldhUlNkd2Vr?=
 =?utf-8?B?M0pTOUxETWltWVlaNXV6bU1PZkZCU3JrVCtzVWVTTjhxSVhYYytMVDRZTTdN?=
 =?utf-8?B?L3gxeGF6MldaTndvaXRYYWJseU8yR0tOcUtIUFRYNWU5T3dIelVFU2t4aVZz?=
 =?utf-8?B?dGxKcEEwcEZFcXNQdUVnaG5CSDl5elJQWHBvVHlxZnFDQVlpTVNGdXpRS2l5?=
 =?utf-8?B?VGVQT0JXZ0d0Z243bkpQNVMxMWxiZTNmdHBYVDZXSXNSd0o0YWFwV2wrZnpH?=
 =?utf-8?B?ZWd1eldhN3VCcE5qNGM1UkROV1ltT2Z3Q0tYRTNtVkhVemd0bjNzWS9UY2ZS?=
 =?utf-8?B?TitNMEp4TjJYZHhNSXZOL3JxNjVRZ3didXJleXArZEJ5L2NGdFpyejR3cUdP?=
 =?utf-8?Q?DGHAAJhvDfA7eNBx1cZ8qUumyl23uk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PS1PPF5540628D6.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnEyWVY0MVREdWIwQ21WT2lyanVCbm4wbGg0SGVzbG5CQmxtZ3ZkdXBrMXRu?=
 =?utf-8?B?OVZVOHpGZzZpSkxodThrcEtrZEtqMHJ0V1pHenB0c3ZMM3IwRTNEWEozTXRL?=
 =?utf-8?B?aUptTmVZT20zaUlBSzQ5cUllMllVLzNQS3Q3ZTA2Z0dOYkE5K0IvT3ZPMjNO?=
 =?utf-8?B?N3hjWGhCMFlUemFrWWEwanRPSkk5T2RqRXV1ZW1KM3hlNC92NkhhU2lNQzEr?=
 =?utf-8?B?dTBmeVlHbnpaRXYwZElVVEhFYVVmcGlYV0hiSnRaZnVycDB4djUrUE84bWxB?=
 =?utf-8?B?eFF5bXZ0Z3oxUWZuWmVzcVlLenBZbDZ6U2w2ajUzaU1JcW1nUElrN3FyRkF0?=
 =?utf-8?B?Yk01QmZRV2ZDTWVDSk0vQkF5UlpIRlFObjJIRnVnZTZ3MDhRVHBTMDBEZDB2?=
 =?utf-8?B?enZ3cDcrcFZyVTErQzAyUVhRUi9iaEExeFRJRXBhSldCSjdmb01ibkJ5dWVM?=
 =?utf-8?B?SDJOQ1NVWGw3YWpoSXJjT2htV204SGhQSlBhSEduOThpdmZJeXl2YkIwTWhy?=
 =?utf-8?B?OFh2WTF0V1BZSWRmK2ZIV0E2YmhzR0NGR0hRSzVSNUdnNnhnUFhOR282QVJE?=
 =?utf-8?B?Vzk1TW9XWUUzMEVCWk1kbEVRamwreWpnWnF1RW1MbndGazZld0hsSjNqL09r?=
 =?utf-8?B?NzJkdWliVnZ5UmNHZXFNZ2t3dmlaUWh0K0ZnK2xwQUZCK3ZRUldPdHh2UUVQ?=
 =?utf-8?B?dzR6Um5ZdHlIaURXSWRDUE9hMlFxQmpsMFk2U091TlgyQUhIYWY1WFRqcnM1?=
 =?utf-8?B?TXdKaDA4cER3Uk1xTzcreTRUdGFQZ3cvdm54TXRjNytLV3JkeHdKMytVRktH?=
 =?utf-8?B?cVBvZXB6U1V2ejBZb2VQRm5BdG1GYzF6N3ZTbjRveHRaSlZkSzMzVm5ueHZq?=
 =?utf-8?B?a2JTWXhjb2lKNjE0NkFtUVA5Ykk4Vm1vQ3kzMHlGQ2dKTUxNZmQ1NG5MVVNn?=
 =?utf-8?B?aGNpNDdQbHNkeFJuUDczYjN0c3hNM2Q2MWxXQXMzTkp0dGQyOE9DRlNLZ1dj?=
 =?utf-8?B?U3JmdTMzMXl5RzZFbWpSUUlYYkJ3UkJSMmR3RUdJalJORTdrRmJ5bm4wOU55?=
 =?utf-8?B?UjQwM2I5SjJiRW9LYmdZRGlVaVZxam0wenlKd1ZjNnVNYUNvaXd0NWNlcHFH?=
 =?utf-8?B?cFdrdjdTZFI4UkdaWDk0L0gzUXROUHVZRFB6T1FJT3hqYktKaEx0RFpPNlJw?=
 =?utf-8?B?SjNISHZDeXZTcXZVZk5nMTNZV2hFVDZTS1pKV0tTbkUzSCs4SXlGTXhwSzFW?=
 =?utf-8?B?alErek1xditvREJONWgwMUk3YWUxSU1qZkwvZVUwN2FhYTBwRlhxcW9SUDls?=
 =?utf-8?B?QlJudUlzUlR6L0NZQXJSSmdxUWNTemtIYlZiYURqZFl6bnpkQlpzSkRES3E4?=
 =?utf-8?B?T29jSTdGOWE2Uld1Wm1XaGtIdUg1eWVkVWpQOS9Yc3FHaXRPNEtPZVg5OGxV?=
 =?utf-8?B?L2plZkRTK210RkhWL2s3M21YSkNOZzE3REZuZDdlMXBuZlRYRGMzMGMzUXQ0?=
 =?utf-8?B?WkdFSkhaSHI1WTk2SVdRM3huTWpzSGlTZFNQeXJvbGdwaUQ5N29nRmF6Y1Bh?=
 =?utf-8?B?MVlSL3VaMzNnOU0vK1NrQ0VSWEcyYjFkN3NFRExDbGxWWWFHdVBkWUpuZ3FY?=
 =?utf-8?B?elRkbS90cm1QMCtNREJ3ZjRscWxlSC9KTm8zcGIwRFhBVDFVSGtyaldzV2U3?=
 =?utf-8?B?QVBEY0I1dTZWVThQZndxbnlNMXRuOE9nVVhDZ09wRzJtM2IrNmxpZEEyNGEv?=
 =?utf-8?B?T1lZcktDZE1COGZIZ3FveVhBeHBuWlhyc0pYSGsyN01RTmw3b0hwR1hNMVFO?=
 =?utf-8?B?cStWU1RBYXFLVkxqeEpoWkt6dGVMcVA4YzBNeUdKbXR2eTFXdTYveHFKSmFu?=
 =?utf-8?B?cG5wTVI3MFBVSE83Y0c4Tm5RVURzSEd4dFZaOXZUaGIza3VBeGt6b3VTMEhU?=
 =?utf-8?B?U2Fzb0VYL3U0MDYxMzlRc3NJQlE2UVJxczJqa0oyWGFtRnhJcC93SDczN0x4?=
 =?utf-8?B?VFJYOVlGaFl6MTNZVmlPQVVNa0N1NzVEZFhMYyt4aE1QSlVJWmpYWVplVmVS?=
 =?utf-8?B?NmVIU0Q0R0dtaWtzTWlHZ0hZanB6LzA2eTU2d0ZKQW1PczZjTzNBYzdEbFla?=
 =?utf-8?Q?hzmE=3D?=
Content-ID: <E13176456EAA784D9D1B60602B5E06C4@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF5540628D6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1620c2-3f3d-4204-2fa9-08ddd4c72eb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2025 08:56:50.3848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BBGWSf+PbKSx8dod1GvhRf7xXkZxQppCxhz8Y2j12vUqOY6Zy9+/jAB51WngS1bYMbqGNh30scB3JbUP62G9Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5616
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 8/5/2025 4:56 PM, Chao Yu 写道: > On 7/31/25 16:46,
   Chao Yu wrote: >> On 7/31/25 15:57, Chunhai Guo wrote: >>> This patch allows
    privileged users to reserve nodes via the >>> 'reserve_node' moun [...] 
 
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
                             [40.107.75.49 listed in wl.mailspike.net]
X-Headers-End: 1ujZxI-0004TT-8m
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add reserved nodes for privileged
 users
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

5ZyoIDgvNS8yMDI1IDQ6NTYgUE0sIENoYW8gWXUg5YaZ6YGTOg0KPiBPbiA3LzMxLzI1IDE2OjQ2
LCBDaGFvIFl1IHdyb3RlOg0KPj4gT24gNy8zMS8yNSAxNTo1NywgQ2h1bmhhaSBHdW8gd3JvdGU6
DQo+Pj4gVGhpcyBwYXRjaCBhbGxvd3MgcHJpdmlsZWdlZCB1c2VycyB0byByZXNlcnZlIG5vZGVz
IHZpYSB0aGUNCj4+PiAncmVzZXJ2ZV9ub2RlJyBtb3VudCBvcHRpb24sIHdoaWNoIGlzIHNpbWls
YXIgdG8gdGhlIGV4aXN0aW5nDQo+Pj4gJ3Jlc2VydmVfcm9vdCcgb3B0aW9uLg0KPj4+DQo+Pj4g
Ii1vIHJlc2VydmVfbm9kZT08Tj4iIG1lYW5zIDxOPiBub2RlcyBhcmUgcmVzZXJ2ZWQgZm9yIHBy
aXZpbGVnZWQNCj4+PiB1c2VycyBvbmx5Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQ2h1bmhh
aSBHdW8gPGd1b2NodW5oYWlAdml2by5jb20+DQo+Pj4gLS0tDQo+Pj4gdjMtPnY0OiBSZWJhc2Ug
dGhpcyBwYXRjaCBvbiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIw
MjUwNzMxMDYwMzM4LjExMzYwODYtMS1jaGFvQGtlcm5lbC5vcmcNCj4+PiB2Mi0+djM6IEFwcGx5
IENoYW8ncyBzdWdnZXN0aW9uIGZyb20gdjIuDQo+Pj4gdjEtPnYyOiBBZGQgdHdvIG1pc3Npbmcg
aGFuZGxpbmcgcGFydHMuDQo+Pj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYy
ZnMtZGV2ZWwvMjAyNTA3MjkwOTUyMzguNjA3NDMzLTEtZ3VvY2h1bmhhaUB2aXZvLmNvbS8NCj4+
PiAtLS0NCj4+PiAgIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJmcy5yc3QgfCAgOSArKysr
LS0tDQo+Pj4gICBmcy9mMmZzL2YyZnMuaCAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysr
Ky0tLQ0KPj4+ICAgZnMvZjJmcy9zdXBlci5jICAgICAgICAgICAgICAgICAgICB8IDQzICsrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLQ0KPj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNl
cnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9m
MmZzLnJzdA0KPj4+IGluZGV4IDAzYjFlZmE2ZDNiMi4uOTVkYmNkN2FjOWE4IDEwMDY0NA0KPj4+
IC0tLSBhL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJmcy5yc3QNCj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0DQo+Pj4gQEAgLTE3Myw5ICsxNzMsMTIgQEAg
ZGF0YV9mbHVzaCAgICAgICAgICAgICAgRW5hYmxlIGRhdGEgZmx1c2hpbmcgYmVmb3JlIGNoZWNr
cG9pbnQgaW4gb3JkZXIgdG8NCj4+PiAgICAgICAgICAgICAgICAgICAgICBwZXJzaXN0IGRhdGEg
b2YgcmVndWxhciBhbmQgc3ltbGluay4NCj4+PiAgIHJlc2VydmVfcm9vdD0lZCAgICAgICAgICAg
IFN1cHBvcnQgY29uZmlndXJpbmcgcmVzZXJ2ZWQgc3BhY2Ugd2hpY2ggaXMgdXNlZCBmb3INCj4+
PiAgICAgICAgICAgICAgICAgICAgICBhbGxvY2F0aW9uIGZyb20gYSBwcml2aWxlZ2VkIHVzZXIg
d2l0aCBzcGVjaWZpZWQgdWlkIG9yDQo+Pj4gLSAgICAgICAgICAgICAgICAgICAgZ2lkLCB1bml0
OiA0S0IsIHRoZSBkZWZhdWx0IGxpbWl0IGlzIDAuMiUgb2YgdXNlciBibG9ja3MuDQo+Pj4gLXJl
c3VpZD0lZCAgICAgICAgICAgVGhlIHVzZXIgSUQgd2hpY2ggbWF5IHVzZSB0aGUgcmVzZXJ2ZWQg
YmxvY2tzLg0KPj4+IC1yZXNnaWQ9JWQgICAgICAgICAgIFRoZSBncm91cCBJRCB3aGljaCBtYXkg
dXNlIHRoZSByZXNlcnZlZCBibG9ja3MuDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgZ2lkLCB1
bml0OiA0S0IsIHRoZSBkZWZhdWx0IGxpbWl0IGlzIDEyLjUlIG9mIHVzZXIgYmxvY2tzLg0KPj4+
ICtyZXNlcnZlX25vZGU9JWQgICAgICAgICAgICAgU3VwcG9ydCBjb25maWd1cmluZyByZXNlcnZl
ZCBub2RlcyB3aGljaCBhcmUgdXNlZCBmb3INCj4+PiArICAgICAgICAgICAgICAgICAgICBhbGxv
Y2F0aW9uIGZyb20gYSBwcml2aWxlZ2VkIHVzZXIgd2l0aCBzcGVjaWZpZWQgdWlkIG9yDQo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgZ2lkLCB0aGUgZGVmYXVsdCBsaW1pdCBpcyAxMi41JSBvZiBh
bGwgbm9kZXMuDQo+Pj4gK3Jlc3VpZD0lZCAgICAgICAgICAgVGhlIHVzZXIgSUQgd2hpY2ggbWF5
IHVzZSB0aGUgcmVzZXJ2ZWQgYmxvY2tzIGFuZCBub2Rlcy4NCj4+PiArcmVzZ2lkPSVkICAgICAg
ICAgICBUaGUgZ3JvdXAgSUQgd2hpY2ggbWF5IHVzZSB0aGUgcmVzZXJ2ZWQgYmxvY2tzIGFuZCBu
b2Rlcy4NCj4+PiAgIGZhdWx0X2luamVjdGlvbj0lZCAgICAgICAgIEVuYWJsZSBmYXVsdCBpbmpl
Y3Rpb24gaW4gYWxsIHN1cHBvcnRlZCB0eXBlcyB3aXRoDQo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgc3BlY2lmaWVkIGluamVjdGlvbiByYXRlLg0KPj4+ICAgZmF1bHRfdHlwZT0lZCAgICAgICAg
ICAgICAgU3VwcG9ydCBjb25maWd1cmluZyBmYXVsdCBpbmplY3Rpb24gdHlwZSwgc2hvdWxkIGJl
DQo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgNCj4+PiBp
bmRleCBlYjM3MmFmMjJlZGMuLmI5Njc2ZWYxNjI0NiAxMDA2NDQNCj4+PiAtLS0gYS9mcy9mMmZz
L2YyZnMuaA0KPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oDQo+Pj4gQEAgLTEzMSw2ICsxMzEsNyBA
QCBleHRlcm4gY29uc3QgY2hhciAqZjJmc19mYXVsdF9uYW1lW0ZBVUxUX01BWF07DQo+Pj4gICAg
KiBzdHJpbmcgcmF0aGVyIHRoYW4gdXNpbmcgdGhlIE1TX0xBWllUSU1FIGZsYWcsIHNvIHRoaXMg
bXVzdCByZW1haW4uDQo+Pj4gICAgKi8NCj4+PiAgICNkZWZpbmUgRjJGU19NT1VOVF9MQVpZVElN
RSAgICAgICAgICAgICAgIDB4NDAwMDAwMDANCj4+PiArI2RlZmluZSBGMkZTX01PVU5UX1JFU0VS
VkVfTk9ERSAgICAgICAgICAgIDB4ODAwMDAwMDANCj4+Pg0KPj4+ICAgI2RlZmluZSBGMkZTX09Q
VElPTihzYmkpICAoKHNiaSktPm1vdW50X29wdCkNCj4+PiAgICNkZWZpbmUgY2xlYXJfb3B0KHNi
aSwgb3B0aW9uKSAgICAoRjJGU19PUFRJT04oc2JpKS5vcHQgJj0gfkYyRlNfTU9VTlRfIyNvcHRp
b24pDQo+Pj4gQEAgLTE3Miw2ICsxNzMsNyBAQCBzdHJ1Y3QgZjJmc19yd3NlbSB7DQo+Pj4gICBz
dHJ1Y3QgZjJmc19tb3VudF9pbmZvIHsNCj4+PiAgICAgdW5zaWduZWQgaW50IG9wdDsNCj4+PiAg
ICAgYmxvY2tfdCByb290X3Jlc2VydmVkX2Jsb2NrczsgICAvKiByb290IHJlc2VydmVkIGJsb2Nr
cyAqLw0KPj4+ICsgICBibG9ja190IHJvb3RfcmVzZXJ2ZWRfbm9kZXM7ICAgIC8qIHJvb3QgcmVz
ZXJ2ZWQgbm9kZXMgKi8NCj4+PiAgICAga3VpZF90IHNfcmVzdWlkOyAgICAgICAgICAgICAgICAv
KiByZXNlcnZlZCBibG9ja3MgZm9yIHVpZCAqLw0KPj4+ICAgICBrZ2lkX3Qgc19yZXNnaWQ7ICAg
ICAgICAgICAgICAgIC8qIHJlc2VydmVkIGJsb2NrcyBmb3IgZ2lkICovDQo+Pj4gICAgIGludCBh
Y3RpdmVfbG9nczsgICAgICAgICAgICAgICAgLyogIyBvZiBhY3RpdmUgbG9ncyAqLw0KPj4+IEBA
IC0yMzU1LDcgKzIzNTcsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc19oYXNfeGF0dHJfYmxv
Y2sodW5zaWduZWQgaW50IG9mcykNCj4+PiAgICAgcmV0dXJuIG9mcyA9PSBYQVRUUl9OT0RFX09G
RlNFVDsNCj4+PiAgIH0NCj4+Pg0KPj4+IC1zdGF0aWMgaW5saW5lIGJvb2wgX19hbGxvd19yZXNl
cnZlZF9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLA0KPj4+ICtzdGF0aWMgaW5saW5l
IGJvb2wgX19hbGxvd19yZXNlcnZlZF9yb290KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwNCj4+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2Rl
LCBib29sIGNhcCkNCj4+PiAgIHsNCj4+PiAgICAgaWYgKCFpbm9kZSkNCj4+PiBAQCAtMjM4MCw3
ICsyMzgyLDcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgZ2V0X2F2YWlsYWJsZV9ibG9j
a19jb3VudChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksDQo+Pj4gICAgIGF2YWlsX3VzZXJfYmxv
Y2tfY291bnQgPSBzYmktPnVzZXJfYmxvY2tfY291bnQgLQ0KPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNiaS0+Y3VycmVudF9yZXNlcnZlZF9ibG9ja3M7DQo+Pj4NCj4+
PiAtICAgaWYgKHRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9ST09UKSAmJiAhX19hbGxvd19yZXNlcnZl
ZF9ibG9ja3Moc2JpLCBpbm9kZSwgY2FwKSkNCj4+PiArICAgaWYgKHRlc3Rfb3B0KHNiaSwgUkVT
RVJWRV9ST09UKSAmJiAhX19hbGxvd19yZXNlcnZlZF9yb290KHNiaSwgaW5vZGUsIGNhcCkpDQo+
Pj4gICAgICAgICAgICAgYXZhaWxfdXNlcl9ibG9ja19jb3VudCAtPSBGMkZTX09QVElPTihzYmkp
LnJvb3RfcmVzZXJ2ZWRfYmxvY2tzOw0KPj4+DQo+Pj4gICAgIGlmICh1bmxpa2VseShpc19zYmlf
ZmxhZ19zZXQoc2JpLCBTQklfQ1BfRElTQUJMRUQpKSkgew0KPj4+IEBAIC0yNzM4LDcgKzI3NDAs
NyBAQCBzdGF0aWMgaW5saW5lIGludCBpbmNfdmFsaWRfbm9kZV9jb3VudChzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGlub2RlICppbm9kZSwgYm9vbCBpc19pbm9kZSkNCj4+PiAgIHsNCj4+PiAgICAgYmxvY2tf
dCB2YWxpZF9ibG9ja19jb3VudDsNCj4+PiAtICAgdW5zaWduZWQgaW50IHZhbGlkX25vZGVfY291
bnQ7DQo+Pj4gKyAgIHVuc2lnbmVkIGludCB2YWxpZF9ub2RlX2NvdW50LCBhdmFpbF91c2VyX25v
ZGVfY291bnQ7DQo+Pj4gICAgIHVuc2lnbmVkIGludCBhdmFpbF91c2VyX2Jsb2NrX2NvdW50Ow0K
Pj4+ICAgICBpbnQgZXJyOw0KPj4+DQo+Pj4gQEAgLTI3NjcsOCArMjc2OSwxMiBAQCBzdGF0aWMg
aW5saW5lIGludCBpbmNfdmFsaWRfbm9kZV9jb3VudChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
DQo+Pj4gICAgICAgICAgICAgZ290byBlbm9zcGM7DQo+Pj4gICAgIH0NCj4+Pg0KPj4+ICsgICBh
dmFpbF91c2VyX25vZGVfY291bnQgPSBzYmktPnRvdGFsX25vZGVfY291bnQgLSBGMkZTX1JFU0VS
VkVEX05PREVfTlVNOw0KPj4+ICsgICBpZiAodGVzdF9vcHQoc2JpLCBSRVNFUlZFX05PREUpICYm
DQo+Pj4gKyAgICAgICAgICAgICAgICAgICAhX19hbGxvd19yZXNlcnZlZF9yb290KHNiaSwgaW5v
ZGUsIGZhbHNlKSkNCj4+IENodW5oYWksDQo+Pg0KPj4gRG8gd2UgbmVlZCB0byBwYXNzIGNhcD10
cnVlIHRvIF9fYWxsb3dfcmVzZXJ2ZWRfcm9vdCgpPw0KPj4NCj4+IEluIGFkZGl0aW9uLCBkbyB3
ZSBuZWVkIHRvIGNoYW5nZSBjYXAgYXMgd2VsbCBmb3IgYmVsb3cgc3RhdGVtZW50Pw0KPj4NCj4+
IGF2YWlsX3VzZXJfYmxvY2tfY291bnQgPSBnZXRfYXZhaWxhYmxlX2Jsb2NrX2NvdW50KHNiaSwg
aW5vZGUsIGZhbHNlKTsNCj4gSSBtZWFudCBzb21ldGhpbmcgbGlrZSB0aGlzPyBub3Qgc3VyZS4N
Cg0KDQpJIHRoaW5rIHRoaXMgaXMgZmluZS4gSSBoYXZlIHRlc3RlZCB3aXRoIHlvdXIgbW9kaWZp
Y2F0aW9ucyBvbiBhbg0KQW5kcm9pZCBkZXZpY2UgYW5kIG5vIHNlbGlueCBpc3N1ZSBoYXMgYmVl
biBmb3VuZC4gSSB3aWxsIHNlbmQgdGhlIHY1DQpwYXRjaCB3aXRoIHlvdXIgbW9kaWZpY2F0aW9u
cy4NCg0KVGhhbmtzLA0KDQoNCj4NCj4gLS0tDQo+ICAgZnMvZjJmcy9mMmZzLmggfCA1ICsrKy0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgNCj4gaW5kZXgg
MzgwNGI3MGU1YTI4Li5kMGFhNTc2NmVhNjYgMTAwNjQ0DQo+IC0tLSBhL2ZzL2YyZnMvZjJmcy5o
DQo+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oDQo+IEBAIC0yODA1LDcgKzI4MDUsOCBAQCBzdGF0aWMg
aW5saW5lIGludCBpbmNfdmFsaWRfbm9kZV9jb3VudChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
DQo+ICAgICAgIHNwaW5fbG9jaygmc2JpLT5zdGF0X2xvY2spOw0KPg0KPiAgICAgICB2YWxpZF9i
bG9ja19jb3VudCA9IHNiaS0+dG90YWxfdmFsaWRfYmxvY2tfY291bnQgKyAxOw0KPiAtICAgICBh
dmFpbF91c2VyX2Jsb2NrX2NvdW50ID0gZ2V0X2F2YWlsYWJsZV9ibG9ja19jb3VudChzYmksIGlu
b2RlLCBmYWxzZSk7DQo+ICsgICAgIGF2YWlsX3VzZXJfYmxvY2tfY291bnQgPSBnZXRfYXZhaWxh
YmxlX2Jsb2NrX2NvdW50KHNiaSwgaW5vZGUsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRlc3Rfb3B0KHNiaSwgUkVTRVJWRV9OT0RFKSk7DQo+DQo+ICAgICAgIGlmICh1bmxpa2Vs
eSh2YWxpZF9ibG9ja19jb3VudCA+IGF2YWlsX3VzZXJfYmxvY2tfY291bnQpKSB7DQo+ICAgICAg
ICAgICAgICAgc3Bpbl91bmxvY2soJnNiaS0+c3RhdF9sb2NrKTsNCj4gQEAgLTI4MTQsNyArMjgx
NSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGluY192YWxpZF9ub2RlX2NvdW50KHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwNCj4NCj4gICAgICAgYXZhaWxfdXNlcl9ub2RlX2NvdW50ID0gc2JpLT50
b3RhbF9ub2RlX2NvdW50IC0gRjJGU19SRVNFUlZFRF9OT0RFX05VTTsNCj4gICAgICAgaWYgKHRl
c3Rfb3B0KHNiaSwgUkVTRVJWRV9OT0RFKSAmJg0KPiAtICAgICAgICAgICAgICAgICAgICAgIV9f
YWxsb3dfcmVzZXJ2ZWRfcm9vdChzYmksIGlub2RlLCBmYWxzZSkpDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAhX19hbGxvd19yZXNlcnZlZF9yb290KHNiaSwgaW5vZGUsIHRydWUpKQ0KPiAgICAg
ICAgICAgICAgIGF2YWlsX3VzZXJfbm9kZV9jb3VudCAtPSBGMkZTX09QVElPTihzYmkpLnJvb3Rf
cmVzZXJ2ZWRfbm9kZXM7DQo+ICAgICAgIHZhbGlkX25vZGVfY291bnQgPSBzYmktPnRvdGFsX3Zh
bGlkX25vZGVfY291bnQgKyAxOw0KPiAgICAgICBpZiAodW5saWtlbHkodmFsaWRfbm9kZV9jb3Vu
dCA+IGF2YWlsX3VzZXJfbm9kZV9jb3VudCkpIHsNCg0KDQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
