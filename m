Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDA85CCA4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2019 11:27:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiF42-00039P-Qb; Tue, 02 Jul 2019 09:27:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ceo@teo-en-ming-corp.com>) id 1hiF41-000398-FW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 09:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z2U7lkdeiHwkGFbiC6ybM0mMKyqidLBvMygpnJH/1Yo=; b=AxpS4jN3xpIfGMWozG7BwwuCNX
 egwFWMO0nTw9eXj35paObEyS/FG0bOgrqRq2j5egug+UFMIjGRFrMxmbT8WRidOcDUq+5T8nrX8zl
 aFqpCx6GGra5ONfmqJ7oRH6bm5x+Fgn7qSWCVJ46Iy42GnxO/h5HD7xgiDot0CtA+tD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z2U7lkdeiHwkGFbiC6ybM0mMKyqidLBvMygpnJH/1Yo=; b=k
 a8sGCmXyynpeRPBuzojd1Eznp923Z8UPIVIpdquSi1R/HovQTNMN+30pAwvyQxqGkVzswYjow2btv
 huXn9+JUyqonDBqujHl48DIQIgssmInogVeu63gaHx8rueVYV9Nnl+Om0bY3/VDkjOxMXFuEgiA5d
 WBmx9d1j37Ixi6IM=;
Received: from mail-eopbgr1320089.outbound.protection.outlook.com
 ([40.107.132.89] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.90_1)
 id 1hiF47-004a12-VN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 09:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2U7lkdeiHwkGFbiC6ybM0mMKyqidLBvMygpnJH/1Yo=;
 b=vXxm64h4yOpDRF4WRMYqpEIzdesbeZ2Wju84WOpTLu7ymj1fnKLoOMY8gZdj30MT76s8S7e1bzswQ+DbieIE9UuzEpfWEwfqJ8cOF3ZNpLRxBFNggQeMMzu9TiC3znWUg8mjywKG7OcyuSQ0W291QC0cgQuHWj/3das1NFz5CbY=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB1936.apcprd01.prod.exchangelabs.com (10.170.141.145) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Tue, 2 Jul 2019 08:54:00 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2%6]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 08:54:00 +0000
From: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: Is F2FS (Samsung's Flash-Friendly File System) faster than EXT4
 for Android 9.0 (Pie) and Android 10.0 Smartphones?
Thread-Index: AdUwszAzLnUFlkYyQr+JHBr9SXB+0Q==
Date: Tue, 2 Jul 2019 08:54:00 +0000
Message-ID: <SG2PR01MB214119220D5EB8ABA23803EE87F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ad4dd87-30a2-42fa-6608-08d6fecad38b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SG2PR01MB1936; 
x-ms-traffictypediagnostic: SG2PR01MB1936:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <SG2PR01MB193689F447C6322D5F0F70AB87F80@SG2PR01MB1936.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39830400003)(396003)(366004)(136003)(199004)(189003)(8936002)(102836004)(81156014)(81166006)(8676002)(2501003)(486006)(66476007)(476003)(66556008)(2906002)(508600001)(6506007)(74316002)(66946007)(52536014)(64756008)(66446008)(76116006)(73956011)(33656002)(66066001)(14454004)(5640700003)(25786009)(9686003)(186003)(4326008)(6306002)(26005)(107886003)(7696005)(99286004)(6436002)(53936002)(68736007)(5660300002)(55016002)(71190400001)(71200400001)(316002)(2351001)(86362001)(3846002)(305945005)(966005)(7736002)(6116002)(256004)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR01MB1936;
 H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M0YrXANou5sxKuO5A33/ISphNLDEpfcS8vRe0B0vnZnUBdY0bDQcS1zXRZFJzbawN6Jk3pF9ApAkPjYMjPQ+nAbznm7tdeZkqVN9G3iS673Qkk8TIUSmna1dyJC0BoALD9XWTBZSyDHakZJKlMXRDPFrE8G3iMLKkDHMmjcFMmjrLZmrfGDryiP6rAJi3mqGpvyxTx+KcHWK42d5xhxnUEDFc2UDxqMROGRajhIxfM2Yi8P5BRPGsn9NM59jIDm0AAIuPyQ5nHPYHMgr8p9WydWjVbhNttyTXrgqaAg5LcknjXot0ijANZcg51TGNvxECMo8Gly3twLHeWUXcOy+d8NBpvbCQ5qMdnvGO0IJGcu1MOHErC24wpUIF556+8WvwddebTXdEVNUk3fjTYr7JbqyD8LW+Pfb3vmJXxHPWeQ=
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad4dd87-30a2-42fa-6608-08d6fecad38b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 08:54:00.4541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB1936
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: blogspot.sg]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [40.107.132.89 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hiF47-004a12-VN
Subject: [f2fs-dev] Is F2FS (Samsung's Flash-Friendly File System) faster
 than EXT4 for Android 9.0 (Pie) and Android 10.0 Smartphones?
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

Good afternoon from Singapore,

Is F2FS (Samsung's Flash-Friendly File System) faster than EXT4 for Android 9.0 (Pie) and Android 10.0 Smartphones?

Android 9.0 (Pie) has Linux kernel versions 4.4.107, 4.9.84, and 4.14.42, and was initially released on 6 August 2018.

Android "Q" or Android 10.0  is the upcoming tenth major release and the 17th version of the Android mobile operating system. The final release of Android Q is scheduled for release in the third quarter of 2019.

Thank you.



-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html

********************************************************************************************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
