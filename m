Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F15699F16
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 22:44:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSm3P-0001Ac-8P;
	Thu, 16 Feb 2023 21:44:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sanan.hasanov@Knights.ucf.edu>) id 1pSm3N-0001AV-II
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 21:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xELoV7fEIl1h0VtrM0t+Az4Ubh0u+MJ/edQYk8448lA=; b=mm0p+/8DxWlwcdv/J/mjqlvTDo
 qi+EP3mMbaLSjN17coR8VL08veeCJo9qsb1upRqiQP+kPBDJJrldZriE4lx5v4yDaL8Pg1KhD/5BA
 85qSaxZkpOEqe9vJ9fUls+qvB+Y73a/PbblhSukDrtJ5kXQgQSCB6+dUEyQY1BDv/pJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xELoV7fEIl1h0VtrM0t+Az4Ubh0u+MJ/edQYk8448lA=; b=A
 eRmSiKjkCKQPgKgsmS+dlcjER/mHbK2FdLkO5rKIbcs0gjLR1W7BVhsfXKHVJemhrJe4Wlzy5heMm
 L+TnWW/0lqSFlzmn7fl/aYwPJxNxgxY2EC8LsBhRVRtJdRxTdnfNUjYD5k0eikx1t+pDk7G860WNs
 cXB+a6QX1vsKMfV8=;
Received: from mail-co1nam11on2070.outbound.protection.outlook.com
 ([40.107.220.70] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSm3L-0000DJ-Bj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 21:44:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gk28FJEm2d6ok1aLZeSnyJeejIAFm1/KxzMBYVLOTlFTh4WOtr4FJl2evlTgqSCjEEcgK25agykrujZxqwGXPYEZs5IDHCdel0ldhbiWmneh0DA+kZx2P7WowjCsiVGXAC2jEarcryT8Geh4RpiVaCtH6eTCpa/HwUJf6HFNMhwxD9lfMFfwbtAe14WRK3wYL+n9Q/Pd5qy+SDAFs63QC6vOVWA/G+is49RelGexQlONxuI/w7/G27fIjsH8M8bh6autoKj6XGIouRFCje+CzZ29OX08z+cY39pUf6MayFx0rJYACwhM3H/Mc5Kr/G5HY0m1ao1weWwfSm8FQuQ95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xELoV7fEIl1h0VtrM0t+Az4Ubh0u+MJ/edQYk8448lA=;
 b=a4HTAzsmRr7zZeY1FYMK7zH6HKHYT78QPk7JkApHQthrneFr/u9htxvge9qxyG+EXfLDwIrbZ4ysj2u4gE9HpAmbcHrLMrm3FgE9bPYGXtYJtOKMsqRcUpRzuQR0E9Eo2mZ6x/ptQg+cPt00jJC2JOvUdpixOr+jr9Rng0MGfV7rzkXd+MUFUVryc6Pzd6tKgtKmGIfXIrHadQKxQjCsGKUHBgGNRS76V5naXwDbKjVIF4NJlL5YuY6BkRSaY5ALpCozmOaffyu+RJM4hgJaS60cMZP5rVpU84oSSkJ9RNioZcHtBlbNjhlu3RjCyVT2Vldo7f40+Op8iDDNv/ZSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=knights.ucf.edu; dmarc=pass action=none
 header.from=knights.ucf.edu; dkim=pass header.d=knights.ucf.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=knightsucfedu39751.onmicrosoft.com;
 s=selector2-knightsucfedu39751-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xELoV7fEIl1h0VtrM0t+Az4Ubh0u+MJ/edQYk8448lA=;
 b=CDod2BkSGmZf/rZUgtfneT2CFLwLZo26chptOrz3h2kIcbut8FoegDB2pOVc/tJWZGZ5rjp7Bd+pQgAYGsb3d8Bq+YLX9tAvysoGK/SjHtxyaXyDH55E9LMYWFgQ+ALrJR2kbud/Nf7RX6S6LSARqjWX+E+wUDWNE+Rv0NOaXpI=
Received: from IA1PR07MB9830.namprd07.prod.outlook.com (2603:10b6:208:44b::14)
 by PH0PR07MB8717.namprd07.prod.outlook.com (2603:10b6:510:86::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 21:44:28 +0000
Received: from IA1PR07MB9830.namprd07.prod.outlook.com
 ([fe80::d883:f078:37f:dace]) by IA1PR07MB9830.namprd07.prod.outlook.com
 ([fe80::d883:f078:37f:dace%6]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 21:44:28 +0000
From: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: KASAN: use-after-free Read in f2fs_iget
Thread-Index: AQHZQkweS4QLZPhJsU+q0B4HxCwMtg==
Date: Thu, 16 Feb 2023 21:44:27 +0000
Message-ID: <IA1PR07MB98307AE9C98D8C2E20F3129AABA09@IA1PR07MB9830.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Knights.ucf.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR07MB9830:EE_|PH0PR07MB8717:EE_
x-ms-office365-filtering-correlation-id: 98915939-54a8-4ded-9426-08db1066fa94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0SPo64HB0+d24Mfx8Ol2wTxJ+7oPaOBe1/ovZQJNwPxaTo+vLoQMIMqru/+iqjPE81SefOcrLVgYXW2wHDg/UPSGeLiRlV12QJiWoV2cvg3VILl1i0NmPOz3QWYuqoVj6gqX4InWrUZCohYcG7pejL81UKkSXK/0D/Suks83vrFDgVJDKDNEItrmwJqUK4NqsruUOXF8ezTBDzEGkK+092hLj1MHedGEpkL4O4PVzNsRasQ72yv7egO2F/L15rf6vVDR5nnEWNMMJ4O6yd9SmU+Xl5bMQAQl2QTssZWyYtQrKexuHluOcJM0r6A0lt4p96Y88+tgli/dVof0Ieq3kNUbts1UDKL5jnWTw2FfyqN4eT/j2cHKarmTWl+8KeXXNjEs28OPY26Erpfe1SELEdjNuv+h74m7L9PSq9mDKqQIlOKqPzDXP7ZAM2SeV2g9FhNnpDi3v3DZkjMYtbFrIpvRQ+29oL0n/pp2o3zQxv7Iz9UumrlXcEARX90uUwIAhX5eDcXl/b+t54rNM4mhMOHQI2o+G4/RYi9D/JlG3FKDdrKdEyMPeVNlicnfoypRDU9M8gmwFXXuxwkrzE3un+yKPdKBbj7CGXt4CN/unxAMJ6WfXjzLT3dm+SCg/JdXLC4moKZOxvA7Kw3HNy+lAHaR+Lp7QtVPkgH0gkil2SilLpRiMsNWHWWwPPMtRLm2xs1aVeK2ju+QwWXLZypCQqiLmWXIPIeAEpfSIGUiVn6wR2yir7EF+45wL78t8cSP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR07MB9830.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199018)(5930299012)(966005)(55016003)(83380400001)(86362001)(2906002)(44832011)(478600001)(33656002)(7696005)(71200400001)(6506007)(186003)(26005)(9686003)(122000001)(38070700005)(75432002)(38100700002)(66446008)(8936002)(41300700001)(4326008)(5660300002)(52536014)(41320700001)(8676002)(786003)(66476007)(66556008)(64756008)(66946007)(76116006)(316002)(54906003)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?d+QhZgN+Aa4982BY7L4bLfBvhft19XXFhoziNhPbTywarB0aK8dJv5kT9k?=
 =?iso-8859-1?Q?P978hiyDGOyhvQKeU/s95ZYbRMKt3C3n/u3/Y4nrBKYNVgm/sJucMogYn5?=
 =?iso-8859-1?Q?AvQqPJVolwbwdEP2tTX7la9g6uiuKAhKm6cJLIM3YcW36sq+TeMQ+kDErx?=
 =?iso-8859-1?Q?hEycsNnuGToEmH52vapvqjXwqGsgQ5KKctd2JAmxWd6emqy+D/ikOMeqfP?=
 =?iso-8859-1?Q?NpY11oAJ34j4No49uEyRf+Bwe2LysSnkS+NeVt2wdFnHnNSf+UIviIwo9/?=
 =?iso-8859-1?Q?f3DSRXDs0BABYENqyLXlw/YgU8+cFOfWU3xYYGxKb31R1/RP4mEnhnAZTA?=
 =?iso-8859-1?Q?468NBtule0JqkRDhP7/6mkwXklZWUmuygwiPuoYAUWHMPTmfMHb7Q/A+Qx?=
 =?iso-8859-1?Q?LaozO2TryD5/17xrIKgeKSBB1LorT6HYbl9BlRbwQF6iz5ITzNy6V09cja?=
 =?iso-8859-1?Q?w42ThKNfXgM8ZfeJqLXVxPLHiC18Ah+d81hX/5rOPaX1C/kd+L90jA6Td2?=
 =?iso-8859-1?Q?dKPqwHUKq/C1JynKfJgCigU7vC7BRTPlYkQrXa5We2Ve5DdW94bYF+Ey8Y?=
 =?iso-8859-1?Q?jgyq5DoOs0EqU1I5N9U3YdQZvvPAS5Dh4XkDFWNp6oPc3lbKZHpuzuerPO?=
 =?iso-8859-1?Q?hdWo2isYXss6wiM5uNw5v6Z/PPPPbkrcp5AV46KUYZ9jf6JcWGRTvPr1St?=
 =?iso-8859-1?Q?wb6lgsqJo/BKapW9YcSgsRP0u6qmGmxPVS3geTlobgdoTXumqFsOE7wUWL?=
 =?iso-8859-1?Q?gdb2hBJ0bcPsgWDeEjoUwJ1OzP835zsKPVGqgJ+ezYikn93m4/iSEF1+ja?=
 =?iso-8859-1?Q?HaVfA9/opP6LEvgIt/YYVQ/IRGy80xxvsyyeoKliiGu1cUW8zdE8VQpO5x?=
 =?iso-8859-1?Q?JH15rfewbS4mJkvMRz2mTF0ilr0bUtnHdyU+UHtFXFb3ikG1RLj3mWMXl+?=
 =?iso-8859-1?Q?WIfvP8SjHLcW/DHdru8UUwOP73lHOaC8zTH//4q7Od6GWFwy/1XoRcid8D?=
 =?iso-8859-1?Q?Ba72hzviBA6pznbfu6g/3k8jsKeSeqkkHwxz1a/f4GPknQDV+3VOiKaXMt?=
 =?iso-8859-1?Q?SJIGBczb6eAlI72R3DWQPfEkYWHImuYIHQ1AANkN1jbhKPKZHGhbUGKaVl?=
 =?iso-8859-1?Q?Wacm6BBUJgYQaOZyvOB0BqRD28XaeqS2GfegFErKkIOWy/rm8IFGNdvfnQ?=
 =?iso-8859-1?Q?a8Vjmnr7/fzUw/QUqft6GOmBuFBxZTnaa9+zVPi+ZdhpD6eca93GH6GJPK?=
 =?iso-8859-1?Q?lRY7YveLdtODbmAcYY86aHoHYdhPLMi1fht1zE9NiBUde4KblQ5FlTjP6e?=
 =?iso-8859-1?Q?1x2T3CRxOoSXZpGkvqpjTdreTs7OOQ9N4TsRKkI6Jn/F/UE7x/nX9rwe7k?=
 =?iso-8859-1?Q?6stuf9kxvKPO7BBy2j6DkjGFV3CTN6sC2D+d5gBQniHiUafmVBZKk75lZl?=
 =?iso-8859-1?Q?M0veOGsmOYwJF6IQZ5GP6MOkvXIoUyx4dPuUc7dd6hUeXEiutDCd9PMRWY?=
 =?iso-8859-1?Q?YrwXjr0dccailVp37sdezpdIKmI09wN/3togoCmmnlvy929DjmZMpQsmpw?=
 =?iso-8859-1?Q?2Pxc1TrlHK3V7GomV3RseLggGFtk/k/uhwYDB7Ep7Jri5CZ6yYi5cDShRF?=
 =?iso-8859-1?Q?8Z3AyOEYUeGSIVqzSeLP4z1z0/jqCkMe/YGd63Xrz99p53y7serlWNLg?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: knights.ucf.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR07MB9830.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98915939-54a8-4ded-9426-08db1066fa94
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 21:44:27.9494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5b16e182-78b3-412c-9196-68342689eeb7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YbrwRaRLrYir4Mns9ew35Wphi7+1P7hLo5I4HQ46jFSHKGxKIFm2nJM2gEj2D0v8RtrHBCBMHdhKHWm0TD297NHSfD79aE9AsUD7Y60ZcB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR07MB8717
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
 no trust [40.107.220.70 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.220.70 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pSm3L-0000DJ-Bj
Subject: [f2fs-dev] KASAN: use-after-free Read in f2fs_iget
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

Kernel Branch: 6.2.0-rc7-next-20230213
Kernel config:=A0https://drive.google.com/file/d/1yVvlPL4-MMdjARqrwJ0QoKuPv=
_3lFQIR/view?usp=3Dshare_link
C Reproducer:=A0https://drive.google.com/file/d/1iGHEHtN3jEFooUWK_no4VEwK5q=
kzemBP/view?usp=3Dshare_link
Thank you!

Best regards,
Sanan Hasanov

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in f2fs_iget+0x1140/0x53b0
Read of size 4 at addr ffff888043282568 by task syz-executor.5/12545

CPU: 0 PID: 12545 Comm: syz-executor.5 Not tainted 6.2.0-rc7-next-20230213+=
 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x17f/0x260
 print_report+0xc5/0x5e0
 kasan_report+0xd7/0x110
 __asan_report_load4_noabort+0x18/0x20
 f2fs_iget+0x1140/0x53b0
 f2fs_lookup+0x576/0xc90
 __lookup_slow+0x275/0x4a0
 walk_component+0x355/0x5c0
 path_lookupat+0x185/0x760
 filename_lookup+0x1d6/0x590
 user_path_at_empty+0x4a/0x70
 __do_sys_pivot_root+0x13d/0x16a0
 __x64_sys_pivot_root+0x58/0x80
 do_syscall_64+0x39/0x80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f5b19a8edcd
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f5b189dcbf8 EFLAGS: 00000246 ORIG_RAX: 000000000000009b
RAX: ffffffffffffffda RBX: 00007f5b19bbc120 RCX: 00007f5b19a8edcd
RDX: 0000000000000000 RSI: 0000000020000880 RDI: 00000000200001c0
RBP: 00007f5b19afc59c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd15d63e2f R14: 00007ffd15d63fd0 R15: 00007f5b189dcd80
 </TASK>

The buggy address belongs to the physical page:
page:00000000a842bac7 refcount:0 mapcount:0 mapping:0000000000000000 index:=
0x0 pfn:0x43282
flags: 0xfffe0000000000(node=3D0|zone=3D1|lastcpupid=3D0x3fff)
raw: 00fffe0000000000 dead000000000100 dead000000000122 0000000000000000
raw: 0000000000000000 ffff888043282d40 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888043282400: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888043282480: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>ffff888043282500: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                                                          ^
 ffff888043282580: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888043282600: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
F2FS-fs (loop5): sanity_check_inode: inode (ino=3D8) has corrupted i_extra_=
isize: 37888, max: 36


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
