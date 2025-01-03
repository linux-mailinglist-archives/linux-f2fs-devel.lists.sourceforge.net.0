Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CEA004AD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2025 08:00:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tTbfU-0005qE-5Y;
	Fri, 03 Jan 2025 07:00:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tTbfR-0005q6-Rp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jan 2025 07:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9gtnmOgAaTbl0oHj+2EmKnGFtiir0jCR9ue2zj4+tB0=; b=ccCNi6xaMNvo/76RbnyRmOn9pc
 faYpncJWfNBwVaIOtWsayf8iDlP9WISlhB4p6QxLB/Hg222+3VpOZu7+6nrTfQpSiIckKhVaw6LeG
 9P2rIcEQnqsv5WiPeQA04Le2HERjzwn7CEqgSJRxa8LNJ3MoKzbUmqQntmstCN4CrgPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9gtnmOgAaTbl0oHj+2EmKnGFtiir0jCR9ue2zj4+tB0=; b=ac0+MpI3pYqlO+bmqu+ugmhRcR
 wL6qYhmMJXy8L1U9sjPfgY9duvlgxl3Gqq1kW+SRpeFBRUuJzkXFiSTh4zvDWcH8kGapONjnqlQ9c
 BPdciIToU3jXsio1GvuPIcrjTZEn0YBeU2E5N7auTyt5HYLpDYQvWbH8Gj9hkR/TTDvQ=;
Received: from mail-eastasiaazon11011039.outbound.protection.outlook.com
 ([52.101.129.39] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTbfR-0003pw-NR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Jan 2025 07:00:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO67CmfkwVk2MQpVxoLA6uRB88vryBO1MCG3rBDxVfGPmVdZtU509YlO9AIlJgDSnkuU/kUFhr+CYj4MPxKg4WP6UDH1AgkrIyAWSND9AeNSrZ03NHlNZSDDE/5gn/wX/ZpPKqH7h4if5lpH64qPR3txyzIKHYvWm2FQFedadN0XohPzRHueNauDAc3dB4IS66rA+v5YdurhpjnEq1Rc5K5FkcZL3tGr1aRlLRW+Wge5qvRxuyffDeeAOgUdrUnJUzLZsU/XEpEZtvVMG1yHK8twx+frH3hp1MwWYZD3WTEJaEXBeDwsH5JUz2Z3nsefTzmVw0S++YPdwUTgO4Dh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gtnmOgAaTbl0oHj+2EmKnGFtiir0jCR9ue2zj4+tB0=;
 b=oYxWUgIXM3wgMU5+EMIOSQQs6LKuF786WD84bPNc/X3OA1f0vmwrt1spd+fbbP0YudbKyAhtqiyP0LHVIm2YZnvdME9tk/m5lJvRWfvSouG69BnyvY9AZLmovV8nZB4oxzhHJyho3t4TBBbgzXAUp8G2Onpt7FUcl546KiHjsSzi+dsKmW9d/raCn62e0pPovtSwu9zveqgoRQZpBJpJqNQ1OMngdAkuZXB0MJdF+Uc0EmGMK7QXAeHWRPaFI59kOBWrj147fm678N2wFu08GTKXvr402yG3izoLQ7Io7vggklY1OCzfvkyuhZZ7tgw0EFkL1wMBj3pCG+TNwqT4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gtnmOgAaTbl0oHj+2EmKnGFtiir0jCR9ue2zj4+tB0=;
 b=CznW+Ipazg2BYXxAjL+Ps6e6tppsIlm9wb+XJqtFJbWC6LW1z6Q8CUKS39eoohFDarLSyZ0qCmVvau4z12L6a7hdffhwdFbmdASdAbwEUEr479pmYYBwbkXvD5MrrjD57rwQiDKfTEGOs76cdo9NTH107mXHudVwx0X+zoBgbmAqKgALQOYxAfYW3HK5VuX02DzrhwSxdZFwVpufkVC0OXj/rfL3CwXDbYnqx0By8NCAT2t/ssI342/CDLuUh1jlAdojYw5cQq6jhoNUU6fkpqb5RkYXmbPSOo87sc4VJ3P2jOUkj0m5t2jVyppYE9Gb5pQh/1DbSqbazVs9vlYWaw==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by TYZPR06MB5844.apcprd06.prod.outlook.com (2603:1096:400:284::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Fri, 3 Jan
 2025 07:00:08 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%4]) with mapi id 15.20.8335.003; Fri, 3 Jan 2025
 07:00:08 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 2/2] f2fs: fix missing small discard in fstrim
Thread-Index: AQHbXPyFfMz9pllsAEKjnLK2f7mTm7MEZ0GAgAA5BIA=
Date: Fri, 3 Jan 2025 07:00:08 +0000
Message-ID: <fd75a391-3dd1-4411-806e-0bbb363fcba3@vivo.com>
References: <20250102101310.580277-1-guochunhai@vivo.com>
 <20250102101310.580277-2-guochunhai@vivo.com>
 <b3f919fe-35a0-4253-91e9-fac8666bfbe2@kernel.org>
In-Reply-To: <b3f919fe-35a0-4253-91e9-fac8666bfbe2@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|TYZPR06MB5844:EE_
x-ms-office365-filtering-correlation-id: 50f8d2cc-8dce-4653-0370-08dd2bc44239
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VHY4U0RxZFQ1VGFBRXN0SlBWSTBHMlREdGQ4L3VKQlc3UCtpbEhxbEk4cWd3?=
 =?utf-8?B?dHZ2a1YwRkQ5MTBGRjZWUE55Tjg2b1ducUNWWnpoK08vcmFFT0c2VUxISE9O?=
 =?utf-8?B?RGRJOVdkS0lVSTNRTU5UMnlYYTZ1Q29rV21BejBuK05EaTZ2RnJWMmN5THpY?=
 =?utf-8?B?QTdCc2lpbHhRZkxSbnNkSk5pQ3F5LytIRlJvRXJGVXA0N3doT3hsYW9iNUU3?=
 =?utf-8?B?UTJMVmw3cTQrd2RFeXh3UjRndlVOVXlDd09ieExYOGZUSUVicHVlR2NRcjdm?=
 =?utf-8?B?UWJ4My9aMDdPbWtEWk5VYkN3SjRScDN5L05mR3ZpQnErRW5UNlpKY3pseUhR?=
 =?utf-8?B?YlpDeWdJS2RoT1BJeGdUWU5qdXVWMUU2bGZYVHR2YU0vNVV0SGR3eVIwWENF?=
 =?utf-8?B?eXJtNE9jK29XNGJNM2hLeng0cEdNNlY0VjF4MlRqbW5CWVRKYlhCd2ZtRE5k?=
 =?utf-8?B?TlFMV2JQOGNWS3Vnd0lCM0lyeWhKWTRJUTFTK2ZNOGJHRE9qYzZQVVRqSkNM?=
 =?utf-8?B?OGlQL2Y3OUVQeTJCWkFGd0pMNlluYjlIQkZmcUlNY1VYb1lNSzdyZHdwNk9i?=
 =?utf-8?B?NHUxMXBiSHM5UlpsSHFlay9NYjRIK3VpRHIvaHZEU1hoMmRUYjNFL2t3MGND?=
 =?utf-8?B?RGREa0RyS2V3QnR4b0ZGNjhMUitNZjZRVmR5b3phMUszZ2xvdmZzb2s1TjNy?=
 =?utf-8?B?UTYzNGJhNFFZYW1wL09lN3N5UTgxbnFScVdyU205YXRaWWV2ZWJmT3llNTZx?=
 =?utf-8?B?RzBuU3FTOVR0ZDBaQmdHU0NmRWY5Nk81djAvd1dDdHJtY0U2TnlBcmtOZEgy?=
 =?utf-8?B?ODNIckp4dUg2dHROeU9ub2NSRU1iU0tFTHlsMW42NzREZEZtNkE0d25HQ0pj?=
 =?utf-8?B?Ti80Qk55M0s2V0JlVGl4SnpUOGJJdUMyYWJiVlFwRlMyOEUyZkVBV3RmL09x?=
 =?utf-8?B?R29DVlhCZGpGMHlIclNoeDdPbGJyY0lxSUdEemsvaTU5NzdyRSsxck1SZWVF?=
 =?utf-8?B?aXNRaTVIUGNOb0V4MW9ZQTE1ekVWNklKZElTVjNuOEdUbFZVb25NZzRpeERC?=
 =?utf-8?B?NXZRSE5pYWRQMGRFbFA3U3NmMzJ4NnN0dUxuKzg2QmJmOWFPditBVk9qMjNB?=
 =?utf-8?B?b1E4OE1ONjZnZVQzTmZtOEtFUm51Q0ZkNzJyUkRybVJ0QUVKaUIxckFzMWgv?=
 =?utf-8?B?ZVMxbmNBY21pNWt1OE5RcVV0STRPUUpyRFduQVg2bFNUZXhQM1JkNDZLTm9v?=
 =?utf-8?B?c1VYZW5GTFYyM2ZTV3JFb0oxU3NTTzk0bklndGVYRStySm9kL3ZMYW52ak93?=
 =?utf-8?B?VEZsLzNFNHpJYnNQTHZSWGJFMSs2ZjVyUzNJSGRjMGl2THV6Nm9vaG00Q3Nq?=
 =?utf-8?B?K20xWk4xK2xQS2c2dWgzeFY3ZkY3RGhRUHRKT0FKRFJpMGp5ZGlCc2VVSndY?=
 =?utf-8?B?dW9neDQvWlo1TkFsbGUxM2RHazRHSEovNTZDemF1YXNBbjI0KzZjTG5kUHBK?=
 =?utf-8?B?M2pnaWRLRCtCNTZ5ZjFwNEZrVDlZT2ZiMFgzUUx5QVFodENHYS9ZTStmS0xx?=
 =?utf-8?B?WVZCdW9YZWdtbld1M05ocGNOVEZmZVhiQU1xdkhyUHpBTGZmWE9LNmY4c2Jk?=
 =?utf-8?B?NlNvOUZXOUg2d2IrQnNwSm1pZ2xFdUpkZmdKanBMbkFNeStydytUYSsvcmhQ?=
 =?utf-8?B?OHVGVDcrY2xaQzFxU0U4K21hSnZ5TUtLSmQzSXJYYnNGU1F3OWdJU2FrM3U4?=
 =?utf-8?B?ak9WblZZYVlLcmhXL1RaUVRLNE1ZNjBLRzg5S3IrZERhTG9WaERGKzd1Q2pw?=
 =?utf-8?B?KzVjRGZxamFGMk56RUhweEpveTBBWGNjVmdMZHpGRmlpTTBCR0xRR3dCWlk0?=
 =?utf-8?B?TWRZTDBHdmJvVkF4YnNnL0haT3pRY281SnpwTnNGMEo4THJ2V05JZDlZU08w?=
 =?utf-8?Q?8U3dytLJsxDUOX5TqORcOl3Nz1/VdWMg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzU4M3JIMHBYdEp6RnBDR2VpdzgxaXd3WmRTcUthT1BhWDZFVWh3dVRTNjk2?=
 =?utf-8?B?Qk0wMXlTZno1QnZYL3lSWnpHZUN0RmpVSUt2OUkwY3dkdDV4ZkVBUW93aHpF?=
 =?utf-8?B?RXY1R09pUFFCYkxzcjZWenAzd29MenhaV1BJMjJ0b3VJTzgrZlBSMVF6T1l5?=
 =?utf-8?B?c1M0bW5pL0tpODJweE1jTXdyd252S2ljVFcrbnp4WGlwdDhmY0V5QWVxZkhv?=
 =?utf-8?B?djdjYTVtN2ducUFzcGZoQWFrRHdIV3ZKbkdnNHdEZU5YeXhNRkRlbnp2aC9x?=
 =?utf-8?B?VUxKLzdRYTdwRnozUEtUZFk1ZHZWNlBYci8ycG84ZjcveHl3dVROY1liZVhs?=
 =?utf-8?B?Y2draDh4T1h1NExWWG14amhnd2Z1RTM2YlBIekFtZmt3VUZOek94dEVma0xr?=
 =?utf-8?B?aHU3ODFyREIxbTh4T2EzT3BFYmlEbjNPZ0szbXhtWUZEa05qWUVqYllIeUVP?=
 =?utf-8?B?T3RkSWhhWWx0c1RXZk1ENXhRWGsxMk9BcndBSGYvN3I5aFBwNjJDcHozWEk5?=
 =?utf-8?B?Q0kwMUhXVXNLSWE5eGh5L3VKaXVPUEQ5RXROTDg2TWZkUU9nUFhabWFtQWp6?=
 =?utf-8?B?TDM2UjBCMi9LSmVaWDMwOFNUY1QyejRWUjdxNjBSRHZXeEpNeE4yWjBPZWVM?=
 =?utf-8?B?QnBQU1RxV2M1MUZEU0tDSjEzdnBQelhJcXFjdDdxU0g4WDhxRlpIcjlUUkNx?=
 =?utf-8?B?Nk9BSjJBblAweFBZZU5JbDBWaWZJTW16bmtTOTl4c09ETVhkMk9VMTdlaWV0?=
 =?utf-8?B?RS9GcEhleWprTmtFTVhyV2s1ZVVLWTMxRElkVlg5MnEzVElUM0oxRFBQVE1S?=
 =?utf-8?B?V21jVEVJb0FkVW95OTJEZHJlUmFuRlJzTk1SUS83QitjZEhoTjJJNDlwRzNU?=
 =?utf-8?B?VzNPbnZ4V2JjRTJWdUpnQSsyRnVGdXZ4b3dEVDVrWHdsUGU0VWFhaVBuT014?=
 =?utf-8?B?RTdUeVJuSkRodXpHVEtMZEdqZExOY3Y4VjNWbzYrMDJHeFhFY2N3Z2Npd0pu?=
 =?utf-8?B?bGZMcXB6TW15aEpQUWJtM29NZXpHc2JZOXNuTDh4T2hxeCtDTGZ5K0pEVVlT?=
 =?utf-8?B?MFVXZG5MUXp4TnRlWmc3bFl6YTA3d2pVblFQNFE2aUxCNDROSlpCODg2LzFT?=
 =?utf-8?B?VHZUcTdpOTNtdWo2WmUwendZTGVrWExKTG9LVzI4SEVhOFcwSjRKQjJCVlEy?=
 =?utf-8?B?OEt5b3FubkllYU1KS3cvQkNxUDEvMk93WFkrbzQ2RGtoZndQSFN0Sk5rcnNk?=
 =?utf-8?B?SnN3SDc4K0Z0TUMwdnNUb00rK05GUTlGMFpaYU04dW1ieTUzclFCRWxoTGl3?=
 =?utf-8?B?NkU1c3Y1U1pvUG1ITWZoZlh5ZmlzUFdkbTBCT2VnZDFrTTR5Q3J1Z1YrK0ZP?=
 =?utf-8?B?amQrZDZoVzZjam5nZGQyWUhKMGNnWmlHMnVMMlVBSWtUdFhsR2NkQ0F3Z2ZW?=
 =?utf-8?B?M1FQMEtQcmxiVVlQeVo0cm9zZmhraUVsbG02MTJCcnBPN1FWeStKY2pkS3hP?=
 =?utf-8?B?Z1JyVUVadWI1M3NRS2tOSHRqZ2N1dGQza0JmeVBra1I0Z21HcW5qMFlZQ1ZI?=
 =?utf-8?B?U0Yza2hWYkJHcmtWZGJyeEZDa1o0Q1plSzdROWI5T25tNUpUMEVXRHhZczJx?=
 =?utf-8?B?d2I5eDJPU0QwMWR0cE9aZkZLOFg1SU5GbW04T2NLVGhoZWNHbnZhbXY2cFFa?=
 =?utf-8?B?NFpBZkVUU2dMQTBBdDJ5QXhSNDcxWk9IMTU2emo2Y1Fyb1ZWSVFaTmhUWDZG?=
 =?utf-8?B?NkJYaVpGbnl6cnBjZ2pWU3ZIY3ViWVV0cDBNcTIySkk5aFBNV2tGT3o2QkJJ?=
 =?utf-8?B?RUcrOG5oYVM1SFhIK3Azd1NqZytWd21jenlNTXZKVTJTVFF1RmM4dFQ3a1NB?=
 =?utf-8?B?QURoZU9HcHdRNkp5eEpDR2dMVDNmcUJqbk45UXdCKzl5em95ZFRZVmtUOElB?=
 =?utf-8?B?SGxBQlRXQStRRVl3amtRcUFIWk9YVnVuOFpCNXlyZy96cFB6c3VtWm5wMmN5?=
 =?utf-8?B?MFlMOG1uazlEa0hic1hVYzhVbUVIWUczazhzSUs1S1hJUVE3VFBpUm11blRO?=
 =?utf-8?B?c2kxVEY3dzZBSjVMakRtemUvU2NHZ1FUYjQrKzQvVVh4MXA3VG5WUnV1TEtV?=
 =?utf-8?Q?ruIo=3D?=
Content-ID: <1E562CFECEEB6E41955BCD2F955311E1@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f8d2cc-8dce-4653-0370-08dd2bc44239
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 07:00:08.0529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XcClVBUWrMixxCEt7G0CuLAn+PUaVK2DIPQytqSpOIR68b37j1OHasxu/3cQcLtKTbTtZUUfp8XVFTQS7RGdDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5844
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 1/3/2025 11:36 AM, Chao Yu 写道: > On 2025/1/2 18:13,
    Chunhai Guo wrote: >> If userspace issues an fstrim with a range that does
    not include all >> segments with small discards, these segments w [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [52.101.129.39 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [52.101.129.39 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [52.101.129.39 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1tTbfR-0003pw-NR
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix missing small discard in fstrim
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

5ZyoIDEvMy8yMDI1IDExOjM2IEFNLCBDaGFvIFl1IOWGmemBkzoNCj4gT24gMjAyNS8xLzIgMTg6
MTMsIENodW5oYWkgR3VvIHdyb3RlOg0KPj4gSWYgdXNlcnNwYWNlIGlzc3VlcyBhbiBmc3RyaW0g
d2l0aCBhIHJhbmdlIHRoYXQgZG9lcyBub3QgaW5jbHVkZSBhbGwNCj4+IHNlZ21lbnRzIHdpdGgg
c21hbGwgZGlzY2FyZHMsIHRoZXNlIHNlZ21lbnRzIHdpbGwgYmUgcmV1c2VkIHdpdGhvdXQgYmVp
bmcNCj4gSSBkaWRuJ3QgZ2V0IGl0LCBpZiBmc3RyaW0gZGlkbid0IGNvdmVyIHRob3NlIHNlZ21l
bnRzLCB3aHkgZG8gd2UgbmVlZCB0bw0KPiBpc3N1ZSBzbWFsbCBkaXNjYXJkIGZvciBvdXQtb2Yt
cmFuZ2Ugc2VnbWVudHM/DQpDdXJyZW50bHksIGFsbCB0aGUgZGlydHkgc2VudHJpZXMgaW4gdGhl
IGRpcnR5X3NlbnRyaWVzX2JpdG1hcCBhcmUgDQpoYW5kbGVkIGluIHRoZSBmc3RyaW0gcHJvY2Vz
cyByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhleSBhcmUgd2l0aGluIHRoZSANCmZzdHJpbSByYW5n
ZSBvciBub3QuIFRoZXJlZm9yZSwgdGhpcyBwYXRjaCBpcyBuZWNlc3NhcnkgdG8gYWRkcmVzcyB0
aGUgDQppc3N1ZS4NCg0KZjJmc19mbHVzaF9zaXRfZW50cmllcygpDQogwqDCoMKgIGxpc3RfZm9y
X2VhY2hfZW50cnlfc2FmZShzZXMsIHRtcCwgaGVhZCwgc2V0X2xpc3QpIHsNCiDCoMKgwqDCoMKg
wqDCoCBmb3JfZWFjaF9zZXRfYml0X2Zyb20oc2Vnbm8sIGJpdG1hcCwgZW5kKSB7DQogwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAuLi4NCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fY2xlYXJfYml0
KHNlZ25vLCBiaXRtYXApOyAvLyBzZWdubyBpcyBjbGVhcmVkIHJlZ2FyZGxlc3MgDQpvZiB3aGV0
aGVyIG9yIG5vdCBpdCBpcyB3aXRoaW4gdGhlIGZzdHJpbSByYW5nZQ0KIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLi4uDQogwqDCoMKgwqDCoMKgwqAgfQ0KIMKgwqDCoCB9DQoNCg0KVGhhbmtzLA0K
DQo+IFRoYW5rcywNCj4NCj4+IGRpc2NhcmRlZC4gVGhpcyBwYXRjaCBmaXhlcyB0aGlzIGlzc3Vl
Lg0KPj4gVGhpcyBwYXRjaCBpcyBzb21ld2hhdCBzaW1pbGFyIHRvIGNvbW1pdCA2NTBkM2M0ZTU2
ZTEgKCJmMmZzOiBmaXggYSBtaXNzaW5nDQo+PiBkaXNjYXJkIHByZWZyZWUgc2VnbWVudHMiKS4N
Cj4+DQo+PiBGaXhlczogZDdiYzI0ODRiOGQ0ICgiZjJmczogZml4IHNtYWxsIGRpc2NhcmRzIG5v
dCB0byBpc3N1ZSByZWR1bmRhbnRseSIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1byA8
Z3VvY2h1bmhhaUB2aXZvLmNvbT4NCj4+IC0tLQ0KPj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAx
MCArKysrKysrLS0tDQo+PiAgICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2Yy
ZnMvc2VnbWVudC5jDQo+PiBpbmRleCA4ZmU5Zjc5NGI1ODEuLmFmOWE2MjU5MWM0OSAxMDA2NDQN
Cj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jDQo+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYw0K
Pj4gQEAgLTQ1NTIsNiArNDU1Miw4IEBAIHZvaWQgZjJmc19mbHVzaF9zaXRfZW50cmllcyhzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMpDQo+PiAgICAJc3Ry
dWN0IGxpc3RfaGVhZCAqaGVhZCA9ICZTTV9JKHNiaSktPnNpdF9lbnRyeV9zZXQ7DQo+PiAgICAJ
Ym9vbCB0b19qb3VybmFsID0gIWlzX3NiaV9mbGFnX3NldChzYmksIFNCSV9JU19SRVNJWkVGUyk7
DQo+PiAgICAJc3RydWN0IHNlZ19lbnRyeSAqc2U7DQo+PiArCWJvb2wgZm9yY2UgPSAoY3BjLT5y
ZWFzb24gJiBDUF9ESVNDQVJEKTsNCj4+ICsJX191NjQgdHJpbV9zdGFydCA9IGNwYy0+dHJpbV9z
dGFydDsNCj4+ICAgIA0KPj4gICAgCWRvd25fd3JpdGUoJnNpdF9pLT5zZW50cnlfbG9jayk7DQo+
PiAgICANCj4+IEBAIC00NjA5LDcgKzQ2MTEsOSBAQCB2b2lkIGYyZnNfZmx1c2hfc2l0X2VudHJp
ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgY3BfY29udHJvbCAqY3BjKQ0KPj4g
ICAgI2VuZGlmDQo+PiAgICANCj4+ICAgIAkJCS8qIGFkZCBkaXNjYXJkIGNhbmRpZGF0ZXMgKi8N
Cj4+IC0JCQlpZiAoIShjcGMtPnJlYXNvbiAmIENQX0RJU0NBUkQpKSB7DQo+PiArCQkJaWYgKCFm
b3JjZSB8fCAoZm9yY2UgJiYNCj4+ICsJCQkJCShzZWdubyA8IHRyaW1fc3RhcnQgfHwNCj4+ICsJ
CQkJCSBzZWdubyA+IGNwYy0+dHJpbV9lbmQpKSkgew0KPj4gICAgCQkJCWNwYy0+dHJpbV9zdGFy
dCA9IHNlZ25vOw0KPj4gICAgCQkJCWFkZF9kaXNjYXJkX2FkZHJzKHNiaSwgY3BjLCBmYWxzZSwg
ZmFsc2UpOw0KPj4gICAgCQkJfQ0KPj4gQEAgLTQ2NDksOCArNDY1Myw4IEBAIHZvaWQgZjJmc19m
bHVzaF9zaXRfZW50cmllcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250
cm9sICpjcGMpDQo+PiAgICAJZjJmc19idWdfb24oc2JpLCAhbGlzdF9lbXB0eShoZWFkKSk7DQo+
PiAgICAJZjJmc19idWdfb24oc2JpLCBzaXRfaS0+ZGlydHlfc2VudHJpZXMpOw0KPj4gICAgb3V0
Og0KPj4gLQlpZiAoY3BjLT5yZWFzb24gJiBDUF9ESVNDQVJEKSB7DQo+PiAtCQlfX3U2NCB0cmlt
X3N0YXJ0ID0gY3BjLT50cmltX3N0YXJ0Ow0KPj4gKwlpZiAoZm9yY2UpIHsNCj4+ICsJCWNwYy0+
dHJpbV9zdGFydCA9IHRyaW1fc3RhcnQ7DQo+PiAgICANCj4+ICAgIAkJZm9yICg7IGNwYy0+dHJp
bV9zdGFydCA8PSBjcGMtPnRyaW1fZW5kOyBjcGMtPnRyaW1fc3RhcnQrKykNCj4+ICAgIAkJCWFk
ZF9kaXNjYXJkX2FkZHJzKHNiaSwgY3BjLCB0cnVlLCBmYWxzZSk7DQoNCg0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
