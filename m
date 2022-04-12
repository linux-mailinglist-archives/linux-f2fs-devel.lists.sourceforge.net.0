Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BED254FE038
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 14:32:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neFhN-0003r1-AK; Tue, 12 Apr 2022 12:32:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=0949cad19=Damien.LeMoal@wdc.com>)
 id 1neFhL-0003ql-Dm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/4cHygxrWQ0P9hD5/aiwFZE1GsFd/bXLoV0h9h200rg=; b=RyJyPOwS7qnd44bRBY+KZI/2KY
 ZWLMc1wi6KrL0GpIkfaUnzHaPl4TGxbRvmKVdn9tzAe2zvv8SauRO1YxeHblisK8CSXqMeyHX4lc1
 lYzaSON3r7O9VFrvseYv4B36g3N13ant6GcLFATktecc1O8tXTThb36PUs2oC8fLrGLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/4cHygxrWQ0P9hD5/aiwFZE1GsFd/bXLoV0h9h200rg=; b=OKQlNnQkDaLeHp+mDUbKBmuu47
 ObpLXjRZu7dANxdGGhyPt/mM9x1LA2vDBln+wDwd0YgV/mCkla2lIlHFQWv132liDtgQLLGy1h9TA
 B46eqJwRl8nuftVJsCF+WkLUcr9GJr/fhtpjPhnU+htJWz36eTADg6TpbchujOBJIiRM=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neFhG-00E1bc-A2
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649766757; x=1681302757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/4cHygxrWQ0P9hD5/aiwFZE1GsFd/bXLoV0h9h200rg=;
 b=cpL1H2HBkMksnnITdqtYpXkToMzDPUP5MCsqTb1iVwPbWew6MoTRldc6
 hz+T77ShUCDrDmm0OC2/37erWTvdPrcFQnrLxYnuYxEqkfjDMg17nNjTM
 90ExhEDcNQes+1AEDnadEWhzQRXek9MwqUGAgiUp/ohWT7TLgzHFHl8Un
 3Mhx7/g1A3uAbQcm+tqSrJkKHEMkmnSXL7GXjaLh70Ipl1U/HYvgbge0b
 IYC0RxPeMGeMeW/gjUHO3pI58IcL6+qmXb1zYphvFbFWI6FhQkb6i7gG2
 LJ4lizHg1fiQW8/5+zizeqDG8Q+6MWbEap9YlaNA565C9GOXicGirbvPj Q==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643644800"; d="scan'208";a="309684892"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2022 20:17:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+d4zaPa0lQfxvjnvVAD0NpTG/qXZVwsJDbXD04tMpVzIpNh7r1pN3uEGj3PgYMo1q9inFwPd84VQqJNZHqAJgpx3FHKTEexfomXKQZyu8PnotBAgHnFpSICgiLlOCTn4a0hOrVGxVgHreHEpG0swKZDCtD8yChOwFSEN8kgnCZdnHNKcP3bKkaxG7p1uv6dykwU6hZXvRFqUKJMdQI2YYHU+Qvy02xcOTjJCexwA6/G0Hwj9QyG/N8xiLno+PdwQZq3as+8Fy1iyOy2yLryOpOYZYyO/CpTtS0XlbY5bN+P3j1E0DVLVHSOj9AyqKLE4nvAKcRODyRzH3i/82BsrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4cHygxrWQ0P9hD5/aiwFZE1GsFd/bXLoV0h9h200rg=;
 b=mfLWCM87MQaIJRf1uaLOuMJuOFZYObKaQIbv2M9fyk41LQ20y/PiQ3APC/MtqMvberqUs6foQVT5nLa6K+MiJ6hp5n+xXWoE8JglgTuFmvily2yvvsuynjJY7xpJe28kT9PUFm6p4v0JcsaeXqVbZwJJ6wcxME5cyINMBKrxFZR1s2YmoM+OfybwprYFX2RKgEtZfsamcednx0rdG2tZ3aaghaI1wpkx99VznMRf30zDRTMrYwawDIJ71mLM2iO7ldykT6PxvkTwh/BFEmCgryd/qif+IBQ1Qunc/+JbyGS6JBQuNKjuURzET7AI9Eil15FZpMHvqvKVpofPKg0UZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4cHygxrWQ0P9hD5/aiwFZE1GsFd/bXLoV0h9h200rg=;
 b=Gk4QulpBkvRG7HscjMtyQJZgWnGeiJzB5aA+4JOwtDWRsnu7lpksiDFXAyCouDAtKCSzcXA0oNTMQWPDBfeWEn+2KHRxK5z9yTiSBQfIbc1tAOhSmnkMeVwTt8k6C9JRwwRrvB3Lep7U+fRi5CjY7W3zks3BoRQ/hX6W8ZJPiV4=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by BN7PR04MB5331.namprd04.prod.outlook.com (2603:10b6:408:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 12:17:00 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0%4]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 12:17:00 +0000
To: "p.raghav@samsung.com" <p.raghav@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH 1/3] libf2fs_zoned: factor out helper to get chunk sectors
Thread-Index: AQHYTmBa/AV1ZB89N0SImJkKaXzRWqzsMamA
Date: Tue, 12 Apr 2022 12:17:00 +0000
Message-ID: <e399e7dcfba3a0f1c9fe8e09afdf7728fc311e37.camel@wdc.com>
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112747eucas1p11e2747339407a5c51a93e7b7060ab965@eucas1p1.samsung.com>
 <20220412112745.44108-2-p.raghav@samsung.com>
In-Reply-To: <20220412112745.44108-2-p.raghav@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52c272ba-7a25-401e-f29a-08da1c7e5893
x-ms-traffictypediagnostic: BN7PR04MB5331:EE_
x-microsoft-antispam-prvs: <BN7PR04MB5331C498A5C3248C192B5D0FE7ED9@BN7PR04MB5331.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjQD9Tz7ILtEt5c9yHVocIGHLDw6RX2IobjVwt5kEarrI6CANlvtMrK1WMI74QXdxk3kI5YPRefEMzkPLIb5T2QjR6Oi3qyBnU5imGH0JmZSrBiPcL/mw+MiJnJ8dNLMQZhSc3rA8gbQYJjrCmMWNRFt1avGg1Pwj3n5QApebVQOy8AJDtT5NcnrXDIsdyqh+jiIqaF/nQLwwhNtPCY/ItvJ7dzy5dgWJRG28I3Jvud28FpyC14v66yWw/6vELUE1iHImX66f+y9q5s0bu8IRntmxwEEAFHLrF9yDKfD8GeYN2vcq5xD99I92KljjXmFr+Q9hq9T/iXvyPfEZDw9mFWbp+fdpzVZAZb/f7hP/MtaRGWS3lxI8TR6nzPOZHUEQ0dyoTD3zfRBjkMzP8JODts/PPh+IBX6eL2JyFXsUaFoawobX/9dAUqwz9Qd+6dqNK/b4DxN22K9q07+VKTOvS90TSXGz/1PtmR5WKdVKLUbtIVlg8UFaCbs4uUwE9uWIaz0CZNHOe5derwW90WIyF2BKDc5TkAfDoI2kWWoAnmmtsKwMyC2xz++wAG0HPNJyZTa8/4sBNPccPnloVexorq0GTgB9Fw1Mh7qUHkFniTT2gFcxftm7aHbpxhBBFcX6IiAHaPWangHCO/D0vfxmS3TLn2DZL73POn2L7SUeriAXYzFG/vK3u9ccSxwaL3EQqzQB/DUEVADA9UKFwU4QQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(4326008)(2906002)(6486002)(82960400001)(36756003)(5660300002)(6512007)(186003)(26005)(83380400001)(316002)(38100700002)(8676002)(86362001)(66946007)(64756008)(2616005)(508600001)(122000001)(91956017)(66476007)(38070700005)(54906003)(66556008)(110136005)(76116006)(8936002)(71200400001)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0V1K3YxYWRsSU1sMUYxdEpJQk5TYVN3UmxjeDFtcDhubmtFcHVGajg4RGNm?=
 =?utf-8?B?a1R2dkl4UHBBQXc1TWhPcTRObVhsVnlRTnN5eDN0K1R6bVdIQzkzSE4wbmxw?=
 =?utf-8?B?L1AxbjZDS0M0Nm5NL1JjTitQbnNpL2FDeVl4WHRwNExId0Yrd1VlUnhIeHo1?=
 =?utf-8?B?MFlCc25tNm9hbWN6NFpYWmVlcnNySGNwV2Y1ck1pYjB3RTBPODIyRjRlbDFJ?=
 =?utf-8?B?cm0ycEJyMUx3dzhWRnphSkVJdTYxU3FoM01ieWo5VE5zSE5ZOXdRWXJzdUpw?=
 =?utf-8?B?RFZiTDFxYnZYMTV3UUE1ak1QUnZWb2w2cDRIa3Z0TlVKcTRLMWx3MmFhN3JD?=
 =?utf-8?B?UDhXcTFMTmNyYmZvRmF4WUpDR3hmYkNkZGcwQlRTbXJkNFFkemwxem01Vmhz?=
 =?utf-8?B?UGc5azhpOVUvUzNTNW5CVmhmVGJ4UHdVUVk4dG9xcFNpMDZReXBzOTlvbDU3?=
 =?utf-8?B?eFlkU3R6VE9WQk9CNHVycWJMa2dtYWY5dm9TcDFLSTdWbXdENFZuendpakhk?=
 =?utf-8?B?QUw2UktUN0ZrYU9UUG5yUVN6WU9wRXBxSGpSTHZiVjR6bnNpV3hvMkhOaEIv?=
 =?utf-8?B?ZXpGUkgvUkxtdWdneDl6ODV1YlNpVitIY0hMdm5UbDVrNE50SmdjcVJ4dy9O?=
 =?utf-8?B?WHNqLzhDVDBCK2VwcFJKK09wWEIyL2E0UjFiTVVGTUk2SkVZblRRWVRqMVBK?=
 =?utf-8?B?L2RnTHpUU0gvUm5peThCb1pEVnl4Z2VvM0Q1WWZ0c0luWEhKbStZSEJqRjNn?=
 =?utf-8?B?Y3dtbncwNFY0R2RBVTJmOTBNd1NZd25nVmN0bUtaYjRRWDRsQWJlMWsyUzU1?=
 =?utf-8?B?YThZMnVXSG15VEwxZ3F4dWlvOFk0NnhYR0dERmg3UTFzN1plRHFwc3pHRFVT?=
 =?utf-8?B?MlJWKzUrSitWY0pMK2I2akJXa1g0WGRzMk14aGNyRmJ6VUsycFFZbUlLblNt?=
 =?utf-8?B?UkNYSUpVeTBvN29ucFN6U1Y0K3JOWW5WbmVnZTdPd3MrWWg3eTBoNG11d0tD?=
 =?utf-8?B?QytVcWNCak9YczV3Mmp1MkZjdWY0MjUyN3Q3VnJGYzA5cTVXVllpM2xOc1ZN?=
 =?utf-8?B?a2piSVdEZkdHU2JCOTJUMWF2MFFjQzlCSkNHVmVjUE5Cb0xxMUdKWTE1UmFm?=
 =?utf-8?B?bk1MNGZTQ0FoTHFZWUROVW1NQzZMV1FZSkJlZWZXNTdnYnMwUEhPNGN5blh4?=
 =?utf-8?B?bS9LUERzYUZRdVp0RFdqYjZWdU1odU9LRE5GT1FiZFY1YkNGZXp1aXB1OTh5?=
 =?utf-8?B?ZDd0c011QkxxUlFSd0FrQXBJSE9hODJvSVpXN1FlcUU1OU8wRmZtNVphR1NW?=
 =?utf-8?B?WUVGTHRDZDdZNGFmeWdNZC9LYUhQN20vUDh0K2xuMVRXN0FBeEMzYVR5RVNs?=
 =?utf-8?B?dlFTdUVLS2ZEZWlmaDg0QWwzRWp3em9ldWVpaFNEVzhEZTVycHIySWQwZlpE?=
 =?utf-8?B?ZmtLVlB2TnZzZjlkY0E3NWxpa28xejZSZ0duWWcyY2JGRlQ0aG04eTdUQjJI?=
 =?utf-8?B?d1NKR0U3QW9sWXdTSmVGK3I2Y3Z2R0QyRFBMY3dydHJrRFViOElkNjM0aDVH?=
 =?utf-8?B?RkV6R1RIbksvb2UzU3FUS3N4STlGR0FLcHhNUzhTeEN5bXd1ZG1SNHhORmxy?=
 =?utf-8?B?ODl1aExHNFpXMFZ2WXcrOTJjdmozY0hBUXZXWE9WQzFKaEZjNmRiMmZRZzJQ?=
 =?utf-8?B?M1B0eVpwa0MxVWpRVUZMZHVHaGlYVUdaUE1UR2pmSCtERExHejdVTTJ4aHM5?=
 =?utf-8?B?OVpQdGtHbFhKWUNhUS9SL05OdndBcGxNK3pQNk9jTWVZUUFyeE1iTXZxVk5w?=
 =?utf-8?B?WUZwSkN0RTFKR0YvUTVYQStkZzlZbzYvaElDMUJ4SGFKRlEzYmRJcGgvVytw?=
 =?utf-8?B?SHRjWVRidzBjWHcxa2xwMktmTXkyMVJCUENqanNmVDVZdURjYUJKQVR2S0dZ?=
 =?utf-8?B?d3FJRXp4STN2d0ZWeE90Yk5DSWh5UDVIeVdzSzQzeEtqRjNhNlVaWGNHS2Nz?=
 =?utf-8?B?c0RpRnEzVVVIamVPQXc2QjJHbXhPUlNhS0ZSZ0N5MzZwNDkvUGt3WmdKK0Fv?=
 =?utf-8?B?OTR4ckdCM0xzSHJ3YlFxU1hlc1ZNU1JyR0k4NlNUUHYxRTY5Yk9vRWc4MEtO?=
 =?utf-8?B?ZkorU3FUZ1ZBTFg2WlFiWW1nclN1UzEyWUhCdWdvM3ZyY1RsTzVCWjdQNjFS?=
 =?utf-8?B?OEV2WnRFR0FBWTJoSHhrNEpLQTVkUGZQZ2QxVFYySVZiSmMwMGo0WVVwaXNn?=
 =?utf-8?B?cEpRM1BFbGVTVDd3N2x4ZUJIUU95ZldEL1BDSDQ3dUVuZWsxU0Z6OGVtVUZK?=
 =?utf-8?B?SWxpdWxYQXNkd0xKK0RDRUM1Q0V1MmIvNUNnNjJxMkx1MkExYlRWTi9TZU5X?=
 =?utf-8?Q?sp0xcv/0VgUn3DCA=3D?=
Content-ID: <24151C84FE11D7499440C2E6ADEBF2F4@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c272ba-7a25-401e-f29a-08da1c7e5893
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 12:17:00.2957 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ncFlEfN9CGMe1w77umFOdgVl4IC4Gs/478W7tofkSx5PAjoK6wzCLPnam0oPUdSA0ul4fyCrbZ64TZnMkf2YjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB5331
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote: >
 From: Luis Chamberlain <mcgrof@kernel.org> > > This moves the code which
 fetches
 the chunk_sectors into a helper. > Yes, this could in theory [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [68.232.141.245 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1neFhG-00E1bc-A2
Subject: Re: [f2fs-dev] [PATCH 1/3] libf2fs_zoned: factor out helper to get
 chunk sectors
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
> This moves the code which fetches the chunk_sectors into a helper.
> Yes, this could in theory be used by non-zoned devices but that's
> not the case yet, so no need to make this a generic routine.
> 
> This makes it clear what this is doing, and helps us make the
> subsequent changes easier to read.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Pankaj, since you are sending the patch, add your Signed-ff-by please.

> ---
>  lib/libf2fs_zoned.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index ce73b9a..1447181 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -146,35 +146,46 @@ int f2fs_get_zoned_model(int i)
>  	return 0;
>  }
>  
> -int f2fs_get_zone_blocks(int i)
> +uint64_t f2fs_get_zone_chunk_sectors(struct device_info *dev)

chunk_sectors is an unsigned int. Why the change to uint64_t ?

>  {
> -	struct device_info *dev = c.devices + i;
>  	uint64_t sectors;
>  	char str[PATH_MAX];
>  	FILE *file;
>  	int res;
>  
> -	/* Get zone size */
> -	dev->zone_blocks = 0;
> -
>  	res = get_sysfs_path(dev, "queue/chunk_sectors", str, sizeof(str));
>  	if (res != 0) {
>  		MSG(0, "\tError: Failed to get device sysfs attribute path\n");
> -		return -1;
> +		return 0;
>  	}
>  
>  	file = fopen(str, "r");
>  	if (!file)
> -		return -1;
> +		return 0;
>  
>  	memset(str, 0, sizeof(str));
>  	res = fscanf(file, "%s", str);
>  	fclose(file);
>  
>  	if (res != 1)
> -		return -1;
> +		return 0;
>  
>  	sectors = atol(str);
> +	if (!sectors)
> +		return 0;
> +
> +	return sectors;
> +}
> +
> +int f2fs_get_zone_blocks(int i)
> +{
> +	struct device_info *dev = c.devices + i;
> +	uint64_t sectors;
> +
> +	/* Get zone size */
> +	dev->zone_blocks = 0;
> +
> +	sectors = f2fs_get_zone_chunk_sectors(dev);
>  	if (!sectors)
>  		return -1;
>  

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
