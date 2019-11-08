Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B5F53B5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 19:47:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT9IG-0000WD-Gj; Fri, 08 Nov 2019 18:47:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=20831143c=Chaitanya.Kulkarni@wdc.com>)
 id 1iT9IF-0000W5-9w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 18:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ReDcCz3c2YGvr6A5NNr6MwLnjLmHXbmnIWRtk0Ey8c=; b=KD3A2GevDzpX112s4zX1qX/SAI
 IqU30fM2UXK46P2IvHnBh0ZVmz3yFWud1bPmj2bcFIO8E3fbaCoDVXwcTi3VntbgZte6yAGHT7R7B
 LqHo+BC8YBqlPT7aJqWhNm0KWCS07jhpWPgd5hdABh/VbStqVKxhRltoJ2z/97pZAY94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1ReDcCz3c2YGvr6A5NNr6MwLnjLmHXbmnIWRtk0Ey8c=; b=S
 YwLYnASQ+JZAXnBKMcC1vyGUXMEe+wS1DTsjh+jO86WO2P5Fv0Ol/9sISRmZpkR4SdCimCaQd+XmQ
 qvLbmXSy00LmKEzCL1AE2odLKQ7U/vfr8dhutNC+kYmgR9yC6c33POxX2lGg7Ib2o0xFwF9QLH9uf
 XT9qWSXFHy/prk7w=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iT9IB-005moJ-NC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 18:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573238851; x=1604774851;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=1ReDcCz3c2YGvr6A5NNr6MwLnjLmHXbmnIWRtk0Ey8c=;
 b=JxQubE9yPZ8pYTtBZAaHISpNgHdHqLAGiWl6lXWCNJC7wzbmgbdes23N
 GcVdso7fJvklsxUnxf95H+o0C9ad8LI+91M+MTUISpKdd+0guI3codAya
 B0/ElYfkTL8DbsKonpGaVE4N5YLAvAywjku8WxAtsEeLFL67Cp2LbDD2q
 DbKwQmpRuHt5EqzzeopU/3yHwtQwfeX2sa2Sdj9ceGhfu+JubbMef9TUT
 cQCE78ILd3VcUMI04uc4xVUmQqk7AY04dBK4fspuhyeyT+AzucmeH161Q
 SRpK4dHE+5x5H8grPXD2jutl2WtZw9dqnaA9odYGneKH0TIpW5HrEFMpO A==;
IronPort-SDR: disVkONpimVkV+5nONEZ9mGi6c5MwklkDmknR1enp39E7OUqsW5qAwFf49N5CjQRrAMaWgvy7P
 mZnGbpfL6LGq06q3yPZruU0PeKhP1KU5eqtWckeiMjpQdr0DcFPXXiPbwHNJIkeF86QtJ7FPnW
 cd9/4Ol6aZjWg+aNmC6+Bc81M/8gCwpd1k4HDQO2VrUe07cv71e0NFrif7e2pNgN0D0JJ2KXXt
 KO5fOJw3dQaMZt9xgLWFLnchFe5wRRryHxlAeh6O/WHL97o7/5vyTYP8kQTsMIwnZyEuEmp9qT
 4y0=
X-IronPort-AV: E=Sophos;i="5.68,282,1569254400"; d="scan'208";a="122523783"
Received: from mail-sn1nam01lp2058.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.58])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 02:47:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvGP1+kK3dQAhYbaYITlJRa0dJeeaUvdfCMe/f6JMchOy8hAzozfcXdHxoUKxUAywxXKJD4tFHOz87/I+1isxh1b7382lb0gU+ImdmY+YAjLTKdoKhX2fQbQuoxxDJpIBCtPuUSf5nEagFEeHAQCog6KolvGVxEYMwSbf4bkmfEn7H1tRr/FWurKoQJLiEOH2Epxe0q4Cgitvr3SwgvYrStGPCPARe+IVnGLkzF8u0ZzX3BqUfyfII0fknpeNobpRyjDBYdanHmeH8w/P+X4T6r+QRNHtNM0TAyipOvTtHPzNoh4Jysdjl1xjY00cWcYpt3Iz/auybyAD98uIO+X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ReDcCz3c2YGvr6A5NNr6MwLnjLmHXbmnIWRtk0Ey8c=;
 b=j3bWzY2e0V5JpJmdGYqUv9Fpg7s+Czg96WTUpQtSC20dZVaqL+roIUeo/vARtG1XkJuUCivx8L94+v+VFzaNSl5OpSf6aFSeJdLPUaCuQ/jPP2iOUjOCpxgNbGx6D6fxDsTZ8LussaEtq4oNTDXqiO9XFgAFd8ZZb8n/DjBLLFWWL+HKLmf+GdR5Uw9NBnBFiN6kzsWEWm3MQroGuOI9upn5xM7jELKnYgkMfGomBA9zmXr2wEWvbkackOY5v+XnIo3PJiBHV/Q2BREuQR1lXGa56tp6mQ8UJpLMbdJ/OPqwHMOcFt9qEGqo2ViSeLP2tVyK3xnrpB2+jD6qyrJHYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ReDcCz3c2YGvr6A5NNr6MwLnjLmHXbmnIWRtk0Ey8c=;
 b=J7XAz3YWTelbONBA/0LCu/I1oKswqUgHCrVamfMJHTHv0jFrdnMDk1EBA1F1J8BRI69lXqi704Rxiox2qV91Tia+OdboxUtekxsYG0q7QUnZ1TdLEfXOm+juYxVeyR8WUjHWAnpqlYUmAp3F0QKUARIXc5WFAzNjA0HNzlXEGa4=
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
 DM6PR04MB3993.namprd04.prod.outlook.com (20.176.87.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 8 Nov 2019 18:47:30 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::65c4:52fd:1454:4b04]) by DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::65c4:52fd:1454:4b04%7]) with mapi id 15.20.2430.020; Fri, 8 Nov 2019
 18:47:30 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
 Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
 <dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 6/9] null_blk: clean up report zones
Thread-Index: AQHVldfde8HAJMYLm0eJIjLXj3HMAw==
Date: Fri, 8 Nov 2019 18:47:30 +0000
Message-ID: <DM6PR04MB5754D9A214040C012CF475E3867B0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-7-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 886f1a27-a8b5-4e62-ec1e-08d7647c1bdd
x-ms-traffictypediagnostic: DM6PR04MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB39932F80520D57A09F1F0D07867B0@DM6PR04MB3993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(71200400001)(55016002)(26005)(446003)(9686003)(102836004)(86362001)(53546011)(2906002)(3846002)(52536014)(66476007)(256004)(76116006)(5660300002)(64756008)(305945005)(91956017)(76176011)(6246003)(7736002)(99286004)(6506007)(6436002)(4744005)(2501003)(7696005)(6116002)(186003)(14454004)(110136005)(74316002)(478600001)(8936002)(66066001)(33656002)(66556008)(66946007)(66446008)(81156014)(486006)(8676002)(476003)(229853002)(316002)(81166006)(71190400001)(25786009)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB3993;
 H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hhMlDObvQsTnMApHfvrnflInXhg2RBqj35e5KCmV2MQfavQOcVJSprNcH+Q/ivZpc30S0HiLKpveqLwZDwWn8G7/qT5z8kjbrSAQz/ubMCF8NU4Fe6PHPmsur4+RiY9OLwsBxuwb1kLHatk3vmXFFiMAzftGpSsbWdCkZiJnRlIDiO7xO+Ex6k+pHpUtJHnQkX3NpCLNAOrmGmgnNBXXDpRNXVMxM4QyDq+Tfu1e0Ir6gT+rqyuUuC4UUR2MWcSRRU5YP2i61O45xI+k5yVa974OnbjbJm6RYcFLZTegkdsd7AdbfcOi7Ugg0zw3BGpTfXazGG6BlvCEVp0CdIU1KhajH0RNoDeoJzeCB/3uTgMnyFzPyviZUShIXM07xRb8GVY6ezf5y7GGXizsJ9nWfYv00lUxOTk5u97IKwWZITpT3QBOUME13WTgdV7M+ifO
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886f1a27-a8b5-4e62-ec1e-08d7647c1bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 18:47:30.1336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zR07IsicZaVwQGBgTwEg8+jr7oSUgMJ/++3rzMDgs6tH7RVP4OXuo5cxrTaIneWP/U4uAfHHAqsY7xMgRM8q8I2zAXCneAVsiPTxWZjd9/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3993
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iT9IB-005moJ-NC
Subject: Re: [f2fs-dev] [PATCH 6/9] null_blk: clean up report zones
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

Looks good to me.

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
On 11/07/2019 05:57 PM, Damien Le Moal wrote:
> From: Christoph Hellwig<hch@lst.de>
>
> Make the instance name match the method name and define the name to NULL
> instead of providing an inline stub, which is rather pointless for a
> method call.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Signed-off-by: Damien Le Moal<damien.lemoal@wdc.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
