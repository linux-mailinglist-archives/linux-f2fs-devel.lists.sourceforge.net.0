Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D19712A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 06:31:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0IHQ-0008MR-J3; Wed, 21 Aug 2019 04:31:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1294c0c7a=shinichiro.kawasaki@wdc.com>)
 id 1i0IHO-0008MI-RH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FSEgtWVmZMmDyNWfSBOkjN4Z2kqxrKQSJnt4xcqVahQ=; b=Z/s3Gzx1CPtGnb9enWW8LlcemP
 DCHs9efAJ0OhFWb67vS/iIphN438nvvGWP0uSthNGxwgSLJzy2iNWAGSI3lrRRbov3daEJRGryuBb
 8iET4EiXJZ/NY6u+IRA1wsQoiljAaI0f/YWp6MFgqjdNpsyNdwhPHYdx9Q/gDJGaHAFk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FSEgtWVmZMmDyNWfSBOkjN4Z2kqxrKQSJnt4xcqVahQ=; b=VujQKCzWL3YwIAPIoYVIjbtpPK
 hfNtMjGZFsNcm3WgVNe1VqAbph+4533Rm3yZ6WUy+m7LqNI7CWJ0jkNZstmpFkgPmyjm1jeQyzpXK
 lBK6Rt4lQt5GgsGPCnK7c4YQ4f+sIAwGJTqvxirWgf6BLlZ13THZ/klfz29t1YUvtvDU=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0IHL-00A9c3-OO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 04:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566361884; x=1597897884;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FSEgtWVmZMmDyNWfSBOkjN4Z2kqxrKQSJnt4xcqVahQ=;
 b=TOTHi+HaRvQKhsqaVFfkKmnEnulA5bK+qVlJd783KDPKMKtovOXcWfS8
 LRLxGTRXH0N5XqRIdNxDDVGLbG1LLlbo8CeSLzkd371ysQtGdzd743gJG
 ZGO330A6VVbToOtngHRyfoX0WufY6EMuygEv6aBX576ic7NL4OKTlHJWc
 /0mGdrDLNM0bJAuWJNhMn40OT/z8BkzIuwQDlC+j1JoesoLSoWDNM+aG2
 Ma7XzgC7foIoFmWdQGEwwwt9eFb9WAXqNb1n2ECY+EXshpI/TQAH4gDfA
 Px4CcZg54kpKh/0feW6ls0HKRjcYJqz9t/LzwHwg20y65nGP/A2nI6Suo g==;
IronPort-SDR: DlesZsNP7KSnWTrwc7nxT9aTu+MSMq767+mYSDNXyvgyREWUwTLg2WFGOpvg9KtZ51uyAy3SBL
 GVcr+fZVatsUCEcV/wajYxoU/cYwbZ/ZrW2LK+cgZRwl6ExWUUe4VwztB0vehmsJf6vM0mcHS5
 slONUifWHJbjWs93dVV4+pdVrB2a2sob3sG1+qJAe4sJMx/XyeCjV21hgl7Wl1FHWtKOkv6tWs
 1yZ0Go9dpJe0ZfLGeM71By2mg1QowQ8GYXdaPfYzLLBVRtReB/j4dKKPoGtNSrh+TWb0jd63vI
 mkQ=
X-IronPort-AV: E=Sophos;i="5.64,410,1559491200"; d="scan'208";a="116299794"
Received: from mail-by2nam03lp2054.outbound.protection.outlook.com (HELO
 NAM03-BY2-obe.outbound.protection.outlook.com) ([104.47.42.54])
 by ob1.hgst.iphmx.com with ESMTP; 21 Aug 2019 12:15:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3/zNKM1KL2FhdQsuptza5i/CBZbJ4W52kSUCwJRcxqy3hSj5icE4BoqDSihHM4hlPTaAY29e75/ozbesNG6DGaTn9cHTHwQ0E3faFAcCcOYwf8SIibKp+DSMih+neoOiQwz6g8j4JuHk1g3OHeItuRZOlnOV5HDq1175IK72nnHr0e0hnYJ1gXwKJK8piwz74AhCMWsxI3sFTuxBO86qr+QZqDyjnakleFFraA7HsIE/IR6jMTESWjjynFU7sg+BH6+J0RJ7FYZQPN/cjkxUJwbzVXekQC2P4m1LeS8lNy+FrFmBvzp0FO2f3sZAr8OYGWqtQkc17+NFLg+8F0QBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSEgtWVmZMmDyNWfSBOkjN4Z2kqxrKQSJnt4xcqVahQ=;
 b=fvIAM5+eoNy5izKt/OTIzdhiHABANEnP7rQlhv6NTrjZXwrrhuGj+hdRGzN4FXB37+zVlRv47wDQELYfpX0nzv11xhAo0q8C8YZI+hJD4tN5PNGCTLO1PDZUCk0/AcDozwQ70k6jWnbzrKMp4/nceTUbrkTxYKC0mxKK/SPpQpue2729mYyaZXsk0SbT4cwWZhgalG3zSHHlgp4Y9brMgYSihTf+uWhiKZbRvWT4pRvFazFUOkVV5VAP96VddJipkZSxlSbG7L8UXvfo1x3AOYIc7BLy4d7M3eIobEXKP4mkbunjVNcA2kaiFICe6doYvEz82vR0vMxa+1vCjJRwlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSEgtWVmZMmDyNWfSBOkjN4Z2kqxrKQSJnt4xcqVahQ=;
 b=Mt9b4KLUA0wwT9lQntMFWNx7e4Si9Za/fSakvjpls03sn1Ek9dTttYPYIWn1rWIOeBHbPNvF/cjzHMRDyMYvkm5uR0JHcFmm55FVzqPLIwN2JaAykkyPUmHUHKhwEEY+3DMkV2Pf/f77sRUXDaPMMxmRr0iJb0tJkaeKEnrftug=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2187.namprd04.prod.outlook.com (10.167.8.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 04:15:47 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::31aa:d179:ec71:4a66%9]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 04:15:47 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH 0/4] fsck: Check write pointers of zoned block devices
Thread-Index: AQHVVmhg3JlODH+1wEOrVWhbFdU0q6cEVJkAgACsy4A=
Date: Wed, 21 Aug 2019 04:15:46 +0000
Message-ID: <e13703fcd8d781d4d211651011d16b10f27cdb0d.camel@wdc.com>
References: <20190819083034.18218-1-shinichiro.kawasaki@wdc.com>
 <20190820175718.GC58214@jaegeuk-macbookpro.roam.corp.google.com>
In-Reply-To: <20190820175718.GC58214@jaegeuk-macbookpro.roam.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.4 (3.32.4-1.fc30) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2198e5c-8086-437e-ec34-08d725ee3e33
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2187; 
x-ms-traffictypediagnostic: CY1PR04MB2187:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2187D310D0A7782172178C4AEDAA0@CY1PR04MB2187.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(189003)(199004)(5640700003)(2351001)(6436002)(6486002)(44832011)(86362001)(76176011)(26005)(6246003)(36756003)(486006)(229853002)(6916009)(5660300002)(118296001)(6512007)(3846002)(4744005)(446003)(476003)(91956017)(76116006)(2616005)(6116002)(66476007)(66556008)(66446008)(66946007)(64756008)(11346002)(14444005)(256004)(6506007)(478600001)(102836004)(186003)(25786009)(305945005)(2906002)(2501003)(4326008)(14454004)(7736002)(53936002)(66066001)(1730700003)(81156014)(81166006)(71200400001)(71190400001)(8676002)(8936002)(99286004)(54906003)(316002)(58126008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2187;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /KzY94OkhG5TXIhdpbedTMAUkrpbtNqzvNCxjXGPRYs1m/RSOzUnT3pBtBdNWT1nFOYyOeCvuqpb2MB9xT71FnppiSkOZUMCa0tOj6DEV4QDW267kpYwWHKM+2Z1nVglK8xWP4+AlA7aw2cZJiALE70smmCxk3oRPogsstwLQ2XkFCA4p3reQqRMnTGJF/SpXAQlZCRYeRFC/l3JMbbqOqIROXOCv3mX9ZERpjM90s8bxirk5TsH7HaAZor0aQDXmj89wLlN4L8VmxypurXg/Eutu1o/PTPbRf6tFGrVepoSSzpSIF96CAG3VL/9HStHRSTnBpwOeZFXt8k2ty1gKb6w5kcuenQ6j6IvvT7blXfcUnnRWmmZroe2x4SdyO61j6U355zA6Dwl2XITiHJugPNslUmoYYljVFCxDJTTunY=
Content-ID: <534FAD731B593E4FA1B3A43E3D3B6F97@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2198e5c-8086-437e-ec34-08d725ee3e33
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 04:15:47.0729 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EUguaaOw1xW8OWwEL2+QbTWPg7vrrjxuuQIr8dLkTquajN1uz5a9P+jwRxMhgQ2gMgBIuESAd2FxQzahvA1bWAGlBQVs5ebhdrjCD2DskjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2187
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i0IHL-00A9c3-OO
Subject: Re: [f2fs-dev] [PATCH 0/4] fsck: Check write pointers of zoned
 block devices
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

On Tue, 2019-08-20 at 10:57 -0700, Jaegeuk Kim wrote:
> Hi Shinichiro,
> 
> Thank you so much for the contribution.
> BTW, I failed to compile them. Could you please take a look at them one more
> time? :)

Thank you for the care and sorry about the compile failure. I checked compile
pass with dev-test branch but did not check with dev branch. I took a look again
and found that I used MAX_BLKADDR() macro added only in the dev-test branch,
which causes the compile failure with dev branch. 

I tried IS_VALID_BLK_ADDR() in place of MAX_BLKADDR() and confirmed it is
working as expected. Will post v2.

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
