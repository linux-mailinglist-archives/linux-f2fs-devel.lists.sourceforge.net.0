Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CF61A911E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 04:49:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOY7f-0004vA-TK; Wed, 15 Apr 2020 02:49:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <timtwalker@outlook.com>) id 1jOY7d-0004ux-Pr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 02:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QIpKhr16tMpzQ/DN1Z7HizufA7ucqxFBoaniy8KJ4As=; b=VmACdQ+u8rlXk/eYXTZ+kXgPpm
 S+uAXRnR9eoPkOokBIhxmpVoU/WCtRh+ZyiRMDsQZIga4W24dZW4LayJiO+cOWtJn6RVGNey2BXSZ
 LvxrJ4VVs4BIUsbW1VsPQ1OU2t8chyFtC5n1f+/6mijK3cmn6bLCXnXq0aE5ZGQO0GRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QIpKhr16tMpzQ/DN1Z7HizufA7ucqxFBoaniy8KJ4As=; b=KLSmEB3hjHuORhoKXfUNLWU7z/
 O6MOM8VMezRklmzMQlovCZDxuAvP1Hh9MrhdUSbykT76TmXN84tc4Pan3w+S7EDf6Op8NmUw9LUyy
 9cxCtf1IHd4RuO5gSK7on4BKqs8MHNlBtFcYJ8DQatxYAYUGKtgdWyvmXayTmIvBAJgw=;
Received: from mail-oln040092005074.outbound.protection.outlook.com
 ([40.92.5.74] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOY7Y-00GlzD-CA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 02:49:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZEDQoBTZ1HmVLHG534ykGD+CuIdTyxqc3aifW/nc1grFvaFlWsD1T1JuFCXq1lGOVoeS5E97h6RoFbYcNSCP9jXjmt7q8N0RgpmF5RtBgMEerGPo9CG605f3kvzGVRYrN6kNxNFVF+Wk/KqONo8l0VVoasvRjXaIhsE/KXEnm1aP8OuJnQc5nEJLeRPFp/n0Bm+t+7itnM75mCi2brbCx7yBS+9SXbtB6dnUuSlpjzMakuXiN1ZkLcbcLRNhSav2G1mtQp81RYTP4cLZYf3sYwbaHt7PfP6A4Sn4syUtZnCwiS4u2BftytotlsmL26swb+yjFjSYY8jwuGnwn7JTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIpKhr16tMpzQ/DN1Z7HizufA7ucqxFBoaniy8KJ4As=;
 b=ATFwq5dJoT9ybg1x5mXlhCiftyoE55Fy7RDuwv0k19368YXDgkuq5BZkbSHtnKZ/3UOWClmNwpcdKcuhJGp8kwhirho2RAm+k7T1nl5nbqN/zYRCSpPJwmpmaDrMml3tpOH13NWL0yccYlqzvJJH0+EnlgNXFNlQrWfqfGjGLfireqtjNJ8YLIcKtIjwZMZFDUaY8risuhNREGMvEwWhiBsy5Y+sbVHgibE4oiApeqzNzLha0ja3zfkBVfvLS2pFNRQg9NqS4iqxNwN7SxjXNFt7UuBXTCzve9cE3ZtNa/C9GD4RUlnnTnEVjcl3dKaJptdPxkaAUTGblhT3Hwt4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIpKhr16tMpzQ/DN1Z7HizufA7ucqxFBoaniy8KJ4As=;
 b=HsHtNEPDfaUBeGj8CMamo9gsqTN2QzFKuYqZIJ33klTFojt/Hl14XdjdKHT2mYGE59CFxZUbtOLnUXMipZ22lrBOoEQQ/N1EqLM5LzdFLOm7GzPYDST/WQjlc2hLPUkVoboCd9ELusm37KfmVTo3WuoGwFvPz5XiFKb6y6wFtc5b5iaz4Gv5UAXf7gLJKe/XThlKP5BCPSx6j5Sdfa+2PwnuaH2HG+oMJ+SaZ5AfXuPf+2UnLZobHcFC4dZCS5ovpnqzqvdlCArptM5FjLMFCgbeTRSxS9Y/2e7hUi5uiue0Z68pgjIpLEK059FKHpeh2Nc01/LRv+/GzBDHRQL2iw==
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (10.152.74.51) by CY1NAM02HT098.eop-nam02.prod.protection.outlook.com
 (10.152.75.254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Wed, 15 Apr
 2020 02:49:42 +0000
Received: from BN6PR02MB3379.namprd02.prod.outlook.com
 (2a01:111:e400:7e45::43) by CY1NAM02FT051.mail.protection.outlook.com
 (2a01:111:e400:7e45::148) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Wed, 15 Apr 2020 02:49:42 +0000
Received: from BN6PR02MB3379.namprd02.prod.outlook.com
 ([fe80::21f7:6498:5c4f:397]) by BN6PR02MB3379.namprd02.prod.outlook.com
 ([fe80::21f7:6498:5c4f:397%7]) with mapi id 15.20.2900.026; Wed, 15 Apr 2020
 02:49:41 +0000
From: Tim Walker <timtwalker@outlook.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support
Thread-Index: AQHWEhRk6QQ7ycMUR0i9beoh8v6aDKh4qFeAgADQV3M=
Date: Wed, 15 Apr 2020 02:49:41 +0000
Message-ID: <BN6PR02MB3379673E719852A77DDB3294DEDB0@BN6PR02MB3379.namprd02.prod.outlook.com>
References: <BN6PR02MB3379134F5821A8D6995E3084DEDA0@BN6PR02MB3379.namprd02.prod.outlook.com>,
 <20200414140903.GB69282@google.com>
In-Reply-To: <20200414140903.GB69282@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:5D42A7894E629A0CF41B3B3F5E3DAFB263D6F25186D6E1588AA08A3F6AB7CA70;
 UpperCasedChecksum:902F96203C8DCAF9F9B7386EFA184C5A0D588AA61E686DC2CC91118D08412946;
 SizeAsReceived:7067; Count:46
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [1a1e5T4FVlnZYVh9ifMwx8IvcJq2V7s8]
x-ms-publictraffictype: Email
x-incomingheadercount: 46
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 76a53bad-dd86-46b2-a7e3-08d7e0e7a584
x-ms-traffictypediagnostic: CY1NAM02HT098:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CYWf66RQF0s1RCfB9QlKMrB2q+7dO/UbD0ztxIaN2QoHaFBSxGaw5p91B1nlxnBYiSgI+UHLc5gyfeoai36nQYXaj1wMMirAmJE7ylTmgfI3tBF0NeGbte8Nssaq0ktH6q9TWU9kMHdltNaFKrYZN6+OOjCDT2eAeh2XHsvV1BMGnS2FKwQEh0HmA6VaxMdl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR02MB3379.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: LVCZUj+8lF+qXR+w/0J2NQ+HhgOWJCLaWCTETvVuAR7jT7kSpcfWA4sRVDy+a4auPX2bvSLN9a34fi/tfrOyAOmiN/3NBS8G/Q+5OOpiETm/iSGL4A9UJVabSMSALAnMLHfYj/kZ0qn9J8eBgxRC3Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a53bad-dd86-46b2-a7e3-08d7e0e7a584
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 02:49:41.3676 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT098
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (timtwalker[at]outlook.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.92.5.74 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.92.5.74 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOY7Y-00GlzD-CA
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net












From: Jaegeuk Kim <jaegeuk@kernel.org>

Sent: Tuesday, April 14, 2020 8:09 AM

To: Tim Walker <timtwalker@outlook.com>

Cc: linux-f2fs-devel@lists.sourceforge.net <linux-f2fs-devel@lists.sourcefo=
rge.net>

Subject: Re: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support

=A0


On 04/14, Tim Walker wrote:

> Hello-

> =


> I am trying to determine how f2fs handles an offline (or read-only) zone =
when it is backed by a host-managed SMR HDD. I haven't been able to find an=
y specific code path that places an offline zone into a separate list, or a=
 path that checks the zone condition.
 Do we support a zone going read-only or offline? Thanks for the info.



Which scenario do we need to see ro or offline zones? Can we expect some

when mounting the filesystem? Or, does setting a zone to readonly happen

in runtime? If we detect them at mount time like former one, we need to

treat the discarded blocks in the zone with unusable space, and set

allocation bits to avoid GC.



> =


> Best regards,

> Tim Walker

> =


> _______________________________________________

> Linux-f2fs-devel mailing list

> Linux-f2fs-devel@lists.sourceforge.net

Hello-

A zoned block device HDD zone can transition to Offline or Read_Only at any=
 time, according to the spec. I don't know if any drive manufacturer transi=
tions zones to Offline or Read_Only today. I was trying to see what support=
 f2fs has for zones that end up in that state, since these zone states have=
 been in the spec from the beginning. =


In my mind f2fs would discover that a zone was Offline or Read_Only when f2=
fs reads the zone status (write pointers) at mount time, any time f2fs rese=
ts a write pointer during GC, and any other sequence of events that causes =
a report zones call. In addition, if a zone were to asynchronously go Read_=
Only or Offline f2fs would presumably discover it when it tried to write a =
Read_Only zone or any access to an Offline zone. The error codes are descri=
ptive.

If f2fs were to discover a Read_Only zone it could just mark it to never ge=
t GC, since it can't be reclaimed. Thanks.

Best regards,
-Tim Walker

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
