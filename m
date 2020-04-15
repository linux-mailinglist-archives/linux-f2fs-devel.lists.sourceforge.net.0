Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 616DE1A9125
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 04:54:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOYBv-0005Gw-I1; Wed, 15 Apr 2020 02:54:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <timtwalker@outlook.com>) id 1jOYBv-0005Gp-1T
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 02:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W/OzDTs0n0ZqLzy6E48Thf2/5XCN1G8sxGcypNVrFcM=; b=GYKBcGgmYlWyMcVfoR6GVdHCph
 i9I6IupPWJ7H/Urb1riEIlpdoVnOYgaKeBM23Tew9WTIR+YZVGdwbGEsv2WDWCZbVzZveoakPWfRm
 Yi3Sr2HFidaplIvv1Udqq2+DoiZsChldCcKWdVUApMnQfC6yCWLYA3DSaJedz9zN6d8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W/OzDTs0n0ZqLzy6E48Thf2/5XCN1G8sxGcypNVrFcM=; b=Ph+IlMGGrcqplITb3SH3CpQkrc
 WzuVkau41uKlfxoajX+I3MfbTC45V02CVdeQsTlJheHLXNNB5hR5jM1ZPAFCYnNDYyq0GHuj7Faz3
 FR8l+4ga+PJ33fyyU2P5+w0JpwMx0y1VD9KNcS5u15KdXoOcDZl9u7suhRI8UPkSle7s=;
Received: from mail-oln040092005063.outbound.protection.outlook.com
 ([40.92.5.63] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOYBq-00Gmef-SS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 02:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nl0T5A2UxtEPI5i5DP4WHrmu3K8t/ii61vlF5wuLlb3T1DjJL9u8e2UaOg69SLMfnKZGnsJ7Pa/jaP7fUpTg7uaFaFEt2K8QzKQuO6q2HF7cjRSPEyyzzChKxFNRJWHUVsNxsydV6cGPOveS3/SOaX2IMwaPm5iqyqcEASIvu2G2pgf0N3SVgGlAk+tg4GXYqM+UivK7JgG4+/aKnANEpLEUXhMoRy/GhzA4OcM0X2G+ZZL5M0XOEXwLaJafllY20PsbUa5sbcHNn6dXpn2BWJUo1kT2LwsyyeFLc53Wa2LwyuLKqVpDNG+GzcqYpuiGWfKi8QvruZLcXzAmv+i61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/OzDTs0n0ZqLzy6E48Thf2/5XCN1G8sxGcypNVrFcM=;
 b=IDNr4Obi0iqQ6KVSLxwtl6BEbLvhLUN9NziGAlcJb3BWnlu6gt9kkO25PYcyn+GUJH+HPRN29BpAc5WGD8H5uSsZ4GWasvdpMQyqp/MpK6zibFpxf7B5ZptVAIr4A1OICgQNeUlM0kN4L5kOotthsAwtRnkmWgskNMqYAyALydwa2FmykTzA9YIg2jHGLpdfYQ0cpbQoYBLzmU0gqH2b9NYYiTD/ESs8hKzxNOCuB2R5iqFZsZqzucNLaiShCleHc5nk2aM2YGW7MjcTUSI4bv1WPPNRN6e8x82MRNXwKeDnOPxfe0kDxyYozlFSDEhKVk7OyF0Pl2auQCVV8mgLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/OzDTs0n0ZqLzy6E48Thf2/5XCN1G8sxGcypNVrFcM=;
 b=UwyBnxnfhA1yFRIAduKfEi4GjEaolSz0H5sk5OOk57u+OLu4tpdMVawjEPG0ogmiSBX1+yKluaK3ZPvvb0PjAn4v+vp1Gz7VE7QtAqIhYzqaVkbz6bREezT74inn/AHd0Zt1gydTxp5RFclysi8XVOPhx+R+3PtPGiUfaPUNxMuwXfknpSzvfsSm4bNDsJ0y5LmZTQ80/JmZUyk8q6hjwuXHniPNE2m09EvGMUmEJHZAzydVBX0gPdBvJN4V+Hvwb9pzjDZumApVlIP9iMhGK3VDt2IkjK/3OUz+XvtiMkJQOxwWHo9uaJcIF44UerF+3Vtf+70NIw9dEUg1L9ikew==
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (10.152.74.59) by CY1NAM02HT004.eop-nam02.prod.protection.outlook.com
 (10.152.75.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Wed, 15 Apr
 2020 02:54:08 +0000
Received: from BN6PR02MB3379.namprd02.prod.outlook.com
 (2a01:111:e400:7e45::43) by CY1NAM02FT051.mail.protection.outlook.com
 (2a01:111:e400:7e45::148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Wed, 15 Apr 2020 02:54:07 +0000
Received: from BN6PR02MB3379.namprd02.prod.outlook.com
 ([fe80::21f7:6498:5c4f:397]) by BN6PR02MB3379.namprd02.prod.outlook.com
 ([fe80::21f7:6498:5c4f:397%7]) with mapi id 15.20.2900.026; Wed, 15 Apr 2020
 02:54:07 +0000
From: Tim Walker <timtwalker@outlook.com>
To: Chao Yu <yuchao0@huawei.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support
Thread-Index: AQHWEhRk6QQ7ycMUR0i9beoh8v6aDKh4gb4AgAD7Piw=
Date: Wed, 15 Apr 2020 02:54:07 +0000
Message-ID: <BN6PR02MB3379ACB0F0777D5D932EF641DEDB0@BN6PR02MB3379.namprd02.prod.outlook.com>
References: <BN6PR02MB3379134F5821A8D6995E3084DEDA0@BN6PR02MB3379.namprd02.prod.outlook.com>,
 <c81b3ef8-1266-829e-5276-a11e167810c7@huawei.com>
In-Reply-To: <c81b3ef8-1266-829e-5276-a11e167810c7@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:ED56B0D3A554039335175CE8BC784C0D6D92B2860581375B93A72ACBDFF5F5D2;
 UpperCasedChecksum:71ADAF9DBDEBADF55062B2DC9D3E7AFF4D52C8AA1D606F12187A818CF640D2BC;
 SizeAsReceived:7070; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [wKOU4we8sV9p9oQAU8rTl6uWR1o6RMe4]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: fadfd3d7-43aa-4ed3-24ab-08d7e0e8444d
x-ms-traffictypediagnostic: CY1NAM02HT004:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QZQiB9pzSyRcHuyj/hf9cwZDAwBIZM54CrgfeHp/TY0Gkl+KuhsmcdcacKL1Lml2KZEunwVZSIzHyq3Qx3ff3OHlSrhNFX05GUfMml0YSnMT7/78eWDspVGlaPbLk1H0YIKpABiHHZmo5q0AdLlqKoHrmh+MuXcQAB3Vnt5TSkRJLR2AUGU7Cd8nmcMt0lXk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR02MB3379.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: EEXLHESMezJV1pS8ca5pkGTep+liofW/Y8WhMWvQSBjm6Bt+elLnlzRBIvjz7G7GxOsKIbTO6CH1iWbI9zzYOBewp6hHua+ie5RUeq4fZp0vV+4Uwuzf6s2iWDIIs9LFeL+eGyFG0tgqtZ7oujp2cA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fadfd3d7-43aa-4ed3-24ab-08d7e0e8444d
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 02:54:07.8245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT004
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (timtwalker[at]outlook.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.92.5.63 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOYBq-00Gmef-SS
Subject: Re: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


From: Chao Yu <yuchao0@huawei.com>

Sent: Tuesday, April 14, 2020 5:50 AM

To: Tim Walker <timtwalker@outlook.com>; linux-f2fs-devel@lists.sourceforge=
.net <linux-f2fs-devel@lists.sourceforge.net>

Subject: Re: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support

=A0


Hi,



On 2020/4/14 12:23, Tim Walker wrote:

> Hello-

> =


> I am trying to determine how f2fs handles an offline (or read-only) zone =
when it is backed by a host-managed SMR HDD. I haven't been able to find an=
y specific code path that places an offline zone into a separate list, or a=
 path that checks the zone condition.
 Do we support a zone going read-only or offline? Thanks for the info.



So you mean different zones in SMR device can have different status? some

of them can be tagged as readonly? if my understanding is correct, f2fs

needs to handle such readonly zone correctly, e.g. write/discard IO should

be avoided being issued to those zones, right?



Thanks,



> =


> Best regards,

> Tim Walker

> =


> _______________________________________________

> Linux-f2fs-devel mailing list

> Linux-f2fs-devel@lists.sourceforge.net

> Hi Chao Yu-

Yes the zones can have different status, according to the spec. I don't kno=
w how many drive manufactures use those zone states - if any. I was only as=
king to see if I had missed Offline or Read_Only zone support when I examin=
ed the f2fs source code. I was interested in the implementation details if =
support had been included. Thanks!

Best regards,
-Tim Walker


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
