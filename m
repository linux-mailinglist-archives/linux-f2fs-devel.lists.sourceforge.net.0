Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E79DBDE8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2019 08:56:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLMBB-0006Xl-72; Fri, 18 Oct 2019 06:56:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=187ff726d=shinichiro.kawasaki@wdc.com>)
 id 1iLMB9-0006Xa-SY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PF5gAAeSDTEFdaqAG6PS1JgmspQqTZc1Pk5FRaxGHfU=; b=UlOqV2H16+3Iy03IMQEAbiBFYQ
 zMD6uFhGwYfQqkdvsiiR9KGbTk4gXi49LHB/CePD/yTngyha2Fm3qYC7UCHGevCDSZs+lBNihknLs
 JNYGeg883hlEDIk3KGycbLrHJPqJ3knY1cFWnhYmMH+HbDEmPj+63lv8YV4omIecbRro=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PF5gAAeSDTEFdaqAG6PS1JgmspQqTZc1Pk5FRaxGHfU=; b=kasfhvKjAR/kKkrGMIXBvufU74
 vWRiG+SImvIul3ijxMzqhDpeEYICc2wqvscHrsv8nQ5FI14o45brz8onJzrfwnK1bPsmdT9WNT7L/
 cnXVHptXgiiAoXMsTZSYo/xmbM5+tayQjY+1sMUN2wCdt9L76Qz+D7OdxtPBnCSE0NTc=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLMB6-00DD0y-6i
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 06:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1571381760; x=1602917760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=x1lo/2PXzJSWUC6pvhIps/0VGS+pWQX6C7S6KzNVu7w=;
 b=TQ6u1auC7Khr27+qCaAD6suxqsMdgnMEVfCd/crq6ND1WJ0j53WvOsJe
 7tnZuMLPjyHvsp3eEHDtTg9CZIB800CJYzIJwZWHcruPTj4Cj0+pzJ+10
 WVs2miHkFlzzgfQ3HNRaA/YAiwBVJe92ZVe9AXsKyLdPhUMFCIswL3B03
 PDyJIlHYoE6QRuV5XJznhyQhElw1V1Q+uZslJ/WhqD+fHxpxqrn8z0EbE
 39Y2JAqYZuOymdnTRWCHLcPv/FuK7kewcfBQhL0oh/8BqvFKIj6q0ipyV
 q1kX2DwbvgMZXRzUKcv73FYbOQ45qKcWqX8puTpHleTRID768qyi379Xb g==;
IronPort-SDR: jgZBdil3FM+MFcd5H7EWpS+r80JuPu+/VnS4a9eWkF+Cnkxzf/KefGtclyTfj4nr792IOXgUVt
 1IocfNZi6z0ztYVsdWuvcRsej4hNGUYQCTTGPnvMmLSKwjH90En79nSqFW+qhPOmTz3YbuZrnR
 /2+s5Tz8tj1dvQGcODi3E8CzZUshSfaGKyvzMTX/h5+IH1U0Hnz2h2BPEL/RsyeFOXSjUP74V1
 uaO9uZrlEmyK/0VGTgbP03urCQrjC9cwfHaCfgDLRScvazt8fQaLwTNBEV2I/qgOpAaxxqaDEB
 Sf0=
X-IronPort-AV: E=Sophos;i="5.67,310,1566835200"; d="scan'208";a="121586919"
Received: from mail-co1nam05lp2051.outbound.protection.outlook.com (HELO
 NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.51])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2019 14:55:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFQ3PePaEbcf43Wc/LAqFBmJN2NxssKiHnDZUzucm2Rg0Ea4j9um+90NEmi1YBaVK5qlmFeCGZTHSH0sDtufb3ESc+LZDQ7hQPgpA3D2zmSivleQaxSOH50x56xt5+NQEbZPzMxa1nKupGZ6Nl+4zxeSgEHdWOlqzwn4ywJbU7/j444ZJMgy4HeRJzl+fzsC1WQQJGbQQ5Eg4/BeTIuD2P0kK6DLq7GHpC+zU9yODXD5XGoZ1XHkTDXOpFjuklk+STN7vPtjxG6hm6XYZTmgo8gjhDkL5fxognNxXk9EGPWYsEnVZxMz/4ye4L6Gow3RYUC38nKfjapJWp2Zkp3l9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF5gAAeSDTEFdaqAG6PS1JgmspQqTZc1Pk5FRaxGHfU=;
 b=P9rHkA1dosTTFKhz5AZev9kw1Ik2NZzNFbfU6uFsxWrsdH/VuapI+47Qq2yY9LpO06p7sfJIj8Fic7n+XaWIpuba8ed/iiNnNlqU6TnHSC3ZtlgBwtb9vjCUIaF1NHx3g5LOpRecBHP6XTfm8UHl6wUNBuH9vbvo1mztLCWatRE2ZkIl/Ah0YdHErxE9nxogEuNnAp2EIeN3SxWkifD/onNlOLuGXD1ieXSVsjllP8Vu25Dm9BODn6jAKZpMVjW75m5NtcWNcSqV0Ly3aHfqph0D7GGPf2RW/k1tBIOnZG6UiPznoykWvQpLle82VcXUDRDXO43iUYnKe+iajsZejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PF5gAAeSDTEFdaqAG6PS1JgmspQqTZc1Pk5FRaxGHfU=;
 b=GPwgpjG688st9/H+k7YOzrzw0yAwV3mP6QWcT4UCl2EL1YQ5ot6Edyb0LYNHMtaoPxj5ZdnO4iuG63tig+MyLtNOnGxVZCJ8k/5kJxrIo6z6vT6ss7dK+n4F6+dFmFYQdbG5/OVs+WdV5z4gC27uEHjT/0msu8ndJKbJY2iWQDY=
Received: from CY1PR04MB2268.namprd04.prod.outlook.com (10.167.10.135) by
 CY1PR04MB2236.namprd04.prod.outlook.com (10.167.8.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 06:55:48 +0000
Received: from CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7]) by CY1PR04MB2268.namprd04.prod.outlook.com
 ([fe80::353a:c2f5:de72:cc7%9]) with mapi id 15.20.2347.024; Fri, 18 Oct 2019
 06:55:48 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Chao Yu <yuchao0@huawei.com>
Thread-Topic: [PATCH v4 2/2] fsck.f2fs: Check write pointer consistency with
 current segments
Thread-Index: AQHVXxx1rSkyH6+CAkmLT6J96mLmOKcX+ocAgAGsxgCAAzt6gIABeeMAgAShnQCAAaHUAIAAEWmAgAMVGwCABdmggIADPdwAgAUlWoCABi5hAIAF5bWAgATvRoCAGT0WgA==
Date: Fri, 18 Oct 2019 06:55:48 +0000
Message-ID: <20191018065545.kuvk2ev4r6fn4orz@shindev.dhcp.fujisawa.hgst.com>
References: <e209cee9-2d91-e15a-0d30-4b388d463f08@huawei.com>
 <20190910081010.uwubhhwenuex7vhx@shindev.dhcp.fujisawa.hgst.com>
 <45f1d3e8-ae50-879f-3cfc-2e6786afb28f@huawei.com>
 <20190912081648.wq2wi447hpold4t6@shindev.dhcp.fujisawa.hgst.com>
 <dd935f8f-276e-fa7b-e202-2a8722be60e0@huawei.com>
 <20190918030712.hko3pjm65glncqap@shindev.dhcp.fujisawa.hgst.com>
 <6b6552a0-333b-872b-37b8-67e6bf0c1311@huawei.com>
 <20190925080544.ldxsmx7zf4dtbqmz@shindev.dhcp.fujisawa.hgst.com>
 <d0bb79bd-54bd-a7b6-68e7-28de364f2162@huawei.com>
 <20191002053037.gvojukgvg63yziq3@shindev.dhcp.fujisawa.hgst.com>
In-Reply-To: <20191002053037.gvojukgvg63yziq3@shindev.dhcp.fujisawa.hgst.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shinichiro.kawasaki@wdc.com; 
x-originating-ip: [199.255.47.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4e028d5-2c65-4e5a-7d7a-08d7539834ff
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY1PR04MB2236:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY1PR04MB2236B81C3D8522ECB69AE826ED6C0@CY1PR04MB2236.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(189003)(199004)(102836004)(44832011)(26005)(11346002)(486006)(476003)(1076003)(186003)(5660300002)(2906002)(446003)(71190400001)(71200400001)(478600001)(81166006)(8936002)(7736002)(6916009)(14454004)(256004)(305945005)(14444005)(8676002)(81156014)(9686003)(6116002)(3846002)(6246003)(229853002)(76116006)(4326008)(58126008)(64756008)(66946007)(66556008)(66476007)(66446008)(6486002)(25786009)(99286004)(86362001)(54906003)(76176011)(66066001)(316002)(6436002)(91956017)(6512007)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR04MB2236;
 H:CY1PR04MB2268.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bmrK+pvu3eCYt6mzmWwvu/55yelYUgRqdIxy3BtwE94H0ILk1mcnRcXRtBbuwtISuxNTo2pr2BFqw9MI9H8loPcFUkBVo4sRTP9z0x8MahhulzMa/S3R8IlcHYe6ahnjJyVl4yi6f1MBqb1NX3HkdLi+8Y4D5uZsB4l1NS2YLFD2y9KeEqRL783QgxizErXxbWcTebLBr5/LCLwoY5G0gRCpFmEJxYcw3mC9rALRkNF5FyjsAsiJAZw0TR2tS38Io555vlPSGLWeqAH5L9NJQ+rkNxzAeR1gBRPskjlBnPVjBoUNCj4VBynQN9F3zkOnZR494E8bkMvDOlJ5ATTzgFMPqo86fWKMQOxItLLRGD5Pu8XkF9QAPlrasWfpHmMmUmJ8/zc9P8C2T6tA1tV/adkeiKyPDON7IqbKbHZQgSs=
Content-ID: <2C86354AEB288F439211DEDE32C89E3D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e028d5-2c65-4e5a-7d7a-08d7539834ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 06:55:48.4378 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYaRsWpnr6j2NjC7p04yIuxthfoS87BJkAkR0apuMofgZt/fO4KzDogE+X3QHp4WmU77uKVEFl3Je3VLpv+Ec1mXA1tTgbgfVeZHzLQ1000=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2236
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iLMB6-00DD0y-6i
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

On Oct 02, 2019 / 14:30, Shin'ichiro Kawasaki wrote:
> Now I'm preparing patches for fsck as well as kernel based on the valuable
> and detailed e-mail discussion between you and me. Here I summarize my

I have posted the two patch series to add write pointer consistency check,
based on the discussion on the list: one series for fsck (v5), the other for
kernel f2fs module. Review will be appreciated.

> take-aways through the discussion.
> 
> ---- F2FS write pointer consistency check and fix by fsck and kernel ----
> 
> A) Check write pointer consistency for open zones and non-open zones
> 
> A-1) For open zones (cursegs point to), check consistency between the cursegs
>      in CP and the write pointers. If the curseg is inconsistent with the write
>      pointer in the zone that curseg points to, keep the write pointer as is
>      and set new zone(=section) to the curseg.
> 
> A-2) For non-open zones (cursegs do not point to), check consistency between
>      SIT valid blocks bitmap and the write pointers.
>      A-2-i) if the zone does not have valid blocks and fsync data, reset the
>             write pointer.
>      A-2-ii) if the last valid block recorded in SIT valid blocks bit map is
>              beyond the write pointer, just report the inconsistency to notice
> 	     kernel bug. No fix is available for this error.
> 
> B-1) Implement A-1) check & fix feature in the kernel. Fsync data beyond
>      curseg's next_blkoff should be kept until fsync data recovery completion.
>      Fix write pointer consistency just before the check point trigger for fsync
>      data recovery.
> 
> B-2) Implement A-2) check feature in the kernel to avoid unaligned write error
>      to the zone. Do not implement fix feature in the kernel to avoid the risk
>      of SIT break. Just check and if check fails, ask users to run fsck.
> 
> C-1) Implement A-1) check & fix feature in fsck. Do check and fix twice, at the
>      beginning of the fsck to avoid write error during fsck and at the end of
>      fsck to ensure consistency with updates by fsck.
>      In case fsync data is left after the curseg position, do not fix the
>      inconsistency by fsck. Leave it so that kernel can recover it later.
> 
> C-2) Add check fix feature A-2) to fsck. Do check and fix twice in same manner
>      as C-1).
> 
> --------------------------------------------------------------------------
> 
> Once the patches get ready, your review will be appreciated. Thanks!

--
Best Regards,
Shin'ichiro Kawasaki

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
