Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBAE606F0A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 06:46:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oljv9-0004D0-Fw;
	Fri, 21 Oct 2022 04:46:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=286b2a7d9=shinichiro.kawasaki@wdc.com>)
 id 1oljuu-0004Cf-F9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 04:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6vqalYPW1ha/abDCB6tnK0IdE9mRKPwOMtI6C6kKQa0=; b=RlVLXUAfNXuIeoR6dwhrhHlUGB
 jRFcfE3qtWKdlgs4On/mU3pQYLugtu/2XyE7KlulHrnedb86orEusOZa9bthCUhLDRnUJ7jTwMJJ6
 7vgYkk7WQb+zGNulH1y61DqhJcAnkUm4lp3/9UYuxiDuM2NIbVH64ZHQhLOdAO4ORWVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6vqalYPW1ha/abDCB6tnK0IdE9mRKPwOMtI6C6kKQa0=; b=k+o+t1UTzjptOC27/STMw/h+p1
 rTPKCDGuzOP7gnZaz/h4BJ5J0nKdqWHfJ8veYbWeU9kEbBbAt0evAWOf92NtR9i1b6G2/I/RKAxfO
 16+sjCkNwzL2IVRgamPc0RXthzVA+VOrn30YScRc8vbCqt8BnzLuDd8dl4xCD65Az7ZY=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oljus-0000nA-9W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 04:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666327554; x=1697863554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SBRv2V/pUqb06eB3roWZFendjh2ktTWYM/0ltZhuCKw=;
 b=htGKkOu/R8N/cq8wt+OSO64Ed7vfEm3fa7jD6aza2CTyYMMMGknrKPM0
 6PwliNWjNC7aPrNQMYnYKAMNyxTzJW2fMNeSOBm1QYbjkypHulTTATDkl
 wYR1OJkcpA/1U51qxhj/i9AmRPPKAov6GJEvWN5dZzoutGq9gH1DeB2b0
 O6aq9AgInDEkJEzy+s4N9RPBSsbXM2M8ykAgZWidGkXxIQFhePfBAek+v
 d8MoXsgeIojmNqCPB/NcgeEJSgL6VvSBD7fBWiSuy8KlcibDdSa8pOwAa
 UCUIeN2gw5cVGCXCCaa5mFyqWsLDBbDLImcXf23Sc4lZ45/VhVGTIV8TC g==;
X-IronPort-AV: E=Sophos;i="5.95,200,1661788800"; d="scan'208";a="212715340"
Received: from mail-dm6nam04lp2046.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.46])
 by ob1.hgst.iphmx.com with ESMTP; 21 Oct 2022 12:30:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKIyhzYi0EcpgfkgbmRBlix7w1WxV9/KppSl9MlDet1eRHUgiD5P+INXdfSq8rEObMTqAYzKz/an7Mkv4WFowToy/vHMF96VnwlIDwuzpZF6iZd6WvxMQULFGPVRt/gZ9xinw3y+nHRSpyBGreTL20htQ78/JSSrgsQ/p1rSAdu7vE0WNL5l0oKH2KtJvvs2nV6kgeSCJwziiET3MizF45rNsX1nEQHelUj1kJe7UHqHbshdmkD3F0xpghmBzXzPc3ojok4byUKZTuaxGrTODrQ3NSSZmD0sV59cz9XiqfUq1lXwkny1xQ2vNCvYvZRfSifmQAG5bm9CRgC5ZbrZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vqalYPW1ha/abDCB6tnK0IdE9mRKPwOMtI6C6kKQa0=;
 b=A0CalZJAsU6GGFXir7eqaGbwZLm/N3yODESZPE/7IngyRhKb8nG+ObAR/8920wJeW7xGT7f0ndb/wiT1eh6R8fTCaGrM4rkmkCc6+GaO/APzQME6eoDZ4VM0/L5DGyVKeUvH99fB1Bu54w0ZzbdmgV2MclQDYGdHaP/3CFf+GiREF7WRjjxqlymiFZNn3CUUpccT5z2zoU9xKfFXhharrVpKMk+aNNiFY+QSOtRwX6M7R6iNv2FpaCRIiIpJvZxJKdcUBY0AIOdrqnMA3MejqE7kwgIjT7HxRXWQgwdxxOeqhyVo6YdifozeAJR8N2Sycii0n8cknHG/vbdWh+5nDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vqalYPW1ha/abDCB6tnK0IdE9mRKPwOMtI6C6kKQa0=;
 b=NbcWencRaHAlKXIVdZ7ei66vluvuJtpcDtzIMd2/AcsmQHCT7rE2MnZs9PyENrxD8V2ztil4xGcKa8vOgpFKO80a2PQwnXHNc+VVpTGsDOuX3Oj+yyhxQLxv9kTgQzW6BoqA1OcGPGR4lVZ/WV8BAV4rBfsgSxpWKKZ53UwzDF8=
Received: from BN0PR04MB8048.namprd04.prod.outlook.com (2603:10b6:408:15f::17)
 by BN7PR04MB4290.namprd04.prod.outlook.com (2603:10b6:406:f7::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Fri, 21 Oct
 2022 04:30:10 +0000
Received: from BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::6b00:5ef5:d216:6837]) by BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::6b00:5ef5:d216:6837%5]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 04:30:10 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH 1/3] f2fs-tools: give less overprovisioning
 space
Thread-Index: AQHY5GNVMadqEopFxkmBlN4xT4Nqfa4X67iAgABXGgA=
Date: Fri, 21 Oct 2022 04:30:10 +0000
Message-ID: <20221021043008.puq6iizza4il3w6s@shindev>
References: <20221010221548.2728860-1-jaegeuk@kernel.org>
 <20221020090708.tiysx3qsgatb3ngv@shindev> <Y1HXP7ysrNXX+oR8@google.com>
In-Reply-To: <Y1HXP7ysrNXX+oR8@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR04MB8048:EE_|BN7PR04MB4290:EE_
x-ms-office365-filtering-correlation-id: 6db54dfd-96bc-4663-8752-08dab31cf0a5
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UkJIyfTPQCDZNGdgZbcoRQ4Vkq3NXz6RG8gCpsVMDH0/Yb6dUp0JpU4oJhOt71vZEb6yV63XQ/4ek9gwS++ylye8hZ/iQECN6kxEoSaGBV1GRQscxZlYAyJNfhL/f7kl64ZDo/TEhT7rOl5S6h5CYbM6E7MIBr9CUJoIZmu7oy+zPr13jO+QX4gzfA3OtVyi/bsw5a8eIoa/dvRocN9fxO8fon3Kj2QtBDXkKY5GziTCDelwQvWC/HzGfGpUBejGIN4hauUFrtL2OUIRI2rOCF2Qx3r1RiKeZnReV1hy07PzZQfM16rP8pbVH9ifuoXeIZZDWravjtejU6p92nZLSErMSZEHtIedbwY0HIhYsfyNvYjRqhJ9Hi3gMfc3Qers6OsLO9lhShOIIdr1wWxkR0yoxYVK8AseRs6ZdruJ4xSZnxCEqyV8IMNRB2hNlqLUaKGcHxVVGfqr/R6oRzQxO9sl8NT/ZSe6enMf/wOctrLugrFoMcHcbgNZZd4ZbaipLg8E9HztcHIfRiTUmnynjUDiVMSqFocPf9ymjDm5rJYzx6skcCb2qPvci6VLqoo4gdFEG28bOgb1k2N9W0pEmNI2sso5MGR81S3Z1sY3l/gjksndhqSa3rqGGmrdGlKy4sENHvsumHPXJI9gzAuibXk67LTmrLAfiLM3fZ/SUMB+3EpsNXNm9QWWgAad9UVEW2lOdBgn0D17bPb8wbmPPkIG9hiJBu2CFe1+LfyHaTJCWruG+EZut7lzWiP8vsYGpWTx57krYNCrxfwEqmTxcPMifBATsFMbhhlTMOKsXYs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR04MB8048.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199015)(86362001)(966005)(41300700001)(8936002)(44832011)(71200400001)(2906002)(54906003)(316002)(478600001)(6916009)(5660300002)(6486002)(6506007)(82960400001)(38100700002)(33716001)(122000001)(6512007)(26005)(9686003)(83380400001)(38070700005)(1076003)(186003)(4326008)(76116006)(66946007)(91956017)(66446008)(64756008)(66476007)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qaj7gUPWefNZYihvNMnx+cnw9MMeZh7d0gqvVcnzK9fH+zzX+/BzYAPd8Lkp?=
 =?us-ascii?Q?tIJP0mFr09NgD0F387/+A3MWT3aBciNdj227j5IizqHKFmM3okUyX7CVOPkS?=
 =?us-ascii?Q?y1mlBRO72NPOb4GtiY6Bl+LIl5VWkiA+f3mFsozOhe0LvVvfoHksXg9jKj7a?=
 =?us-ascii?Q?mWB7ZTtAcrRCYqhDz/b9zqNqxkRCYPtKdYfkqLZOFBFml3yd8gW0D/Ehvche?=
 =?us-ascii?Q?YbH4nH55I4BRp8XWkVyvHV8b8zzsFqeFzC2P8etvmMp9eYz3V7xwaocTuLWF?=
 =?us-ascii?Q?OQGI5t0oEFhLRMc+RdDCf0MIh6V06hzEMZDWH2jLpP4dNC/wWt/tg87r2qL0?=
 =?us-ascii?Q?+KpMxHT344fjoyYai/UZOOP7TZVK6seGQBZQLXvqUx8fMWcdSNflu35Febk/?=
 =?us-ascii?Q?j4Vu9s7aLYIKObUH7Iy098vYDMbSrOSWNWsyDf0vWjNE7btxDqghR3z5RVOH?=
 =?us-ascii?Q?IVMizOVDKKRS5fMYzxfBsh0XYUBWywXenBLWxBBGeSe3qwguHVku2QxeYgA0?=
 =?us-ascii?Q?1MqoJPDsc2OKa1Feiv+LgvNb5v3qZnirmLif05AWoZdbYDtte2uhYhVoSFGK?=
 =?us-ascii?Q?yyLL2MvMgn7d2i7naQBgQX6fZN88wCsPDdyuhyq91vNeB1UbB39oq4dBvYpt?=
 =?us-ascii?Q?FjzqhxDxjY2NF50ybGLzcb8hW29LqEVSHDl/e3+rXB88D+G3cfQusysPsQz7?=
 =?us-ascii?Q?o7aD0mLn92Q4XndJlQo1t/96n8kBQ2np31uSL5YkzMiacKCiltYiXNc6xps0?=
 =?us-ascii?Q?V9wdS3JSp7Wi7lr8INyzgSlXt34mVYMGd0uHfM2xwwyuyEjLe5+nqcBxOaf7?=
 =?us-ascii?Q?XvekrulFDIRALs6kC+v5qN3sVq9QuwMTrgiCDmgDPA/zBNdeXFFf5aelBqtT?=
 =?us-ascii?Q?MjC+K8HKWsF0mTnTo2QAiR79SkXy9WhEEfuxW71bULgfFO+6ZQmxdhLo3+rf?=
 =?us-ascii?Q?kTTe4GxmqvbxVTGWU9mIyEBOfft5Yl8fjf4PL5SnhmvfGF3zlWDxwb6F4nqU?=
 =?us-ascii?Q?jnuSrfsNYg/QXsGJen26a9JLYjkFvZPLUf+hF7VBan80wVrdTu4tiTNEi7Co?=
 =?us-ascii?Q?nzYdEt8eLN7GWkTjNOfN/f1Qv5Nh6BY2E2P+K7TgIDOpJw65+LhHYBHAgriW?=
 =?us-ascii?Q?qE48gKlreLd4EmMzqiIzDFDVOycVe+7nuvr9k74ORvL3vna+SHo3dPa6rHXF?=
 =?us-ascii?Q?ulK7o3KtnpGA2uOA7icDaI+3FU2GoOcKqsf8oYHzs/jN73s8bgy/N3NGIp68?=
 =?us-ascii?Q?csFNmjL/QAUgkvs7snZ7x/7IhZWiXmntWjwgjcaf9KkR1ED/UDocUfKIiEN9?=
 =?us-ascii?Q?FyQ7EJMjh/Oom9kuUs1SsQEMRao4OBTZodiy5CyMq+v0Bk3wwpariQ20A5l2?=
 =?us-ascii?Q?ABZ8txgLYzz74SdjpIl/56JajUpq11XUYkMXPOPzlOjdjrpYbYSXIuwJ2DMN?=
 =?us-ascii?Q?fR6jlYP0XVEkR1ux0RqVGitap1xEnju8zAbUOrOTDIwkqbr+tgnk8q6DsjAd?=
 =?us-ascii?Q?669Stc29EjJRK6xcH7fgX+FFzebnZy2mwueMQLWiQ8Epx3gTGn4Jfhe+4G/T?=
 =?us-ascii?Q?IowCRJyrUOxcXvDR260tbu8hj0Uge9ivgTwy1B8zFlfL9Pt5o19ape82dk3k?=
 =?us-ascii?Q?nT/10ydIIt2jl67EN6R4d0Q=3D?=
Content-ID: <A7B7437413F4454EA99DF99A53B4C5D5@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR04MB8048.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db54dfd-96bc-4663-8752-08dab31cf0a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 04:30:10.3870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vc5msvfqt1/g75rWrEe0wnGjRlGv/VRKlRXCurb1u74qo8u8cU056tmxalCt/X2z78toHbwc8x7a8Lc/3Cdqw9IkcOCEnNq6RSxdMk3koms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4290
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Oct 20, 2022 / 16:18, Jaegeuk Kim wrote: ... > Thanks,
 I think that fix looks good to me. I applied into the original patch. >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev&id=281d3e72370f6c39c0d57acaf37a7f
 [...] Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oljus-0000nA-9W
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs-tools: give less overprovisioning
 space
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Oct 20, 2022 / 16:18, Jaegeuk Kim wrote:

...

> Thanks, I think that fix looks good to me. I applied into the original patch.
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev&id=281d3e72370f6c39c0d57acaf37a7f0e003ddd28

Oh, happy to know that the fix is good. And thank you for adding my SoB tag.

One more thing, my fix missed care for fsck/resize.c. I suggest to apply one
more hunk below to the commit in same manner as mkfs/f2fs_format.c.

diff --git a/fsck/resize.c b/fsck/resize.c
index c048b16..79945e1 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -476,8 +476,8 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
                        get_cp(rsvd_segment_count)) *
                        c.new_overprovision / 100);

-       if (get_cp(rsvd_segment_count) > get_cp(overprov_segment_count))
-               ASSERT_MSG("Cannot support wrong overprovision ratio\n");
+       if (get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
+               set_cp(overprov_segment_count, get_cp(rsvd_segment_count));

        DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
        DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",

Without this change, the assert message "Cannot support wrong overprovision
ratio" was printed when I ran resize.f2fs -t X command to the f2fs formatted
with mkfs.f2fs -s Y. With the change above, the assert message is not printed.

> 
> > 
> > FYI, I tried to fix and created a patch which allows reserved segments larger
> > than overprovisioning segments [1]. It compares those two, and take larger one
> > to subtract from usable segments to get the segments for users. I confirmed it
> > keeps small number of overprovisioning segments for no -s option case, and
> > avoids the mkfs.f2fs failure for the -s option and zoned block device cases.
> > However, it increases runtime of my test script which fills f2fs and do file
> > overwrites to test f2fs GC on zoned block devices. It takes +60% longer runtime.
> > Then GC performance looks worse than before, and this fix does not look good
> > for me.
> 
> I think you can try to avoid that by tuning /sys/fs/f2fs/xx/reserved_blocks?

Thanks, I was able to shorten the runtime using the sysfs attribute. So the
longer GC time was just caused by the smaller reserved segments size. Good.

-- 
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
