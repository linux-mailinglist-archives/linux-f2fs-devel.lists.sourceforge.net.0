Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A24C7F516
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 09:03:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3UJAYnLw4lI1SqnvaXAhSpAvrftzV33eDlzxUMykuA=; b=dUfPawDGDyOEroBupf5FAbvT3o
	V6zmuH0JmIxigfVOl1nfMaSTYH2rNMEMEXrffJfNar22v6pwJzHv4vkefuJqq1wotwkVGiFAvW9GZ
	g0C0pQrjAQI/gs82NigSM6RBGBVU17BAHvIU5UZ3OPGEgtmdn/MN4SPCMB0Cip4ksOF8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNRY4-0000VP-5M;
	Mon, 24 Nov 2025 08:03:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=41613d8e1=Johannes.Thumshirn@wdc.com>)
 id 1vNRY2-0000VJ-32 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFwPOas6u+lM5mvUfszmtunUFzwAVV+X8kRFDto4Ydc=; b=PqmBH63OgQeL7ChNX/ES90GncM
 ps+fYzxqNhmEOq04hB3YPkMyeWg/U/5V5eWr+SKM66lD95z7y+OfOHGQPC2OqPIzmT+d/7gAcqCsb
 aGxTtv8hXZhCaYeFfCY+hi2LG/4QnFKHCvn5jdkxV5taWEY227IlR1g0orTDsxc0cH1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LFwPOas6u+lM5mvUfszmtunUFzwAVV+X8kRFDto4Ydc=; b=O2SdWQD5nJ7t1OK7pfynxI0Iwd
 jJnqCPbB/E4UUbKsMdGcrm7y7eXsLn2sQZJ9jEg5gMf4b9SOrHdNS/IHIkbo/d+mG1vXPT/brk89q
 goJUJcnbf6y1RjsSindfnYFzNRvlEU+2wJgg+2FEjH6hZQ91c395m55k0E+U6I4oeTAk=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNRY1-0005cO-Bv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 08:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1763971424; x=1795507424;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=LFwPOas6u+lM5mvUfszmtunUFzwAVV+X8kRFDto4Ydc=;
 b=dhI3AiZ6XMf2L5Bzd7EMvYOSj/ijyRA41HyhUcJtcZekuARZg4pP7gRS
 ynqE1DOly4wOkoIR1tXQ6zDzOVasne0Tl/25Oh2H2Fkuu0ryGOQutYPId
 BTPGreLFwqYCazkZMVXhXHriu94jn9dMlMnPzel10+btk0JRRo+8/wpom
 GLusMoSDJLuSLvcKpqMu6ZqrIDXp6pgGfqFDUluwuy/VYlwEZ9BULvr8x
 2EjUD/z6MjTOiupiVUPWFR3wPw5YbvapKVlFsqMjtAGKGKZIdupKzI4rU
 /1pIx7KKBFMXKUU8wKgRXolt9RyyV64PBXXrLT5DISWJEa9BVYchI2H2c A==;
X-CSE-ConnectionGUID: dS/nZd35Rbuvt15oFDhWBw==
X-CSE-MsgGUID: AK+IAauhTiOHt1ieOgZ0JA==
X-IronPort-AV: E=Sophos;i="6.20,222,1758556800"; d="scan'208";a="135269703"
Received: from mail-westusazon11012018.outbound.protection.outlook.com (HELO
 SJ2PR03CU001.outbound.protection.outlook.com) ([52.101.43.18])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2025 15:56:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NThjko+cc0KszkjBpa7jgV4Ju/DzPCA2C7fKkgfQr1unjJ4TwX8skXmzXjOrhSyONMytWculPLUfjxVkESMUWWjnW/1G5EOmdesRKAQxCA5U7ILWM95uXBWVM2wQwls4EXVu0nA5C77KzGixNdneJmh+FPiPBmsmrJuJiaSyGnY9Yx8bsjuCfZ1qUhhBQo61Q8d9rb/FK8m6WLU5kaIceQaRCNCASxKuiAI40l7OAxllZzZHbPqwbexrVmQO+W5D1ZMWp3pEe4UH3HYl6RRBN6tBVKyRB5vHjcpcuAVppzw5ePWhGZBnwJKwrBTy7KBfFOdaawYfO1PbMOm0083q5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFwPOas6u+lM5mvUfszmtunUFzwAVV+X8kRFDto4Ydc=;
 b=V+CvZPWTufOl9CaIVi5C6TLLuKb1IyKG5hGqVYFSNU9oLEtqIdrWPCIdaTkCeydNfKcgAcCrzr7KR5QedKnbZ/DPFYqfy6aDxtW+oZ65/A+fU5sqzkJTU/P+j9A+TykcU9oMwd9oyEYf9FgxVyT/zfL4iyUh/QreTjOShkYyq9JpbzsS961Hi+AItFQDAyuFKkkRaoM1h1RKLRQVldG5GtDB/NHkVba4RxXZ0OdSgEkBF5iB9IPGFwd5cGXmDR1oO4Oq0qSI3YgoRxs+9mztYEKZtpD0o1Wx9Ml+S/6Ub4dS6S0K5vlruHThsILnPiey71D0v2oe/OZPSo9vTX/etw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFwPOas6u+lM5mvUfszmtunUFzwAVV+X8kRFDto4Ydc=;
 b=PIk3YzXjoF9iwdkg3XfYJKzvYsQS/+O3IxM/tvnefJvBNICaZfchBz6ng0DcvWAW0npNgbd/trP1IC0WRKBVN3xZyqjXW/BADJVaqUd9peIZ1BCA7Eo0SlJcTQ4UMIyBZ+SzPqGCXxECP5XMY6ta+MLW4VbZjoljdmCDgNvSV0Y=
Received: from SA0PR04MB7418.namprd04.prod.outlook.com (2603:10b6:806:e7::18)
 by DM8PR04MB8118.namprd04.prod.outlook.com (2603:10b6:5:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 07:56:06 +0000
Received: from SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9]) by SA0PR04MB7418.namprd04.prod.outlook.com
 ([fe80::17f4:5aba:f655:afe9%3]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 07:56:05 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>, "axboe@kernel.dk"
 <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>, "snitzer@kernel.org"
 <snitzer@kernel.org>, "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "song@kernel.org" <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>,
 hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>, "kch@nvidia.com"
 <kch@nvidia.com>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "chao@kernel.org" <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
Thread-Topic: [PATCH V2 4/5] f2fs: ignore discard return value
Thread-Index: AQHcXO5FGfbCkio2IkK9BtGiPp9CALUBdbWA
Date: Mon, 24 Nov 2025 07:56:05 +0000
Message-ID: <b28f4f1a-8224-4205-a3e4-4894b6cbfa89@wdc.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-5-ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-5-ckulkarnilinux@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA0PR04MB7418:EE_|DM8PR04MB8118:EE_
x-ms-office365-filtering-correlation-id: b11ecccf-1c99-46d1-a5c4-08de2b2eebd6
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|19092799006|1800799024|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?eEZ5U2VxelJNQlpvejM0K2E1L1FzYnpKT1lrZ3hGN0IrMmJCYnNETkVlTDVL?=
 =?utf-8?B?NGJBV1hLVFlLUE9HbnlqSy91eXNZdVowWXZNNFBQS29jZlQwSUR6WjlicHh5?=
 =?utf-8?B?WlNsYkROdG4xYkxBc3JVNFJpNHZvQ0NOWjM0UlhzT0NzZ2VBeWRwRlJoS2dr?=
 =?utf-8?B?MEU1S1B0dUVzVEx0V0F6ZStoamdhNmZDQXZ3ZlVXNXZ2MDR2UFN2U0pCODg5?=
 =?utf-8?B?WFdTRFNYVC9lQ3hRaENqYWorK1JKaXNUbWRpTFdLN3dtWk5tTW1QZDVadmxY?=
 =?utf-8?B?dW1IM01GRmFDcC9ZTmJaSUpTbnUyTHBpTEVDOEt5amZVQ2ZadTJVN0MzdU8z?=
 =?utf-8?B?bEtxLzNrK1FiNXZuQVdsOEorWERGY0VLd1ZmVGpSMU54aXFxVHZ1aFNkc1o2?=
 =?utf-8?B?V3duSXBGOVJab1lsTlJRYzFDdHBBMDRvbjArUnJtZ1NkRVo4VVp5aElkbm1H?=
 =?utf-8?B?RjJVbzRQd0xQQWtRNzBhOVZxcGQ5bkJ0S0FkYnlCNElYVmJHTVYyeHRvYkEr?=
 =?utf-8?B?MVZuM1BFQUI2cGI2N2RTaGt5TWg0clBGaUlPTFZrZit2Rzk0UHZQU3crN2dR?=
 =?utf-8?B?YStsWEJVRnpld0QwVnVFK3gxTFJLQkpUQ1JyNnR5c3BaRDNNSjcySlY1ckdB?=
 =?utf-8?B?MEh4cTcwQTBha3U3aHpSRUpFZi9vd2xrRTdySjJmR05IcDI0aDlKWEpCRmNP?=
 =?utf-8?B?aWVIT1ZmYmtPMHBVQ0xBdjhIT1NmYVc1alNEN1h0a2MwM095QlpxQlU0dS9W?=
 =?utf-8?B?dFo5TE5sN2RsamJaUjh1K1k0SVJMV3VDZzdheVRhTGE1dkxaODU1bmVXa0Jh?=
 =?utf-8?B?ekVQYVpNWXQ2YVNqN1BZdTNvREt5YkF3NG1RbHM0TUN0YS9hSkZJUHRhVmVp?=
 =?utf-8?B?YUxkcXNmUzNsNkZaY1loZy9SSy9UMmRlMC9PbXdBdnEzbk0weHY2QmRlcHJR?=
 =?utf-8?B?ZVorenF4Vi82anAzcXJjWlVvYXVIZkFXeXFGQmlFbUsxODgvK1k3ZFNsNEow?=
 =?utf-8?B?b2I0ZU9ocFR3aUY1TXNHckd3eC9VTkRSWkl0L0hOdTFIY3VUd0hPVVZzUGZ5?=
 =?utf-8?B?TEhmNDdwemYvTjVkZHFhdFpwYS9pQWVhNjVXbFE3ckpDWFV1UnppUVdvZVBL?=
 =?utf-8?B?b1BuVFpUR1h4bG52RlplaVN5Qm5nS1RxNjNkb0dFaW4xMEl1aWw3dnBGWVFw?=
 =?utf-8?B?Y25qaElic0VvdStYRUhuMHdLeHZWcjdOenVYSDErQm1JbW1sNjhnQWJhWkVV?=
 =?utf-8?B?WXJwdTE3NU1Lajl0Um9NWFZVNmR6b3VxeWhZeTJnd2wxNEl0aDNqNlZXOEZz?=
 =?utf-8?B?TEpxVk5JMTFBTDl1Nnh6SjBPRUpMUlRhaXhtTTdEMEhoR2ZpeVlDUEtSZ2pu?=
 =?utf-8?B?SUxsL2Y1dEQ2UnMyMGIxWVR5ZU9SWG9rb3RBNHBQTFVoQnRYT3kvZ3l1cUtk?=
 =?utf-8?B?Zmc1QWRabWFkZ01obDFXTTc5cG00TmdDTWE3aHAzWXdDOU5aM0JObVJxZk1s?=
 =?utf-8?B?b09MSFhOa0t5djAreXQ0T2VmNGhlVTNmazVZYnkvemF5SDJzSk1tNmJLZjJu?=
 =?utf-8?B?TGtZOGtNcEhZcXpkRWhFVFM2QWVMNGphbzU5ZGVsVElNODREaDd1WlhNZTcv?=
 =?utf-8?B?a2RDSzFZR3kvdFZwT2lFTEhoNlNkUG43UkJaVlZ3VG9yREJjU0VqN2p6c3ZV?=
 =?utf-8?B?TDVLbGwxMDk5R2RDS3pNc1NRUzJ2blBrbWdPSjJ0eFc0K0ZnZlArRzQvZVlG?=
 =?utf-8?B?QkYyVjA1bDFBS2VtV3o2aUE4RG9tblAvc3J4Vjd4VTRVSGlzSG1jcW50NzNa?=
 =?utf-8?B?bmxEeTVPTTUzbWxZMStINENZN1dMWWYvWG5XQWxhZWZrQU0rTytEUWpNazFI?=
 =?utf-8?B?dndaSGF4clBEdzZ3amJkYkhYNGxRSDhOQ2wyK2dXT0ZCOEhrZkU5ZUszNUJH?=
 =?utf-8?B?b3pUVGYwckplK01oUVpGUVZseTNLTkRWVCt1TjdMdXV6RDY3ZStadnFTczRH?=
 =?utf-8?B?bFdUc2tJZXZORFNLRzFwWms4MkZmVndHWUZwYnNLakNweFllNmt3Mzd0V2J4?=
 =?utf-8?B?MTdVZFB4dDVTZ2NvOVpDdDFMK1JLNWl3QlVwZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR04MB7418.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVVybUorYW80T1BMeFZGWlVOeFExdGh1NkViMEEzblRET2tPZEcyb3pBanJq?=
 =?utf-8?B?UDQ0RTBGK25ndisyM2lCREhYR3BycjV1bXNOTWw2SkdzQit1OXZEUzVGTUZQ?=
 =?utf-8?B?L0tGMmVOV0pGSzVJL0ZrS3BZVjFnSkkvRG8zR1FiZkdiaXBwaE1yRG1mUi9j?=
 =?utf-8?B?N3BUbmdGVDliUXEzODNZOG1XT2ZTbWdpY1ZhOUtqSzRwWnpmTm9aSEdKTkxl?=
 =?utf-8?B?QkFnWGZHWVpFd0c3d0FNd1RWSUE3TVlHdmY0S1cwdkE4NERGeFZIOU1kbHVD?=
 =?utf-8?B?Ry85Yi9URnYvOGZtblV2eGROWSsyVmxWc3hFNmpsR0xLU1MzZmJ0UGd3VTZ6?=
 =?utf-8?B?R3NSK3RCMTVvZlpyemtoSmtMU0E5NjZHditqNC9BRjl2NDAyNnAzS0x3djcv?=
 =?utf-8?B?V1doV0lham4zVzdGbTVEZFlPMWh2UDNCL0QwYzgzN1dSZzRYMmVDeXNIZHA4?=
 =?utf-8?B?Mkk3U085M1lDaFB6cXdCSkZPd3FFNXBJS2hOVUFmRjg0U3o2VUJNN0lWNmsw?=
 =?utf-8?B?Nm5aQVl3UktwYjFlSi9VaE5sYnhVYUovRDgvdTRVUmVkZDFsYUExZzlsWVk4?=
 =?utf-8?B?WEt3L1VaenlYcG1UUUdPQXZKUGJzTkRCbHR2Yy8zbUM3OE1lTjBBUEpBeWZG?=
 =?utf-8?B?NFZRWDhCL2FYbXErWENraHVwcVk2djVXUjcyNnlpUlBqOENSamExUnJLdjA3?=
 =?utf-8?B?WmFtNGxPdi9yWlJjWnBmODZlY0Q1a0tlcDZoTmROK0Z6OFIxSTNMN1FPY2Qw?=
 =?utf-8?B?VXFtUzV0Y0RMR1RHUVdhL1FCR1Q4aTRqeTQ4K2JRMEJid29ZRXdmVkt1RjVZ?=
 =?utf-8?B?MGQwWS83UXY1N3FieGVaVmVUUnZuZytCYWwvZUtCR3JEVmZxQjY1bmZWUFQv?=
 =?utf-8?B?bGdINU15ZmE2TUpHUGo2MTUweENxTXVvazlSWGgxVHUvWmFJQzY4bktxbjEr?=
 =?utf-8?B?alBqYW94RDhZNVlyU1BqdVlmc1B3ZGw5RG5LNlpVOVZ0eGZrZjVqRXFlVlhJ?=
 =?utf-8?B?M0YwSUl6ekRYN2NYQ3YvbTFOYnRUUlBwS3JHdWM0LzdLZGdXTFQxT01ueTFr?=
 =?utf-8?B?MHF4TUJQeno4eldrYjJIdTRsaENKbW5UL2pNbndodCthM0RrSjM2Qjc5WWRH?=
 =?utf-8?B?SUhLNGpwT0UycUM0RjV6ZGZRa3VuNXJLWjhwQWJTN1E5TU16OGV6anAybDZv?=
 =?utf-8?B?RjBZOFFYRFhVZFdyTlVFVzlXMjV1MTI2RUpyY215cnJ5KzZlejVkUFNXZzhH?=
 =?utf-8?B?SFRkQi9DdlplVGVWdi9MSHU3aHNhSndkTzNZc0FrcW9QQjczOGg3QXJSd3Iw?=
 =?utf-8?B?YVFoYU41UjNmNHNGRUdQcWZFR0lXcURJYXdqREx4N09ZWE9PTG9QaXZ3QUtP?=
 =?utf-8?B?STJkTXJrbWlud1J6RlJWZFlPNWlwRHo2aDRNTlE2VGo2WHFqeUpoem92NDEx?=
 =?utf-8?B?MWNzRHRuMEk2RWw3NXBCY1hWbzg1WWsvZlNTMGR4Z202N2ZmRlIxbktyR3FP?=
 =?utf-8?B?ajlSVi9VMHprOVQza3FGSkpSVmRHUUZDWTZlQk9IV0pGeXpZL0xSSVQ0Z3hM?=
 =?utf-8?B?TUhSbC8rd2I4TUFvdVpHOVYyd0N2VHQ2MmlPa2xrM2x6QmE1RXBWVlJ1Rk9v?=
 =?utf-8?B?d2dGemVrUVJFNk9PTHZidmVHWmg3VUZNUXN4SloxVU5Tc0tBZ0NJcFVIajQr?=
 =?utf-8?B?cDEwY3UvUm5xVzVBVEt5UGhoNTBNVzd0NFNuTXhpV01udWFEYWJMUjNpVDht?=
 =?utf-8?B?NGplZVBPSFB0K2M5SXVUYUZDTGI1QVVWNDhhN0lsV3o4VWU4RU5VbmFkOVJm?=
 =?utf-8?B?ODNnb3Jpd0ZRcWg3Z1ZxR1hVZE1JNDhuUmRNMXBuSGhrNEMzd1dyeDdJc3Rj?=
 =?utf-8?B?eFFuZXFLdkRRVWpPVGl2RytqYU5tT0EzTEtnRU5OckxnUk1xWHllbmJ5TE1t?=
 =?utf-8?B?QmJpQVpGdnlGRXYyQlNhZUZ2YmEzVWw1LzU4U25GRUY4L09BNFFiL2t2Tzlu?=
 =?utf-8?B?UHhEeGw4MmNIQTgrclpUYWs4SjZJekVRbGJ4aHZMQ1ladkt1cWFISFhkaHc5?=
 =?utf-8?B?MmRyenJYNjljdCt3OWtZMkFOTzdRUFUxeXJEUXN3QUhCV21KYS9qeW1CbTFG?=
 =?utf-8?B?QlRzVWtkckU2MEo0NVdIRy9oRmNON2JiZkFlYXJHVWVPcEc1d1NkeTBPT2xo?=
 =?utf-8?B?ZGc9PQ==?=
Content-ID: <3BA3FCC03EF64041A2966E020664C4FF@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: RScVdEiKxeMiNqDwvu6BRayNsoxeVtzJhANss80rWG6TYgtfKcqbdFIx5XScARIdexWwlM0azs69x/1SARIh733TYcZG7ducIBlh/tOaA70UjaeaelxkhZaMnbG1WAGwebcnEkp6TtsSw0tdw9V1uOz7qPu5GlrLYJi1avpFAfVEHaOrnweapoQSpkyTLGEYyK1B7757YyCv8S0PrHFWqXnLRXUYe9gu6Kbd6CKVj0+9ocL+3HHF27rsUivYs1RikrGEb3A0UVgm3zmxAI7Jo6J7QLnRE0JoZcW+f3tB6HM4qz2UNSzx7wxU0i2o7qriK8OaivvKUNSYRWTM0QJld7qco2b+VO5ziqmZLT84OsakBnQAYrl5lq54Q+MlOL1Zxepm1jQoJle5VTgYplGKXcxzZ1ALFX+onbL3o2V+iceyjr/1mQRkOJgIfRuerNyD7qXr1eR8nsGq0XPBcDSaLJcItN0ZxIv56Lq08BTaof+/L2WdWrv/or+MHgrdITW2ApvTkjqFtqjyg2diQ5CNZIAutw5dLrtFEhq3roosmmlHBX1B6RmSE6y1Kp0zhMyCphjvCZlFsFbYmXMFe1Si7p9NQ6t/M5GYDQyFUhBxqKe+xPcw8Cf5R8OYT3lW9kov
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR04MB7418.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11ecccf-1c99-46d1-a5c4-08de2b2eebd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 07:56:05.8165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WMRj7y5QXow8godR4QC6xJuvB7ARfSo6iHhMq6NzEkJ8m5f41JVJE2HTWgcpK6j5+SMVDflhRsDoM9fQ9nw/sxRhxLZCNsS2XW4ddtIMgJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8118
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/24/25 3:58 AM,
 Chaitanya Kulkarni wrote: > __blkdev_issue_discard()
 always returns 0, making the error assignment > in __submit_discard_cmd()
 dead code. > > Initialize err to 0 and remove the er [...] 
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
X-Headers-End: 1vNRY1-0005cO-Bv
Subject: Re: [f2fs-dev] [PATCH V2 4/5] f2fs: ignore discard return value
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

On 11/24/25 3:58 AM, Chaitanya Kulkarni wrote:
> __blkdev_issue_discard() always returns 0, making the error assignment
> in __submit_discard_cmd() dead code.
>
> Initialize err to 0 and remove the error assignment from the
> __blkdev_issue_discard() call tp err. Move fault injection code into

s/tp/to/


> already present if branch where err is set to -EIO.
>
> This preserves the fault injection behavior while removing dead error
> handling.

Otherwise

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
