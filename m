Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6582C7EACD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 05:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htOdW-000457-4h; Fri, 02 Aug 2019 03:53:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=110ebdbc6=Damien.LeMoal@wdc.com>)
 id 1htOdU-00044x-3h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 03:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Lni+A8Q1uJZmLSmQflZzvJgKh7NpUc8jTjnBlTC1Bw=; b=Zj7gC5qPZI6KhLOZgkc4S4MXTw
 oIlZJgafdlmyWIC4Htf77CAToS9AK0LVtSHGQz980aBZs/NnRl63k2Kb5zg6gYKa0GebKXFhjIQi9
 AXxhfEfKYTR5i973k1ucnPAbc3vbV8LMz2F0cyzA4cM2cVpxFQ+RNw97Fc+lSHYzwug4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7Lni+A8Q1uJZmLSmQflZzvJgKh7NpUc8jTjnBlTC1Bw=; b=Z
 qXkBOQCxgqJQ1cr2N7nuguzY/NISRnYTuBbco47U+puBPF1NmxlBrs/gs1rS5HM5hCJpeQMlvzIlj
 hlnzEdaLz7WA4d4206a7Tbm+d/13vFo133NbSRUOetiMUDCXeB2W82KcVsvtzZ59v0SEvApsN0rc9
 0jSnIl1xLVeJ2+uU=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1htOdP-007iBy-54
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 03:53:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1564718033; x=1596254033;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=7Lni+A8Q1uJZmLSmQflZzvJgKh7NpUc8jTjnBlTC1Bw=;
 b=gBLp59+jrxquT0gTfou1i2OIkYvdipA/rayoC7qv7p8H7T6iWV+zXUMN
 BeA5SUu/1I44y52eqYkZlvAO3JHzPYqXNkS0p4vZ2XKtU/a5qcMsvg5Ww
 +L+yQhQnQJsu7eN5P0rDR08joirQyqinTxeyLntRqhGMuN3wCSEbR24tn
 hrC+85U2xwW1PIs6BqaLYJPaxnSnCrrlJvId3WumMBZQbA7I1btx0uAkS
 afPC7PkychxMVdYv/hynoallSx3TfQQws4f62SVgRJBQ8fpz6wtlIuzum
 FDdLc6zQUZSRWsJ3UYCdyvrXw41wgBY6G5HaIlS9QTWzDM+fwIwswiWhg A==;
IronPort-SDR: /jZxDDTslCRTD+1PbnAwPjy6YRfMbhTFewDOIdnBJK1XxBOJK88WBCBOsjJJcBk46T5muoGGnh
 bL3DKZUrwnyE+kyVKEfHHZ/+t7HoX4pwmrWR81fkRsJ9+GmgEk/e9ojSNp56ys5zM10V53zhWU
 molb0Cfc8FlnseMQDYyRJmYyzD2Hq1t3jQ21ChH8Jng5rdxjIi/qB3hWV4+KDqX3xPrKK/ZU5B
 Gv2AQxqXtwCrXv/SofZsLdDaZKgpzoRpc/tVDXDKPnZoT7j1FSJSYZPF9ySctkHLpcfH9f80uA
 884=
X-IronPort-AV: E=Sophos;i="5.64,336,1559491200"; d="scan'208";a="214987982"
Received: from mail-cys01nam02lp2052.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.52])
 by ob1.hgst.iphmx.com with ESMTP; 02 Aug 2019 11:32:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyk4DNbdULJWX/AIJBgY6w+ZD/RX46mMvGE9ebbzh1JcyvLICxmJ4HcFFRQXWvMQCP1285lw+edbNVhPgKvJL2IDtnWCylJEU20pUvG6FUbTgpZe48TEakhRkW4zMYnrIgKChy5gPhNuRpBG/bA6Ee9vD0SgVA1sjYbjY8WkWEp9RIJPIUE6RxvtCoc72sWycQP6JeCF2bz6fqeQSIeMHzrrEyuqRJjhd99HYdBPs+yghClhfdJopg7j4+OcQUatEhNsJwMhKkld2KoSbiYP2Gw0RIiCFtqrZVuH9f9cDYKKT6g74pgfBBiTbygB4BeGDpG3YlxYAdoqXzZtjFaaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Lni+A8Q1uJZmLSmQflZzvJgKh7NpUc8jTjnBlTC1Bw=;
 b=cP2ULEYQMBkzx72b84xDD2Wkh16oqc2UJou5kPBFCL4UzIDp9Ye1QWf5bWE2xTsRnaFEa3oiwTnc+1nS2x8+AIeeAN1swMVk2RGWAhnRzuafz5xz84wHbXyZudo62cTqLsU7v5jHZj/mAZK0cqwNceS/Kna8LoOl3kuzuyCAaWRBaV6I410bOfAyIxp68F6bP0t0I/LmIqqRmrVsK4R1hCClBsD7jHVJSEnlLLkY4QfQh0kqMTy0Wl3G0u9eAApxykhr8eITHu6hdrFrT+TT+olGtF3GzWHwYlJ3dhT5O+edjsCFWsUU/EC2tRvqe6yk8lzoUn6tXG07VMLswl8rbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wdc.com;dmarc=pass action=none header.from=wdc.com;dkim=pass
 header.d=wdc.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Lni+A8Q1uJZmLSmQflZzvJgKh7NpUc8jTjnBlTC1Bw=;
 b=xfr3KN8bA6JMaVJIoT8j49bNw40l8xlizI9mgqgIeiNPF2Li32VERfnfbS3eLvUpsPVy8LcD4MBD+9daItaW2MdAEAeDnrJUNB2Iuutt/3GNTVa01OxzKS00uCYltsyBCUknZ56ZO9qFoM0J2YbcdqIyPlmwpjU6PWAE6glNuIU=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
 BYAPR04MB4726.namprd04.prod.outlook.com (52.135.240.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Fri, 2 Aug 2019 03:32:28 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::65a9:db0a:646d:eb1e%6]) with mapi id 15.20.2136.010; Fri, 2 Aug 2019
 03:32:28 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Surbhi Palande <csurbhi@gmail.com>
Thread-Topic: [f2fs-tools][PATCH] Throw an error when zone device info not
 found
Thread-Index: AQHVSAghuBi/RFZAv065oA6TAAkkyw==
Date: Fri, 2 Aug 2019 03:32:28 +0000
Message-ID: <BYAPR04MB5816F2FE2D32047ADD06ADA0E7D90@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190801012617.2472-1-f2fsnewbie@gmail.com>
 <BYAPR04MB581626A599C2601E1A6BFAD4E7DE0@BYAPR04MB5816.namprd04.prod.outlook.com>
 <CAMBkX3cF9aQ28rJ2XYZRjfyYXNWBREmc9nZqgqMtimM2eHsEXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc5bc20f-9f50-4462-e2ae-08d716fa0b5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB4726; 
x-ms-traffictypediagnostic: BYAPR04MB4726:
x-microsoft-antispam-prvs: <BYAPR04MB47261CEC3D8890EFF6B0038CE7D90@BYAPR04MB4726.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(199004)(189003)(486006)(476003)(6246003)(55016002)(1411001)(102836004)(71200400001)(53546011)(99286004)(54906003)(25786009)(66556008)(52536014)(186003)(316002)(53936002)(66066001)(81156014)(8676002)(7736002)(71190400001)(26005)(446003)(76176011)(14444005)(6506007)(7696005)(256004)(8936002)(74316002)(305945005)(6916009)(33656002)(6436002)(2906002)(3846002)(86362001)(9686003)(68736007)(81166006)(14454004)(66476007)(4326008)(64756008)(66446008)(478600001)(229853002)(5660300002)(76116006)(6116002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4726;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kgfyJUWR2lECIjw6QAlTVLnik+H8MJFMaDgfYDu5KrjtSXCT0tcc6A2IMHBtYhEc5bsByJ68NE1A3HKpd+NgYbGCMuhPop/HfTS+03OkKXwmTEslwJVmEHq2nMs2C/lIaypzPXaHzpY6E6/wLunSooYEceilXIf4Liumk+s5flAc0GRAcbJ7daN16p0XA8sYIP7mI4qAbOhRhSFBdNYQ3NJhovqXWg56if7Z6W6i/baKrR4gKTAjrYnT64mCocTgavjSTYsh6eIsmN86PU1Wz+qBEEAmNhboJ/HteFIAbaoQyd8gPyRN7r8YWLG3ylgxcZ/loI+m3dDpZa5nYjtMTBLcCOyO2c3M/YXGa5fISHUqrII91hpkkBFSCFtxZVgOFkHG3o5897n1ioPvNrI5uwEew9pIkfKmoEwhf++VWAU=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5bc20f-9f50-4462-e2ae-08d716fa0b5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 03:32:28.3445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Damien.LeMoal@wdc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4726
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
X-Headers-End: 1htOdP-007iBy-54
Subject: Re: [f2fs-dev] [f2fs-tools][PATCH] Throw an error when zone device
 info not found
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/08/02 11:53, Surbhi Palande wrote:
> Hi Damien,
> 
> I have resent the patch making the suggested corrections.
> 
> I cannot see the "/sys/block/%s/queue/zoned" link being formed when I create a
> partition on the HM-SMR drive using fdisk.

There is no sysfs /sys/block entries for partition block devices. This is normal.

> I can see this for the entire drive but not for the partition created.
> 
> How can one format f2fs on a zoned partition?

Good point. For a partition device, a little gymnastic is necessary to get to
the containing device sysfs block attributes and get the zoned model, as well as
any other parameter. This code is indeed currently lacking from libf2fs_zoned.c
and so formatting f2fs on a partition of a zoned block device will not work.
libblkid has helpers to get a container block device from a partition. This is
not hard to implement.

But we did not implement it because partitioning a zoned block device is not the
typical use case. Several other reasons too:
1) Partitioning tools do not support zoned block devices currently. I.e writing
the backup GPT partition table entries at the end of the disk would hit a
sequential zones, so the writing needs to be special to end at the end of the
device LBA range.
2) f2fs needs conventional zones and these zones are generally all starting from
sector 0. So these zones can be assigned to the first partition, but remaining
partitions would only have sequential zones, preventing formatting with f2fs.
Using dm-linear to split both conventional zones and sequential zones into
different smaller drives is a far better solution for creating multiple FS
volumes on a single disk.

All of the above can of course be fixed. The kernel already accept partitions on
zoned block devices and will check zone alignment of partitions. But the
remaining bits in user space (gparted etc) need patching. And f2fslib_zoned.c
needs some more work too.

But again, partitions are really not the typical use case for large SMR disks,
so this is all low priority on our todo list as we have not received any request
for such support.

Best regards.

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
