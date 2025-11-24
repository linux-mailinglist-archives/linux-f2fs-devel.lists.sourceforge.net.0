Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F64C7F5C8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 09:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oINhJydpMgKVDk4WCjrhG7kRfRQYYLCKPbdqdaxQQdM=; b=DbAeyZ3EVnmiQhrykEddYsmACM
	ljHrS/4b1SgZt2L4FYcd9E8LySdcJL00cWDS+mzbOh26M31JGTLsDqHij+EUbfMLZG/OSZnKs9OfP
	6DpX63nSg/2hEf4+6xAx4P9w1I1khcAiL6PyANe4jsRBEgP0o2nwa9YVqeItqnGgGlyg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNReW-0004d8-Ax;
	Mon, 24 Nov 2025 08:10:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=41613d8e1=Johannes.Thumshirn@wdc.com>)
 id 1vNReU-0004d0-8m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=; b=S+uhUG1b2PpEq8J5aGInbYbiA8
 csygVWKyEVmp5izEYggjrYZ2AFM3KSZSyt539fwQI0ou1qo7TloTELY81Ua+rkI3lQjacUXP35x8l
 is3idfrOkZONh2/2hXeiledg6Vu61WA+W/aPQbGI5n21+21GXXRhBj49KoDK1hjybN7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=; b=YOIO5T7Mf3JSQkPIfmrCfV2GhD
 0YA5H/Adcec3oHzcvTO5XgvAFLRi10gzAaoTpFYLyFqKVRUNvUgq8256FvkpFK09ynz1R9pYtMmn2
 lCi2A0i+CgCyaPvb/jQsVdYIu597brdkVa2LKFbnafM14Qbm9JQjyc6X9kGGg3TEu1Oc=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNReT-0006ON-RT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1763971825; x=1795507825;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=lYHbX7iwvwhae761g0zaQTxnis2wU2RVZnCOBtRomTDUuvQOT5LgT0Tu
 bZv1FRsyI4liiLHJqCsk9MMS0exOCLRimDkp1+GBRHQAaZnaa7/u56vqv
 TMcfzHoh2El6sTZu3JqlhCR7bLUXZa2AWzkTlYMWDzO6XTcbqE/7bYxNp
 /81BYnpFeHqLpjsO1dJx3WRD/kOgAYgpmEYXTaIpcxmiOIUZo2hFKwiAf
 3kFuxdXF9dKUJrfsNonw4i9SldD7Z1dIh0UkdSXUi1RLQyQGsfKo6TSTA
 Alg2kEkBArz61wL/FR3hmQqM4lfYlCNyAqzBUlgXguqRrO65GSx2DkWVc w==;
X-CSE-ConnectionGUID: O0kvaY9NTlGf8/zgj+1GHw==
X-CSE-MsgGUID: eQ5U0ApwTNi5x7gZNgMAFA==
X-IronPort-AV: E=Sophos;i="6.20,222,1758556800"; d="scan'208";a="132620113"
Received: from mail-westusazon11012047.outbound.protection.outlook.com (HELO
 SJ2PR03CU001.outbound.protection.outlook.com) ([52.101.43.47])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2025 15:54:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeWf/EZxSyDzzN7Wqfwjq4K5E7RSMqVeYMFATXXMSCr/gKPnKfHAaH1yEp9Z6uIktzV75FudpqlR6pGL+7xZOSgNMh/0IfnZHzB0n+K4OWCZTmIF53m8AT9JP/yYqPBbUGZ+TQlr1vnrPUMcyq8FDPBUdGjJ/7dED8oYby/3ssJKeRPIbAaqqRrVwTOvypI1amPzT+d03sq0uDoWygBuRXkhSk/TdjnG63PJQ7AMSBNrTG0XcPYfxEK4XMsqwyVMRzZDr8RtQWC2+nXcRaxlFiQonRx82kSB3A2cfkv5Y+Z/98lKNQ2iSiK6cl8RR0luvgJwR0SAg8qgoD969moBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=clJ58j3Tuf6sWCiGmnCBxM2pW+mPYr8vTu38GMRZnkr+n9+h/RaMeztfoqxOByJV+6UKmMzIxZ35LZ5GvavtgIOp/vR1Sx0IU2+4WW+joqd8TwaaHjbfDtPx22BvftEEM2zMndZVW669E58ZcMAgLZOQx1Lt1jyEkGECKib7Si31ASQveuaBQBBBDYlpGd1itQfJGQjyfHlUeufq1tY6has1zMj+l9UXAnewvQ5vDCVSU8p3qwiml1D38hxdsciiBCkZY1d7BV/X49XkrcRYi5CVXSop1jPsed9lYbUojh4J+4E0JQQNeQO9fVm2190E9A86S+P7wLWAccXA6od1Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+z6ql9M5JhawzkmfcJJBxApS2D5ls0dv54BOWw8ja8=;
 b=fZ7epKqhN2n92gfDOYPZRc2SzYz+19t1fs1v6JwotBeLao0p7md/0+CxcxUCLbZfQe5jQFPQrBUAMiIj46dq4R3hNLg9JdSqz+jzya3dQ2LgioZ9UPQKID/0WY3DmQSWaLf5z6Z6O4sXYlXKUXqFZw8D2ZnJUzHA2ZXwnteDTyw=
Received: from SA0PR04MB7418.namprd04.prod.outlook.com (2603:10b6:806:e7::18)
 by PH0PR04MB7288.namprd04.prod.outlook.com (2603:10b6:510:1f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:54:39 +0000
Received: from SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9]) by SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 07:54:39 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, "axboe@kernel.dk"
 <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>, "snitzer@kernel.org"
 <snitzer@kernel.org>, "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "song@kernel.org" <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>,
 hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, "kch@nvidia.com"
 <kch@nvidia.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
Thread-Topic: [PATCH V2 3/5] nvmet: ignore discard return value
Thread-Index: AQHcXO49UDqb3NvtTkG8oU7+QRoplbUBdU6A
Date: Mon, 24 Nov 2025 07:54:39 +0000
Message-ID: <14a0b31f-257e-4ddd-ad81-556dddd1ccc7@wdc.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-4-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-4-ckulkarnilinux@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR04MB7418:EE_|PH0PR04MB7288:EE_
x-ms-office365-filtering-correlation-id: a42291c6-f5f7-4c64-c443-08de2b2eb86d
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUN2dURZeUlRR0k5NG1OSWJuajdhaW53ak5sUjNTVUQxT093YXcrcmdaSEt5?=
 =?utf-8?B?anlNdStBYk5YRllMcnRzaDlyUlFnM2hQczl5MEtHc3FoVFRkWWh3TVZQUS8w?=
 =?utf-8?B?RktKTExQSmFmNlkvSWtMb04zRkVRbnIrNkg5NEpxU3lRbVV3RVZIbmhRU3o5?=
 =?utf-8?B?Qi8zQy9ZT0NEWEhoTkcwTG5kbWdYTHZwaXpBRDFpekJ2eVE1U1V0TUZtbkps?=
 =?utf-8?B?ZUlNcnBiSzJGUDRnd2VpQkI1aVBUMXo3cEFvSGs0NmJLNndwMnZraFQvUDh6?=
 =?utf-8?B?OG5mRUdlQlNGSnNFc0lZbVI4QW44enNJdGNtSWJjS3NJQlI0KzcvY2lnR0pN?=
 =?utf-8?B?WFYvUys2UDV4aFU1czRyREJiZ0V1eS8yRDRzOTloa05uK1lVblZFaTliYW9M?=
 =?utf-8?B?QW9mZmJBSUx0OCtFS01RRGRFcUtpM2hyK3d6bURvdXF5akJGd1NSL2tNUlBF?=
 =?utf-8?B?M2xGeENPY3lIYTNucS9iSjdmVUQ2bE9CcjBpVUdCaUdSdkVsNllIMjRmcHVh?=
 =?utf-8?B?WTRlTWRCcC9tQUxTZk44S3Evd1pPVElSYVZtUElyNGYxa2Y2YVkzMkdkTlpE?=
 =?utf-8?B?TFdvSFVXZ3hKRmNvMjdTSjdpQlJITVBTbmk3UTNJZ3hYZ1BnaXhHdHZ3OGpJ?=
 =?utf-8?B?TGpBZjdoSTlLOFR3NDJ4ZmZHM3hPdytCTllSZXdmN2pKNEx1bWwzRDFmeUp5?=
 =?utf-8?B?SURwQjlRV1hqVGtVeFVmREVvZm5OTVBiWDBrSkNGRThGNXBIZG5iTkRpWEQx?=
 =?utf-8?B?bHFicjRIaVdYajJPK2dvanpYV3RqN2p1OTZremdYc2k3VWQ4VHh0RzZRQXJX?=
 =?utf-8?B?YWk1T0ZPaVJjNVkyQUFLK0VpdVJDc2dLSlhyYzNWdEl4N2lHK2ZCMTRyUTdR?=
 =?utf-8?B?T2txdzVQTGlGcWZDOTJzRDYzQUdQSHdPTlpvbGVmaG1pdXNkbEUwVno1bk1M?=
 =?utf-8?B?SVpzbmwzUTJNbjVKRlFHdjNzQWZ3dWEyUVdIWUFrMStEVDlKdEJQZUpIbHNB?=
 =?utf-8?B?UGR2Z3RBU0FvTDNFaDhmSVRTK1pYUnprQlorZHdnbjFSeVZUOWpueS92OElU?=
 =?utf-8?B?Ym5wZzRNZlc4SXZaTkFtN0NpSnhJUytOY3dtVkVJUTJ0MGU2RElMWnE1RU9U?=
 =?utf-8?B?a1RmMEk4SnVLeXhwZVNYQUZyQjlGRVJvSEdqV3AydlhQRitvanBBaXNCaDZ4?=
 =?utf-8?B?Z3lxcHd1dzh5Tk45NFI2RVI0YTFWSXNSUWpoL0x0Wi9kcUxXMzlsdjI5bFJi?=
 =?utf-8?B?S29pcE1GWjF6ZkhCcWgyV1hPVEN1eGZ4MG9nOXhsZHRKU1RFMHlzTWVzbnZT?=
 =?utf-8?B?akk0ak5GaGw3ZnkrYy9jd0ozWk80LzFiWkJCdVI2Rks2VXgrR3NicnhCeGoy?=
 =?utf-8?B?MG1uSS9nRWh3c01jN25lZllmSk5OTldRL3V0VTJnSEVva3NxZjE5c0NWS0pV?=
 =?utf-8?B?MUhnWTYzMm5DZm5aVmlReVRoNlp4ZEVwSGFraVF5bnNic200bW96NHQxeUZo?=
 =?utf-8?B?OTVaZStkUzcxb2V0VTJkeVZsckNHN0ViR0U4UjgzOG9RdGhLODFNNTE2WXRK?=
 =?utf-8?B?WjRESzRhSnpVcVNJbHdJdlUyN2xNL053bTBNMHdCekRjekRNVXRFSkJuckcx?=
 =?utf-8?B?SWc3ZGcwakRoM25taHdzSFlPZHE2UFM5dlVoamNoTnM2WVBRMFEzeUI1eTBw?=
 =?utf-8?B?K21FODFuRHpaOHY3Z1o1MElNTFBKRTBIWi9sRmZPWEgzcnNKTEppK0liUm5r?=
 =?utf-8?B?eEF4R2RDczV2QkVKY3NmaDJtOHZ5Z2o0UURZbkFNZTB3RVgrM2hEV2tmQnJL?=
 =?utf-8?B?K2dTdkVWS2JMQTZFc3JSdzMvOTlZVCs4enFaNmg4eGNIWjYxUy82SzU3VGNk?=
 =?utf-8?B?aGdXSFFnQjhZd2JVbnkyS200MHl5aTBQRUx1VUphU0J3WjlVMzlxK2VGOWVZ?=
 =?utf-8?B?V0o5MmhvLzZjNkxHblZlSUZyVE9OODdoYkduYkwyMVhBZkxOOUl6VDgzWFR5?=
 =?utf-8?B?OURMUC91RXFDVE1UV2Z6WFhlRUdhMW45VUZ6RHk3VWtQNW5tTVVOS2g5UWpE?=
 =?utf-8?B?bGtwRTE5QUhQZGZydDRVYWZPMkNyZlRYQ2pUUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR04MB7418.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVlhTW9tTENGR0x5OHZWZ0txTUNGYXpONGFRemxjNm1wNEtvWG02ZmpDK3RE?=
 =?utf-8?B?WURlT1RuNmJJb3cxNXZmcWM1czB4Z2FRbjF5cmZCV0ZTMDg2S1hSaVRTeTR6?=
 =?utf-8?B?cUUycHhpcFp0N3d2ZHhscytWSEJQdHpUSkpOV2xNNGRlV2V5VjduWE9xRmV4?=
 =?utf-8?B?eEMwelRMd21VR1hkb3puYzU2ZllLZ3d0YWtaNXMrVlJwMnA1b3h1eUU4N09D?=
 =?utf-8?B?SU44MlhaVWNubHBuZk5OUnlva2JTZzZLSU00dStISjRYVXF4Q0Qrc3RJanR3?=
 =?utf-8?B?YW9WZWtwYU1kc01XenhuNWRkd24wVGp6Zkd6T2hZWVNFVWNKK2k4TElxVEdo?=
 =?utf-8?B?R3dpMzBYaWpGcTU5K1dvK01LcW4rTjJOVjNzS2VKcnQzbDNpaFpEODNITU9U?=
 =?utf-8?B?bnFtcXJZREQxTzUzcFZGdW80enFRcGhyY1owVXUwT0FlWVFycTY1WUNpblQ1?=
 =?utf-8?B?SHc5ZFBaTWt1WnZSRUZwa01SdEw2RDlIT1JhTVV2a1ZPdVhEbFA5ZnRDTk53?=
 =?utf-8?B?c2lFRm1lS3lya1lXZDVadENYdlcrS1pOQ2t3NmJ0dm5XRVNwbERRTGgxS3g5?=
 =?utf-8?B?dGl2NFhQRjJIN0ZmMThEU1BWSzh0NFkyWjZ5SVcySWNZcXBvdnV0RFFQaDdz?=
 =?utf-8?B?ZW9vWXN3MDBLQlpXMDRsTVlHM2hmVnJFbzBrM1RRZDEvdUlYRW96SmFQekk2?=
 =?utf-8?B?ZC95VmEzbXMxSkJMZzlSa0QzOWJQV0xZMHJNT3RndWErUXRzYlZZOVp2SGYx?=
 =?utf-8?B?ZGp0akpMOUcxUG5XV01iRzJPR2RrR3ZXK3Y3dmFDUm44Q2lKMnZkeDYvZW9o?=
 =?utf-8?B?ZUY5RWdsL1QvUGEvaDlHSm5RS0FGdVFYNXFmUFJ6ay9Db294OU5XVEhUZmlh?=
 =?utf-8?B?S2lhUjhxZTlRbnBnS3JZQklPVVlMcUtOSkgyTHZESEM4NnljS2dIR2dodTRa?=
 =?utf-8?B?N3dTaWpZTXBQUE5sWjNMYTZjV3NPSFA4d0JBb202clVnK09CT1YydFU5M1Mv?=
 =?utf-8?B?QVZJb2FqZzRzYkRrWEdGTG9YVjRsT2kzQkY3a2Y2VFZzSHRxTmJmd29PS1p3?=
 =?utf-8?B?dGlRTUhKUUE3TWRZeFVxRm4xYmxVM0tlTUZjdUVybHlIZ2pwZlk2QmcycmRO?=
 =?utf-8?B?SlFVT2NWSCtySE9lVnozS3NrRHk3U3ZXQWl3cHZFWmlFcEw3ckJhLzRJbUlX?=
 =?utf-8?B?cDFhVU5rdEVRcldvSXN0YXdMeUJRRy9XZXNJODQ0Q3BCdFExbG9aODdpTlE1?=
 =?utf-8?B?UFlTNi92SmZCL1RRZnc4bkY2QnUrQlhNa2c5Z0grRGp0aDFmL3gwbERpb3My?=
 =?utf-8?B?NmtkOUFUU0Jkd0ZiSVJreXZ4alRETEE4b1VwdUs2OVRpbTg3QlJMVTlLUS9y?=
 =?utf-8?B?TWQyN2tyVkpYVFI3clY0ckcyZFpUdDZ1VDZ0TWRBZjdqQS90MFhKem9yc2hx?=
 =?utf-8?B?YUJYOEFGK1VGdGpsYVc2WGluN2tqVjlQRlg4TWRJQUM4dkNydWhZWlYxdE0x?=
 =?utf-8?B?L1EzTFUwb3lLdFVuM0VyU2drSzFlZGNnVG80WUgzQmd5Q1ZwM3F5eTlzSG5o?=
 =?utf-8?B?TjhWVGZqcEIxUDVzUHZUUmJJV0ZjNmh4R0ZnMnIyUkFiaHFUdVBNdWx0RG9M?=
 =?utf-8?B?SEltYi9vajZTUUVERW1obnhuMjdmSjFnOEFINXdsU0Q0ZDdxN0tITTZ0QWtz?=
 =?utf-8?B?YUkrZ3BXRFJobGFsbEUxR1IxWUxpZWl4NFVKMHZmV0VJeTZWbHpBeDdFc0pI?=
 =?utf-8?B?bWVNM0lCa01HUS9zL3U4SFRpNEtXTGxIUDFyOHhjSVZIZUxnR3U3b25EaE9I?=
 =?utf-8?B?RW93RzkzdURHN2l2eVB1NkUvWmRZVUpoc2lRU3FSOTBDVUpkdU5MZmhSQWZq?=
 =?utf-8?B?cXhmTWZrWUVWRVhEM0w2YTB3RjdpcktkTW1LRko2ZXBPM2hWUFdLQnpHV3lC?=
 =?utf-8?B?aWplTXRlcDQ4NzhpaGJ6SFdDazU1M1BuTjQ1UGNYQWFCbE52SGNUOVJZL2Iv?=
 =?utf-8?B?WGhNRitPMTRmcjhSb2V2QmphMGtSRCtMQUZHK3VidllXc2JxVVZDRTZoQ3h6?=
 =?utf-8?B?UkFpVVU1aU92OEM1OWs1Q3FKNDlSUnA3clhaM0VEVzg4VDc5R2lxNUxvVzRW?=
 =?utf-8?B?ZG9nMTIyTzh0N2QwenNoTDZWLzRsUis5V0taNGdpNS8renQrd0o3dGtaMTNw?=
 =?utf-8?B?SEE9PQ==?=
Content-ID: <FB9793038A5EF442AE60A15D8EC3924A@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hoBU1XUwdbsuiLfNrd54JF82l5jKwMAs+u6dW1joom3lqsdTuO97U1GZFtLhiOd5XaVZ7k2Kctw5AjhCmwyXX/lm/MSpiecqIXnUwntOYlZX03wxI65URPNVx1DSSPeqShvoKVFGSz1uNBnvW7IQ4E2PJu+dFVvf/AbwTGdnqUvCZ+FNIJRnB/bsSZ4/3wlTx0MsDqo7MtW97ORLoiHrVAxWAsxwYbPxCTEmVL3j+SRwj64rp9TJUtxH4m+RmGrTlxgh4e4LLNKa+qHTLdM1oH23f3QMKLkaIpt4Uk/e+gtv6WCJ10uEwQSQfC5TJNuxi1q1mZ++MNOFvF5QFrTAp3KixpAZrN0KAGZdwgOAozCn+suUAYy5JJCoh9z0SEdXgdNFWVVFN93p42usmg5F4rffgEBDJHgGYmSROMIjG8Mn1OtcnD0SrnqoOkeu0D4UfU7IUaiDJRCybKJywTFIES2VSw7uqB99CXbZYW6yY5dUHnNuN8w68Ea9yaflXeXgBD3QGl9ho0/a1VzooaE/5S/FC8duTr3h/lpJm+KH4eQwVXcF+F8LpLxYJhO0Bk77RwYzTH3oDk7u/+36xVUsDNNvKNPdBeGkwZSh1Xy8WWgQXR1eGjc/TUvkK01W63OD
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7418.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42291c6-f5f7-4c64-c443-08de2b2eb86d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 07:54:39.5535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTirJWA1sUqiqjQgCHy/HHn5/v824yy5edYhlWkT9rjLdwlaYEqRxRZvuV2q/eAGX5FZ7WP0+uVCBRO+q80NitioHvRC9gf0zBG5gHrnoQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7288
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good,
 Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vNReT-0006ON-RT
Subject: Re: [f2fs-dev] [PATCH V2 3/5] nvmet: ignore discard return value
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

Looks good,

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
