Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4F605B09
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Oct 2022 11:23:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olRlm-0004fC-9T;
	Thu, 20 Oct 2022 09:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=285870a30=shinichiro.kawasaki@wdc.com>)
 id 1olRlL-0004ea-AZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 09:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FWRxpLjODsJKtr29wDkEJKrt6ZO16VdPlczEukgeTck=; b=iWMohSafih2wo7IK8PoGvC2TRu
 hbFyp6xHQbuIrTVqx8Eob3oDhz6Uj2PuFM7x6/1tr0tg3fg/6EDrkby0DGBvhKZ6P8Z1gNxqjthuV
 6QYK9u2pCvCBsuSjiEsYbiqUO5iEeNZNhk0vF1oYWfFx98t+LLr5dpM0ipanOsRDHn6I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FWRxpLjODsJKtr29wDkEJKrt6ZO16VdPlczEukgeTck=; b=bXuP42z6NxpJaGegpP1IaZH7fK
 9OaIWYx9GFiGgUOqfx/EBVbvWg8CyV864KbvVoioIHdXvNrGWTck/SF2fdggG31PTxM14kaYEDOup
 y26UBAjAHseqj+l1uukVjEKvazhg/F8mwKK2DHdO9R1ICXCJL/DFtgjQvNrTXX5V1Ufs=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olRlH-00016u-II for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Oct 2022 09:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1666257767; x=1697793767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5WJvcIeAXv8P/kMpDgGeaU/jwDHG+JK5nNGTudAYnb8=;
 b=O4TOrfeOLFhneBPb6GIKjezQiZf5qm1QzzUonmQrYvjpLom1/BMcAwM/
 5Hen5Onj5M8ByKFmc/c/rvrnWlc/C1HsZcVo8Ai+kzuryHZgXtNIyCxJM
 bl4HS7nf+63nqiD6yVi2VCsvggw/UIceLnV5felulX3kRVqKIhYUmKnmH
 Z4SFW3yNDbQ06tdLI5FC30k2Tl8ci1petu923ecPAcZKR4yDzXmv8vruP
 7J85NA1MW6yMF0UiBjkUwTEHUkGjs5wPtlOYB6OHL8c962OL8djDz0UCu
 5ouYVBDuOZ7KDc773XWWfQyZCpqJ36FDs9w0XYN7aotqyg7Ddy5Eo5jLW Q==;
X-IronPort-AV: E=Sophos;i="5.95,198,1661788800"; d="scan'208";a="219469580"
Received: from mail-bn8nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.49])
 by ob1.hgst.iphmx.com with ESMTP; 20 Oct 2022 17:07:14 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuepJPxdVrKmfixh92uBoFfumewb11SxNHWc87ZoDX/oZV3HS9BgnKgDKVWiAADzxAITt6X/uuu8oelIE6GMI29F9BrmYlDO2fAMQxz3F69i11xbidvV1ybNmzWA+uu88tiSqh+KZKKt4Nde+2kB+upmpFlBtf+EBSoPKQMq97OKP0RQYOSESG0PeIjnqH9CMpqWLgcxI8cqP2LrI71Hpd92J9bHrC6unsbaD+IzJ6wi35D1aqysFWp0CrpEmqkL/Orah+anK+iuRwmhh9ImGVrrKz23Pj1zclV1Uagarug7LxYx6MiY4hv00OidR35tbpEnOVo3ai1hYDDV+WIxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWRxpLjODsJKtr29wDkEJKrt6ZO16VdPlczEukgeTck=;
 b=kua7C7nNmZQGKCx6D0oc8Y2SQfH4NmxiYPLKoQQt/i9D5Cw0XZYHc6HxsBKfA64f77vSLkuyPrpDUfXQsvBI0XiibRa9lXptOJnDk+HHmFkcXd1X9d5Z3dqM6i1oz7k0qacr+3k0iKzn8+mIg8RmfejeHskHBR+ftn9bDBIfZ1NI3lUdR7K3vMMpwFOETG7wDbITKs4UxBkwpqwgyR6ViTQEhXmtPAOQaxBNuGbAcmLEDTPp8kcAZ7HwLQP/wR1YAtb1Q2q1VJrMESK5gd3F5HIEgQc1BJW45cnwhiFwIF7Fyc9H8k6vWulIg+aLIz4XUZhyBEli8HvBf6el31+UnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWRxpLjODsJKtr29wDkEJKrt6ZO16VdPlczEukgeTck=;
 b=MFsYC5ShkzU2kXcQCvGRcNtZEs3YsK/3QNATsnwedaGA6ZSTg2127XpqvfohexECyNyGjaGyJU2Ix5tGsshi83JY4teQbxi+h7WaGtkWzdVVjjXSkz9DUdBHJzPlOIfhh1Au/4P4HsJJq+ftyfbqckA+5CpchsE8Kazj6iJy+Ws=
Received: from BN0PR04MB8048.namprd04.prod.outlook.com (2603:10b6:408:15f::17)
 by BL0PR04MB4642.namprd04.prod.outlook.com (2603:10b6:208:47::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 09:07:11 +0000
Received: from BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::6b00:5ef5:d216:6837]) by BN0PR04MB8048.namprd04.prod.outlook.com
 ([fe80::6b00:5ef5:d216:6837%5]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 09:07:10 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH 1/3] f2fs-tools: give less overprovisioning
 space
Thread-Index: AQHY5GNVMadqEopFxkmBlN4xT4NqfQ==
Date: Thu, 20 Oct 2022 09:07:10 +0000
Message-ID: <20221020090708.tiysx3qsgatb3ngv@shindev>
References: <20221010221548.2728860-1-jaegeuk@kernel.org>
In-Reply-To: <20221010221548.2728860-1-jaegeuk@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR04MB8048:EE_|BL0PR04MB4642:EE_
x-ms-office365-filtering-correlation-id: b39749bf-3c74-4de3-557f-08dab27a78cd
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JXEks6hZRu8pqcPhvzj1kSyjYf6+cupgRcQIYI5TT7mO9TPNVCzVW8GdGZpmMijaKNw7AWzMByMQk1snfjazxzaGIY/qfgjM3YB+8ExZ4+i/cPfY2McKU5Aj+ziToezGbhjbS2QxrFnjnu0xsbqLMMnXhApD/dWK9HBRhwnqLAEdDYSB03J9OKXSOMXXkqDTQp6qvf3adtopkTg5AofWNCxsMvqXTj0nMTw1mGQxd7v70prvpDmckaNuLSFT4PSWrHrN1/Jh0FmX+pe8+xEJ275zGfjnCUvQyio3RlwiAjzlh5rV4qHAWvZDVvouiLo9hLElWCuhvxj2Wco21QO01n+1+pJU5YWPKX2iVPLtbm8jHWZfb7Au7DDNzlFfqDYeMh46XXGF775kBspq4leblJZ/Z2dqPoQoLX0AsnB2GEzjgfexfR4QMjg3cVSdaKJjbq36XJT1G/kotPbj3JgHuaXlhBIHCWdwlLeucvDCz1/XnzydHYC25ASYAyt+eQS1e+tf1EtfNcMvX7RFGLYL10sb1N12cEvaWCNOAssmb7GkB8dPq72lHFZJ+Az3cDJQHsVSLKNVAyLOq+kcG7HmKa2oKWOpwXcgrYb7I9bWO6SoufUm5xfbXIYQjVhsRQ8qyq05C4r3cyw4Dab4ILn7YkdYaQk1DeEeTC8YOF8CIAfFCuKlaFiSYHBQC3eQE6B2uOEsfj6TS9Q9VNq6/c3dV6KIwT8s2YwsQ5pB0BSev3ewHkgMfVnqgSDmgAOTV2pbmkeWp2iHf5Wv7XTzaYhKfg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR04MB8048.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(7916004)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(86362001)(82960400001)(122000001)(38070700005)(38100700002)(83380400001)(5660300002)(1076003)(44832011)(186003)(9686003)(26005)(478600001)(6506007)(6512007)(33716001)(2906002)(64756008)(316002)(8936002)(6486002)(6916009)(41300700001)(76116006)(66476007)(54906003)(4326008)(66556008)(8676002)(66946007)(66446008)(91956017)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ybi9PRsWYAB2VT6wIjXlcfMeRY9t5syH5QSWD5temaCo+opnRqYC95ckFVf1?=
 =?us-ascii?Q?Oth8pVx0kQFZ3vC55WSYBVVTkKYDGslHc4EZNxbs3UK3mMSQkivHsGJmMfAf?=
 =?us-ascii?Q?4UoMAATC8QJRnSF8wAjjcKwOHXNPL/LQ1EE5IwXBFkB+CEgiS0ZqrE6S9ivu?=
 =?us-ascii?Q?23+dLwzBG92oSQ2QjzBaJnukqnOk/0AVYuwD2oiqvgGqtdl4FUvnYBNuyNPG?=
 =?us-ascii?Q?huUluPfXkQbWxNFdQJdJW1QiwVEWdrYh9IIhBbqxCwN5p5IDcS55f5RURgpy?=
 =?us-ascii?Q?nYlH+rmN+j2GUX7Htf6zcKN6ztRqnLyOymNzV2GluYarAsWkoVVW+MXTbEHf?=
 =?us-ascii?Q?J/tqPfGTFOSHHdnJDOUikEFfKtc+ZDs8Zn4ynqqTkRZnmgNJKJkRwrxx2I2A?=
 =?us-ascii?Q?kSeztgUxJ72B+DlbU5JDDtTC/0SaOkd5gl12+DhesXNao+QGYMcg5YacvguT?=
 =?us-ascii?Q?wqqBcPynQirpZ1VArmY498fSxerZC/LfQBBj8qu6V5PJ4951RpwaEcUzWzl2?=
 =?us-ascii?Q?gv5xPmxUaFwmpRHSxteV6C3TYkjzGV/w/nU8GCeyqxZC705Zn+ySWZ39dgO5?=
 =?us-ascii?Q?WiDoMWQGxEUvcDU57l1d3dLvR+RhyzDoswMZBYpCt8EJ137oGSCXVp6EXi7k?=
 =?us-ascii?Q?a7mKgA2m0u7HbTvZfm3JyQpj5B737IQV9hdG/J+EFrkUonL9B+XoxfY4o/1y?=
 =?us-ascii?Q?nJV4K4zXSSAh2GQ5VxatjabGMdJoPGs1uqyqtApM968ZxyOoxCK4S02aiYJn?=
 =?us-ascii?Q?tvyknmQHJFfxGiAxXi2lSjkYwprF2rDXAGIWEpfuLdtxj+eqCcjg61Xp1ddX?=
 =?us-ascii?Q?xcBaB41d5XFKib3aaj9pFB4Gw85afhqUS/i2c5Q9gMXhPN2hqAPfHBASjeZZ?=
 =?us-ascii?Q?To1q3zVgRTYGAE8ajwPymc1Xgd8yL2wX0hzn9TCXU0/y53ww+cZrhHOgN8Jo?=
 =?us-ascii?Q?ajHjwN/bOiCC49YY7NSqAm4N0VONMbNqf6ZYZocJtp+Pb50p1S4R63dCN37s?=
 =?us-ascii?Q?A5TB79f/pgXsyIcC2DzaBp72Vu9sXtV4Gd2enzMcq2G4C67GvmBrrJVbj9ba?=
 =?us-ascii?Q?02YfHgQT29iY30G0qXeSYufWFNvHQfTBA7Oh1Ebkn5RHpS57SG3HyzDC1HRo?=
 =?us-ascii?Q?J2m3x+lJRX/YgMwH9YyB4zHUPj7XDsJV1QoqoFpfwVk99mREircew/HdDhvR?=
 =?us-ascii?Q?vRGiGoxj8g8odQekujzlShyHFgr3vPZ4PQ/BsX+FD7WjCams8sA9+0k9ZTzz?=
 =?us-ascii?Q?DVvGUIGTdY1P1sQP7qqw772YVy2CTnSQfsRkFnnaLLZ1bHhK26DFluwrQgVo?=
 =?us-ascii?Q?eA0fuA+9meOGEH+U7k3UGzDcS1UhbCrAehbsGbjDcGF0G4sFRoO5l1Br2cID?=
 =?us-ascii?Q?woKeHIzlqlK+crvxdkT3nNq9PfMQ9kAg6Fs1VLO61GeNzmsr6s8Wic9Us0wa?=
 =?us-ascii?Q?gclEuVJ/lt8D8AdQCHF8U3+EbVxxkSH9VMRhMqzHx4xKtDj5R7UUEBquleSq?=
 =?us-ascii?Q?hqdIlchMwAneJDM17zOaFaV3c2rNhifl1lZrYVVh4oWqiND1ec+i8Y0cgzes?=
 =?us-ascii?Q?npOvK8wBzn8JUf0KvtENufvMbF4q+6SuoB56YhjIcRjuU96ZKxaIEFQ5fdhL?=
 =?us-ascii?Q?WnJElTJZ9OcYuass9hmbB60=3D?=
Content-ID: <788051AAFD18094D8F3386326B82D566@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR04MB8048.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39749bf-3c74-4de3-557f-08dab27a78cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 09:07:10.8510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQXBw04LCFucv2mrjFmV0SseQryYr+fRwYFfO1Fk4dS71CEnXY3gZDzcqL+iIYP0hnTcxstfveWc1Wdn+K9AHcw0SVITEOl12p+L0WOnZgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4642
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Oct 10, 2022 / 15:15, Jaegeuk Kim wrote: > As f2fs becomes
 more resilient for GCs, let's give the marginal overprovision > space back
 to user. > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> Hello Jaegeuk,
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [216.71.153.141 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1olRlH-00016u-II
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

On Oct 10, 2022 / 15:15, Jaegeuk Kim wrote:
> As f2fs becomes more resilient for GCs, let's give the marginal overprovision
> space back to user.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Hello Jaegeuk,

Using the dev branch of f2fs-tools repo, I observed mkfs.f2fs failure with zoned
block devices:

        Error: Device size is not sufficient for F2FS volume

I found this patch in the branch triggers it. I also observed the same failure
is observed with non- zoned regular block devices when I specify -s options to
mkfs.f2fs command. With these conditions, number of segments in each section is
not zero, and it increases the number of reserved segments. My understanding is
that it makes reserved segments larger than overprovisioning segments all the
time in the loop of get_best_overprovision(). Then get_best_overprovision()
returns 0% overprovisioning ratio. Hence the error.

Could you take a look for fix?

FYI, I tried to fix and created a patch which allows reserved segments larger
than overprovisioning segments [1]. It compares those two, and take larger one
to subtract from usable segments to get the segments for users. I confirmed it
keeps small number of overprovisioning segments for no -s option case, and
avoids the mkfs.f2fs failure for the -s option and zoned block device cases.
However, it increases runtime of my test script which fills f2fs and do file
overwrites to test f2fs GC on zoned block devices. It takes +60% longer runtime.
Then GC performance looks worse than before, and this fix does not look good
for me.

[1]

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 8ca574a..4902953 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1634,9 +1634,10 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 		reserved = (100 / candidate + 1 + NR_CURSEG_TYPE) *
 				round_up(usable_main_segs, get_sb(section_count));
 		ovp = (usable_main_segs - reserved) * candidate / 100;
-		if (reserved >= ovp)
+		if (ovp < 0)
 			continue;
-		space = usable_main_segs - ovp;
+
+		space = usable_main_segs - max(reserved, ovp);
 		if (max_space < space) {
 			max_space = space;
 			max_ovp = candidate;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index c314d1c..08f4e66 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -764,11 +764,8 @@ static int f2fs_write_check_point_pack(void)
 	set_cp(overprov_segment_count, (f2fs_get_usable_segments(sb) -
 			get_cp(rsvd_segment_count)) *
 			c.overprovision / 100);
-
-	if (get_cp(rsvd_segment_count) > get_cp(overprov_segment_count)) {
-		MSG(0, "\tError: Wrong overprovision ratio\n");
-		goto free_cp_payload;
-	}
+	if (get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
+		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
 
 	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
 		MSG(0, "\tError: Not enough segments to create F2FS Volume\n");

-- 
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
