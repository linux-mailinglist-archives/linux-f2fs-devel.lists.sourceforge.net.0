Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B568A301
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 20:29:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pO1km-00085c-V3;
	Fri, 03 Feb 2023 19:29:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sanan.hasanov@Knights.ucf.edu>) id 1pO1kl-00085V-2S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 19:29:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sQM9rlXMUu9gfe8YFTJWy72aP92xNgwICYYfE8EX5nI=; b=WS7p/oZaGywUa1e5/MoAg0K6SJ
 fA7zzhl6vbOod3DrUBhQKng7fm0hSwM2IVnpEUoMRwX37v038aELFo547bAXRmK6SDFgTEcHsaVz+
 A5x8fCBlZHo/o6CNnJYD8CyIQ84QrZnGjr4yaaZde7HYQcNaVZC/7Ta/3YRLxCRDV6kI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sQM9rlXMUu9gfe8YFTJWy72aP92xNgwICYYfE8EX5nI=; b=f
 1JPVCaJ92agAbHwPHAvgEpDe5+j8zH7IZLu1P7KyxkY89PTQhqUaOMwJ7PqtLQYZ2MbAIPWmMCBXJ
 zAqiGhpzMKjvJGw/2dKCdiVekra9VBOXFshx5zfqhirwrbfK49apR7TlOjKEHdrbv5M80NadSTEXS
 kqK48mkp/jz9KsJA=;
Received: from mail-mw2nam10on2040.outbound.protection.outlook.com
 ([40.107.94.40] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pO1kd-0001JZ-Rw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 19:29:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ViTiV3mBVO1bCGsZfLM4SAj7svfMxUKs7n5/8H6om9y+majqxaqML0xlaRSJDlcSSURjt5ORS4VRyklqAbJinPV7ZtVouuqevkqe0+vJRnloIEpE4fnbIPwSPDzNXxS5INeVR53uMWKvfxcGOHPLbiX5H8ndkhT6UP7KYS38+ZGgGIs73o6FhehmVU4IGA9bcJaY+RiJp1DOBS9HKnPm9J3Oa3vYmJeRlpiJk97Sc3ZmpxB7ID3PZnNZFBruFMWvVcTiWPx1J9dAo4MWq0EvhLuu/NEfDLCVimdM2D/s5dPG1d1tJKZu63yG7/OqN8le0IiORpE5dB6CIjUzWEwf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQM9rlXMUu9gfe8YFTJWy72aP92xNgwICYYfE8EX5nI=;
 b=oNhy3jY8ywE1dWfhzGYETUQak4sQjVbMkhej/bbbib2qqy3t9B+WWahYpyI9y3ETbP5y7mpReB3qPUitIr0GDArR7wzW7BLYmCb2VDmHMuvGJYUpht1wyscI2jwdzFXmiz+TWy03TmnNkOGqZSwg0cnPk5R3ULC2rNk5lmixhe/t3i5TlN38E0SfLk0WGXQ1IKdRcJpWNtvQcLYfS7TFr4o9cu0t2yjXtNdcU1/+pDSFK/s9mb28GsxqOKu+OEIXGEtaUX6mkjrGvRYPCAUAV6mdTS6dBxjMJJMTTITefoCEfAsZ93DqM6dFCRio6C1sOKQBl6N4cVU/TJ1lZ7oRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=knights.ucf.edu; dmarc=pass action=none
 header.from=knights.ucf.edu; dkim=pass header.d=knights.ucf.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=knightsucfedu39751.onmicrosoft.com;
 s=selector2-knightsucfedu39751-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQM9rlXMUu9gfe8YFTJWy72aP92xNgwICYYfE8EX5nI=;
 b=fGPyjjksi0ULKSuFZuKwg3WK+58H1qp2m9bSgvzjToPH2yNmcCnuzfWiZ2uqpcsxlVxcBrJkHVXtV6sp7rXr6mrxg7hi/stLw1lab+xUQ5E3lXv7ZjyOfV6asa7CDf82rQuFHlUkVl0Q6j6JIeO2iaNgFTI2Y+g0d4T/Oj1pqcE=
Received: from IA1PR07MB9830.namprd07.prod.outlook.com (2603:10b6:208:44b::14)
 by DM5PR07MB7894.namprd07.prod.outlook.com (2603:10b6:4:aa::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Fri, 3 Feb
 2023 18:56:42 +0000
Received: from IA1PR07MB9830.namprd07.prod.outlook.com
 ([fe80::d883:f078:37f:dace]) by IA1PR07MB9830.namprd07.prod.outlook.com
 ([fe80::d883:f078:37f:dace%9]) with mapi id 15.20.6064.024; Fri, 3 Feb 2023
 18:56:41 +0000
From: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: KASAN: slab-out-of-bounds Read in f2fs_iget
Thread-Index: AQHZN/1XNusp4zIyiEC4U6RFRi8pVw==
Date: Fri, 3 Feb 2023 18:56:41 +0000
Message-ID: <IA1PR07MB9830A51FD5E2F4BA573EE517ABD79@IA1PR07MB9830.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Knights.ucf.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR07MB9830:EE_|DM5PR07MB7894:EE_
x-ms-office365-filtering-correlation-id: b988f760-8455-489d-6124-08db06186333
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ucB4xX3aV/vWzxJMlWV4CDPSezMRj0/V7bp3xWVosq7BTqjJrXU3ZrLH5c0IacW5Ue72Hb+Oydjeq6cVjLmWAGqPTacwjAlgijfMWEtWyYvRLB+wZutUDwflRg0apaDB97KwbsglAtQlMW7CCVh3xIAJlUPKfyStN6UFCpfOY5swAkGCla/eyOnulRPYqF/Zh3GKsj5/MYXJ1jKYHzideylqpls848vQDNyi7sdRB6jM6eNQ6Z9Ogqy3MlLf+PO0vl1inFoj7BcjlheedVnYeIL7f1OnhujElPXUpHuy9TlYN7cTIUcalYX7/j96iNxd/zAWOwt1vhysbsJmcjvhIsUL9tb15tt38zu+0tcyXz9bxHdCTwD8mmIDHdg/ej2Fjcrn6IbqHnCayj7lS1rrsCnEj5cw/RKjvbsnfuMIJ3vTwGVycpZo06z3Q7yea5QCAfkqDDjqHxIr8PXylbJZhKHVk5+EoR7D1PaBnEOFtPIe4tjFsVq7RYonTUm9s6v6o7uijapA3pxnxagDyXboB3FKOCMYyZh2c9H4EL16oyGmAhpGjt3e+fO0jU8Bra+vvqVyxlDeFDml6nLFV4ALQugwt4j9QnlQhRsY9jYtkkhGXEzgTY0hhSLZK15WutmTTkWvEnNuowq8yQImmzqpabnKiArsEwwYgHHqhcihEUwb8/OHWikEbJcDXcuPh7AHv0v0sgL4iCCOHcj6mtFOE9Lz7QjzcTs4cHvzby0fp9y6x7jXs4e99Q0xNugOZalumZDdUOByH+0jCY1eDHrREpsE0+VBmZxDC+C8vhkqpwnaov3iFJrcDkzmtNgwwPJoBvZHg/oJ7dAD3srJjjdmmg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR07MB9830.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199018)(5930299012)(478600001)(66446008)(2906002)(64756008)(4326008)(8676002)(41300700001)(52536014)(44832011)(8936002)(5660300002)(66476007)(316002)(76116006)(71200400001)(66556008)(91956017)(110136005)(54906003)(66946007)(7696005)(786003)(966005)(6506007)(83380400001)(26005)(38070700005)(9686003)(75432002)(186003)(122000001)(55016003)(33656002)(41320700001)(38100700002)(86362001)(505234007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0o6EVf4b4rxXXYg+9hsS45PlOg/cPU5K4ce0DDkvAMF/W4M4EyoNaPuXkp?=
 =?iso-8859-1?Q?Hat+61RmT2dn+ilyw0SO6D5i+H8DZEwipKMp4j2DmEeOkA6VoJBQHXQpeB?=
 =?iso-8859-1?Q?Vbz0B5/6XhmqzXI55pEUNpPB8ErjwoFkjPdm5uM75A2d7FJhqg/auANgq1?=
 =?iso-8859-1?Q?2MtFxP5B2aquHWSM8tc7RcETBnueX/RG7biUNnTJnufFsAkdpikEap9huV?=
 =?iso-8859-1?Q?2HkTS6b9ytmiQLpx+99eRJM4dQxhOZW77K9+CyeL/yEJEZRQbzxThI8fOU?=
 =?iso-8859-1?Q?vO6s+UmQJVExEya1tkZ9DrmFEgc3aZvOWWOp++4F1kWsGZQ89Cax5pFF+T?=
 =?iso-8859-1?Q?biRxBMHC2LN+BBdJZkIqVyhZdeY+JOWBWR9YLXHEImlmo3ZH5Yqy0df+qF?=
 =?iso-8859-1?Q?3LuhDVPrN6OGQr/incj0S0CkJbqmPZkc5Lxx3WuB3DaznlLuhUgqgZRvcJ?=
 =?iso-8859-1?Q?savYUj9EfoluhBHJ2wWU84wb78m5CJeeG6gKpY0nu7eDdraOEMXyZtFW+R?=
 =?iso-8859-1?Q?MoapGFaQcj0Bt2ygmSuaEvxfcR78cHJ61HJrteRMAeosq9rPJYaUPpUcPu?=
 =?iso-8859-1?Q?sLvqyLKbhnU8llBcgx5w1oMOwkU3stiFL60PFCueqHP+MN5JVVjpawlhcJ?=
 =?iso-8859-1?Q?7xV0p4DCYYIvanaE3tcI4F608C4fpVhkLrvl/falY8JStF8M2CN0mD3xxC?=
 =?iso-8859-1?Q?CY7FCIAU0i5KTyWkL9NQAfqxWTmVFJO4xSpDJvt5tkrj1S80MVJco4/kgb?=
 =?iso-8859-1?Q?Or+sLcMG5thj9pHaWfaELV6s4mabikhe8LTNgGiup621CUXfbWAtJ5KD11?=
 =?iso-8859-1?Q?+A3wku6Roaux7dZaRYP+KXiZJ/sODRZg1axkj0hy8kO7c1f7lHS+E7UuxZ?=
 =?iso-8859-1?Q?PNxd9iMD6urHzsOvk+TK8sWODL/dRqWQz4B2SPMnVr3uUfL7+JYc62y5yQ?=
 =?iso-8859-1?Q?UU7VnznrvzrQTad5R1L/Q60dHodyxt3NaZOryLQvqTRy3uxa7ZSu6+DbYQ?=
 =?iso-8859-1?Q?IF3JAtv6hxcSJLqshSKIucxjsaz+TNbZlgHanzJozoHZ8er9fMUgmVnE7P?=
 =?iso-8859-1?Q?EevtV+bwM2XnWIfkZFEQRsdnCVSra5TBQc6mZ6sQ3LtDn/CFmRxG+kOTQS?=
 =?iso-8859-1?Q?FXs2F2wtOz8NnmJnYs8wKN8Uhjc4ckW0VrON1pnbgXxP1yRLooacpvTnJB?=
 =?iso-8859-1?Q?sPHHRrxi1cy1cbksWqCEfh5HinIc88zxerfpwBWG3h0/KWV2+UhIseNsJA?=
 =?iso-8859-1?Q?oT/Cn2VpuWGlmyOq9iAjmHfV0nOQ56HLtzwzuJP3Gyi++C1om5zqnK/qLq?=
 =?iso-8859-1?Q?ep5WMibcZmXaWCWKqa7plQDa4A9o0isDMW8xjm9TTiZSzKkkz0V2UmUvUd?=
 =?iso-8859-1?Q?srHASdw6rICkraY50Bq2EtCNQXTyF98jcOctNxmy3LB6G1QyH/eFcs8Lih?=
 =?iso-8859-1?Q?aI+ofbinP59TsRGJSB73/8XjSVrtOmRfwYYSQineY2Ju0mAhRkLxGkqnvp?=
 =?iso-8859-1?Q?V33BllXUkTQaz7S+90xUF634n10aYdMUy2h+ItC3xmZfNFs6ecc0j48J7o?=
 =?iso-8859-1?Q?0P6yb3ikbzonIebxpiEDchIryKAQ4JMVFEQX6H105p26qYMaAgQyF+KxUX?=
 =?iso-8859-1?Q?QNWHLsJNqBVWhMASajIERPWVrcLSbOl8N9x6Fut7VVzwCagr0NVgHXHg?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: knights.ucf.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR07MB9830.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b988f760-8455-489d-6124-08db06186333
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 18:56:41.5881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5b16e182-78b3-412c-9196-68342689eeb7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: As1Tm56Og4HqXD0q6TXuTNnxu/CkdmlyXRdyWRC5EEyJEgRCuxDj+M2CTIkBIzZpjIL37yw9VaP3P5sDOv9UgkS+m+oVdgeR7FNqP2sYb78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR07MB7894
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Good day, dear maintainers, We found a bug using a modified
 kernel configuration file used by syzbot. We enhanced the coverage of the
 configuration file using our tool, klocalizer. 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.94.40 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.94.40 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pO1kd-0001JZ-Rw
Subject: [f2fs-dev] KASAN: slab-out-of-bounds Read in f2fs_iget
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
Cc: "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "contact@pgazz.com" <contact@pgazz.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good day, dear maintainers,

We found a bug using a modified kernel configuration file used by syzbot.

We enhanced the coverage of the configuration file using our tool, klocaliz=
er.

Kernel Branch: 6.2.0-rc6-next-20230201
Kernel config:=A0https://drive.google.com/file/d/17UnUG1E5HyCPGz_HN8--CTXXx=
SHV2e6z/view?usp=3Dsharing
C Reproducer:=A0https://drive.google.com/file/d/1SUoN_Bud8DW-FHrE4bV-azXaAd=
ITStS9/view?usp=3Dsharing

Thank you!

Best regards,
Sanan Hasanov

F2FS-fs (loop0): Magic Mismatch, valid(0xf2f52010) - read(0x0)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): Found nat_bits in checkpoint
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-out-of-bounds in f2fs_iget+0x4acd/0x5550
Read of size 4 at addr ffff888111be9bf8 by task syz-executor941/5911

CPU: 3 PID: 5911 Comm: syz-executor941 Not tainted 6.2.0-rc6-next-20230201 =
#1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014
Call Trace:
=A0<TASK>
=A0dump_stack_lvl+0x178/0x260
=A0print_report+0xc1/0x5e0
=A0kasan_report+0xc0/0xf0
=A0f2fs_iget+0x4acd/0x5550
=A0f2fs_fill_super+0x4131/0x8490
=A0mount_bdev+0x332/0x400
=A0legacy_get_tree+0x109/0x220
=A0vfs_get_tree+0x8d/0x350
=A0path_mount+0x675/0x1e30
=A0__x64_sys_mount+0x283/0x300
=A0do_syscall_64+0x39/0x80
=A0entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f5b5d4a67ee
Code: 48 c7 c0 ff ff ff ff eb aa e8 ce 05 00 00 66 2e 0f 1f 84 00 00 00 00 =
00 0f 1f 40 00 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffecd308d08 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffecd308d60 RCX: 00007f5b5d4a67ee
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffecd308d20
RBP: 0000000000000003 R08: 00007ffecd308d60 R09: 00005555ffffffff
R10: 0000000000000000 R11: 0000000000000286 R12: 00007ffecd308d20
R13: 0000000000000004 R14: 0000000000000026 R15: 0000000000000000
=A0</TASK>

Allocated by task 1:
=A0kasan_save_stack+0x22/0x40
=A0kasan_set_track+0x25/0x30
=A0__kasan_kmalloc+0x7c/0x90
=A0snd_info_create_entry+0x51/0x420
=A0snd_pcm_new_stream+0x4d2/0x1530
=A0_snd_pcm_new+0x246/0x3f0
=A0snd_pcm_new+0x3e/0x50
=A0loopback_pcm_new+0x95/0x200
=A0loopback_probe+0x294/0xe90
=A0platform_probe+0xba/0x1b0
=A0really_probe+0x236/0x8f0
=A0__driver_probe_device+0x252/0x2d0
=A0driver_probe_device+0x4c/0x1a0
=A0__device_attach_driver+0x1ce/0x290
=A0bus_for_each_drv+0x163/0x1e0
=A0__device_attach+0x1f2/0x490
=A0bus_probe_device+0x1e8/0x2a0
=A0device_add+0x10d4/0x1c90
=A0platform_device_add+0x35a/0x6f0
=A0platform_device_register_full+0x396/0x4e0
=A0alsa_card_loopback_init+0x167/0x2c0
=A0do_one_initcall+0x141/0x860
=A0kernel_init_freeable+0x5e4/0x8f0
=A0kernel_init+0x1e/0x2c0
=A0ret_from_fork+0x1f/0x30

The buggy address belongs to the object at ffff888111be9800
=A0which belongs to the cache kmalloc-512 of size 512
The buggy address is located 752 bytes to the right of
=A0allocated 264-byte region [ffff888111be9800, ffff888111be9908)

The buggy address belongs to the physical page:
page:00000000acf7864d refcount:1 mapcount:0 mapping:0000000000000000 index:=
0x0 pfn:0x111be9
flags: 0x17ffe0000000200(slab|node=3D0|zone=3D2|lastcpupid=3D0x3fff)
raw: 017ffe0000000200 ffff888100040600 ffffea000446fa90 ffffea0004470e10
raw: 0000000000000000 ffff888111be9000 0000000100000004 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
=A0ffff888111be9a80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
=A0ffff888111be9b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888111be9b80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^
=A0ffff888111be9c00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=A0ffff888111be9c80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
F2FS-fs (loop0): sanity_check_inode: inode (ino=3D3) is with extra_attr, bu=
t extra_attr feature is off
F2FS-fs (loop0): Failed to read root inode


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
