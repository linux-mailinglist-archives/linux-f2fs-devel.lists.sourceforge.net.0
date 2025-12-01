Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880AC9773E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 14:02:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMjfpoZodU5kVdj4ZfOsQ+u1Bms8kq+6bC+3fe/XdE0=; b=cP2pDdtTMvmZVkMUxbXeoX76KS
	3TGFsZnuoGA8wKIQS8j7k5UQQxTuwS2EJN4UR6rBUrmOrKLF94PTRFjYaqcG7xOL0mxzX7esNLR+1
	UFWMZilNbBKgyTITgxsAWe5m59fU1xcvXJQ/WzoSgUhSkdv6dP8ugA41K5CU8a8TlP/s=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQ3XK-0008QX-5b;
	Mon, 01 Dec 2025 13:01:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaitanyak@nvidia.com>) id 1vQ3XH-0008QF-Lt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 13:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tqve8UQ4fZGpeuNkX2OfOnNGe1irzLrvOlTUJtTVRmQ=; b=k+jh8iFcjF5VhYjnfyWlDXY4VU
 8VSkSC3RMKrOB3ZE+Jc/PjwPUFxSRbG1lv4fcqIfVvqrubzUEirQCXL07b3P3bjwEHQjzbtv7wxMn
 SHvUGH4Pz47rovc2cVyQii2p/GWrtQdQCi/79TgWmbk7u7Gudl0NBuLncgxNvAeHpUOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tqve8UQ4fZGpeuNkX2OfOnNGe1irzLrvOlTUJtTVRmQ=; b=MolYhFRNEb4EFWazgYT9FhdNxV
 gL7rEuE5TPXypwrZWyHvG5BwtnL/EZb8vnizYIi9QK2dvC8lDIhjVm5ZSg1h/SUbbsz14i4hkQJby
 NdLeKiVQkNJJpB6KhP4mXh62bYIztbv2Bctx1SUvelZmwrlPxMRWyrhJ30Ra6fME6Ovg=;
Received: from mail-centralusazon11011030.outbound.protection.outlook.com
 ([52.101.62.30] helo=DM5PR21CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQ3XH-0003wU-PT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 13:01:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5fLvcGmjQxYFPuSZNmHpW47Ovbw3uD6WKl5SuJQI8Sh7aYDvc+dFAqnwXHVsg85wZN1jl0Iqc7GHCSl2U2nyP0hZ97C6zc7qcdGVHvsQ7vrgiV7e41qnImuneF337nx1fPKKvVl64pZv9bugO4Qa68Beq2i9mVnP92hqtNw4FAMSGwK/N3xxjGASjZKkfIhxoMBvbs6cDOiVvMDAuk9pthRYYPIJetiog5X3FiBZqKJpBTG+iVoHvGofKrkv8n34TH9Vtn/0YKE05PejWlgvMddqZBTzvUKVVuONwi9dZpp4dzB8GAJHaWvEVS8yPEUkg0hgu6oILTg6KiVU790Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqve8UQ4fZGpeuNkX2OfOnNGe1irzLrvOlTUJtTVRmQ=;
 b=R2Rbdz6Xkl7QcbcJkRo1wCGMkoPl9pm18U+s1iHGqPnU0bRk0IEufasEx5NUtPn2Ini9VmL4DIRuqdKri7xO5xY09FHdiQdhWcH3dSSbHabGag9FG5lEfMutKuk/xPoPoTjAWdDE+pas0BkG2V7oE1A2Wtll3e0x2SMhvV7r+PuXjRKwNH8A+fL3fPzHk5GMPsvnAMDhlGIHqme1iI2mUCxLTtjyWZAmcAJszOrqpAQbdmv93T5yfR8jBiWWcxgy/1JSw/KUfO31YMMRi7kPXqqw00jQlHiAVHynwJ00Hhyc7ICSbAxWn+Y/3nMYBxeRPqKtDokv2bMVuLC6r+Sg3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqve8UQ4fZGpeuNkX2OfOnNGe1irzLrvOlTUJtTVRmQ=;
 b=ho1/LUrBtTCDsEaMJNKYYPsOlfGhF1fMwiCf5QiBjFISYc1uZffGxgyme5n9fR4EHlbgg6kidaL0UyT8a7pfAmPZpPwX1z8G2lUxK0yIx0SGeU/HFd/QNgvlQuq4ZM6/s8l6d4e3LvvblxbGon3qm0OkL4c4KW9qmPMbZP9UFbj4AXMz4aeUEfTzeFuzQqudmztiT12WPdCE2UlgZ68YhmSI7E2nAGWhWxCoIid49qN4TET6LGCGln6EobD5IJj89q9wdglz4cVsY3i191SYNj0Fsn5Aw+ATH/6iBXKJfR/YnSIXjhVceh79/jM5T1uLfOjxcKad3R7kUUyhfEFxJg==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by CY8PR12MB7169.namprd12.prod.outlook.com (2603:10b6:930:5e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 1 Dec
 2025 06:26:57 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:26:57 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH V3 5/6] f2fs: ignore discard return value
Thread-Index: AQHcXZzXmCoF0wg4KkOwIq06KMelyLUClTcAgABahACAAAqdgIAJYWkA
Date: Mon, 1 Dec 2025 06:26:57 +0000
Message-ID: <618f21c7-2360-45d6-b75e-7497fab7e75e@nvidia.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-6-ckulkarnilinux@gmail.com>
 <9c8a6b5f-74c8-4e9f-ae46-24e1df5fe4e0@kernel.org>
 <20251125063358.GA14801@lst.de>
 <8e98a473-7991-43ae-a758-8ad324bb9393@kernel.org>
In-Reply-To: <8e98a473-7991-43ae-a758-8ad324bb9393@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|CY8PR12MB7169:EE_
x-ms-office365-filtering-correlation-id: 97a34eb7-c936-4183-fe18-08de30a2a09b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SnpZMCtuZks5NTdnWlZQT1g2UG9ra2lwRTM3d3hvSTlMeWUvYzFFVWQ5Ky9u?=
 =?utf-8?B?cTRuTlN4MkFpZUV6OGxoZlIxbXVVNmx1djJTeHhVbXFBMkM4QWZ5R0NsU1Vo?=
 =?utf-8?B?T0NiZDhYYWk1VHlueVU3TWhTK1RIeTBpV3B4OXV0QjM4b3krbitpM3M4WVNm?=
 =?utf-8?B?M1pZaXBtUHE0MWtvVFVLMk5JQ3JXMGNyeGVycW5OQlQrZkxVZHU1bXFyaGhR?=
 =?utf-8?B?VXVXbm5RY1Y1dVlVSnN2ZU4vNzllWDE1d1dwdWVJRkJtNzdENkdOdlV1SzY4?=
 =?utf-8?B?T0MraTV3amluZnJxUGMwSEtmd3E1NFhaaFNhY1JqZkRNam9NTjI1Vm45c0RZ?=
 =?utf-8?B?blNLSXA5S1FOUC9NM3l2QVFoK1dFQWYwMTVXVWJISHMyQkJaNjgwNCs2NUtZ?=
 =?utf-8?B?aGFsRktycjRZTXFIWkM5S2hESXRFYTZaSFhwd0ZidlVScWZqdHRCc2lyMlVs?=
 =?utf-8?B?SC84WXZ1VlVrZ0hCcWt2NUxvMGRhTGgrRUt6dmo5MFRna1Q4MXIrZ2RDTHJQ?=
 =?utf-8?B?aTNHdjU2SlY1c0NjaElLQkNNL0JmTGt2b2xjem83T0tYaGFBQlZmUS9ORGRN?=
 =?utf-8?B?NjQramhMRWNURmMxcW8xRVNTYmdqVmlIUk50SmJiRjNRQ1ZEVXFnR2tFY1pV?=
 =?utf-8?B?WmxIcGt5YldhUjIwZm9UWkR3UTQ0TDRFcStGMUNZUnlTc3VGekEwbmQzOEkv?=
 =?utf-8?B?alRiaGZXM3V0SHFOOU5iTFZYQ3Fzb1lGaUxUczlaL2NUaEFya0hxdWtvZDZ2?=
 =?utf-8?B?ZjlnSEM2aEZtM01yL3hWUGl2REpvcUcwc3U5Nmx3U25GWUdTTVVFblF1RHRZ?=
 =?utf-8?B?QUJpTGRpTWdHRThLTllUeTZRQnRmQlVyKytFazRjMHFyYUpreERwblZPVEJJ?=
 =?utf-8?B?Z0w0OGozMkFyZUs2Q1AvTG1OajF1THNTRjVMRFF3MDVtYVowNGlkbHpCS2Y2?=
 =?utf-8?B?VGlYYVNneStidG5JZ2NDMFYwaHU1WG1uQWpEOCsyT3JvZ1J6V1NTMy9scVJu?=
 =?utf-8?B?OVd0K1JRYnllRmJHQVUyVnAxSVo0UGlvaWxIMURZbjAydnR1NFFubkIrb2Zx?=
 =?utf-8?B?cm5lZXhIRzdWcXc5a21nam9SMERHOS9vMlRTNkdCcW9IMnFOaVlYZEc3N3JQ?=
 =?utf-8?B?Z0k4SlZTYWJJanZXOHpSdjFVV3R4cWZhbkRrVWxIRnlLU2wrRWxrOVlDQXNB?=
 =?utf-8?B?UWJFVTVyZnNnMWt1ZE1vS05sQzVsOGhoMVE0NWRFdkV3cHV0eEVhYW9Ud0pC?=
 =?utf-8?B?eTVaT2xIdFQ4MmlJSXFkdHRHclRuaTFaSFRTeGR6N1ZGZVF3V20vNHJtbk5B?=
 =?utf-8?B?c2dSeXc4Q3Fza2lDVnlLbys4MkQ3ZDBsMzRtYUNCZ3h5ajBURGNMZFRDekZz?=
 =?utf-8?B?MmlCNGQvM1Bwa29KNVEzZ1hvNnpvNU9ySlJtVjRJS0ZWYUxwdG1lNW9wd1BZ?=
 =?utf-8?B?cUQ2eWZoMzJsTTZxNHhUcFN6c2labEpnMm02NjdRYVAydXR1YWZWYi9CZHFO?=
 =?utf-8?B?ZDZrOXF1T04rekVFTm5zNXF4ZlFCOWd4VnJCUEtaVGEyU3Vma0R0eU9HZER1?=
 =?utf-8?B?WjZjUWJaN0ltN2J2WEVVL2hvM0p6QUdWL1A5dVNLazBBNmM3cXlDZmF4SEQ5?=
 =?utf-8?B?Vlh4eTNVTnk2OENTemc5b1NGdzZiN1Bqa3JyWmdNYjR0REhYWWtlMFpGWVNJ?=
 =?utf-8?B?MmlxWDh6S1JUbnlNREhQc1Nkc1BKWlRSdWtWS3Q2K0l5a1VPRFFVeUJxQ0Va?=
 =?utf-8?B?TGNOellmTjhzRi80RFlHdTh1dlJWNTZXVTA1ZjdwNll1WlFOdzBBR0x4MnNo?=
 =?utf-8?B?dG5ma0lOOCtmYkFnbUFRNG1hajZuN1JQaFBuYUFNV1IzV0I1YjdyVDNOTm9U?=
 =?utf-8?B?SnBoOFBVOGlDUlQzdkdIeE1PVlRLeklVMkFpbmM0cVYzK2YxbVQ1U0N3bXQy?=
 =?utf-8?B?K252Vml2OVlFUm1id0h1R3hndmMwWmlCcGpDTkcrRkhoaWI4WEw0RDNQTStY?=
 =?utf-8?B?RFo4U0MxMEQ1cVUrVEtibkF4Y0hOMEYwdFptNUVtOWIzVGVZVGhNSVhPbStr?=
 =?utf-8?Q?RZuzQx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9404.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NS9jYVhuejZ3UDdzSHpUbHZsTEtYQnJJQkF1YStvVGs4NjdIcXFBUWo4SkNG?=
 =?utf-8?B?d1BSV1BjUW1CSVNkNWpNbU5kc1Q5cDdQNXpJZ2o0Ry9VaDQwTTk4RkdVNTlM?=
 =?utf-8?B?OHFCZ0FjdStCRTNpc1NZRW5pZFI0VjlYbHRIWisyWGNWWWRzVFIxVVloSWtX?=
 =?utf-8?B?SE5zTi9HcVlvNlZycXRJbERZRFB4ZHhpUFFqZ1RjQWJEN0tSY3czNnFKbW1B?=
 =?utf-8?B?OWF0Mm5wdFczWkl6S0ZueFlXSzdCS3oyZWFVdWN6OW1xQTJINFpHMmE0ZmtY?=
 =?utf-8?B?SHVHaDlXS01BZFVkbWpVY3dRRDJiSE96V2oyTmVhUGF6em85T2thSkw3RURl?=
 =?utf-8?B?UVlHSklySEt5TUdLZlRKRVdlRUJVa3RUcmdzajVNdjZjOUxPNTJqTnFpOEc3?=
 =?utf-8?B?OXllREZjMWZrQ1Zqa3hmc0trSWFnRFBwbjk2MXphR1JPdmpvTElHY3o3Y0VO?=
 =?utf-8?B?Q2ZaUjNydWtUb3c1eUd5TGhOMWRyWWNKUWdqZHkrY3ZVRlNEQnBPekYwR3Vk?=
 =?utf-8?B?NGhabGFac0VjL1dDOXRITWZRdzJreXM2L3E3SlMvZ3VENXlQSkt0ZE9sb0h1?=
 =?utf-8?B?dVE4enJmdm5GWXZORkM4d2xCazB1WGRLc2s3OVB2WkFDTWlIeVZ2UmtXbnpt?=
 =?utf-8?B?cGFTeUFMeHBreXUxalRLNXdzUmpaSXplak9IUHlaRjlnYkIxTk15ZmpxZkl6?=
 =?utf-8?B?UnlBUHJYYWlvb0E2NUxjTjJRN09VMVp3dEZnWlJ1SEM0Wi9DUGNqWUJ5dDc1?=
 =?utf-8?B?aXJhSURVOVJ6bWlaeTNiMlduMHd4U1hqNjg5T3kzdUhFYTRFN2lhYjhMRTkv?=
 =?utf-8?B?ZXZJVWpKZ005MWx6MkdnVFNQZWcvaGtNaXB5SDlwUnI4M1hlUEQ5WFYwUzA4?=
 =?utf-8?B?YWpvRXpqblJuQlpjTUIzWnJYV3lrbWZkZyszelNIR0NWcFlIdnpBMkZIaDUz?=
 =?utf-8?B?MDNER0ZQdktMY1l2dmpKT0RQd2hBWmExc1NLbmg2d202UWRyR1J2eHYyV0Yw?=
 =?utf-8?B?R2pyZjJPN0xkdkVUSk0zYzM5MzBiRnlFZytLWjNNd2c5ZnByOGhEcnpGQnR4?=
 =?utf-8?B?dmRDcW5XSmdnNUtteHpsRUZ6M04vd1hJd2tjQkR1cHh0ODBtOUZLTFhGTWhr?=
 =?utf-8?B?VktkKzU4UzY4ck0rV3pjTUZ4b2dTTkk0Mjk5SmNNMkYxZ0x3UDZuaEl3VG1h?=
 =?utf-8?B?RkRqTjFiTEh1emxPVC9kL3V6YjcvTGJqcFd0REhPeWlIMU9BZDVHU2tYUXZr?=
 =?utf-8?B?RS8wTlZWaXBFS1cyeFZMOWpMMXRtLytmN2JFNFVxclBVT3NacDZjU1Iwaktt?=
 =?utf-8?B?b1hsbGx2cDdLYTZTREFBM0FzMjV1WDJnbWlHLy9hSDB2NnFUeC90bU0zbHBX?=
 =?utf-8?B?ejVEK2xnazkxcDBkRlg1aTQ2V0NaTmtpNjBzRlBZZXQvWlBlOWo5T1pJKzAy?=
 =?utf-8?B?SkVGM0hrV1FuZWYzb3NxWDB2L0ZKYzdqZlpXSDhyOEZPd01PcUoyY0NtT2lE?=
 =?utf-8?B?RDRneFJlZm9ySHFJOGhUMXk1b3IvaUNpd2Y2b09nNjdoNGVUeUs3YmY3ZDBz?=
 =?utf-8?B?b3NxREJsZi84SXlJcXIyeWt6b3RuaENleGNQRmlPL1dRUXpBUHA3dFVrNDNV?=
 =?utf-8?B?UVBjTVlicUNpOHBFUlJySmJMUENkTjdJU1V2b1pMRTFtblAxTUdPOUw5dEtG?=
 =?utf-8?B?dnpPRTVJTkdtVlU4cnQ2Y1hjeEZzOHU2endWUkZlWjIyS3hzUWZOTk1ITVhS?=
 =?utf-8?B?NEJqYkx4UUUwbFUrUDFCcmZyQVgrVXRLQUVvRUtzTlRGTFRYaUU2eEhmLzND?=
 =?utf-8?B?VU1HQ0NjcndYOHlZSG9qVnh5ZlVNN1YxMHpqVTNlSUxPdkFzSlYvWm1QdHFR?=
 =?utf-8?B?RkFrQ1owK2lHY2oweElEdXVSOUJIaDhwRXRYanpySTVOajB5UTNmYmZ0c2NB?=
 =?utf-8?B?WUt5VzBwallnVjNjY0xQYlUreTJpYUVqSGFQZlNtSDFteSsyNUlwcG9kcU9H?=
 =?utf-8?B?RUdLSlJNY0FncEJUSFVEOGh6SEpLbjhPVUVWc3ljL1ZjbHpCUTQzRW1TMFVY?=
 =?utf-8?B?SGZ0b1dWQm93eXJYa2dkaGMzTXpQd0xYcHNRbmZISTdtSVVta2N0b2JncjJz?=
 =?utf-8?B?TWN5VFpOek5jVlNxL2l1SFRYUXhMUW8rZHdHVjN2ZHlBWU5LY1RKTVlSM1lB?=
 =?utf-8?Q?1gKYbLVv4jrj6BjeaR4frH4VicT3JSb/16DN1Gt0kKN6?=
Content-ID: <9C185838D4009B4B89EBDD03910C157F@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a34eb7-c936-4183-fe18-08de30a2a09b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 06:26:57.0546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1x9owUi96nMyXwfr3uwAbWnuD/pMDW325Qd1N/JavthD3sFgmn6g2eu+8CDcIIefy6FNaSqSTCimUBdf8LDcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7169
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk Kim and Chao Yu, On 11/24/25 23:11, Chao Yu wrote:
 > On 11/25/2025 2:33 PM, Christoph Hellwig wrote: >> On Tue, Nov 25, 2025
 at 09:10:00AM +0800, Chao Yu wrote: >>> Reviewed-by: Chao Yu <chao@kernel.org>
 >> >> Sending [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.62.30 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQ3XH-0003wU-PT
Subject: Re: [f2fs-dev] [PATCH V3 5/6] f2fs: ignore discard return value
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
From: Chaitanya Kulkarni via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk Kim and Chao Yu,

On 11/24/25 23:11, Chao Yu wrote:
> On 11/25/2025 2:33 PM, Christoph Hellwig wrote:
>> On Tue, Nov 25, 2025 at 09:10:00AM +0800, Chao Yu wrote:
>>> Reviewed-by: Chao Yu <chao@kernel.org>
>>
>> Sending these all as a series might be confusing - it would be good
>> if the individual patches get picked through the subsystem trees
>> so that the function signature can be cleaned up after -rc1.
>>
>> Can we get this queued up in the f2fs tree?
>
> Yes, I think it's clean to queue this patch into f2fs tree.
>
> Thanks,

Gentle ping on this, if it's not already queued up, otherwise please
ignore this email.

-ck



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
