Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E05BD97E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Sep 2019 10:06:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iD2JM-0007yx-IW; Wed, 25 Sep 2019 08:06:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=1646af0c7=shinichiro.kawasaki@wdc.com>)
 id 1iD2JK-0007yo-UO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Sep 2019 08:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M5L9ghx/IMlvn+5FkKUVJifVr8AO01NhJvntRPxWRGE=; b=dvD/7o+4cmZV/Q/MzQ9VWIyJ5w
 8euzvmat3cPuQPd2y3g6MAraKfxdYr6WlPImAE1/BU6O5tUXSUUjDiHmhvK8bpdcKHuz/pDlrzCH9
 iEwvn9cb254JOLUoxSH4xhQD3dy1vB4QdwMHpB1uSb6o1/pv18LovkHaCBv/UIjsjnWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M5L9ghx/IMlvn+5FkKUVJifVr8AO01NhJvntRPxWRGE=; b=ETvIByKRqIUFWniMBvVzbPqUQa
 Ww0wx3GnQpUGcyMud4EMZaWxpXKUnndX+hSU1ziCiDd3QXmfWLpvJwcD5lT6aOGFffuPmlMkgQRib
 beb4Gtlpa+93rmEgNw33FTTbninggJ41O+UaqKes4sGVup/12MOdABSZA0SgRLTAasrY=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iD2JH-0067dz-9H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Sep 2019 08:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1569398764; x=1600934764;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=M5L9ghx/IMlvn+5FkKUVJifVr8AO01NhJvntRPxWRGE=;
 b=LjR6EGJtcqvki+njgepGFwDgcvABRxFLJGdFbDLvnCHwYw/CHD9CvN4G
 f15cctuiG3sA/qzVHW0kuwW4jUZ/xIMQ4G6yj07fmenNoH94SdZoU8wSO
 wLSqWhSkE//l7aEskrlFlLtZNXKndq7N7zshv/sD41bQHYYw/iV4gjpEr
 dq22Xu7V+g/aSblUDO9BhSdV66vs4bhasZTuSic0lWDNJGUxgREQjXOCC
 gqHvZee0fc2dMrEQtYtwcO74jWCsKSiQprJ3UBcQPaIsIv740Xy7DkUFa
 0P5dmJ3iS6qOAPh4I2A5aozc9XqHYoX3DoV1WHc3xCSVC0YGPadDZ7Hfo Q==;
IronPort-SDR: 4SyU0azXdaFHbLJXWeMYdTnqNMcsOtsIBmrHbYg+3y6VapWUn6eMrotr1m/lYDd/nnUiDSNK9t
 2JBBGYICjF4Vwcs25rkw0BYYwzAnEPD9awdwp+0y8kwgRO1k2jLDfefGqlODM2ng+7/npNQqMk
 eH2pDJRNnzRaJO04IRoAd6wbpbGyL09PJOKuwQYGAZMMWyDk4vpWRmQrMdW+hdsfEDfQE7dZr0
 F5dG7odMzC4pEctdoTCZkLK2byOwajacn4PjJ0Nc9wFFAnVXxgELcmkDvljl9jbBuGmbeCb3JX
 M5k=
X-IronPort-AV: E=Sophos;i="5.64,547,1559491200"; d="scan'208";a="123503498"
Received: from mail-co1nam04lp2051.outbound.protection.outlook.com (HELO
 NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.51])
 by ob1.hgst.iphmx.com with ESMTP; 25 Sep 2019 16:05:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BusPoEFZ50JqkOV97BrDPz5liH8HgOUhZiN2RO0Th1wy4rkfpfgRUHqCAXTFdewlmAEWXnSTH1RhYZR1Xxwm2f3qKwQQJLvYiO9KDYzx5IBlhMD6vAw0/kZSeevr3Z/AYI+d8gdw54RI4VuJE1NPmgHrb63vIPtwD2/3un2pCZoEEF368hBzGq2jQy9TyKVCflYwfgCV+gSK+sq4Y4PsxE++tKul+Rnr01XF2/GRSAp0VKpQuW/QT8qzI5g3UL1aihMSwXoecYhRQY5mPDlRNmZ2kszz2ziOhMM70bQc4bqnQu4rpRQvBJNZKGkwc4IS2NyWoa2bFz/zMwuPOBG+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5L9ghx/IMlvn+5FkKUVJifVr8AO01NhJvntRPxWRGE=;
 b=M6lCSvZqibIBNJiUYGNV8h4ZwUbuETlGy3fTsErRHvBs9CTxvNL/T+2XAHRnIlhHzNYV23XaQQxkaY9Lsqg6iIqBH4ktSlrcewl3eRn5xGN79pLaW1T1DliQAXhRaw1WyJzG9+ZMcfcFBsEvAWgO6gJ7h6qzNL2ppdfsGiL4TaiPXGSdcUpCIABpuE6rRF0TptO1omDsS+t9rcJa/dfkuGNZ6x61nyyDAjSRUp54CwiAbsZkBjhSib3xQ5+1FXLJI3QXOejot7ozG2JUflWIlWyfmnMSk+Y+rinEmbZSKwWRw/0I3OK+fcq5kFI33EtaaeKAJICIpBRA2LCpNh+0gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5L9ghx/IMlvn+5FkKUVJifVr8AO01NhJvntRPxWRGE=;
 b=mLlCPAiXa/OIeW9iNrfWwR6+nboHg15SCPgodA72zz5KyAfelNl/3TqzwhLo6l+o+j//6sA9huSXe7WZrmh3gQrwMYeag0MIUxAJZBQHXl+AaKqf+iy0FxHyeujIX04m3HEEI+/rid04gFEq4Lyg6zQqHs00+hHEw06hhEuLIAo=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2217.namprd04.prod.outlook.com (10.166.205.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 08:05:46 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::88:72f2:2211:6b8b%8]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 08:05:46 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] fsck.f2fs: Check write pointer consistency with
 current segments
Thread-Index: AQHVXxx1rSkyH6+CAkmLT6J96mLmOKcX+ocAgAGsxgCAAzt6gIABeeMAgAShnQCAAaHUAIAAEWmAgAMVGwCABdmggIADPdwAgAUlWoCABi5hAA==
Date: Wed, 25 Sep 2019 08:05:46 +0000
Message-ID: <20190925080544.ldxsmx7zf4dtbqmz@shindev.dhcp.fujisawa.hgst.com>
References: <20190903083704.kmc5bwfdpeinzfle@shindev>
 <7e13140d-f031-9eda-3544-747f80880df9@huawei.com>
 <20190906083114.jmjzczqzp4m3kxex@shindev>
 <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
 <20190910081010.uwubhhwenuex7vhx@shindev.dhcp.fujisawa.hgst.com>
 <45f1d3e8-ae50-879f-3cfc-2e6786afb28f@huawei.com>
 <20190912081648.wq2wi447hpold4t6@shindev.dhcp.fujisawa.hgst.com>
 <dd935f8f-276e-fa7b-e202-2a8722be60e0@huawei.com>
 <20190918030712.hko3pjm65glncqap@shindev.dhcp.fujisawa.hgst.com>
 <6b6552a0-333b-872b-37b8-67e6bf0c1311@huawei.com>
In-Reply-To: <6b6552a0-333b-872b-37b8-67e6bf0c1311@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25d197a9-3d7b-4dd7-7d7f-08d7418f2bd3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY1PR04MB2217; 
x-ms-traffictypediagnostic: CY1PR04MB2217:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2217C771C3BAC7335C8E099DED870@CY1PR04MB2217.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(51914003)(189003)(199004)(44832011)(316002)(91956017)(6436002)(7736002)(6916009)(71200400001)(8676002)(256004)(76116006)(64756008)(25786009)(66946007)(476003)(305945005)(1076003)(14454004)(66446008)(5660300002)(71190400001)(66556008)(81156014)(14444005)(86362001)(478600001)(66476007)(11346002)(81166006)(26005)(58126008)(8936002)(229853002)(6116002)(186003)(6512007)(53546011)(6506007)(9686003)(54906003)(3846002)(4326008)(6246003)(102836004)(76176011)(66066001)(99286004)(486006)(446003)(2906002)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2217;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aSERms39SX6xe2XL+OFLPdlTunqhDfLMOotgen8FuaUfHPALYjv7skcINCf8XmgQuacH9U3cEEVMpoH3SrZETAxBGZIRb5R/tQ3/uwFwQOPsioHldZ78JjhTIJXdTrUJXd/gLnA+TB3PkAGepFyWOOP2/DH1TZXU93DCXDte7erspoo7JPPWFZAQXEXuSmDbPBNYyPiYrn7dWFSm/S/zHvBNGCmhxOwCPGjaN08hx8/LAihpSRZppbx7N4KGJRyd6jWi8G9xZGXTKWlB1e+RtBYxFQtzxM0bO/qeDm4K0EQ8V9iTml0Z/EBwcRLsWcVmTY5pmwntK4LjXKjOPmz2ja0g9fGklgp76F9762AGxThLqy/OArRG5yUAx8T1GGbnX9OwaodzFbQMvNkwBavHk7zMPWz5M5H5UsgKTQzxu2c=
Content-ID: <5C56984A9B67A743821004E89BC0B9E2@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d197a9-3d7b-4dd7-7d7f-08d7418f2bd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 08:05:46.5964 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIEFbVUgn1SbcBf8utZUykIhasho31XNnqiYkkB3I6OWSJdTnwxIZj7h+i8q0WCzW/3KV18c0s+Wok6LwnlE3mJL7GiH6OIIO0YuuHbkQQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2217
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
X-Headers-End: 1iD2JH-0067dz-9H
Subject: Re: [f2fs-dev] [PATCH v4 2/2] fsck.f2fs: Check write pointer
 consistency with current segments
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sep 21, 2019 / 17:42, Chao Yu wrote:
> On 2019/9/18 11:07, Shinichiro Kawasaki wrote:
> > Thanks for the comments. I read f2fs code further, and think still the
> > SIT vs write pointer check can be implemented and meaningful.
> > 
> > F2fs ensures consistency of SIT using two CP areas, two SIT areas and
> > sit_bitmap in CP. These metadata are in the conventional zone that not
> > affected by write pointer control logic. My current scope is to ensure
> > write pointer control logic correctness for zoned block device. From this
> > scope and the f2fs SIT consistency feature, I would like to assume that
> > SIT entries built in kernel after f2fs mount is correct for the write
> > pointer position check.
> 
> SIT may be broken due to software bug or hardware flaw, we'd better not consider
> it as a consistent metadata.

I see. I found that kernel checks SIT valid blocks with check_block_count()
function, and if mismatch happens it requests fsck. I guess SIT consistency is
not ensured during kernel run, but after fsck run. Is this correct? If so, I
think the write pointer consistency check with SIT valid block bitmaps should
not be done by kernel, but by fsck after SIT rewrite.

As for non-open zones (curseg do not point to), the other check is needed: if
the zone does not have valid blocks and fsync data, need to reset its write
pointer. My understanding is that the valid blocks count comes from SIT. Then
this fix also should be done not by kernel but by fsck after SIT rewrite. I
think kernel just should do this check at mount time to avoid unaligned write
error, and if inconsistency found it should request fsck to recheck and fix.

I assume kernel can check and fix write pointer inconsistency with cursegs in
CP. CP (and SB) have checksum guard and their consistency looks ensured during
kernel run.

> 
> > 
> > Fsck does additional SIT consistency check in fsck_chk_meta(). It would be
> > good to do the write pointer position check at the end of fsck_chk_meta().
> 
> SIT can be changed later? e.g. SIT bitmap says one block address is valid,
> however fsck found there is no entry can link to it, then it needs to be
> deleted? it may affect write_pointer repair, right?
> 
> So we'd better look into all SIT update cases in fsck.

Ah, yes, when fsck updates SIT, write pointer consistency check should be done
after that. I found SIT is rewritten at the end of fsck_verify() by
rewrite_sit_area_bitmap() and fix_curseg_info() calls. I guess write pointer
consistency check with SIT (and write pointer reset if required) should be
done after those function calls to reflect all SIT changes by fsck. I'll try
to create a patch with this approach.

Thanks again for your comments!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
