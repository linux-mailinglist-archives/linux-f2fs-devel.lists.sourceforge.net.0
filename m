Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED07C7F5AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 09:09:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqTvuy3SsHhh9An1mQEHh0zYAse6cWycz1TR6PLIqtE=; b=X+t24zFzSqJPDtaOTHapxmBdEc
	e9XTlhnhMyk0BaBLuYTw/UEmLrufVIO52/39uOKppRvmTXh2uqQvA6PMlxz4/Op1CRmo7H8mHuo61
	jCjECKpRGpjsxEzZngcOj6DTFeNpY0NO9kcuyLRyauYAOXsbm2Kc2KKOy53cLuxSmC9Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNRdM-00037p-E9;
	Mon, 24 Nov 2025 08:09:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=41613d8e1=Johannes.Thumshirn@wdc.com>)
 id 1vNRdL-00037j-L8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4YW1uuXnDntCl31Iv3xSCDomdDENuAx0EqwAh8B2LDs=; b=ET3awnyM1VpcpZ3AtVVX1Cq2Ox
 8pVKlbIwgxhgkRwW94nm0B3NOVWeIMWTCSxqyZ06PU/fKNu5UrqLXsEevp7OgHUBIpzD0LA2KF//F
 LS9GEUmP8eHdtsGnXNMmJKSWaHfMP9UL9nKcJwNQmcwPONgu+owkAg0Zgs6AFNzWHIZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4YW1uuXnDntCl31Iv3xSCDomdDENuAx0EqwAh8B2LDs=; b=Itn/iEXufFGJYvKmutVejz45Tu
 buDrM5UJg5ObZDSrxF+Zs4K/JzWS0Oxga0EdDQbduzxm0kqnBbvVybkhkj+y3qgbELrhfR/prRZn2
 lyE4ypj9sLOkL6rG85h/ET0HUGB5PeZZByvSHmkl/Dq5DMHi9AJ8h41gpXv29tgvUPB4=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNRdL-0006EX-Qr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1763971755; x=1795507755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4YW1uuXnDntCl31Iv3xSCDomdDENuAx0EqwAh8B2LDs=;
 b=pAMvusSjIXPBqKmW13MhcBU5jSO7Z+BYR6LFBGX1dHO5MGczwjAUZhDD
 f2gY3FM+vIzv7QxXdnp8zt4BbJZ14GB6vHngW9YTeX3S+TwLZ9RBbGCDQ
 M3DMIxP3I3ePGS3H+qBHMNT6z2YNPOCz3kolhNS9g/HKVUKHgskF5uXts
 lJHPSErl7/8GStQX7jTJIwwUOHuqrqo7huYmhcsteFWpcULDw0370yGHY
 FRy8Q4cwTDyiVmfzsM78Y6KTCeGimzYSZepjF5BRZugGYbiPzPTztFlUo
 Gei6jY1GhbFdZBq1zh3LKHtfgoVmAzHEpgae5A+Bd9uwUXaYUJHU2AWhg Q==;
X-CSE-ConnectionGUID: OX81HUf4SISpiWlBZ9y58Q==
X-CSE-MsgGUID: /Ow9qk2ATVOglo19w69dtw==
X-IronPort-AV: E=Sophos;i="6.20,222,1758556800"; d="scan'208";a="136608908"
Received: from mail-westusazon11012059.outbound.protection.outlook.com (HELO
 SJ2PR03CU001.outbound.protection.outlook.com) ([52.101.43.59])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2025 15:53:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjAyXY8hz1b3vUMRObSocaWuNh5lw9jTDjzbcTI+vvZMCargIFA8HQyN7ZgwAe+SR2UvfNjowVkr9B/+Ym644KyamQjVUCJnd53kdGlJZQQXKD+QpS3ZkWyOdd9SoRQ6bMXGUdzgH0eGEn+w0E9VXluKoywb6j38esEGtT4LNB9Jqxki3L/fRraPWDrrVGs/iuapVlxck1kflU82MQk7lef/UfQ/LH0PEf0nDROlHS97ftARjBBx4F0/fsQPtcwaIp+WM5EUKcw/tTUrM5P3Z7u9e1ozxMvmymhewbevlI8nqnRRE+MvC0QsuSE+dg7PMPTl1gG44FUNezh775kIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YW1uuXnDntCl31Iv3xSCDomdDENuAx0EqwAh8B2LDs=;
 b=Lzb9K3jNaIyLDsIWoOOTaCKVbQcHXT+FRUPFTUrtJcFznOD5xkyMFRMxoooza2gTpAWsyIzJ6W6gyW0H40X9w+hrxTkd5gRCYN9lQO5XvhL+0wuP4Gsn35yXvAP4k0W5ROO15Ghwy+frsw3/T40nO0MbYLHebEtc9d95zvYVusbZhDd+FaCqsdcxmblcWbcYBzjdZAbRu0R7YvVRS/eh6mObDUxwU2G4BbwF/COnpY2jfdCAJHU50xVAJ2ZQ1hjcpZmj1MukHsDHJNFL4pbgWJnSm8CwyG6KRghYa99WwTwdYD7RXW1TuEarnBylSe38E7YQqo5dQnnOhFhvwAhC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YW1uuXnDntCl31Iv3xSCDomdDENuAx0EqwAh8B2LDs=;
 b=ZsQlIi90Mvkre/PmMtzWjMe0I+c73kf8O+grzJNAgyrr8d8tCZLmUpL2zzWwfE2TdLV6JSvDaEDHI9jMilaHKkObHbaTT0WfphE2+J+tJvGEomSq9qSK94UOqor3ZRnRJBzalFJRmzE3MHTPzxL3rucSUUMzsfkJzOH15DOm+VQ=
Received: from SA0PR04MB7418.namprd04.prod.outlook.com (2603:10b6:806:e7::18)
 by PH0PR04MB7288.namprd04.prod.outlook.com (2603:10b6:510:1f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:53:24 +0000
Received: from SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9]) by SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 07:53:24 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, "axboe@kernel.dk"
 <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>, "snitzer@kernel.org"
 <snitzer@kernel.org>, "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "song@kernel.org" <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>,
 hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, "kch@nvidia.com"
 <kch@nvidia.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
Thread-Topic: [PATCH V2 2/5] dm: ignore discard return value
Thread-Index: AQHcXO4vrmBXkc7TXUW0PzYu9kO4TbUBdPSA
Date: Mon, 24 Nov 2025 07:53:24 +0000
Message-ID: <a0dc01ea-246f-45bf-8ec3-62ce44d76b05@wdc.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-3-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-3-ckulkarnilinux@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR04MB7418:EE_|PH0PR04MB7288:EE_
x-ms-office365-filtering-correlation-id: d9f930cf-6fcb-4435-e347-08de2b2e8b89
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?b2p6L3JsU0owcHVmRHRLZExQSWY4K25LRHhXTnFjSTBQN09mZTcrVUg1dVVF?=
 =?utf-8?B?eTh0ZTdkWk1pK0hCUklEU1BqazJETWN3WVdieGs3R2c0LzhpN09rSk5qWndt?=
 =?utf-8?B?L1ZiN040N29YRkwxS2NlakxKY3hNb0FYUlQ0c0hJbFJLL1AzWGVEUzZJc3Nx?=
 =?utf-8?B?UmFudWRGRkxQMU4vdkluWU5UclAwMUtnZTlEdXVEYi9pM3ZzTGpsR2I2T081?=
 =?utf-8?B?NGt3bVM4RmVhdDF3NlJDVDBTYkZyRVE1dFJIQUMraVVMd3F3QTV0RGRrRGR4?=
 =?utf-8?B?OVRLcjVaNnVxcFZOSmRoVXVpUnUvb21VWXpnQTNEV0Vha05EZkJGRWV4aVl3?=
 =?utf-8?B?YzRYQnl0YkQ1ZkZ0TGI0dEJIaWQxTG9rbHY1SlVCcjRxYW9vZ2kyRE0xLzdk?=
 =?utf-8?B?UGJKRE1rT0Z4NWloV0Jyd3N4TkdGRm93bEdZL2RuQWR2aHFIeUsveW9CZHl3?=
 =?utf-8?B?UFhZOGJ3alBidk5oeFlTUkQrWkRkSEFBYTRHUU9PREd2aEg0Skh1cStMTzNw?=
 =?utf-8?B?cFQ3TDZzK1grdEVZMElvY25la2ZpNU9LRGxHbU91YkhpTFZrWlZ0d0llUkNu?=
 =?utf-8?B?TGVVSHNaQTBvaE8ySzlFeFR1dFpqWnluM29NQlVwNS9Hc1p5TU1wTytRdEFt?=
 =?utf-8?B?T2dwcEEvTDBXQmpyN05BanU3YWxQMEdleGxGMzRFcG1xNWhtalFTVjBhcnF0?=
 =?utf-8?B?ekRud3NtOCtOM1hXOWFCNmZCenJUYlptVzZ5YkxidnhmcjdGYlhFcklmbU90?=
 =?utf-8?B?aEMwWkVXZGRUUE43UFNkUzFLajFDK013OGkwelloNGkxQURtUFIxN2RZc1Jl?=
 =?utf-8?B?RzlHVnBqWkhTd0dhc0Fndzg4NVpDa3orL2lyNWV0RnNvdy9iL09ONERQcG5E?=
 =?utf-8?B?MndvSU1xcmJVSDFSaW84dzlmNERwam9ReFhzT3FDUWU4L3NBQWRsdDcvcTM1?=
 =?utf-8?B?eTBibjFNa2hxdVZDTHhkc0RrM1FQV24zVytVcFNZZ1lzaHhmNGMxTVZjRVVE?=
 =?utf-8?B?Z1VBdXVXU1ppa2p5ZisrUFdxcWxDa2xEWnlPVzFCY1Z5bEI3VnJWSEsydXBt?=
 =?utf-8?B?OHpiTVI0R25CV2diUzJTUXR3aTBuYUUwR09qRS9PL1h4OW1IYmE5VlRjaTBU?=
 =?utf-8?B?V0xZenNOYmc4WksyRExsdHE5emZMclgzandKSGRHRjJyMWc4QldleVJzazRY?=
 =?utf-8?B?Wkhsdkp2QVRUZ0tENW5rRmRSMCtGUm5NSmprT0NSUmdkV0xaUGlscjNPRzdy?=
 =?utf-8?B?czF6bkxUSGsxY3AvZHdCRm1jSzBVWDFRb1pnU2Z3S1RZSXJCVlRtVHI5bUpn?=
 =?utf-8?B?eHlIS3Q1dUN3eExUSTkvTDdQYkJOa2RnSWpISHBSam00QjRwemQxZUVmeHlM?=
 =?utf-8?B?aUVjT056eCszL2lKL082STh2SHcwMWt2VW9DWmdQSzlUSGVqM1V6MzIyY0pz?=
 =?utf-8?B?V3BHQnFaS0ludUhMZkRHQSt3UmlIM1kwMWpwdENRUlRlSmY1azhXNlg1YWMw?=
 =?utf-8?B?RlFiaDUrUkkwakJQTEhrek9ER3ZzWFRlZWIzTmx2ZjdlUzd1T0Roa3JlVVdr?=
 =?utf-8?B?Mjdxc2dQTko2aFpKYUxWWFlTZjZNOGhKaWc3VW8wK2NTRlJUVXp4RG45Vmho?=
 =?utf-8?B?WHU5eVgvK3pzeEhpSDAvQnNrOC8zT0prb3VISHgrMWRaZmdHZUc1UEQ1REN5?=
 =?utf-8?B?TjdOeDRuWTNGVUdGVDV2eXdYSVZjYm80NHJzYWVCVkh5N0ZlNDhhVWFjTHY2?=
 =?utf-8?B?QjFBcnR5a09Sbm9jNURXV2o3ZG00NmtUYVBSRE50RUJ2STJmeWhyMTljckpB?=
 =?utf-8?B?VlFKSGIyeTVaTjhDSEt0UmREc3BTTWdBeXR3cEpFeThRaEFzajl5d015NXZ3?=
 =?utf-8?B?T3c5R3dIdXBXOTFwYytwVU9Zd2tvSHU5ekhzMW94NlFHV2pUQWRkMThHWE1J?=
 =?utf-8?B?a1N5YnhEYk0vQVd4MFdyU2VsNk9DVWFGOFpTZk95a3l2Wi9GWUdDZFFkSHZC?=
 =?utf-8?B?T0NxTzNDVHZaN2ViNFJCSnBHaVphZ1dzcmZ4QTd0aHVCQmg3SFlvalFUbzJM?=
 =?utf-8?B?dElNUjEyMzByNGhGSjZGb3hoTThqMis3QnpiUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR04MB7418.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3dCdkhvekIvYWsyL2N1cENTajRLL2hCRlR0TmZIaVFSTmZBUlFMTlUvaHF5?=
 =?utf-8?B?YXVxcW5ENTZEYjU3RGZXcGl3TGYwVlc3c0xiZUk0eXVEbElhSGE0eVluMHJE?=
 =?utf-8?B?MWVMZGY0dzNWeVpZbDNLVklmTW5KWUZRUmREM0dCUnJsRUtBSDNvTnY5S1JE?=
 =?utf-8?B?SHlkTzlRQWYzMDdvY1c3eTZ5dkc3NVhmaGZNdVNseHE1VGZEZ2Z3UExlVUJF?=
 =?utf-8?B?ZEZ6dG02ZURPUFRmRC9CbFF0Zkh5TFdaMVBjMkc0U2FoaU9VQklSU2V1Y0tX?=
 =?utf-8?B?aFVwRDQrTE5Nei9jNzFkQVYwcnhsdTlKaGRlOEk0YUt1Z2lqb2d2QnkreS9T?=
 =?utf-8?B?cHZXc1BOUWpUbG4reVpKK2F1R1I4UDVjOU52MFgzZUNWWEloMFdnUldXME1q?=
 =?utf-8?B?eW8zZGJHZ2ZJUEh5TGpWR1NYa0hYZStmK3lzVUJMYmp3cEprUjhtbytTUEpv?=
 =?utf-8?B?cUxtUkRqUVdCWXNxb2d5eHRFQkFlWUllQXc0TndubHhPRk1aVFh2cFdMbk1h?=
 =?utf-8?B?U0hqWTJuS3k4cXJBSFJzN20vMGE5TWxSV0FISkpGWlMzUEhqdTk0S2xOTUxM?=
 =?utf-8?B?cUFIbFE3bXNVZ0lOKzVnZXhscnBsQitxNXRnS3lkZDBmOXZGWnB5eXk2QTVv?=
 =?utf-8?B?Y0ozVFRYUjRxVzh0NzB0QStvWlhzRll0NjYzZFRLZ0l1bGEzY1NBaWVWS2lE?=
 =?utf-8?B?VG9Wa1dSaGZSR3VZWVVOeTNqLzdFbk9ONnhKZ2QzQ1hqQ2dSQ0lIbzkwUGhS?=
 =?utf-8?B?eFE4MlhabFF3NE5GUWNrWFNvbUdTNm1lTFArRm5vZFo4WmhjU2JqNEJORFhJ?=
 =?utf-8?B?UWxzQWtBSUUwZkJ0YW9JKzJDbE8waEZndjFBTHUwL3NOVDdtV3dXTmlQZUNV?=
 =?utf-8?B?Vk9waExPcHVibmdiVHN3WVpCbEZMdnBCMlRFUzZ5N3BXeVJjZUZ3MExITDQr?=
 =?utf-8?B?RzVLS0pyZXJ6NFVzbHZHUGZibEFNb0g5djEzUG5BYzg4anEyV3EzanhydndM?=
 =?utf-8?B?aEJtTS9NWFpvVE05OXJpa05lSjJDamJlYktHS1EyUjgrekVQNlJCYUJabVk0?=
 =?utf-8?B?SHZMR0QzTmgwTXl1K3NKbmlrazd6UGZBK1NXalczMSsrRTlJcDloT0VIU2Zv?=
 =?utf-8?B?V0lSL0RoNVBVRzdCNE5pdHhYbjVTS2ZISitkYXdoM3ZJWmhtOEFkQlZlMXZV?=
 =?utf-8?B?L3pDa0JDcC9tRlQxU0loNyt6YmdDNVdNeXBRYUdaaGlzM1JkOWFUN2UraVhT?=
 =?utf-8?B?OFgyaHNxVDJGMmRndFowbWZacG1wOGk4ZGFVakcxMzhjRHUvTXpvVFlXcDlG?=
 =?utf-8?B?b3hZRnhVRHp5WWs1NkVwaHdiMzVhL3dkSjJCSkFqTU96RDVCWUJGa2ZrTnhP?=
 =?utf-8?B?QzNqTXVCMGhrRzZOR01iMlBJKzNZampjNHNNTWJhcDZJZmZVajFYMnFOYXE1?=
 =?utf-8?B?UXFzZFFYVkJObnE0RVg5L1RTbFRKeHVVUEZScWlyYXhTM3NsYTBEQldlczNY?=
 =?utf-8?B?QjNGQXk5cWNENGR4eU5wOUZCbXFhenRQaHNqUk92bTlyMFZoNkxET01SeW4r?=
 =?utf-8?B?OUtOU1lXTk92anZLdUwwblU2R2M3RXd4S1pHN0RJSnptMU1oMEtRR05RZ2Mw?=
 =?utf-8?B?VG1hK3hER0pqTG1EZStlVnlObmJyb1FUZXF5dzZVUXd3a0dNMzNBalZ4eEw2?=
 =?utf-8?B?dm5HaER2OU81SVVlcG93Ui9wQUFTTFphM1ZjWG9GRDE5SVdJa2ptUWpNYWdX?=
 =?utf-8?B?K0FYMUphTEp6dVlLNm4wRXJ6aHZlTmhnczNBM3IveWczSCtCcTBVaGVRaEl2?=
 =?utf-8?B?dWltOWRNdDNWSlR5Qld6ekR2bXNmdmNrWVdoU1lHSmNId25oTkVnTFluaVFv?=
 =?utf-8?B?dC9oQ1k3WS9SSVE5bGRlek00LzYvYW5UQVVndU1tbjdHUkNFVDNUVGhhSm81?=
 =?utf-8?B?bFpkWmpmYy80QlhpcmwwWkRhTExLL01obmtZY1dxYjNsekV0V2swMDV0N1RF?=
 =?utf-8?B?Z1Q2QnZlUmNGMGx3MU1DZnZWVTlJV1RHSlpMQ3ZYRHRUYXRhNzRGZ2N5NE9B?=
 =?utf-8?B?eDNscjFVU1BqWWprV29yY1Q2clB1a0FqOE5QbDZmTDlvOXZsdDBQQzNsWVRa?=
 =?utf-8?B?U21FSHJpT2w2Z24xeFl0T01BcHJtTEkvVGVKWTNWN1Q4bkR5WjlzTVhnUGtu?=
 =?utf-8?B?c2c9PQ==?=
Content-ID: <955467246AECE24F9CDFE7DC19106064@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: UXs+nDgGP7UGAYi/6Mhi90XbRtU8kAn3gE5oa3MxAaio1/XLocgF517LQBG0zxdqjT+My4Oy7+DJsK/QvTeKp+vbEGnwHfqSx04LuxsR0ZGZUMtGwwV/GMssSKw3tG32f4f1nm/vwmHkRIiRqOMR9zANNSvUNmeSMPNFZ8DYF4+gtJNzV6wT+IkBShedfN80otLrl7p2EJWxxFOt+5m7D2n0u8vHjbX53KhxXuAnqqJ+TVxKS2EUvydya4KjGPNyvjnJ/rA7CvE6INA4UHYuR0WaRhgyDfnk+t7E0IRu59JzxA9jd3J6xzy6GSbpPdd5M+JZUQX8a7vVFNIgT9YWMifJjfX0inL7IcWKNS2eiVIlmFgOH5au3T0GjpBxvNmgGWvVm4h3LNT9JOnLRoj8t5qFSGqSwuge8cn7AlrA6uDHgTYYTmMPKW3feNC+UOzFXUfm1QCvho91Rk3hOLGYAWHmwLerN4+BIp6E1SaBakbniRORe17BF9bxhLMYbZYwZuK0DW9PibIy7zQRfqH9oPZczD8AV88EmU9ryiLqi3teiXqVPh0Y5xUzQsn6pDPmbXIk7lO+oDEpBHEbKLTuATTJX2IGuc7PU5OBGM7ipBzaTboFM6kVyyxoNvVcx5Uh
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7418.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f930cf-6fcb-4435-e347-08de2b2e8b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 07:53:24.2275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4FeiKt82VuqgiqiCYBzVUSsjRmjh/ReE9m7bIjW8JVMivHTjbQswnAM5RST2cI+UwYNhQg0JcoR/UvAS1SDNiXPZg5xxEJ4xbghoCl5JC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7288
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: With the two patches being split Reviewed-by: Johannes
 Thumshirn <johannes.thumshirn@wdc.com> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vNRdL-0006EX-Qr
Subject: Re: [f2fs-dev] [PATCH V2 2/5] dm: ignore discard return value
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

With the two patches being split

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
