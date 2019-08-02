Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF57EAA2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 05:19:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htO6D-0007Av-FU; Fri, 02 Aug 2019 03:19:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=110ebdbc6=Damien.LeMoal@wdc.com>)
 id 1htO6C-0007Ag-6P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 03:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uyaUXGJXDiVXc5LD0FJbpluKTMrF1pjVtVki5fPX8FQ=; b=Pm9m291pyMtCKXfJLBUd9OY4J8
 DlicA1tx6hOSZ3arSod/uf71CPDuQ+HyQcOLgKhc3vhOmhbIGKi/VCbGGcglPcZ+jILd1pJsrqPog
 9aWvKpzjKbwOX26T7R2AlaDZtQjTaB95kbRpV5xg82YIzSkQg9WJZgebGIQUth/x5Ob4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uyaUXGJXDiVXc5LD0FJbpluKTMrF1pjVtVki5fPX8FQ=; b=C
 eWe0FIS4j4daac4zKR45GYI1MeX5Vl0sbZ78L+3Vv2mN9XONGPTw3Xik4/oUWZ3+bOUBdY5FzWIDT
 h0w43xLnDG2imCQWuTf4Nln+8XsSLmXixo49GcvrndAlaC8TD0HTcp5vlefbBfO3H78t9W6fISJcS
 umPdHT3OJHGc+JZ4=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1htO6A-007HQz-8X
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 03:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1564715958; x=1596251958;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=W2ixnaPcsmefnpEfkPwK64YzGz9KVI7qTe3G4L8iaOo=;
 b=UEyhCdPWXYwVDdU5m0c9xu3n9QMVUbHImwKLEwGcI+TEwI/V74YsF62n
 oA0v6xwUOMJdFLp9O3Tje4yR3oflKV/+5gYQjci3SSOEf1j0RdCiBq08w
 1ieS8BvFP0sWx1MEqukbiFHDo7L5Ur0TBR+1YAWujarSmeOX0Ing9/CK4
 IyKrLKne2uYuydUcuQd+7kGqQpx/SkihnhTZKNcZnXrgPqfEleS5DgiWP
 6sArETs6Gsq1R67myhE6dR9hBuiMCmc/udC5aHoYSdD/MwTctYdLhqFB7
 QY+GFCFhdylvnNfDPpD/Z/s9JMWQgSPukST9pijHgbsSnOxC5e0/K0lB9 Q==;
IronPort-SDR: sN2t9GdTKJWg7x7bpLsoKR/hYnIZlF6ahAtOhh60z0thS7BMdagv5tXnXz1ixR+ytb67WMJ5Ln
 zsZauEk5Ianh1IIGST8OCzbK1jyTMgXN+QOlG7VhqQd1Lsph909xaCLjWguvcvov2gwunhHVkO
 qI354+I6VkKAimD+vsKQKa/g64eUTjt9tyOUk7GIs10mQwjEkSepZBSDk6h026MlGG2haAmpdZ
 Hn9niI+U7TuTvZmt8Nq60uVPYDSsHR1GmUVVPmLcjYyVlyKIHwCOjYt5HOnBgo7SsXJU30Ahzb
 m1k=
X-IronPort-AV: E=Sophos;i="5.64,336,1559491200"; d="scan'208";a="221237944"
Received: from mail-dm3nam03lp2050.outbound.protection.outlook.com (HELO
 NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.50])
 by ob1.hgst.iphmx.com with ESMTP; 02 Aug 2019 11:19:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOVJpE6HrmzQ0JRBOyAcNbJAVedhNKRwqL2OAhbJ071rsP92P45ngdb7IwJoBeXBdImQCntAyUNzETlUnDxmAmg25EbGqsUsuiNOCcQ6IdfVGyma820hzn0IykzQmyemFF71DKY3DyY8Sf2S32hroQg98uS6/SpBcFSnybKrJsKYz5n8AplVOEuNBcekTLlWcsvu81b2shb8Le3fvdwgJUsVpD4Az/bJoZDdABumQAmx0M7b3X+LfkvSebz9CpZmgeccioTKnR1WY42t77ivbt/GeOcjeD7U/n/m4Dz0GSCD0mBg3yC9DH/u4Xj2UhB13fVdJ7AmgJWZVeva2ZZr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyaUXGJXDiVXc5LD0FJbpluKTMrF1pjVtVki5fPX8FQ=;
 b=I2dKdc/WHuZwfvZ13BH0aq+8phIO3R1yZV2D64EdeswqRq8jtA6FWFmcFL1NbPL/LLleLM7Ou3Co1ItlBoxjmPqxRy9WZdzfbMNEQnV0BqLLm6P6ESX946AyA4ERAk8T+4AaDpYRG7srOQrgILLR726wLl4cRIv1LWmp+vyQtI2iVMaeMQunWBjWWzQamjt9n2O6blZclBeiQvmYkJEHdFSUAeFWJnaWYVB+hiMGVdUnaQV4pPlC8HIlM3lYxFpg3dAGKHuQ+NS/R+Piqge6piSsg3tG366+S8N3zWlCQLcQHqTfHNlOUwx1Z1YBEKmTBaEQigyloIKLSzf5iM4Dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wdc.com;dmarc=pass action=none header.from=wdc.com;dkim=pass
 header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyaUXGJXDiVXc5LD0FJbpluKTMrF1pjVtVki5fPX8FQ=;
 b=c8SKBHhzOEppTg8Uv1JPiAA7o7viNDmd2ASf1YdAjlwYAC2zwZMVfBoc6AE2X+BTi9w8Bd2Ax+fpSlWBhEaZsxVC3F+n+RQ4RVYw9Yzv9yyJmtVH0KKP90Jd62Q9w14scM7wXDrjhSRnsV5eiuCCMmH+rcNgxL2qMvB1ZdkIZAM=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
 BYAPR04MB4007.namprd04.prod.outlook.com (52.135.215.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Fri, 2 Aug 2019 03:19:10 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 03:19:10 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Surbhi Palande <f2fsnewbie@gmail.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Thread-Topic: [f2fs-tools][PATCH] libf2fs: Throw an error when zone dev info
 not found
Thread-Index: AQHVSNy4wWBCBPOgHESjd1oxCzwZNQ==
Date: Fri, 2 Aug 2019 03:19:10 +0000
Message-ID: <BYAPR04MB5816113F299B3C30C59A2E18E7D90@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <BYAPR04MB581626A599C2601E1A6BFAD4E7DE0@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20190802024748.17987-1-f2fsnewbie@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36ba244e-aace-4046-7996-08d716f82fe4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB4007; 
x-ms-traffictypediagnostic: BYAPR04MB4007:
x-microsoft-antispam-prvs: <BYAPR04MB4007FC81AD4B24AE75F85BF0E7D90@BYAPR04MB4007.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(189003)(199004)(76176011)(74316002)(5660300002)(2906002)(81166006)(7736002)(110136005)(8676002)(81156014)(71200400001)(3846002)(54906003)(229853002)(99286004)(71190400001)(66066001)(86362001)(316002)(2501003)(7696005)(6116002)(6506007)(6246003)(4326008)(14454004)(25786009)(68736007)(446003)(53546011)(478600001)(486006)(53936002)(33656002)(64756008)(66446008)(305945005)(76116006)(26005)(55016002)(66556008)(6436002)(66946007)(256004)(52536014)(476003)(102836004)(9686003)(186003)(66476007)(8936002)(14444005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4007;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VIU73iPWYdQRMwBO0LDzDinwqgMzlyMikZpxTdqRODo60A6+9gq49eKOqhB4piH1rxRm4t1M42nxVUM2axfoZW7RYc3VqQAmC0yaN+rmDkHrMdkGikD/3SgdjmXnkU3TGIoIqWAEBKM1+Me6adrRV5VjVlcdMOP+4NGQL4l3L5HLi0CipZD6EavYC467s6AgGJSzlAuaYq4m8dcBS6CwMqZDJlBi3LpmXiKXRCT9G0mzMVuROofgAHK+2t9yNizM33dxO1if5V11WbiByr+RPi4Wy7XJ2DxOLPId1DlRTOFLldS+OF4k0CJ+IQEapUdvOJk1iK1QuRAUMhOt93MdZ5j0eaUj9ePAmZkmQ/dsJGUD1tC+x1ITPYU78kXfTQremw9jowSzSjy4zoQnm4BdDeli6mznu3ieWIKMcmLwxJ0=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ba244e-aace-4046-7996-08d716f82fe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 03:19:10.6068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4007
X-Spam-Score: -0.1 (/)
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
X-Headers-End: 1htO6A-007HQz-8X
Subject: Re: [f2fs-dev] [f2fs-tools][PATCH] libf2fs: Throw an error when
 zone dev info not found
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
Cc: Surbhi Palande <csurbhi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/08/02 11:48, Surbhi Palande wrote:
> From: Surbhi Palande <csurbhi@gmail.com>
> 
> When the -m option is specified to format a Zoned device,
> do not fall back to the non-zoned mode in case information
> about the device is not found.
> 
> Explicitly specify this error to the user.
> 
> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
> ---
>  lib/libf2fs.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
> index 6b5badf..4966dee 100644
> --- a/lib/libf2fs.c
> +++ b/lib/libf2fs.c
> @@ -16,6 +16,7 @@
>  #include <errno.h>
>  #include <unistd.h>
>  #include <fcntl.h>
> +#include <libgen.h>
>  #ifdef HAVE_MNTENT_H
>  #include <mntent.h>
>  #endif
> @@ -1140,7 +1141,11 @@ int f2fs_get_device_info(void)
>  		c.segs_per_sec = c.zone_blocks / DEFAULT_BLOCKS_PER_SEGMENT;
>  		c.secs_per_zone = 1;
>  	} else {
> -		c.zoned_mode = 0;
> +		if(c.zoned_mode != 0) {
> +			MSG(0, "\n Error: %s may not be a zoned block device \n",
> +					c.devices[0].path);
> +			return -1;
> +		}
>  	}
>  
>  	c.segs_per_zone = c.segs_per_sec * c.secs_per_zone;
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
