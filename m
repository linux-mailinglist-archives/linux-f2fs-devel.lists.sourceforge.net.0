Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFcGHkKJdWk2GAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jan 2026 04:08:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B857F906
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jan 2026 04:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFJ6y9r1gx7r2SyUaHJbJK1u6ncvY64cuviL3Z+s8a8=; b=VgFOxAExiRZdnaSm174ITvohNH
	2pqHX3B94Fl5Z0X3Qr6d/pjMgoFhvU+RFqdghparzjwk3xAzTx1BYy+VsHRfMQnaU6nsHVv6LXqPB
	w82DZ/wzRwL8SArM2t86M8B0O3gr6uxemGQ92wUTU2dtMnPAOwa36benNgBNDRtTwR90=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjqUT-0004Xn-Kx;
	Sun, 25 Jan 2026 03:08:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaitanyak@nvidia.com>) id 1vjqUP-0004Xf-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jan 2026 03:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i3/j+i8Hh6Mf0cSNe444HWsnKmO1Iv4pWK4wI/xFhec=; b=JRqOxYeCWVBedHcaR0DygfYaVo
 hsGFzXddzjzhU1KbdR2+AsGj8j4hguvJOI/kJkli5a0ySmACx2mRKca/peH8bciOoZYK6wRCZKfu6
 spdn6Mtn9k5xKMHRHNAVRObbAJuzEmZzaZ1S8KorCAOiUS86P8pgQorQXjQNWZ3FrRkc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i3/j+i8Hh6Mf0cSNe444HWsnKmO1Iv4pWK4wI/xFhec=; b=jPuZ5JX+yr8cM+Ke2UtTNfLRDf
 22o8+RRI8PgnpntpSBMMs5VuP0AMa7dXI3cabEOgMnvmwuLtzrP5w56d33JbJN1EtFf3q7AFzbIV8
 MQ4MUga7LJhvC4U8slyFymXjgI7xa+nPQVHxhMHHEuOSoCHvNKCvwzwRnxrn63046OMs=;
Received: from mail-westusazon11010013.outbound.protection.outlook.com
 ([52.101.85.13] helo=BYAPR05CU005.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjqUP-0004zm-BQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jan 2026 03:08:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxec1wlYWy8lyBUkrMRkdAHFjgB9RLlIAbkDnYov21FKQ4f0TDLNbrwiTFCHOD2nXLktmMcPoWtYxV+F34Rb3AMchWVB03Yzi6ZpVsf9bZj6ziPnq6yPq8rYW226m1menOzG0GD2P7aS9wEZldyHrqNxUcARgafLfuWStMaJcMp3c/n3hDrynAs6kvJYHjV5mHYdyLwkSrq3UZH61IXrGyuZ+aSsWkrMD/zEU93+VIy4qxzyUPFFBeHvK2820t5IXwCXG/HBUtNmJ0e7nbkgsKdYn0ORa7vgvWQgi6zF9CFfxfWgthLUjnFXJxw6RY2Kf7XuWDpQlwAB/lFE04mRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3/j+i8Hh6Mf0cSNe444HWsnKmO1Iv4pWK4wI/xFhec=;
 b=xWS/aGgdpsc2WMtDJ3bwlOxolU3Tdqm/4es1fMNS3dcqMKAktPAaRG3lFFxst7OaavvUMDUKOTw5WRnoGnXw4RDfnLIuP/cfdkbWqR7hBg0V0cVEC0edCSvcNSr8/Vh+VAKwIfsf/vkmfTK/9vLLRnM/le96Z5PPtdjd1m4hrrY5OTmHKrJmu6shGvXrkLxHZJJm1YTXDhhxjvnJAmi3zTa53BTG/OcA4K/87edfh8eRaLQNWop1GGg5aoyWen1Ril3ve+tl69y4fqBpd5BFlPT8mACjFSUDkuAd8v+7cNe4ZyiVPJHW6EJ3sEmDSqLa/wG7gxlH7kQ4iHZVd8x06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3/j+i8Hh6Mf0cSNe444HWsnKmO1Iv4pWK4wI/xFhec=;
 b=J2zTnJl3cRgy7art1/T2PzRMciNuR+ARqHAP3UiCH3k/oV7BMLvoIYiqkJ+LV6AJZ8c61vXFc/fTNrMT90+ukL6q4dc/Glk11l2TRYkeqJVGHO2jJaLDuHYofEQ5lHzNJI/n1T8CdbzYD62uGto9EUhYbDpQC/cM1/kB6N7QtRcfhKkpf7YG/JLXKR59iXcLaT79FdHWvWT+LFcauE/lKMErN/C/+Cx7djmJUTDQHbtFOAaP9w/g7NDDKdyTfBWpoA1FDGHAWnZPqk0UcrxxpOrU7MQKgrtXk9eqtAGBKdYBYCTah7OkmtSFTLkV/bAqXu6UYw/bXacN2LoX29TTIA==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by CH8PR12MB9767.namprd12.prod.outlook.com (2603:10b6:610:275::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 21:35:16 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 21:35:16 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, "axboe@kernel.dk"
 <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>, "snitzer@kernel.org"
 <snitzer@kernel.org>, "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "song@kernel.org" <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>,
 "hch@lst.de" <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, Chaitanya
 Kulkarni <chaitanyak@nvidia.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
Thread-Topic: [PATCH V3 4/6] nvmet: ignore discard return value
Thread-Index: AQHcXZzXDfTSuV3W4kihFfciFgwCxLViN28A
Date: Sat, 24 Jan 2026 21:35:16 +0000
Message-ID: <942ad29c-cff3-458f-b175-0111de821970@nvidia.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-5-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124234806.75216-5-ckulkarnilinux@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|CH8PR12MB9767:EE_
x-ms-office365-filtering-correlation-id: a6e00b11-19be-4a89-641c-08de5b907745
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?R1g5RXEyMVJ3MnJydUpiK2hDUnljQURnMC8zVzZORW9vMUJRM1VjNFlGYWRw?=
 =?utf-8?B?V0xQOUJSVnpnakE0bFJNemVZVWl0OWdyTzUyMFZoZVVUQ2VzNTJnZFlTRDBw?=
 =?utf-8?B?L0dKV0NKMHRGb3RUY213YjZmTzF2YlduUzB3NE8wTGx3NVR1V0Vqdy81UytD?=
 =?utf-8?B?V3JWc2x3eHBLV1VVMmt1VmdpMkZVV1RpRWFMdlRaSS9RdndZYXdhL3M5ODdZ?=
 =?utf-8?B?RGdxVFN0SHBLckNLSW1yR3c4cVVVaUpjTXhuL01vSjg3cWxyWUZWbDlOTDdu?=
 =?utf-8?B?Smp3ZVFwUGUxTWo0N2NDYnUzZWFvT1NtOEoyY1NNamFFNFV2SHdvWjFmL095?=
 =?utf-8?B?Yy91NldmLzVjd2RXblVTNzdnZ0llLzhLQ1F6LzdDS3lzaW9oU20xZzdNMHVo?=
 =?utf-8?B?eWZFUU5oS2tPa2NGbStMNy9xKzJjdEVvR3FTaE1IWVBnOVZ6NDBHVGVnYklP?=
 =?utf-8?B?bzNtYmpmbGdxSThhdHdQS1FHV25CbFBXOUhiVkZtVlVYZ0wrQksrSDM2aUxz?=
 =?utf-8?B?dkVFNVQ2dmpYSWNpYkhDMHFQekxoUERkZjhlam4xQ3dxT1NtVGRRT0p4Tzh0?=
 =?utf-8?B?YlhETjFkMkppSkprbC9oaTZ2UTdhQzRUbUp5eFlpaUptME9WWlhMbFhnN20r?=
 =?utf-8?B?NFRadll3M1IwZFZTeExEQ3d6VWRPNmpyeW1HUWpsSmpZa1pjVDJpSUZmRmk4?=
 =?utf-8?B?SmtaMlJ2UVpFLzFwdDYrNGtBK2M3aDZLT3RaaFNJSmpyaTV1ZGZnSGZoTUpu?=
 =?utf-8?B?Uk4yNU54KzM2VS9sVDlmTllWMDBvelpQVWVKWHZDQ2pDUXNZRC9tRkRyWU8r?=
 =?utf-8?B?cG1OTEUxbkN5L295eHNidXR6UDZsYmU4NDdQOEhiL3pkMjJoR2FQaVJmZU1V?=
 =?utf-8?B?YUI5aDRFSys0V2pXRmxXdVB5SGcvOGpZRURrWlFZNXAxUm5CQzlMeS8xYVpG?=
 =?utf-8?B?bmZqTGxwd3BUME1iTS9zaDIrcVh1NmFvenVJV0dZdmQyazQzcFU0M2ZOV2M0?=
 =?utf-8?B?YUJCQklrTS8wa0NQTURUNCtkY2xWT2Z3OUdSdW9KbHlqMU5OWW9rcHYyc3Rh?=
 =?utf-8?B?c3oySC9FZHZtTENwalZGTTllN1Bic0psb1BIVGZZMjVxV0xlNkN4bW9SdVZh?=
 =?utf-8?B?U0hQcCtrTXBLMkxwcjVrK0JnUmpSM0xZNThoMXFhZ2lHWGlEU2ROUjFON2c2?=
 =?utf-8?B?T0tseGZrQjJjdS9mcERhWnpZMFBSK20vUXgyNWltZHFudFlialMwbG83NkFT?=
 =?utf-8?B?MHljMFNKQkppNWw2SnpRRDBRY0oyMUhhcmNlTDVPOGNBMVRHSFRoMCtLVzlK?=
 =?utf-8?B?U0JIa2JUSFg2a2tHSTV0KzBUekZzOVI4NU5UQ2RCR3hlUzA5WGN2d0VyZnBH?=
 =?utf-8?B?cUNybDdLY3J0UFdwT0tQeEpUTklzRVh0b1EvNUgvN01CMGttL05NQW94bVRS?=
 =?utf-8?B?YXVkc2pTeDVYamZ0L0RvazhaWVVNOTNwcVB5Y0xDQUN3ZENOaGxhSmY4K2JN?=
 =?utf-8?B?WDZsY0crTC9CbVY3M3J3RjMzSCtiZHRLSFd5cnZYbG1FVlExcWJ4TkR6NWVP?=
 =?utf-8?B?RkpVUWFLOU9JZFpmNlhmMllBNTlibUl2RS9PR0pEalR5U2l2UVFBa0o0bWdZ?=
 =?utf-8?B?SXpzWitwWVVXT0trR3BNcHFxWFZqTHI2V1NDeW9SeWpsOGdVZ1JlZzdsM2h3?=
 =?utf-8?B?RWVhMUpHaVVyVVJnUHlXYS9yOXRVWjd2aVJKL2tZUzBFSWZhOUdVS2ZPWTdl?=
 =?utf-8?B?YkdsT295S0ZBNHk3OWxKTXBNZUhoNjN6R1E3V3l6dFhjMlY1N3RYMG02SGU3?=
 =?utf-8?B?bEVpbmdwMXRDU0VXZk9SY3dld1g1bzB0Q1JPSDRSYmRsWWNtTHlhREs0YjZl?=
 =?utf-8?B?NDFuZCtFd0pUYlNpN3l6U3dySGlWcTJ4NGlGbDhUZmplTFJUUkpZdGtrR2lX?=
 =?utf-8?B?TVQxb3V3T3N1Q0VvejlGNkUxZ2ZMcFJibmdSTGgvM0Y2MUZJY1lPS0ltRm02?=
 =?utf-8?B?dW94VmMxR3M4a2hkamlRb0l4S2VBWnAraWtHRWU5YWNmYTdSWTBkNjU0QTZG?=
 =?utf-8?B?OVBReFlLWURUWkxJYWt1NWt5Y2lFSnppaHVlNUtPTnV6QytVUEFOS3Y2OWpx?=
 =?utf-8?B?YkRpRmtxVi9BdXpYTXZaTUFseFJUVlY5RStKV3hKdXhaSXJMRHdzUnRHTmdq?=
 =?utf-8?Q?q0ZwQW6bmANMsc8BQihm59OsvZD4dZK3kr8CmEtWn254?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9404.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWtXa283Ty9jdENlK1FPRTRlQWIzMXRQQy9sNUFsR2lCY0hveHNiOUpaSS9F?=
 =?utf-8?B?czltUjlMTmRpc2xMNUI5WnJMSFJneHJUTlJ6NXpwWE9xM0cyWkZlZVZqb2M2?=
 =?utf-8?B?YUJSUzdPUmxGeHJOOFN6RXBVNXg0Nit2aW9NNnJpUlg2T0xidlcya2djcXJD?=
 =?utf-8?B?OWtldWNZN3BhQlJtb3JmcUU4a1ZHSzNsOERTRnpWUm10M0Q2UDU5N3MybkZs?=
 =?utf-8?B?TWxEMUp3RUdjbXFoVDdnOWtLWTZNQTdhdU9yRzJ5dTgxRWE3TUlIbzdhNENl?=
 =?utf-8?B?ak96b3JTSW9aenZPeDl4SDVlcWRlMzlXaGw1YVl2aG1WclNTakI4cXdya2I1?=
 =?utf-8?B?M0tuY3I1QjJ3ZEx5OTNKY1FYdmNwZVczcjBQVCtkVzgwT0tHUGx0MmpvSVQ1?=
 =?utf-8?B?NGZnRitzamowQTQyWEtiQ3I0UUt0akx1YVFGOEFqYlJWalJlc0JqeHZQcGhV?=
 =?utf-8?B?d2FubEt3TEIvZUV3MVUrcHBTbmV3R0gxVDVJTnVtS0ZmQWxXMTJrTEtXWmlI?=
 =?utf-8?B?dXF2U0R4eVJwc3BDM2JvY0pTQlQxakFGTTVCdVRVWS91NDM3RldZRDZRSWll?=
 =?utf-8?B?ZTF3MjYzZDVhaStVMjRRR0hrY3hEQ2poWGhDZGpGZXhOcXRENW1ScWpPWGo2?=
 =?utf-8?B?RG9aanV4SGFDcy94SlFlRzFSc0VCRmRwSjdIcC9RUDZkaGZwUzhiV3JTV2Rr?=
 =?utf-8?B?TE5pMXpzWWJBdlJuL2lMZ1lBN2J1TnVwbzRDTXYvVFdKNEo2dE85b1JqdnBO?=
 =?utf-8?B?K3JDb040Vm1lQ29ZZ3crN1B4dktxMExVNURSZCtFZ1E2VHhzNWlHYXU3dFFu?=
 =?utf-8?B?OHJPNDNRaTBtMnV0R0l4YzI0TWhJZzZFdDdVbzViNkY0N3k1NmEvQlQveThI?=
 =?utf-8?B?WUxwQjJua3pFcUpDcjJDQXpFUW52Q1owQzR2dWRHbEFOekRnUWczVW9WYXl6?=
 =?utf-8?B?SklnN1doK2xEVWNhRG96eVNxU1hOOGRRMVYyckw0bTcrSXlWSVZSN2JBcGNp?=
 =?utf-8?B?U3U0Qnc0ZmUxUldWSWZaL0VIc1RSL3FlR3hDbXZoQTBDUjUxQ1d5V1ViRDJZ?=
 =?utf-8?B?QzYyUVdGaFM3OGV0OVlUaS9yYjZVQmtYUjgxMEhxK213OWRxWHRGbHZkQUpn?=
 =?utf-8?B?L00wL216aUU2LzgzSmNuR085U1pCRmxSWit6Yks5UDJIMDJqanRaMDU3WXk1?=
 =?utf-8?B?bmpxd1lRSmlBb09CVTQzL2d2R0NBdnB3SklGSUFPQmNnN05SQVVreldhSUNq?=
 =?utf-8?B?clYwM1RITXZKRUQzQVM4anEvVnNjTjJTRDlMY09lcTJUa0pqRHJzakdMNk5X?=
 =?utf-8?B?WHdtMy9QZEY1SEhsQ0lidDBhNWxvZUdGbzlxdzJMZDFRZGVRTldmYllydlVC?=
 =?utf-8?B?NElrTFZEemRTT0tvL1BXVHhCRE1wVys1Y3ptbWt2RTIwYkozMU5JS2FlN2xx?=
 =?utf-8?B?QkYxVVV5dWk5L2tUOFdzZXQ2R28wUVlmQit6RlAxN3grTUNHN2lFdlB5eS9D?=
 =?utf-8?B?QU1PWWtQcW9JLzYxWXRzdXBFK29FWmQyL3AzcG50dDlNN2pQMmdhS25KUGEw?=
 =?utf-8?B?Q2Z2WDQxU1FhdEttQlJ4MjBDL2tXUEViNjk2UkU1VmxOeGZIcUhJbG1nR0Fp?=
 =?utf-8?B?Tlp1M1ZOUHU1OGhvTTd3d3JQVUVkcm5QUTBMR3p0ckc1L2QycHFNZG1ReTJz?=
 =?utf-8?B?eWZzeXZEWTlXd1lJYzBoc0N1aFFnOHZIdmRjT2JnZGFkSjdMeENUQlpEd2V1?=
 =?utf-8?B?K2U0WU1OSEUwWWplbldtdm1HZEFidFEzNFplVmk3WVVrY1p1MzY3d0QrTk9j?=
 =?utf-8?B?ekdRTlFaWEIzREp0SWh0M1BrTDZhMGltem9IQll5UHUrWjRiMzZQWXlrNHJs?=
 =?utf-8?B?aFVsZEtJWHdYRGVsZzYwclJGRjh1Z1l1ak5IV2FzTWpBZ0MvamtXRUM3T2Fh?=
 =?utf-8?B?cnVIb2UyVVN3bE9QWkYrQ3FIWEgrMU84N2FLR0hxc2tYTnRwa2lZTHdyOTR0?=
 =?utf-8?B?ZWN1ZW9KNnpmeXpWN0xKRVEvUkhURVAzeVFFaXlIUFd1YVE5a3FVUFZnTXZC?=
 =?utf-8?B?K1BRa2daRzVsNVVHYkIyR0VydkE5a0Z4Zy9CTkdJWnlKby91ZnZHWmd2dlN5?=
 =?utf-8?B?RERKR0tuR1VtUzlYWVh3L1pTZGN1TWxtSEJ0dGtKL1pvWDhIN3l1M04xTjhp?=
 =?utf-8?B?RTdyS1RrSmRvbnRBLzRqNzNuRy9HMkFXc3hzbCtXdGhZZFQyWDNlVmRlMElm?=
 =?utf-8?B?STc4NVBReEJWZVBFSWV5ZHhZVFBUanI0RGNRQy9vcnpvVnJKeVhqSDhyaGE1?=
 =?utf-8?B?cU9SR0VKTloxV25qUUpoRXJUV0JTNTU3c1didXJMbFI3cURlcFdxbCtmT09N?=
 =?utf-8?Q?/+V9gzjEGigs9XkJDeL+JW3QqxBrA2Yh0ejGk?=
Content-ID: <5DD6CA08F101B94A9B9A86A8DB710E7C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e00b11-19be-4a89-641c-08de5b907745
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2026 21:35:16.7191 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WaFZhpieHAO+wJtaGX4ntCIvi/e9yAlqh6H1RdG3yeKymIQ6Go/jTmai1CxASsxPqqQAk/fQbDGwS12BPIfi0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9767
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/24/25 15:48,
 Chaitanya Kulkarni wrote: > __blkdev_issue_discard()
 always returns 0, making the error checking > in nvmet_bdev_discard_range()
 dead code. > > Kill the function nvmet_bdev_discard_ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [52.101.85.13 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.85.13 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjqUP-0004zm-BQ
Subject: Re: [f2fs-dev] [PATCH V3 4/6] nvmet: ignore discard return value
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
Cc: "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckulkarnilinux@gmail.com,m:axboe@kernel.dk,m:agk@redhat.com,m:snitzer@kernel.org,m:mpatocka@redhat.com,m:song@kernel.org,m:yukuai@fnnas.com,m:hch@lst.de,m:sagi@grimberg.me,m:chaitanyak@nvidia.com,m:jaegeuk@kernel.org,m:chao@kernel.org,m:cem@kernel.org,m:dm-devel@lists.linux.dev,m:linux-raid@vger.kernel.org,m:martin.petersen@oracle.com,m:johannes.thumshirn@wdc.com,m:linux-kernel@vger.kernel.org,m:linux-nvme@lists.infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-xfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.dk,redhat.com,kernel.org,fnnas.com,lst.de,grimberg.me,nvidia.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,Nvidia.com:s=selector2];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chaitanyak@nvidia.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,Nvidia.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,wdc.com:email,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 60B857F906
X-Rspamd-Action: no action

On 11/24/25 15:48, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making the error checking
> in nvmet_bdev_discard_range() dead code.
>
> Kill the function nvmet_bdev_discard_range() and call
> __blkdev_issue_discard() directly from nvmet_bdev_execute_discard(),
> since no error handling is needed anymore for __blkdev_issue_discard()
> call.
>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
> ---

Gentle ping on this, can we apply this patch ?

-ck



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
