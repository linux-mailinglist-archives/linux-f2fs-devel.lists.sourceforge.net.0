Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C28F53C0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 19:50:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT9LB-0008Nt-7s; Fri, 08 Nov 2019 18:50:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=20831143c=Chaitanya.Kulkarni@wdc.com>)
 id 1iT9LA-0008Ni-0A
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 18:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l9878wIrxKKWXUHm58f2RklIM4TRXT/ZEmsge8xZ00g=; b=Q80EVY6XyT7XyIdfntpTY5VMGq
 RL7cviBiwYNDdvDgZR4fZCA5dEFeF1zzuLVU0URtHz81dW5k820GkIbmE6RXE9ns3EXMSmU0wE28d
 iLd7dW5fQG8VGTPyxeq+4B6exyWG9b2maG8uIrTs0jKadqk5NIsbu+iojx9Pl6RoxyTY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l9878wIrxKKWXUHm58f2RklIM4TRXT/ZEmsge8xZ00g=; b=Z
 LsbYGfr1FOAoZTteM5bKOWyUg6Wy9sQA/50fha275L9h3Yfu/UTLDGK34QAWKmpkFYE6wEzOsRXLh
 2Nb7GdxaqOweANp9m+YG+a7ssm/p1+aJ4a8/cUiFeLhzDd48/l3aMfc8PpPWd4qveSBDvMGQgpHsR
 DNCuLHnsFoTSZ/Ys=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iT9L8-005jwE-Ge
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 18:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1573239035; x=1604775035;
 h=from:to:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=MMT8oK6f80z3AxJMhfh17WJXlM/067bjRtHO3CL6iBc=;
 b=T7VPrVep36wJWCmWKkJpA5JrvebnFy5BM4TORlZD9k2WalLk1ymtK+TE
 NzcZZH0NDuU9grOpBTwgJfnL/akUNPcR72URGw6gU79z0j5XZ3yDioVAX
 3Od4eVAxbfdV9s9oN0BizMs5wFnwoMuEKbQ7jxuYr8zrVN4M84e0dTTFQ
 6w6ueLee0/MCG/T8z9mKzQmVZQvUBx2bfYacCkmtUuD/s54k476c3ebKG
 Dw43QhqdsrmUzdSgIilMgWWgFdzUX8xc+R3JWJUmrXsVa4rEIAU79yd/P
 Eo7tVt7J0ZGkMMI15YYMQJ5Wf3E9KdEILUO2pugud7wrAeNv+T2p3Qq5h w==;
IronPort-SDR: OxAJnPtem5ArCNNmgAVdLDOppM+BK5Tb9NnJsuKeGM8R5R4Y3a0T7nCp6T54Md7PGlVNLpLk1t
 lcKJJRshIyytgz+REu0JZ3KU+HneXrpzBAiWc2xz/nLrT29p4Ym7r+W6uyNwiIQfX7bzm1TiIA
 NitoxPqaHsDdEoVA4/ITi+aaYiwrakwCDBc4fKLjAJU9quLVe8HT8ddxmikm3G+0g7yc1ZIOi9
 Rr3h4CVapQ46nbsCazkoO+ZQkXu4IP0uXXjK+M1Gdrsbo5I/xt/AcotqSbuHxsOLSF74BPhRqT
 E3E=
X-IronPort-AV: E=Sophos;i="5.68,282,1569254400"; d="scan'208";a="126961447"
Received: from mail-cys01nam02lp2056.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.56])
 by ob1.hgst.iphmx.com with ESMTP; 09 Nov 2019 02:50:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WTwE3aFfP+gppccZDMRR5XzZv22htUxNJz/XkZUPK5OIPPiQHZ54RK0QdlCDtEtD9BlRO8XWWyq7JXI/3gzAEGRQorRqkUkzaYNH8MgKMB2rJ0gP+YQtM2FOOPoISGawIOzSe/hN4n7F/z4OQgGcdGGeLLiIHPX8bBzC23IyZ1IjrsIipDlARP8Unk56ZB6fhAfk9bdrnJsDa12ZyKVXJSUojUjVviGcJmWb07OhXHfPomsLkmUwJqchRkitj+8UeUvokRq6iby+823kkfSyKNlY+9iR0QA/mzFCt4k2YjetoLL0JCE+vG/xT5qpBYLK+LqOF+i6eWljwYtU3BLl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9878wIrxKKWXUHm58f2RklIM4TRXT/ZEmsge8xZ00g=;
 b=e5R0MIzkHJBLqmf88IlUk+zgUHnAP9yqDNl2vQ0mqew2drMUX0oB1bnTyUlJcfKcq9mOoPk6V2RUwKZJjJmJdZkXVwKDRIqV5DaecomoL1zW9ZrfXt9kG8WgYoucRnaZaFG6IjKMLtsV052HKunBFB1Jbb+9dGbeFACHovQ/Y5Y7+33+w6Pd21pRuwZvgnfZ4oi99I995LMOAjVNG7w8SV0CduobcxzIllcWnIbvJ0FyK31B5N+604L8pHduTRO+BBxaF+T46SaBkcut0WJePIWwrlaMeksCRH4ZQGrOhORdkHdkDW1p2Yq6pPI2wyLolmifD7ke/zbHlkLkosfutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9878wIrxKKWXUHm58f2RklIM4TRXT/ZEmsge8xZ00g=;
 b=PiMgTMIcDaV701I0ppo+y45FHF2nKsIl//72iIvXcJrxmASimMWSf1v5forjDhnZfZ5ABUPy3jxL3CVktnIqFUAm4TjCkOM9WQvik0UQvx3hoMcV/Sjv3MtIli/+fiAHB1yu/bWsN488kZRdyLhSgqViUIrqxYGHwKMruJoBME4=
Received: from DM6PR04MB5754.namprd04.prod.outlook.com (20.179.52.22) by
 DM6PR04MB4042.namprd04.prod.outlook.com (20.176.87.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.25; Fri, 8 Nov 2019 18:50:22 +0000
Received: from DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::65c4:52fd:1454:4b04]) by DM6PR04MB5754.namprd04.prod.outlook.com
 ([fe80::65c4:52fd:1454:4b04%7]) with mapi id 15.20.2430.020; Fri, 8 Nov 2019
 18:50:22 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
 Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
 <dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH 2/9] block: cleanup the !zoned case in
 blk_revalidate_disk_zones
Thread-Index: AQHVldfc9s3RcjAaAUWO67LxGbcSfg==
Date: Fri, 8 Nov 2019 18:50:22 +0000
Message-ID: <DM6PR04MB5754E84538F2E0AC9C3FD797867B0@DM6PR04MB5754.namprd04.prod.outlook.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-3-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chaitanya.Kulkarni@wdc.com; 
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 335b990a-eac9-4400-7934-08d7647c8272
x-ms-traffictypediagnostic: DM6PR04MB4042:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR04MB4042D948C540A667C897611B867B0@DM6PR04MB4042.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(189003)(199004)(81156014)(229853002)(99286004)(14454004)(66946007)(6246003)(86362001)(102836004)(4744005)(8936002)(305945005)(14444005)(486006)(76176011)(5660300002)(66446008)(7736002)(446003)(74316002)(81166006)(478600001)(66476007)(66556008)(64756008)(33656002)(9686003)(55016002)(186003)(52536014)(6436002)(476003)(110136005)(26005)(91956017)(2501003)(25786009)(316002)(256004)(7696005)(71200400001)(3846002)(6116002)(53546011)(6506007)(71190400001)(66066001)(76116006)(2906002)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4042;
 H:DM6PR04MB5754.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VefVcdWrIleAOQ3p2ujBxXhf7nDGY/mWMgl1miqXRiNkPRH/3yNKUPdqBrZFONYt2zIPOgHuCsVfE5pxxb2sVFF5Ewp+7y8iwrHpzK0PBYNJYgQDhIZ0FXBPkehb4cH6bilx+s1CW71yZaHnralPe0ae492BqAzF2Y4AN49KZfLoxihP/+wru6mDrQMu1fcNpw5irXx0ipAn9QY2EXq5I4KtuBJoz0bo2Jls57xHv+EC6JdIf41VZDDycWPN0DhpeyDDC25jwpiaLdIzAqji3Akh7s1UaQzz+Wn0Y2iliNxSrtkR3bjF7JZ6cR5zY3MZlKLBMeVzYbkWfeX9WKyUGh8IvzL2yVz5jp9EQnY2D3EkULohxfqgpWmx8zGA8MMZNUbmgTxI/hifHw25Oba4iFGkLEdjkRiRtkYdpMKWmo4zvZgW/1vgReWpGBFmjY6
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 335b990a-eac9-4400-7934-08d7647c8272
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 18:50:22.1658 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +/mqLsfKPN3fR+TDy77ZwhjMImDOwK/kri/RvC4q0GO80xZhwyDiqmL1NWs7qnBqBzYH6yUBd8F/q1coVcm/pTrSxdRZINhHJecRK7nqAHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4042
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
X-Headers-End: 1iT9L8-005jwE-Ge
Subject: Re: [f2fs-dev] [PATCH 2/9] block: cleanup the !zoned case in
 blk_revalidate_disk_zones
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
> blk_revalidate_disk_zones is never called for non-zoned devices.  Just
> return early and warn instead of trying to handle this case.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Signed-off-by: Damien Le Moal<damien.lemoal@wdc.com>
> ---



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
