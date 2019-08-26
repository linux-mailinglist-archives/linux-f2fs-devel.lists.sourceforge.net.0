Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 527949C69A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2019 02:10:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i22aV-0001Eh-Gm; Mon, 26 Aug 2019 00:10:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=13447a3b6=Damien.LeMoal@wdc.com>)
 id 1i22aT-0001EV-Ia
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 00:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R19WR1K3S2PmD2YzaeBQHtlxGzYPQIhPD84P+Yh0Zs4=; b=JwC/YU6TR8FIokIZNlAP7SEaxl
 Uc4/GnoAxinxN7lL9yAcbNcou6a/LiqjqQartODsO7PAorh07+5LpDV5ejm7Qel3ThtBhZA/CtYz1
 pheiydQ7DAtA+kAEf06xwvGp0Eo/R+/4UwemWPGMcY0aUoJ8fkoISV7SwEcAVl3lIE/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:Message-ID
 :Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R19WR1K3S2PmD2YzaeBQHtlxGzYPQIhPD84P+Yh0Zs4=; b=U
 K7VcdOrssUhUlZojvI5eXcxh1TJnqiGpeOyvf+4qze2ONyPiDKu0y+iUGA1E2gIAeiFdJuBa8VgPP
 aZ08sUT+vxmrwakENaCMR9ag67MbLEpH3mYEwf4sDPXfmWZ3jO3r6bGo/zCjYnO32neSKpa/pk2zb
 kspg7uUcwuVVQhCo=;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i22aQ-00FDpL-Pe
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 00:10:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1566778218; x=1598314218;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=/0U30VxK4yurlJePg7cq1TNRPNrEPmEQAAk3RWGrW+k=;
 b=fiDnY/C1Eh4M7XXxUVLTRwveQNzWazdQ5G/rwUxrf8f+7hpMvYf+Q114
 F2WZZGJAKVrBE21MAMtF6+AiJ5YKO6GmZ5lwuvsmy1nxwd9b8oHfIOtNv
 c35ZclG9Yo7P9zS659qrwP7VMU3qlveQC3uFu8WZQz2i0r1oR0q65jgQk
 AtHOkt/rHHDTcyerxOMn0Knpkm+pLDtvpQGEp7XZ5MiJzZHqO3MogI3ot
 Mgxh8iKPnYT/pxkVWORrcgJVhuB15gdgB5zjum52IBVi5yRBTdzPQxAgc
 s9U0vJq2JQ1Obe8RwvnIKM5qJnLz0xbP9DGIHWf8sRe7aZC6PdqI4njqY g==;
IronPort-SDR: PDkcaLb3XeMEKG/y6PTB+SWOKXVt6a1uwhmT5lCZASiO/ds8BSCPAgF6o+CmIhWRTcIF/XK91e
 elNcXzTNIf92pVpLuLiMJ8ukdV/yCD64SE8WNCFwwe/NIymADmS7Yb5aJPr2nxuxfLl4n2IgTZ
 qm1gC5vMPoaAq0bo6d2Nly/mAE1Szg95WljI+zpVc05dKUPrJXu2vLeJUoSmiaRd1fSrXUtGu2
 KGjXz2SWdBBrUYRVjcmKMuy52Mk18HIpGPl3UlPt+wqqRAjF47m5/6401PkmY3MefcaJVFbw28
 2aI=
X-IronPort-AV: E=Sophos;i="5.64,431,1559491200"; d="scan'208";a="118225770"
Received: from mail-sn1nam04lp2053.outbound.protection.outlook.com (HELO
 NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.53])
 by ob1.hgst.iphmx.com with ESMTP; 26 Aug 2019 08:10:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJjKlkNdTCnXkwuVPY+rD8dAgG1wSySY+RGDTMS7a94v9IQa5bn2q4OE1M017RGifWhN1VucIOl/mJt3s5cCZyT6x78OcV6saTDdyRckYrOjE/QiLFbbt5yYpH1ET/GH7zfuoAmwQjPoyXP70hya/PCUV0MnyrdQix6G55aFEQELTWkCosNS7kPOwADmjeAxnEfI3kiMOgyzLiJTmSnLN3+ShNB919oj+e/nCWr213N2Vc1PRairOcq595d/bnYfclhsOHDvbJpVDKaqs4FvUDMBhVYEEL8yMg6j+dhvC+HxYBcdi3QICh9gLJ8X5CrCGV4aCFoMhzQnj0nNuvzlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R19WR1K3S2PmD2YzaeBQHtlxGzYPQIhPD84P+Yh0Zs4=;
 b=CFj0ZRiKlR3u2gSZGoJqKVbL53vMsKk3Rjzs0xV3p4unRhfEMqYVFswByuFYstf/lVgMvYc2czGIFa6rBHsAQPTo9vNoF4LXWWMI8GVvDUMmQ+cJBIQ6XxvFvt3KhyfzYJpD7m7VQnF52XnztHA+KxGK+inzgjwKmyfQPnr0TVMHfBAvgpyWmydeahzGvRABmFN5AM6j73lHVL+Bntm7Sz5qyb1ddG9oGa/AVYHW25hWORKL4Ah0hCtHdibNd01mO0pmfbNT+lzhocsok7bV2bj3rgiaYVSnsH3fB5hezOSxyjPsmmHm2G3t8gzpmtrHJWcQUKPAO4heKMzJkyXi2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R19WR1K3S2PmD2YzaeBQHtlxGzYPQIhPD84P+Yh0Zs4=;
 b=PeoI8O09ZnNqQjpmEdkPewBdnpxWTzzRzoDAfeUyRNCx4h7DbhkjMowm9plDGVgmwCN9/7gTEcVw/e+6RliEimoPT3mk7S2hZHWzWCpBrfd+AtE5W2rmbfqa+pnJ7cHktGfKN6Q7PXzZ2Lrr/G5FubWhtkzUC79hlegMuBW7rX4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.58.207) by
 BYAPR04MB5925.namprd04.prod.outlook.com (20.179.59.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 00:10:11 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::a538:afd0:d62a:55bc]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::a538:afd0:d62a:55bc%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 00:10:11 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Chao Yu <chao@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v2 0/4] fsck: Check write pointers of zoned
 block devices
Thread-Index: AQHVV9ujfIgTZbjwi0GxsnJPxlNU1Q==
Date: Mon, 26 Aug 2019 00:10:10 +0000
Message-ID: <BYAPR04MB5816E9510B8836D734424059E7A10@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20190821044802.29702-1-shinichiro.kawasaki@wdc.com>
 <51daaa42-58b0-85dd-dcda-13185afe5b63@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46518867-4c86-46aa-8ae3-08d729b9c2d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR04MB5925; 
x-ms-traffictypediagnostic: BYAPR04MB5925:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB59256ED26A838E5DB6D3F443E7A10@BYAPR04MB5925.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(396003)(366004)(136003)(346002)(376002)(51354002)(189003)(199004)(81166006)(53546011)(6506007)(81156014)(91956017)(26005)(71190400001)(76176011)(186003)(71200400001)(8676002)(102836004)(25786009)(2906002)(6116002)(4326008)(3846002)(7736002)(6246003)(14444005)(256004)(8936002)(7696005)(66066001)(86362001)(54906003)(14454004)(6916009)(316002)(53936002)(229853002)(55016002)(478600001)(33656002)(5660300002)(74316002)(486006)(6436002)(476003)(446003)(66476007)(52536014)(4001150100001)(76116006)(99286004)(305945005)(9686003)(66946007)(66446008)(64756008)(66556008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5925;
 H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2LFVa06Zgm4S2FPAPUwTk5TjeeGpsMxmBhhReyAlyNoNkETS7wf2UGNcXCBz67ewm9TQejUsMmSaguUixUWKDR1rlWdovOSL7l4nzeyKFCX1YSIEYVH7Ll07upfjNb4Akmx/6VAtrQrg06C+hKs5+AGd8hw4iAkCNz91cHOA6+ax3GXLrj8wMgYlP6yJHBGTtfvkdNWcYb/IGxzqScfbelI20tM49RVsIgGbeOcDZYwH/xRvHR2tiH5uyltqzwkT7qVsAeMZ5f06RMH61MXlvbcsC9trczw4LIUiMUA40PZsR8dZZzyTudWlDk5diu7esJODPXUwtLov1zFJlUy5KLsbSYtoh30186pUgL5cNzCPEppnFUWcs3i0NQjyJtPtfXFjeHsPGkZlzEkk+Dp2y/jDAoJ0UiKR2260IEyTOps=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46518867-4c86-46aa-8ae3-08d729b9c2d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 00:10:10.8801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L9K3Of3EI7UbvGDHGiFKxvC+AjMu/bpUwVdTSnQLilaMdTh2YMnHxaG0On77XUDAWgbrOKoJuu9y0HLCnfOFkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5925
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
X-Headers-End: 1i22aQ-00FDpL-Pe
Subject: Re: [f2fs-dev] [PATCH v2 0/4] fsck: Check write pointers of zoned
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Chao,

On 2019/08/23 22:09, Chao Yu wrote:
> Hi Damien,
> 
> Do you have time to take a look at this patch set, and add a reviewed-by if it
> is okay to you. :)

My apologies for not chiming in earlier. Shinichiro works in my group and I
asked him to work on this. We have gone through several iterations internally
and this is the latest version.

So:

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> 
> Thanks,
> 
> On 2019-8-21 12:47, Shin'ichiro Kawasaki wrote:
>> On sudden f2fs shutdown, zoned block device status and f2fs meta data can be
>> inconsistent. When f2fs shutdown happens during write operations, write pointers
>> on the device go forward but the f2fs meta data does not reflect write pointer
>> progress. This inconsistency will eventually cause "Unaligned write command"
>> error when restarting write operation after the next mount. This error can be
>> observed with xfstests test case generic/388, which enforces sudden shutdown
>> during write operation and checks the file system recovery. Once the error
>> happens because of the inconsistency, the file system requires fix. However,
>> fsck.f2fs does not have a feature to check and fix it.
>>
>> This patch series adds a new feature to fsck.f2fs to check and fix the
>> inconsistency. First and second patches add two functions which helps fsck to
>> call report zone and reset zone commands to zoned block devices. Third patch
>> checks write pointers of zones that current segments recorded in meta data point
>> to. This covers the failure symptom observed with xfstests. The last patch
>> checks write pointers of zones that current segments do not point to, which
>> covers a potential failure scenario.
>>
>> This patch series depends on other patches for zoned block devices, then it
>> conflicts with the master branch in f2fs-tools.git as of Aug/19/2019. It can be
>> applied without conflict to dev and dev-test branch tips.
>>
>> Changes from v1:
>> * Fixed build failure on dev branch
>>
>> Shin'ichiro Kawasaki (4):
>>   libf2fs_zoned: Introduce f2fs_report_zones() helper function
>>   libf2fs_zoned: Introduce f2fs_reset_zone() function
>>   fsck.f2fs: Check write pointer consistency with current segments
>>   fsck.f2fs: Check write pointer consistency with valid blocks count
>>
>>  fsck/fsck.c         | 161 ++++++++++++++++++++++++++++++++++++++++++++
>>  fsck/fsck.h         |   3 +
>>  fsck/main.c         |   2 +
>>  include/f2fs_fs.h   |   3 +
>>  lib/libf2fs_zoned.c |  81 ++++++++++++++++++++++
>>  5 files changed, 250 insertions(+)
>>
> 


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
