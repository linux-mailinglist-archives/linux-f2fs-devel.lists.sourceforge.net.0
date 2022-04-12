Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C56AC4FDF4B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 14:14:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neFPh-0007NE-N5; Tue, 12 Apr 2022 12:14:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <prvs=0949cad19=Damien.LeMoal@wdc.com>)
 id 1neFPg-0007Mv-05
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8iNZ3FsiCYQ5OGgbWQgFuvSwZwJR3eZ/zw7BUvjCoEs=; b=EO0o8+G7hu7K5GFHGF10jF4HDR
 8m6jUCojMXA2/euQdEdtm7fDF2V5xnh6nqve+eUpAH/1ZVdUrNDBpMXhi79M38DOfZfh0zQsJbiUy
 aPAG/ypaRXOSmX0i0jfEYi0ozKc6dUp2x3857qghYUeTHeiCEjY1qnE2TnEB4K5OBF80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8iNZ3FsiCYQ5OGgbWQgFuvSwZwJR3eZ/zw7BUvjCoEs=; b=SWQc6uVuJw/WWqRN8IWPEuohsL
 QnRN1IRdb0ZEsEIXJ2tYHwW9K57ZZwAFInDZsy/S6v+vqwXepA3tNi5cyG8tHA4fTClxfJFAoaxN3
 yFitJTyM1dW6Ms9FXRVqdq4lgyHGYAkBoohSEC2Pcb5hqHQu1x94oc1Xo3qKHPzT8Jck=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neFPZ-00E0T1-UK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 12:14:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649765661; x=1681301661;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8iNZ3FsiCYQ5OGgbWQgFuvSwZwJR3eZ/zw7BUvjCoEs=;
 b=el/4Muhu/nx+vsG2ORbG2wg8zoQXcqXGII3JOVgjwfq/j72D5UU1xl39
 4lI0bMUAwPbYR77C4WbUHEYHGwTtpv7uuPIaM7QjIYcflb71smc8ADsGR
 CIdl83u//mfWgxrLCt1OxxDn9W28Z1HMgpzIq/v2Yk45BuwFrSkP/vVVA
 erPix82LlDwIa0Zh0clbmSapOJrNaXHCezRVec6tjyJSTN3caX8H7ZeWJ
 C6sgiLOn4yjcCrse2P9PZzuMeJbdGj/MCeH6e4ZFUsfHTRdSBpiz1MQUQ
 Z7Nv9/8UIw7cUi48u8hvha92h/jcH+Fv1QY8o/da3uRSJ0btpKI9Joh7C A==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643644800"; d="scan'208";a="202578290"
Received: from mail-mw2nam08lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2022 20:14:15 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knnWRXwoglNL4dx8vuHjrS+sbuXH9dM/z4zrmRVNptDi7keWBSd/r2Kb6FqONBRcahKPOehDkz/lV8o/lMGN8O50Jfnn1LIwveXm5Bk/W0FeGAL0y736EKtvepsW962y6ugk0BY54f+iB7ZxjkEveHwSM4+iBwoCib58fxyCspMmAtIFkLokH4L6CwWpx7y241GRIBhE9V1IXa6nJxY1Nnh5j1nfc2GgUV2TB5jqyjxdl/xps137EbQcMhKqC6Qdm383eENQKMipopDrtcnIEuK1h6zm6kIFxak2CwfvMaYQVZ1W3RiuAtDap5TDsgKQpW91ZwjzqNrnKooz8eDI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iNZ3FsiCYQ5OGgbWQgFuvSwZwJR3eZ/zw7BUvjCoEs=;
 b=YhAoqXH7NNb69g5rL7JY64xLa2VPrn3TQSKJWkBjrikjpX+973FuZq8YCWIRJSIjuhiKkeeUCY2k79o6eQmt4nqvGUpUK64xZgjAafzoBgiJCU3YcE1g642Ja1iEdV+AapRb8I7L78yUbA3bx0gloHE6q5Feheoxq07557d4ev++88kUy6MpEPFBJXHJK2EFxKupP/x43KOu0YZdmQ6sRha0k8QSYV9FtFQI1cgpiDBBLseLNqYgQUN3vWk7Vl5F7/eJzrv8L+6/VObM/5d1RAz43hfEaiWfpmhgdtz9ROZpftV8webrcSNdiRo+sFPBrXc0poKIrjCMAV1EVjCANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iNZ3FsiCYQ5OGgbWQgFuvSwZwJR3eZ/zw7BUvjCoEs=;
 b=JKveIzvuUAMfG5wpZE+yqC4ZmgWz/4JC0Q+lF2/JsY0EZqMXkada7WCKdVK5nTm3aK7IlPjAQwMRCBvvPuZWMIVW99nE8uw5UPfkx17OQ6E51odJTR6WAKS1RCZJ1ituLr/RWBtCEl9qMlDVfTqz6z4YrAu3PuWd0CiYLxMpvdE=
Received: from DM6PR04MB7081.namprd04.prod.outlook.com (2603:10b6:5:244::21)
 by BYAPR04MB5894.namprd04.prod.outlook.com (2603:10b6:a03:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 12:14:14 +0000
Received: from DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0]) by DM6PR04MB7081.namprd04.prod.outlook.com
 ([fe80::4b6:fefc:2474:bdd0%4]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 12:14:14 +0000
To: "p.raghav@samsung.com" <p.raghav@samsung.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [PATCH 2/3] libf2fs: add support to report zone size
Thread-Index: AQHYTmBb2LIelwd/ukG+tQdMvewZSKzsMOIA
Date: Tue, 12 Apr 2022 12:14:13 +0000
Message-ID: <aa4133c915f61811b40cd11a738bdb18859fe3c0.camel@wdc.com>
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31@eucas1p1.samsung.com>
 <20220412112745.44108-3-p.raghav@samsung.com>
In-Reply-To: <20220412112745.44108-3-p.raghav@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.4 (3.42.4-2.fc35) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5656d41b-fa96-4b17-70fd-08da1c7df568
x-ms-traffictypediagnostic: BYAPR04MB5894:EE_
x-microsoft-antispam-prvs: <BYAPR04MB58947B076BC1F1B99D5B7842E7ED9@BYAPR04MB5894.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VbMGhtcED9RA2xydqZBC+XE0MviOJd/cX6O+ezZHVPZcd2ToUHioF5i1B9FbOEWzU7lBpMDmg/lkI1khajo4VU5+P/gyG8nuloIsvNNrn4RE8rXNu5VpXx9XPLPOzSBfCpzUj6Xyo1ZHunuNSvryT932Qj3PRMLboTHDNAIJidBMZasZeMMOgV6zwvkp2OVUuk2FPbiYc3EN9QF/o9DoAsJXIj4dJhsZ7sX/FXCuULpc8xYxNp4dtJHpEMviiKXt1yqZUYK5jERutXNAICEZ9FifVx0qvvM5ulSXzvOIWALm8Amea6FXOBu40/hZSD51hico/H78ykcyGhAZNfcwMTQ78G2tUynVfKUYQeSGF19HUmTcCON9bjTFVCc8ALYvGDgbYm+w00eu1TxS5pnKBI03/L1zhF0cef1ZTbYzwSDCsomQrWVYEtnpJmFet3Nd8NkIV30Gtj9OrKl3K0gL7N4NuNoyd0krZjrTEgC45esnzOexorCTd9eZea+4W5RsmKTMLDo3DPrStjDAhHsE94CPc3y05JYNPCWdMMKcS2Oxwpp3KFYtAKU6sjf89YCjq4P1XfWF2DvrO7r7i/2knwlcPaEuowZDcWXxZzOGOEzWlBWBgfnIL2JlPizXBwWPw+l3DXwB/KOMeaK2lCW7U+y8muwgyQ3voPtfm6q4Z68DSZvePwjhqII/bVyMphiqRpzZiJNVmUAGWiZ8vLVfuw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB7081.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(71200400001)(5660300002)(316002)(38100700002)(86362001)(6486002)(91956017)(110136005)(54906003)(8676002)(186003)(26005)(4326008)(76116006)(66476007)(66446008)(66556008)(66946007)(6506007)(64756008)(36756003)(82960400001)(6512007)(122000001)(2906002)(508600001)(83380400001)(2616005)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2RlbFQraDNwNlVucmpWblJZV0Mxb2VlUDVaVy9kNHNlU0lXMjNUWW9hRVJk?=
 =?utf-8?B?eEo4MXBIelgyNnY4TENsZjlrNVoxQ3ZBbUlTWHlTbXRLRVFpOXdkVGxoUmx0?=
 =?utf-8?B?Z0lVam9iUDFkdjVTZ2N6T2hMMStXRkU4YUYvWmYrZHJub3UxKzlWL09Edm93?=
 =?utf-8?B?NnhSU01lMzhwSFFheWwzUy9ZdE5NTE5CNEMrTnBPK1F5d3djQTRLanYzdEdU?=
 =?utf-8?B?U1RMV2krSmYyNXVKYmRDMTlOR054em9mU2pEdlVsN0c2OVFyMEJTSzNlK0c3?=
 =?utf-8?B?dlZHblhUN01HN285TlJ0TXY1SmJXakxuU1FrODJDUVZkTDFVSEtwRk05ZHFq?=
 =?utf-8?B?RlhWU3p6dWFnNmlrVlBkaVh6OTYxL2I2VEZqajVVWFVKSzFHV1QxM0kzUWFJ?=
 =?utf-8?B?Y2xqT3FoU3pjeXZMQ1JtV1RWQ0lsN3orRzVzMjMrM0ZrWDMxeFZ0dFQwRTZQ?=
 =?utf-8?B?RDluYzNQVldzeFMvQUF1bzhUUWxjTEwvaUh1dk5hQ1ZONm1OOHVwcEtuYXlL?=
 =?utf-8?B?aHpJL2d5cEtqUDlWbDl1K0xXdnFlZEQydXJYdEhjaFh4ck9XZW9HL0hITGY4?=
 =?utf-8?B?Q3lWNTJTZGhjZGRaVU5HSHpJcVhNL01MOVZ0UDZER2l1SVdVTmNvTTZzZUMx?=
 =?utf-8?B?SHJOT0hVdUluWitJbkZaSFRHcTlFcE9PeEJ4VkxibXErRTVHaVJDbUE3MDVq?=
 =?utf-8?B?VHlydk9Sb01LMU1LWjdqRmZjNFpSbDdRZmdiRUxWdk9mVnRwcENNdXlIcSs4?=
 =?utf-8?B?WSt5MHpucGx0c0dOUnVTOUxoaGp3TTNtdlVFL3FCTDUzVi9tc201aVFuMmZx?=
 =?utf-8?B?dTZYcmduVDFOUWVROVBCWm1UVEY4ZjlDeWxob0J3VWtPNjJkdWNKNkNxNW1P?=
 =?utf-8?B?dTFVNXUzdS9LaW9xeUc2NFJGcEdXUVh4Q2FodmgxQ2Z2VHhVaXd0RWVjOEJ5?=
 =?utf-8?B?endtcDFiZUdQTUJRSFZZbFYya2YzMjZEd05vZnNDWC9wUjBRSk5rSEx6bW52?=
 =?utf-8?B?aHdEdW9jdC9tMEkzN1l0aThuSzJaMVZMOTdVSEtMT3dGeG44NDJmOWJHUFRm?=
 =?utf-8?B?dm1CTUZ4bzgyTTBBOEd3QW1tTXhpVnh4WStpMWdKcVVxOUkxN3VoVHI5OTRm?=
 =?utf-8?B?eUtzZDhMRVd1OXBIOUV2N2tVQmJ2MWJOWmxTNWJ6eFJjRkFCSURxVlBWSnEw?=
 =?utf-8?B?OHFkZTRQZDZBdDdBcmsyaEthSXJONlU3UWhYTTQzRkZ2UE45QndUdFBoWkgw?=
 =?utf-8?B?SXg4dUFpR3pyREtWc3AzeXJ3eFVJQ3RycXNUbXM5ZW9MeGU2MWV1a3RZODhS?=
 =?utf-8?B?SFV0Q1B2MGlmZ3NlUFgyV0E0YjdDZVdHOUFUeEROT1pVdjdqOXBXZitNS1Fr?=
 =?utf-8?B?TUNySlJIM0YxWmk1c2dyaTNEUG1TQ2dzMmdiRzRUOWI2WDNoNFZSdjdhYW1p?=
 =?utf-8?B?ellpSmExNnh5akZGZzBVSGR2elZDNTN1bEdnWUxJaHIzSnZFY3VtRjJtT2hL?=
 =?utf-8?B?K0hTOUJOUkorM2JBQkFTUHpKcHdKOE9OK3BUTlM3STdmYnVHanBFQjRvT1Bh?=
 =?utf-8?B?Q2tNaTdTQVk0Wk44MWF1QXgyQld0Wi9vM01pVjBzS1AvL08wWS9pS2diT0tx?=
 =?utf-8?B?b2ViZXZiL0FOYXhYYnRxL0U4UWpZaGxrL3VFc1FHRldFSk0zWnFZOU56aFky?=
 =?utf-8?B?eFRDKzg0RHZGZGpZNC8rVkVWQWJQZWtoVG5acGVtVXVKamsxREtDc0pkVkFr?=
 =?utf-8?B?aFdHa2svR1Q2b3FtdmRaZllPcEYrRGNWSlpoNTJMQlJObEtTQjJwdWc1b21z?=
 =?utf-8?B?LzhCWGhoTExGU3FvUit5VCsxbVpXUm5tVTJWNWZ6UHRQRmwzOHpJaFUvdUVW?=
 =?utf-8?B?cENuUlBGZExGeWNhMWFteTgvWTZLYU9mVWpWUytCVDg4d0gvZGRtSTdvMWlz?=
 =?utf-8?B?eDBZcUJpdW9wcjZOWFJuUHFXeEhFOEhaaTN5OFZObHYvejdrWmYyTFYvQWhm?=
 =?utf-8?B?Vm03djBsZHQyUkRGb1dPS0hLWUNRdTk2OHlzZTM4ZXJ2N1E2ZDEycHNjTThS?=
 =?utf-8?B?SjViQkdHc2FkeS9ibS9lMWRkWmVzQXY1RVdhVWhwVnVpVVF0dnNpRE9PNFQw?=
 =?utf-8?B?cE9Mck5semxWRlVJN1lCWThOWnJtdjErYXN6V2RuSlBMUFlyS21uT0dUMmJz?=
 =?utf-8?B?RHA5YVl2dzIzYUVibGZHRGFoSlkzVDc1ZjdXQmpTSzFoaHUxbUpTa09kL0RC?=
 =?utf-8?B?N2NVQWVLVVF5eXFTRnRLYXFxOElERG9uNjE0TmZ2eUdlVnpyck1wZ3JOSzNB?=
 =?utf-8?B?RlF5NDEycTc5V3JubFFyRnFvL3ZZc09la0ZVNDlHdEJsd09PMFRvc05aM1ZD?=
 =?utf-8?Q?iuJ3C+t2m3w91DeQ=3D?=
Content-ID: <B4A9342171868540A6720FA693BE929D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB7081.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5656d41b-fa96-4b17-70fd-08da1c7df568
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 12:14:13.9317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +3I/8no9GtWC6U3YvYev9/imrykSlo/kuNgZk6M97P784cQa0VKhfTq7GBBwiRSfKSjMCo46qTz7aniP/RLhsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5894
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote: >
 From: Luis Chamberlain <mcgrof@kernel.org> > > Expand get_device_info() to
 report the zone size. > This is now important give power of 2 zone [...] 
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
X-Headers-End: 1neFPZ-00E0T1-UK
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
Cc: "javier.gonz@samsung.com" <javier.gonz@samsung.com>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "pankydev8@gmail.com" <pankydev8@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2022-04-12 at 13:27 +0200, Pankaj Raghav wrote:
> From: Luis Chamberlain <mcgrof@kernel.org>
> 
> Expand get_device_info() to report the zone size.
> This is now important give power of 2 zone sizees (PO2)

s/give/given that
s/sizees/size

> can exist, and so can non power of 2 zones sizes (NPO2),

No they cannot, not yet in Linux.

> and we should be aware of the differences in terms of
> support.
> 
> This will be used more in subsequent patch.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
> ---
>  include/f2fs_fs.h   | 1 +
>  lib/libf2fs.c       | 5 +++--
>  lib/libf2fs_zoned.c | 5 +++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index d236437..83c5b33 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -386,6 +386,7 @@ struct device_info {
>  	u_int32_t nr_zones;
>  	u_int32_t nr_rnd_zones;
>  	size_t zone_blocks;
> +	uint64_t zone_size;
>  	size_t *zone_cap_blocks;
>  };
>  
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 420dfda..8fad1d7 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -1055,8 +1055,9 @@ int get_device_info(int i)
>  		MSG(0, "Info: Host-%s zoned block device:\n",
>  				(dev->zoned_model == F2FS_ZONED_HA) ?
>  					"aware" : "managed");
> -		MSG(0, "      %u zones, %u randomly writeable zones\n",
> -				dev->nr_zones, dev->nr_rnd_zones);
> +		MSG(0, "      %u zones, %lu zone size: %u randomly writeable zones\n",

No unit mentioned for zone size in the message.

> +				dev->nr_zones, dev->zone_size,
> +				dev->nr_rnd_zones);
>  		MSG(0, "      %lu blocks per zone\n",
>  				dev->zone_blocks);
>  	}
> diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
> index 1447181..0acae88 100644
> --- a/lib/libf2fs_zoned.c
> +++ b/lib/libf2fs_zoned.c
> @@ -189,8 +189,9 @@ int f2fs_get_zone_blocks(int i)
>  	if (!sectors)
>  		return -1;
>  
> -	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - 9);
> -	sectors = (sectors << 9) / c.sector_size;
> +	dev->zone_size = sectors << SECTOR_SHIFT;
> +	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
> +	sectors = dev->zone_size / c.sector_size;
>  
>  	/*
>  	 * Total number of zones: there may

Overall, I really do not see the point of this patch.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
