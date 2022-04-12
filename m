Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 263F14FDF4F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 14:17:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neFSI-0005iA-9P; Tue, 12 Apr 2022 12:17:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=0949cad19=Damien.LeMoal@wdc.com>)
 id 1neFSH-0005i4-HR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AXDo+xUrlKnjHlIRBaqu41LORgfa/fYdJhDEkE/0Hso=; b=NHC4vHPCDuFefC0SDVpQOdlaQd
 TIO2DLvcv6lw/dDaEOGiL++UD1oMY/yBWKQeFyw17AgPolV+02oU6gwBxnT8ZYcAnIRqYYTMH3gXI
 QOeSjkV3kcSbhaKFZU2K+Ci0ijjmBS15nlYkvYEEbIraZ0PoMSYukHqrd1uXDAvQqpe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AXDo+xUrlKnjHlIRBaqu41LORgfa/fYdJhDEkE/0Hso=; b=K9ddkAd1tgRm1fgUqBz8XrbCwR
 cZlFy011b3P+c5Blr1YkIgpUYtyL312yeH1PK7JaSSZmgQ9fQ73vaEtbw6FsB4etEfDD4h1He4eNs
 YiXlGoqgGQxBTVbw19iQFw95bj0D1kv5VSEaEtiu/ieqcOyciubRxw7o52RXBAlytAdE=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neFSB-00E0d0-OT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649765822; x=1681301822;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AXDo+xUrlKnjHlIRBaqu41LORgfa/fYdJhDEkE/0Hso=;
 b=PqQTy7+/ycIoluv0ybARzX4AeWKsHxwv9e4Qft8kr5vqzcBS7w0sQiz2
 vSzlNpbZidDblydlREZa5FPvNyo2aRVHiIDylTof8fIllDg+H0DYprLNo
 lFtJRiXRKGsmIL5nRrmw03wcySDSAZ98gJkAsED3d+VFOiNz675gElrv0
 vQjWn8sXu4HwKykZ8SD+FEpEvJ2bE1/+C9f9S4xJe6oPIZcSumAsabrG+
 CiShqYtzkY+L+RYH5YaYWnitqLJ0XTBTgMQSZSmdTHAUDJBYNk5IWkBy/
 VAjCPyIQ1j6RTENd1CwUDW4ohLVZeolZVybHcC4XDruk4bbpkI9fvHYzU w==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643644800"; d="scan'208";a="202578451"
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2022 20:16:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyS4sgLWaDtux/DspP5+OlFdJxlf0sHpipxiC6N4WXHHJ6NoDlhocTfJN88250chiAKL+f3n+4upc8a+2bW9z0EZbEeV50W3oxYF7JCZDJ+pM3RrtB/mT9n/t4ylF3o2ezjNVAFgcYzuocO5IKFzzz7gZH0sC32gRZEew3dZGhn6uvLKBL1ZskPJaZ4zqHxukmDB5ivwxyP/QZIvJu9Rf45eXgZjng/z6mHS4NSdsDMWKr581BNw/3aAuo+rnxQia/MLkts8EeehLm8OmqBDTIrs6BSHgfQ7ycWyFRvwqxGsWt5bWiBUKHAOhekR/n0hi1sFj/hnrs/tISN+btKK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXDo+xUrlKnjHlIRBaqu41LORgfa/fYdJhDEkE/0Hso=;
 b=JX5vFhZNpHgQDVNbGRcedCHJHrhy1BPguqyZW7w+fQct3bdAWhfgCJgMFj7zKJNwZlFX/GP7aLcWQLOJW3miKDNJJo7aXkZYFDqp5LoHFs2NE3sGdtkyth+DHQNofEzHC8wPlSCBmoWVrXJPtSbjwuFLVOHyg51ljU8iKVOoMvsCTJ0pcpT6NEAxGMvO3DabjoKuQTOM/XdNMOoSOYQS6gFxuLQkK5vCXq8dBBc6xw9dRjInVjJ1uLB2P4iWQ6ZPTdefxPez4dqLQov48eAEVtBCuLLo5XuUqte1NxFps6LkIaXuvWPdiOT/XdJf4EiwNMJITtc7eeKjBxszjmVYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXDo+xUrlKnjHlIRBaqu41LORgfa/fYdJhDEkE/0Hso=;
 b=D4SCQ30vn4x4BXrS4bJs6yXvAG3bGm4zbZkw0tNrin+G0gSqgjMROAva8GfxgUEhWsDy6HTzXEb8dTodNdYtWbxOlTZ40EJUx8Wf3Q0CX4/IyGfHK7nxdyMsS4Ny6Ox1l5j9/ga9ZxNObUzgokxj8FfLgYGmlwhbI7XUPhqpRWY=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by BN7PR04MB5331.namprd04.prod.outlook.com (2603:10b6:408:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 12:16:53 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0%4]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 12:16:53 +0000
To: "p.raghav@samsung.com" <p.raghav@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH 3/3] libf2fs: don't allow mkfs / fsck on zoned NPO2
Thread-Index: AQHYTmBbQLjY++EpX0a/nOe2xIg+9qzsMaEA
Date: Tue, 12 Apr 2022 12:16:53 +0000
Message-ID: <cf4e409966936c1d5e4486f172b45aaad128ae36.camel@wdc.com>
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451@eucas1p2.samsung.com>
 <20220412112745.44108-4-p.raghav@samsung.com>
In-Reply-To: <20220412112745.44108-4-p.raghav@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57867e02-8dc4-468d-907c-08da1c7e547c
x-ms-traffictypediagnostic: BN7PR04MB5331:EE_
x-microsoft-antispam-prvs: <BN7PR04MB5331C2037DA56E978FB60255E7ED9@BN7PR04MB5331.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bHyuJa4JM4M2RYj8s3gtZlzf7CoFPmerIBgwTMa+mo/aORIlc4ZyZpBtS1eibsfoQ4WTBLSauXwUeqIiv1ZvEkhmhXjquCqlRp9H2cXy5bsYEQ8Gg80qrJPai9BPXEq+qVaVHHEXZSZQAgXTUqbOj/WuOYnaWWac/nX1pKpUR3YxIC1oWiEnS3Fidxdwqe0bnEIR3p0fj5q3FZFJfL8dflxBlk5PhHQR/s/jHWDSvrevL2l3D1sOlMKS4jfb4GnCd7kydfpe9jThMrLSxzj90k+RKtY/59KuLRgPYbcNeaoDhVz3l7GenCd99ojBaaw+wfMOY0fmQ7C9AKi6muZNXyt6OJK3dYXhszJP2IFPcTw2ygyj3SvunoYkWD3Lv3xykBN/N87XiXbRqxZanPk6mIhZO5GOQKMAJlKqJYFVqd0fyF2cK1HiG/Ra5L+o8VzKV375PlNOge/4emFi3sD2iiOHNbP55bh69U64OnHUL+6WkAI6ZU9/h0nJkyGFgb4RZmOIiXKqPIM+6VqZiPpfEqTuBV8ck+1/0A9vmpbIHmzNiHo1grly0tFsuZtsPUWbstgKdVhAEjXmQTmIbGIo5c35sSBNy0UTUrjO8PPIdw7980AEuEy786VGnUwi4aJ9Jdk2lfXDqSFrzGpYiAm81Fai0rvEuL0QGpgvH6AzxXPdlhm6bMFIzye3FJfbxMhaFMRc8ri0btDFoYzcvdpjGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(4326008)(2906002)(6486002)(82960400001)(36756003)(5660300002)(6512007)(186003)(26005)(83380400001)(316002)(38100700002)(8676002)(86362001)(66946007)(64756008)(2616005)(508600001)(122000001)(91956017)(66476007)(38070700005)(54906003)(66556008)(110136005)(76116006)(8936002)(71200400001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlRlUnQ3eUk1QzBmY1VUK2dZTWp5VHVnRmdwc1lBRFA5eHNPeTlDY0U0WkM4?=
 =?utf-8?B?YmdFUlVWTjJXbVJjZzdQTHFuZWlsRkVGeDRLYXUwMDlieFBWYzlTOEVVaEdt?=
 =?utf-8?B?cXRjTU5mTjJ5YU1HcG1RejhNOEV0K2RvenMxdEZmYUZjOEZtSkdhdEhvSXh1?=
 =?utf-8?B?RE5hY1RRQ0VtVnpzMlpQbWtNL0FkczhLcEZVbldFYms5bVY3ZmhyMi9RUENp?=
 =?utf-8?B?YzduR3V1dzZpc2lwdnVuWjhCTldzcjlrdUNYanF2eEtKL2Z3anhSYmFWOU9P?=
 =?utf-8?B?RHhUV0R6c1kyR1g0ZllScGd2aTJ0aE1DUTFpeGY3L2JTc1lnMkFxUlBOYlZy?=
 =?utf-8?B?a29NcTYyL1pSZGtXaFB4b0JhMWkvRVYzK0RzT0NTUHdWek43Y1o2SHhUVk8x?=
 =?utf-8?B?eHdPdEhOekVxdXk2NW02SDU2RVd4MHJTYnNNTmM3bE5aaWR4Yk5kZnQxOVA2?=
 =?utf-8?B?eTdqNldFWVV5T2xzdzVYekxoemdQeFQzNnJGUSt4b3I4YmZvUnVudDBHMTRQ?=
 =?utf-8?B?THpHLy9wb0toMGVTWEhqRGcxY1RuNEpISjZ1ZlkwOGwvSVkxVXJuRjdaVVZ4?=
 =?utf-8?B?M3I1cjIwTzB1Z3lEbUczZTlhM2ZKU0xHNmthRTVPaXozMVM2MEYycjNZTnNM?=
 =?utf-8?B?MGJ4eGYrbC9UVitQd084RC9GdWFUQmZ3NUpQdnBjbzZpaFU1TGtqQ3hIbURC?=
 =?utf-8?B?Y2lsK3lsRWJ0UTVmei9zWFNJdDJwdWF2OWRqbXZHS20vdzNwYnE1ZzgxMk42?=
 =?utf-8?B?OGc5QmN1VW5iYWY0TU9EQlExbmVTZ3lIeTRvL2QycExQY2oyWVVLcHN3ZnB4?=
 =?utf-8?B?eE1vcWdRMW9aTDNTZmdrSmFUY2pkZDFlQ2xpSEZGQTNDeldJVnNSQ2loY3B2?=
 =?utf-8?B?K0R0REFaZ3FDaVVSWXU0Y1lTOE9hd2QzSDloclZlNFdxWCtUT0VmWDBGQjly?=
 =?utf-8?B?eTVyT3dwZW00TDlzZHJDQzlkUVN2MXFrb2F4TzlEbVl2TVlLajhFYWR3VUI3?=
 =?utf-8?B?RklibXhzVWtHODN6T1Yzc2RPYUdwdkdpQmJ0S1hETVd2OXJsZlEwTlJJeXRY?=
 =?utf-8?B?RTJpS0VTam5yVTcrWHIxdllWalFSd0ZkbUZ2cXF4b01lQVJIVzdpb1BWa3JK?=
 =?utf-8?B?QU5xeUR3SG1rSVY1VklTejRxemlUcytPQmRvOHJFN1owaDFZOGxDTENraXBX?=
 =?utf-8?B?UXlPRmNoaHIwbGl1b215WHdOdkVPUjJOUE1GcEtDcFlPWEtrUkxucVBOVmRZ?=
 =?utf-8?B?YlJOTUd1MXZkUmtiZi9XcjJTcWhNOGZaOUQ3Nk9sYXU1a3BBMXpGcHVFTnl0?=
 =?utf-8?B?Y0ZKeVJwODNNTHg0djZ5UExzdEhUTlRld3lHYS90YVVLQ2duN1BsVklTMkRi?=
 =?utf-8?B?RFM2cHMrVUxTelYwallITlR0ZWFNUlp6Nm9Zb1JDWjR5Qm91dG84YTRKOGZz?=
 =?utf-8?B?ZDBqc254SGs4eC9DN25tcVJCOHRjUzJsSE9sdm50ZkIzNFJ4UFlhRGxRaGpa?=
 =?utf-8?B?Z2lVYkRBOVYrWmRqcGpsb3Nmcyt2MEJXTDhITVlXWGtCYTByRmZORWdMSXNM?=
 =?utf-8?B?bW9WNTVEeDZRejYzTFgyYWZlbXZEaTVXQlo5NXNXczl3WlFiUzBYdzVva3k2?=
 =?utf-8?B?cWdvQy9LM1V2QUdhNkNSUnJFTnZXdWVLeVV0QS9jRTVuUjBlYjNSb1hCdkNN?=
 =?utf-8?B?WjU3WDF4cmZRWUpwV3Vwd0twcytwOWc3dFNiMWhFTzdHRWRxU2lLSEVnK1RP?=
 =?utf-8?B?bE5Ea085d01GYk9EcVdJZHZrZmZkRjdwTTBpUTR3TkZXNlhlT2ZXSWE0eTVW?=
 =?utf-8?B?eGxiWjZJUVRucHhSb3J4QzNOSmxJR3hyUzQvQTh6SHV5MFptTktqWXp5TVJy?=
 =?utf-8?B?WXVFUS8rNy9ncDdXTlZtZ1R2VXlxUDdFMUtWcGZndFBZT3NXYkxjd2h3anlV?=
 =?utf-8?B?TnlTYytNd1NWSXdIWGtxSnd3UnNtZjhEU1BrMFlQWmNXdmpGSlZKK01UbFpr?=
 =?utf-8?B?UFl5S2FhUndMVkR5V01jY0RGS3RvbVFVMTRyZi9RZzhMaFpWQnJaaC9naUlS?=
 =?utf-8?B?dE5NcEtyNTB2QlBoMWVtWXBiWERiL2k0MElWZ3Bpd2RGc0lXK244NnYxNHNt?=
 =?utf-8?B?MTEwT2tVQ29pZVNiNmpyVXVVaVpUVnpVOWpEQmR2czJmY1N6R250UnptK3J1?=
 =?utf-8?B?WjhjOVdiRVdIVkFDdDB3Q2toOXRYTGM3ejRoMk1oODNBUExlZWxySEtBajd6?=
 =?utf-8?B?bmxlaWJiYlNNNlZNUllONlI1MTZ2dHNJYmdWVWRmbFc3TGVyMFFSZXZCVFFs?=
 =?utf-8?B?R29wRk4vcDRaRjhRSTM5RkcySXdSb2FMRExtb3dQQjU3bGNSUHlKT3dZU29P?=
 =?utf-8?Q?tdS+GpoPZJoF3cr8=3D?=
Content-ID: <89E795865B24CA4EB142497743309FC6@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57867e02-8dc4-468d-907c-08da1c7e547c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 12:16:53.1359 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+Pujl/Dxdf755Pn4nmgeiL8DVAyO1OXAo53684lMPCMndficy5jRsm13WrSiLc5fxpvrVOuT99cghl4DFn+dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5331
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote: >
 From: Luis Chamberlain <mcgrof@kernel.org> > > f2fs currently only work with
 zoned storage devices with a zone > size which is a power of 2 (P [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1neFSB-00E0d0-OT
Subject: Re: [f2fs-dev] [PATCH 3/3] libf2fs: don't allow mkfs / fsck on
 zoned NPO2
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: "javier.gonz@samsung.com" <javier.gonz@samsung.com>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "pankydev8@gmail.com" <pankydev8@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote:
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> f2fs currently only work with zoned storage devices with a zone
> size which is a power of 2 (PO2). So check if a non-power of 2
> zone is device is found, and if so disallow its use. This prevents
> users from incorrectly using these devices.
> 
> This is a non-issue today give today's kernel does not allow NPO2
> zon devices to exist. But these devices do exist, and so proactively
> put a stop-gap measure in place to prevent the from being assumed
> to be used.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  lib/libf2fs.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 8fad1d7..a13ba32 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -882,6 +882,11 @@ static int open_check_fs(char *path, int flag)
>  	return open(path, O_RDONLY | flag);
>  }
>  
> +static int is_power_of_2(unsigned long n)
> +{
> +	return (n != 0 && ((n & (n - 1)) == 0));
> +}
> +
>  int get_device_info(int i)
>  {
>  	int32_t fd = 0;
> @@ -1043,6 +1048,13 @@ int get_device_info(int i)
>  			return -1;
>  		}
>  
> +		if (!dev->zone_size || !is_power_of_2(dev->zone_size)) {
> +			MSG(0, "\tError: zoned: illegal zone size %lu (not a power of 2)\n",
> +					dev->zone_size);

The message should be different for the !dev->zone_size case since that
would be an error.

> +			free(stat_buf);
> +			return -1;
> +		}
> +
>  		/*
>  		 * Check zone configuration: for the first disk of a
>  		 * multi-device volume, conventional zones are needed.

Of the 3 patches of this series, this one is the only one that makes sense
to me. I fail to see how the first 2 patches improve things.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
