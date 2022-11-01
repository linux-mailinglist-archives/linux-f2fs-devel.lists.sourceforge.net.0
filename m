Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D71A76144B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Nov 2022 07:38:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opkv6-0003By-Pa;
	Tue, 01 Nov 2022 06:38:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=297e88d02=shinichiro.kawasaki@wdc.com>)
 id 1opkv5-0003Br-CY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 06:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=obaIdZb8xiHToFjOlko97Z4g3Jit3M/3bpVioghlibU=; b=C4GaEzp528UsJRlpH5cSYxZQkX
 a4Ar9fvxSon9orw/AgQrVVIJWcXMDGTAeQb1CjE+nwWRMEUXJNBmoJmR72aHY8+Ka5CCsIjs38ehL
 H8iyRMaN0AembsyvuyXyZ9virWyquUDE7heoWe133fDEucgFfA5/v23Zv2KL+KBGdwyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=obaIdZb8xiHToFjOlko97Z4g3Jit3M/3bpVioghlibU=; b=WRQ23yznTF0hvx/ULHFe7lSCjG
 BRGiZ0LZKFIrcvl/pPHdb1ym0tgm7SGcJGXDJ4RVej4DA7p3tiZEYPwkP44mRck7Xwv4KuscwKfhA
 cNLH7ncFPJATAPHNffMQC1W1KQhRINAjltkrbMfAYVOGJIzdsJWsrPlmopZz/YR9a3t0=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1opkv1-007eNQ-GS for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 06:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1667284719; x=1698820719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dTVSX0+gBmQz4UlWzj5FxLOmPZci7GK9NFOfG8bxiSY=;
 b=nhhB4qIoe2CoxbgjVvCF4hX/kzDO/LnLvb1C9QxIkBMWcdfDDL0d7XMt
 F9LH3QAYgKzWfOzdobJmhgd6U7pswi55er91r5KNsOrZ2rz6kZhtiojGy
 F67hL1blsVbp9ePtEtN18NH0j2JYHw2aUBbMul/XC6rrKefU3ySlvnkhq
 UhdVFI8F6OMRJSQeQQ6Epvz124CX8OLMnyqoIEMz4hQqWIGU0lwz0rrZQ
 HH7r+C987blQzFesXTJ0NfkUFvodsmd6xKnGu8zbNDiKoU3OjwTP9X7MU
 nyDs8x4JJYzls1mWb2XUAct7MGwAjcJiqGdfVRJXHQFmWH7EQ6upNzMX9 A==;
X-IronPort-AV: E=Sophos;i="5.95,230,1661788800"; d="scan'208";a="215545680"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hgst.iphmx.com with ESMTP; 01 Nov 2022 14:38:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+9gUlMP70n+5ExV61AVkmwwmo+1BaNVrwLlqAgKoPPb7CIsKs8KczwjTOx/W/ZhVoTVUBeyeo/pOvgEJSwxuc6S/XBt0eTKxU7ErEp3ohFxaPCyfxIg5YVt3BQW2vR+2C4JsAv2hK6QBZz2uqIMZvOqQdpKWaEoxkJOAwZJDmVdiBjpC2BV6PKk7CPfpGUqS87+IsgNfy953zj3R2nkulnjfH+1LoznudoBWlvqVcGRMc8Qz84wY3swO+3pEBebIdLDemJ68zOubeng3Xuvbs93HDScsryIpejpP77DoLUT/yfADvhgiW4J0NMs2z5RW2P19DbZ0NO36cU/CB/+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obaIdZb8xiHToFjOlko97Z4g3Jit3M/3bpVioghlibU=;
 b=PacFnPxhU3m+S3CiKPhg+mAl4/5iDmznPthWyKFO9cCIza4fbkMPFFtxb/bs4TDGbkuBCnAYovVqjCCYDOIKTPSlwV1us+ZodMrODHhcka4o5K891QFpK8te8aL9UHgSi+FzO5qUYmGM5epvQRzdkp0sRQL6I9dJ5dNoY2EG+6lmgFEHsdYErteyWL1ggJFxJRjOU6MFQL0oDuOcrxB0KkMLACpcPhbQnTfTLAWE52DiAz+0tiV7jDxl1iX9kwVbKOoToywBq4S3q/VnTduadCx4jlu7gNHeS6BMzY9wzr2jEzoFuWS8ILjATuAEora4RZ08uQkJFEju1AGfGQdV8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obaIdZb8xiHToFjOlko97Z4g3Jit3M/3bpVioghlibU=;
 b=ouLeYupmWT6sfSBJEbHRz9hgxEmFE1nGBACEEooI87Ug6+z6Yf4exrqnCni75Y/qXhDmk18Lu3L/r8f3SM64KgPah1M27fpx1XtTMuwyWXDWxEsAMjCcn3n0du6sc8xVNs3heajtDyjgUeE1mfguznwzkt2lypDrRXYwSC1+oCk=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 CH2PR04MB6631.namprd04.prod.outlook.com (2603:10b6:610:9f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.21; Tue, 1 Nov 2022 06:38:30 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::d4b9:86e9:4fc8:d6e0]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::d4b9:86e9:4fc8:d6e0%7]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 06:38:30 +0000
To: Sijie Lan <sijielan@gmail.com>
Thread-Topic: [f2fs-dev] Mkfs.f2fs on null_blk device
Thread-Index: AQHY7byNaPuxWRRfpEKFMBQ9nvyuiA==
Date: Tue, 1 Nov 2022 06:38:30 +0000
Message-ID: <20221101063829.phzt6g35k55tygv4@shindev>
References: <CAGAHmYA=QPJZy-NCRFF_17y-3HLb4UxcXVRiw=6c-1N7Fa7kQQ@mail.gmail.com>
In-Reply-To: <CAGAHmYA=QPJZy-NCRFF_17y-3HLb4UxcXVRiw=6c-1N7Fa7kQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|CH2PR04MB6631:EE_
x-ms-office365-filtering-correlation-id: 97f891e7-7069-4965-d3d9-08dabbd3b0a4
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CcTcY6WA819aMbv71UC1prl5D9PvvQANkVJil+ZvT+arwruKH+3+UEdoXs8w4DAp3b2tvSEERtnJXU0qgGn+WTFhA6fZtN4UqQDKeEmMu5eR8lx0+YahnAlKZMQeJHRKM1cJkFodMQhFLJyYaLkZhOXO3e6oDImFmeB3bRd9xlktogow+0sbC82AaIMH4Liz9hcpN1TxYvTqFxncOuZ3dsxMEcUnvJRtxFGz3x8sG2UC0753zbRR8x4Zuj83Dd+ViGedHembffrCVqa4564MTjsuEzm8uaOWNXoeois0uKfTka7D3ppXAmfXSA8QAZk2M+tJl01EoIw1INxET9H7oQosAC7TnB/pRsFNRXs9yZG22iX1fzIpFIxuv7aJYX87DNzk27WJVv7bnFCEPKngK/PSEjaeHY5hE9hFN4UX4wTMnqNB8Bqxpq+cYVAjYsRNCsJXhYz42fqQ6EuVrqmJRHOj2Ar2vYXXLLrBXfUESlFJE4ysiO13wR63pfEmKlXlugq8/vS/a3stc02RLJTJ5AYnsINIChwqEzwCLGpzoBQ8XrvOPZut3fZ7fIS9oLd8m9RHIPwsH3RdlNPJ9L9i5qQOj8CUg+BE/zMQPVVwkcdjwG7WqwbL8N9fcEyV3brcUH7TEnfJ7ckZ+bDZWcoC1h9uV9uvphaybv531IoGksxNLETnPUQ1zLdyvQhObQ0nrabfoaJBfsl4Ve12xHi272BAqMlBYJ4YEXMQbvWbelJjwCQLzrJqQFsUYj0sWfKE88UP5brNaQ/lBteUAVL5PA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8037.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199015)(6916009)(38070700005)(54906003)(316002)(71200400001)(66476007)(66446008)(478600001)(6486002)(76116006)(66556008)(66946007)(91956017)(64756008)(8676002)(4326008)(6506007)(41300700001)(9686003)(6512007)(26005)(5660300002)(8936002)(44832011)(4744005)(186003)(1076003)(2906002)(83380400001)(86362001)(122000001)(82960400001)(38100700002)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V/NQXW7EsrW0h+rQ+ak3ZEUVCwwg9iK2QR82zfU9RHobWBoL3xXp28hLjfT+?=
 =?us-ascii?Q?1zncgbNcbDvCMgmHzawD1qvCiTmKwbd32uCoKIqt3qxl6LAwwaDRvCUPbhuj?=
 =?us-ascii?Q?qyQCmU9cjImRhGApeapK0qJ6MDtMmv248wxf0o16ufVbK5+eEhB4CSgkvWD7?=
 =?us-ascii?Q?SKLCZpskg0Nz3ukSDtq3/vwoesiNsOCEngjE2KukGhO9RTIG6agYR8XUPOt3?=
 =?us-ascii?Q?wqBGHQV1G77+3+Sl/SB/Y5JzuY8UXonnq6IzOnkA4RAt5XMmmPbq31j5dyxJ?=
 =?us-ascii?Q?YdyrOnC/eaH1479aId7RkgFcw1qS0eZrIjsBgW9Rw0MgmYWaVGIGQMwPoAej?=
 =?us-ascii?Q?F7sWHoIXNRxxTxIiuu6JZeWqx7TmRTMLIfep7CetJKwLAC2IwDfQxFnfkQQU?=
 =?us-ascii?Q?j8Wdep41Yndx/MqL+ocmkBWZmg0Det5ZEjGVMWOh/dYWBdenBh5siH7TaL+p?=
 =?us-ascii?Q?gAVjt88R/015AuJnP4iGwR/PjxzZt+ik3xFahIQ33Prv3YG0pmwPFu6kgwc6?=
 =?us-ascii?Q?bMTcihDKQ75CoJwMmEYECeD5K38rtwBp6Z3nm+Dpbuaml4uDpz/A7Lawoxv7?=
 =?us-ascii?Q?u5QRf5+9c1LEVekSsCWzbznUZ+Lh+XCx/jLgJ6PerzBQOEO6B477c6Aimh9Z?=
 =?us-ascii?Q?YF8y9LxmuvazwQfbs6fBSW7JRVlgnnnouaZURul4INDupH6nsBlUTWty+HbQ?=
 =?us-ascii?Q?V2cEmAUOiZ+RZXzCWz1QJ4YBpp6PUOSBJQ+kHZA4/M8KQfK49MKFoxkXeJAc?=
 =?us-ascii?Q?XA8nkHR/1ptYKH6Vf0m/RE5DCoROM9THkr1NyVII7L0Fui00YfP8ST5u+Qdq?=
 =?us-ascii?Q?3dzpCKJh0dKoPD+Abr9KZm33OZqGuG9xyKv5f+gtn02KYUX4j+fixJGknGQg?=
 =?us-ascii?Q?Qxr7plqDTUN/DMfngSWg5NbZsFscktIgduVTopfOw9kdMSRn9Ns1l5jhPejZ?=
 =?us-ascii?Q?9O/pNuuRDljdgj+RAvv7aR4Vid/IyfMH7qosy991LiMEF6fkwqFI7ud3/gJd?=
 =?us-ascii?Q?WitaD4vF22TxNlzW17085ue91+rZhICzNDzd/hOahVsl7Zpvt20BWAde5MHZ?=
 =?us-ascii?Q?/tQQeGHAfs1KhdzXN98WfzI4be1Y26Cz/jbw4D1Bfg/PEAueHU1m4i4SWHGM?=
 =?us-ascii?Q?3SNMsG1lt5QuXI4vltTxy151/E4/naBtIXnA2AwhGlaD00oQm6YY48LFuwex?=
 =?us-ascii?Q?ddPQ9UEZe5njs42pCTF3URPNZvcWSxqmQtcJUVmeOwx0L0wNSOMwLvkAs0+n?=
 =?us-ascii?Q?e1qOQ/dvyGGY+hktWxondjUNHOvZls+6tchxR8yQ1F44lNokPhyewS1uzuY7?=
 =?us-ascii?Q?Em5H7bAZn2yLqPbMGBkwvI+MjHsqx42Fhoob1hORcAoF2TRVw7wyrzxYtH+w?=
 =?us-ascii?Q?YMHuRzzRnNzwRl8py4xON/uJ3PLtsTrbtNWVAi2mmbOQn1HkFbkmHuHZRqUN?=
 =?us-ascii?Q?EdUBjOiRqZDcFLfrhZ4afHT4+nxkwzElmBWpv/Bj0Gx1JrsUQ6bHYKkDYX49?=
 =?us-ascii?Q?4LOYbpU2LapPqm7FhW6XF9eI8/XHJe6KEi42ICxgeKc5EISIzqLBEqjlvYC0?=
 =?us-ascii?Q?E0iYA7hmIjfugH8r8Ec1EItiCffhSSoo/DjW9tEDgIT4JBIADsxCsbQ6jpvn?=
 =?us-ascii?Q?ld9wZNuQDGjIGcFPZv/Zm+s=3D?=
Content-ID: <5F4E43451B291042A19BD254759EFEED@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f891e7-7069-4965-d3d9-08dabbd3b0a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2022 06:38:30.1964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkZUWo1RLB+nAvSK2dDbN1hZrU9I0NDFRNHDuOB0UgDH70XZMrBJ8sZsBMLhhDmJph4iQnkE9VGg3p18NteWTFIdyBGk/XtrEDfTY59qhjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6631
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Nov 01, 2022 / 00:09,
 Sijie Lan wrote: ... > Info: Host-managed
 zoned block device: > 20 zones, 2147483648 zone size(bytes), 10 randomly
 writeable zones 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.154.45 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1opkv1-007eNQ-GS
Subject: Re: [f2fs-dev] Mkfs.f2fs on null_blk device
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
From: Shinichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: "kernel-team@android.com" <kernel-team@android.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Nov 01, 2022 / 00:09, Sijie Lan wrote:

...

> Info: Host-managed zoned block device:
>       20 zones, 2147483648 zone size(bytes), 10 randomly writeable zones

When zone size is large comparing to device size, reserved area size tend to be
large and results in the failure. Can you try with smaller zone size, such as
128MB or 64MB?

-- 
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
