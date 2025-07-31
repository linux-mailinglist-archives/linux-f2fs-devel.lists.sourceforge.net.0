Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A4CB16A48
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Jul 2025 03:58:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57t4fsQoii0ZbDCnCoGMhnz9npkTeCT5O9nagixlmgE=; b=Hrg9zRtVAVd+mWbwf1FoRdX0De
	BqO/JWqH26y4keuGj+O1rwHq7YWWjw8xuJVtrlAuHRFwikitlCS2EfAElFopVsR3Fq0MBWnRms2bX
	V6qqCKV25+RvNe8hjwNOLd2DRYHsjmpCvE3R4yivPkzsiX+KPtjMT6UCaiAiODBlwwV8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhIZ4-0005X6-KD;
	Thu, 31 Jul 2025 01:58:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1uhIZ1-0005Wv-8E
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 01:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BLizKTw7+yy6XUjbXo7/EEERHNOO5mmWazZ72l0oswk=; b=ZOjY/PerZl9pjOTqP+LZa/05hn
 KuqePWCQBFX87rkdjfn2rVwa5PjBO/2b8efssgu+Vpvfg/k8iXo6e/mFu1mCgYHgaDNQ9uP17TgYq
 Jv7szDHlxVWHdieBCjW5fbrxpzbOEWDd+rrC7Fl1TzNIor6EaeeWnLhnscSNVYF/RjAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BLizKTw7+yy6XUjbXo7/EEERHNOO5mmWazZ72l0oswk=; b=HlvNv1rxcZA39B8ewMgxTZqUP3
 +DrQ7iVLqrJeek2s2PN3n4mZZ4wnzUc7PsbdSNHrArkf+sh0Q1o+vsiCh+sQUsjELYzF8wrveEux9
 ix+OKMm6FddAoEaylyUDNy/2qAnxXLb5l+unCW+bJqvifmKSGZhMOmG9k6z09DOizO8Y=;
Received: from mail-japaneastazon11012014.outbound.protection.outlook.com
 ([52.101.126.14] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhIZ0-0004XC-EE for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Jul 2025 01:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fwIEsr7cwXvQqVIaBwyCIniKTLfz/GWpDCLLTIerdxJL8rHOC82BsijzUq5Er18w0F/vMFYop6QxD7T51fJgGlRhD8GFSD+Hze2xJ8EMg3CIPU4xTJdkVmgYO2Sif4DtDRPUPyk+gpME2pjCa7SWDdV5Zsqzrcf6qj1P8Rx6Vpzmoi70M7esL7WuX6V+VV8soI5C83biToYh9QX19eRasWAdBYzd3CyAn7d7uVpcr+lyrHkC4NjjccvuFr66VA7P+t1lCFWKNRp89fYpxBbVKEOKCmoXoxJaU1pm9qGR8CAbqgAgYTM8+BdylZjXRAd8LJsCYy/WZRdrMZmp+iR3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLizKTw7+yy6XUjbXo7/EEERHNOO5mmWazZ72l0oswk=;
 b=K6P8nSAm9m1WCBORwiLcSvTf5JiFhdiWRMNa71SeDbc4vJlO++tVQSKqy0wl3kcv4yJNGW+1AyXYYenpZSmQnLldXYKdGQl6Yaz07a59gHhNZvVDR/pXY1cvV/7mAYy3TFfZRj2Twx4qat3HtYbd25SyPQdwNicKM2UHaAk1Ff4jXcBtxHls6mWmInVbRKJNDiYemKU2rE51wugOPi+r2pxDChouZDM1eHnB7K2zHAizMS5mbQqTBsorHfwii4SrG0pzwkvcv1xsTc1NQYS5sswZpbQ2d50fX9+O8joiwAPSeXCIRi9MFrkR+EQjHboOO8cL1d2KxVOgaKK/Nucumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLizKTw7+yy6XUjbXo7/EEERHNOO5mmWazZ72l0oswk=;
 b=LuDM+TmGx4eACYH8laT3j7tI2h+G218Bfw8O4yKhgMp28mF9uh2jae2y8c7f90En9Zc3CJN1y3YWlV5CgNABWI6eXBVuRZHHOvFKYymO7m22bQJqp6HbwrNxHEEteo2sLqIClV5aEL5firDChnUsMwXlYfJJhnpkHTPlPQHJPb6BZLjbekqWnS1to5Dbfw2AjaWbWmPg+BJijAHz4IhEZ9uKf2XfXrpdJbUVSQqzPahzKXJGfnDQUSWLH9mh0hpv6T6KStsHW17BcSglZT5vIm4LioQ63poCzgHin72CyXhIxbfSSQaSPUK9Dgi5DZ4AtBaCrzBG+T26rquNq+adJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by SEZPR06MB5959.apcprd06.prod.outlook.com (2603:1096:101:e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 01:58:18 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 01:58:17 +0000
Message-ID: <d3ced6d7-4037-4962-a2d4-382af0aad4cd@vivo.com>
Date: Thu, 31 Jul 2025 09:58:13 +0800
User-Agent: Mozilla Thunderbird
To: Jens Axboe <axboe@kernel.dk>, Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20250725075310.1614614-1-hanqi@vivo.com>
 <d258ab6d-a97a-4232-bf90-5afedd5cccb2@kernel.org>
 <e1a1dbfe-165f-4cb3-9d5b-8ac4ba61265e@vivo.com>
 <087f7937-20b5-4151-8a3f-5b6b2b045b41@kernel.org>
 <b1cf56a6-d23d-40ca-acaa-07944140b1b5@vivo.com>
 <1b420389-d46b-48ef-aa49-585d84e2710f@kernel.dk>
In-Reply-To: <1b420389-d46b-48ef-aa49-585d84e2710f@kernel.dk>
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|SEZPR06MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: b17bf882-6800-48da-0692-08ddcfd5b7b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2wxNHZXUDc1YmgrT2VHciszN2IxWlMyZGtIREc5OFBmNGIvL0NReUx6SUVV?=
 =?utf-8?B?N1pvNk1zeEtTdG1SRllZRFdxZkphRTNGTkJYTVpHOEYvTEVBSlFSRkFDVHQv?=
 =?utf-8?B?NmZxQWFPVkUyL0lqZHdlTld0R0UwdGs5TVdwdkgrS0FJc1Bta3k4M21INzZV?=
 =?utf-8?B?NHZES284Wjl4UW1XZmY2YUxLdXRGSXZpRlNOUllTYnhFTlVGd2MxOTdpQ1Zt?=
 =?utf-8?B?NXRpUWFKU3JLMzZ0L1lHQlh6ODhKTlIzakd3T2RMcXY2cVpEbDlQTmJGcENr?=
 =?utf-8?B?ekdXMTJaZGdnTjNpWnNTQldMUVppQ3E0OXJPTDFCWTZKV0w1cFNtamVSUVUr?=
 =?utf-8?B?T2dKTFU5Sm85YWxLM00yU01PamMrbE9keERGdVBGVC9zOXpwOUdvK3g5dlFt?=
 =?utf-8?B?eG81WllKd2JndFBWanNLWVpQaytFcTQ1TzdiQW9YOU13Ylk3bjhrTGN6ZEw1?=
 =?utf-8?B?VHphd3Zkdk1nNEtJMkZMZ09vSU5CSFJoRlhvSXdFcmNHazRDSXA3VUNvQll3?=
 =?utf-8?B?aVVRc1VJa3RMT3I4cmlIeDFHdkM2WFNXdlR0b3pJYkN2WWlRWkdzWXcyUExt?=
 =?utf-8?B?N3dPaFpWRHJNemFqRW11RmtUNnJwdjJPUGh5TVZCa1htdkM3bnhSNmxkMERW?=
 =?utf-8?B?eWlrbWN4VDdQd2ZqZnNDem5SSGxVS2JJZjlIdVd6Q2xLSTV5VURIb2RSUm5U?=
 =?utf-8?B?Ny9hMTVwYlF3TEtVTjJwU3ZQV1pqU2FTM2EwUmVUSmxFb045ci9NOTNRcy9n?=
 =?utf-8?B?OHBFbGhMMDJ6djQzM1NYOSswd2NtVTEzRUx6K2YvbkNlRTFROXIwVUZNVUpo?=
 =?utf-8?B?OUZmeGpQeDkxTVNVRktXbnloaUVCQWtFZUw0YU1IejJWMmZMSlpEMFdpTWNP?=
 =?utf-8?B?bGxMRVYyNFdTYTNuZFdIc3AzYkVHL2FyblhJWDJ0R0tkQ0hlWE41M3kvc3FG?=
 =?utf-8?B?MDU1ZFErRGZUQ0pvQWF0ekZJS1NBWDlISHlBK0FMSVRDOWZNRDFNUjV1Wmxr?=
 =?utf-8?B?YkFOanY3MEZVZXVTdDJhWDRoeVZhdUpJc2Y4NmpjbWh2NFROVU92b3YzSkdF?=
 =?utf-8?B?K1VNbHFkaWFzR016YmhXb3lDWFgwa0NhK0JHMi9wOWdjdXdiemlpK09EUVJz?=
 =?utf-8?B?MTVaNEJ2TjJFaE5LQ2NKT2RpZFB1YmViNnB0NFRjYXdsSDk2M3dSWmpGdGlV?=
 =?utf-8?B?Ym1pUTNOMVVQZjhSb3hVT00xNFFWcFJpSDh6cmg5Wlh2MUhVZDdZTkxybzJJ?=
 =?utf-8?B?Q1AvS0Z0WkdXMjRHWUcvdmJJem5QcWFBS0xxSE5IaDRoa2Y5Q0lLckhHUTJN?=
 =?utf-8?B?ZTNvT0NNZ1hGa3hrV091TWZlU0ZSczRCL216b3UydHNZZnRFMm5JRERzVkZJ?=
 =?utf-8?B?TDFWMGpPaHZBcFczYm55UTVKODNZTTJKa3RWS2tXZitvU2N3bUdtUlZBcGVI?=
 =?utf-8?B?YzQ0dG1KbzZiUnRhZVppYit1SG9qTUVVNWpyZ2VCdmhtRC9KeXMrZHVDTmdV?=
 =?utf-8?B?QlQxMWpGWkNnV0o0bWpaNzdTN2plOVlwd3FQb0p4Rzd0WWNSRzFlTnNERVE1?=
 =?utf-8?B?cG5sajMyWWtSRnhDWXc5MlZVckdKMDdTenhSMEpodCtwMnNWc0draVl5bG1J?=
 =?utf-8?B?SnU2MXp3b1BUUExWbzgrWG83Tnd1K2t4dDA0QzlwQW9adjl1NWRUMnBLUytQ?=
 =?utf-8?B?WlFyRVAxVmx5Q0VCSTdGNmxJZ3BHcjBOSlJJRFFtV2R6UHhaakhQY3NabkVq?=
 =?utf-8?B?OXhwRk5kNFNzRzRFV0R2a2NyOHRsUGVxZ2ZNbjllRWd5K1ZYNjhscFpaS1Bn?=
 =?utf-8?B?TXFlWmtFYjdaeTNSNnpmZXdTMVp1UTA1a3orcE5KQWg1YmJjSEhBaHkvTWN4?=
 =?utf-8?B?akhuanZkUXorSEFGYk9EVVpCRzZia3FVaWlkMVN4RmdIckdGMmtnRTZVeVF3?=
 =?utf-8?Q?YWGXHm+OId4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG1CZVRvbGZUUEhheVgzNFpQbXAxNTV2NmZQd3dER2NDQ09rcjZOUDNxQTJz?=
 =?utf-8?B?bVpPRTI5U2dIQWRvck9PWmw1dHFBSmhOUDhqakRZczNlcnNwK2JKc2VwOUVD?=
 =?utf-8?B?NnlIcWVRdE5kL2RJWTFnRjlwM2RSaUhITkRoY3Bib3Fmc2k3R29ja0VNY1Ez?=
 =?utf-8?B?bCtUdm5YVGVlamdBS1dUNFdpWlpBRUtjN0VqQVFGR2w2dlAvVFBkZDdDZmVx?=
 =?utf-8?B?Rno1VXU2YWFYZDB1UW8vclJTNHd0MFhWNkE2VjNhOFRERlZMd3ZxbTRLT0ox?=
 =?utf-8?B?c09YSTg3cFIzMnVkam51L1grcnBiN3FEdHJSVGFITjYwSDVlay93b29JWDFm?=
 =?utf-8?B?Z3haV2xTQkFDOHlHUkorZWZaQSsyR2M0K0lmTFVQdDFNTExTZW9lZEhaSm80?=
 =?utf-8?B?OXlwa3ZTTWJXSVpZWmZaMTFIS3MvNGJqSWNYckNRbXpjNWRveEdTenhVbktm?=
 =?utf-8?B?Z0RzVnphQW9JNTJaaEVwWTg2Mk1xSzV3Y0xmU2R6ZGljMkU4aVJvSEpzYmNC?=
 =?utf-8?B?Y3VVTWxIQzRqeWxDVFRXbG9Ja3BYOGtQbm03ZXB5a2NpeDJ5NVlPL2svcS9r?=
 =?utf-8?B?NS9wOWcxcXAxWXFOSENLajB0MkZlZlloWStMOHJjVWo4MXdrOFQ1dll0dEtJ?=
 =?utf-8?B?cXZmbnpEM1Y3YzRmRXM0a0UxbWgzKy9EdmxiTlJRY2VoUXhPOUJpSElacVZL?=
 =?utf-8?B?NkZrSjJQZFZVMmdnNjMwbGcyRVRaVERmVDBvMXMzMm1rTmZiYjNMSytoOFFP?=
 =?utf-8?B?ekZPQ21mMWtWR000d1JCaWRhOTJNeEh1QkJRWGFmeVpLbWZZQ2ROZldEazNN?=
 =?utf-8?B?OEcyVlhTM0F3Y0ZseTV4NUlGNXB5S2had29CckxXS1l0THIzTzlEN0lWTE9t?=
 =?utf-8?B?ZFB3R0RwcFNrQVJ0c2hSc3pPSGZJNFd2eDNJdHBBdUJPQ2pwL2JjYlRGSTJr?=
 =?utf-8?B?cWJjc0t1eWh1MjhwUnBpNEFDL3NBM0E0aEZQZnB2NGRhV1htQjFxOEpqYkZS?=
 =?utf-8?B?SW5hNUdwMlRQM0VhMzdhdGlKMEliRTFEZGlWSmZjelVFcE5NaVhEQndvNjlP?=
 =?utf-8?B?NHQrbUJKNzdQUjB6c0c0aVA4QzIyajBCcmJ1cEtVb2dRZ2xrWGV1Z0RRN0Ri?=
 =?utf-8?B?b3hkbWI2NENOMzA1QTBITlowSkVtWlI5WVhuMGhBTzg5S0NoQ04vQ1ZHeVhC?=
 =?utf-8?B?SDduaWhITGRNbDdqa3hubzJEYjk5K3BxbVNjTzFKaTRHbFJ6L2ptaW9Lb00r?=
 =?utf-8?B?OG5NeXJydUxiKzRBK3BQNEZKdGlzMGkxSnRpKzNFdFRvWExFaERBNDBrd0Zi?=
 =?utf-8?B?V2N3Q3BaNkhHT0tkMVNpUXRlRFBVcXJyS25taFlld1UyU1dpUW9ZQVFGZGFC?=
 =?utf-8?B?OHd1WGdNUW5aVXRmWGh1UkZXNWRmcCt4UEpPR2JJZmQzTkpHNVZ1NFc5bG03?=
 =?utf-8?B?TDYyMTBvNEFmQWZobzV6WmZLR2lzb20zU05mallRZEpkeWVFQ0VTOUVGb0li?=
 =?utf-8?B?Zjg0blhHM1BmdlhSeE81MlUzOGJkSGJtaVhZbExHbGxIZU0vMGxXSE5sWWI5?=
 =?utf-8?B?M3N0R0JWUUtIbDBBOXA0RUNjNXpQQmkxUlY1Y0U5MjFLWWVjQWFrUnVPTldH?=
 =?utf-8?B?MlpZdnQ2NVZHSFFEaHRqK1UvVFlGNmNlSXJDZGo3RHdkWHdYTE9VbVh2ZEJa?=
 =?utf-8?B?dzE5amgybGtpRFRXVzV3ZmZTNi9IczNWemZoVU11dmFBZVVTQWt0NDRPdzRw?=
 =?utf-8?B?VTVpLzcrS2VwTjNaMjJiTTFJNEk3dmNGSi8xTHZEdjA4NWhncStWNFRIYWxx?=
 =?utf-8?B?NUJxQ1p6b1dlZFJCeXhyZGp1dnA5MEdYSW9yVlN2Q3pqR0JYMzNQcEhaWmpw?=
 =?utf-8?B?cyszbkgvN3RaSEFHMVJoekNOTmszdzgyQzhtQ2tPUEJTd1o2cW9yZGFUNk9x?=
 =?utf-8?B?d3NpQXBuckNZcm5tS3hUS0xJMlJ2eUdTUm96YlRERndra1BYc2xUZlRNUHBJ?=
 =?utf-8?B?M0Nxek1XakYzdjVWT1plQlFDS2sweWZibXpCOGpZSGN4VFZBdWNKdmZzVHdt?=
 =?utf-8?B?ZUlMR1JiWEZBQmVORFAvOVBnaGtiSEt1UGNaM1JXMDVndUxSSjNFZkNIcmFR?=
 =?utf-8?Q?YEe5lOE2JbCn1XBWGXakqp4zF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17bf882-6800-48da-0692-08ddcfd5b7b2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 01:58:17.7003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVkPimv58Eh/RRXnaXLdyd/qOegRHCMdCFS/4A2JDskE1gm0tlM4ptCsO7LyEubwKMghdD1c2h8YOOMBk9jtBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5959
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2025/7/30 23:20, Jens Axboe 写道: > On 7/28/25 2:28
    AM, hanqi wrote: >> ? 2025/7/28 16:07, Chao Yu ??: >>> On 7/28/25 16:03,
   hanqi wrote: >>>> ? 2025/7/28 15:38, Chao Yu ??: >>>> >>>>> On 7/25/ [...]
    
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [52.101.126.14 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 ARC_SIGNED             Message has a ARC signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
X-Headers-End: 1uhIZ0-0004XC-EE
Subject: Re: [f2fs-dev] [PATCH] f2fs: f2fs supports uncached buffered I/O
 read
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
From: hanqi via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: hanqi <hanqi@vivo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CuWcqCAyMDI1LzcvMzAgMjM6MjAsIEplbnMgQXhib2Ug5YaZ6YGTOgo+IE9uIDcvMjgvMjUgMjoy
OCBBTSwgaGFucWkgd3JvdGU6Cj4+ID8gMjAyNS83LzI4IDE2OjA3LCBDaGFvIFl1ID8/Ogo+Pj4g
T24gNy8yOC8yNSAxNjowMywgaGFucWkgd3JvdGU6Cj4+Pj4gPyAyMDI1LzcvMjggMTU6MzgsIENo
YW8gWXUgPz86Cj4+Pj4KPj4+Pj4gT24gNy8yNS8yNSAxNTo1MywgUWkgSGFuIHdyb3RlOgo+Pj4+
Pj4gSmVucyBoYXMgYWxyZWFkeSBjb21wbGV0ZWQgdGhlIGRldmVsb3BtZW50IG9mIHVuY2FjaGVk
IGJ1ZmZlcmVkIEkvTwo+Pj4+Pj4gaW4gZ2l0IFsxXSwgYW5kIGluIGYyZnMsIHVuY2FjaGVkIGJ1
ZmZlcmVkIEkvTyByZWFkIGNhbiBiZSBlbmFibGVkCj4+Pj4+PiBzaW1wbHkgYnkgc2V0dGluZyB0
aGUgRk9QX0RPTlRDQUNIRSBmbGFnIGluIGYyZnNfZmlsZV9vcGVyYXRpb25zLgo+Pj4+PiBJSVVD
LCB3ZSBtYXkgc3VmZmVyIGxvY2sgaXNzdWUgd2hlbiB3ZSBjYWxsIHB3cml0ZXYoLi4gLFJXRl9E
T05UQ0FDSEUpPwo+Pj4+PiBhcyBKZW4gbWVudGlvbmVkIGluIGJlbG93IHBhdGgsIHJpZ2h0Pwo+
Pj4+Pgo+Pj4+PiBzb2Z0LWlycQo+Pj4+PiAtIGZvbGlvX2VuZF93cml0ZWJhY2soKQo+Pj4+PiAg
ICAgLSBmaWxlbWFwX2VuZF9kcm9wYmVoaW5kX3dyaXRlKCkKPj4+Pj4gICAgICAtIGZpbGVtYXBf
ZW5kX2Ryb3BiZWhpbmQoKQo+Pj4+PiAgICAgICAtIGZvbGlvX3VubWFwX2ludmFsaWRhdGUoKQo+
Pj4+PiAgICAgICAgLSBsb2NrIGlfbG9jawo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4gVGhhdCdz
IGhvdyBJIHVuZGVyc3RhbmQgaXQuCj4+PiBTbyBJIGd1ZXNzIHdlIG5lZWQgdG8gd2FpdCBmb3Ig
dGhlIHN1cHBvcnQgUldGX0RPTlRDQUNIRSBvbiB3cml0ZSBwYXRoLCB1bmxlc3MKPj4+IHlvdSBj
YW4gd2FsayBhcm91bmQgZm9yIHdyaXRlIHBhdGggaW4gdGhpcyBwYXRjaC4KPj4+Cj4+PiBUaGFu
a3MsCj4+IEkgdGhpbmsgdGhlIHJlYWQgYW5kIHdyaXRlIHBhdGhzIGNhbiBiZSBzdWJtaXR0ZWQg
c2VwYXJhdGVseS4KPj4gQ3VycmVudGx5LCB1bmNhY2hlZCBidWZmZXJlZCBJL08gd3JpdGUgcmVx
dWlyZXMgc2V0dGluZyB0aGUKPj4gRkdQX0RPTlRDQUNIRSBmbGFnIHdoZW4gdGhlIGZpbGVzeXN0
ZW0gYWxsb2NhdGVzIGEgZm9saW8uIEluCj4+IGYyZnMsIHRoaXMgaXMgZG9uZSBpbiB0aGUgZm9s
bG93aW5nIHBhdGg6Cj4+Cj4+IC0gd3JpdGVfYmVnaW4KPj4gICAtIGYyZnNfd3JpdGVfYmVnaW4K
Pj4gICAgLSBfX2ZpbGVtYXBfZ2V0X2ZvbGlvCj4+ICAgIEFzIEkgdW5kZXJzdGFuZCBpdCwgaWYg
d2UgZG9uJ3Qgc2V0IHRoZSBGR1BfRE9OVENBQ0hFIGZsYWcgaGVyZSwgdGhpcwo+PiBpc3N1ZSBz
aG91bGRuJ3Qgb2NjdXIuCj4gSXQgd29uJ3QgY2F1c2UgYW4gaXNzdWUsIGJ1dCBpdCBhbHNvIHdv
bid0IHdvcmsgaW4gdGhlIHNlbnNlIHRoYXQgdGhlCj4gaW50ZW50IGlzIHRoYXQgaWYgdGhlIGZp
bGUgc3lzdGVtIGRvZXNuJ3Qgc3VwcG9ydCBET05UQ0FDSEUsIGl0IHdvdWxkCj4gZ2V0IGVycm9y
ZWQgYXQgc3VibWlzc2lvbiB0aW1lLiBZb3VyIGFwcHJvYWNoIHdvdWxkIGp1c3QgaWdub3JlIHRo
ZSBmbGFnCj4gZm9yIHdyaXRlcywgcmF0aGVyIHRoYW4gcmV0dXJuIC1FT1BOT1RTVVBQIGFzIHdv
dWxkIGJlIGV4cGVjdGVkLgo+Cj4gWW91IGNvdWxkIHBvdGVudGlhbGx5IG1ha2UgaXQgd29yayBq
dXN0IG9uIHRoZSByZWFkIHNpZGUgYnkgaGF2aW5nIHRoZQo+IGYyZnMgd3JpdGUgc3VibWl0IHNp
ZGUgY2hlY2sgRE9OVENBQ0hFIG9uIHRoZSB3cml0ZSBzaWRlIGFuZCBlcnJvciB0aGVtCj4gb3V0
LgoKSGkgSmVucywKClRoYW5rIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9ucy4gSSBhbSBjdXJyZW50
bHkgd29ya2luZyBvbiBtb2RpZnlpbmcKRjJGUyB0byBoYW5kbGUgdGhlIGRvbnRjYWNoZSB1bm1h
cCBvcGVyYXRpb24gaW4gYSB3b3JrcXVldWUuIEkgZXhwZWN0CnRvIHN1Ym1pdCB0aGUgcGF0Y2gg
c29vbiwgYWZ0ZXIgd2hpY2ggRjJGUyBzaG91bGQgYWxzbyBzdXBwb3J0IHVuY2FjaGVkCmJ1ZmZl
ciBJL08gd3JpdGVzLgoKVGhhbmtzLAoKPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
