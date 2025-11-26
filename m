Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19817C889DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 09:22:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPhRonKSwXf+B6+mbE00GFcWOgjIeCtBsgnAJgKxHvY=; b=iO2XJZIkHpOQzSqs5o+oSv/4vI
	nVkGHiI71IrESV+W9auyYCJseQhAtsZaJFoku5P9oVvjJkDccxqMKywLxxCvbQXaiJQYntzjMYZJT
	J4d1iTTDpuwm8LIM1ICqMqW/ftSnzPfa3p/3XuiwRtaDIl2v5v1bwyG2joWRzraKFTCs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOAmh-0006AC-5d;
	Wed, 26 Nov 2025 08:21:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaitanyak@nvidia.com>) id 1vOAmf-0006A4-4w
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 08:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mqw5O+7e5SyK2j4vzv9GxwyKniINb6eim1H7kOPG6Gs=; b=iNrnokdI1UIOmNaNsEA+bnNms1
 DsPoc3WnXsHMKZIQ840PmGRKx7WL264mEBRlEYG5OFq7WCHLqgZ9riJaJZxHr6MAxGNDqpR9ZTixM
 1LSw5oQ/yp4jM10oMrSLxKzKbL0k/YvA7FoMr0VaYNYb8a60YVMQy068C+bg7x0rHQWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mqw5O+7e5SyK2j4vzv9GxwyKniINb6eim1H7kOPG6Gs=; b=Ny0unpOfQMtRQXo80vvZqaT2PI
 tbbpobITwm+DQ4rNr+JS5g7eWM/aPRCC3PiGQ/gTMJKH+gaZ/G6q6ugNXi945BTKReiP+ngAbbSVT
 KbBtaJfG6SCbUYCtnen+vbIM/AkpnKyOqN+Gl3JgeOhNToxhAfOrQrgh/Z7Gblx5VHfU=;
Received: from mail-centralusazon11011022.outbound.protection.outlook.com
 ([52.101.62.22] helo=DM5PR21CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vOAme-0003vQ-F7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 08:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nde3C4cg/4ewGpAOAO36nPhnY4dq9dgHaDUOS5qQc8yz8jBRoF5MlXFqA0iopG6PdIFnzWf58PHAbM7l33FApoe0kemiZ0+nABOun7IRX4SDGrVMn/2zqj7V16hZ31y/llyl9sn8Tb6qCHsyIjSXrry0Xp365MdJjpL8ndgGYA4J2EeNFqgBuHtqH+nF+qkklSbyxNvEuLGDLIcFqP9i457G5APt8V32zJZEUYrZJ/b0Nmsx2zQxkZe/M9CkFLzLiusyez9lUVzw3ZKRjpxvHBydCRqnpPvJ0Gdn9JDy3oskq7fKqjVvNKwfPbqnMura1pc+6koBc3bKUM8rj4YBcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mqw5O+7e5SyK2j4vzv9GxwyKniINb6eim1H7kOPG6Gs=;
 b=PeVp++m9WXWyoKBo+bx8h9xPLP6gPojfkV3SkZgc8Q/6S7V4Unk+Udk930pJcaQNVPrFVAyRUuCjYKqdGYuGgOfqOdNEnqpTpAQdC3esCuqneTswVNz1iIiv5Ziaypac5jdt9hP3XdBTmBK6vl9ZqMePAOKHNYELagYIkQTsZgJk46KZq81MenTFxgwGvKdyFnxkR/9LGhogQh45LHd/WdYHXlle0hkbtbrppoYNqx8MY/u4TRTAFeK3WpfkzKlB2LNWvXdLAMOG1uqG385ip5Ye/mIvoyhQj5a4l6MMKz6YnBuBBON8Q+SexNIXC6qNvWzwWciSu9D57O8GwvhfAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mqw5O+7e5SyK2j4vzv9GxwyKniINb6eim1H7kOPG6Gs=;
 b=aSUAFgz4jvZZQzQrYHiqNSd2152EzA9m0Fytuo2IcqHJEta+q4DWp4ke9LihOTVhrpk1x93Jy7luaq9poOUMxqSBDrmDBvZOI1ZnU0z/kERjArKqPHyiygmSi0sAukYxjzvsv1P+epxSxD2rUrhZPMVcG2CQlwtqnR3LBisd2tWFeXc/SGjOV9+usK/3qgO+flFNfZcsAMNRZWT+AE+1DuNjLzcYOqyW+NQgIz8O+BlC+wQkWVbjxDhv1E4CfKDv/qRwaxNG3Gfbrl9H/UPrSgnMNGnLQ9iWW6dZQcEmaQLVn/6uEHm38kgJNqNutm3bOU3TMsDe5MeLC3YHBHdUXQ==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Wed, 26 Nov 2025 08:07:21 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:07:21 +0000
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>, Chaitanya Kulkarni
 <ckulkarnilinux@gmail.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "agk@redhat.com" <agk@redhat.com>, "snitzer@kernel.org" <snitzer@kernel.org>, 
 "mpatocka@redhat.com" <mpatocka@redhat.com>, "song@kernel.org"
 <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>, "hch@lst.de"
 <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, Chaitanya Kulkarni
 <chaitanyak@nvidia.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH V3 6/6] xfs: ignore discard return value
Thread-Index: AQHcXZzYTTMNsQDUtk+Pu9E/Yu2pabUEP+cAgABcPwA=
Date: Wed, 26 Nov 2025 08:07:21 +0000
Message-ID: <218f0cd0-61bf-4afa-afb0-a559cd085d4a@nvidia.com>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-7-ckulkarnilinux@gmail.com>
 <b18c489f-d6ee-4986-94be-a9aade7d3a47@gmail.com>
In-Reply-To: <b18c489f-d6ee-4986-94be-a9aade7d3a47@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|DM4PR12MB6351:EE_
x-ms-office365-filtering-correlation-id: 8187c75d-5d70-4879-8bf9-08de2cc2d330
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?a1VOUjJkUk1QSGY2eS84cjlBNFYvUzZGTDFXcjNKTnRvU0VJWDhsY3RHeVJw?=
 =?utf-8?B?Um9ZTU5oSVN1VTc2MlJZSFkxMzFpdDREN2ZIY2w1cy9zZDNoVmpSVUpnT1pR?=
 =?utf-8?B?enArcWlROHlmV21oYUVndXhpUHRTTjRpd3BYSi91REovN3F1cFhOT0RGRC93?=
 =?utf-8?B?bFlydGpobEw0Lzh1SW9EY3N0SHUwMWd0WTJhcVI0WVRGWkpDUlpvYmVua2ZQ?=
 =?utf-8?B?TzNPdFVFU29MbzU1ZTBCWW9jYXFJL3lwZ0U0NXNXK1JLbFowcnpORFVMTVA2?=
 =?utf-8?B?NW43M045cVRaN0U3bURTTk1nZnE3Z3F6SG9HcjVUTnZMZEJVR3diQlBMTldX?=
 =?utf-8?B?RXVGVzMxdDBSRDZMSnJ4YW1mVmZYWUlQaUtZU0FhdU1lYnllYlRDdG5Sa29k?=
 =?utf-8?B?UGhBRE5zU1pKOUFKbk1sWi9aNzVWYTVpaXB3Vm1QaVBxaFIxUW9LaEJZSjFY?=
 =?utf-8?B?eHBGdVhMdjRyRTZ3WmdzSlJTRkQ1QW1IbmJhOEtJdUVWUXE0aHkzWU50WUts?=
 =?utf-8?B?MTVDci9xL1M4Rk1QODhwakNJdWdxd0VlRFJwLzVXZDdtL1A4YXA2ZXBDR1ly?=
 =?utf-8?B?UkVPcmZlaXBkc3FyaHRSdXVFaEFGWXJwK0ljRERLcytaanJ2QVNXTnY4Zjdy?=
 =?utf-8?B?MkVMNVg4ZkNTanBFSmJrR0xIUGtTUE95NlVQRWM2dmVPUmdNN0F0a3JDVXZ2?=
 =?utf-8?B?Vlh6a1JSbEJWcGtHRE1JNkJNUjd6M3Y0WlA1S2dBU2tOVEdJZ1MvM3dENkQ1?=
 =?utf-8?B?UkNkRzJ1QWxBOFNGM1NaNU5yREV4UmhwUjhJa1I1UUZ5TWlYRGk5VmpITXZI?=
 =?utf-8?B?MkkyYW9hOUQrQ0FNMkxHZmYyQWg4VU1iYVo5SjJ6c3JiVFhUb0htR3laYmVk?=
 =?utf-8?B?S1ExdndwQWJ2WS9mTXlPbDVjQW02MTg2bjVlNWFDRzQ2c0tmbXpaYmU0YkVC?=
 =?utf-8?B?R0JGeFpxM0hacEYrbkR2bW1rdWZxTzIyWmdjeWxQUG45M2dEckhGT1Y2enM5?=
 =?utf-8?B?cVBmY1NGVHF3N2tBQWR6dUY3cnpyTVF1a0hiNW5OSlo2K2xyK3VYYW9VL0xJ?=
 =?utf-8?B?REg2eUgvVUlXY0wwSGtQRVdPNnNFTDFvNm0xTnUxZ2N4eEc4Q3JoUjhKa2c5?=
 =?utf-8?B?YUY5dzFzWDQwK3lSd2U5UUsza1k2OFMzSXI4c0tpNEczQUFZeVQvdW9IV0lz?=
 =?utf-8?B?WTZWQ0ZEZm1nRUpxNlY3eEtEbURrQUpTUkhEbThwM2FHT1FmMG9HbzE5ckFF?=
 =?utf-8?B?NmQwRjRBczl6RG1hTmlKWmNhM2IxMWVZa2hMbW1sQXhUTy90eEdPeG8vRCs0?=
 =?utf-8?B?NDhNUjlRcHRESUpMWlpVT0V1NHFRWjZnVm9SUmN3T1p2cUhPWTBpbnJOczZo?=
 =?utf-8?B?Z0FIa2RJdTAxbFk1WU5BeHNyeDlBcWdSQjhSaml0ZnBRVUdDRm04bmQ4TUZz?=
 =?utf-8?B?Y3ptdytmWDU1dzc4aXA5eFBkNEN5SnhabEovSWRCWEd2M1VTSHljZDd0TUpa?=
 =?utf-8?B?bjg2Zjg5cThhUFlCbGVHYTF3dGhkMnVDVVZwSzdMRXJoTHozc2FjR3Jld1VB?=
 =?utf-8?B?TTM4M3d0UFVNdUQ4THk2enVsYXg4OTVqRHB3U0ExR0JVSjMvNEtRdldOL1k4?=
 =?utf-8?B?NGNxZHV5dG5pZnFESENzVkVyWTJnYmc2eXQxdDRGdkZTMEt4ZFJMNDdJKzJD?=
 =?utf-8?B?cnFJZHpZQUNpeWM3d1ZhZ3p3eUZQdHJ1SlIwMURoR2xITlo4NWVnU1VuTU56?=
 =?utf-8?B?RFl3OGg3T1VxdDZSODJGeEsxTjJkSVdvTVlnS0dlbVh5cU95dGM5eU11SjFZ?=
 =?utf-8?B?ckRHNkpJZGhPdTVHRThuUUVWd0lzWXhuMU5FenRCNk5KWlRhS3h3Z2RjUGpa?=
 =?utf-8?B?aFQyYUp1OHdQU1JrQlJWaXZDd2NIS1BkM3Z4QkZKeEJMTVBjRFkwT25sb1J4?=
 =?utf-8?B?OUdPallWbDd6VzRNN0oycE1zVEV6SEd1WkZnNkFCR2dHZ1JoN2I1QSsyMzZ4?=
 =?utf-8?B?eGRNbU5scXBlZDlBZXBNSGQ5QlBHOWx2QmpjWnB6M3hsTytxQmE5dDFmS01v?=
 =?utf-8?B?cm04RmtKbXkrMDU5WUs0eG5tQTdKTys3dEp6QT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9404.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk9tVUNHWCtQdWhObjd1dEVybUwxMFBKTDBuczVQb2J3QXN4WVFjdVdEd1cz?=
 =?utf-8?B?blNXSDZkMmRpdlA5MDQ5VHEwOHNuOExQVHNFa284eUdJTUE5R2dLckc1VnVk?=
 =?utf-8?B?YTlMbVExa0VpRFJKSmhvZ0ZpWGxwNUYzYlU3WWN1YUpQcWVGbXRrRHpRdHB5?=
 =?utf-8?B?VmNpYytIaFJ0eVBrRk1LazNCVllIb0pRNTRZS0FVVFJGeGpRdmd5N2M5VW9s?=
 =?utf-8?B?UWg0SnlWS0VHM2tuQXZmR0wxNTk0eVJtRVpWZnhZMEtNOFlKWmhjZ1o4blla?=
 =?utf-8?B?Rjh5UmwzRktVZ2MwT0RWK2Y3eE1ZcUU1RjNWQjA4R2x2QzQwckJ6N0RSK3di?=
 =?utf-8?B?cG5Ta1RjSURqd0hsRGhjSXZxK3RwSkVpdlU3RkdIMlFNR2I1SXcvSUEwbnFT?=
 =?utf-8?B?N2tncXBHSzFxUDhhQlg0VUx0cVZybnliNkNGa1dwMW5jaDgwVitmcElHWlRD?=
 =?utf-8?B?RVplOGtQaFpDdEwvcVV0U0NwMDgxTlQ2clVLMXc2THYrdkJ1YkRCVTNEYXdZ?=
 =?utf-8?B?bWM5Umwyc0gzcnFxUzVQd2I4WFlMRllPdGhlZ0E0ZmVVWUlMdlZqVklQcy8v?=
 =?utf-8?B?dWsxWmI1b0RVMWhFL2liWGJDWFVqaUt1aDdtOUkyYWZob0psNTJ4eVM4cFVx?=
 =?utf-8?B?bDlOY0I3ZnhVcG5zVzBTS1c3VUJOMFFHdUdqZkpwUHlSMlZxNnBRbW5pZDFI?=
 =?utf-8?B?TENtdTdTMVZkdWdzWnVnMmR4djU4S2tySGhnS0wrbEFOT3UxOEJrVGFhaDlr?=
 =?utf-8?B?emhZZ3AyYlRqTEFJSDZWaFFyRjZBbUg0QUZEUUEyYXhGMmpBbi92TDFYNTVl?=
 =?utf-8?B?MklUMDNFb3l0WFhiTlJvVnNTYW1lNDl4SGtaZVdSNlN4eFBYTVhnOVFSNEow?=
 =?utf-8?B?UHUrTUhBU1RxK0haQmhBMVYzT1hydlRiaEQ3RWVPMlpPWEtCQkRuM3ZybU9m?=
 =?utf-8?B?aHcyMWVLdDZNT3Fscyt5UG5Fb3N3ZUtrSFlxN0NhOEg5TGNJUmRZZENEWmxy?=
 =?utf-8?B?QnVabzZtTEJUVy9Id25ZNSt0dTR0b1dYeHdXS1l2MEtJTHhRK2FXMzRRd1JX?=
 =?utf-8?B?NTZwUng3Nys0UDJPOTViMkhVSzF1YjR2Y3hCb1VWWHVIVnEwbEM3anJrK2tC?=
 =?utf-8?B?eEZwWTBtajdFZlVYY29rbDUvcHA0MFFFRVlXalJYVnhrbkZpdktIcml3RHFN?=
 =?utf-8?B?YU5RUEZaVjMzMnlHaC90ZHAwSnpzTWVLdTRGcXFRRHZ0VEZaN0dqUW1YMU9Y?=
 =?utf-8?B?R3RNaFhoVDRhbWFFdDB5aDRZMkVmbnhRYlZyUC9VUW1WMkU2Nyt0QU1XS2Vs?=
 =?utf-8?B?SXV4TEdZTFdqYmErM1hMN0ZKTmViUHFuUDRWcGNYUUVFQS9YNU5xcVhNZS93?=
 =?utf-8?B?NVh3UTRHOE1IR3VIWlBiUk9ncGRIdWNUYU5oUVZrM0VneldRU2ZyWWVXcXFq?=
 =?utf-8?B?d05zUlF1WDZLVGZDOFJtMFpQVVhoeEkwQVdRNGhpWUc4dFRqWENlTDdHdW1s?=
 =?utf-8?B?Y2VIVTR4b0VMand2K3FqcjMzRGRGVG9FL1I5VG9oR21nck8vZWJGL1dVRVln?=
 =?utf-8?B?UFRGUjgyN2JoVkV4QmE5aU5BRUdLdXQ1MCtYUGkzQlA3b09vcnZ3Y21KTEIr?=
 =?utf-8?B?bkZncWd6YnNiVmxOaDVLM0lMZ2YxZk05OTBJbHpiWnhGN25DYWtoMFlhSVFo?=
 =?utf-8?B?ZHlPa1NwZEhMZTdzeDNHT21WQ2hPUlk2TWRFbklpQ0ZzRnhkYzFlQWJCOUlF?=
 =?utf-8?B?dHkzQVR2a1NvSkgzK2laaDJIeWZReVUvSU45Z3I3Q1N1WTE2cmduanFkUWpi?=
 =?utf-8?B?ZndNbElBYU9lazFYSjZkZ3AzVlF0cmQrUkc4cFVyTFduL0xXVjVlRHdNUVhv?=
 =?utf-8?B?cXgrS3BxZllkbXBndXNwY3NWWE11ZjlvK0d6S1Bmb2pBUzRaQ2Z2b01mbUMw?=
 =?utf-8?B?T3NlbFJIK3pyRnlTZjJUNE9NcDhlMmUwL0xTdDgwMTM0VTJLNEFCSWxjaHJB?=
 =?utf-8?B?SEptS1FBamhwMGJEWXluNVFyMnk3a1F0bzNvT0R3OHBiU2s3d1hYdDVUN1NB?=
 =?utf-8?B?SWFTVk9DT2VFZTB3YlFWSGdkYkgxUmd0TlNnVThOeGxkdDA2WEpRcTMwVlNE?=
 =?utf-8?B?VDMwZi9Ia2RQbVN2Rk1MYjVyNEp1TWRzTFhrTW1WSTBxRCtLRFNWTkdiTHpu?=
 =?utf-8?Q?XWvQaWNwv+iXwJOLOgfdIAfsad+sIJhRPZo+aGQJAsaQ?=
Content-ID: <ADEF572C73433C49BFC28F83D1794A71@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8187c75d-5d70-4879-8bf9-08de2cc2d330
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 08:07:21.1292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPFW3SD4bHXMiw5md0S7cZLO46a6HddjGMK+s8zCMV/sZQnxFHV/r+Q3CNk83AXfvNRoDkZY8THa3foNDmh5gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/25/25 18:37,
 Yongpeng Yang wrote: >> diff --git a/fs/xfs/xfs_discard.c
 b/fs/xfs/xfs_discard.c >> index 6917de832191..b6ffe4807a11 100644 >> ---
 a/fs/xfs/xfs_discard.c >> +++ b/fs/xfs/xfs_discard [...] 
 Content analysis details:   (-0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.62.22 listed in wl.mailspike.net]
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vOAme-0003vQ-F7
Subject: Re: [f2fs-dev] [PATCH V3 6/6] xfs: ignore discard return value
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
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMjUvMjUgMTg6MzcsIFlvbmdwZW5nIFlhbmcgd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEv
ZnMveGZzL3hmc19kaXNjYXJkLmMgYi9mcy94ZnMveGZzX2Rpc2NhcmQuYw0KPj4gaW5kZXggNjkx
N2RlODMyMTkxLi5iNmZmZTQ4MDdhMTEgMTAwNjQ0DQo+PiAtLS0gYS9mcy94ZnMveGZzX2Rpc2Nh
cmQuYw0KPj4gKysrIGIvZnMveGZzL3hmc19kaXNjYXJkLmMNCj4+IEBAIC0xMDgsNyArMTA4LDcg
QEAgeGZzX2Rpc2NhcmRfZW5kaW8oDQo+PiDCoMKgICogbGlzdC4gV2UgcGx1ZyBhbmQgY2hhaW4g
dGhlIGJpb3Mgc28gdGhhdCB3ZSBvbmx5IG5lZWQgYSBzaW5nbGUgDQo+PiBjb21wbGV0aW9uDQo+
PiDCoMKgICogY2FsbCB0byBjbGVhciBhbGwgdGhlIGJ1c3kgZXh0ZW50cyBvbmNlIHRoZSBkaXNj
YXJkcyBhcmUgY29tcGxldGUuDQo+PiDCoMKgICovDQo+PiAtaW50DQo+PiArdm9pZA0KPj4gwqAg
eGZzX2Rpc2NhcmRfZXh0ZW50cygNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHhmc19tb3VudMKgwqDC
oCAqbXAsDQo+PiDCoMKgwqDCoMKgIHN0cnVjdCB4ZnNfYnVzeV9leHRlbnRzwqDCoMKgICpleHRl
bnRzKQ0KPj4gQEAgLTExNiw3ICsxMTYsNiBAQCB4ZnNfZGlzY2FyZF9leHRlbnRzKA0KPj4gwqDC
oMKgwqDCoCBzdHJ1Y3QgeGZzX2V4dGVudF9idXN5wqDCoMKgICpidXN5cDsNCj4+IMKgwqDCoMKg
wqAgc3RydWN0IGJpb8KgwqDCoMKgwqDCoMKgICpiaW8gPSBOVUxMOw0KPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgYmxrX3BsdWfCoMKgwqDCoMKgwqDCoCBwbHVnOw0KPj4gLcKgwqDCoCBpbnTCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVycm9yID0gMDsNCj4+IMKgIMKgwqDCoMKgwqAgYmxrX3N0YXJ0X3Bs
dWcoJnBsdWcpOw0KPj4gwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGJ1c3lwLCAmZXh0
ZW50cy0+ZXh0ZW50X2xpc3QsIGxpc3QpIHsNCj4+IEBAIC0xMjYsMTggKzEyNSwxMCBAQCB4ZnNf
ZGlzY2FyZF9leHRlbnRzKA0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgIHRyYWNlX3hmc19kaXNj
YXJkX2V4dGVudCh4ZywgYnVzeXAtPmJubywgYnVzeXAtPmxlbmd0aCk7DQo+PiDCoCAtwqDCoMKg
wqDCoMKgwqAgZXJyb3IgPSBfX2Jsa2Rldl9pc3N1ZV9kaXNjYXJkKGJ0cC0+YnRfYmRldiwNCj4+
ICvCoMKgwqDCoMKgwqDCoCBfX2Jsa2Rldl9pc3N1ZV9kaXNjYXJkKGJ0cC0+YnRfYmRldiwNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgeGZzX2dibm9fdG9fZGFkZHIoeGcs
IGJ1c3lwLT5ibm8pLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBYRlNf
RlNCX1RPX0JCKG1wLCBidXN5cC0+bGVuZ3RoKSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCwgJmJpbyk7DQo+DQo+IElmIGJsa19hbGxvY19kaXNjYXJk
X2JpbygpIGZhaWxzIHRvIGFsbG9jYXRlIGEgYmlvIGluc2lkZQ0KPiBfX2Jsa2Rldl9pc3N1ZV9k
aXNjYXJkKCksIHRoaXMgbWF5IGxlYWQgdG8gYW4gaW52YWxpZCBsb29wIGluDQo+IGxpc3RfZm9y
X2VhY2hfZW50cnl7fS4gSW5zdGVhZCBvZiB1c2luZyBfX2Jsa2Rldl9pc3N1ZV9kaXNjYXJkKCks
IGhvdw0KPiBhYm91dCBhbGxvY2F0ZSBhbmQgc3VibWl0IHRoZSBkaXNjYXJkIGJpb3MgZXhwbGlj
aXRseSBpbg0KPiBsaXN0X2Zvcl9lYWNoX2VudHJ5e30/DQo+DQo+IFlvbmdwZW5nLA0KDQoNCkNh
bGxpbmcgX19ibGtkZXZfaXNzdWVfZGlzY2FyZCgpIGtlZXBzIG1hbmFnaW5nIGFsbCB0aGUgYmlv
IHdpdGggdGhlDQphcHByb3ByaWF0ZSBHRlAgbWFzaywgc28gdGhlIHNlbWFudGljcyBzdGF5IHRo
ZSBzYW1lLiBZb3UgYXJlIGp1c3QNCm1vdmluZyBtZW1vcnkgYWxsb2NhdGlvbiB0byB0aGUgY2Fs
bGVyIGFuZCBwb3RlbnRpYWxseSBsb29raW5nIGF0DQppbXBsZW1lbnRpbmcgcmV0cnkgb24gYmlv
IGFsbG9jYXRpb24gZmFpbHVyZS4NCg0KVGhlIHJldHJ5IGZvciBkaXNjYXJkIGJpbyBtZW1vcnkg
YWxsb2NhdGlvbiBpcyBub3QgZGVzaXJlZCBJIHRoaW5rLA0Kc2luY2UgaXQncyBvbmx5IGEgaGlu
dCB0byB0aGUgY29udHJvbGxlci4NCg0KVGhpcyBwYXRjaCBpcyBzaW1wbHkgY2xlYW5pbmcgdXAg
ZGVhZCBlcnJvci1oYW5kbGluZyBicmFuY2hlcyBhdCB0aGUNCmNhbGxlcnMgbm8gYmVoYXZpb3Jh
bCBjaGFuZ2VzIGludGVuZGVkLg0KDQpXaGF0IG1heWJlIHVzZWZ1bCBpcyB0byBzdG9wIGl0ZXJh
dGluZyBvbmNlIHdlIGZhaWwgdG8gYWxsb2NhdGUgdGhlDQpiaW8gWzFdLg0KDQotY2sNCg0KWzFd
IFBvdGVudGlhbCBhZGRpdGlvbiBvbiB0aGUgdG9wIG9mIHRoaXMgdG8gZXhpdCBlYXJseSBpbiBk
aXNjYXJkIGxvb3ANCiAgICAgb24gYmlvIGFsbG9jYXRpb24gZmFpbHVyZS4NCg0KZGlmZiAtLWdp
dCBhL2ZzL3hmcy94ZnNfZGlzY2FyZC5jIGIvZnMveGZzL3hmc19kaXNjYXJkLmMNCmluZGV4IGI2
ZmZlNDgwN2ExMS4uMTUxOWY3MDhiYjc5IDEwMDY0NA0KLS0tIGEvZnMveGZzL3hmc19kaXNjYXJk
LmMNCisrKyBiL2ZzL3hmcy94ZnNfZGlzY2FyZC5jDQpAQCAtMTI5LDYgKzEyOSwxMyBAQCB4ZnNf
ZGlzY2FyZF9leHRlbnRzKA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeGZzX2di
bm9fdG9fZGFkZHIoeGcsIGJ1c3lwLT5ibm8pLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgWEZTX0ZTQl9UT19CQihtcCwgYnVzeXAtPmxlbmd0aCksDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMLCAmYmlvKTsNCisgICAgICAgICAgICAgICAvKg0K
KyAgICAgICAgICAgICAgICAqIFdlIGZhaWxlZCB0byBhbGxvY2F0ZSBiaW8gaW5zdGVhZCBvZiBj
b250aW51aW5nIHRoZSBsb29wDQorICAgICAgICAgICAgICAgICogc28gaXQgd2lsbCBsZWFkIHRv
IGluY29uc2lzdGVudCBkaXNjYXJkcyB0byB0aGUgZGlzaw0KKyAgICAgICAgICAgICAgICAqIGV4
aXQgZWFybHkgYW5kIGp1bXAgaW50byB4ZnNfZGlzY2FyZF9idXN5X2NsZWFyKCkuDQorICAgICAg
ICAgICAgICAgICovDQorICAgICAgICAgICAgICAgaWYgKCFiaW8pDQorICAgICAgICAgICAgICAg
ICAgICAgICBicmVhazsNCiAgICAgICAgIH0NCiAgDQogICAgICAgICBpZiAoYmlvKSB7DQoNCklm
IHdlIGtlZXAgbG9vcGluZyBhZnRlciB0aGUgZmlyc3QgYmlvID09IE5VTEwsIHRoZSByZXN0IG9m
IHRoZSByYW5nZSBpcw0KZ3VhcmFudGVlZCB0byBiZSBpbmNvbnNpc3RlbnQgYW55d2F5cywgYmVj
YXVzZSBldmVyeSBzdWJzZXF1ZW50IGl0ZXJhdGlvbg0Kd2lsbCBmYWxsIGludG8gb25lIG9mIHRo
cmVlIGNhc2VzOg0KDQotIFRoZSBhbGxvY2F0b3Iga2VlcHMgcmV0dXJuaW5nIE5VTEwsIHNvIG5v
bmUgb2YgdGhlIHJlbWFpbmluZyBMQkFzIHJlY2VpdmUNCiAgIGRpc2NhcmQuDQotIFJlc3Qgb2Yg
dGhlIGFsbG9jYXRvciBzdWNjZWVkcywgYnV0IHdl4oCZdmUgYWxyZWFkeSBza2lwcGVkIGEgY2h1
bmssIGxlYXZpbmcNCiAgIGEgaG9sZSBpbiB0aGUgZGlzY2FyZCByYW5nZS4NCi0gV2UgZ2V0IGlu
dGVybWl0dGVudCBzdWNjZXNzZXMsIHdoaWNoIHByb2R1Y2VzIGFsdGVybmF0aW5nIGNodW5rcyBv
Zg0KICAgZGlzY2FyZGVkIGFuZCB1bmRpc2NhcmRlZCBibG9ja3MuDQoNCkluIGVhY2ggb2YgdGhv
c2Ugc2NlbmFyaW9zLCB0aGUgZGlzayBlbmRzIHVwIHdpdGggYSBwYXJ0aWFsbHkgZGlzY2FyZGVk
DQpyYW5nZSwgc28gdGhlIGNvcnJlY3QgZml4IGlzIHRvIGJyZWFrIG91dCBvZiB0aGUgbG9vcCBp
bW1lZGlhdGVseSBhbmQNCnByb2NlZWQgdG8geGZzX2Rpc2NhcmRfYnVzeV9jbGVhcigpIG9uY2Ug
dGhlIHZlcnkgZmlyc3QgYWxsb2NhdGlvbiBmYWlscy4NCg0KDQoNCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
