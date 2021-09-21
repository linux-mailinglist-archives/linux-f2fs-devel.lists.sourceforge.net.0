Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB93412A49
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Sep 2021 03:32:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mSUdk-00047X-3H; Tue, 21 Sep 2021 01:32:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=8912a2be9=shinichiro.kawasaki@wdc.com>)
 id 1mSUdi-00047N-Iw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Sep 2021 01:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7mq+w2tp4xs+/FWgQLhk8syinm737RhDmN1tdbU8dDY=; b=ZzddzYqIAeUY6MotrjiMIBDErs
 Xzw3A7OE0Gigx6J86wUCz3aDFPHLxEC2vNjVJBeJjz24kbfXBYHHyUkNbl8JxE48uKXGOPXoz0pwD
 b6kWxJbG84IGi7WF3D+dFb57Cn231GHqeUGeK6iTjJmNneyPE9aeqQn7y7Jm0VaQQfDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7mq+w2tp4xs+/FWgQLhk8syinm737RhDmN1tdbU8dDY=; b=GzFYmZNGpQrlnITBtun8tO+/t0
 Wc2gzlzINUK1LJEOr65DUowY3zLnGG3M6vS8J2/n7zZsyMObJEMnUkuk/LDk63+XzrMX2x2xb5huf
 K2ogpcaZMH5ZJ9CPrVJ8aiXiyUcNrpzHEMzFFPKVCBsJZfOh+fUQMlvryLTppmccyuUc=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mSUdg-00HRJF-NV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 Sep 2021 01:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1632187924; x=1663723924;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iZgV3C+vzFh3+w2Lhv0BgpaAe7ZxmMZR98rkqL3UlYI=;
 b=gaRz0v+uoD8Hlp7tbe/+rdFr75vpqQN8macGRnKfj3WW6A1aW9CiAPTN
 L2ynWQGMt97HOjcOJ8sYnYBWXgouhVIss7Y98irSkqO1fY1SWkSLL+XSh
 n5qsX9MriWijcZaVRhi7lrYodaGx6NTdyUb05EwCgNUI1eXlt1tMdCFOL
 cIQNolmjh8jNeZigSbh41Ob/nNIzdb4VFo+kGBANWFT37UDwexC1R25yt
 Gjd1sYuRYZvlwxcGLcWpwaF3qWQGTKbhZLhnCHhb/mujL3puZoUuZ1Lwa
 7L1wpgqG3ygkoC3143ThRjLPdif7+1Gw6Ybt43YP8wiIIMQbzNYiDL+tX Q==;
X-IronPort-AV: E=Sophos;i="5.85,309,1624291200"; d="scan'208";a="180505631"
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hgst.iphmx.com with ESMTP; 21 Sep 2021 09:31:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSqyZcExkBDaO8HGrtAsn33QNY99X+r2VCGGh0cIYzXkqr77ua/cCadOIDw6FD02vVFKpUzgQMkBUAzul7GUc8hgEniDsP9/JH5Hy+i8i1dxsF2PxWxOOUDPgMzbbUNEierWArmOpJD8+E9onevjiNCxLOwZqBEeMYt7Go4v9QU43SCTOiKhdwHZQs6jWD+ehycAwQiiiitzAxEVZb32C33dVoMb+NxgTz5kZ70BRMUEshzhcwYt0sgoDjqsNZy2LR/X86YUcwmNiikm+dhRg37KuqKP/0f8aVztgOZErmuoiNaHi/ThAcsISsY6Xdha/LWOZh1GBxQcdaTFwofTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=7mq+w2tp4xs+/FWgQLhk8syinm737RhDmN1tdbU8dDY=;
 b=SY/rR9RRNF22eV93Ml7wfwz8oPp4AZztO8RVBGlOeuXQhFsInPNltyDd0B2UsP3dwNkpzGHTBNkrtglAMTQt38noz81TMmQygADXCU6xQN3WMJx9KJdbhkNL1OPnbOg/KmudjwVJqeCjt7nYE4wLQC7lALQ+j8lzh4v/vi62T/f3wSCjk5MK4uFtGs283QpHNrK1Ql32EuQvAU+VBDR3gNaj8s2JD72qmDXbX87GJZK71LFOhnwUBcMTThuQx2uq/3qGvRht3QsrHpyQubNsaA46ycFvkmaE99bIqPHYGcajID/f+qondXvZnlPTTvPtodW1auSUkacnM3eEvR3k+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mq+w2tp4xs+/FWgQLhk8syinm737RhDmN1tdbU8dDY=;
 b=thXRYGWTKEtmmy6NhfEw2UpJ1yjqxuLMtzQHuk3e1jCeNIjgHo0R/qFRK4HsXY9pyBLxjm1/CBFhYGNhJcp+kQqekT7oyjiJ9BdbuG3YhmAgYIevubdL+38YxabTxhwu6NJiEaOidGXYUmkAw6I52jhut+HymCXQ6IJQqWRA1G8=
Received: from SJ0PR04MB7184.namprd04.prod.outlook.com (2603:10b6:a03:291::7)
 by BY5PR04MB6582.namprd04.prod.outlook.com (2603:10b6:a03:1dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 01:31:50 +0000
Received: from SJ0PR04MB7184.namprd04.prod.outlook.com
 ([fe80::30f6:c28:984d:bd79]) by SJ0PR04MB7184.namprd04.prod.outlook.com
 ([fe80::30f6:c28:984d:bd79%4]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 01:31:50 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH] mkfs.f2fs: wipe other FS magics given -f
Thread-Index: AQHXqfTmr9HoY1CH2UiiapdYmZKnnautmheAgAAi5IA=
Date: Tue, 21 Sep 2021 01:31:50 +0000
Message-ID: <20210921013149.5irs55bxlfhz45h5@shindev>
References: <20210910225618.501839-1-jaegeuk@kernel.org>
 <20210915054532.alaps3utwwei4efo@shindev> <YUkYwQidnXGB9LLk@google.com>
In-Reply-To: <YUkYwQidnXGB9LLk@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acd74007-d5ee-42d4-cba7-08d97c9f95d5
x-ms-traffictypediagnostic: BY5PR04MB6582:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR04MB6582431511565A4FB61D526AEDA19@BY5PR04MB6582.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:381;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rzYUWVlK4l2wE4PHBug+t5dsmGZmZ1HNSTYFwqPfAfzkl/vYWXG3MpHhCKlKZG+VbN8dvXtErus/TVTJVBiCPWsso8P+6GwlSMckoxa/7HOOyYcXlDpRkS2mf63u855TkzoZxrhh4lEMmG4A6zetCfwxAgB75m4i2mNOwMZ/5GWYu49oJc96NYZUuBFRYwbLubfcVGCovewWM4P/jCQOQl1cZWYB3WQy7GZ1Wh50OM7gL5UWOlcjHhl8QB9ePNA+DLW5DHhOvqlDT0Gu+XwSfiXUsgRhBgm5KbVF961n8wpOT643Q+fnUWljKpNYJ4lqCEm5ZeuLEZgq22Oe8psNqfGf0OlTMGOpn3IRmpcLl6msAoe465kRTzV8hown1Zz86hu6cdySCJCcWRHdAis2bGvPDNSu1jwhHeobAl/pUoHRNhHoxwlUjK/hnRM6sMDQlj9uv5gZGwogfNW8ck8YOpNACwabNSkuHjAaUMzoxESXkunCIPWW5O5UlDEQzemiZCqQd6MzsszbV2l3jbbOTQ+stmSfq7U3+0V6F9UzNJHGta9OM3MsRb2xhlaX46+dBqysURE8pxqCImvOrPQiM8IYLEFEzMOzC2iYtHsyN9SNq2XvfcjFpsMOZUaBMS6uhhqs3FdYfS5OvacLnXSE0eLWGTpCucWhQ99PmPT6w8OkAKx/S0Mz9RpX0nc/8JcpSQYn8AkCGY4l3R8BomwlSMArx1GIDzIyuU25gZ6wX/BZAajbGEiYlHfVneY0nL7GfX9XqIcLleaPhWnANYhThHA8m9Ne7YKRSLwZXJIAtzqhF8wVJYjHZFsc942XycUtDiw5jvl89mx6UKDLUAulKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR04MB7184.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(5660300002)(66476007)(64756008)(83380400001)(66946007)(8936002)(71200400001)(122000001)(38070700005)(4001150100001)(6506007)(2906002)(6916009)(1076003)(66556008)(4326008)(66446008)(508600001)(91956017)(86362001)(6486002)(54906003)(44832011)(76116006)(316002)(26005)(9686003)(6512007)(966005)(186003)(33716001)(38100700002)(8676002)(505234006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IGJmfU55e+YxfmfUfpzHpiO4j+jW3Ei82rdpvLRUPcRPfBsRDFAkTyWiY3eR?=
 =?us-ascii?Q?NvjuT37rITCbjhfVI1PJ2tX5sYGnwBclGLthEjPoNKsfVx8mVP5M4UwsU+pu?=
 =?us-ascii?Q?L85sVAa/3NgnVMcILSHrb5s/bIuWXax21ogBaSEkIyj66ouhI0Z0HYu3AvFL?=
 =?us-ascii?Q?HpMj17QhDEVQQecD8vNIhMsIeSRqhvYg+15In/EewXySvcYXOI9HDafQwFRQ?=
 =?us-ascii?Q?PxbfGj/8PM0UDPu8KfD+LXi+AsF0IwnPYzt6hSzW3fdBvA9PpJvDieFeIYSy?=
 =?us-ascii?Q?TrbneJ0knufYmA4/pogt+uHMwkt4YmnyegPJjevBkM4ml/pvj8J48WTfO/m/?=
 =?us-ascii?Q?vkM3gx7MOQ7WW3Ed8o6Rxt4MwUkirto1ZywaGTD24gLfXlQh0+eSkBJHMe/I?=
 =?us-ascii?Q?8W/cjwJTENyreS0PxBSL9FGqUjEkTlQ0XXNf1r7R1PihWAiUwQGdoC1NX8dQ?=
 =?us-ascii?Q?NZphYBTmmT7tf1Sh0gntkdTZqb/RhHCgreRS/2Z1WIpWpPynvn+BsDWIobt9?=
 =?us-ascii?Q?IXzPuR5Ob1+FgbplMjWMUc8tp9y58x51T7mm9HrWQb1l5JJpDM6EYHgYLdd4?=
 =?us-ascii?Q?KtO5d9xtOphWd45JWxKtJhGCxdAll7zxMGtH1Hy9KdtAf+q8ylqMjLahaJD5?=
 =?us-ascii?Q?ZMMtJQKskOD2j+AJVL3+pZfHvTodMivRjdePAxyLt6ZBAdD4DC4NFYOJbQ5+?=
 =?us-ascii?Q?DnI677AjuPjEcnUlyLeb/NzkgLFGxDJZuFCOF/ez+xriv053yV9LOBu78hxC?=
 =?us-ascii?Q?Qif9hHG+hRGTzhIkA3JcQ8fahHP8xDfYM2QmU8I938oisV2wNFu8RVAWofGm?=
 =?us-ascii?Q?1od8yJ8ajFus3Blj5IppCyepM8QPTq+fkElAxJ9StWyyzfIGtxSWtm+412Hs?=
 =?us-ascii?Q?9XGHjuvKMyL1cqw9O7MqJN/cRW77XcyqDpboSqWrPE0eHEvqH9TWEVwPN4en?=
 =?us-ascii?Q?Bs4dpOfZkqltl9eX3DW484eqIIlTC7CulFLvtUQ8TjMasink2jvaKOIk1wS9?=
 =?us-ascii?Q?J4eBjTlGx4JPWSokeVMfCbHUXKFTODthYXosajDgRjJCH2MPBUVH76/K+r13?=
 =?us-ascii?Q?zO8W+wu+zxkllJ+MAvavdM6rF/C2l2uaKy6m/nRTs/Ryu5S5C8BH9qPF27Xa?=
 =?us-ascii?Q?RcWcVqsOnIOJOIAHb07t/0UCn7RkEEFdMWqfVqTUzPtDEi8QpTqFDqYPyIR2?=
 =?us-ascii?Q?vl6hWpq1WDpl4gnp11yb1OADsLw4uADuseQT6Glqb8Upph6EC3NMFAu+FbmW?=
 =?us-ascii?Q?n59wufFlczIByCDCmSfpL2rM4bTLMUGmWYxnTdHkJx0WysL1KQiEep6F9ee9?=
 =?us-ascii?Q?IJTiLdx4kw/A24jBeOjHTbHAxreegrmruhawAo0bxUB0JA=3D=3D?=
Content-ID: <5AA0C12E9A8CD14C9AF5E77CADE96CFA@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR04MB7184.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd74007-d5ee-42d4-cba7-08d97c9f95d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 01:31:50.2587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BHSie4MHcmNvJKhI7LMf0z5t2ytqfpTnKDQlNWaRBncV82Uba4xJWhBdA00j0GNAzjFiLS1OGsixltJnXZbK4UwbzIXGx6d0Ozn0AYMAL4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6582
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sep 20, 2021 / 16:26, Jaegeuk Kim wrote: > On 09/15,
 Shinichiro
 Kawasaki wrote: > > On Sep 10, 2021 / 15:56, Jaegeuk Kim wrote: > > > This
 patch fixes the below stale magic info. > > > > > > $ mkfs [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.144 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mSUdg-00HRJF-NV
Subject: Re: [f2fs-dev] [PATCH] mkfs.f2fs: wipe other FS magics given -f
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sep 20, 2021 / 16:26, Jaegeuk Kim wrote:
> On 09/15, Shinichiro Kawasaki wrote:
> > On Sep 10, 2021 / 15:56, Jaegeuk Kim wrote:
> > > This patch fixes the below stale magic info.
> > > 
> > > $ mkfs.btrfs -f test.img
> > > btrfs-progs v5.10.1
> > > See http://btrfs.wiki.kernel.org for more information.
> > > 
> > > Label:              (null)
> > > UUID:               941d2db7-3ece-4090-8b22-c4ea548b5dae
> > > Node size:          16384
> > > Sector size:        4096
> > > Filesystem size:    1.00GiB
> > > Block group profiles:
> > >   Data:             single            8.00MiB
> > >   Metadata:         DUP              51.19MiB
> > >   System:           DUP               8.00MiB
> > > SSD detected:       no
> > > Incompat features:  extref, skinny-metadata
> > > Runtime features:
> > > Checksum:           crc32c
> > > Number of devices:  1
> > > Devices:
> > >    ID        SIZE  PATH
> > >     1     1.00GiB  test.img
> > > 
> > > $ hexdump -s 0x10000 -n 128 -C test.img
> > > 00010000  81 29 94 0a 00 00 00 00  00 00 00 00 00 00 00 00  |.)..............|
> > > 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > > 00010020  94 1d 2d b7 3e ce 40 90  8b 22 c4 ea 54 8b 5d ae  |..-.>.@.."..T.].|
> > > 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> > > 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> > > 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> > > 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > > 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> > > 00010080
> > > 
> > > $ mkfs.f2fs -t 0 -f test.img
> > > 
> > > 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> > > 
> > > Info: Disable heap-based policy
> > > Info: Debug level = 0
> > > Info: Trim is disabled
> > > Info: Segments per section = 1
> > > Info: Sections per zone = 1
> > > Info: sector size = 512
> > > Info: total sectors = 2097152 (1024 MB)
> > > Info: zone aligned segment0 blkaddr: 512
> > > Info: format version with
> > >   "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> > > Info: Overprovision ratio = 6.360%
> > > Info: Overprovision segments = 68 (GC reserved = 39)
> > > Info: format successful
> > > 
> > > $hexdump -s 0x10000 -n 128 -C test.img
> > > 00010000  c2 8a c8 26 00 00 00 00  00 00 00 00 00 00 00 00  |...&............|
> > > 00010010  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > > 00010020  92 ab 3f c6 b7 82 49 5e  93 23 e8 c9 e9 45 7d ac  |..?...I^.#...E}.|
> > > 00010030  00 00 01 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
> > > 00010040  5f 42 48 52 66 53 5f 4d  05 00 00 00 00 00 00 00  |_BHRfS_M........|
> > > 00010050  00 40 d2 01 00 00 00 00  00 40 50 01 00 00 00 00  |.@.......@P.....|
> > > 00010060  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > > 00010070  00 00 00 40 00 00 00 00  00 00 02 00 00 00 00 00  |...@............|
> > > 00010080
> > > 
> > > --- After this patch ---
> > > $ mkfs.f2fs -t 0 -f test.img
> > > 
> > > 	F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2020-12-28)
> > > 
> > > Info: Disable heap-based policy
> > > Info: Debug level = 0
> > > Info: Trim is disabled
> > > 	test.img appears to contain an existing filesystem (btrfs).
> > > Info: Segments per section = 1
> > > Info: Sections per zone = 1
> > > Info: sector size = 512
> > > Info: total sectors = 2097152 (1024 MB)
> > > Info: zone aligned segment0 blkaddr: 512
> > > Info: format version with
> > >   "Linux version 5.10.46-4rodete1-amd64 (glinux-team@google.com) (gcc-10 (Debian 10.2.1-6+build2) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2) #1 SMP Debian 5.10.46-4rodete1 (2021-08-20)"
> > > Info: Overprovision ratio = 6.360%
> > > Info: Overprovision segments = 68 (GC reserved = 39)
> > > Info: format successful
> > > 
> > > $ hexdump -s 0x10000 -n 128 -C test.img
> > > 00010000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
> > > *
> > > 00010080
> > > 
> > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > ---
> > >  fsck/main.c             |  2 +-
> > >  include/f2fs_fs.h       |  1 +
> > >  lib/libf2fs.c           |  6 ++++++
> > >  mkfs/f2fs_format_main.c | 26 ++++++++++++++++++++++----
> > >  4 files changed, 30 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/fsck/main.c b/fsck/main.c
> > > index eda399cf0679..e4cfdf443867 100644
> > > --- a/fsck/main.c
> > > +++ b/fsck/main.c
> > > @@ -1120,7 +1120,7 @@ int main(int argc, char **argv)
> > >  	}
> > >  
> > >  	/* Get device */
> > > -	if (f2fs_get_device_info() < 0) {
> > > +	if (f2fs_get_device_info() < 0 || f2fs_get_f2fs_info() < 0) {
> > >  		ret = -1;
> > >  		if (c.func == FSCK)
> > >  			ret = FSCK_OPERATIONAL_ERROR;
> > > diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> > > index 2a9c1169456c..69260a6fccd9 100644
> > > --- a/include/f2fs_fs.h
> > > +++ b/include/f2fs_fs.h
> > > @@ -1341,6 +1341,7 @@ extern int f2fs_devs_are_umounted(void);
> > >  extern int f2fs_dev_is_writable(void);
> > >  extern int f2fs_dev_is_umounted(char *);
> > >  extern int f2fs_get_device_info(void);
> > > +extern int f2fs_get_f2fs_info(void);
> > >  extern unsigned int calc_extra_isize(void);
> > >  extern int get_device_info(int);
> > >  extern int f2fs_init_sparse_file(void);
> > > diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> > > index b27785dec757..420dfdae56da 100644
> > > --- a/lib/libf2fs.c
> > > +++ b/lib/libf2fs.c
> > > @@ -1183,6 +1183,12 @@ int f2fs_get_device_info(void)
> > >  	for (i = 0; i < c.ndevs; i++)
> > >  		if (get_device_info(i))
> > >  			return -1;
> > > +	return 0;
> > > +}
> > > +
> > > +int f2fs_get_f2fs_info(void)
> > > +{
> > > +	int i;
> > >  
> > >  	if (c.wanted_total_sectors < c.total_sectors) {
> > >  		MSG(0, "Info: total device sectors = %"PRIu64" (in %u bytes)\n",
> > > diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
> > > index 031244d5d67a..de93f1b5b778 100644
> > > --- a/mkfs/f2fs_format_main.c
> > > +++ b/mkfs/f2fs_format_main.c
> > > @@ -396,18 +396,36 @@ int main(int argc, char *argv[])
> > >  
> > >  	c.func = MKFS;
> > >  
> > > -	if (!force_overwrite && f2fs_check_overwrite()) {
> > > -		MSG(0, "\tUse the -f option to force overwrite.\n");
> > > +	if (f2fs_get_device_info() < 0)
> > >  		return -1;
> > 
> > Jaegeuk, thanks for the patch. Today, I had a chance to try out the dev branch
> > with this patch, and observed mkfs.f2fs for block devices failed with the
> > messages as follows:
> > 
> > $ sudo mkfs.f2fs -f /dev/sdc
> > 
> >         F2FS-tools: mkfs.f2fs Ver: 1.14.0 (2021-09-10)
> > 
> > Info: Disable heap-based policy
> > Info: Debug level = 0
> > Info: Trim is enabled
> > Info: [/dev/sdc] Disk Model: SanDisk SDSSDH32
> >         /dev/sdc appears to contain an existing filesystem (f2fs).
> >         Error: In use by the system!
> > 
> > I think f2fs_get_device_info() call above opens the block device with O_EXCL.
> > And the following f2fs_devs_are_umounted() opens the device again with O_EXCL.
> > The second open results in E_BUSY and the error message. I tried to move
> > the f2fs_devs_are_umounted() call before the f2fs_get_device_info() call, then
> > the error disappeared. So, I suggest to move the f2fs_devs_are_umounted() call.
> 
> Thank you. Could you please take a look at v2?

With the v2 patch, the error about O_EXCL open went away. Thanks!

-- 
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
