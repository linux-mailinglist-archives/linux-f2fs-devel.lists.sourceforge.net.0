Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6881A727F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Apr 2020 06:23:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOD6Z-00012G-AQ; Tue, 14 Apr 2020 04:23:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <timtwalker@outlook.com>) id 1jOD6X-000127-QN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 04:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eRRdjiQaRDIrvXWyrLPh3rD3ictXsZV49PWo7HfK8DA=; b=A74F6NnaFhmbqQbIOOG39l6bXS
 Qx7Z8y1DVDtjk47cjZEDSWjWUjIyWsZgMgZM2GpMjmIvN4oiMtD0XJuoAiIFsyaLEVPD34vRFFjeu
 T9IVaUoZxn6dLxJQWrytZQU5wmREfDzdS3RVIeg6qIXyZOH+4FRin1r5HM7BV2LgDbU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eRRdjiQaRDIrvXWyrLPh3rD3ictXsZV49PWo7HfK8DA=; b=K
 SUNBAPDDl63lhbeFbWS9RBUgNng5I5LvrvwCvT29PKktD6/M84bGv9iktuLsa7FY1eTe3t+kA7LSH
 +xQ1Z8w+qzbnsndBgSFWgvWz2ylpMB+q1lbQ4UuGnGO0a0zJLlxIo+eS2DmVDPuyQ0JCGLz5BbFMX
 K2Xw8NzorjFbibJ0=;
Received: from mail-oln040092009109.outbound.protection.outlook.com
 ([40.92.9.109] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOD6S-00FKoV-M9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Apr 2020 04:23:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcZnobJfXMqzZRbxbngpYGLdhFWLsVxeisFhoBdRU4nvuByGSlBwXwrwyWa2AGlNERsffKGWdSXLvw5Z6xp/btqLDo71kZTQAUv3y1WLEubVkezo6IQY9JDs7Nxo9rXIzsQfbG8znWtWnE1GF84vRUvghQG+apUU3fI9dy9CsCxN1MrOGigGWQZZwL8DH8MUUb0YktMVokEkSaAddsRb0p4mJBft9UscpAIGF1F+eYBgJ+YLOA0VI4U0XfhBeqJexL98uYEYYq+FX6iuAAp6muQTFvj2/SOOiKGE7mwfqlgYIX82qGtdDhMNjk/KJYVuOYunGE6UsI26/ix6h4pnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRRdjiQaRDIrvXWyrLPh3rD3ictXsZV49PWo7HfK8DA=;
 b=UKpw64l3Yr1eAXXzRv1a3qXkjYhz96uvJovdMAgfADIJJyK3q2Frtdpf37eBtaB0vaDXqCn5pdrB/OQnvzgoLTjE1sxohf2ixnIslR4JTHfq+KEFnnvPk51r8dQ/J7Am9sMtR/58ncWege7AflLTTJPNWVYRuoLzIgWGoptsrfB7y2OHPN0Xzvi4I3u04h/IN0XhjmdWq1kmRIMl09yc2CA59+bITbm4ln1GkCuUwPZlhr6jqpznLB0wnNDTm6+HOmP3adHuXZB7ZHA5ErXPFNW31lGXM0ql4o3yxrd+x1rTy5ee0ThgY3qZVZH/HJsrDS82dO0CQdWWesBkpE/jww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eRRdjiQaRDIrvXWyrLPh3rD3ictXsZV49PWo7HfK8DA=;
 b=RT/PXGrwTX+x325E0Yc0VQzbSjNr3+oOZ2prPJjqpB0fZ0tCgMYAeFKrFQGH4UImIHZo42A3EPquqlrBMOKiwO+Ct0WX7ueX4bGygyZVCv7CK3NlmkkJ68cnERTtU7r6hTOvSfdQp2gAaHwIBxnJT26MJW6lT1uteAyLr/gghPM8F8TtS9RU2U1xFrc2RjFA8cUgRM4rDQQ0ZN/btQslilWLL3aa5Zv4o76tSeRNCseZZ6PPMNKLVGamYAkd9ncH4viXzt+8Jo4nR55M8hNqdDpECgASpEFO7H0ijkW0h+VwOa/Vul7bzl/L+nwXtSTIaY5+AbaAhZqBK9Luu4qoWA==
Received: from BN3NAM04FT028.eop-NAM04.prod.protection.outlook.com
 (10.152.92.53) by BN3NAM04HT084.eop-NAM04.prod.protection.outlook.com
 (10.152.92.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.18; Tue, 14 Apr
 2020 04:23:05 +0000
Received: from BN6PR02MB3379.namprd02.prod.outlook.com
 (2a01:111:e400:7e4e::4d) by BN3NAM04FT028.mail.protection.outlook.com
 (2a01:111:e400:7e4e::178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Tue, 14 Apr 2020 04:23:05 +0000
Received: from BN6PR02MB3379.namprd02.prod.outlook.com
 ([fe80::21f7:6498:5c4f:397]) by BN6PR02MB3379.namprd02.prod.outlook.com
 ([fe80::21f7:6498:5c4f:397%7]) with mapi id 15.20.2900.026; Tue, 14 Apr 2020
 04:23:05 +0000
From: Tim Walker <timtwalker@outlook.com>
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [question] ZBC/ZAC Offline/read-only zone support
Thread-Index: AQHWEhRk6QQ7ycMUR0i9beoh8v6aDA==
Date: Tue, 14 Apr 2020 04:23:05 +0000
Message-ID: <BN6PR02MB3379134F5821A8D6995E3084DEDA0@BN6PR02MB3379.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:855E13EF1BB834EA89205EF3774AAA06FD15EFF54DBBDFC15C4E354AE1E1DC8A;
 UpperCasedChecksum:031EB703C9FC2F92E30E205738982FFBEBDCC77E3E38C060843E5D1954E695F2;
 SizeAsReceived:6782; Count:43
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Ty0hUXoetr6DWhhT1jsddTCRe6sDZaFc]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: dd16dba6-1288-4117-4462-08d7e02b872c
x-ms-traffictypediagnostic: BN3NAM04HT084:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gYtZvjd+G4nGwllA+i4L8rY2yNQnyMey87H0cMj585waPh3+3EyoRd5BkatALpWpA8AWmwBF+CeNn3y69gg9XgJk9r+lVy1VGVRWzn4pYZ4luG6iNQId1tz5TdrE+zo/EVG3gRRiJicNCQI9cgjkHtfQbDkjU56BZ3ORIktLI510usYFa3e+bR8ygJ/iX5bW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR02MB3379.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: tu7V6KVp93APuSq2PVWZJNtt8c870FMhAwS/rEzLys24L1xdk5g4bPh+sSoz18XkKsu4EpwSbhOsVBXdqvZB0tB/Ku/H6VTljd7vVXutMXR1MNQvXvZcPOZ+HrZXEU3vvyZBGkD2QSmiGDHdpdW7ew==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dd16dba6-1288-4117-4462-08d7e02b872c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 04:23:05.1595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3NAM04HT084
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (timtwalker[at]outlook.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.92.9.109 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jOD6S-00FKoV-M9
Subject: [f2fs-dev] [question] ZBC/ZAC Offline/read-only zone support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello-

I am trying to determine how f2fs handles an offline (or read-only) zone when it is backed by a host-managed SMR HDD. I haven't been able to find any specific code path that places an offline zone into a separate list, or a path that checks the zone condition. Do we support a zone going read-only or offline? Thanks for the info.

Best regards,
Tim Walker

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
