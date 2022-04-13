Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E4D4FEC26
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Apr 2022 03:19:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neRfM-0003vl-Lg; Wed, 13 Apr 2022 01:19:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=09503ed5f=Damien.LeMoal@wdc.com>)
 id 1neRfL-0003ve-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 01:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=swoa7TtnQh1oYll93E6WvF7ZDpPAh3hPcZglN2Rofkc=; b=eCbVWe52wCyBKAi6FMk3sQSXsA
 EFe88zZ49FMOmBIE+Jggn2pa3wpQ4m3wlToRbctPIdRS0t8tCYBnPHcYeGy/1rp4UUzuFzne+UcRM
 ZCohByXFNHuCbRt4mBSJhVbuqW/mlItu1RLRVZ1GxxFWZvoHkUYYfTGjt/zH+qtnP4TI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=swoa7TtnQh1oYll93E6WvF7ZDpPAh3hPcZglN2Rofkc=; b=fpn+hoCDeFc/AAB+X534vkmaZm
 qB5PUAp6n3ipXfNvwVr/KE167mMPejdu6Rzh6itk1hRYlUUB3OUyAUWmjZqGVt55mrol/TaRDsHp5
 kDseBlqX7N9lf1JCUt7s/UTEq6/ZUOqGae/SUWAApsNWWPe6GVuvewoUSiXyA/sR7N2Y=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neRfF-00EiX0-3t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Apr 2022 01:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649812760; x=1681348760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=swoa7TtnQh1oYll93E6WvF7ZDpPAh3hPcZglN2Rofkc=;
 b=QNEBv1O6RWamgghqLVr6BqiblYLBh0AIkO5mLGVqIiNhLudpMmfqx5tK
 j7hpQH2Ps50+b+OGl6kc6+tC3LvJBqDydbotSOKpv5WZbD7DLSQUlgLQi
 KOurHYGJKlEag1KBF5Ig/Ikq53ySG8M5ewIR+6YpMN0QyRhQF13opy3D6
 s7T4Cn9aoENVrzkLq5wgGIWspjRx3Za8HvYAfZDAYO9IRk4drSXnsMOOc
 ZrP3iUC2Zi51NigzIUi6iLAz/qALYb98QhcGAlixyUHnaqME8Aat3iLAj
 2jje2ThOWCYMbSUCxzaV3ojKPLLydCOtYrBYvwVZtMJVFL3f5OrAw9Hnq w==;
X-IronPort-AV: E=Sophos;i="5.90,255,1643644800"; d="scan'208";a="301961599"
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hgst.iphmx.com with ESMTP; 13 Apr 2022 09:03:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDwP3CMS8mk7M1bolBRpAv7ux/otrFMRaafiV0F23CGxqzm4JZrhTPX1obrjwYVZTGeeX9SzgteTa4v9BN9tP+F5V/DsryJ6OhFkn1j/0NfVmsRaBOiQJqGt8nEUewqXWnJhm0jhLDc9IoBe8mE/TibNdUsk1up9lK2BdNcloIPRkxER9KukxsQKYXckNAO2hlEEtJS/zRlYCfJNnakalglhVm2jQO0yn+nUcMKpCB9fGZh32+uM2skfOcvTmMp1iWXY89a9GsposVzbeR5M7YWYtw5UU7dXTntJr/kTD/q/TblxIN7nM9ul7otJsL/sJDaQmt8P0ROw4LwH2NONNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swoa7TtnQh1oYll93E6WvF7ZDpPAh3hPcZglN2Rofkc=;
 b=J322X+tmq4GmLTKo4OHTdteRUXlNYx+oP0c1czvLEd3ZoCGCUvC3RBp30Rckark9i/IkAmZRpDn23ZvVFJPA4S7NfMBJhW5Zy/oBn5QWTMOdyUkuIZMlyKHLyo12EvnnDitdfQXE0zvuGPb03oHNUR5Gtc9pfxlZBrpbGh7K927U07312wNo4Nq+owyZpSqWyheSNFxJwkkb/NesKsyiwU1FpcsNubhxi2tzZrKYOdOYOP+2sKMgA0FkhNWf14b1Pi4QDNrLX1nIcEJuICZxmbLmH1fpZUg8Fs30m+GXM9Zn14bcs3WWHvbYpxt0+fYeAklnxSPprPZ+QjF4wL703g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swoa7TtnQh1oYll93E6WvF7ZDpPAh3hPcZglN2Rofkc=;
 b=CZQCbfeqy29cIfZRY2/cd04Z8jw1hfdvFfOhoOBCGr0fPPQyOyU2QdH/uJMRZ1OFtz0EFuCcFwJFZwlixe323phpjnWMp546gHPTV5r+yis+3Ia0oT7zDIc/6rCWXxhh7orRmIq+ytRdJlntVWj7UFOofMxwqpZlQsf0EwLcSNM=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by SN6PR04MB4334.namprd04.prod.outlook.com (2603:10b6:805:2f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 01:03:42 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0%4]) with mapi id 15.20.5144.029; Wed, 13 Apr 2022
 01:03:42 +0000
To: "mcgrof@kernel.org" <mcgrof@kernel.org>
Thread-Topic: [PATCH 2/3] libf2fs: add support to report zone size
Thread-Index: AQHYTmBb2LIelwd/ukG+tQdMvewZSKzsMOIAgABFxwCAAJE3gA==
Date: Wed, 13 Apr 2022 01:03:42 +0000
Message-ID: <ab15014c9830233fca43ba9a187d560d62e1bb57.camel@wdc.com>
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31@eucas1p1.samsung.com>
 <20220412112745.44108-3-p.raghav@samsung.com>
 <aa4133c915f61811b40cd11a738bdb18859fe3c0.camel@wdc.com>
 <YlWnnJEw1ifCkU/k@bombadil.infradead.org>
In-Reply-To: <YlWnnJEw1ifCkU/k@bombadil.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9bcfdab-2782-4736-845d-08da1ce97423
x-ms-traffictypediagnostic: SN6PR04MB4334:EE_
x-microsoft-antispam-prvs: <SN6PR04MB433412657B3994C4C713A282E7EC9@SN6PR04MB4334.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FE8xrjdttumseRwkITFQVe8ZYGFUvyNiG3Np/Si0oRqfa09Nkb5IUVRnsYF39zkqO0Nzg0qaaDml65VhecA1QMqCNPk8Xln+UrdT2tCOXSm03tzCppbNSHGChv/vNBTkXZ8ayFhjRqADGYmb+qCnQaJOiQ6N7smSS5djYT/VWtDvN/MGLfJ2rAY2T9ldZJVLcaqpPo4EPZ+DTYs49SEQIU5MdxXbthui0oqWFXQM7uY+fBwykqfZjXUlT10higCvj3B3f3s7X5ySthZqvFRr5wx9L7zgMKbiXxy/hKGiNBr59EvSPQOkMSpcmJHyMzqZZyd6bQjVwwzywD61hHKSpZxH+1RymrG6kMKuFFzMTpylxVpgLUsahG+GHU7OaqCAUkTuXvJeFDeLMM6gY91ZHvrvJ8ZANZv89F6c/XAq6OJk9zq9jr+KZ4NhP0I7TUfzgdn03evRA1d1ikUyf1mkS45UsX02Ni+xJa5fShHiKWs24PaV5eoUf5xXbk6LJ7rgvyokhweMQSKabSTZ0kJkOCOUfFwxlTeJ8dFtdbzb1BdkdR6GLlQeyARm2/1oYs5xVweG/VrKzF45fMBr1gkKVIp3IR2JDe2VlSWdOvzE9Xzx6uXJIuAzXPf7Cxrf3+pJZ4KbpKDf28WEJUlat3VDcFuuX3nioZm+9og1oxvJ69YhssRkJ2bZHk3ry3KXfQgOfnPHTlqRJsBTkRTXWH5FEtTcXYfSTok9OZSaBGuxTkPsqsDx14elgmkLhz9Xea7VFjKZ6EFK5WG08Qj590s5SfWNmiWXHgv/Yw9gZtsr4X8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(86362001)(4326008)(91956017)(66476007)(66446008)(64756008)(5660300002)(66946007)(2616005)(66556008)(8936002)(122000001)(82960400001)(8676002)(38100700002)(6506007)(38070700005)(2906002)(186003)(6512007)(71200400001)(54906003)(6916009)(966005)(316002)(6486002)(508600001)(36756003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTVhSnd5UWNjV2hXWjByODFNaDZwUmR4aWdISGJpQzA0eExoZ2hMT1plQkRV?=
 =?utf-8?B?OGpkRmFzZVRVa0VQZjAxeW0zTC9YYVEvTEtDOUtyUkVNRE1OVVdCRXdEZ3R6?=
 =?utf-8?B?QVlIaS9QQWM2RW5KcmgzeE9reDJUa2F0R1ZSV2FZT3NYcGRZRDlCaURwaWlx?=
 =?utf-8?B?NStjSWFBMlYva0ZxdWczOUVwdE1xdy9lenRWRHFqQkNjMWtEdWtock5id2t4?=
 =?utf-8?B?dnFiaENXQ0Vlbm91eVFqSmE0N2ZDcEpFVkF1Mmh2VkhBZUF6b0JCbnc0QXFH?=
 =?utf-8?B?dWU0WnQ3aklPWEdIL2Q0T3Q2cXFkVjhvL3kvdTFteHRtSTN5azk0MllsMy9R?=
 =?utf-8?B?eUVST3dEYlBKcjFhQ0JacFR1Uy9BWm4xTzlrTVdmUE1tUnV3UVdnRDZZMDYr?=
 =?utf-8?B?ZnQ0K1pSWUh0TDR5TzAvUi9FNGh3L2plSlJzWEpxVVpuV3BmcTZHdHZES0tP?=
 =?utf-8?B?R3dJOTFJblpKVTdqWGZZazAydW1YZ1QwbEVTbDlwZXprZXBEUFNsVklUWVVO?=
 =?utf-8?B?ZjlWTTluN25MKzNFdThTNitub1B3a3REMkc0UDNRTmw0dFFwQ2M2RGU5MDky?=
 =?utf-8?B?cytrUGRIMW9na1hnVG44Sjg2SUVYb1dxME04Z1I1N2tTMUFQWWdxUUJqcUpL?=
 =?utf-8?B?SWpwQ2FlNzlDY29EWUFON01PajhOS0NLQ2VxZklaaWpXSkUvNFJpY3E1TnVw?=
 =?utf-8?B?ZDJPMEFFSG9BNHhBdTNZU0FVWXdnc0IybCtRckoyY2FualRFNXJiQUdMV3Jn?=
 =?utf-8?B?YXpSWFJyaDNKZWdpWlhEYzcyb0dGM3Jwa3lwbXRQei9IbGhablNTNy81bGd4?=
 =?utf-8?B?b2pXMkJ3ZXRCbk1oZzkrNm8zQXpFbk1yQ0lwTjdIek9CeEc0bEZTcms4S1hk?=
 =?utf-8?B?SUx4NUp0ai9hczlSNW1JcXNvOGZGZXhVZ2lCUGJoM0NkbHdtNFlUMG1oUnNN?=
 =?utf-8?B?TVNHYTJJMzFqdHZxelB5WHZmMkk1VUw5YnFZOTZ6U1Z3YkhiY0dOMnZWcUFr?=
 =?utf-8?B?VnR5QS91WDVhUlVLS241VEtlSHQ2aDFST2lsWXJZZEhNRU13aWpaTHp5OHkv?=
 =?utf-8?B?em16a1VkbnBzbk5jWVBKdStzeVJqMlRsdURsVE5mYjBzOWtIclowM1ppOU45?=
 =?utf-8?B?c3FJZlQvS2ZrUEpCa1Bhc1dOVDd2ellXU25xL1dySXFsUi9Iakc0M0VlSVpE?=
 =?utf-8?B?NGw0dlQxQVorYTZrNkpNRDYxSkFISkpUVk1pbFp4bFdlQ0F6TjRkdkFYYm1Z?=
 =?utf-8?B?R3k2a09LRTJuL1p4azlPTkYyOUROM2lYSzlWMFMya3paYm0xclJYOUxaQ0pn?=
 =?utf-8?B?TkFlZzJpaDJndjlDcG1rejlmeSsyc2dEZllCNGlzbVlzTnFVTWhSWjdaZFht?=
 =?utf-8?B?UVdTbmNjb1BKcUtDYzg3TXEwSFhpQklpMVpwb0lFUm1rT3h0QTk1QUVlNWF3?=
 =?utf-8?B?Q3p2WnNLeUdSMTdXWHFSWTJOOGtMU3RhMFpXTVJISFI1WGMxL3lhZjRZd2px?=
 =?utf-8?B?NGdrY29COVFCSmZ5eERiY2tNVDloUWNIeklyQVFaNThndG1oSUdKby9pMm12?=
 =?utf-8?B?eWlPdytFY1R1T1JYSkVDQmIvTWFsVXZ2QmRldmdaVHgxMkk5QXpFeDhTb0Qy?=
 =?utf-8?B?RUhyNWJ1a0hLOWdqb0RoRTl2Y1A0Z1lueEV4bUxBS0Qvc0xld2lrckc2dlFQ?=
 =?utf-8?B?OUR1WXAyK2JSc0dlYkxzVVEwTmh3ekFOV2RZUlR1eThyK2dnT1h3R2ZDcUNX?=
 =?utf-8?B?RXozUzZFVjFFZ2VFU2x6RFN6YXJjTFJBeGtwY0lEWDlvQWFGSXV0eXREYVJr?=
 =?utf-8?B?MWFpamdPMGM0bUFhMUtMVCtLUldxMjJvb3crY1VCNStDRGFZZ0tCU2tWd1ln?=
 =?utf-8?B?WlNFckRRV3J1V2l0RnZPeUVNaUFRY0JZOE50ZVc2eHFHUkJFbW0vWENrUWdW?=
 =?utf-8?B?cW5MNFZ4ZlY1cFIrc2ZDdU1lYitIR0s2T3ptYjloRFRBRzIyNzRROS9DNlBh?=
 =?utf-8?B?NlNUcVZGcUhwUnBDL05nNEZnUWsra3AvbG01M0FFRU40MVFaOEozUWNqcFZa?=
 =?utf-8?B?QWdaYm8yOEo5T1N2V0Z3S2JPeXFrUFpuUVMrNnFDWUd1YmxJVVZzQUVkKzY1?=
 =?utf-8?B?YUxzaHFmOFN4VHo2M0xYNlJINXRYSUgxZW15SjdBZHJENTB4NXlvQk9oeG00?=
 =?utf-8?B?MUpWNmx4TjNlVWtrMzNTcGdLcysxWWIzUkY4aVZCMGc4MUZiZVhDMExuUjBr?=
 =?utf-8?B?V1FyTWhmV0ZrM2t0VldDemZZdjFRYnE4dHZ1WmZkeWR5R1IvcWprVndUVzNw?=
 =?utf-8?B?U3dDK1NqQTFpeVdnenFVamh4ZjJYNDNpZXpRN1lqUVUxQ0oySU1mb1FGU0py?=
 =?utf-8?Q?K+OXSKEEHgF9QR7A=3D?=
Content-ID: <52D8B11AEDADE445A9ACA564AEDEFEA2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bcfdab-2782-4736-845d-08da1ce97423
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 01:03:42.7320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krwmG5cydKfch/3PA0K7Y6of0wlylBLwreYDSIfMGesTDaGB+8e0m7Rg/1pPQxVG9DV85vt1lEXE5PCeBj3u2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4334
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2022-04-12 at 09:23 -0700, Luis Chamberlain wrote:
 > On Tue, Apr 12, 2022 at 12:14:13PM +0000, Damien Le Moal wrote: > > On
 Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote: > > > From: Lui [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.143.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [68.232.143.124 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1neRfF-00EiX0-3t
Subject: Re: [f2fs-dev] [PATCH 2/3] libf2fs: add support to report zone size
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
Cc: "p.raghav@samsung.com" <p.raghav@samsung.com>,
 "javier.gonz@samsung.com" <javier.gonz@samsung.com>,
 "pankydev8@gmail.com" <pankydev8@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2022-04-12 at 09:23 -0700, Luis Chamberlain wrote:
> On Tue, Apr 12, 2022 at 12:14:13PM +0000, Damien Le Moal wrote:
> > On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote:
> > > From: Luis Chamberlain <mcgrof@kernel.org>
> > > 
> > > Expand get_device_info() to report the zone size.
> > > This is now important give power of 2 zone sizees (PO2)
> > 
> > s/give/given that
> > s/sizees/size
> > 
> > > can exist, and so can non power of 2 zones sizes (NPO2),
> > 
> > No they cannot, not yet in Linux.
> 
> They *do* exist in the real world, and in Linux they do come up when
> users are manually removing the current po2 requirement on Linux
> sources [0].
> 
> So how about:
> 
> This is now important give power of 2 zone sizees (PO2)
> do exist and some users are manually forcing to enable these
> on Linux [0].

Please fix the grammar and typos as mentioned above.

> 
> [0] https://lkml.kernel.org/r/CAJjM=8Cap1bwu8cp-mRTsiBmbHH=Ed8pp9vdAsig2o_ZiHTc-g@mail.gmail.com

This link does not work: lore says "not found"

> 
> > Overall, I really do not see the point of this patch.
> 
> It makes the subsequent patch easier to read and also makes
> the displaying zone support separate easier to review. It can
> certainly be merged, but I don't think it makes the last patch
> as easier to read. It's subjective and up to the maintainer.

In my opinion, a single patch that adds power of 2 check right after
chunk_sectors is read would be a lot simpler and easier to understand.

> 
>   Luis

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
