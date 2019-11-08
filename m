Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B32F53BD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 19:48:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT9JU-0008IU-0R; Fri, 08 Nov 2019 18:48:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=20831143c=Chaitanya.Kulkarni@wdc.com>)
 id 1iT9JT-0008IN-2R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 18:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elElmSSq9ePZiggQdGed8+mTorb4xR/RDrYzsT3WQ1w=; b=ZDiumzHXZ9Id7MUF5xYSsGFwGz
 Swn4xSB/w4v2Qqny8lk9MNCacIhIeV6f6HEeSyjilfN+6zTzE3KChZFxcGGaZBRtpHVClW9thWtil
 bQZAChBXvAb4A3bkNpnQSgxddkor7FoD5fZ/TtF1fFoyQ1DlxEp7oCD2oVobgWBScP3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=elElmSSq9ePZiggQdGed8+mTorb4xR/RDrYzsT3WQ1w=; b=f
 mSORgGofQQ/CeZhMTL1Cs0jxLD5mOXqcIxG5/FFtMjoPXyla6ZQ2k+4Idk+T4/lJn9mphGeA9fsqr
 Ixn145JwY8mMIfbVu6q+kVIAQV4mvSpgu6QIPNp5B83qm3H2mW3TCIrbXa38pmXWgToLVCW8t3sgD
 ppGT/IZAoLL5nHlQ=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iT9JR-005nCj-UV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 18:48:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573238930; x=1604774930;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=elElmSSq9ePZiggQdGed8+mTorb4xR/RDrYzsT3WQ1w=;
 b=dUVjykmf15IAr6iekn6OI4DuOjTyjoUWtHm0J+IQ/10cw98cYAEsEn3h
 ut0EDUB6+lwGL2RPkPoEeUolJsFOepauvhpCcNy+NiQ8ShJc5RVt1scKe
 2anircYxWQlU6jEd0XCpMSVc64aN80iuYr5luuQHuGzZpOOLSX7dyHFvh
 DTkzn6SglxyJ+waU6f1ydV0q/VrCohShNGexinV+ZJ7Iz8rP0PH4Eqk5y
 0I00SopFOmLmBMTJJyD3zreLHvIWMH1hy9TIfe68rB3atDQU1ne6cuNmO
 NLTt/u7xbN6YyrTRcfrjT5MUOG4v/i3+VdcUAflFX0HX8rjpyV/4GRbUl Q==;
IronPort-SDR: h9LLTtQYtzPsgUxk0j5oTdJxze6cW31jFiv2uqsYxN+fE1wm9cKU16j4B1vqr+wlWVV22q8F3r
 a75+spcSd4eO5mUvbU5+0jgfyna0ITyu7H0OhpNPphcAxDWFLOYIM+b82+ki6pUDUvj+vUJaVE
 TXCEko+xhW8QZ05sc9tLuINPOK60HO5Kj8+zMKc7etBGbvQ09GhDkMjH02COoOVKsupfSST2h9
 OsDcYPVU2YPeMr+H/AKyM5b/HCylClseb1Rn8siEHx7PQZyoV5+NUZipdSqM8MZocWEAV5nT3i
 Gu8=
X-IronPort-AV: E=Sophos;i="5.68,282,1569254400"; d="scan'208";a="124136728"
Received: from mail-sn1nam01lp2055.outbound.protection.outlook.com (HELO
 NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.55])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 02:48:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWL6/+2926gLtOcRenKZPeY9O99rnQO5+cqJReFC9bMUNYM7uePVK7nWSjjRl0OUKJSquTgE6gIww259gl62so8sQr4fla1XBnKXGR0tXaSfwVgEB7n8J1RaJ5gN1uQ+pwA6BPS7PrDffL82fD8uHh22bD+6XhR6zAcAqxOv5nldvlgcHDpGwJkuhl+SA/fpGZwpvvdbcy+x0TK1o+CIPwyfuWjz/Fi//gAGWTrsb8NdeBQajuBjf9OwjvYDwaqMRb/ZQK82/DyCkn+TFCNsTrsd7H6hepkH+KHKUV1do8a4W4ZLUfNUzSwcCp/SZWcU5uitajBhBGLOXjcjJ1u2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elElmSSq9ePZiggQdGed8+mTorb4xR/RDrYzsT3WQ1w=;
 b=K0aJrkT4PhQi4qMyAYBvhO8cTJBYBcRNUEFuwNW0/qxjjxDVz5y2X9IPjC4aV+4KPtc/++3HVvoF0sQXI83WfBGDQo0eku03kiCeVG4iuU+LJIhBAU43r4McbZuMGlfBpUVdH7igKEEMqt9l8RvfFENATTcTU7I0Lb2G2z16/ksPz0y9C2XL6eOJguYFTs10p5cNiIhHQV3IxV2HLqCAXYtJyJgmo+mnoDJCz7vI57jAWC632r19bQ8YBeTpYRSuPC6F8BN4h4qIaYbcQ3Bp3NtUSM/tkX5XvDcJTJrwxYzUqbDdlzf5nn3Baez9dNWuzNY5398uJ9AqtFKOsN3MLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elElmSSq9ePZiggQdGed8+mTorb4xR/RDrYzsT3WQ1w=;
 b=PfO5fdIophYPQvY2dT3ziTGyPEmFVMAhQTfKbNecKzUfbEHe4/gWEplcp3tXEQPLa48aF5H8fyaL37VU0S8BTno/F0I5XQkVQ51DxNGa/GdZtK9sz/wGvwVyUymCE0xfKs2vPyaU6EuQqAleOVmQIgSDblH/Uv0+7oFYLoJLyRs=
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
 DM6PR04MB3993.namprd04.prod.outlook.com (20.176.87.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 8 Nov 2019 18:48:43 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::65c4:52fd:1454:4b04]) by DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::65c4:52fd:1454:4b04%7]) with mapi id 15.20.2430.020; Fri, 8 Nov 2019
 18:48:43 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
 Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
 <dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 7/9] null_blk: Add zone_nr_conv to features
Thread-Index: AQHVldfeADQIZN8MvkW12chh05+aBg==
Date: Fri, 8 Nov 2019 18:48:43 +0000
Message-ID: <DM6PR04MB5754124089E14F2575C8412B867B0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-8-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 69678c29-0853-48cb-72cd-08d7647c4750
x-ms-traffictypediagnostic: DM6PR04MB3993:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB3993BABC096940C00E202208867B0@DM6PR04MB3993.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(189003)(199004)(71200400001)(55016002)(26005)(446003)(9686003)(102836004)(86362001)(53546011)(2906002)(3846002)(52536014)(66476007)(256004)(76116006)(5660300002)(64756008)(305945005)(91956017)(76176011)(6246003)(7736002)(99286004)(6506007)(6436002)(4744005)(2501003)(7696005)(6116002)(186003)(14454004)(110136005)(74316002)(478600001)(8936002)(66066001)(33656002)(66556008)(66946007)(66446008)(81156014)(486006)(8676002)(476003)(229853002)(316002)(81166006)(71190400001)(25786009)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB3993;
 H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KdZl+9ZAS3k06TQANsrW0In9tCnbakjnHijaznydDPPfmjVy/dSy1ciq6hGNZu1x67E1CPN2sWrQKB2trWx/dkrWnsPiwomw7YttiryNIXezyaGiq0RkAHvbkhnMAdOGv8EHZfUNppQGTEEG29y2Imia+5YnSy5H9dDG4yzSuzgnk+GxEfoAqWpK1zN56p4ceXRxJuq10DCa4Wzk3jGhpaKJvgxIs/hSmU7Pl1RdIFbBeF1GDs2Wffc1VH4JiIyM5bIlABAlCR+8x2iCv8j93VGl/JBgzhglhFNmVkEXVMCQat+KeHfzOSb1PumxerHFCqWjKIHIgB+2Kyxf5Ygh9h/AZASfMohUhY3t1WmjMJB1uFjeajkZXujD+aLc4PTVYwmaB3+eUicHslm9D5sqcDFC3vXh0XuF/UxtiHIQhqhcbcIVkCrYQTovF0SwMaUv
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69678c29-0853-48cb-72cd-08d7647c4750
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 18:48:43.0252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxHr0NCf8vZJFcYIBdC6kL2UJxDIkbOSxFGjCHeMOY9OXUCPPAl0gOgk1hZvTb2xXlS67q0HzikANMNEu5gmXGaEfXQpYcbKhDSVNsgi8RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3993
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iT9JR-005nCj-UV
Subject: Re: [f2fs-dev] [PATCH 7/9] null_blk: Add zone_nr_conv to features
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
> For a null_blk device with zoned mode enabled, the number of
> conventional zones can be configured through configfs with the
> zone_nr_conv parameter. Add this missing parameter in the features
> string.
>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
