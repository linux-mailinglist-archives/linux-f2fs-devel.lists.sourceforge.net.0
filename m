Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE17224FD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jun 2023 13:56:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q68pP-0003Sl-1U;
	Mon, 05 Jun 2023 11:56:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=513e64772=Hans.Holmberg@wdc.com>)
 id 1q68pN-0003Sf-Tv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 11:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TMKr4I7x1OYAI2My8zrdlF/hz9E3OkTZsmwjQAZsH4s=; b=mb2/Oty6lWzwpDr8NbAXc5hPbR
 KXQ/KyoeWZpwh7GI1PtadgBOCu9Eu0IQLyBxECofsb5YlMItFjBaKVLPNywDkY2UPq5HP4Kr0p5Hb
 EELJ7Km1vYjIMMlHTqEZ/IgjvV4RjVNR3sK9Licw3MKMjI20rHAGWjP0bWsgpvSIl4uM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TMKr4I7x1OYAI2My8zrdlF/hz9E3OkTZsmwjQAZsH4s=; b=dxMLwtjHN5NZ7jwWiUnXDf8JRA
 9dXWrFWn4a1Kvm1gY+Kfhbumfi45WzfOLtSh2V38BoSHIqjTeeP3u76ZxkhDQty6eqJ7/0FGd/PxH
 CaT++Wyy5O16SD1PK7Zqz9J/Z6dn6yWJ+B7nV5nmqZTgYVZzdRvh9PPK3GEE5EEH43VE=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q68pN-00BmIa-55 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jun 2023 11:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1685966209; x=1717502209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0jgrboM1eIsHIx/jLvf1E7gDR03ifYA0Wdt8PUV77zo=;
 b=F/ngVWT9xE+/KmNicvpGMVJup7g37qvdna791+7qaDnlvTkJi9XhGGSp
 NpG92M82P27eQHQQtBigiosLAye7LJ2Ze1h8aNZG+pZcylOJ5hrq5mctg
 qNE0zaW310i7wHvdmgTpEE4jrjpiF5QeqslD7ekTsmE1pGzz1GVdeWlqI
 w0WAnpBzte6U2U2Utkcu5LZMbTP6oR/5Jc5jpXrDZJfREqQruvJi0doVH
 BDvQ3C1as0WOiPjMPL1jTkr+4Z9ynHGm5+k78bxwRzZUBUPtl/yX6SoA6
 vrce3NiwNqx5Hz7vK5tAfnZqxuvfRUaq6LKSoQcRpr9Ucxs6fryjugpic w==;
X-IronPort-AV: E=Sophos;i="6.00,217,1681142400"; d="scan'208";a="237455777"
Received: from mail-co1nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.177])
 by ob1.hgst.iphmx.com with ESMTP; 05 Jun 2023 19:56:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfNwICBE+OH6a42tyQTmQXt7PAk64bayFotfRjkF7TOeZATk4kobeb0Nmvy7RiwzPDa9+3MtWqGr8HljnDTrdsx2J1gI9wW/iYywQS1Kh256MiCoNM+Lj4843/ngnfEKMSKP+YvCDf4nGj6V77Qp3mbLSWmRwA7ZQp21ZrMNxA2uWnlA0Jj0N4tFVoZRJpsN/892LTR7dWY3+RimZxWG0f2x4mU4eoxIRK4B1HBVN3jEY6Tk/XrIWGDNA5dRmWISeZhKc6UBO5jUGeAN46FhtP45TMebM+BPkKVIE3bm2BuscmwDVOjLuzHhui5hWNVdOypySbesQXGnJSlhpFAVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMKr4I7x1OYAI2My8zrdlF/hz9E3OkTZsmwjQAZsH4s=;
 b=G5Khw0uaRipVH5mUXlmhS0DQNiuDk02A/I/bA6ihlshF4v5vuqdv6GMrKK6hOXshBCulx4pAW+LyqydClVEI4yO9uN48gxcVCFJlG9a5aKl1vyxFdy9bWitpEr3+FQaQtT8BnbkFFHpf5ZLEcToboZewOPjpgNzD8Zvfgk1yL/eMgTKVExaBqz+m9qrkMsf7rj6pM1YZeiIb+P0hBVW/0Tg3EQT0Sr67Lx3tY7lAIJ2Eps9BJ09KZskfA3puD45BBudXXfB3L5laVpsUc1xj/uNcXC4hUPuvtsReEMANpwWY/MPLO1Fe0AsZD7TR2NIr7xOuvH1EQsDlIjLRZ9z+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMKr4I7x1OYAI2My8zrdlF/hz9E3OkTZsmwjQAZsH4s=;
 b=lT61pHKk2WQxeXgFSqmkINrkbGbnzYPm9qFpkh2XF+M7q6WyWEa4IEa2kuxoELbQINfkTV+VQvBsTWSKzVsxtgDEzNrkuxbCVfi5Y9C/rMMZi9CMroqHCBtKWkNxAt/0/LepEo1kwne1PZFT40PhBnp2aK+Ff+h4RsBlN6Yk/v8=
Received: from BYAPR04MB4296.namprd04.prod.outlook.com (2603:10b6:a02:fa::27)
 by CH2PR04MB6571.namprd04.prod.outlook.com (2603:10b6:610:34::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 11:56:39 +0000
Received: from BYAPR04MB4296.namprd04.prod.outlook.com
 ([fe80::dee9:85b6:1ebb:15fb]) by BYAPR04MB4296.namprd04.prod.outlook.com
 ([fe80::dee9:85b6:1ebb:15fb%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 11:56:39 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [RFC PATCH] f2fs: preserve direct write semantics when buffering
 is forced
Thread-Index: AQHZRSW5RGgzfxLfmEqd2IrSayym268D2TwAgAVGSICAAA0xAIAADFcAgAAFugCAAAscgIAEpCYAgG7RPQA=
Date: Mon, 5 Jun 2023 11:56:39 +0000
Message-ID: <20230605115638.GA23662@gsv>
References: <20230220122004.26555-1-hans.holmberg@wdc.com>
 <ZBhisCo7gTitmKeO@infradead.org> <ZBzPYwcoLXkFngz8@google.com>
 <402cc90ce5defa81c937c3fcd09de1f6497459ee.camel@wdc.com>
 <ZBzkzg+lr+TOXZcW@google.com>
 <8207efb81cd1e9322ad608d313eb4b4bd5740e80.camel@wdc.com>
 <ZBzy7RHlCqmApxUe@google.com> <ZCDXnuV7oZwcYvRP@infradead.org>
In-Reply-To: <ZCDXnuV7oZwcYvRP@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR04MB4296:EE_|CH2PR04MB6571:EE_
x-ms-office365-filtering-correlation-id: 5092adcc-c15a-4668-7e3d-08db65bbebca
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B2+HiwmH+i7Z3zweMjQqoIGypkLjHJbX5fEC7kbGsSBlLWBP0grOssjbxkq37pMC9XJ8u1nOZMU/0KhsvXFJPOuQ4JsSYx664/ViSde2nI9kEmZqGXt25vkxCk5Z/zlF/eWjHK1cP5mhChEX8SvXJaftMnj/7eGeim273sIy/tr1EaP/yUUubH8CXA1eoJAPqV+HSC/Zv/JAsc8X62a7dm+F3UwgN3T8uCWXYGdF/Vk+8x9WYhiJ3I7A29z2XdEd+/H2eBF7WT/ThFjeF7u6xjitMlJ5UHw52ToDTVuIq0gntqn7ZIp1KgIdeTcvVgD3m+hedanBGvshGKaB5RjgyjpdEHf+6sY9zc+tQH5Q5pIUXXHu4gmBZ8aon3i/C+8AR6ZD8pkUmTa8dLptthkaB+8V0H9ruVB7GTcHVYXLHSWUUEABl8nm85Iy9iH34QSYQc5fjFeVsauYZ9lnlV4HdT9Vud3WGn4wgVNp2Hq26BhOlVJ872SIj0X2NauQCBrEkDusYiFQyL/3XsNqoSjocwYpdxjPTsLEvfOLBHzFRgjpvxyjfukAQTYxUWqMra7eOGdNu2mRdvRfS+ZzzmLogd1c5kB8aHVD1K7D+/hsdWleKh1jbgIl0sRKg/YwkhbY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4296.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(7916004)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(1076003)(9686003)(6512007)(6506007)(38100700002)(41300700001)(6486002)(186003)(26005)(83380400001)(71200400001)(478600001)(54906003)(4326008)(66446008)(66476007)(66556008)(64756008)(91956017)(122000001)(6916009)(82960400001)(76116006)(316002)(66946007)(8936002)(8676002)(5660300002)(2906002)(33716001)(33656002)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YdZ0krb1akVgJOkOj+cXhxKdnkTK2OyMMbP9AA3giNSGWzopZbff5Wfn0tz8?=
 =?us-ascii?Q?QiTB9peRyOF4OXFeMRJ3B3/fYJJ2OC0o01JqI8K8Ah7DzElmWyAOxRjeaVxL?=
 =?us-ascii?Q?Gc8FBK9feZzZNzE8/PsVXFIYG0Zr1qDgySVv3UrVrFuXHRa5rYEXeUjxbbP6?=
 =?us-ascii?Q?m19e2sWI4THdlRlMdKhno0spLsMByJ+bMaQTFCtrPGfiZJ4uFqXVgRGEJp7R?=
 =?us-ascii?Q?b7ymgU4Zz1IO3MeqUc4/8zjogw3rGlfzl6seJbCx/wogyb4e8z1C6Kt3Lmxk?=
 =?us-ascii?Q?b7OnWr0Ku2Sn0IN+W4ydrDSHyt2aWI316VjSEPTqoUEVVAJhG88v0iAAoZaS?=
 =?us-ascii?Q?2rIKvBfTn1V5LfPqnXVWwWqsFw9ixClHsIJX0l/1Z6vObovIL5YI6AHwZDO6?=
 =?us-ascii?Q?4F25M44Gi+6Sb6MkE9jFUQV1kYmqMKl81SGbJPgwTlj5p7xGDKw8ygEBpJdA?=
 =?us-ascii?Q?f3vOg8ewEf+jkkctNl3iGPYOA3DshFiA5dhVPvFjEg+K5TlQUKxyoIW3e0NP?=
 =?us-ascii?Q?SN6OHQxIa7oP1utw1Kl6jox/E8C8SzTtz8UpXWkupQs1XPNo6ZxMI4YkN1+v?=
 =?us-ascii?Q?fYwmMtnIa1TaAKBVRrCDaoYzsRKibbbW9VhFYgpORDX2BnfuVm+PiGJJKfgA?=
 =?us-ascii?Q?r4XPzfcNKjqUotK9KC6gHRsMvtLg7a2pwnP/xmHmk+mCx8UaOic1qbXYoyCX?=
 =?us-ascii?Q?0MXcPO7vkU1oa5Ng4/il39uQ/R7Qv6heYO1ZvqHTPz4+Rny2KsguVurl+mZ3?=
 =?us-ascii?Q?JVVBlcsjAkaO9wZ8MEACsYymEpv/PvtAIeAXFD/VZGMs2ZY8mrfS0z8GRvq4?=
 =?us-ascii?Q?Myfs8H+x9n23sTvgyE1AWjyW3fJlC2S53LQctMwz4EXZ7a46cR+UXi6Fj/T3?=
 =?us-ascii?Q?hjItjaluDgQZxnIObDXXycnF4Qymv0/EbpY56FLNCCPxTon9BVcW0+qPN6/n?=
 =?us-ascii?Q?lrir9qpUn/nqTqCBYLoG6ltsR5Daf/Zk7MLpSyv8D4+HowK+/eXInn9un19f?=
 =?us-ascii?Q?7xj9mknNa7jamcZgpL40/LbF3GM0upNI5jQb2T5qn3CuruCoSp4F1B4u/Oah?=
 =?us-ascii?Q?1gE9ApRLJJufE1zViKtrKWUVXKE2OLzqj/kJhYRzpEr2Kvyy9ljYUVkPs/64?=
 =?us-ascii?Q?h1CpxxSgooNwbGlI84uUewcqGyQhzjkGFLv7ocPxBzlkKJY66AZvpDjk26q4?=
 =?us-ascii?Q?HcphIYLjPOJ1byvVj80cXfsazQLzcRoKefC9RijBn/qR+LkqisZrAsdb/1Sm?=
 =?us-ascii?Q?Jzhc394SYE1wsMu3PpihthXqOR3xYCeHcvSL5g+wfa8Tv4o9t7Iv/+ODX8ie?=
 =?us-ascii?Q?AzV0ueDpMOu48HwAvR9HyvnmxCb7qep9JTH9Bn/2jVbrsa6RB+YxXJZzmyyG?=
 =?us-ascii?Q?9nAquHaiW+80kKgPsRVG5AkGqoRKE41m9J2mJ0Ixop1qJXH++3f+4mGQ4w5f?=
 =?us-ascii?Q?ce5ozryG9+niklTg1EPmzxrI1SWzA28kgZKGEKl+q/a4GayXRJ0JB+YL6DME?=
 =?us-ascii?Q?7FEeC7Yfa8/Rgm3ur1nMvNsCe8tyxqFBb44llD1DBPsg8y1K/wW/NlHxtIi3?=
 =?us-ascii?Q?hZDgdUZYsQLPSfRhWABTiBfU1Ch7LTgkt6P3CJKA?=
Content-ID: <390DA133B31F3246A5D376EE458F2D77@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?v3D8NY+0jgf5gkRZvdSZI9l74F9CgNw0XMk7rw4LjgjLyMcCDq7+BRWI64DS?=
 =?us-ascii?Q?QVvJrrbp7M0FGnTwgcTa9QbjG/6t3B6UDRyJf9RGvvSFQKi5ofz/SWzkGbsL?=
 =?us-ascii?Q?D2NvXH8eiwBHy/o+OVQmtjYyUSIu2xLbYB8DSHFkO+Pm87uLERX46swjASnv?=
 =?us-ascii?Q?2v4BYCAS2ZgUgUSIw7ZtUEEd4tj6AUZIYNSgl+UjT0kJsfUY6denomdYX4g2?=
 =?us-ascii?Q?2ShJ5MuoXOk3R8cCH+7KsDJpANzW4qF3ZoEaSrQVpg40DlA3WejMVcNUOm4N?=
 =?us-ascii?Q?mBT1D2xVgJ0hExXVsMxT6QJ+nYKIsOeivmT3UIUXI/XVc2v5hI9DPCuIBoIb?=
 =?us-ascii?Q?h/GsRv2N5xNKc6Xd6brHvfIGuwC/yJAXmDwv6Os9wzR1P0UwqOzz+l5yWYc/?=
 =?us-ascii?Q?63J2+doom+DNUqn7+L8AVaveH6EXh4TjD5xA4Tn8RHLztwSA9apZNlx36AQF?=
 =?us-ascii?Q?Qh+rbB7qnpaclMgkzWjLdNAqLSYAYq9m7P6JAEsYeCsCr5sdOsEGMa2dH0RF?=
 =?us-ascii?Q?2zPtsO4A22w2a2010gQbPZp3jZj8xVQBG8OfT0K+gWqZWNrQhgbdH2mYNEzl?=
 =?us-ascii?Q?SAbcUDnYZk7fBNOhep76DLZJNNbzQYtlVBU0iik/4iSCbLIhkS3DlK8xRDWN?=
 =?us-ascii?Q?pzX0swaWrk5afwXCHdPFEgyXBVbNQDpvM4X9SBddoaUuFsS9AD3xYnkOLFsl?=
 =?us-ascii?Q?EZ2JWOr+PXelyJs+Ou/WQS5MGek5udXo+HkG7sV4qoRu0cl7mhZXwNWpLQ5k?=
 =?us-ascii?Q?lIO+pw10ol440/BAix1sdUZdvNN4q5POh62X5Grc2x84Kdw7XYxbUKsL/2Gy?=
 =?us-ascii?Q?QHgW4uPaHT6uCtmFMnHALgYuHBqhH0eIoev0ffzgXg0tMx7a96heGFOJAwDo?=
 =?us-ascii?Q?PsB6ZrHqq+MQSlt7VQrLPyO++HZ3dli9rxXX6y4Fo6rkHeNrGUH6aCmOsdbB?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4296.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5092adcc-c15a-4668-7e3d-08db65bbebca
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 11:56:39.2133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZdxDsa7+3dlkVSbnyFYmccu7Td+rAk2LDFRA4RT2oPKxGPArVxlaq+sf/a0lkVZ546bneSGCONfmRr3aV/Giyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6571
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Mar 26, 2023 at 04:39:10PM -0700, hch@infradead.org
 wrote: > On Thu, Mar 23, 2023 at 05:46:37PM -0700, Jaegeuk Kim wrote: > >
 > Yes, and that was exactly my point: with LFS mode, O_DIRECT writ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q68pN-00BmIa-55
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: preserve direct write semantics
 when buffering is forced
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
From: Hans Holmberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hans Holmberg <Hans.Holmberg@wdc.com>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "hch@infradead.org" <hch@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On Sun, Mar 26, 2023 at 04:39:10PM -0700, hch@infradead.org wrote:
> On Thu, Mar 23, 2023 at 05:46:37PM -0700, Jaegeuk Kim wrote:
> > > Yes, and that was exactly my point: with LFS mode, O_DIRECT write
> > > should never overwrite anything. So I do not see why direct writes
> > > should be handled as buffered writes with zoned devices. Am I missing
> > > something here ?
> > 
> > That's an easiest way to serialize block allocation and submit_bio when users
> > are calling buffered writes and direct writes in parallel. :)
> > I just felt that if we can manage both of them in direct write path along with
> > buffered write path, we may be able to avoid memcpy.
> 
> Yes.  Note that right now f2fs doesn't really support proper O_DIRECT
> for buffered I/O either, as non-overwrites require a feature similar
> to unwritten extents, or a split of the allocation phase and the record
> metdata phase.  If we'd go for the second choice for f2fs, which is the
> more elegant thing to do, you'll get the zoned direct I/O write support
> almost for free.

So, Jaegeuk, do you think suporting direct io proper is the way to do to fix this
issue? That looks like a better solution to me (at least long term).

Until that would be put into place, do you want my fix (with your code
style fixes) rebased and resent?

Cheers,
Hans

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
