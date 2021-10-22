Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 974164370A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Oct 2021 06:08:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdlrK-0007qx-SR; Fri, 22 Oct 2021 04:08:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mdlrJ-0007qi-6y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Oct 2021 04:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9HGkZEPLdfZaVcG1s6atX1u4tvbNHrC8HHVmZOYNKyc=; b=GysxNpII3gmctM5wxDFMTWomrJ
 UNbkLAMF3JovqFzuU9gMKT31EVfIOkYi0iCM3NspEfKspxxP6Ig2PXXtRDCxcGP3wbNKycaUekYh1
 YDAkfM+8TdCLacMksBXYSBaSQHqdTLgiUd5HWsWYHpM/OGKmjfIkfNBVNBGtVNahx2pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9HGkZEPLdfZaVcG1s6atX1u4tvbNHrC8HHVmZOYNKyc=; b=HE+jA+fioLRrhQA4X39t4BzzgG
 Tln2LjnSXSdlbMgfPUHczHsw16XGvnl29jAoMaxw0yR+NOU8FiIm7FpAUT36VT15u+BT1eOznfsKO
 hq5PXRqzC+KnlbnJBvcqwzg/MP5iDGnDyC9/pni39IwU9jH3Uebb/OIufwE+ODNFjMsM=;
Received: from mail-eopbgr1300123.outbound.protection.outlook.com
 ([40.107.130.123] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdlrE-0000X3-54
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Oct 2021 04:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbPCbSdBzpOPLJuhlsHt9P1VjnzJU0UGlNRC/yZ4wh0LCgn64Kjvf4FEYvYaQjIuRYFrn+ghKLf0f+N7TRIFNOyz+JFuM/ju6ETEsOtuAWYhob95fa3eb4Z8DuUHIa6ZLx+Pfl8SciESz7sQOpTrss9X6uMCm8MFlPtCf1tovJxE4mGqBISHpeBNdYesz7Hsu+0LfVYxwZZLtlQNByuw8L+3id2CeEZX9A2K27K9QnyAG58KDdpfUQHazHVrvSP5cv97JkYTNcdyiHvyD158x1cJR0/wwvL2sJKAXA1l3KOhNtZakClLSfbzcbjSQXzthIv1txYV916AU7h63IRYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HGkZEPLdfZaVcG1s6atX1u4tvbNHrC8HHVmZOYNKyc=;
 b=aM76ZCYRprMQaQUEc8JZZAPeCUvrFOG/hqV+uQPJE547DJOkiC8d3PYg6r+X90rKNgMAMvbuVL9g+ZO05omkpFkgzMd3MzMYKWE6r2b4vb69sVl57HsbmBiEalTP0VzyQcP+LX0fBrEKa2RFn+4haBIrQ+dw1ZQrwyz9K2n1pvcU+ffOeZJbf8O5KFRnGb0261krIvX6oxpASSRwhC7zbz1o95C2vVGX8UDYTd6KYZyhGy2b3WlP9RK+z6O7nt7edMU7vQIGe9W56mFGL665Npk8q/XVBx+vr0mOF/IxhxXB3x8tUzdWake9qm095JILE5aTL9W5Xyu+aN+rdHct3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HGkZEPLdfZaVcG1s6atX1u4tvbNHrC8HHVmZOYNKyc=;
 b=nEQGRjCrazCpA+p0V/aaH3xzUzZc9jpxZ5qLFsAI8j0FCphwf6JOYMNek7RuF5j40k8T1bMdeqMRIOmilABUojgHkF6pp3WaKhGfruTdk8KKxEQ8uDq9ZdOXBygAk2PbVp6rPSXDBkZKDwUlN7P460d/+CJQU0/k50ZYfbQECLg=
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3702.apcprd06.prod.outlook.com (2603:1096:820:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 03:53:31 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%7]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 03:53:31 +0000
From: =?utf-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: compress: fix overwrite may reduce compress
 ratio unproperly
Thread-Index: AQHXwP1BmcC3pMGSX0Gm1M9Axju2nqvdj00AgADfOdA=
Date: Fri, 22 Oct 2021 03:53:30 +0000
Message-ID: <KL1PR0601MB400315B2DF6D387710992297BB809@KL1PR0601MB4003.apcprd06.prod.outlook.com>
References: <20211014131243.148009-1-changfengnan@vivo.com>
 <ALgAyADvEmTgm6EcRRwmGaoi.9.1634826831858.Hmail.changfengnan@vivo.com>
In-Reply-To: <ALgAyADvEmTgm6EcRRwmGaoi.9.1634826831858.Hmail.changfengnan@vivo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f78494c9-076d-42e2-3bc7-08d9950f8364
x-ms-traffictypediagnostic: KL1PR0601MB3702:
x-microsoft-antispam-prvs: <KL1PR0601MB37029238BE817323B0C6B219BB809@KL1PR0601MB3702.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BdaV8Y/Fmr6GWZ8M3BWnZ2wwiWdedaIoInpu1vJ5K2gUUrRR7VLVTfyyDUQTy1OT/1TTGsZR5n+Aq/op/JignlQ5ohmKDbQ0PdFpCB0Kx4rJoRPL07KXxFL5ci2kUKxQpuNVqf+eGdlGYOyn6hr5pU5cYGiT52UvlJfPcjIZr+6Yben0qWVaHldGZM2/ZNVjYKEAP7GL/cipplfwarGv5fZE8+kiDsuCH5VjiYvIpfR9ynwYtW44tOHTmJ9cZuMV8mdRdT8OYLW5S42on8uQvXIs8yY5+UtAxJc34ZrXyQkV5Ul3BIyBR6lLJ+vEcWhssUpd8YZIxMAYRCbfZF3rPfDX5638euVQ/JaYJo/5a5H2Z79V0EOKlFIqu5xNOkNW53UgtMUo7yCj04eOdzy5L36F6wLMLsa9BmXNyR4EgVVNk5+XeAHY7pq3KvFRt0wraomCbxytE9xGWUQk9Becm/FQ9ckK1dgXEMFTf1RpyFI6ur7GdKGVYSzVsq3Rs9wze9rAJco1VihXMFnTAc8qdrKcs12gf+UoKWXnlu7y/VagnnE4etxojE4aWsWAlRU8g2oQ7qJiIh5mMSTXswPjRdcdx6UjJZ9UjoAzI8caQU1iR0EM62c5HT60edUK0uwMjsw1pWxPHw1n4ynV3RtyJ/6DV3MixSfCmPigkAU76dBfZ8VmjnR6YfAxDrU0dSp4QBlg/fLfqOkNFsttzveW8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(83380400001)(9686003)(8936002)(6506007)(2906002)(53546011)(8676002)(52536014)(122000001)(5660300002)(38100700002)(316002)(33656002)(55016002)(7696005)(71200400001)(85182001)(4326008)(38070700005)(26005)(508600001)(86362001)(186003)(66946007)(66556008)(66446008)(64756008)(66476007)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVRFZFJRQUFPbjdXNEt3d285Z3RlK1J4Rk9DR3VucS9adUxiTk90RWNqQnl6?=
 =?utf-8?B?cnNOU2gxano4R3c5YzNrNWRVZGtwR1VGNUxNTzdzS1dTcno2VFVEVG5YZklM?=
 =?utf-8?B?RWRwWFM0UXh4WS9KcC85UkNTMld1NGg1cEF1d3hUSDBWbGZxWWJya1hiS1dk?=
 =?utf-8?B?azZrN0kwZWtkRXNBU2ZiTS9zTTJQQXh3VWdQVWFabHpCaVprdnU3VHpJbEx3?=
 =?utf-8?B?VjRqRnd3Mm4zMGpqdS9RL1FJUlNCdDJpNE91QzJmeVRNeEt0bUdMZUpaTjkv?=
 =?utf-8?B?YnBGdVJpa3J0UFJEcERQZVhZdmI5NE5Ld0t3ejVWOXdqTGVLaWNVcjNnVE5n?=
 =?utf-8?B?M3dNTzBoYkRSYUJLdnlDRlcvanNGWUFRVk9XOTBYUE04RElZWlFwZWh2OGZj?=
 =?utf-8?B?L2JkTDB4ZVU1dXNld3liSXJiSHBvVGsxTWhSV0ZVZWdsOUhJOWpGWWxJeUJy?=
 =?utf-8?B?S3JlWnVxRjg3ZTdhZUMwV0svYzgzMmRsQnJmL2lnK1ducUNBbmtQZUlLaFF0?=
 =?utf-8?B?UXEvOG92dHdNQm1iZzhBNlJuVTh0WUFTTDFRNll5bS9WQm1oSWlnQlEwbGM5?=
 =?utf-8?B?KzY1OGt0UEJXbmtjZFhLaWNzdExrSkEvWnAvOWtNbzdFejQ3ZVFxdXBpQS83?=
 =?utf-8?B?bS8vQXVGY1NZd3BCd05HeFFTRFllN3NNYlFRK1ZSL1V0dXFqa2NKU1BMeDg1?=
 =?utf-8?B?Wm40aEpJcXcwZkMvTGVDd1ppM2p3OEFFM3JORStrTHJ1RHVaNWlWMmF3VTY3?=
 =?utf-8?B?ODJ2UGpqbFJORHJUUW1jUmRXbktBay9wQ0xUVHNYaEY0YXE3UWdYR0xLc1M0?=
 =?utf-8?B?Vkl4TFUzYko3RUdEbjM3Z2UxVitLZ3JwTlNPNnlRN2pUVHRMcW1rZ0hTeUZN?=
 =?utf-8?B?a09pTFcvbEhheXh6WFFYU1c1L1F1SmZRemx5T3lkd1ZsL2VUZ2lpM01BK1A0?=
 =?utf-8?B?K1lJdjQwRzQ1WnFRT09JTVFxV09PelcrNGRaQnBwaXNxSFg1MUZrNFhsRmY1?=
 =?utf-8?B?YnBqblRBSmZhR0VpOGQrbHY0a3JZb05PcXpRU3h0dmhBL0VGYXQzSmdKZmY1?=
 =?utf-8?B?cmNHTlF6djdEY1BURTBVa2dTL2dGdGRnMmdSV21HbFpENTd0YjhDaTQwbFVy?=
 =?utf-8?B?L3BlbWhUWFlEMlljV3lldnNpbXNSTElKdEcvMGJVdlc5bkRVeDZSUnNxSElh?=
 =?utf-8?B?MG5ZNk1BV1k2Yy9mSzBZcWtQVkhnWVdJam9zdThaTWNSKy9oSlhhUVRyenRl?=
 =?utf-8?B?bFdvaWQwdW0xbnNLcDdRMUFQNzJEaXRnRld2U3J4ck1Uc2hXeFlSc1J6eTRl?=
 =?utf-8?B?a1oxRE53NEYrWkVVNXdrWlpWV0FxRnRPV2xhWFJtU1lUUXNTK3RvVXM3Qkdv?=
 =?utf-8?B?QXhmS2JxaittRDA2enpTWFJXdERuYUZ0bmNjQmdDVjZrTVh1aEdiT3JHV3pH?=
 =?utf-8?B?S0RlLytjY2hMRFlleS9WckkyOTZqd3VrQVgvYUxvU2JzZzhkRkFNUWhsczV3?=
 =?utf-8?B?T3NBTWdtanBJcnUyMXZrRzJtOVZucGhUNUYvaTZTNUNXNGJkQkJMR3E5YVo2?=
 =?utf-8?B?eGhBNFVyWVlZcE90VDBCTjlIQVlmZTBRYUNBalNrZGt1cVBnY01yNXdtMVdv?=
 =?utf-8?B?MjJOUGIxWDVIYjhITzJseDZLZWxZaTJaOUhROHNKYnp5OTAwTG1qOWcvUUNK?=
 =?utf-8?B?ZXlZOFFMWVZscWFORGVpeHAxKzdYRDZ4a1VOeit4ZjhRcUM4N2hkQTgzU3c0?=
 =?utf-8?B?aDliSW1FeWNYZFdBT200YXBYQ0EyNnJtUU5Bd2Z2cDQvTllZVmJJZkd1Q1I1?=
 =?utf-8?B?bU5FTjhZQU5yN05XN01aZlhUV1gzTnMyK1VXeXREdzVuaFR5VDhHcU45NldM?=
 =?utf-8?B?RTFvYWlFZ1RIOVNJMWhLUkRwR254ZU1xdGdxTDN3dFArUXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78494c9-076d-42e2-3bc7-08d9950f8364
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 03:53:30.8290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 11126892@vivo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3702
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.123 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.123 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1mdlrE-0000X3-54
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogY2hhbmdmZW5nbmFuQHZp
dm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+IE9uIEJlaGFsZiBPZg0KPiBDaGFvIFl1DQo+
IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDIxLCAyMDIxIDEwOjM0IFBNDQo+IFRvOiDluLjlh6Tm
paAgPGNoYW5nZmVuZ25hbkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZw0KPiBDYzogbGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2Ml0gZjJmczogY29tcHJlc3M6IGZpeCBvdmVyd3JpdGUgbWF5IHJlZHVjZSBjb21wcmVzcw0K
PiByYXRpbyB1bnByb3Blcmx5DQo+IA0KPiBPbiAyMDIxLzEwLzE0IDIxOjEyLCBGZW5nbmFuIENo
YW5nIHdyb3RlOg0KPiA+IHdoZW4gb3ZlcndyaXRlIG9ubHkgZmlyc3QgYmxvY2sgb2YgY2x1c3Rl
ciwgc2luY2UgY2x1c3RlciBpcyBub3QgZnVsbCwNCj4gPiBpdCB3aWxsIGNhbGwgZjJmc193cml0
ZV9yYXdfcGFnZXMgd2hlbiBmMmZzX3dyaXRlX211bHRpX3BhZ2VzLCBhbmQNCj4gPiBjYXVzZSB0
aGUgd2hvbGUgY2x1c3RlciBiZWNvbWUgdW5jb21wcmVzc2VkIGV2ZW50aG91Z2ggZGF0YSBjYW4g
YmUNCj4gY29tcHJlc3NlZC4NCj4gPiB0aGlzIG1heSB3aWxsIG1ha2UgcmFuZG9tIHdyaXRlIGJl
bmNoIHNjb3JlIHJlZHVjZSBhIGxvdC4NCj4gPg0KPiA+IHJvb3QjIGRkIGlmPS9kZXYvemVybyBv
Zj0uL2Zpby10ZXN0IGJzPTFNIGNvdW50PTENCj4gPg0KPiA+IHJvb3QjIHN5bmMNCj4gPg0KPiA+
IHJvb3QjIGVjaG8gMyA+IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcw0KPiA+DQo+ID4gcm9vdCMg
ZjJmc19pbyBnZXRfY2Jsb2NrcyAuL2Zpby10ZXN0DQo+ID4NCj4gPiByb290IyBkZCBpZj0vZGV2
L3plcm8gb2Y9Li9maW8tdGVzdCBicz00SyBjb3VudD0xIG9mbGFnPWRpcmVjdA0KPiA+IGNvbnY9
bm90cnVuYw0KPiA+DQo+ID4gdy9vIHBhdGNoOg0KPiA+IHJvb3QjIGYyZnNfaW8gZ2V0X2NibG9j
a3MgLi9maW8tdGVzdA0KPiA+IDE4OQ0KPiA+DQo+ID4gdy8gcGF0Y2g6DQo+ID4gcm9vdCMgZjJm
c19pbyBnZXRfY2Jsb2NrcyAuL2Zpby10ZXN0DQo+ID4gMTkyDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBGZW5nbmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+DQo+ID4gLS0tDQo+ID4g
ICBmcy9mMmZzL2NvbXByZXNzLmMgfCAxMiArKysrKysrKysrKysNCj4gPiAgIGZzL2YyZnMvZGF0
YS5jICAgICB8ICA3ICsrKysrKysNCj4gPiAgIGZzL2YyZnMvZjJmcy5oICAgICB8ICAxICsNCj4g
PiAgIDMgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYyBpbmRleA0KPiA+IGMx
YmY5YWQ0YzIyMC4uYzRmMzZlYWQ2ZjE3IDEwMDY0NA0KPiA+IC0tLSBhL2ZzL2YyZnMvY29tcHJl
c3MuYw0KPiA+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYw0KPiA+IEBAIC04NTcsNiArODU3LDE4
IEBAIHZvaWQgZjJmc19lbmRfcmVhZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IHBhZ2UNCj4gKnBh
Z2UsIGJvb2wgZmFpbGVkLA0KPiA+ICAgCQlmMmZzX2RlY29tcHJlc3NfY2x1c3RlcihkaWMpOw0K
PiA+ICAgfQ0KPiA+DQo+ID4gK2Jvb2wgaXNfcGFnZV9zYW1lX2NsdXN0ZXIoc3RydWN0IGNvbXBy
ZXNzX2N0eCAqY2MsIHN0cnVjdCBwYWdldmVjDQo+ID4gKypwdmVjLCBpbnQgaW5kZXgpDQo+IA0K
PiBGZW5nbmFuLA0KPiANCj4gSXQgbmVlZHMgYWRkIGYyZnMgcHJlZml4IGZvciBub24tc3RhdGlj
IHN5bWJvbCB0byBhdm9pZCBnbG9iYWwgbmFtZXNwYWNlDQo+IHBvbGx1dGlvbi4NCj4gDQo+IEFu
eXdheSwgaG93IGFib3V0IHRoaXM/DQoNCkl0IGxvb2tzIGdvb2QgZm9yIG1lLCB5b3UgY2FuIG1h
a2UgdGhpcyBhcyBWMy4NCj4gDQo+IC0tLQ0KPiAgIGZzL2YyZnMvY29tcHJlc3MuYyB8IDE5ICsr
KysrKysrKysrKysrKysrKysNCj4gICBmcy9mMmZzL2RhdGEuYyAgICAgfCAgNyArKysrLS0tDQo+
ICAgZnMvZjJmcy9mMmZzLmggICAgIHwgIDIgKysNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9j
b21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5jIGluZGV4DQo+IGMxYmY5YWQ0YzIyMC4uMTVk
OWI4OWQ0ZGYwIDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMNCj4gKysrIGIvZnMv
ZjJmcy9jb21wcmVzcy5jDQo+IEBAIC04ODEsNiArODgxLDI1IEBAIGJvb2wgZjJmc19jbHVzdGVy
X2Nhbl9tZXJnZV9wYWdlKHN0cnVjdA0KPiBjb21wcmVzc19jdHggKmNjLCBwZ29mZl90IGluZGV4
KQ0KPiAgIAlyZXR1cm4gaXNfcGFnZV9pbl9jbHVzdGVyKGNjLCBpbmRleCk7DQo+ICAgfQ0KPiAN
Cj4gK2Jvb2wgZjJmc19hbGxfY2x1c3Rlcl9wYWdlX2xvYWRlZChzdHJ1Y3QgY29tcHJlc3NfY3R4
ICpjYywgc3RydWN0IHBhZ2V2ZWMNCj4gKnB2ZWMsDQo+ICsJCQkJCQlpbnQgaW5kZXgsIGludCBu
cl9wYWdlcykNCj4gK3sNCj4gKwl1bnNpZ25lZCBsb25nIHBnaWR4Ow0KPiArCWludCBpOw0KPiAr
DQo+ICsJaWYgKG5yX3BhZ2VzIC0gaW5kZXggPCBjYy0+Y2x1c3Rlcl9zaXplKQ0KPiArCQlyZXR1
cm4gZmFsc2U7DQo+ICsNCj4gKwlwZ2lkeCA9IHB2ZWMtPnBhZ2VzW2luZGV4XS0+aW5kZXg7DQo+
ICsNCj4gKwlmb3IgKGkgPSAxOyBpIDwgY2MtPmNsdXN0ZXJfc2l6ZTsgaSsrKSB7DQo+ICsJCWlm
IChwdmVjLT5wYWdlc1tpbmRleCArIGldLT5pbmRleCAhPSBwZ2lkeCArIGkpDQo+ICsJCQlyZXR1
cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIHRydWU7DQo+ICt9DQo+ICsNCj4gICBz
dGF0aWMgYm9vbCBjbHVzdGVyX2hhc19pbnZhbGlkX2RhdGEoc3RydWN0IGNvbXByZXNzX2N0eCAq
Y2MpDQo+ICAgew0KPiAgIAlsb2ZmX3QgaV9zaXplID0gaV9zaXplX3JlYWQoY2MtPmlub2RlKTsg
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jDQo+IGIvZnMvZjJmcy9kYXRhLmMgaW5kZXggMTRm
ZTVjNjIxNmNjLi5iMDY2NWY2OWMwOTMgMTAwNjQ0DQo+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jDQo+
ICsrKyBiL2ZzL2YyZnMvZGF0YS5jDQo+IEBAIC0zMDc1LDkgKzMwNzUsMTAgQEAgc3RhdGljIGlu
dCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKHN0cnVjdA0KPiBhZGRyZXNzX3NwYWNlICptYXBwaW5n
LA0KPiAgIAkJCQkJCWRvbmUgPSAxOw0KPiAgIAkJCQkJCWJyZWFrOw0KPiAgIAkJCQkJfSBlbHNl
IGlmIChyZXQyICYmDQo+IC0JCQkJCQkhZjJmc19jb21wcmVzc193cml0ZV9lbmQoaW5vZGUsDQo+
IC0JCQkJCQkJCWZzZGF0YSwgcGFnZS0+aW5kZXgsDQo+IC0JCQkJCQkJCTEpKSB7DQo+ICsJCQkJ
CQkoIWYyZnNfY29tcHJlc3Nfd3JpdGVfZW5kKGlub2RlLA0KPiArCQkJCQkJCWZzZGF0YSwgcGFn
ZS0+aW5kZXgsIDEpIHx8DQo+ICsJCQkJCQkhZjJmc19hbGxfY2x1c3Rlcl9wYWdlX2xvYWRlZCgm
Y2MsDQo+ICsJCQkJCQkJJnB2ZWMsIGksIG5yX3BhZ2VzKSkpIHsNCj4gICAJCQkJCQlyZXRyeSA9
IDE7DQo+ICAgCQkJCQkJYnJlYWs7DQo+ICAgCQkJCQl9DQo+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oIGluZGV4IDdhMzJjMjEyNzk0NS4uYjhkYTM0MTk4Y2Uw
DQo+IDEwMDY0NA0KPiAtLS0gYS9mcy9mMmZzL2YyZnMuaA0KPiArKysgYi9mcy9mMmZzL2YyZnMu
aA0KPiBAQCAtNDA0Nyw2ICs0MDQ3LDggQEAgdm9pZCBmMmZzX2VuZF9yZWFkX2NvbXByZXNzZWRf
cGFnZShzdHJ1Y3QgcGFnZQ0KPiAqcGFnZSwgYm9vbCBmYWlsZWQsDQo+ICAgCQkJCQkJCWJsb2Nr
X3QgYmxrYWRkcik7DQo+ICAgYm9vbCBmMmZzX2NsdXN0ZXJfaXNfZW1wdHkoc3RydWN0IGNvbXBy
ZXNzX2N0eCAqY2MpOw0KPiAgIGJvb2wgZjJmc19jbHVzdGVyX2Nhbl9tZXJnZV9wYWdlKHN0cnVj
dCBjb21wcmVzc19jdHggKmNjLCBwZ29mZl90IGluZGV4KTsNCj4gK2Jvb2wgZjJmc19hbGxfY2x1
c3Rlcl9wYWdlX2xvYWRlZChzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywgc3RydWN0IHBhZ2V2ZWMN
Cj4gKnB2ZWMsDQo+ICsJCQkJCQlpbnQgaW5kZXgsIGludCBucl9wYWdlcyk7DQo+ICAgYm9vbCBm
MmZzX3Nhbml0eV9jaGVja19jbHVzdGVyKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbik7DQo+ICAg
dm9pZCBmMmZzX2NvbXByZXNzX2N0eF9hZGRfcGFnZShzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywg
c3RydWN0IHBhZ2UNCj4gKnBhZ2UpOw0KPiAgIGludCBmMmZzX3dyaXRlX211bHRpX3BhZ2VzKHN0
cnVjdCBjb21wcmVzc19jdHggKmNjLA0KPiAtLQ0KPiAyLjMyLjANCj4gDQoNCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
